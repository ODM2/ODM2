--------------------------------------------------------------------------------------
--Populate the SamplingFeature tables
--NOTES:
--1.  Uses the SiteIDs from the existing ODM database to populate SamplingFeatureID and SiteID.  
--2.  This requires the ODM2 database to be empty to begin with.
--3.  Currently uses the LatLongDatumID as SpatialReferenceID
--------------------------------------------------------------------------------------

--Populate the ODM2SamplingFeatures.SpatialReferences table
SET IDENTITY_INSERT ODM2.ODM2SamplingFeatures.SpatialReferences ON;
INSERT INTO ODM2.ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID, SRSID, SRSName, Notes)
SELECT SpatialReferenceID, SRSID, SRSName, CAST(Notes AS VARCHAR(500))
FROM LittleBearRiverODM.dbo.SpatialReferences
ORDER BY SpatialReferenceID;
SET IDENTITY_INSERT ODM2.ODM2SamplingFeatures.SpatialReferences OFF;

--Populate the ODM2Core.SamplingFeatures table with records for the sites
--First, make sure the data type of the FeatureGeometry field is correct - for now using Geography type in SQL Server
ALTER TABLE ODM2.ODM2Core.SamplingFeatures DROP COLUMN FeatureGeometry;
ALTER TABLE ODM2.ODM2Core.SamplingFeatures ADD FeatureGeometry geometry NULL;
GO
--Now add the sites 
SET IDENTITY_INSERT ODM2.ODM2Core.SamplingFeatures ON; 
INSERT INTO ODM2.ODM2Core.SamplingFeatures (SamplingFeatureID, SamplingFeatureTypeCV, SamplingFeatureUniqueID, SamplingFeatureUniqueIDTypeCV, SpatialReferenceID, FeatureGeometry)
SELECT s.SiteID AS SamplingFeatureID, 'Site' AS SamplingFeatureTypeCV, NULL AS SamplingFeatureUniqueID, NULL AS SamplingFeatureUniqueIDTypeCV, s.LatLongDatumID AS SpatialReferenceID, 
	geometry::Point(s.Longitude, s.Latitude, sr.SRSID) AS FeatureGeometry
FROM LittleBearRiverODM.dbo.Sites s, LittleBearRiverODM.dbo.SpatialReferences sr
WHERE s.LatLongDatumID = sr.SpatialReferenceID
ORDER BY SamplingFeatureID;
SET IDENTITY_INSERT ODM2.ODM2Core.SamplingFeatures OFF;

--Populate the ODM2SamplingFeatures.Sites table
SET IDENTITY_INSERT ODM2.ODM2SamplingFeatures.Sites ON;
INSERT INTO ODM2.ODM2SamplingFeatures.Sites (SiteID, SamplingFeatureID, SiteCode, SiteName, Latitude, Longitude, LatLongDatumID, Elevation_m, VerticalDatumCV, SiteTypeCV)
SELECT SiteID, SiteID AS SamplingFeatureID, SiteCode, SiteName, Latitude, Longitude, LatLongDatumID, Elevation_m, VerticalDatum AS VerticalDatumCV, SiteType AS SiteTypeCV
FROM LittleBearRiverODM.dbo.Sites 
ORDER BY SiteID;
SET IDENTITY_INSERT ODM2.ODM2SamplingFeatures.Sites OFF;

