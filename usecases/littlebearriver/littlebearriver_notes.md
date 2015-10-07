ODM2 Data Use Case:  Little Bear River Hydrology and Water Quality Data
=======================================================================

The Little Bear River data are currently stored in a CUAHSI Hydrologic Information System (HIS) ODM Version 1.1.1 database in Microsoft SQL Server. The data consist of time series of hydrologic observations collected at aquatic and weather monitoring sites in the Little Bear River of Northern Utah, USA. Also included are water quality samples collected in the Little Bear River and analyzed for constituents such as suspended sediment and nutrient concentrations.

[Documentation for ODM 1.1.1](http://hydroserver.codeplex.com/wikipage?title=Observations%20Data%20Model&referringTitle=Documentation) is available online. More information about the Little Bear River data is available [here](http://littlebearriver.usu.edu). This implementation exercise is development of a script to map and copy the Little Bear River data from an ODM 1.1.1 database to to an ODM2 database.

#### Required ODM2 Schemas

The following ODM2 schemas are required for the Little Bear River data use case:

1. ODM2Core
2. ODM2SamplingFeatures
3. ODM2Results
4. ODM2Annotations
5. ODMCV

Eventually I could add the ODM2Equipment and ODM2DataQuality schemas because I have all of the information needed, there was just no place for it in my ODM 1.1.1 database.  For now, I have focused on moving what is already in my ODM 1.1.1 database into an ODM2 database.

## Implementation Notes for Sensor-Based Data ##

#### SpatialReferences
SpatialReferences in ODM2 are mostly the same as in ODM 1.1.1 except that they are not treated as a Controlled Vocabulary.  So, I basically copied them straight across.

1. Set ODM2.SpatialReferences.SpatialReferenceID = ODM1.SpatialReferences.SpatialReferenceID
2. Set ODM2.SpatialReferences.SRSID = "CUAHSI:" & ODM1.SpatialReferences.SRSID - had to concatenate the CUAHSI string and cast this to VARCHAR(50) to be consistent with the length of the field in ODM2
3. Set ODM2.SpatialReferences.SRSName = ODM1.SpatialReferences.SRSName
4. Set ODM2.SpatialReferences.SRSDescription = ODM1.SpatialReferences.Notes - had to cast this to VARCHAR(500) to be consistent with the length of the field in ODM2, which might truncate some information
5. Set ODM2.SpatialReferences.SRSLink = "http://his.cuahsi.org/mastercvreg/edit_cv11.aspx?tbl=SpatialReferences" to indicate that these SpatialReferences came from the CUAHSI HIS list

But, I also need to create a SpatialReference record for each OffsetType in the ODM 1.1.1 database so I can use it in ODM2 to define how the offsets are being used.  In this case I will only fill in the SRSName, which is the only required field in the ODM2.SpatialReferences table.

1. Set ODM2.SpatialReferences.SRSName = ODM1.OffsetTypes.OffsetDescription

#### SamplingFeatures and Sites
Sites in ODM2 are essentially the same as in ODM 1.1.1 except that both Sites and SamplingFeatures tables have to be populated and the Site information is split between the two tables. I first have to set the default value of the SamplingFeatureUUID field in the ODM2Core.SamplingFeatures table to be a NEWSEQUENTIALID(). This was done by altering the table to add a default value constraint. 

Adding records to **ODM2.SamplingFeatures**:

1. Set ODM2.SamplingFeatures.SamplingFeatureID = ODM1.Sites.SiteID - carry the ODM 1.1.1 SiteIDs into the ODM2 database for convenience.
2. ODM2Core.SamplingFeatures.SamplingFeatureUUID = NEWSEQUENTIALID() - this is a SQL Server Function to generate a UUID (i.e., SQL Server generates the UUIDS for me)
3. Set ODM2.SamplingFeatures.SamplingFeatureTypeCV = 'Site'
4. Set ODM2.SamplingFeatures.SamplingFeatureCode = ODM1.Sites.SiteCode
5. Set ODM2.SamplingFeatures.SamplingFeatureName = ODM1.Sites.SiteName
6. Set ODM2.SamplingFeatures.SamplingFeatureDescription =  ODM1.Sites.Comments - this is not an 'exact' match, but I will use it for now.  This may need to be modified after the fact.
7. Set ODM2.SamplingFeatures.SamplingFeatureGeoTypeCV = 'Point'
8. Set ODM2.SamplingFeatures.FeatureGeometry = geometry::Point(ODM1.Sites.Longitude, ODM1.Sites.Latitude, ODM1.SpatialReferences.SRSID) - this is a Microsoft SQL Server function that creates the geometry from the point coordinates.  TODO:  This needs to be checked to make sure I am specifying the SRSID correctly.
9. Set ODM2.SamplingFeatures.Elevation_m = ODM1.Sites.Elevation_m
10. Set ODM2.SamplingFeatures.ElevationDatumCV = ODM1.Sites.VerticalDatum

**NOTE:** When running this on an ODM 1.1.1 database, need to verify that the terms used in the ODM 1.1.1 VerticalDatum field in the Sites table are valid terms from the ODM2 ElevationDatumCV.

Adding records to **ODM2SamplingFeatures.Sites**: Some of the ODM 1.1.1 Site attributes don't get copied across because they are no longer part of the ODM2 Core schema (e.g., LocalX, LocalY, LocalProjectionID, PosAccuracy_m, State, County, Comments)

1. Set ODM2.Sites.SamplingFeatureID = ODM1.Sites.SiteID
2. Set ODM2.Sites.SiteTypeCV = ODM1.Sites.SiteType
3. Set ODM2.Sites.Latitude = ODM1.Sites.Latitude
4. Set ODM2.Sites.Longitude = ODM1.Sites.Longitude
5. Set ODM2.Sites.SpatialReferenceID = ODM1.Sites.LatLongDatumID - I can do this because I moved all of the SpatialReferences from ODM1 and preserved the SpatialReferenceIDs

**NOTE:** When running this on an ODM 1.1.1 database, need to verify that the terms used in the ODM 1.1.1 SiteType field in the Sites table are valid terms from the ODM2 SiteTypeCV.

#### Units
Units are essentially the same in ODM 1.1.1 and ODM2 except that they are not treated as a controlled vocabulary in ODM2.  However, there will still be a list of Units for upload to an ODM2 database and so any Units that are used in an ODM 1.1.1 database need to be matched to whatever is in the ODM2 database by using the UnitsName. For now, I copied the Units straight across from my ODM 1.1.1 database, preserving the UnitsIDs for convenience.

**TODO**:  Modify the code of the script to accommodate a pre-generated list of Units uploaded to an ODM2 database.

1. Set ODM2.Units.UnitsID = ODM1.Units.UnitsID
2. Set ODM2.Units.UnitsTypeCV = ODM1.Units.UnitsType
3. Set ODM2.Units.UnitsAbbreviation = ODM1.Units.UnitsAbbreviation
4. Set ODM2.Units.UnitsName = ODM1.Units.UnitsName
5. Set ODM2.Units.UnitsLink = 'http://his.cuahsi.org/mastercvreg/edit_cv11.aspx?tbl=Units' - set this to indicate that the Units I'm using came from the CUAHSI HIS Units list.

**NOTE**:  Had to ensure that UnitsType terms used in the ODM 1.1.1 Units table matched valid terms from the ODM2 UnitsTypeCV.

#### ProcessingLevels
ProcessingLevels in ODM2 are the same as QualityControlLevels in ODM 1.1.1. I copied QualityControlLevels straight across from ODM 1.1.1 into the ODM2 ProcessingLevels table, preserving the QualityControlLevelIDs for convenience.

1. Set ODM2.ProcessingLevels.ProcessingLevelID = ODM1.QualityControlLevels.QualityControlLevelID
2. Set ODM2.ProcessingLevels.ProcessingLevelCode = ODM1.QualityControlLevels.QualityControlLevelCode
3. Set ODM2.ProcessingLevels.Definition = ODM1.QualityControlLevels.Definition
4. Set ODM2.ProcessingLevels.Explanation = ODM1.QualityControlLevels.Explanation

#### Variables
Variables in ODM2 have fewer attributes because some of the information has been moved to the Result (e.g., Units). Additionally, the CV fields in ODM2.Variables are named with a "CV" at the end.  Moved Variables from ODM 1.1.1 to ODM and preserved the VariableIDs for convenience.

1. Set ODM2.Variables.VariableID = ODM1.Variables.VariableID 
2. Set ODM2.Variables.VariableTypeCV = 'Unknown' - It's required, but doesn't exist in ODM 1.1, so set to "Unknown" (see note below).  This would need to be modified after the fact.
3. Set ODM2.Variables.VariableCode = ODM1.Variables.VariableCode
4. Set ODM2.Variables.VaribleNameCV = ODM1.Variables.VariableName
5. Set ODM2.Variables.VariableDefinition = "NULL" - does not exist in ODM 1.1 and not required
6. Set ODM2.Variables.SpeciationCV = ODM1.Variables.Speciation
7. Set ODM2.Variables.NoDataValue = ODM1.Variables.NoDataValue

**NOTE**:  ValueType from ODM 1.1.1 is not currently mapped to ODM2.  This is most closely related to MethodTypeCV in the ODM2.Methods table, but not exactly the same.  Also, could be related to VariableTypeCV?
**NOTE**:  DataType is mapped to AggregationStatistic in ODM2 and is no longer in the Variables table.
**NOTE**:  Need to ensure that any VariableNames and Speciation used in the ODM 1.1.1 Variables table are valid terms from the ODM2 VariableNameCV and SpeciationCV prior to running this.

#### Methods
Methods in ODM2 have more attributes than Methods in ODM 1.1.1. But, Methods can essentially be copied straight across using the same MethodIDs for convenience.

1. Set ODM2.Methods.MethodID = ODM1.Methods.MethodID 
2. Set ODM2.Methods.MethodTypeCV = 'Unknown' - this is required, but I have no way of getting this from ODM1 because there is no MethodType in ODM 1.1.1.  So, I set this to 'Unknown' since it has to have a value.  This is related to the ValueType CV from ODM 1.1.1, but not exactly the same.  This would need to be modified after the fact to specify appropriate terms.
3. Set ODM2.Methods.MethodCode = ODM1.Methods.MethodID - MethodCode is required, but doesn't exist in ODM 1.1.1, so I used the MethodID.  This would need to be modified after the fact if different MethodCodes are desired.
4. Set ODM2.Methods.MethodName = ODM1.Methods.MethodDescription - there is no MethodName in ODM 1.1.1, so I just used the MethodDescription.
5. Set ODM2.Methods.MethodDescription = ODM1.Methods.MethodDecription - this duplicates information, but only because ODM 1.1.1 doesn't have a MethodName
6. Set ODM2.Methods.MethodLink = ODM1.Methods.MethodLink
7. Set ODM2.Methods.OrganizationID = NULL - ODM 1.1.1 doesn't have the capability to link Methods to Organizations, so this has to be NULL

#### Organizations
Organizations in ODM2 roughly map to Sources in ODM 1.1.1. However, the attributes aren't quite the same. I created an Organization in ODM2 for each record in the ODM1.Sources table.

1. Set ODM2.Organizations.OrganizationID = ODM1.Sources.SourceID 
2. Set ODM2.Organizations.OrganizationTypeCV = 'Research institute' - *this may not be quite right, and may even be wrong for many types of Sources that people have used in ODM 1.1.1 databases*, but it doesn't exist in ODM 1.1.1, so this was set as the default value
3. Set ODM2.Organizations.OrganizationCode = ODM1.Sources.SourceID - there is no OrganizationCode in ODM 1.1.1, so I just used the SourceID as the OrganizationCode.
4. Set ODM2.Organization.OrganizationName = ODM1.Sources.Organization
5. Set ODM2.Organization.OrganizationDescription = ODM1.Sources.SourceDescription - had to cast this to VARCHAR(500) to fit the ODM2 field length, so some information may be truncated
6. Set ODM2.Organization.OrganizationLink = ODM1.Sources.SourceLink
7. Set ODM2.Organization.ParentOrganizationID = NULL - this attribute doesn't exist in ODM 1.1.1 and so there's nothing for me to move across

Adding records to the **Organizations** table for ODM 1.1.1 analytical labs: In ODM 1.1.1, there is also a LabMethods table that is linked to Samples. This is where laboratory analytical methods used to analyze samples are stored. In ODM2 we have generalized Methods and so I need to add the LabMethods from ODM 1.1.1 to the Methods table in ODM2.  Additionally, LabMethods in ODM 1.1.1 do have Organization information associated with them (e.g., the analytical laboratory) and so I need to create appropriate Organization records in ODM2 and associate them with the ODM1.LabMethods that I add to the ODM2.Methods table.

First, I created the ODM2 Organizations for the ODM 1.1.1 analytical labs:

1. Set ODM2.Organizations.OrganizationTypeCV = 'Analytical laboratory'
2. Set ODM2.Organizations.OrganizationCode = ODM1.LabMethods.LabName - there is no OrganizationCode in ODM 1.1.1, so just used the LabName
3. Set ODM2.Organizations.OrganizationName = ODM1.LabMethods.LabName
4. Set ODM2.Organizations.OrganizationDescription = ODM1.LabMethods.LabOrganization
5. Set ODM2.Organizations.OrganizationLink = NULL - doesn't exist for analytical labs in ODM 1.1.1
6. Set ODM2.Organizations.ParentOrganizationID = NULL - doesn't exist in ODM 1.1.1

Then, I added the ODM 1.1.1 LabMethods to the ODM2 Methods table:

1. Set ODM2.Methods.MethodID = ODM1.LabMethods.LabMethodID + @MaxMethodID + 1 - I started with the maximum MethodID that was already in the ODM2.Methods table and then added it to the LabMethodID from ODM 1.1.1 and added 1 (because there is a LabMethodID of 0 in ODM 1.1.1 for 'Unknown')
2. Set ODM2.Methods.MethodTypeCV = 'Specimen analysis'
3. Set ODM2.Methods.MethodCode = ODM1.LabMethods.LabMethodID + @MaxMethodID + 1 - MethodCode doesn't exist in ODM 1.1.1, so I just set the MethodCode = MethodID
4. Set ODM2.Methods.MethodName = ODM1.LabMethods.LabMethodName
5. Set ODM2.Methods.MethodDescription = ODM1.LabMethods.LabMethodDescription
6. Set ODM2.Methods.MethodLink = ODM1.LabMethods.LabMethodLink
7. Set ODM2.Methods.OrganizationID = ODM2.Organizations.OrganizationID - used the OrganizationIDs for the Analytical Laboratory Organizations that I just created.

#### People
There is no separate People table in ODM 1.1.1. However, there is a contact person for each organization in the ODM1.Sources table. So, I created a record in the ODM2.People table for each person in the ODM1.Sources table. *I used a substring function that splits the person's name into first and last.  This may not work for all names - especially in cases where someone has input a middle name or initial*.  The mapping may be imperfect for some ODM 1.1.1 databases and may need to be fixed after the fact.

1. Set ODM2.People.PersonFirstName = CAST(SUBSTRING(ODM1.Sources.ContactName, 1, CHARINDEX(' ', ODM1.Sources.ContactName) - 1) AS VARCHAR(255))
2. Set ODM2.People.PersonLastName = CAST(SUBSTRING(ODM1.Sources.ContactName, CHARINDEX(' ', ODM1.Sources.ContactName) + 1, 8000) AS VARCHAR(255))

#### Affiliations
There is no Affiliations entity in ODM 1.1.1. So, I just mapped the PersonIDs from the ODM2.People table to the Organizations from which they came in the ODM 1.1.1 database.

1. Set ODM2.Affiliations.PersonID = ODM2.People.PersonID 
2. Set ODM2.Affiliations.OrganizationID = ODM1.Sources.SourceID
3. Set ODM2.Affiliations.IsPrimaryOrganizationContact = 1 - this is essentially what inclusion of this person in the the ODM 1.1.1 Sources table meant (1 = True).
4. Set ODM2.Affiliations.AffiliationStartDate = the current system date. *This is required and ODM 1.1.1 does not have this information. So, it is set to the current system date.*  May need to modify after the fact. 
5. Set ODM2.Affiliations.AffiliationEndDate = NULL - *ODM 1.1.1 does not have this information, so set to NULL*
6. Set ODM2.Affiliations.PrimaryPhone = ODM1.Sources.Phone
7. Set ODM2.Affiliations.PrimaryEmail = ODM1.Sources.Email
8. Set ODM2.Affiliations.PrimaryAddress = ODM1.Sources.Address + ODM1.Sources.City + ODM1.Sources.State + ODM1.Sources.State + ODM1.Sources.Zipcode - concatenated string
9. Set ODM2.Affiliations.PersonLink = NULL - doesn't exist in ODM 1.1.1 so set to NULL.

#### Actions for Sensor-Based Data 
Since I am not dealing with any of my equipment or field visit data yet, I am just going to add a generic "Observation" Action for each of the sensor-based time series in my ODM 1.1.1 database. This could be a little problematic in the future as I really want my "Instrument deployment" Actions associated with the Results, but for now I'm not going to do this because none of that information is in the ODM 1.1.1 database. Since there is a 1:1 correspondence between Actions and Results for my sensor-based data, I can use the SeriesIDs from the ODM1.SeriesCatalog table for both ActionIDs and ResultIDs in my ODM2 database for convenience. But, I first have to filter out any time series in the ODM 1.1.1 SeriesCatalog table that are for sample based data (e.g., they have DataValues with a SampleID that is not NULL).

1. Set ODM2.Actions.ActionID = ODM1.SeriesCatalog.SeriesID
2. Set ODM2.Actions.ActionTypeCV = 'Observation' 
3. Set ODM2.Actions.BeginDateTime = ODM1.SeriesCatalog.BeginDateTime
4. Calculated ODM2.Actions.BeginDateTimeUTCOffset from ODM1.SeriesCatalog.BeginDateTime and ODM1.SeriesCatalog.BeginDateTimeUTC
5. Set ODM2.Actions.EndDateTime = ODM1.SeriesCatalog.EndDateTime
6. Calculated ODM2.Actions.EndDateTimeUTCOffset from ODM1.SeriesCatalog.EndDateTime and ODM1.SeriesCatalog.EndDateTimeUTC
7. Set ODM2.Actions.ActionDescription = 'Sensor deployment and observation. This is a generic Observation Action created for a Time Series Result loaded into ODM2 from an ODM 1.1.1 database.' - this attribute doesn't exist in ODM 1.1.1 so I created a generic string that describes the Action I am creating for each time series.
8. Set ODM2.Actions.ActionFileLink = NULL - this attribute doesn't exist in ODM 1.1.1

#### ActionBy records for Sensor-Based Data
Since there really isn't any information in ODM 1.1.1 about who performed any of the Actions, I have assumed that the contact person from each of the ODM 1.1.1 Sources is the "Observer" and the lead of the ODM2 Observation Action.  This part only works correctly because the Observation Actions are the only Actions I have added so far.

1. Set ODM2.ActionBy.ActionID = ODM2.Actions.ActionID = ODM1.SeriesCatalog.SeriesID
2. Set ODM2.ActionBy.AffiliationID = ODM2.Affiliations.AffiliationID = ODM1.Sources.SourceID
3. Set ODM2.ActionBy.IsActionLead = 1 - (1 = True)
4. Set ODM2.ActionBy.RoleDescription = 'Observer'

#### FeatureActions for Sensor-Based Data
Since I used the ODM 1.1.1 SiteID as the SamplingFeatureID in ODM2 and the ODM 1.1.1 SeriesID for ActionID in ODM2, I can create this table by just querying the SiteID and SeriesID from the ODM 1.1.1 SeriesCatalog table. But, I have to select DISTINCT time series that do not have DataValues associated with samples (e.g., only sensor-based data)

1.  Set ODM2.FeatureActions.SamplingFeatureID = ODM1.SeriesCatalog.SiteID
2.  Set ODM2.FeatureActions.ActionID = ODM1.SeriesCatalog.SeriesID

#### Results for Sensor-Based Data
Similar to Actions, I can just use the SeriesIDs from the ODM 1.1.1 SeriesCatalog table to identify the Results for sensor-based data from the ODM 1.1.1 database.  But, I first have to set the default value of the ResultUUID field in the ODM2Core.Results table to be a NEWSEQUENTIALID(), similar to what I did for the ODM2 SamplingFeatures table. 

1. Set ODM2.Results.ResultID = ODM1.SeriesCatalog.SeriesID
2. Set ODM2.Results.ResultUUID = NEWSEQUENTIALID() - this is a SQL Server Function to generate a UUID (i.e., SQL Server generates the UUIDS for me)
3. Set ODM2.Results.FeatureActionID = ODM2Core.FeatureActions.FeatureActionID - this is set for each combination of SiteID and SeriesID from the SeriesCatalog table in ODM 1.1.1, so have to join on the SeriesCatalog
4. Set ODM2.Results.ResultTypeCV = 'Time series coverage'
5. Set ODM2.Results.VariableID = ODM1.SeriesCatalog.VariableID
6. Set ODM2.Results.UnitsID = ODM2.Units.UnitsID - can't just use the UnitsID from ODM 1.1.1, instead had to match the Units by name
7. Set ODM2.Results.TaxonomicClassifierID = NULL - doesn't exist in ODM 1.1.1 and don't need it for sensor-based data
8. Set ODM2.Results.ProcessingLevelID = ODM1.SeriesCatalog.QualityControlLevelID
9. Set ODM2.Results.ResultDateTime = current system date (e.g., the time the result was added to the database)
10. Calculated the ResultDateTimeUTCOffset from the current system date and the current system date as UTC
11. Set ODM2.Results.ValidDateTime = NULL - Doesn't exist in ODM 1.1.1
12. Set ODM2.Results.ValidDateTimeUTCOffset = NULL - Doesn't exist in ODM 1.1.1
13. Set ODM2.Results.StatusCV = 'Unknown' - ODM 1.1.1 doesn't have any information about this, so I set to 'Unknown'.  This would need to be updated after the fact.
14. Set ODM2.Results.SampledMediumCV = ODM1.SeriesCatalog.SampleMedium 
15. Set ODM2.Results.ValueCount = ODM1.SeriesCatalog.ValueCount
16. Set ODM2.Results.IntendedObservationSpacing = 'Unknown' - this doesn't exist in ODM 1.1.1 and since there is no info, just set to 'Unknown'

**NOTE**: Need to make sure that the terms in the SampleMedium field in the Variables table of the ODM 1.1.1 database are valid terms in the ODM2 MediumCV.

#### TimeSeriesResults for Sensor-Based Data
Given that I have used the ODM1.SeriesCatalog.SeriesID to identify the ODM2 Result for each sensor-based time series, I can use the SeriesIDs to create the records in the ODM2 TimeSeriesResult table as well for convenience. Since ODM 1.1.1 only had a single OffsetValue in the DataValues table, I need to create a new SpatialReference that represents the offset and then I will use just the ODM2 ZLocation to represent the ODM1 offset. This may be problematic and may need to be adjusted after the fact.

1.  Set ODM2.TimeSeriesResults.ResultID = ODM1.SeriesCatalog.SeriesID
2.  Set ODM2.TimeSeriesResults.XLocation = NULL - doesn't exist in ODM 1.1.1
3.  Set ODM2.TimeSeriesResults.XLocationUnitsID = Null - doesn't exist in ODM 1.1.1
4.  Set ODM2.TimeSeriesResults.YLocation = NULL - doesn't exist in ODM 1.1.1
5.  Set ODM2.TimeSeriesResults.YLocationUnitsID = NULL - doesn't exist in ODM 1.1.1
6.  Set ODM2.TimeSeriesResults.ZLocation = ODM1.DataValues.OffsetValue
7.  Set ODM2.TimeSeriesResults.ZLocationUnitsID = ODM2.Units.UnitsID - had to match to ODM 1.1.1 OffsetUnitsID by matching on UnitsName 
8.  Set ODM2.TimeSeriesResults.SpatialReferenceID = ODM2.SpatialReferences.SpatialReferenceID - Here I have to get the ODM2 SpatialReferenceID for the ODM 1.1.1 OffsetTypes that I added to the ODM2.SpatialReferences table
9.  Set ODM2.TimeSeriesResults.IntendedTimeSpacing = NULL - doesn't exist in ODM 1.1.1
10.  Set ODM2.TimeSeriesResults.IntendedTimeSpacingUnitsID = NULL - doesn't exist in ODM 1.1.1
11. Set ODM2Results.TimeSeriesResults.AggregationStatisticCV = ODM1.SeriesCatalog.DataType

**NOTE**:  Not all ODM 1.1.1 offsets are in the vertical direction and so mapping them all to the ZLocation in the ODM2 TimeSeriesResults table may be incorrect for some Results.  This will have to be corrected after the fact because there is no other way to interpret the ODM 1.1.1 Offset, which is one dimensional.

#### TimeSeriesResultValues for Sensor-Based Data
Given that I have used the ODM1.SeriesCatalog.SeriesID to identify the ODM2 Result for each sensor-based time series, I can use the SeriesIDs to identify the DataValues coming out of my ODM 1.1.1 database. This operation has to filter out any DataValues that have a SampleID associated with them (I only want sensor-based data).  But, *while sufficient for my data, this simple filter may not be sufficient for all ODM 1.1.1 databases*. I am also preserving ValueIDs from the ODM 1.1.1 database so I can go back later and add ODM2 Annotations for ODM 1.1.1 Qualifiers.

1. Set ODM2.TimeSeriesResultValues.ValueID = ODM1.DataValues.ValueID
2. Set ODM2.TimeSeriesResultValues.ResultID = ODM1.SeriesCatalog.SeriesID
3. Set ODM2.TimeSeriesResultValues.DataValue = ODM1.DataValues.DataValue
4. Set ODM2.TimeSeriesResultValues.ValueDateTime = ODM1.DataValues.LocalDateTime
5. Set ODM2.TimeSeriesResultValues.ValueDateTimeUTCOffset = ODM1.DataValues.UTCOffset
6. Set ODM2.TimeSeriesResultValues.CensorCodeCV = ODM1.DataValues.CensorCode
7. Set ODM2.TimeSeriesResultValues.QualityCodeCV = 'Unknown' - doesn't exist in ODM 1.1.1 but is required
12. Set ODM2.TimeSeriesResultValues.TimeAggregationInterval = ODM1.SeriesCatalog.TimeSupport
13. Set ODM2.TimeSeriesResultValues.TimeAggregationIntervalUnitsID = ODM2.Units.UnitsID - had to match this to the TimeUnitsID from the ODM 1.1.1 SeriesCatalog table by UnitsName.

**NOTE**: Need to ensure that all CensorCodes used in the DataValues table in the ODM 1.1.1 database match valid terms from the ODM2 CensorCodeCV prior to running this.

## Implementation Notes for Specimen-Based Data ##

#### SamplingFeatures and Specimens
ODM 1.1.1 has a Samples table that is used to populate ODM2.Specimens.  However, in ODM 1.1.1, Samples were linked directly to DataValues.  In ODM2, this is not the case. Linking water quality samples to DataValues in ODM2 requires going from Specimens --> SamplingFeatures --> FeatureActions --> Result --> MeasurementResults --> MeasurementResultValues.

**Specimens in ODM2.SamplingFeatures**: My water quality samples in ODM 1.1.1 are Specimen SamplingFeatures in ODM2. I first need to create records for the water quality samples in ODM2.SamplingFeatures.

1. Set ODM2.SamplingFeatures.SamplingFeatureID = AutoNumber - assigned by database
2. Set ODM2.SamplingFeatures.SamplingFeatureTypeCV = 'Specimen'
3. Set ODM2.SamplingFeatures.SamplingFeatureCode = ODM1.Samples.LabSampleCode
4. Set ODM2.SamplingFeatures.SamplingFeatureName = NULL - this doesn't exist in ODM 1.1.1, so set as NULL
5. Set ODM2.SamplingFeatures.SamplingFeatureDescription = 'Specimen loaded from an ODM 1.1.1 database.'
6. Set ODM2.SamplingFeatures.SamplingFeatureGeoTypeCV = 'Not applicable' - not applicable for Specimens
7. Set ODM2.SamplingFeatures.FeatureGeometry = NULL - not applicable for Specimens
8. Set ODM2.SamplingFeatures.Elevation_m = NULL - not applicable for Specimens
9. Set ODM2.SamplingFeatures.ElevationDatumCV = NULL - not applicable for Specimens

**Specimens in ODM2.Specimens**: Next, I need to create records for each water quality sample in the ODM2.Specimens table.

1. Set ODM2.Specimens.SamplingFeatureID = ODM2.SamplingFeatures.SamplingFeatureID - set to the same SamplingFeatureID as the inserted SamplingFeature
2. Set ODM2.Specimens.SpecimenTypeCV = ODM1.Samples.SampleType
3. Set ODM2S.Specimens.SpecimenMediumCV = ODM1.Variables.SampleMedium
4. Set ODM2.Specimens.IsFieldSpecimen = 1 (1 = True)

**NOTE**: Need to make sure that the SampleType terms used in the ODM 1.1.1 Samples table are valid terms from the ODM2 SpecimenTypeCV before running this code.
**NOTE**: Need to make sure that the SampleMedium terms used in the ODM 1.1.1 Variables table are valid terms from the ODM2 MediumCV before running this code.

**Specimens in ODM2.RelatedFeatures**: Once records have been created in both the Specimens and SamplingFeatures tables, I can add records to the ODM2.RelatedFeatures table to record which Site each Specimen was collected at.

1. Set ODM2.RelatedFeatures.SamplingFeatureID = ODM2.SamplingFeatures.SamplingFeatureID - the SamplingFeatureIDs of the inserted Specimens
2. Set ODM2.RelatedFeatures.RelationshipTypeCV = 'Was collected at' - *This is means that the Specimen recorded in SamplingFeatureID **Was collected at** the SamplingFeature recorded in RelatedFeatureID*.
3. Set ODM2.RelatedFeatures.RelatedFeatureID = ODM1.Sites.SiteID - *I can do this because I used the SiteIDs from the ODM 1.1.1 database as the SamplingFeatureIDs in the ODM2 database.  But, I have to link through Samples, DataValues, and Sites*
4. Set ODM2SamplingFeatures.FeatureParents.SpatialOffsetID = NULL - don't need this for any of my samples

#### Sample Analysis Actions
The "Sample analysis" Actions on the Specimens I just created for my water quality samples are the Actions that create the Measurement Results. So, I need to create a "Sample analysis" Action for each Specimen to link it to its Result(s). I don't have any information about the dates and times at which the "Sample analysis" Actions occurred, and so I am just going to use the dates and times recorded with the DataValues in the ODM 1.1.1 database.  This may need to be adjusted after the fact.

**Populate ODM2.Actions for "Specimen analysis" Actions**: First I created a temporary table so I could get all of the IDs matched up correctly. The temporary table contains one record per Action/Result that need to get inserted, along with their attributes in a single table that I can select from. Then, I selected from the temporary table to populate the others:

1. Set ODM2.Actions.ActionID = @MaxActionID + the ROW_NUMBER() of the temporary table - starts the ActionIDs to increment from the largest ActionID in the Actions table.
2. Set ODM2.Actions.ActionTypeCV = 'Specimen analysis'
3. Set ODM2.Actions.MethodID = ODM2.Methods.MethodID - this is the MethodID for the appropriate LabMethod from ODM 1.1.1, which I have already added to the database
4. Set ODM2.Actions.BeginDateTime = ODM1.DataValues.LocalDateTime
5. Set ODM2.Actions.BeginDateTimeUTCOffset = ODM1.DataValues.UTCOffset
6. Set ODM2.Actions.EndDateTime = ODM1.DataValues.LocalDateTime - assumes the same time for beginning and ending of the Specimen Analysis Action.
7. Set ODM2.Actions.EndDateTimeUTCOffset = ODM1.DataValues.UTCOffset
8. Set ODM2.Actions.ActionDescription = 'Specimen laboratory analysis.'
9. Set ODM2.Actions.ActionFileLink = NULL

**Populate ODM2.ActionBy for "Specimen analysis" Actions**: Each "Specimen analysis" action is performed by a person. In ODM 1.1.1, I only have the person that is affiliated with the Source record. So, I arbitrarily use that person as the "Laboratory analyst".

1. Set ODM2Core.ActionBy.ActionID = ODM2.Actions.ActionID - ActionID of the inserted Action 
2. Set ODM2Core.ActionBy.AffiliationID = ODM1.Sources.SourceID - this works because I used the ODM 1.1.1 SourceIDs as the OrganizationIDs in ODM2
3. Set ODM2Core.ActionBy.IsActionLead = 1
4. Set ODM2Core.ActionBy.RoleDescription = 'Laboratory analyst'

**Populate ODM2.FeatureActions for "Specimen analysis" Actions**: Now I need to add records to the FeatureActions table linking the "Specimen analysis" Actions to the Specimen SamplingFeatures that they were performed on. Here I used a temp table to get back the records inserted into FeatureActions, so then I can easily join them to the temporary Action information table to create the Results in the next step.

1. Set ODM2.FeatureActions.SamplingFeatureID = ODM2.SamplingFeatures.SamplingFeatureID - the SamplingFeatureIDs of the inserted Specimen SamplingFeatures
2. Set ODM2.FeatureActions.ActionID = ODM2.Actions.ActionID - the ActionID of the inserted "Specimen analysis" Actions

#### Populate ODM2.Results
For my Specimen based data, each Result record will detail a "Measurement" Result that has a single DataValue.  I used the temporary tables I created to generate all of the Results information.

1. Set ODM2.Results.ResultID = @MaxResultID + ODM1.DataValues.ValueID - this makes sure my ResultIDs are unique
2. Set ODM2.Results.FeatureActionID = ODM2.ODM2Core.FeatureActions.FeatureActionID - these are the records I just inserted above
3. Set ODM2.Results.ResultTypeCV = 'Measurement'
4. Set ODM2.Results.VariableID = ODM1.DataValues.VariableID - I can do this because I used the ODM 1.1.1 VariableIDs in ODM2
5. Set ODM2.Results.UnitsID = ODM2.Units.UnitsID - I need to match the Units in my ODM2 database with the Units in the ODM 1.1.1 database by UnitsName
6. Set ODM2.Results.TaxonomicClassifierID = NULL
7. Set ODM2.Results.ProcessingLevelID = ODM1.DataValues.QualityControlLevelID
8. Set ODM2.Results.ResultDateTime = ODM1.DataValues.LocalDateTime
9. Set ODM2.Results.ResultDateTimeUTCOffset = ODM1.DataValues.UTCOffset
10. Set ODM2.Results.ValidDateTime = NULL
11. Set ODM2.Results.ValidDateTimeUTCOffset = NULL
12. Set ODM2.Results.StatusCV = 'Complete'
13. Set ODM2.Results.SampledMediumCV = ODM1.Variables.SampleMedium
14. Set ODM2.Results.ValueCount = 1

**NOTE**: Need to make sure that all of the terms in the SampleMedium field in the 
ODM 1.1.1 Variables table match valid terms from the ODM2 MediumCV.

#### MeasurementResults for Specimen-based Results
Add the records for each Measurement Result to the MeasurementResults table.

1. Set ODM2.MeasurementResults.ResultID = @MaxResultID + ODM1.DataValues.ValueID - same as Results.ResultID
2. Set ODM2.MeasurementResults.XLocation = NULL
3. Set ODM2.MeasurementResults.XLocationUnitsID = NULL
4. Set ODM2.MeasurementResults.YLocation = NULL
5. Set ODM2.MeasurementResults.YLocationUnitsID = NULL
6. Set ODM2.MeasurementResults.ZLocation = ODM1.DataValues.OffsetValue
7. Set ODM2.MeasurementResults.ZLocationUnitsID = ODM2.Units.UnitsID - had to match up with ODM1.OffsetTypes.OffsetUnitsID bu matching UnitsName
8. Set ODM2.MeasurementResults.SpatialReferenceID = ODM2.SpatialReferences.SpatialReferenceID - Here I have to get the SpatialReferenceID for the ODM 1.1.1 OffsetTypes that I added to ODM2 as SpatialReferences
9. Set ODM2.MeasurementResults.CensorCodeCV = ODM1.DataValues.CensorCode
10. Set ODM2.MeasurementResults.QualityCodeCV = NULL
11. Set ODM2.MeasurementResults.AggregationStatisticCV = ODM1.Variables.DataType
12. Set ODM2.MeasurementResults.TimeAggregationInterval = ODM1.SeriesCatalog.TimeSupport
13. Set ODM2.MeasurementResults.TimeAggregationIntervalUnitsID = ODM2.Units.UnitsID - had to match up with ODM1.SeriesCatalog.TimeUnitsName

**NOTE**: I handled the ODM 1.1.1 Offset the same as for TimeSeries Results.  See the notes above about potential problems.
**NOTE**: Need to make sure that any terms in the CensorCode field of the ODM1.DataValues table match valid terms from the ODM2 CensorCodeCV.
**NOTE**: Need to make sure that any terms in the DataType field of the ODM1.Variables table match valid terms from the ODM2 AggregationStatisticCV.

#### MeasurementResultValues for Specimen-based Results ####
Add the DataValues from the Specimen-based data in ODM 1.1.1 to ODM2 as ResultValues.

1. Set ODM2Results.MeasurementResultValues.ValueID = ODM1.DataValues.ValueID
2. Set ODM2Results.MeasurementResultValues.ResultID = @MaxResultID + ODM1.DataValues.ValueID - same as above
3. Set ODM2Results.ResultValues.DataValue = ODM1.DataValues.DataValue
4. Set ODM2Results.ResultValues.ValueDateTime = ODM1.DataValues.LocalDateTime
5. Set ODM2Results.ResultValues.ValueDateTimeUTCOffset = ODM1.DataValues.UTCOffset

## Implementation Notes for Annotations ##

### Annotations for ResultValues ###
I need to add the DataValue Qualifiers from ODM 1.1.1 to ODM2. DataValue Qualifiers were the only types of Annotations supported by ODM 1.1.1.

#### Populate ODM2.Annotations for MeasurementResultValueAnnotations and TimeSeriesResultValueAnnotations ####
I had to run the basically the same query twice, but first for DataValues that have SampleIDs associated with them (which would be MeasurementResultValueAnnotations) and then DataValues that don't have SampleIDs associated with them (which would be TimeSeriesResultValueAnnotations)

1. Set ODM2.Annotations.AnnotationID = ODM1.Qualifiers.QualifierID - I can do this because DataValue Qualifiers are the only Annotations in ODM1
2. Set ODM2.Annotations.AnnotationTypeCV = 'Measurement result value annotation' OR 'Time series result value annotation'
3. Set ODM2.Annotations.AnnotationCode = ODM1.Qualifiers.QualifierCode
4. Set ODM2.Annotations.AnnotationText = ODM1.Qualifiers.QualifierDescription - had to truncate this to 500 characters to match ODM2 schema. ODM 1.1.1 allowed more characters.
5. Set ODM2.Annotations.AnnotationDateTime = NULL - I really don't know anything about when these annotations were applied
6. Set ODM2.Annotations.AnnotationUTCOffset = NULL
7. Set ODM2.Annotations.AnnotatorID = NULL

#### Populate ODM2.TimeSeriesResultValueAnnotations ####

1. Set ODM2.TimeSeriesResultValueAnnotations.ValueID = ODM1.DataValues.ValueID - I can do this because I preserved the ValueIDs when I moved the data across
2. Set ODM2.TimeSeriesResultValueAnnotations.AnnotationID = ODM1.DataValues.QualifierID - I can do this because I used the QualifierIDs from ODM 1.1.1 as the AnnotationIDs in ODM2

#### Populate ODM2.MeasurementResultValueAnnotations ####

1. Set ODM2.MeasurementResultValueAnnotations.ValueID = ODM1.DataValues.ValueID - I can do this because I preserved the ValueIDs when I moved the data across
2. Set ODM2.MeasurementResultValueAnnotations.AnnotationID = ODM1.DataValues.QualifierID - I can do this because I used the QualifierIDs from ODM1 as the AnnotationIDs in ODM2






