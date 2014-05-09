--------------------------------------------------------------------------------------
--Created by:  Jeff Horsburgh
--This script copies an ODM 1.1.1 Database to a blank ODM2 database
--Requirements:
--1.  The ODM2 Database must already exist and it must have all of the ODM2 objects in it
--2.  The ODM2 databae must be empty
--3.  Right now it is hard-coded to an ODM 1.1.1 database called "LittleBearRiverODM" and
--an ODM2 database called "ODM2"
--4.  No other processes adding data to the database while this is being run
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
--Populate the SamplingFeature tables
--NOTES:
--1.  Uses the SiteIDs from the existing ODM database to populate SamplingFeatureID  
--2.  Currently uses the LatLongDatumID as SpatialReferenceID
--------------------------------------------------------------------------------------

--Populate the ODM2SamplingFeatures.SpatialReferences table
SET IDENTITY_INSERT ODM2.ODM2SamplingFeatures.SpatialReferences ON;
INSERT INTO ODM2.ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID, SRSCode, SRSName, SRSDescription)
SELECT SpatialReferenceID, CAST(SRSID AS VARCHAR(50)) AS SRSCode, SRSName, CAST(Notes AS VARCHAR(500)) AS SRSDescription
FROM LittleBearRiverODM.dbo.SpatialReferences
ORDER BY SpatialReferenceID;
SET IDENTITY_INSERT ODM2.ODM2SamplingFeatures.SpatialReferences OFF;

--Add Records to teh ODM2SamplingFeatures.SpatialReference table for the OffsetTypes used in ODM1
INSERT INTO ODM2.ODM2SamplingFeatures.SpatialReferences (SRSName)
SELECT OffsetDescription
FROM LittleBearRiverODM.dbo.OffsetTypes;

--Populate the ODM2Core.SamplingFeatures table with records for the Sites
--First, make sure the data type of the FeatureGeometry field is correct 
--For now using geometry type in SQL Server

--Added the following 3 lines because DBWrench didn't have geometry data type, but it seems to support it now
--ALTER TABLE ODM2.ODM2Core.SamplingFeatures DROP COLUMN FeatureGeometry;
--ALTER TABLE ODM2.ODM2Core.SamplingFeatures ADD FeatureGeometry geometry NULL;
--GO

--Now add the Site SamplingFeatures to the SamplingFeatures table 
SET IDENTITY_INSERT ODM2.ODM2Core.SamplingFeatures ON; 
INSERT INTO ODM2.ODM2Core.SamplingFeatures (SamplingFeatureID, SamplingFeatureTypeCV, SamplingFeatureCode, SamplingFeatureName, SamplingFeatureDescription, SamplingFeatureGeoTypeCV, FeatureGeometry, Elevation_m, ElevationDatumCV)
SELECT s.SiteID AS SamplingFeatureID, 'Site' AS SamplingFeatureTypeCV, s.SiteCode AS SamplingFeatureCode, s.SiteName AS SamplingFeatureName, s.Comments AS SamplingFeatureDescription, '2D-Point' AS SamplingFeatureGeoTypeCV,
	geometry::Point(s.Longitude, s.Latitude, sr.SRSID) AS FeatureGeometry, s.Elevation_m, VerticalDatum AS ElevationDatumCV
FROM LittleBearRiverODM.dbo.Sites s, LittleBearRiverODM.dbo.SpatialReferences sr
WHERE s.LatLongDatumID = sr.SpatialReferenceID
ORDER BY SamplingFeatureID;
SET IDENTITY_INSERT ODM2.ODM2Core.SamplingFeatures OFF;

--Populate the ODM2SamplingFeatures.Sites table
INSERT INTO ODM2.ODM2SamplingFeatures.Sites (SamplingFeatureID, SiteTypeCV, Latitude, Longitude, LatLonDatumID)
SELECT SiteID AS SamplingFeatureID, SiteType AS SiteTypeCV, Latitude, Longitude, LatLongDatumID
FROM LittleBearRiverODM.dbo.Sites 
ORDER BY SiteID;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Units table
--------------------------------------------------------------------------------------
--Load the Units from ODM 1.1 - can just move these straight across and use the same IDs
SET IDENTITY_INSERT ODM2.ODM2Core.Units ON; 
INSERT INTO ODM2.ODM2Core.Units (UnitsID, UnitsTypeCV, UnitsAbbreviation, UnitsName)
SELECT UnitsID, UnitsType AS UnitsTypeCV, UnitsAbbreviation, UnitsName 
FROM LittleBearRiverODM.dbo.Units 
ORDER BY UnitsID;
SET IDENTITY_INSERT ODM2.ODM2Core.Units OFF;