--Populate the ODM2Core.SamplingFeatures, ODM2SamplingFeatures.Specimens, and ODM2SamplingFeatures.FeatureParents tables with records for the samples
--NOTES:
--1.  This uses the SampleIDs from the original ODM 1.1 database as the SpecimenIDs
--First, get the maximum SamplingFeatureID in the ODM2 database
DECLARE @MaxSamplingFeatureID AS int;
SELECT @MaxSamplingFeatureID = MAX(SamplingFeatureID) FROM ODM2.ODM2Core.SamplingFeatures;
--Create a teporary table with the information that is needed.
SELECT DISTINCT smp.SampleID AS SpecimenID, smp.SampleID + @MaxSamplingFeatureID AS SamplingFeatureID, 'Specimen' AS SamplingFeatureTypeCV, 
	NULL AS SamplingFeatureUniqueID, NULL AS SamplingFeatureUniqueIDTypeCV, NULL AS SpatialReferenceID, NULL AS FeatureGeometry,
	smp.LabSampleCode AS SpecimenUniqueID, 'Lab Sample Code' AS SpecimenUniqueIDTypeCV, 1 AS IsFieldSpecimen, smp.SampleType AS SpecimenTypeCV, 
	vr.SampleMedium AS SpecimenMediumCV, st.SiteID
INTO #TempSpecimenInfo
FROM LittleBearRiverODM.dbo.Samples smp, LittleBearRiverODM.dbo.DataValues dv, LittleBearRiverODM.dbo.Variables vr, LittleBearRiverODM.dbo.Sites st
WHERE smp.SampleID = dv.SampleID AND dv.VariableID = vr.VariableID AND dv.SiteID = st.SiteID

--Insert the records for the specimens in the ODM2Core.SamplingFeature table using the SampleID + the max SamplingFeatureID as the SamplingFeatureID
SET IDENTITY_INSERT ODM2.ODM2Core.SamplingFeatures ON;
INSERT INTO ODM2.ODM2Core.SamplingFeatures (SamplingFeatureID, SamplingFeatureTypeCV, SamplingFeatureUniqueID, SamplingFeatureUniqueIDTypeCV, SpatialReferenceID, FeatureGeometry)
SELECT SamplingFeatureID, SamplingFeatureTypeCV, SamplingFeatureUniqueID, SamplingFeatureUniqueIDTypeCV, SpatialReferenceID, NULL AS FeatureGeometry
FROM #TempSpecimenInfo 
ORDER BY SamplingFeatureID;
SET IDENTITY_INSERT ODM2.ODM2Core.SamplingFeatures OFF;
--Insert records into the ODM2SamplingFeatures.Specimens table for the samples
SET IDENTITY_INSERT ODM2.ODM2SamplingFeatures.Specimens ON;
INSERT INTO ODM2.ODM2SamplingFeatures.Specimens (SpecimenID, SamplingFeatureID, SpecimenUniqueID, SpecimenUniqueIDTypeCV, IsFieldSpecimen, SpecimenTypeCV, SpecimenMediumCV)
SELECT SpecimenID, SamplingFeatureID, SpecimenUniqueID, SpecimenUniqueIDTypeCV, IsFieldSpecimen, SpecimenTypeCV, SpecimenMediumCV
FROM #TempSpecimenInfo
ORDER BY SpecimenID;
SET IDENTITY_INSERT ODM2.ODM2SamplingFeatures.Specimens OFF;
--Populate the ODM2SamplingFeatures.FeatureParents table to associate the specimen sampling features with the site at which they were collected
INSERT INTO ODM2.ODM2SamplingFeatures.FeatureParents (SamplingFeatureID, ParentFeatureID, RelationshipTypeCV, SpatialOffsetID)
SELECT SamplingFeatureID, SiteID AS ParentFeatureID, 'Specimen collected at parent site' AS RelationshipTypeCV, NULL AS SpatialOffsetID
FROM #TempSpecimenInfo 
ORDER BY SamplingFeatureID, ParentFeatureID;
--Drop the temp table
DROP TABLE #TempSpecimenInfo;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Units table
--------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.Units ON; 
INSERT INTO ODM2.ODM2Core.Units (UnitsID, UnitsName, UnitsTypeCV, UnitsAbbreviation)
SELECT UnitsID, UnitsName, UnitsType AS UnitsTypeCV, UnitsAbbreviation 
FROM LittleBearRiverODM.dbo.Units 
ORDER BY UnitsID;
SET IDENTITY_INSERT ODM2.ODM2Core.Units OFF;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.QualityControlLevels table
--------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.QualityControlLevels ON; 
INSERT INTO ODM2.ODM2Core.QualityControlLevels (QualityControlLevelID, QualityControlLevelCode, Definition, Explanation)
SELECT QualityControlLevelID, QualityControlLevelCode, Definition, Explanation 
FROM LittleBearRiverODM.dbo.QualityControlLevels 
ORDER BY QualityControlLevelID;
SET IDENTITY_INSERT ODM2.ODM2Core.QualityControlLevels OFF;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Variables table
--------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.Variables ON; 
INSERT INTO ODM2.ODM2Core.Variables (VariableID, VariableCode, VariableNameCV, VariableDefinition, VariableTypeCV, SpeciationCV, 
	ValueTypeCV, DataTypeCV, NoDataValue)
