------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.  Give me all of the Observations for a particular Variable measured at a specific Site using a particular Method and having a specific QualityControlLevel.
------------------------------------------------------------------------------------------------------------------------------------------------------------
SET STATISTICS TIME ON
USE LittleBearRiverODM;
SELECT * 
FROM DataValues 
WHERE SiteID = 1 AND VariableID = 36 AND MethodID = 18 AND QualityControlLevelID = 0
ORDER BY LocalDateTime;


USE ODM2;
SELECT *
FROM ODM2Results.ResultValues rv
JOIN ODM2Core.Results r
	ON rv.ResultID = r.ResultID
JOIN ODM2Core.FeatureActionResult far
	ON r.ResultID = far.ResultID
JOIN ODM2Core.Actions a
	ON far.ActionID = a.ActionID
JOIN ODM2SamplingFeatures.Sites s
	ON far.SamplingFeatureID = s.SamplingFeatureID
WHERE s.SamplingFeatureID = 1 AND r.VariableID = 36 AND r.QualityControlLevelID = 0 AND a.MethodID = 18
ORDER BY ValueDateTime;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.  Same as 1, but subset the Observations and return only those Observations between a BeginDateTime and EndDateTime.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT * 
FROM DataValues 
WHERE SiteID = 1 AND VariableID = 36 AND MethodID = 18 AND QualityControlLevelID = 0 AND LocalDateTime >= '9/1/2007' AND LocalDateTime < '9/2/2007'
ORDER BY LocalDateTime;


USE ODM2;
SELECT *
FROM ODM2Results.ResultValues rv
JOIN ODM2Core.Results r
	ON rv.ResultID = r.ResultID
JOIN ODM2Core.FeatureActionResult far
	ON r.ResultID = far.ResultID
JOIN ODM2Core.Actions a
	ON far.ActionID = a.ActionID
JOIN ODM2SamplingFeatures.Sites s
	ON far.SamplingFeatureID = s.SamplingFeatureID
WHERE s.SamplingFeatureID = 1 AND r.VariableID = 36 AND r.QualityControlLevelID = 0 AND a.MethodID = 18 AND ValueDateTime >= '9/1/2007' AND ValueDateTime < '9/2/2007'
ORDER BY ValueDateTime;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--3.  Give me a list of Sites where a particular Variable has been measured.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT SiteCode, SiteName 
FROM Sites s
JOIN DataValues dv
	ON dv.SiteID = s.SiteID
JOIN Variables v
	ON dv.VariableID = v.VariableID 
WHERE v.VariableID = 65;


--For ODM2, I have to check both the Site SamplingFeature AND any children SamplingFeatures
--To test this for sample based data, use VariableID = 65
USE ODM2;
SELECT SiteCode, SiteName
FROM ODM2SamplingFeatures.Sites s
WHERE s.SamplingFeatureID IN (
	SELECT DISTINCT far.SamplingFeatureID
	FROM ODM2Core.FeatureActionResult far, ODM2Core.Results r 
	WHERE r.VariableID = 65 AND r.ResultID = far.ResultID
) OR s.SamplingFeatureID IN (
	SELECT ParentFeatureID
	FROM ODM2SamplingFeatures.FeatureParents
	WHERE SamplingFeatureID IN (
		SELECT DISTINCT far.SamplingFeatureID
		FROM ODM2Core.FeatureActionResult far, ODM2Core.Results r 
		WHERE r.VariableID = 65 AND r.ResultID = far.ResultID
	)
);

------------------------------------------------------------------------------------------------------------------------------------------------------------
--4.  Give me a list of TimeSeries for a particular Variable.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--For ODM 1.1.1, this query would return "time series" from both sensors and samples.
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues WHERE VariableID = 6) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID;


--For ODM2, this returns only Results with type "Time Series Coverage" that are associated directly with a sampling feature that is a site.
USE ODM2;
SELECT r.ResultID, far.SamplingFeatureID, s.SiteCode, s.SiteName, s.SiteTypeCV, r.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, r.UnitsID, 
	u.UnitsName, r.SampledMediumCV, v.ValueTypeCV, v.DataTypeCV, a.MethodID, m.MethodName, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition
FROM ODM2Core.Results r, ODM2Core.Variables v, ODM2Core.FeatureActionResult far, ODM2Core.Methods m, ODM2SamplingFeatures.Sites s,
	ODM2Core.Units u, ODM2Core.Actions a, ODM2Core.QualityControlLevels qc
