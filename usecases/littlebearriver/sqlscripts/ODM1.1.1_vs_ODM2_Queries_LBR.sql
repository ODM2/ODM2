------------------------------------------------------------------------------------------------------------------------------------------------------------
--1.  Give me all of the 'Observations' for a particular Variable measured at a specific Site using a particular Method and having a specific QualityControlLevel.
------------------------------------------------------------------------------------------------------------------------------------------------------------
SET STATISTICS TIME ON
--ODM 1.1.1
USE LittleBearRiverODM;
SELECT * 
FROM DataValues 
WHERE SiteID = 1 AND VariableID = 36 AND MethodID = 18 AND QualityControlLevelID = 0
ORDER BY LocalDateTime;

--ODM2
--For ODM2, I would pose this query a bit differently.  Something like - Give me all of the observations for a particular result type for a pariticular variable
--at at sepcific site using a particular method and having a specific QualityControlLevel.
USE ODM2;
SELECT tsrv.ValueID, tsrv.ResultID, tsrv.DataValue, tsrv.ValueDateTime, tsrv.ValueDateTimeUTCOffset, tsr.SpatialReferenceID, tsr.XLocation, tsr.YLocation, tsr.ZLocation,
	tsrv.CensorCodeCV, tsrv.QualityCodeCV, tsrv.TimeAggregationInterval, tsrv.TimeAggregationIntervalUnitsID, tsr.AggregationStatisticCV
FROM ODM2.TimeSeriesResultValues tsrv, ODM2.Results r, ODM2.TimeSeriesResults tsr, ODM2.FeatureActions fa, ODM2.Actions a, ODM2.Sites s
WHERE s.SamplingFeatureID = 1 AND r.VariableID = 36 AND r.ProcessingLevelID = 0 AND a.MethodID = 18 AND tsrv.ResultID = tsr.ResultID AND tsr.ResultID = r.ResultID 
	AND fa.FeatureActionID = r.FeatureActionID AND fa.ActionID = a.ActionID AND fa.SamplingFeatureID = s.SamplingFeatureID
ORDER BY ValueDateTime;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.  Same as 1, but subset the Observations and return only those Observations between a BeginDateTime and EndDateTime.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1
USE LittleBearRiverODM;
SELECT * 
FROM DataValues 
WHERE SiteID = 1 AND VariableID = 36 AND MethodID = 18 AND QualityControlLevelID = 0 AND LocalDateTime >= '9/1/2007' AND LocalDateTime < '9/2/2007'
ORDER BY LocalDateTime;

--ODM2
USE ODM2;
SELECT tsrv.ValueID, tsrv.ResultID, tsrv.DataValue, tsrv.ValueDateTime, tsrv.ValueDateTimeUTCOffset, tsr.SpatialReferenceID, tsr.XLocation, tsr.YLocation, tsr.ZLocation,
	tsrv.CensorCodeCV, tsrv.QualityCodeCV, tsrv.TimeAggregationInterval, tsrv.TimeAggregationIntervalUnitsID, tsr.AggregationStatisticCV
FROM ODM2.TimeSeriesResultValues tsrv, ODM2.Results r, ODM2.TimeSeriesResults tsr, ODM2.FeatureActions fa, ODM2.Actions a, ODM2.Sites s
WHERE s.SamplingFeatureID = 1 AND r.VariableID = 36 AND r.ProcessingLevelID = 0 AND a.MethodID = 18 AND tsrv.ValueDateTime >= '9/1/2007' AND tsrv.ValueDateTime < '9/2/2007'
	AND tsrv.ResultID = tsr.ResultID AND tsr.ResultID = r.ResultID AND fa.FeatureActionID = r.FeatureActionID AND fa.ActionID = a.ActionID 
	AND fa.SamplingFeatureID = s.SamplingFeatureID
ORDER BY ValueDateTime;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--3.  Give me a list of Sites where a particular Variable has been measured.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1
USE LittleBearRiverODM;
SELECT DISTINCT SiteCode, SiteName 
FROM Sites s
JOIN DataValues dv
	ON dv.SiteID = s.SiteID
JOIN Variables v
	ON dv.VariableID = v.VariableID 
WHERE v.VariableID = 65;