SELECT VariableID, VariableCode, VariableName AS VariableNameCV, NULL AS VariableDefinition, 'Unknown' AS VariableTypeCV, Speciation AS SpeciationCV, 
	ValueType AS ValueTypeCV, DataType as DataTypeCV, NoDataValue 
FROM LittleBearRiverODM.dbo.Variables 
ORDER BY VariableID;
SET IDENTITY_INSERT ODM2.ODM2Core.Variables OFF;

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Methods table 
--------------------------------------------------------------------------------------
--Load the Methods from ODM 1.1 - can just move these straight across and use the same IDs
SET IDENTITY_INSERT ODM2.ODM2Core.Methods ON; 
INSERT INTO ODM2.ODM2Core.Methods (MethodID, MethodUniqueID, MethodUniqueIDTypeCV, MethodCode, MethodName, MethodDescription, 
	MethodTypeCV, OrganizationID, MethodLink)
SELECT MethodID, NULL AS MethodUniqueID, NULL AS MethodUniqueIDTypeCV, MethodID AS MethodCode, MethodDescription AS MethodName, 
	MethodDescription, 'Unknown' AS MethodTypeCV, NULL AS OrganizationID, MethodLink 
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
INSERT INTO ODM2.ODM2Core.Organizations (OrganizationID, OrganizationUniqueID, OrganizationUniqueIDTypeCV, OrganizationCode, 
	OrganizationName, OrganizationDescription, OrganizationTypeCV, OrganizationLink, ParentOrganizationID)
SELECT SourceID AS OrganizationID, NULL AS OrganizationUniqueID, NULL AS OrganizationUniqueIDTypeCV, SourceID AS OrganizationCode, 
	Organization AS OrganizationName, CAST(SourceDescription AS VARCHAR(500)) AS OrganizationDescription, 'Research Institute' AS OrganizationTypeCV, 
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
  CAST(SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS VARCHAR(50)) AS PersonFirstName,
  CAST(SUBSTRING(ContactName, CHARINDEX(' ', ContactName) + 1, 8000) AS VARCHAR(50)) AS PersonLastName
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
INSERT INTO ODM2.ODM2Core.Organizations (OrganizationUniqueID, OrganizationUniqueIDTypeCV, OrganizationCode, OrganizationName, 
	OrganizationDescription, OrganizationTypeCV, OrganizationLink, ParentOrganizationID)
SELECT DISTINCT NULL AS OrganizationUniqueID, NULL AS OrganizationUniqueIDTypeCV, LabName AS OrganizationCode, LabName AS OrganizationName, 
	LabOrganization AS OrganizationDescription, 'Analytical Laboratory' AS OrganizationTypeCV, NULL AS OrganizationLink, NULL AS ParentOrganizationID 
FROM LittleBearRiverODM.dbo.LabMethods;
--Create a temporary table that will make this easier
SELECT DISTINCT lm.LabMethodID + @MaxMethodID + 1 AS MethodID, NULL AS MethodUniqueID, NULL AS MethodUniqueIDTypeCV, lm.LabMethodID + @MaxMethodID + 1 AS MethodCode, 
	lm.LabMethodName AS MethodName, lm.LabMethodDescription AS MethodDescription, 'Laboratory Analytical Method' AS MethodTypeCV, org.OrganizationID,
	lm.LabMethodLink AS MethodLink	