WHERE r.VariableID = 6 AND r.ResultTypeCV = 'Time Series Coverage' AND v.VariableID = r.VariableID AND a.ActionID = far.ActionID 
	AND m.MethodID = a.MethodID AND u.UnitsID = r.UnitsID AND s.SamplingFeatureID = far.SamplingFeatureID AND r.ResultID = far.ResultID
	AND qc.QualityControlLevelID = r.QualityControlLevelID AND (far.SamplingFeatureID IN (
		SELECT fp.SamplingFeatureID 
		FROM ODM2SamplingFeatures.FeatureParents fp, ODM2SamplingFeatures.Sites s
		WHERE s.SamplingFeatureID = fp.ParentFeatureID
	) OR far.SamplingFeatureID IN (
		SELECT SamplingFeatureID
		FROM ODM2SamplingFeatures.Sites
	)
);

------------------------------------------------------------------------------------------------------------------------------------------------------------
--5.  Give me a list of Sites for which there are data.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT SiteCode, SiteName
FROM Sites s
JOIN DataValues dv
	ON dv.SiteID = s.SiteID;


--For ODM2, must check SamplingFeatures that are Sites but also add Sites that have Specimens that were collected at the Site
USE ODM2;
SELECT SiteCode, SiteName
FROM ODM2SamplingFeatures.Sites s
WHERE s.SamplingFeatureID IN (
	SELECT DISTINCT far.SamplingFeatureID
	FROM ODM2Core.FeatureActionResult far 
	WHERE far.ResultID IS NOT NULL
) OR s.SamplingFeatureID IN (
	SELECT ParentFeatureID
	FROM ODM2SamplingFeatures.FeatureParents
	WHERE SamplingFeatureID IN (
		SELECT DISTINCT far.SamplingFeatureID
		FROM ODM2Core.FeatureActionResult far
		WHERE far.ResultID IS NOT NULL 
	)
);
	
------------------------------------------------------------------------------------------------------------------------------------------------------------
--6.  Give me a list of Variables for which there are data.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT v.VariableCode, v.VariableName
FROM Variables v
JOIN DataValues dv
	ON dv.VariableID = v.VariableID
ORDER BY v.VariableName;


USE ODM2;
SELECT DISTINCT VariableCode, VariableNameCV 
FROM ODM2Core.Variables v
JOIN ODM2Core.Results r
	ON r.VariableID = v.VariableID
ORDER BY VariableNameCV; 	

------------------------------------------------------------------------------------------------------------------------------------------------------------
--7.  Give me a list of Methods for which there are data.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT m.MethodID, m.MethodDescription, m.MethodLink
FROM Methods m
JOIN DataValues dv
	ON dv.MethodID = m.MethodID
ORDER BY m.MethodID;


--For ODM2, this includes both Methods and LabMethods, whereas for ODM 1.1.1 it includes only Methods
USE ODM2;
SELECT DISTINCT m.MethodID, m.MethodCode, m.MethodName
FROM ODM2Core.Methods m
JOIN ODM2Core.Actions a
	ON a.MethodID = m.MethodID 
JOIN ODM2Core.FeatureActionResult far
	ON far.ActionID = a.ActionID
WHERE far.ResultID IS NOT NULL
ORDER BY MethodID;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--8.  Give me a list of Variables that have been measured at a particular Site.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, v.VariableID, v.VariableCode, v.VariableName
FROM Sites s, Variables v, DataValues dv
WHERE s.SiteID = dv.SiteID AND dv.VariableID = v.VariableID AND s.SiteID = 1
ORDER BY VariableID;

--A little differnt way, but same result
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, v.VariableID, v.VariableCode, v.VariableName
FROM Sites s, Variables v, (SELECT * FROM DataValues WHERE SiteID = 1) dv
WHERE dv.VariableID = v.VariableID AND s.SiteID = dv.SiteID
ORDER BY VariableID;


--For ODM2 I have to include Results occurring at the Site + Results occurring on Specimens collected at the Site
--First I have to get the set of SamplingFeatures associated with the Site (including the Site and any child SamplingFeatures and then do the query)
--This is tricky, and I kind of fudged it using SQL Variables
USE ODM2;
DECLARE @SamplingFeatureID AS int;
SELECT @SamplingFeatureID = 1;
DECLARE @SiteCode AS varchar(50);
SELECT @SiteCode = SiteCode FROM ODM2SamplingFeatures.Sites WHERE SamplingFeatureID = 1
DECLARE @SiteName AS varchar(255);
SELECT @SiteName = SiteName FROM ODM2SamplingFeatures.Sites WHERE SamplingFeatureID = 1
SELECT DISTINCT @SamplingFeatureID AS SamplingFeatureID, @SiteCode AS SiteCode, @SiteName AS SiteName, v.VariableID, v.VariableCode, v.VariableNameCV
FROM ODM2Core.Variables v, ODM2Core.Results r, ODM2Core.FeatureActionResult far
WHERE r.VariableID = v.VariableID AND far.ResultID = r.ResultID 
	AND (far.SamplingFeatureID IN (
		SELECT SamplingFeatureID 
		FROM ODM2SamplingFeatures.FeatureParents
		WHERE ParentFeatureID = @SamplingFeatureID
	) OR far.SamplingFeatureID = @SamplingFeatureID)