--ODM2 - For ODM2, I have to check both the Site SamplingFeature AND any Specimen SamplingFeatures that were collected at a site
--To test this for sample based data, use VariableID = 65
USE ODM2;
SELECT SamplingFeatureCode, SamplingFeatureName, SamplingFeatureTypeCV
FROM ODM2.SamplingFeatures sf
WHERE SamplingFeatureTypeCV = 'Site' AND sf.SamplingFeatureID IN (
	SELECT DISTINCT fa.SamplingFeatureID
	FROM ODM2.FeatureActions fa, ODM2.Results r 
	WHERE r.VariableID = 65 AND fa.FeatureActionID = r.FeatureActionID
) OR sf.SamplingFeatureID IN (
	SELECT RelatedFeatureID
	FROM ODM2.RelatedFeatures
	WHERE SamplingFeatureID IN (
		SELECT DISTINCT fa.SamplingFeatureID
		FROM ODM2.FeatureActions fa, ODM2.Results r 
		WHERE r.VariableID = 65 AND fa.FeatureActionID = r.FeatureActionID
	)
);

------------------------------------------------------------------------------------------------------------------------------------------------------------
--4.  Give me a list of TimeSeries for a particular Variable.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1 - For ODM 1.1.1, this query would return "time series" from both sensors and samples.
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues WHERE VariableID = 6) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID;

--ODM2 - For ODM2, this returns only Results with type "Time Series Coverage" that are associated directly with a sampling feature that is a site.
USE ODM2;
SELECT r.ResultID, sf.SamplingFeatureID, sf.SamplingFeatureCode, sf.SamplingFeatureName, s.SiteTypeCV, r.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, r.UnitsID, 
	u.UnitsName, r.SampledMediumCV, tsr.AggregationStatisticCV, a.MethodID, m.MethodTypeCV, m.MethodName, m.MethodDescription, pl.ProcessingLevelCode, pl.Definition
FROM ODM2.Results r, ODM2.Variables v, ODM2.FeatureActions fa, ODM2.Methods m, ODM2.Sites s, ODM2.SamplingFeatures sf,
	ODM2.Units u, ODM2.Actions a, ODM2.ProcessingLevels pl, ODM2.TimeSeriesResults tsr
WHERE r.VariableID = 6 AND r.ResultTypeCV = 'Time Series Coverage' AND v.VariableID = r.VariableID AND a.ActionID = fa.ActionID 
	AND m.MethodID = a.MethodID AND u.UnitsID = r.UnitsID AND s.SamplingFeatureID = sf.SamplingFeatureID AND sf.SamplingFeatureID = fa.SamplingFeatureID 
	AND fa.FeatureActionID = r.ResultID	AND pl.ProcessingLevelID = r.ProcessingLevelID AND r.ResultID = tsr.ResultID;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--5.  Give me a list of Sites for which there are data.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1
USE LittleBearRiverODM;
SELECT DISTINCT SiteCode, SiteName
FROM Sites s
JOIN DataValues dv
	ON dv.SiteID = s.SiteID;


--ODM2 - For ODM2, must check SamplingFeatures that are Sites but also add Sites that have Specimens that were collected at the Site
USE ODM2;
SELECT SamplingFeatureCode, SamplingFeatureName
FROM ODM2.SamplingFeatures sf
WHERE SamplingFeatureTypeCV = 'Site' AND sf.SamplingFeatureID IN (
	SELECT DISTINCT fa.SamplingFeatureID
	FROM ODM2.FeatureActions fa, ODM2.Results r 
	WHERE fa.FeatureActionID = r.FeatureActionID
) OR sf.SamplingFeatureID IN (
	SELECT RelatedFeatureID
	FROM ODM2.RelatedFeatures
	WHERE SamplingFeatureID IN (
		SELECT DISTINCT fa.SamplingFeatureID
		FROM ODM2.FeatureActions fa, ODM2.Results r 
		WHERE fa.FeatureActionID = r.FeatureActionID
	)
);
	
------------------------------------------------------------------------------------------------------------------------------------------------------------
--6.  Give me a list of Variables for which there are data.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1
USE LittleBearRiverODM;
SELECT DISTINCT v.VariableCode, v.VariableName
FROM Variables v
JOIN DataValues dv
	ON dv.VariableID = v.VariableID
ORDER BY v.VariableName;

--ODM2
USE ODM2;
SELECT DISTINCT VariableCode, VariableNameCV 
FROM ODM2.Variables v
JOIN ODM2.Results r
	ON r.VariableID = v.VariableID