INTO #TempLabMethodInfo
FROM LittleBearRiverODM.dbo.LabMethods lm, ODM2.ODM2Core.Organizations org
WHERE lm.LabName = org.OrganizationName AND org.OrganizationID > @MaxOrganizationID;
--Add the LabMethods from ODM 1.1 to the ODM2 Methods table
SET IDENTITY_INSERT ODM2.ODM2Core.Methods ON; 
INSERT INTO ODM2.ODM2Core.Methods (MethodID, MethodUniqueID, MethodUniqueIDTypeCV, MethodCode, MethodName, MethodDescription, MethodTypeCV, OrganizationID, MethodLink)
SELECT MethodID, MethodUniqueID, MethodUniqueIDTypeCV, MethodCode, MethodName, MethodDescription, MethodTypeCV,	OrganizationID, MethodLink 
FROM #TempLabMethodInfo 
ORDER BY MethodID;
SET IDENTITY_INSERT ODM2.ODM2Core.Methods OFF;
--Drop the temp table
DROP TABLE #TempLabMethodInfo;

--------------------------------------------------------------------------------------
--Populate the ODM2Results.OffsetOrigins table
--NOTES:  
--1.  This table is the same across all types of Actions and Results
--2.  This table takes the place of OffsetTypes in ODM 1.1.1
--------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Results.OffsetOrigins ON;
INSERT INTO ODM2.ODM2Results.OffsetOrigins (OffsetOriginID, OffsetOriginDescription, OffsetCoordinateUnitsID)
SELECT OffsetTypeID AS OffsetOriginID, OffsetDescription AS OffsetOriginDescription, OffsetUnitsID AS OffsetCoordinateUnitsID
FROM LittleBearRiverODM.dbo.OffsetTypes
ORDER BY OffsetOriginID;
SET IDENTITY_INSERT ODM2.ODM2Results.OffsetOrigins OFF;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Populate the ODM2Core.Actions, ODM2Core.Results, and ODM2Results.ResultValues tables for sensor-based time series data
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

------------------------------------------------------------------------------------------------------------------------
--Add records to the ODM2Core.Actions table for "Observation Act" Actions associated with sensor-based time series data
--NOTES:  
--1.  This uses the SeriesIDs from the ODM 1.1.1 SeriesCatalog table as the ActionID
------------------------------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.Actions ON; 
INSERT INTO ODM2.ODM2Core.Actions (ActionID, ActionTypeCV, BeginDateTime, BeginDateTimeUTCOffset, EndDateTime, EndDateTimeUTCOffset, MethodID, SamplingFeatureID, DirectiveID, ActionNotes, ParentActionID)
SELECT DISTINCT sc.SeriesID AS ActionID, 'Observation Act' AS ActionTypeCV, sc.BeginDateTime, CONVERT(integer, 24.0*CONVERT(decimal(10,5), sc.BeginDateTime - sc.BeginDateTimeUTC)) AS BeginDateTimeUTCOffset, 
	sc.EndDateTime, CONVERT(integer, 24.0*CONVERT(decimal(10,5), sc.EndDateTime - sc.EndDateTimeUTC)) AS EndDateTimeUTCOffset, sc.MethodID, sc.SiteID AS SamplingFeatureID, NULL AS DirectiveID, 
	NULL AS ActionNotes, NULL AS ParentActionID
FROM LittleBearRiverODM.dbo.SeriesCatalog sc, LittleBearRiverODM.dbo.DataValues dv
WHERE sc.SiteID = dv.SiteID AND sc.VariableID = dv.VariableID AND sc.MethodID = dv.MethodID AND sc.SourceID = dv.SourceID AND sc.QualityControlLevelID = dv.QualityControlLevelID AND dv.SampleID IS NULL
ORDER BY ActionID;
SET IDENTITY_INSERT ODM2.ODM2Core.Actions OFF;