------------------------------------------------------------------------------------------------
--Populate the ODM2Core.ProcessingLevels table (Equivalent to QualityControlLevels in ODM 1.1)
------------------------------------------------------------------------------------------------
--Load the QualityControlLevels from ODM 1.1 - can just move these straight across and use the same IDs
SET IDENTITY_INSERT ODM2.ODM2Core.ProcessingLevels ON; 
INSERT INTO ODM2.ODM2Core.ProcessingLevels (ProcessingLevelID, ProcessingLevelCode, Definition, Explanation)
SELECT QualityControlLevelID AS ProcessingLevelID, QualityControlLevelCode AS ProcessingLevelCode, Definition, Explanation 
FROM LittleBearRiverODM.dbo.QualityControlLevels 
ORDER BY ProcessingLevelID;
SET IDENTITY_INSERT ODM2.ODM2Core.ProcessingLevels OFF;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Variables table
--------------------------------------------------------------------------------------
--Load the Variables from ODM 1.1 - can just move these straight across and use the same IDs
SET IDENTITY_INSERT ODM2.ODM2Core.Variables ON; 
INSERT INTO ODM2.ODM2Core.Variables (VariableID, VariableTypeCV, VariableCode, VariableNameCV, VariableDefinition, SpeciationCV, NoDataValue)
SELECT VariableID, 'Unknown' AS VariableTypeCV, VariableCode, VariableName AS VariableNameCV, NULL AS VariableDefinition, Speciation AS SpeciationCV, NoDataValue 
FROM LittleBearRiverODM.dbo.Variables 
ORDER BY VariableID;
SET IDENTITY_INSERT ODM2.ODM2Core.Variables OFF;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Methods table
--------------------------------------------------------------------------------------
--Load the Methods from ODM 1.1 - can just move these straight across and use the same IDs
SET IDENTITY_INSERT ODM2.ODM2Core.Methods ON; 
INSERT INTO ODM2.ODM2Core.Methods (MethodID, MethodTypeCV, MethodCode, MethodName, MethodDescription, MethodLink, OrganizationID)
SELECT MethodID, 'Unknown' AS MethodTypeCV, MethodID AS MethodCode, MethodDescription AS MethodName, 
	MethodDescription, MethodLink, NULL AS OrganizationID  
FROM LittleBearRiverODM.dbo.Methods 
ORDER BY MethodID;
SET IDENTITY_INSERT ODM2.ODM2Core.Methods OFF;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Organizations table
--NOTES:
--1.  This uses the SourceIDs from the ODM 1.1 database as the OrganizationID
--2.  This uses "Research Institute" as the OrganizationTypeCV for now - this won't be true for all organizations stored in ODM 1.1 databases
--------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.Organizations ON; 
INSERT INTO ODM2.ODM2Core.Organizations (OrganizationID, OrganizationTypeCV, OrganizationCode, 
	OrganizationName, OrganizationDescription, OrganizationLink, ParentOrganizationID)
SELECT SourceID AS OrganizationID, 'Research Institute' AS OrganizationTypeCV, SourceID AS OrganizationCode, 
	Organization AS OrganizationName, CAST(SourceDescription AS VARCHAR(500)) AS OrganizationDescription,  
	SourceLink AS OrganizationLink, NULL AS ParentOrganizationID 
FROM LittleBearRiverODM.dbo.Sources 
ORDER BY OrganizationID;
SET IDENTITY_INSERT ODM2.ODM2Core.Organizations OFF;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.People table
--NOTES: 
--1.  This function may not work for all names - especially those with middle names or initials
--------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.People (PersonFirstName, PersonLastName)
SELECT DISTINCT
  CAST(SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS VARCHAR(255)) AS PersonFirstName,
  CAST(SUBSTRING(ContactName, CHARINDEX(' ', ContactName) + 1, 8000) AS VARCHAR(255)) AS PersonLastName
FROM LittleBearRiverODM.dbo.Sources  
ORDER BY PersonLastName;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Affiliations table
--------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.Affiliations (PersonID, OrganizationID, IsPrimaryOrganizationContact, AffiliationStartDate, 
	AffiliationEndDate, PrimaryPhone, PrimaryEmail, PrimaryAddress, PersonLink)
SELECT p.PersonID, s.SourceID AS OrganizationID, 1 AS IsPrimaryOrganizationContact, GETDATE() AS AffiliationStartDate, 
	NULL AS AffiliationEndDate, s.Phone AS PrimaryPhone, s.Email AS PrimaryEmail, 
	s.[Address] + ', ' + s.[City] + ', ' + s.[State] + ', ' + s.[ZipCode] AS PrimaryAddress, NULL AS PersonLink
FROM LittleBearRiverODM.dbo.Sources s, ODM2.ODM2Core.People p 
WHERE p.PersonFirstName + ' ' + p.PersonLastName = s.ContactName
ORDER BY OrganizationID, PersonID;