ORDER BY VariableNameCV; 	

------------------------------------------------------------------------------------------------------------------------------------------------------------
--7.  Give me a list of Methods for which there are data.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1
USE LittleBearRiverODM;
SELECT DISTINCT m.MethodID, m.MethodDescription, m.MethodLink
FROM Methods m
JOIN DataValues dv
	ON dv.MethodID = m.MethodID
ORDER BY m.MethodID;


--ODM2 - For ODM2, this includes both Methods and LabMethods, whereas for ODM 1.1.1 it includes only Methods
USE ODM2;
SELECT DISTINCT m.MethodID, m.MethodCode, m.MethodName, m.MethodDescription, m.MethodLink
FROM ODM2.Methods m
JOIN ODM2.Actions a
	ON a.MethodID = m.MethodID 
JOIN ODM2.FeatureActions fa
	ON fa.ActionID = a.ActionID
JOIN ODM2.Results r
	ON r.FeatureActionID = fa.FeatureActionID
ORDER BY MethodID;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--8.  Give me a list of Variables that have been measured at a particular Site.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1 - this is super slow!
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, v.VariableID, v.VariableCode, v.VariableName
FROM Sites s, Variables v, DataValues dv
WHERE s.SiteID = dv.SiteID AND dv.VariableID = v.VariableID AND s.SiteID = 1
ORDER BY VariableID;

--ODM 1.1.1 - A little different way, but much faster!
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, v.VariableID, v.VariableCode, v.VariableName
FROM Sites s, Variables v, (SELECT DISTINCT SiteID, VariableID FROM DataValues) dv
WHERE s.SiteID = 1 AND dv.VariableID = v.VariableID AND s.SiteID = dv.SiteID
ORDER BY VariableID;


--ODM2 - For ODM2 I have to include Results occurring at the Site + Results occurring on Specimens collected at the Site
--First I have to get the set of SamplingFeatures associated with the Site (including the Site and any child SamplingFeatures and then do the query)
--This is tricky, and I kind of fudged it using SQL Variables
USE ODM2;
DECLARE @SamplingFeatureID AS int;
SELECT @SamplingFeatureID = 1;
DECLARE @SamplingFeatureCode AS varchar(50);
SELECT @SamplingFeatureCode = SamplingFeatureCode FROM ODM2.SamplingFeatures WHERE SamplingFeatureID = 1
DECLARE @SamplingFeatureName AS varchar(255);
SELECT @SamplingFeatureName = SamplingFeatureName FROM ODM2.SamplingFeatures WHERE SamplingFeatureID = 1
SELECT DISTINCT @SamplingFeatureID AS SamplingFeatureID, @SamplingFeatureCode AS SamplingFeatureCode, @SamplingFeatureName AS SamplingFeatureName, v.VariableID, v.VariableCode, v.VariableNameCV
FROM ODM2.Variables v, ODM2.Results r, ODM2.FeatureActions fa
WHERE r.VariableID = v.VariableID AND fa.FeatureActionID = r.FeatureActionID 
	AND (fa.SamplingFeatureID IN (
		SELECT SamplingFeatureID 
		FROM ODM2.RelatedFeatures
		WHERE RelatedFeatureID = @SamplingFeatureID
	) OR fa.SamplingFeatureID = @SamplingFeatureID)
ORDER BY VariableID; 

------------------------------------------------------------------------------------------------------------------------------------------------------------
--9.  Give me a list of "TimeSeries" that have been measured for a particular Variable at a particular Site.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1 - For ODM 1.1.1, this query would return "time series" from both sensors and samples.
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues WHERE VariableID = 6 AND SiteID = 1) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID;


--ODM2 - For ODM2 this returns Results with type "Time Series Coverage" that are associated directly with a SamplingFeature that is a Site or any SamplingFeatures
--that are children of the Site
USE ODM2;
DECLARE @SamplingFeatureID AS int;
SELECT @SamplingFeatureID = 1;
DECLARE @VariableID AS int;
SELECT @VariableID = 6;
SELECT r.ResultID, sf.SamplingFeatureID, sf.SamplingFeatureCode, sf.SamplingFeatureName, sf.SamplingFeatureTypeCV, s.SiteTypeCV, v.VariableID, v.VariableCode, v.VariableNameCV, 
	v.SpeciationCV, u.UnitsID, u.UnitsName, r.SampledMediumCV, tsr.AggregationStatisticCV, m.MethodID, m.MethodName, m.MethodDescription, pl.ProcessingLevelCode, pl.Definition