---------------------------------------------------------------------------------------------------------
--Populate the ODM2Core.ActionPeople table to caputure the "Observer" for sensor-based time series data
--NOTES:
--1.  This uses the contact person from the Sources table in ODM 1.1 associated with the time series
--2.  For now the RoleID is hard coded
--3.  It is assumed that the contact person from the ODM 1.1 Sources table is the ActionLead
---------------------------------------------------------------------------------------------------------
--Create the record in the ODM2.Roles table for the "Observer" role
SET IDENTITY_INSERT ODM2.ODM2Core.Roles ON;
INSERT INTO ODM2.ODM2Core.Roles (RoleID, RoleDescription)
VALUES(1,'Observer');
SET IDENTITY_INSERT ODM2.ODM2Core.Roles OFF;
--Create the records in the ODM2Core.ActionPeople table for the time series
--Uses the SeriesID from the ODM 1.1 database as the ActionID
--Uses the contact person from the ODM 1.1 database as the "Observer"
INSERT INTO ODM2.ODM2Core.ActionPeople (ActionID, AffiliationID, IsActionLead, RoleID)
SELECT act.ActionID, aff.AffiliationID, 1 AS IsActionLead, 1 AS RoleID
FROM ODM2.ODM2Core.Actions act, LittleBearRiverODM.dbo.SeriesCatalog sc, ODM2.ODM2Core.Affiliations aff
WHERE act.ActionID = sc.SeriesID AND sc.SourceID = aff.OrganizationID

--------------------------------------------------------------------------------------
--Populate the ODM2Core.Results table for sensor-based time series data
--NOTES:  
--1.  This uses the SeriesIDs from the ODM 1.1.1 SeriesCatalog table the ResultID
--2.  The ResultDateTime is set to the current system date (e.g., the time that the result was added to the database)
--3.  ValidDateTime is set to NULL as it is not relevant for any of the results
--4.  Status is set to 'Complete' - this may not be correct for all time series
--------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Core.Results ON; 
INSERT INTO ODM2.ODM2Core.Results (ResultID, ResultTypeCV, ActionID, VariableID, UnitsID, QualityControlLevelID, ResultDateTime, ResultDateTimeUTCOffset, ValidDateTime, ValidDateTimeUTCOffset, StatusCV, SampledMediumCV, ValueCount, IntendedObservationSpacing)
SELECT DISTINCT sc.SeriesID AS ResultID, 'Time Series Coverage' AS ResultTypeCV, sc.SeriesID AS ActionID, sc.VariableID, sc.VariableUnitsID AS UnitsID, sc.QualityControlLevelID, GETDATE() AS ResultDateTime, CONVERT(integer, 24.0*CONVERT(decimal(10,5), GETDATE() - GETUTCDATE())) AS ResultDateTimeUTCOffset, NULL AS ValidDateTime, NULL AS ValidDateTimeUTCOffset, 'Complete' AS StatusCV, sc.SampleMedium AS SampledMediumCV, sc.ValueCount, 'Unknown' AS IntendedObservationSpacing
FROM LittleBearRiverODM.dbo.SeriesCatalog sc, LittleBearRiverODM.dbo.DataValues dv 
WHERE sc.SiteID = dv.SiteID AND sc.VariableID = dv.VariableID AND sc.MethodID = dv.MethodID AND sc.SourceID = dv.SourceID AND sc.QualityControlLevelID = dv.QualityControlLevelID AND dv.SampleID IS NULL
ORDER BY ResultID;
SET IDENTITY_INSERT ODM2.ODM2Core.Results OFF;