-------------------------------------------------------------------------------------
--Add the LabMethods from ODM 1.1 to the ODM2Core.Methods table
--NOTES:
--1.  Can't use the IDs from ODM 1.1 because they were not in the same table as methods
-------------------------------------------------------------------------------------
--Get the last MethodID and that was created
DECLARE @MaxMethodID AS int;
SELECT @MaxMethodID = MAX(MethodID) FROM ODM2.ODM2Core.Methods;
--Get the last OrgnanizationID that was created
DECLARE @MaxOrganizationID AS int;
SELECT @MaxOrganizationID = MAX(OrganizationID) FROM ODM2.ODM2Core.Organizations;
--Add the analytical labs to the organizations table 
INSERT INTO ODM2.ODM2Core.Organizations (OrganizationTypeCV, OrganizationCode, OrganizationName, OrganizationDescription, OrganizationLink, ParentOrganizationID)
SELECT DISTINCT 'Analytical Laboratory' AS OrganizationTypeCV, LabName AS OrganizationCode, LabName AS OrganizationName, 
	LabOrganization AS OrganizationDescription, NULL AS OrganizationLink, NULL AS ParentOrganizationID 
FROM LittleBearRiverODM.dbo.LabMethods;

--Create a temporary table that will make this easier
SELECT DISTINCT lm.LabMethodID + @MaxMethodID + 1 AS MethodID, 'Laboratory Analytical Method' AS MethodTypeCV, lm.LabMethodID + @MaxMethodID + 1 AS MethodCode, 
	lm.LabMethodName AS MethodName, lm.LabMethodDescription AS MethodDescription, lm.LabMethodLink AS MethodLink, org.OrganizationID		
INTO #TempLabMethodInfo
FROM LittleBearRiverODM.dbo.LabMethods lm, ODM2.ODM2Core.Organizations org
WHERE lm.LabName = org.OrganizationName AND org.OrganizationID > @MaxOrganizationID;
--Add the LabMethods from ODM 1.1 to the ODM2 Methods table
SET IDENTITY_INSERT ODM2.ODM2Core.Methods ON; 
INSERT INTO ODM2.ODM2Core.Methods (MethodID, MethodTypeCV, MethodCode, MethodName, MethodDescription, MethodLink, OrganizationID)
SELECT MethodID, MethodTypeCV, MethodCode, MethodName, MethodDescription, MethodLink, OrganizationID  
FROM #TempLabMethodInfo 
ORDER BY MethodID;
SET IDENTITY_INSERT ODM2.ODM2Core.Methods OFF;
--Drop the temp table
DROP TABLE #TempLabMethodInfo;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Populate the ODM2Core.Actions, ODM2Core.Results, and ODM2Results.ResultValues tables for sensor-based time series data
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

------------------------------------------------------------------------------------------------------------------------
--Add records to the ODM2Core.Actions table for "Observation Actions" associated with sensor-based time series data
--NOTES:  
--1.  This uses the SeriesIDs from the ODM 1.1.1 SeriesCatalog table as the ActionID
------------------------------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.Actions ON; 
INSERT INTO ODM2.ODM2Core.Actions (ActionID, ActionTypeCV, MethodID, BeginDateTime, BeginDateTimeUTCOffset, EndDateTime, EndDateTimeUTCOffset, ActionDescription, ActionFileLink)
SELECT DISTINCT sc.SeriesID AS ActionID, 'Observation Action' AS ActionTypeCV, sc.MethodID, sc.BeginDateTime, 
	CONVERT(integer, 24.0*CONVERT(decimal(10,5), sc.BeginDateTime - sc.BeginDateTimeUTC)) AS BeginDateTimeUTCOffset, 
	sc.EndDateTime, CONVERT(integer, 24.0*CONVERT(decimal(10,5), sc.EndDateTime - sc.EndDateTimeUTC)) AS EndDateTimeUTCOffset, 
	'Sensor deployment and observation' AS ActionDescription, NULL AS ActionFileLink
FROM LittleBearRiverODM.dbo.SeriesCatalog sc, LittleBearRiverODM.dbo.DataValues dv
WHERE sc.SiteID = dv.SiteID AND sc.VariableID = dv.VariableID AND sc.MethodID = dv.MethodID AND sc.SourceID = dv.SourceID AND sc.QualityControlLevelID = dv.QualityControlLevelID AND dv.SampleID IS NULL
ORDER BY ActionID;
SET IDENTITY_INSERT ODM2.ODM2Core.Actions OFF;

---------------------------------------------------------------------------------------------------------
--Populate the ODM2Core.ActionBy table to caputure the "Observer" for sensor-based time series data
--NOTES:
--1.  This uses the contact person from the Sources table in ODM 1.1 associated with the time series
--2.  It is assumed that the contact person from the ODM 1.1 Sources table is the ActionLead and Observer
--3.  Uses the SeriesID from the ODM 1.1 database as the ActionID
---------------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.ActionBy (ActionID, AffiliationID, IsActionLead, RoleDescription)
SELECT act.ActionID, aff.AffiliationID, 1 AS IsActionLead, 'Observer' AS RoleDescription
FROM ODM2.ODM2Core.Actions act, LittleBearRiverODM.dbo.SeriesCatalog sc, ODM2.ODM2Core.Affiliations aff
WHERE act.ActionID = sc.SeriesID AND sc.SourceID = aff.OrganizationID