ORDER BY VariableID; 

------------------------------------------------------------------------------------------------------------------------------------------------------------
--9.  Give me a list of "TimeSeries" that have been measured for a particular Variable at a particular Site.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--For ODM 1.1.1, this query would return "time series" from both sensors and samples.
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues WHERE VariableID = 6 AND SiteID = 1) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID;


--For ODM2 this returns Results with type "Time Series Coverage" that are associated directly with a SamplingFeature that is a Site or any SamplingFeatures
--that are children of the Site
USE ODM2;
DECLARE @SamplingFeatureID AS int;
SELECT @SamplingFeatureID = 1;
DECLARE @VariableID AS int;
SELECT @VariableID = 6;
SELECT r.ResultID, s.SamplingFeatureID, s.SiteCode, s.SiteName, s.SiteTypeCV, v.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, u.UnitsID, 
	u.UnitsName, r.SampledMediumCV, v.ValueTypeCV, v.DataTypeCV, m.MethodID, m.MethodName, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition
FROM ODM2Core.Results r, ODM2Core.Variables v, ODM2Core.Actions a, ODM2Core.Methods m, ODM2Core.FeatureActionResult far, ODM2SamplingFeatures.Sites s,
	ODM2Core.Units u, ODM2Core.QualityControlLevels qc
WHERE v.VariableID = @VariableID AND r.ResultTypeCV = 'Time Series Coverage' AND v.VariableID = r.VariableID AND a.ActionID = far.ActionID 
	AND m.MethodID = a.MethodID AND u.UnitsID = r.UnitsID AND s.SamplingFeatureID = far.SamplingFeatureID AND r.ResultID = far.ResultID
	AND r.QualityControlLevelID = qc.QualityControlLevelID AND (far.SamplingFeatureID IN (
		SELECT SamplingFeatureID 
		FROM ODM2SamplingFeatures.FeatureParents
		WHERE ParentFeatureID = @SamplingFeatureID
	) OR far.SamplingFeatureID = @SamplingFeatureID);
	
------------------------------------------------------------------------------------------------------------------------------------------------------------
--10.  Give me a list of Methods that have been used to measure or create results for a particular Variable.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
DECLARE @VariableID AS int;
SELECT @VariableID = 36
SELECT DISTINCT m.MethodID, m.MethodDescription 
FROM Methods m, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues WHERE VariableID = @VariableID) AS sq 
WHERE m.MethodID = sq.MethodID
ORDER BY MethodID;


USE ODM2;
DECLARE @VariableID AS int;
SELECT @VariableID = 36
SELECT DISTINCT m.MethodID, m.MethodCode, m.MethodName, m.MethodDescription, m.MethodTypeCV 
FROM ODM2Core.Methods m, ODM2Core.Actions a, ODM2Core.Results r, ODM2Core.Variables v, ODM2Core.FeatureActionResult far
WHERE m.MethodID = a.MethodID AND a.ActionID = far.ActionID AND r.ResultID = far.ResultID AND r.VariableID = v.VariableID and v.VariableID = @VariableID
ORDER BY MethodID;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--11.  Give me a list of "TimeSeries" that have been measured by a particular Person
--NOTES:
--For ODM2 this is only going to include "Time Series Coverage" results associated directly with a 
--sampling feature that is a site and not "Measurement" Results
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID AND src.ContactName = 'Jeff Horsburgh'
ORDER BY SiteCode, VariableID;


USE ODM2;
SELECT r.ResultID, s.SamplingFeatureID, s.SiteCode, s.SiteName, s.SiteTypeCV, r.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, r.UnitsID, 
	u.UnitsName, r.SampledMediumCV,	v.ValueTypeCV, r.IntendedObservationSpacing, v.DataTypeCV, a.MethodID, m.MethodDescription, o.OrganizationCode, 
	o.OrganizationName, r.QualityControlLevelID, qc.QualityControlLevelCode, a.BeginDateTime, a.BeginDateTimeUTCOffset, a.EndDateTime, 
	a.EndDateTimeUTCOffset, r.ValueCount