---------------------------------------------------------------------------------------------------------------------------------
--Populate the ODM2Results.ResultValues table for sensor-based time series data
--NOTES:  
--1.  This uses the SeriesIDs from the ODM 1.1.1 SeriesCatalog as the ResultID
--2.  This adds everything from the ODM database into the TimeSeriesValues table except those DataValues that have SampleIDs
--3.  This assumes that values in the ODM database only have Z offsets, which could be wrong for many series
--4.  I am preserving ValueIDs from the ODM 1.1 database so I can go back later and add annotations for Qualifiers
---------------------------------------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Results.ResultValues ON;
INSERT INTO ODM2.ODM2Results.ResultValues (ValueID, ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, OffsetOriginID, ValueXLocation, 
	ValueYLocation, ValueZLocation, CensorCodeCV, QualityCodeCV, AggregationDuration, InterpolationTypeCV)
SELECT dv.ValueID, sc.SeriesID AS ResultID, dv.DataValue, dv.LocalDateTime AS ValueDateTime, dv.UTCOffset AS ValueDateTimeUTCOffset, 
	dv.OffsetTypeID AS OffsetOriginID, NULL AS ValueXLocation, NULL AS ValueYLocation, dv.OffsetValue AS ValueZLocation, 
	dv.CensorCode AS CensorCodeCV, NULL AS QualityCodeCV, CAST(sc.TimeSupport AS VARCHAR(5)) + ' ' + sc.TimeUnitsName AS AggregationDuration, 
	sc.DataType AS InterpolationTypeCV 
FROM LittleBearRiverODM.dbo.SeriesCatalog sc, LittleBearRiverODM.dbo.DataValues dv
WHERE sc.SiteID = dv.SiteID AND sc.VariableID = dv.VariableID AND sc.MethodID = dv.MethodID AND sc.SourceID = dv.SourceID 
	AND sc.QualityControlLevelID = dv.QualityControlLevelID AND dv.SampleID IS NULL
ORDER BY ResultID, ValueDateTime;
SET IDENTITY_INSERT ODM2.ODM2Results.ResultValues OFF;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Populate the ODM2Core.Actions, ODM2Core.Results, and ODM2Results.ResultValues tables for sample-based results
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

---------------------------------------------------------------------------------------
--Add "Collected Specimen" Actions to the ODM2Core.Actions table for each specimen
--NOTES:
--1.  Use the "Method" associated with the sample result in ODM 1.1.1
--2.  This works for LBR data because of the way I have specified the Method for 
--    sample-based data values as a sample collection method, but may not work for 
--    all ODM 1.1 databases because others may not have done this.
---------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.Actions (ActionTypeCV, BeginDateTime, BeginDateTimeUTCOffset, EndDateTime, EndDateTimeUTCOffset, 
	MethodID, SamplingFeatureID, DirectiveID, ActionNotes, ParentActionID)
SELECT DISTINCT 'Collected Specimen' AS ActionTypeCV, dv.LocalDateTime AS BeginDateTime, dv.UTCOffset AS BeginDateTimeUTCOffset, dv.LocalDateTime AS EndDateTime,
	dv.UTCOffset AS EndDateTimeUTCOffset, dv.MethodID, spec.SamplingFeatureID, NULL AS DirectiveID, NULL AS ActionNotes, NULL AS ParentActionID
FROM LittleBearRiverODM.dbo.DataValues dv, ODM2.ODM2SamplingFeatures.Specimens spec 
WHERE dv.SampleID = spec.SpecimenID;