---------------------------------------------------------------------------------------------------------
--Populate the ODM2Core.FeatureAction table
--NOTES:
--1.  This uses the SiteID from ODM 1.1 as the FeatureID
--2.  Uses the SeriesID from the ODM 1.1 database as the ActionID
---------------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.FeatureActions (SamplingFeatureID, ActionID)
SELECT DISTINCT sc.SiteID AS SamplingFeatureID, sc.SeriesID AS ActionID
FROM LittleBearRiverODM.dbo.SeriesCatalog sc, LittleBearRiverODM.dbo.DataValues dv
WHERE sc.SiteID = dv.SiteID AND sc.VariableID = dv.VariableID AND sc.MethodID = dv.MethodID AND sc.SourceID = dv.SourceID AND sc.QualityControlLevelID = dv.QualityControlLevelID AND dv.SampleID IS NULL 
ORDER BY SamplingFeatureID, ActionID;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Results table for sensor-based time series data
--NOTES:  
--1.  This uses the SeriesIDs from the ODM 1.1 SeriesCatalog table as the ResultID
--2.  The ResultDateTime is set to the current system date (e.g., the time that the result was added to the database)
--3.  ValidDateTime is set to NULL as it is not relevant for any of the results
--4.  Status is set to 'Unknown' - this may not be correct for all time series, but isn't present in ODM 1.1
--5.  IntendedObservationSpacing is set to 'Unknown'
--------------------------------------------------------------------------------------
--Enter a record into the ResultTypeCV table for a Time Series Result
INSERT INTO ODM2.ODM2Results.ResultTypeCV (ResultTypeCV, ResultTypeCategory, DataType, ResultTypeDefinition, FixedDimensions, VaryingDimensions, SpaceMeasurementFramework, TimeMeasurementFramework,
	VariableMeasurementFramework)
Values('Time Series Coverage', 'Coverage', 'Float', 'A series of ResultValues for a single Variable, measured on or at a single SamplingFeature of fixed location, using a single Method, with specific Units, having a specific ProcessingLevel, but measured over time.',
	'X, Y, Z', 't', 'Fixed', 'Controlled', 'Measured')	
--Set the default value of the ResultUUID attribute to NEWSQUENTIALID() so the GUID is automatically generated
ALTER TABLE ODM2.ODM2Core.Results ADD CONSTRAINT DF_ResultUUID DEFAULT NEWSEQUENTIALID() FOR ResultUUID;
--Now add the records to the Result table
SET IDENTITY_INSERT ODM2.ODM2Core.Results ON; 
INSERT INTO ODM2.ODM2Core.Results (ResultID, FeatureActionID, ResultTypeCV, VariableID, UnitsID, TaxonomicClassifierID, ProcessingLevelID, ResultDateTime, 
	ResultDateTimeUTCOffset, ValidDateTime, ValidDateTimeUTCOffset, StatusCV, SampledMediumCV, ValueCount, IntendedObservationSpacing)
SELECT DISTINCT sc.SeriesID AS ResultID, fa.FeatureActionID, 'Time Series Coverage' AS ResultTypeCV, sc.VariableID, sc.VariableUnitsID AS UnitsID, 
	NULL AS TaxonomicClassifierID, sc.QualityControlLevelID AS ProcessingLevelID, GETDATE() AS ResultDateTime, CONVERT(integer, 24.0*CONVERT(decimal(10,5), GETDATE() - GETUTCDATE())) AS ResultDateTimeUTCOffset, 
	NULL AS ValidDateTime, NULL AS ValidDateTimeUTCOffset, 'Unknown' AS StatusCV, sc.SampleMedium AS SampledMediumCV, sc.ValueCount, 'Unknown' AS IntendedObservationSpacing
FROM LittleBearRiverODM.dbo.SeriesCatalog sc, LittleBearRiverODM.dbo.DataValues dv, ODM2.ODM2Core.FeatureActions fa
WHERE sc.SiteID = dv.SiteID AND sc.VariableID = dv.VariableID AND sc.MethodID = dv.MethodID AND sc.SourceID = dv.SourceID AND sc.QualityControlLevelID = dv.QualityControlLevelID 
	AND fa.SamplingFeatureID = sc.SiteID AND fa.ActionID = sc.SeriesID AND dv.SampleID IS NULL
ORDER BY ResultID;
SET IDENTITY_INSERT ODM2.ODM2Core.Results OFF;