FROM ODM2.Results r, ODM2.Variables v, ODM2.Actions a, ODM2.Methods m, ODM2.FeatureActions fa, ODM2.Sites s, ODM2.SamplingFeatures sf, 
	ODM2.Units u, ODM2.ProcessingLevels pl, ODM2.TimeSeriesResults tsr
WHERE v.VariableID = @VariableID AND r.ResultTypeCV = 'Time Series Coverage' AND v.VariableID = r.VariableID AND a.ActionID = fa.ActionID 
	AND m.MethodID = a.MethodID AND u.UnitsID = r.UnitsID AND s.SamplingFeatureID = sf.SamplingFeatureID AND sf.SamplingFeatureID = fa.SamplingFeatureID 
	AND fa.FeatureActionID = r.FeatureActionID AND r.resultID = tsr.ResultID AND r.ProcessingLevelID = pl.ProcessingLevelID 
	AND (fa.SamplingFeatureID IN (
		SELECT SamplingFeatureID 
		FROM ODM2.RelatedFeatures
		WHERE RelatedFeatureID = @SamplingFeatureID
	) OR fa.SamplingFeatureID = @SamplingFeatureID);

------------------------------------------------------------------------------------------------------------------------------------------------------------
--10.  Give me a list of Methods that have been used to measure or create results for a particular Variable.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1
USE LittleBearRiverODM;
DECLARE @VariableID AS int;
SELECT @VariableID = 36
SELECT DISTINCT m.MethodID, m.MethodDescription 
FROM Methods m, (SELECT DISTINCT VariableID, MethodID FROM DataValues WHERE VariableID = @VariableID) AS sq 
WHERE m.MethodID = sq.MethodID
ORDER BY MethodID;


--ODM2
USE ODM2;
DECLARE @VariableID AS int;
SELECT @VariableID = 36
SELECT DISTINCT m.MethodID, m.MethodCode, m.MethodName, m.MethodDescription, m.MethodTypeCV 
FROM ODM2.Methods m, ODM2.Actions a, ODM2.Results r, ODM2.Variables v, ODM2.FeatureActions fa
WHERE m.MethodID = a.MethodID AND a.ActionID = fa.ActionID AND fa.FeatureActionID = r.FeatureActionID AND r.VariableID = v.VariableID and v.VariableID = @VariableID
ORDER BY MethodID;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--11.  Give me a list of "TimeSeries" that have been measured by a particular Person at a particular Site
--NOTES:
--For ODM2 this is only going to include "Time Series Coverage" results associated directly with a 
--sampling feature that is a site and not "Measurement" Results
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID AND src.ContactName = 'Jeff Horsburgh' AND s.SiteID = 1
ORDER BY SiteCode, VariableID;

--ODM2
USE ODM2;
SELECT DISTINCT r.ResultID, fa.SamplingFeatureID, sf.SamplingFeatureCode, sf.SamplingFeatureName, s.SiteTypeCV, r.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, r.UnitsID, 
	u.UnitsName, r.SampledMediumCV,	tsr.AggregationStatisticCV, a.MethodID, m.MethodDescription, o.OrganizationCode, 
	o.OrganizationName, r.ProcessingLevelID, pl.ProcessingLevelCode, a.BeginDateTime, a.BeginDateTimeUTCOffset, a.EndDateTime, 
	a.EndDateTimeUTCOffset, r.ValueCount
FROM ODM2.Results r, ODM2.SamplingFeatures sf, ODM2.Sites s, ODM2.Variables v, ODM2.Units u, ODM2.TimeSeriesResults tsr, ODM2.Methods m, ODM2.Organizations o, 
	ODM2.ProcessingLevels pl, ODM2.Actions a, ODM2.ActionBy ab, ODM2.Affiliations af, ODM2.People p, ODM2.FeatureActions fa
WHERE r.FeatureActionID = fa.FeatureActionID AND fa.SamplingFeatureID = sf.SamplingFeatureID AND fa.SamplingFeatureID = s.SamplingFeatureID AND fa.ActionID = a.ActionID 
	AND r.UnitsID = u.UnitsID AND r.VariableID = v.VariableID AND r.ProcessingLevelID = pl.ProcessingLevelID AND r.ResultID = tsr.ResultID 
	AND a.ActionID = ab.ActionID AND ab.AffiliationID = af.AffiliationID AND p.PersonID = af.PersonID 
	AND af.OrganizationID = o.OrganizationID AND a.MethodID = m.MethodID AND p.PersonFirstName = 'Jeff' AND p.PersonLastName = 'Horsburgh' AND s.SamplingFeatureID = 1