FROM ODM2Core.Results r, ODM2SamplingFeatures.Sites s, ODM2Core.Variables v, ODM2Core.Units u, ODM2Core.Methods m, ODM2Core.Organizations o, 
	ODM2Core.QualityControlLevels qc, ODM2Core.Actions a, ODM2Core.ActionBy ab, ODM2Core.Affiliations af, ODM2Core.People p, ODM2Core.FeatureActionResult far
WHERE r.ResultID = far.ResultID AND a.ActionID = far.ActionID AND r.UnitsID = u.UnitsID AND r.VariableID = v.VariableID AND r.QualityControlLevelID = qc.QualityControlLevelID 
	AND far.SamplingFeatureID = s.SamplingFeatureID AND a.ActionID = ab.ActionID AND ab.AffiliationID = af.AffiliationID AND p.PersonID = af.PersonID 
	AND af.OrganizationID = o.OrganizationID AND a.MethodID = m.MethodID AND p.PersonFirstName = 'Jeff' AND p.PersonLastName = 'Horsburgh'
ORDER BY SiteCode, VariableID;
	
--NOTE:  These don't match up quite yet. Not sure why.

------------------------------------------------------------------------------------------------------------------------------------------------------------
--12.  Give me a list of TimeSeries that have been measured by a particular Organization.
--NOTES:
--For ODM2 this is only going to include "Time Series Coverage" results associated directly with a 
--sampling feature that is a site and not "Measurement" Results
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID AND src.SourceID = 1;


USE ODM2;
SELECT r.ResultID, s.SamplingFeatureID, s.SiteCode, s.SiteName, s.SiteTypeCV, r.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, r.UnitsID, 
	u.UnitsName, r.SampledMediumCV,	v.ValueTypeCV, r.IntendedObservationSpacing, v.DataTypeCV, a.MethodID, m.MethodDescription, o.OrganizationCode, 
	o.OrganizationName, r.QualityControlLevelID, qc.QualityControlLevelCode, a.BeginDateTime, a.BeginDateTimeUTCOffset, a.EndDateTime, 
	a.EndDateTimeUTCOffset, r.ValueCount
FROM ODM2Core.Results r, ODM2SamplingFeatures.Sites s, ODM2Core.Variables v, ODM2Core.Units u, ODM2Core.Methods m, ODM2Core.Organizations o, 
	ODM2Core.QualityControlLevels qc, ODM2Core.Actions a, ODM2Core.ActionBy ab, ODM2Core.Affiliations af, ODM2Core.People p, ODM2Core.FeatureActionResult far
WHERE r.ResultID = far.ResultID AND a.ActionID = far.ActionID AND r.UnitsID = u.UnitsID AND r.VariableID = v.VariableID AND r.QualityControlLevelID = qc.QualityControlLevelID 
	AND far.SamplingFeatureID = s.SamplingFeatureID AND a.ActionID = ab.ActionID AND ab.AffiliationID = af.AffiliationID AND p.PersonID = af.PersonID 
	AND af.OrganizationID = o.OrganizationID AND a.MethodID = m.MethodID AND o.OrganizationID = 1;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--13.  Give me a list of TimeSeries for a particular Site and QualityControlLevel
--NOTES:
--For ODM2 this is only going to include "Time Series Coverage" results and not "Measurement" Results
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues WHERE SiteID = 1 AND QualityControlLevelID = 1) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID;


--This query will only return the QualityControlLevelID = 1 Results having ResultType = 'Time Series Coverage' and collected at the selected site or any
--of the Site's child SamplingFeatures
USE ODM2;
DECLARE @SamplingFeatureID AS int;
SELECT @SamplingFeatureID = 1;
DECLARE @SiteCode AS varchar(50);
SELECT @SiteCode = SiteCode FROM ODM2SamplingFeatures.Sites WHERE SamplingFeatureID = @SamplingFeatureID;
DECLARE @SiteName AS varchar(255);
SELECT @SiteName = SiteName FROM ODM2SamplingFeatures.Sites WHERE SamplingFeatureID = @SamplingFeatureID;
DECLARE @SiteType AS varchar(255);
SELECT @SiteType = SiteTypeCV FROM ODM2SamplingFeatures.Sites WHERE SamplingFeatureID = @SamplingFeatureID;
DECLARE @QualityControlLevelID AS int;
SELECT @QualityControlLevelID = 1;
SELECT DISTINCT r.ResultID, @SamplingFeatureID AS SamplingFeatureID, @SiteCode AS SiteCode, @SiteName AS SiteName, @SiteType AS SiteType, v.VariableID, v.VariableCode, 
	v.VariableNameCV, v.SpeciationCV, u.UnitsID, u.UnitsName, r.SampledMediumCV, v.ValueTypeCV, v.DataTypeCV, m.MethodID, m.MethodName, m.MethodDescription
