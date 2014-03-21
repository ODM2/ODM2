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
SELECT ValueID, ValueDateTime, ValueDateTimeUTCOffset, DataValue, ValueXLocation, ValueYLocation, ValueZLocation, CensorCodeCV, QualityCodeCV, AggregationDuration, InterpolationTypeCV
FROM ODM2Results.ResultValues rv
JOIN ODM2Core.Results r
	ON rv.ResultID = r.ResultID
JOIN ODM2Core.Actions a
	ON r.ActionID = a.ActionID
JOIN ODM2Core.SamplingFeatures sf
	ON a.SamplingFeatureID = sf.SamplingFeatureID
JOIN ODM2SamplingFeatures.Sites s
	ON sf.SamplingFeatureID = s.SamplingFeatureID
WHERE s.SiteID = 1 AND r.VariableID = 36 AND r.QualityControlLevelID = 0 AND a.MethodID = 18
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
SELECT ValueID, ValueDateTime, ValueDateTimeUTCOffset, DataValue, ValueXLocation, ValueYLocation, ValueZLocation, CensorCodeCV, QualityCodeCV, AggregationDuration, InterpolationTypeCV
FROM ODM2Results.ResultValues rv
JOIN ODM2Core.Results r
	ON rv.ResultID = r.ResultID
JOIN ODM2Core.Actions a
	ON r.ActionID = a.ActionID
JOIN ODM2Core.SamplingFeatures sf
	ON a.SamplingFeatureID = sf.SamplingFeatureID
JOIN ODM2SamplingFeatures.Sites s
	ON sf.SamplingFeatureID = s.SamplingFeatureID