------------------------------------------------------------------------------------------------
--Populate the ODM2Core.ActionPeople table for the sample collection actions
--NOTES:
--1.  This uses the contact person from the Sources table in ODM 1.1 associated with the sample
--2.  For now the RoleID is hard coded
------------------------------------------------------------------------------------------------
--Create the record in the ODM2.Roles table for the "Sample Collector" role
SET IDENTITY_INSERT ODM2.ODM2Core.Roles ON;
INSERT INTO ODM2.ODM2Core.Roles (RoleID, RoleDescription)
VALUES(2,'Sample Collector');
SET IDENTITY_INSERT ODM2.ODM2Core.Roles OFF;
--Create the records in the ODM2Core.ActionPeople table for the sample collection actions
--Uses the contact person from the ODM 1.1 database as the "Sample Collector"
INSERT INTO ODM2.ODM2Core.ActionPeople (ActionID, AffiliationID, IsActionLead, RoleID)
SELECT act.ActionID, aff.PersonID, 1 AS IsActionLead,2 AS RoleID
FROM ODM2.ODM2Core.Actions act, ODM2.ODM2Core.Affiliations aff, ODM2.ODM2SamplingFeatures.Specimens spec, LittleBearRiverODM.dbo.DataValues dv  
WHERE act.SamplingFeatureID = spec.SamplingFeatureID AND act.BeginDateTime = dv.LocalDateTime AND spec.SpecimenID = dv.SampleID 
	AND dv.SourceID = aff.OrganizationID AND act.ActionTypeCV = 'Collected Specimen'
ORDER BY ActionID, PersonID;

------------------------------------------------------------------------------------
--Add "Observation Act" Actions to the ODM2Core.Actions table for the samples
--NOTE:  
--1.  Use the "LabMethod" associated with the sample result in ODM 1.1
------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.Actions (ActionTypeCV, BeginDateTime, BeginDateTimeUTCOffset, EndDateTime, EndDateTimeUTCOffset, 
	MethodID, SamplingFeatureID, DirectiveID, ActionNotes, ParentActionID)
SELECT DISTINCT 'Observation Act' AS ActionTypeCV, dv.LocalDateTime AS BeginDateTime, dv.UTCOffset AS BeginDateTimeUTCOffset, dv.LocalDateTime AS EndDateTime,
	dv.UTCOffset AS EndDateTimeUTCOffset, met.MethodID, spec.SamplingFeatureID, NULL AS DirectiveID, NULL AS ActionNotes, NULL AS ParentActionID
FROM LittleBearRiverODM.dbo.DataValues dv, LittleBearRiverODM.dbo.Samples smp, LittleBearRiverODM.dbo.LabMethods lmet, ODM2.ODM2SamplingFeatures.Specimens spec, ODM2.ODM2Core.Methods met 
WHERE dv.SampleID = smp.SampleID AND smp.SampleID = spec.SpecimenID AND smp.LabMethodID = lmet.LabMethodID AND lmet.LabMethodName = met.MethodName;

--------------------------------------------------------------------------------------------------
--Add records to the ODM2Core.Results table for measurements resulting from samples  
--NOTES:
--1.  The ResultType will be "Measurement" and there will be at least one Result for every sample
--2.  The ResultDateTime will be set to the LocalDateTime in the ODM 1.1 DataValues table.
--3.  Set Status = "Complete" for now 
--------------------------------------------------------------------------------------------------
INSERT INTO ODM2.ODM2Core.Results (ResultTypeCV, ActionID, VariableID, UnitsID, QualityControlLevelID, ResultDateTime, ResultDateTimeUTCOffset, 
	ValidDateTime, ValidDateTimeUTCOffset, StatusCV, SampledMediumCV, ValueCount, IntendedObservationSpacing)
SELECT 'Measurement' AS ResultTypeCV, act.ActionID, dv.VariableID, vbl.VariableUnitsID AS UnitsID, dv.QualityControlLevelID, 
	dv.LocalDateTime AS ResultDateTime, dv.UTCOffset AS ResultDateTimeUTCOffset, NULL AS ValidDateTime, NULL AS ValidDateTimeUTCOffset, 
	'Complete' AS StatusCV, vbl.SampleMedium AS SampledMediumCV, 1 AS ValueCount, 'Unknown' AS IntendedObservationSpacing