FROM ODM2Core.Results r, ODM2Core.Variables v, ODM2Core.Actions a, ODM2Core.Methods m, ODM2Core.SamplingFeatures sf, ODM2SamplingFeatures.Sites s,
	ODM2Core.Units u, ODM2Core.FeatureActionResult far
WHERE r.QualityControlLevelID = @QualityControlLevelID AND r.ResultTypeCV = 'Time Series Coverage' AND v.VariableID = r.VariableID AND a.ActionID = far.ActionID 
	AND r.ResultID = far.ResultID AND m.MethodID = a.MethodID AND u.UnitsID = r.UnitsID AND s.SamplingFeatureID = sf.SamplingFeatureID 
	AND (far.SamplingFeatureID IN (
		SELECT SamplingFeatureID 
		FROM ODM2SamplingFeatures.FeatureParents
		WHERE ParentFeatureID = @SamplingFeatureID
	) OR far.SamplingFeatureID = @SamplingFeatureID);

------------------------------------------------------------------------------------------------------------------------------------------------------------
--14.  Give me a list of Sites where Observations have been made for a particular Variable within a given SampleMedium.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName
FROM Sites s, (SELECT DISTINCT SiteID, VariableID FROM DataValues) AS sq, Variables v
WHERE s.SiteID = sq.SiteID AND v.VariableID = sq.VariableID AND v.VariableID = 65 AND v.SampleMedium = 'Surface Water'
ORDER BY SiteID;


--For ODM2, I have to check both the Site SamplingFeature AND any children SamplingFeatures
--Do this for a variable measured on specimens - e.g., VariableID = 65 and with a SampledMedium = "Surface Water"
USE ODM2;
DECLARE @VariableID AS int;
SELECT @VariableID = 65;
DECLARE @SampledMedium AS varchar(255);
SELECT @SampledMedium = 'Surface Water';
SELECT s.SamplingFeatureID, s.SiteCode, s.SiteName
FROM ODM2SamplingFeatures.Sites s
WHERE s.SamplingFeatureID IN (
	SELECT DISTINCT fp.ParentFeatureID  
	FROM ODM2SamplingFeatures.FeatureParents fp, ODM2SamplingFeatures.Sites s, ODM2Core.FeatureActionResult far, ODM2Core.Results R
	WHERE fp.ParentFeatureID = s.SamplingFeatureID AND fp.SamplingFeatureID = far.SamplingFeatureID AND far.ResultID = r.ResultID 
		AND r.VariableID = @VariableID AND r.SampledMediumCV = @SampledMedium
	) 
OR s.SamplingFeatureID IN (
	SELECT DISTINCT s.SamplingFeatureID
	FROM ODM2SamplingFeatures.Sites s, ODM2Core.FeatureActionResult far, ODM2Core.Results R
	WHERE s.SamplingFeatureID = far.SamplingFeatureID AND far.ResultID = r.ResultID AND r.VariableID = @VariableID AND r.SampledMediumCV = @SampledMedium
);

------------------------------------------------------------------------------------------------------------------------------------------------------------
--15.  Give me a list of Sites where there are at least n Observations of a particular Variable.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--16.  Give me a list of Sites where a particular Method has been used to measure a particular Variable.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--17.  Give me all of the metadata for a given Site.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--18.  Give me all of the metadata for a given Variable.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--19.  Give me the list of Observations made at a given Site.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--20.  Give me all of the Sites having data that fall within a given geographic bounding box.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--21.  Give me a list of all Observation Results (time series or otherwise) that fall within a geographic bounding box.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--22.  Give me time matched values for a set of Variables (e.g., dissolved oxygen and temperature) at a site.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--23.  Give me a list of Sites where there are Observations of a set of Variables (e.g., dissolved oxygen and temperature).
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--24.  Give me a list of Observations or Datasets measured by a particular person.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--25.  Give me a list of Annotations associated with a Site, or a Variable, or a Method, or an ObservationResult, or an individual DataValue.
------------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------------
--26.  Give me a list of Sites of a particular SiteType.
------------------------------------------------------------------------------------------------------------------------------------------------------------