---------------------------------------------------------------------------------------------------------------------------------
--Populate the ODM2Results.TimeSeriesResults table for sensor-based time series data
--NOTES:  
--1.  This uses the SeriesIDs from the ODM 1.1 SeriesCatalog as the ResultID
--2.  This adds everything from the ODM database into the TimeSeriesResults table except those DataValues that have SampleIDs
--3.  This assumes that values in the ODM database only have Z offsets, which could be wrong for many series
---------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Results.TimeSeriesResults (ResultID, XLocation, XLocationUnitsID, YLocation, YLocationUnitsID, ZLocation, ZLocationUnitsID,
	SpatialReferenceID, IntendedTimeSpacing, IntendedTimeSpacingUnitsID, AggregationStatisticCV)
SELECT sq.SeriesID AS ResultID, NULL AS XLocation, NULL AS XLocationUnitsID, NULL AS YLocation, NULL AS YLocationUnitsID, sq.OffsetValue AS ZLocation, 
	ot.OffsetUnitsID AS ZLocationUnitsID, sr.SpatialReferenceID AS SpatialReferenceID, NULL AS IntendedTimeSpacing, NULL AS IntendedTimeSpacingUnitsID,
	sq.DataType AS AggregationStatisticCV 
FROM (SELECT DISTINCT sc.SeriesID, sc.DataType, dv.OffsetValue, dv.OffsetTypeID 
		FROM LittleBearRiverODM.dbo.SeriesCatalog sc, LittleBearRiverODM.dbo.DataValues dv
		WHERE sc.SiteID = dv.SiteID AND sc.VariableID = dv.VariableID AND sc.MethodID = dv.MethodID AND sc.SourceID = dv.SourceID 
			AND sc.QualityControlLevelID = dv.QualityControlLevelID AND dv.SampleID IS NULL) AS sq
LEFT JOIN LittleBearRiverODM.dbo.OffsetTypes ot ON sq.OffsetTypeID = ot.OffsetTypeID
LEFT JOIN ODM2.ODM2SamplingFeatures.SpatialReferences sr ON ot.OffsetDescription = sr.SRSName
ORDER BY ResultID;		