FROM LittleBearRiverODM.dbo.DataValues dv, LittleBearRiverODM.dbo.Variables vbl, ODM2.ODM2Core.Actions act, ODM2.ODM2SamplingFeatures.Specimens spec
WHERE dv.SampleID = spec.SpecimenID AND spec.SamplingFeatureID = act.SamplingFeatureID AND dv.VariableID = vbl.VariableID 
	AND dv.LocalDateTime = act.BeginDateTime AND act.ActionTypeCV = 'Observation Act'
ORDER BY ActionID, VariableID;

---------------------------------------------------------------------------------------------------------------------
--Populate the ODM2.ODM2Results.ResultValues table for sample-based data
--NOTES:  
--1.  This adds DataValues to the ODM2.ODM2Results.ResultValues table only if they have an associated SampleID
--2.  This relies on records being added to the Results table before performing this query
--3.  This assumes that values in the ODM database only have Z offsets, which could be wrong for many series
--4.  I am preserving ValueIDs from the ODM 1.1 database so I can go back later and add annotations for Qualifiers
---------------------------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT ODM2.ODM2Results.ResultValues ON;
INSERT INTO ODM2.ODM2Results.ResultValues (ValueID, ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, OffsetOriginID, ValueXLocation, 
	ValueYLocation, ValueZLocation, CensorCodeCV, QualityCodeCV, AggregationDuration, InterpolationTypeCV)
SELECT dv.ValueID, rslt.ResultID, dv.DataValue, dv.LocalDateTime AS ValueDateTime, dv.UTCOffset AS ValueDateTimeUTCOffset, 
	dv.OffsetTypeID AS OffsetOriginID, NULL AS ValueXLocation, NULL AS ValueYLocation, dv.OffsetValue AS ValueZLocation, 
	dv.CensorCode AS CensorCodeCV, NULL AS QualityCodeCV, CAST(vbl.TimeSupport AS VARCHAR(5)) + ' ' + unt.UnitsName AS AggregationDuration, 
	vbl.DataType AS InterpolationTypeCV 
FROM LittleBearRiverODM.dbo.DataValues dv, LittleBearRiverODM.dbo.Variables vbl, LittleBearRiverODM.dbo.Units unt, ODM2.ODM2Core.Results rslt, 
	ODM2.ODM2Core.Actions act, ODM2.ODM2SamplingFeatures.Specimens spec
WHERE dv.VariableID = vbl.VariableID AND vbl.TimeUnitsID = unt.UnitsID AND dv.SampleID = spec.SpecimenID 
	AND spec.SamplingFeatureID = act.SamplingFeatureID AND act.ActionID = rslt.ActionID AND dv.LocalDateTime = act.BeginDateTime
ORDER BY ResultID, ValueDateTime;
SET IDENTITY_INSERT ODM2.ODM2Results.ResultValues OFF;

------------------------------------------------------------------------------------------------------------------
--Add the qualifiers from ODM 1.1 to the ODM2.ODM2Annotations.Annotations and ODM2.ODM2Annotations.Annotations
------------------------------------------------------------------------------------------------------------------
--Add the qulifiers from ODM 1.1 to ODM2.ODM2Annotations.Annotations table
SET IDENTITY_INSERT ODM2.ODM2Annotations.Annotations ON;
INSERT INTO ODM2.ODM2Annotations.Annotations (AnnotationID, AnnotationTypeCV, AnnotationCode, AnnotationText, AnnotationDateTime, AnnotationUTCOffset, AnnotatorID)
SELECT QualifierID AS AnnotationID, 'Data Value Qualifier' AS AnnotationTypeCV, QualifierCode AS AnnotationCode, 
	CAST(QualifierDescription AS NVARCHAR(255)) AS AnnotationText, NULL AS AnnotationDateTime, NULL AS AnnotationUTCOffset,
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

-----------------------------------------------------------------------------
--Additional things left to do 
-----------------------------------------------------------------------------
--TODO:  Add ODM 1.1 Groups/Group descriptions as Annotations.