ORDER BY SamplingFeatureCode, VariableID;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--12.  Give me a list of TimeSeries that have been measured by a particular Organization at a particular site
--NOTES:
--For ODM2 this is only going to include "Time Series Coverage" results associated directly with a 
--sampling feature that is a site and not "Measurement" Results
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID AND src.SourceID = 1 and s.SiteID = 1;

--ODM2
USE ODM2;
SELECT DISTINCT r.ResultID, fa.SamplingFeatureID, sf.SamplingFeatureCode, sf.SamplingFeatureName, s.SiteTypeCV, r.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, r.UnitsID, 
	u.UnitsName, r.SampledMediumCV,	tsr.AggregationStatisticCV, a.MethodID, m.MethodDescription, o.OrganizationCode, 
	o.OrganizationName, r.ProcessingLevelID, pl.ProcessingLevelCode, a.BeginDateTime, a.BeginDateTimeUTCOffset, a.EndDateTime, 
	a.EndDateTimeUTCOffset, r.ValueCount
FROM ODM2.Results r, ODM2.SamplingFeatures sf, ODM2.Sites s, ODM2.Variables v, ODM2.Units u, ODM2.TimeSeriesResults tsr, ODM2.Methods m, ODM2.Organizations o, 
	ODM2.ProcessingLevels pl, ODM2.Actions a, ODM2.ActionBy ab, ODM2.Affiliations af, ODM2.People p, ODM2.FeatureActions fa
WHERE r.FeatureActionID = fa.FeatureActionID AND fa.SamplingFeatureID = sf.SamplingFeatureID AND fa.SamplingFeatureID = s.SamplingFeatureID AND fa.ActionID = a.ActionID 
	AND r.UnitsID = u.UnitsID AND r.VariableID = v.VariableID AND r.ProcessingLevelID = pl.ProcessingLevelID AND r.ResultID = tsr.ResultID 
	AND a.ActionID = ab.ActionID AND ab.AffiliationID = af.AffiliationID AND p.PersonID = af.PersonID 
	AND af.OrganizationID = o.OrganizationID AND a.MethodID = m.MethodID AND o.OrganizationID = 1 AND s.SamplingFeatureID = 1

------------------------------------------------------------------------------------------------------------------------------------------------------------
--13.  Give me a list of TimeSeries for a particular Site and QualityControlLevel
--NOTES:
--For ODM2 this is only going to include "Time Series Coverage" results and not "Measurement" Results
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1 - this will include both time series and measurements
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName, s.SiteType, v.VariableID, v.VariableCode, v.VariableName, v.Speciation, u.UnitsID, u.UnitsName,
	v.SampleMedium, v.ValueType, v.DataType, m.MethodID, m.MethodDescription, qc.QualityControlLevelCode, qc.Definition, src.SourceID, src.SourceDescription 
FROM Sites s, Variables v, Methods m, Units u, (SELECT DISTINCT SiteID, VariableID, MethodID, SourceID, QualityControlLevelID FROM DataValues WHERE SiteID = 1 AND QualityControlLevelID = 1) AS sq, 
	QualityControlLevels qc, Sources src
WHERE s.SiteID = sq.SiteID AND m.MethodID = sq.MethodID AND v.VariableID = sq.VariableID AND v.VariableUnitsID = u.UnitsID AND qc.QualityControlLevelID = sq.QualityControlLevelID
	AND src.SourceID = sq.SourceID;