WHERE s.SiteID = 1 AND r.VariableID = 36 AND r.QualityControlLevelID = 0 AND a.MethodID = 18 AND ValueDateTime >= '9/1/2007' AND ValueDateTime < '9/2/2007'
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
	SELECT DISTINCT a.SamplingFeatureID
	FROM ODM2Core.Actions a, ODM2Core.Results r 
	WHERE r.VariableID = 65 AND r.ActionID = a.ActionID
) OR s.SamplingFeatureID IN (
	SELECT ParentFeatureID
	FROM ODM2SamplingFeatures.FeatureParents
	WHERE SamplingFeatureID IN (
		SELECT DISTINCT a.SamplingFeatureID
		FROM ODM2Core.Actions a, ODM2Core.Results r 
		WHERE r.VariableID = 65 AND r.ActionID = a.ActionID
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
SELECT r.ResultID, s.SiteID, s.SiteCode, s.SiteName, s.SiteTypeCV, v.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, u.UnitsID, 
	u.UnitsName, r.SampledMediumCV, v.ValueTypeCV, v.DataTypeCV, m.MethodID, m.MethodName, m.MethodDescription
FROM ODM2Core.Results r, ODM2Core.Variables v, ODM2Core.Actions a, ODM2Core.Methods m, ODM2Core.SamplingFeatures sf, ODM2SamplingFeatures.Sites s,
	ODM2Core.Units u
WHERE v.VariableID = 6 AND r.ResultTypeCV = 'Time Series Coverage' AND v.VariableID = r.VariableID AND a.ActionID = r.ActionID AND m.MethodID = a.MethodID AND u.UnitsID = r.UnitsID 
	AND sf.SamplingFeatureID = a.SamplingFeatureID AND s.SamplingFeatureID = sf.SamplingFeatureID AND (a.SamplingFeatureID IN (
		SELECT fp.SamplingFeatureID 
		FROM ODM2SamplingFeatures.FeatureParents fp, ODM2SamplingFeatures.Sites s
		WHERE s.SamplingFeatureID = fp.ParentFeatureID
	) OR a.SamplingFeatureID IN (
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
	SELECT DISTINCT a.SamplingFeatureID
	FROM ODM2Core.Actions a, ODM2Core.Results r 
	WHERE r.ActionID = a.ActionID
) OR s.SamplingFeatureID IN (
	SELECT ParentFeatureID
	FROM ODM2SamplingFeatures.FeatureParents
	WHERE SamplingFeatureID IN (
		SELECT DISTINCT a.SamplingFeatureID
		FROM ODM2Core.Actions a, ODM2Core.Results r 
		WHERE r.VariableID = 65 AND r.ActionID = a.ActionID
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
JOIN ODM2Core.Results r
	ON r.ActionID = a.ActionID
ORDER BY MethodID;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--8.  Give me a list of Variables that have been measured at a particular Site.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, v.VariableID, v.VariableCode, v.VariableName
FROM Sites s, Variables v, DataValues dv
WHERE s.SiteID = dv.SiteID AND dv.VariableID = v.VariableID AND s.SiteID = 1
ORDER BY VariableID;


--For ODM2 I have to include Actions occurring at the Site + Actions occurring on Specimens collected at the Site
--First I have to get the set of SamplingFeatures associated with the Site (including the Site and any child SamplingFeatures and then do the query)
USE ODM2;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, v.VariableID, v.VariableCode, v.VariableNameCV
FROM ODM2SamplingFeatures.Sites s, ODM2Core.SamplingFeatures sf, ODM2Core.Variables v, ODM2Core.Results r, ODM2Core.Actions a
WHERE s.SiteID = 1 AND r.VariableID = v.VariableID AND a.ActionID = r.ActionID AND a.SamplingFeatureID = sf.SamplingFeatureID
	AND (a.SamplingFeatureID IN (
		SELECT fp.SamplingFeatureID 
		FROM ODM2SamplingFeatures.FeatureParents fp, ODM2SamplingFeatures.Sites s
		WHERE s.SamplingFeatureID = fp.ParentFeatureID AND s.SiteID = 1
	) OR a.SamplingFeatureID IN (
		SELECT SamplingFeatureID
		FROM ODM2SamplingFeatures.Sites
		WHERE SiteID = 1
	)) 
ORDER BY VariableID;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--9.  Give me a list of TimeSeries that have been measured for a particular Variable at a particular Site.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--For ODM 1.1.1, this query would return "time series" from both sensors and samples.
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues WHERE VariableID = 6 AND SiteID = 1) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID;


--For ODM2 this returns only Results with type "Time Series Coverage" that are associated directly with a sampling feature that is a site.
USE ODM2;
SELECT r.ResultID, s.SiteID, s.SiteCode, s.SiteName, s.SiteTypeCV, v.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, u.UnitsID, 
	u.UnitsName, r.SampledMediumCV, v.ValueTypeCV, v.DataTypeCV, m.MethodID, m.MethodName, m.MethodDescription
FROM ODM2Core.Results r, ODM2Core.Variables v, ODM2Core.Actions a, ODM2Core.Methods m, ODM2Core.SamplingFeatures sf, ODM2SamplingFeatures.Sites s,
	ODM2Core.Units u
WHERE v.VariableID = 6 AND s.SiteID = 1 AND r.ResultTypeCV = 'Time Series Coverage' AND v.VariableID = r.VariableID AND a.ActionID = r.ActionID AND m.MethodID = a.MethodID AND u.UnitsID = r.UnitsID 
	AND sf.SamplingFeatureID = a.SamplingFeatureID AND s.SamplingFeatureID = sf.SamplingFeatureID AND (a.SamplingFeatureID IN (
		SELECT fp.SamplingFeatureID 
		FROM ODM2SamplingFeatures.FeatureParents fp, ODM2SamplingFeatures.Sites s
		WHERE s.SamplingFeatureID = fp.ParentFeatureID
	) OR a.SamplingFeatureID IN (
		SELECT SamplingFeatureID
		FROM ODM2SamplingFeatures.Sites
	)
) ;
	
------------------------------------------------------------------------------------------------------------------------------------------------------------
--10.  Give me a list of Methods that have been used to measure or create results for a particular Variable.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT m.MethodID, m.MethodDescription 
FROM Methods m, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues WHERE VariableID = 36) AS sq 
WHERE m.MethodID = sq.MethodID


USE ODM2;
SELECT DISTINCT m.MethodID, m.MethodCode, m.MethodName, m.MethodDescription, m.MethodTypeCV 
FROM ODM2Core.Methods m, ODM2Core.Actions a, ODM2Core.Results r, ODM2Core.Variables v
WHERE m.MethodID = a.MethodID AND a.ActionID = r.ActionID AND r.VariableID = v.VariableID and v.VariableID = 36;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--11.  Give me a list of TimeSeries that have been measured by a particular Person
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
	AND src.SourceID = sq.SourceID AND src.ContactName = 'Jeff Horsburgh';


USE ODM2;
SELECT r.ResultID, s.SiteID, s.SiteCode, s.SiteName, s.SiteTypeCV, r.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, r.UnitsID, 
	u.UnitsName, r.SampledMediumCV,	v.ValueTypeCV, r.IntendedObservationSpacing, v.DataTypeCV, a.MethodID, m.MethodDescription, o.OrganizationCode, 
	o.OrganizationName, r.QualityControlLevelID, qc.QualityControlLevelCode, a.BeginDateTime, a.BeginDateTimeUTCOffset, a.EndDateTime, 
	a.EndDateTimeUTCOffset, r.ValueCount
FROM ODM2Core.Results r, ODM2SamplingFeatures.Sites s, ODM2Core.Variables v, ODM2Core.Units u, ODM2Core.Methods m, ODM2Core.Organizations o, 
	ODM2Core.QualityControlLevels qc, ODM2Core.Actions a, ODM2Core.ActionPeople ap, ODM2Core.Affiliations af, ODM2Core.People p
WHERE r.ActionID = a.ActionID AND r.UnitsID = u.UnitsID AND r.VariableID = v.VariableID AND r.QualityControlLevelID = qc.QualityControlLevelID 
	AND a.SamplingFeatureID = s.SamplingFeatureID AND a.ActionID = ap.ActionID AND ap.AffiliationID = af.AffiliationID AND p.PersonID = af.PersonID 
	AND af.OrganizationID = o.OrganizationID AND a.MethodID = m.MethodID AND p.PersonID = 1;

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


--ODM2 created by an organization
USE ODM2;
SELECT r.ResultID, s.SiteID, s.SiteCode, s.SiteName, s.SiteTypeCV, r.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, r.UnitsID, 
	u.UnitsName, r.SampledMediumCV,	v.ValueTypeCV, r.IntendedObservationSpacing, v.DataTypeCV, a.MethodID, m.MethodDescription, o.OrganizationCode, 
	o.OrganizationName, r.QualityControlLevelID, qc.QualityControlLevelCode, a.BeginDateTime, a.BeginDateTimeUTCOffset, a.EndDateTime, 
	a.EndDateTimeUTCOffset, r.ValueCount
FROM ODM2Core.Results r, ODM2SamplingFeatures.Sites s, ODM2Core.Variables v, ODM2Core.Units u, ODM2Core.Methods m, ODM2Core.Organizations o, 
	ODM2Core.QualityControlLevels qc, ODM2Core.Actions a, ODM2Core.ActionPeople ap, ODM2Core.Affiliations af, ODM2Core.People p
WHERE r.ActionID = a.ActionID AND r.UnitsID = u.UnitsID AND r.VariableID = v.VariableID AND r.QualityControlLevelID = qc.QualityControlLevelID 
	AND a.SamplingFeatureID = s.SamplingFeatureID AND a.ActionID = ap.ActionID AND ap.AffiliationID = af.AffiliationID AND p.PersonID = af.PersonID 
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


USE ODM2;
SELECT r.ResultID, s.SiteID, s.SiteCode, s.SiteName, s.SiteTypeCV, v.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, u.UnitsID, 
	u.UnitsName, r.SampledMediumCV, v.ValueTypeCV, v.DataTypeCV, m.MethodID, m.MethodName, m.MethodDescription
FROM ODM2Core.Results r, ODM2Core.Variables v, ODM2Core.Actions a, ODM2Core.Methods m, ODM2Core.SamplingFeatures sf, ODM2SamplingFeatures.Sites s,
	ODM2Core.Units u
WHERE s.SiteID = 1 AND r.QualityControlLevelID = 1 AND r.ResultTypeCV = 'Time Series Coverage' AND v.VariableID = r.VariableID AND a.ActionID = r.ActionID AND m.MethodID = a.MethodID 
	AND u.UnitsID = r.UnitsID AND sf.SamplingFeatureID = a.SamplingFeatureID AND s.SamplingFeatureID = sf.SamplingFeatureID AND (a.SamplingFeatureID IN (
		SELECT fp.SamplingFeatureID 
		FROM ODM2SamplingFeatures.FeatureParents fp, ODM2SamplingFeatures.Sites s
		WHERE s.SamplingFeatureID = fp.ParentFeatureID
	) OR a.SamplingFeatureID IN (
		SELECT SamplingFeatureID
		FROM ODM2SamplingFeatures.Sites
	)
);

------------------------------------------------------------------------------------------------------------------------------------------------------------
--14.  Give me a list of Sites where Observations have been made for a particular Variable within a given SampleMedium.
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteCode, s.SiteName
FROM Sites s, (SELECT DISTINCT SiteID, VariableID FROM DataValues) AS sq, Variables v
WHERE s.SiteID = sq.SiteID AND v.VariableID = sq.VariableID AND v.VariableID = 65 AND v.SampleMedium = 'Surface Water';


--For ODM2, I have to check both the Site SamplingFeature AND any children SamplingFeatures
--Do this for a variable measured on specimens - e.g., VariableID = 65 and with a SampledMedium = "Surface Water"
USE ODM2;
SELECT SiteCode, SiteName
FROM ODM2SamplingFeatures.Sites s
WHERE s.SamplingFeatureID IN (
	SELECT DISTINCT a.SamplingFeatureID
	FROM ODM2Core.Actions a, ODM2Core.Results r 
	WHERE r.VariableID = 65 AND r.SampledMediumCV = 'Surface Water' AND r.ActionID = a.ActionID
) OR s.SamplingFeatureID IN (
	SELECT ParentFeatureID
	FROM ODM2SamplingFeatures.FeatureParents
	WHERE SamplingFeatureID IN (
		SELECT DISTINCT a.SamplingFeatureID
		FROM ODM2Core.Actions a, ODM2Core.Results r 
		WHERE r.VariableID = 65 AND r.SampledMediumCV = 'Surface Water' AND r.ActionID = a.ActionID
	)
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