---------------------------------------------------------------------------------------------------------------------------------
--Populate the ODM2Results.TimeSeriesResultValues table for sensor-based time series data
--NOTES:  
--1.  This uses the SeriesIDs from the ODM 1.1 SeriesCatalog as the ResultID
--2.  This adds everything from the ODM database into the TimeSeriesValues table except those DataValues that have SampleIDs
--3.  This assumes that values in the ODM database only have Z offsets, which could be wrong for many series
--4.  I am preserving ValueIDs from the ODM 1.1 database so I can go back later and add annotations for Qualifiers
---------------------------------------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Results.TimeSeriesResultValues ON;
INSERT INTO ODM2.ODM2Results.TimeSeriesResultValues (ValueID, ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, CensorCodeCV, 
	QualityCodeCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
SELECT dv.ValueID, sc.SeriesID AS ResultID, dv.DataValue, dv.LocalDateTime AS ValueDateTime, dv.UTCOffset AS ValueDateTimeUTCOffset, 
	dv.CensorCode AS CensorCodeCV, 'Unknown' AS QualityCodeCV, sc.TimeSupport AS TimeAggregationInterval, sc.TimeUnitsID AS TimeAggregationIntervalUnitsID
FROM LittleBearRiverODM.dbo.SeriesCatalog sc, LittleBearRiverODM.dbo.DataValues dv
WHERE sc.SiteID = dv.SiteID AND sc.VariableID = dv.VariableID AND sc.MethodID = dv.MethodID AND sc.SourceID = dv.SourceID 
	AND sc.QualityControlLevelID = dv.QualityControlLevelID AND dv.SampleID IS NULL
ORDER BY ResultID, ValueDateTime;
SET IDENTITY_INSERT ODM2.ODM2Results.TimeSeriesResultValues OFF;







--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Populate the ODMCore.SamplingFeatures, ODM2SamplinFeatures.Specimens, ODM2SamplingFeatures.FeatureParents, 
--ODM2Core.Actions, ODM2Core.Results, and ODM2Results.ResultValues tables for sample-based results
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

------------------------------------------------------------------------------------------------------------------------------------------------------------
--Populate the ODM2Core.SamplingFeatures, ODM2SamplingFeatures.Specimens, and ODM2SamplingFeatures.FeatureParents tables with records for the samples
------------------------------------------------------------------------------------------------------------------------------------------------------------
--First, get the maximum SamplingFeatureID, ActionID, and ResultID in the ODM2 database.  I will use these to derive new SamplingFeatureIDs, ActionIDs, and 
--ResultIDs for the Sample-based data
DECLARE @MaxSampleID AS int;
SELECT @MaxSampleID = MAX(SampleID) FROM LittleBearRiverODM.dbo.Samples;
DECLARE @MaxSamplingFeatureID AS int;
SELECT @MaxSamplingFeatureID = MAX(SamplingFeatureID) FROM ODM2.ODM2Core.SamplingFeatures;
DECLARE @MaxActionID AS int;
SELECT @MaxActionID = MAX(ActionID) FROM ODM2.ODM2Core.Actions;
DECLARE @MaxResultID AS int;
SELECT @MaxResultID = MAX(ResultID) FROM ODM2.ODM2Core.Results;

--------------------------------------------------------------------------------------------------------------------------------
--Create a teporary table with the information that is needed to populate tables with information for the water quality samples
--------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT dv.ValueID, smp.SampleID, smp.SampleID + @MaxSamplingFeatureID AS SamplingFeatureID, smp.SampleID + @MaxActionID AS CollectionActionID, 
	(smp.SampleID + @MaxSampleID + @MaxActionID) AS AnalysisActionID, @MaxResultID + dv.ValueID AS ResultID, smp.LabMethodID, 'Specimen' AS SamplingFeatureTypeCV, smp.LabSampleCode AS SamplingFeatureName,
	NULL AS SamplingFeatureGeoTypeCV, NULL AS SpatialReferenceID, NULL AS FeatureGeometry, 'Water Quality Sample' AS SamplingFeatureDescription, 
	smp.SampleType AS SpecimenTypeCV, smp.LabSampleCode AS SpecimenCode, vr.SampleMedium AS SpecimenMediumCV, 1 AS IsFieldSpecimen, st.SiteID
INTO #TempSpecimenInfo
FROM LittleBearRiverODM.dbo.Samples smp, LittleBearRiverODM.dbo.DataValues dv, LittleBearRiverODM.dbo.Variables vr, LittleBearRiverODM.dbo.Sites st
WHERE smp.SampleID = dv.SampleID AND dv.VariableID = vr.VariableID AND dv.SiteID = st.SiteID

-------------------------------------------------------------------------------
--Insert the records for the Specimens in the ODM2Core.SamplingFeature table 
-------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.SamplingFeatures ON;
INSERT INTO ODM2.ODM2Core.SamplingFeatures (SamplingFeatureID, SamplingFeatureTypeCV, SamplingFeatureName, SamplingFeatureGeoTypeCV, SpatialReferenceID, FeatureGeometry, SamplingFeatureDescription)
SELECT SamplingFeatureID, SamplingFeatureTypeCV, SamplingFeatureName, SamplingFeatureGeoTypeCV, SpatialReferenceID, NULL AS FeatureGeometry, SamplingFeatureDescription
FROM #TempSpecimenInfo 
ORDER BY SamplingFeatureID;
SET IDENTITY_INSERT ODM2.ODM2Core.SamplingFeatures OFF;

-------------------------------------------------------------------------------
--Insert records into the ODM2SamplingFeatures.Specimens table for the samples
-------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2SamplingFeatures.Specimens (SamplingFeatureID, SpecimenTypeCV, SpecimenCode, SpecimenMediumCV, IsFieldSpecimen)
SELECT SamplingFeatureID, SpecimenTypeCV, SpecimenCode, SpecimenMediumCV, IsFieldSpecimen
FROM #TempSpecimenInfo
ORDER BY SamplingFeatureID;

-----------------------------------------------------------------------------------------------------------------------------------------------
--Populate the ODM2SamplingFeatures.FeatureParents table to associate the Specimen SamplingFeautres with the Site at which they were collected
-----------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2SamplingFeatures.FeatureParents (SamplingFeatureID, ParentFeatureID, RelationshipTypeCV, SpatialOffsetID)
SELECT SamplingFeatureID, SiteID AS ParentFeatureID, 'wasCollectedAt' AS RelationshipTypeCV, NULL AS SpatialOffsetID
FROM #TempSpecimenInfo 
ORDER BY SamplingFeatureID, ParentFeatureID;

-------------------------------------------------------------------------------------
--Add "Sample collection" Actions to the ODM2Core.Actions table for each specimen
--NOTES:
--1.  Use the "Method" associated with the sample result in ODM 1.1.1
--2.  This works for LBR data because of the way I have specified the Method for 
--    sample-based data values as a sample collection method, but may not work for 
--    all ODM 1.1 databases because others may not have done this.
-------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.Actions ON;
INSERT INTO ODM2.ODM2Core.Actions (ActionID, ActionTypeCV, MethodID, BeginDateTime, BeginDateTimeUTCOffset, EndDateTime, EndDateTimeUTCOffset, 
	ActionDescription, ActionFileLink)
SELECT DISTINCT temp.CollectionActionID AS ActionID, 'Sample collection' AS ActionTypeCV, dv.MethodID, dv.LocalDateTime AS BeginDateTime, 
	dv.UTCOffset AS BeginDateTimeUTCOffset, dv.LocalDateTime AS EndDateTime, dv.UTCOffset AS EndDateTimeUTCOffset, 
	'Sample collection' AS ActionDescription, NULL AS ActionFileLink
FROM LittleBearRiverODM.dbo.DataValues dv, #TempSpecimenInfo temp 
WHERE dv.SampleID = temp.SampleID AND dv.SampleID IS NOT NULL;
SET IDENTITY_INSERT ODM2.ODM2Core.Actions OFF;

------------------------------------------------------------------------------------------------
--Populate the ODM2Core.ActionBy table for the "Sample collection" actions
--NOTES:
--1.  This uses the contact person from the Sources table in ODM 1.1 as the "Sample collector"
------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.ActionBy (ActionID, AffiliationID, IsActionLead, RoleDescription)
SELECT temp.CollectionActionID AS ActionID, aff.AffiliationID, 1 AS IsActionLead, 'Sample collector' AS RoleDescription
FROM #TempSpecimenInfo temp, ODM2.ODM2Core.Affiliations aff, LittleBearRiverODM.dbo.DataValues dv  
WHERE temp.SampleID = dv.SampleID AND dv.SourceID = aff.OrganizationID
ORDER BY ActionID, AffiliationID;

------------------------------------------------------------------------------------------------
--Populate the ODM2Core.FeatureActionResult table for the "Sample collection" actions
------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.FeatureActionResult (SamplingFeatureID, ActionID, ResultID)
SELECT SamplingFeatureID, CollectionActionID AS ActionID, NULL AS ResultID
FROM #TempSpecimenInfo;

------------------------------------------------------------------------------------
--Add "Sample analysis" Actions to the ODM2Core.Actions table for the samples
--NOTE:  
--1.  Use the "LabMethod" associated with the sample result in ODM 1.1
------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.Actions ON;
INSERT INTO ODM2.ODM2Core.Actions (ActionID, ActionTypeCV, MethodID, BeginDateTime, BeginDateTimeUTCOffset, EndDateTime, EndDateTimeUTCOffset, 
	ActionDescription, ActionFileLink)
SELECT DISTINCT temp.AnalysisActionID AS ActionID, 'Sample analysis' AS ActionTypeCV, met.MethodID, dv.LocalDateTime AS BeginDateTime, 
	dv.UTCOffset AS BeginDateTimeUTCOffset, dv.LocalDateTime AS EndDateTime, dv.UTCOffset AS EndDateTimeUTCOffset, 
	'Sample laboratory analysis' AS ActionDescription, NULL AS ActionFileLink
FROM LittleBearRiverODM.dbo.DataValues dv, LittleBearRiverODM.dbo.LabMethods lmet, ODM2.ODM2Core.Methods met, #TempSpecimenInfo temp
WHERE temp.SampleID = dv.SampleID AND temp.LabMethodID = lmet.LabMethodID AND lmet.LabMethodName = met.MethodName;
SET IDENTITY_INSERT ODM2.ODM2Core.Actions OFF;

------------------------------------------------------------------------------------------------
--Populate the ODM2Core.ActionBy table for the "Sample analysis" actions
--NOTES:
--1.  This uses the contact person from the Sources table in ODM 1.1 as the "Sample collector"
------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.ActionBy (ActionID, AffiliationID, IsActionLead, RoleDescription)
SELECT temp.AnalysisActionID AS ActionID, aff.AffiliationID, 1 AS IsActionLead, 'Analyst' AS RoleDescription
FROM #TempSpecimenInfo temp, ODM2.ODM2Core.Affiliations aff, LittleBearRiverODM.dbo.DataValues dv  
WHERE temp.SampleID = dv.SampleID AND dv.SourceID = aff.OrganizationID
ORDER BY ActionID, AffiliationID;

--------------------------------------------------------------------------------------------------
--Add records to the ODM2Core.Results table for measurements resulting from Specimens  
--NOTES:
--1.  The ResultType will be "Measurement" and there will be at least one Result for every sample
--2.  The ResultDateTime will be set to the LocalDateTime in the ODM 1.1 DataValues table.
--3.  Set Status = "Complete" for now 
--------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.Results ON;
INSERT INTO ODM2.ODM2Core.Results (ResultID, ResultTypeCV, VariableID, UnitsID, TaxonomicClassifierID, QualityControlLevelID, ResultDateTime, ResultDateTimeUTCOffset, 
	ValidDateTime, ValidDateTimeUTCOffset, StatusCV, SampledMediumCV, ValueCount, IntendedObservationSpacing)
SELECT temp.ResultID, 'Measurement' AS ResultTypeCV, dv.VariableID, vbl.VariableUnitsID AS UnitsID, NULL AS TaxonomicClassifierID, dv.QualityControlLevelID, 
	dv.LocalDateTime AS ResultDateTime, dv.UTCOffset AS ResultDateTimeUTCOffset, NULL AS ValidDateTime, NULL AS ValidDateTimeUTCOffset, 
	'Complete' AS StatusCV, vbl.SampleMedium AS SampledMediumCV, 1 AS ValueCount, 'Unknown' AS IntendedObservationSpacing
FROM LittleBearRiverODM.dbo.DataValues dv, LittleBearRiverODM.dbo.Variables vbl, #TempSpecimenInfo AS temp
WHERE dv.SampleID = temp.SampleID AND dv.VariableID = vbl.VariableID
ORDER BY ResultID;
SET IDENTITY_INSERT ODM2.ODM2Core.Results OFF;

------------------------------------------------------------------------------------------------
--Populate the ODM2Core.FeatureActionResult table for the "Sample analysis" actions
------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.FeatureActionResult (SamplingFeatureID, ActionID, ResultID)
SELECT SamplingFeatureID, AnalysisActionID AS ActionID, ResultID
FROM #TempSpecimenInfo;

-------------------------------------------------------------------------------------------------------
--Populate the ODM2Core.RelatedActions table for the "Sample collection" and "Sample analysis" actions
-------------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.RelatedActions (ActionID, RelatedActionID, RelationshipTypeCV)
SELECT CollectionActionID, AnalysisActionID, 'isSampleCollectionFor' AS RelationshipTypeCV
FROM #TempSpecimenInfo

---------------------------------------------------------------------------------------------------------------------
--Populate the ODM2.ODM2Results.ResultValues table for sample-based data
--NOTES:  
--1.  This adds DataValues to the ODM2.ODM2Results.ResultValues table only if they have an associated SampleID
--2.  This assumes that values in the ODM database only have Z offsets, which could be wrong for many data values
--3.  I am preserving ValueIDs from the ODM 1.1 database so I can go back later and add annotations for Qualifiers
---------------------------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Results.ResultValues ON;
INSERT INTO ODM2.ODM2Results.ResultValues (ValueID, ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, OffsetOriginID, ValueXLocation, 
	ValueYLocation, ValueZLocation, CensorCodeCV, QualityCodeCV, AggregationDuration, InterpolationTypeCV)
SELECT dv.ValueID, temp.ResultID, dv.DataValue, dv.LocalDateTime AS ValueDateTime, dv.UTCOffset AS ValueDateTimeUTCOffset, 
	dv.OffsetTypeID AS OffsetOriginID, NULL AS ValueXLocation, NULL AS ValueYLocation, dv.OffsetValue AS ValueZLocation, 
	dv.CensorCode AS CensorCodeCV, NULL AS QualityCodeCV, CAST(vbl.TimeSupport AS VARCHAR(5)) + ' ' + unt.UnitsName AS AggregationDuration, 
	vbl.DataType AS InterpolationTypeCV 
FROM LittleBearRiverODM.dbo.DataValues dv, LittleBearRiverODM.dbo.Variables vbl, LittleBearRiverODM.dbo.Units unt, #TempSpecimenInfo temp
WHERE dv.VariableID = vbl.VariableID AND vbl.TimeUnitsID = unt.UnitsID AND dv.ValueID = temp.ValueID 
ORDER BY ResultID, ValueDateTime;
SET IDENTITY_INSERT ODM2.ODM2Results.ResultValues OFF;

--Drop the temp table that is no longer needed
DROP TABLE #TempSpecimenInfo;

------------------------------------------------------------------------------------------------------------------
--Add the qualifiers from ODM 1.1 to the ODM2.ODM2Annotations.Annotations and ODM2.ODM2Annotations.Annotations
------------------------------------------------------------------------------------------------------------------
--Add the qulifiers from ODM 1.1 to ODM2.ODM2Annotations.Annotations table
SET IDENTITY_INSERT ODM2.ODM2Annotations.Annotations ON;
INSERT INTO ODM2.ODM2Annotations.Annotations (AnnotationID, AnnotationTypeCV, AnnotationCode, AnnotationText, AnnotationDateTime, AnnotationUTCOffset, AnnotatorID)
SELECT QualifierID AS AnnotationID, 'Data Value Qualifier' AS AnnotationTypeCV, QualifierCode AS AnnotationCode, 
	CAST(QualifierDescription AS NVARCHAR(500)) AS AnnotationText, NULL AS AnnotationDateTime, NULL AS AnnotationUTCOffset,
	NULL AS AnnotatorID
FROM LittleBearRiverODM.dbo.Qualifiers
ORDER BY AnnotationID;
SET IDENTITY_INSERT ODM2.ODM2Annotations.Annotations OFF;

--Add the records to the ODM2.ODM2Annotations.ResultValueAnnotations table
INSERT INTO ODM2.ODM2Annotations.ResultValueAnnotations (ValueID, AnnotationID)
SELECT ValueID, QualifierID AS AnnotationID
FROM LittleBearRiverODM.dbo.DataValues
WHERE QualifierID IS NOT NULL
ORDER BY ValueID;