--ODM2 - This query will only return the ProcessingLevelID = 1 Results having ResultType = 'Time Series Coverage' and collected at the selected site or any
--of the Site's child SamplingFeatures
USE ODM2;
DECLARE @SamplingFeatureID AS int;
SELECT @SamplingFeatureID = 1;
DECLARE @SamplingFeatureCode AS varchar(50);
SELECT @SamplingFeatureCode = SamplingFeatureCode FROM ODM2.SamplingFeatures WHERE SamplingFeatureID = @SamplingFeatureID;
DECLARE @SamplingFeatureName AS varchar(255);
SELECT @SamplingFeatureName = SamplingFeatureName FROM ODM2.SamplingFeatures WHERE SamplingFeatureID = @SamplingFeatureID;
DECLARE @SiteType AS varchar(255);
SELECT @SiteType = SiteTypeCV FROM ODM2.Sites WHERE SamplingFeatureID = @SamplingFeatureID;
DECLARE @ProcessingLevelID AS int;
SELECT @ProcessingLevelID = 1;
SELECT DISTINCT r.ResultID, @SamplingFeatureID AS SamplingFeatureID, @SamplingFeatureCode AS SamplingFeatutreCode, @SamplingFeatureName AS SamplingFeatureName, 
	@SiteType AS SiteType, v.VariableID, v.VariableCode, v.VariableNameCV, v.SpeciationCV, u.UnitsID, u.UnitsName, r.SampledMediumCV, tsr.AggregationStatisticCV, 
	m.MethodID, m.MethodName, m.MethodDescription
FROM ODM2.Results r, ODM2.Variables v, ODM2.Actions a, ODM2.Methods m, ODM2.SamplingFeatures sf, ODM2.Sites s,ODM2.Units u, ODM2.FeatureActions fa,
	ODM2.TimeSeriesResults tsr
WHERE r.ProcessingLevelID = @ProcessingLevelID AND r.ResultTypeCV = 'Time Series Coverage' AND r.ResultID = tsr.ResultID and r.VariableID = v.VariableID 
	AND r.FeatureActionID = fa.FeatureActionID AND fa.SamplingFeatureID = sf.SamplingFeatureID AND fa.SamplingFeatureID = s.SamplingFeatureID 
	AND fa.ActionID = a.ActionID AND m.MethodID = a.MethodID AND u.UnitsID = r.UnitsID  
	AND (fa.SamplingFeatureID IN (
		SELECT SamplingFeatureID 
		FROM ODM2.RelatedFeatures
		WHERE RelatedFeatureID = @SamplingFeatureID
	) OR fa.SamplingFeatureID = @SamplingFeatureID);

------------------------------------------------------------------------------------------------------------------------------------------------------------
--14.  Give me a list of Sites where Observations have been made for a particular Variable within a given SampleMedium.
------------------------------------------------------------------------------------------------------------------------------------------------------------
--ODM 1.1.1
USE LittleBearRiverODM;
SELECT DISTINCT s.SiteID, s.SiteCode, s.SiteName
FROM Sites s, (SELECT DISTINCT SiteID, VariableID FROM DataValues) AS sq, Variables v
WHERE s.SiteID = sq.SiteID AND v.VariableID = sq.VariableID AND v.VariableID = 65 AND v.SampleMedium = 'Surface Water'
ORDER BY SiteID;


--ODM2 - For ODM2, I have to check both the Site SamplingFeature AND any children SamplingFeatures
--Do this for a variable measured on specimens - e.g., VariableID = 65 and with a SampledMedium = "Surface Water"
USE ODM2;
DECLARE @VariableID AS int;
SELECT @VariableID = 65;
DECLARE @SampledMedium AS varchar(255);
SELECT @SampledMedium = 'Surface Water';
SELECT sf.SamplingFeatureID, sf.SamplingFeatureCode, sf.SamplingFeatureName
FROM ODM2.SamplingFeatures sf
WHERE sf.SamplingFeatureID IN (
	SELECT DISTINCT rf.RelatedFeatureID  
	FROM ODM2.RelatedFeatures rf, ODM2.SamplingFeatures sf, ODM2.FeatureActions fa, ODM2.Results r
	WHERE rf.RelatedFeatureID = sf.SamplingFeatureID AND rf.SamplingFeatureID = fa.SamplingFeatureID AND fa.FeatureActionID = r.FeatureActionID 
		AND r.VariableID = @VariableID AND r.SampledMediumCV = @SampledMedium
	) 
OR sf.SamplingFeatureID IN (
	SELECT DISTINCT sf.SamplingFeatureID
	FROM ODM2.SamplingFeatures sf, ODM2.FeatureActions fa, ODM2.Results r
	WHERE sf.SamplingFeatureID = fa.SamplingFeatureID AND fa.FeatureActionID = r.FeatureActionID AND r.VariableID = @VariableID AND r.SampledMediumCV = @SampledMedium
) AND SamplingFeatureTypeCV = 'Site';

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