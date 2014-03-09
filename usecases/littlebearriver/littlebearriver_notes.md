ODM2 Data Use Case:  Little Bear River
======================================

The Little Bear River data are currently stored in a CUAHSI Hydrologic Information System (HIS) ODM Version 1.1.1 database in Microsoft SQL Server. The data consist of time series of hydrologic observations collected at aquatic and weather monitoring sites in the Little Bear River of Northern Utah, USA. Also included are water quality samples collected in the Little Bear River and analyzed for constutents such as sediment and nutrient concentrations.

[Documentation for ODM 1.1.1](http://hydroserver.codeplex.com/wikipage?title=Observations%20Data%20Model&referringTitle=Documentation) is available online. More information about the Little Bear River data is available [here](http://littlebearriver.usu.edu). This implemenation exercise is development of a script to map and copy the Little Bear River data from an ODM 1.1.1 database to to an ODM2 database.

#### Required ODM2 Schemas

The following ODM2 schemas are required for the Little Bear River data use case:

1. ODM2Core
2. ODM2SamplingFeatures
3. ODM2Results
4. ODM2Annotations
5. ODMCV (or it will when we implement it)

Eventually I could add the ODM2Equipment, ODM2Sensors, and ODM2DataQuality schemas because I have all of the information needed, there was just no place for it in my ODM1 database.

## Implementation Notes for Sensor-Based Data ##

#### SpatialReferences
SpatialReferences in ODM2 are the same as in ODM1.  Basically copied them straight across.

1. Set ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID = ODM1.SpatialReferences.SpatialReferenceID
2. Set ODM2SamplingFeatures.SpatialReferences.SRSID = ODM1.SpatialReferences.SRSID
3. Set ODM2SamplingFeatures.SpatialReferences.SRSName = ODM1.SpatialReferences.SRSName
4. Set ODM2SamplingFeatures.SpatialReferences.SRSDescription = ODM1.SpatialReferences.Notes - had to cast this to VARCHAR(500) to be consistent with ODM2, which might truncate some information

**(338 Records added to ODM2SamplingFeatures.SpatialReferences)**

#### SamplingFeatures and Sites
Sites in ODM2 are essentially the same as in ODM1 except that both Sites and SamplingFeatures tables have to be populated. Before populating the SamplingFeatures I drop the FeatureGeometry field and re-add it with the 'geometry' data type. I had to do this until Emilio set the 'geometry' data type for this field, but I don't know how he did that in DBWrench because it isn't an option for me.

Adding records to **ODM2Core.SamplingFeatures**:

1. Set ODM2Core.SamplingFeatures.SamplingFeatureID = ODM1.Sites.SiteID
2. Set ODM2Core.SamplingFeatures.SamplingFeatureTypeCV = 'Site'
3. Set ODM2Core.SamplingFeatures.SamplingFeatureName = ODM1.Sites.SiteName
4. Set ODM2Core.SamplingFeatures.SamplingFeatureGeoTypeCV = 'Point'
5. Set ODM2Core.SamplingFeatures.SpatialReferenceID = ODM1.Sites.LatLongDatumID
6. Set ODM2Core.SamplingFeatures.FeatureGeometry = geometry::Point(ODM1.Sites.Longitude, ODM1.Sites.Latitude, ODM1.SpatialReferences.SRSID) 
7. Set ODM2Core.SamplingFeatures.SamplingFeatureDescription =  ODM1.Sites.Comments 

**(16 Records added to ODM2Core.SamplingFeatures)**

Adding records to **OD2SamplingFeatures.Sites**: Some of the ODM1 Site attributes don't get copied across because they are no longer part of the Core (e.g., LocalX, LocalY, LocalProjectionID, PosAccuracy_m, State, County, Comments)

1. Set ODM2SamplingFeatures.Sites.SiteID = ODM1.Sites.SiteID
2. Set ODM2SamplingFeatures.Sites.SiteTypeCV = ODM1.Sites.SiteType
3. Set ODM2SamplingFeatures.Sites.SiteCode = ODM1.Sites.SiteCode
4. Set ODM2SamplingFeatures.Sites.SiteName = ODM1.Sites.SiteName
5. Set ODM2SamplingFeatures.Sites.Latitude = ODM1.Sites.Latitude
6. Set ODM2SamplingFeatures.Sites.Longitude = ODM1.Sites.Longitude
7. Set ODM2SamplingFeatures.Sites.LatLongDatumID = ODM1.Sites.LatLongDatumeID - I can do this because I moved all of the SpatialReferences from ODM1 and preserved the SpatialReferenceIDs
8. Set ODM2SamplingFeatures.Sites.Elevation_m = ODM1.Sites.Elevation_m
9. Set ODM2SamplingFeatures.Sites.VerticalDatumCV = ODM1.Sites.VerticalDatumCV

**(16 Records added to ODM2SamplingFeatures.Sites)**

#### Units
Units are the same in ODM1 an ODM2.  The only change is the order in which the attributes appear in the table and ODM1.Units.UnitsType = ODM2.Units.UnitsTypeCV.  Copied Units straight across from ODM1, preserving the UnitsIDs.

1. Set ODM2Core.Units.UnitsID = ODM1.Units.UnitsID
2. Set ODM2Core.Units.UnitsTypeCV = ODM1.Units.UnitsTypeCV
3. Set ODM2Core.Units.UnitsAbbreviation = ODM1.Units.UnitsAbbreviation
4. Set ODM2Core.Units.UnitsName = ODM1.Units.UnitsName

**(355 Records added to ODM2Core.Units)**

#### QualityControlLevels
QualityControlLevels are the same in ODM1 and ODM2. Copied QualityControlLevels straight across from ODM1, preserving the QualityControlLevelIDs.

1. Set ODM2Core.QualityControlLevels.QualityControlLevelID = ODM1.QualityControlLevels.QualityControlLevelID
2. Set ODM2Core.QualityControlLevels.QualityControlLevelCode = ODM1.QualityControlLevels.QualityControlLevelCode
3. Set ODM2Core.QualityControlLevels.Definition = ODM1.QualityControlLevels.Definition
4. Set ODM2Core.QualityControlLevels.Explanation = ODM1.QualityControlLevels.Explanation

**(6 Records added to ODM2Core.QualityControlLevels)**

#### Variables
Variables in ODM2 have fewer attributes because some of the information has been moved to the Result (e.g., Units). Additionaly, the CV fields in ODM2.Variables are named with a "CV" at the end.

1. Set ODM2Core.Variables.VariableID = ODM1.Variables.VariableID 
2. Set ODM2Core.Variables.VariableTypeCV = 'Unknown' - It's required, but don't know what to do with this
3. Set ODM2Core.Variables.VariableCode = ODM1.Variables.VariableCode
4. Set ODM2Core.Variables.VaribleNameCV = ODM1.Variables.VariableName
5. Set ODM2Core.Variables.VariableDefinition = "NULL" - not sure what to do here
6. Set ODM2Core.Variables.SpeciationCV = ODM1.Variables.Speciation
7. Set ODM2Core.Variables.ValueTypeCV = ODM1.Variables.ValueTypeCV
8. Set ODM2Core.Variables.DataTypeCv = ODM1.Variables.DataTypeCV
9. Set ODM2Core.Varaibles.NoDataValue = ODM1.Variables.NoDataValue

**(63 Records added to ODM2Core.Variables)**

#### Methods
Methods in ODM2 have more attributes than Methods in ODM1. But, Methods can essentially be copied straight across using the same IDs.

1. Set ODM2Core.Methods.MethodID = ODM1.Methods.MethodID 
2. Set ODM2.Methods.MethodTypeCV = 'Unknown' - this is required, but I have no way of getting this from ODM1 because there is no MethodType in ODM1.  So, I set this to 'Unknown' since it has to have a value
3. Set ODM2.Methods.MethodCode = ODM1.Methods.MethodID - the code is required, but doesn't exist in ODM1, so I used the MethodID
4. Set ODM2.Methods.MethodName = ODM1.Methods.MethodDescription - there is no MethodName in ODM1, so I just used the MethodDescription
5. Set ODM2.Methods.MethodDescription = ODM1.Methods.MethodDecription - this duplicates information, but only because ODM1 doesn't have a MethodName
6. Set ODM2.Methods.MethodLink = ODM1.Methods.MethodLink
7. Set ODM2.Methods.OrganizationID = NULL - ODM1 doesn't have the capability to link Methods to Organizations, so this has to be NULL

**(59 Records added to ODM2Core.Methods)**

#### Organizations
Organizations in ODM2 roughly map to Sources in ODM1. However, the attributes aren't quite the same. Created an Organization in ODM2 for each record in the ODM1.Sources table.

1. Set ODM2Core.Organizations.OrganizationID = ODM1.Sources.SourceID 
2. Set ODM2Core.Organizations.OrganizationTypeCV = 'Research Institute' - *this may not be quite right, and may even be wrong for many types of Sources that people have used in ODM1 databases*.
3. Set ODM2Core.Organizations.OrganizationCode = ODM1.Sources.SourceID - there is no OrganizationCode in ODM1, so I just used the ID as the code.
4. Set ODM2Core.Organization.OrganizationName = ODM1.Sources.Organization
5. Set ODM2Core.Organization.OrganizationDescription = ODM1.Sources.SourceDescription
6. Set ODM2Core.Organization.OrganizationLink = ODM1.Sources.SourceLink
7. Set ODM2Core.Organization.ParentOrganization = NULL - this concept doesn't exist in ODM1 and so there's nothing for me to move across

**(7 Records added to ODM2Core.Organizations)**

Adding records to the **Organizations** table for ODM1 analytical labs: In ODM1, there is also a LabMethods table that is linked to Samples. This is where laboratory analytical methods used to analyze samples are stored. In ODM2 we have generalized Methods and so I need to add the LabMethods from ODM1 to the Methods table in ODM2.  Additionally, LabMethods in ODM1 do have Organization information associated with them and so I need to create appropriate Organization records in ODM2 and associate them with the ODM1.LabMethods that I add to the ODM2.Methods table.

First, I created the ODM2 Organizations for the ODM1 analytical labs:

1. Set ODM2.Organizations.OrganizationTypeCV = 'Analytical Laboratory'
2. Set ODM2.Organizations.OrganizationCode = ODM1.LabMethods.LabName - there is no OrganizationCode in ODM1, so just used the LabName
3. Set ODM2.Organizations.OrganizationName = ODM1.LabMethods.LabName
4. Set ODM2.Organizations.OrganizationDescription = ODM1.LabMethods.LabOrganization
5. Set ODM2.Organizations.OrganizationLink = NULL - doesn't exist in ODM1
6. Set ODM2.Organizations.ParentOrganizationID = NULL - doesn't exist in ODM1

**(6 Records added to ODM2Core.Organizations)**

Then, I added the ODM1 LabMethods to the ODM2 Methods table:

1. Set ODM2.Methods.MethodID = ODM1.LabMethods.LabMethodID + @MaxMethodID + 1 - I started with the maximum MethodID that was already in the ODM2.Methods table and then added it to the LabMethodID from ODM1 and added 1 (because there is a LabMethodID of 0 in ODM1 for 'Unknown')
2. Set ODM2.Methods.MethodTypeCV = 'Laboratory Analytical Method'
3. Set ODM2.Methods.MethodCode = ODM1.LabMethods.LabMethodID + @MaxMethodID + 1 - MethodCode doesn't exist in ODM1, so I just set the Code = ID
4. Set ODM2.Methods.MethodName = ODM1.LabMethods.LabMethodName
5. Set ODM2.Methods.MethodDescription = ODM1.LabMethods.LabMethodDescription
6. Set ODM2.Methods.MethodLink = ODM1.LabMethods.LabMethodLink
7. Set ODM2.Methods.OrganizationID = ODM2.Organizations.OrganiztionID - used the OrganizationIDs for the Anlytical Laboratory Organizations that I just created.

**(10 Records added to ODM2Core.Methods)**

#### People
There is no separate People table in ODM1. However, there is a contact person for each organization in the ODM1.Sources table. So, I created a record in the ODM2.People table for each person in the ODM1.Sources table. *I used a substring function that splits the person's name into first and last.  this may not work for all names - especially in cases where someone has input a middle name or initial*.  The mapping may be imperfect for some ODM1 databases.

1. Set ODM2Core.People.PersonFirstName = CAST(SUBSTRING(ODM1.Sources.ContactName, 1, CHARINDEX(' ', ODM1.Sources.ContactName) - 1) AS VARCHAR(255))
2. Set ODM2Core.People.PersonLastName = CAST(SUBSTRING(ODM1.Sources.ContactName, CHARINDEX(' ', ODM1.Sources.ContactName) + 1, 8000) AS VARCHAR(255))

**(4 Records added to ODM2Core.People)**

#### Affiliations
There is no Affiliations entity in ODM1. So, I just mapped the PersonIDs to the Organizations from which they came in the ODM1 database.

1. Set ODM2Core.Affiliations.PersonID = ODM2Core.People.PersonID 
2. Set ODM2Core.Affiliations.OrganizationID = ODM1.Sources.SourceID
3. Set ODM2Core.Affiliations.IsPrimaryOrganizationContact = 1 - this is essentially what inclusion of this person in the the ODM1 Sources table meant.
4. Set ODM2Core.Affiliations.AffiliationStartDate = the current system date. *This is a total punt, but didn't know what else to do since it is required and ODM1 does not have this information.* 
5. Set ODM2Core.Affiliations.AffiliationEndDate = NULL - *ODM1 does not have thing information, but it's nullable*
6. Set ODM2Core.Affiliations.PrimaryPhone = ODM1.Sources.Phone
7. Set ODM2Core.Affiliations.PrimaryEmail = ODM1.Sources.Email
8. Set ODM2Core.Affiliations.PrimaryAddress = ODM1.Sources.Address + ODM1.Sources.City + ODM1.Sources.State + ODM1.Sources.State + ODM1.Sources.Zipcode

**(7 Records added to ODM2Core.Affiliations)**

#### OffsetOrigins for ResultValues
The ODM2.OffsetOrigins table is nearly the same as the ODM1.OffsetTypes table. So, I can just copy the records across, using the same IDs.

1. Set ODM2.OffsetOrigins.OffsetOriginID = ODM1.OffsetTypes.OffsetTypeID
2. Set ODM2.OffsetOrigins.OffsetOriginDescription = ODM1.OffsetTypes.OffsetDescription
3. Set ODM2.OffsetOrigins.OffsetCoordinateUnitsID = ODM1.OffsetTypes.OffsetUnitsID

**(2 Records added to ODM2Results.OffsetOrigins)**

#### Actions for Sensor-Based Data 
Since I am not dealing with any of my equipment or field visit data yet, I am just going to add and "Observation Act" for each of the sensor-based time series in my ODM1 database. This could be a little problematic in the future as I really want my "Deployment" Actions associated with the results, but for now I'm not goint to do this. Since there is a 1:1 correspondence between Actions and Results for my sensor-based data, I can use the SeriesIDs from the ODM1.SeriesCatalog table for both ActionIDs and ResultIDs in my ODM2 database. But, I first have to filter out any time series in the ODM1 SeriesCatalog table that are for sample based data (e.g., they have values with a SampleID that is not NULL).

1. Set ODM2.Actions.ActionID = ODM1.SeriesCatalog.SeriesID
2. Set ODM2.Actions.ActionTypeCV = 'Observation Act' - *this may be problematic in the future*.
3. Set ODM2.Actions.BeginDateTime = ODM1.SeriesCatalog.BeginDateTime
4. Calculated ODM2.Actions.BeginDateTimeUTCOffset from ODM1.SeriesCatalog.BeginDateTime and ODM1.SeriesCatalog.BeginDateTimeUTC
5. Set ODM2.Actions.EndDateTime = ODM1.SeriesCatalog.EndDateTime
6. Calculated ODM2.Actions.EndDateTimeUTCOffset from ODM1.SeriesCatalog.EndDateTime and ODM1.SeriesCatalog.EndDateTimeUTC
7. Set ODM2.Actions.ActionDescription = 'Sensor deployment and observation' - doesn't exist in ODM1
8. Set ODM2.Actions.ActionFileLink = NULL - doesn't exist in ODM1

**(473 Records added to ODM2Core.Actions)**

#### ActionBy records for Sensor-Based Data
Since there really isn't any information in ODM1 about who performed any of the Actions, I will assume that the contact person from each of the ODM1 Sources is the Observer and the lead of the ODM2 Observation Act.  This part only works correctly because the Sensor deployment and observation Actions are the only Actions I have added so far.

1. Set ODM2.ActionBy.ActionID = ODM2.Actions.ActionID = ODM1.SeriesCatalog.SeriesID
2. Set ODM2.ActionBy.AffiliationID = ODM2.Affiliations.AffiliationID = ODM2.Sources.SourceID
3. Set ODM2.ActionBy.IsActionLead = 1
4. Set ODM2.ActionBy.RoleDescription = 'Observer'

**(473 Records added to ODM2Core.ActionBy)**

#### Results for Sensor-Based Data
Similar to Actions, I can just use the SeriesIDs from the ODM1 SeriesCatalog table to identify the Results for sensor-based data from the ODM1 database.

1. Set ODM2.Results.ResultID = ODM1.SeriesCatalog.SeriesID
2. Set ODM2.Results.ResultTypeCV = 'Time Series Coverage'
3. Set ODM2.Results.VariableID = ODM1.SeriesCatalog.VariableID
4. Set ODM2.Results.UnitsID = ODM1.SeriesCatalog.VariableUnitsID
5. Set ODM2.Results.TaxonomicClassifierID = NULL - doesn't exist in ODM1 and don't need it for sensor-based data
6. Set ODM2.Results.QualityControlLevelID = ODM1.SeriesCatalog.QualityControlLevelID
7. Set ODM2.Results.ResultDateTime = current system date, e.g., the time the result was added to the database.
8. Calculated the ResultDateTimeUTCOffset from the current system date and the current system date as UTC
9. Set ODM2.Results.ValidDateTime = NULL
10. Set ODM2.Results.ValidDateTimeUTCOffset = NULL
11. Set ODM2.Results.StatusCV = 'Unknown' - ODM1 doesn't have any information about this, so I set to 'Unknown'.
12. Set ODM2.Results.SampledMediumCV = ODM1.SeriesCatalog.SampleMedium
13. Set ODM2.Results.ValueCount = ODM1.SeriesCatalog.ValueCount
14. Set ODM2.Results.IntendedObservationSpacing = 'Unknown' - this doesn't exist in ODM1 and since there is no info, just set to 'Unknown'

**(473 Records added to ODM2Core.Results)**

#### FeatureActionResult Records for Sensor-Based Data
Here I can construct the unique combinations of SamplingFeature, Action, and Result from the SeriesCatalog of the ODM1 database. It's easy because I have used the SeriesIDs as both the ActionIDs and ResultIDs. But, again, I first have to filter out any time series in the ODM1 SeriesCatalog table that are for sample based data (e.g., they have values with a SampleID that is not NULL).

1. Set ODM2.FeatureActionResult.SamplingFeatureID = ODM1.SeriesCatalog.SiteID
2. Set ODM2.FeatureActionResult.ActionID = ODM1.SeriesCatalog.SeriesID
3. Set ODM2.FeatureActionResult.ResultID = ODM1.SeriesCatalog.SerieID

**(473 Records added to ODM2Core.FeatureActionResult)**

#### ResultValues for Sensor-Based Data
Given that I have used the ODM1.SeriesCatalog.SeriesID to identify the ODM2.Result for each sensor-based time series, I can use the SeriesIDs to identify the DataValues coming out of my ODM1 database. This operation has to filter out any DataValues that have a sample associated with them (I only want sensor-based data).  But, *while sufficient for my data, this simple filter may not be sufficient for all ODM1 databases*. For now, I am assuming that DataValues only have Z offsets.  Again, *while sufficient for my data, this simple filter may not be sufficient for all ODM1 databases that may have different types of offsets*.  Finally, I am preserving ValueIDs from teh ODM1 database so I can go back later and add ODM2 Annotations for ODM1 Qualifiers

1. Set ODM2.ResultValues.ValueID = ODM1.DataValues.ValueID
2. Set ODM2.ResultValues.ResultID = ODM1.SeriesCatalog.SeriesID
3. Set ODM2.ResultValues.DataValue = ODM1.DataValues.DataValue
4. Set ODM2.ResultValues.ValueDateTime = ODM1.DataValues.LocalDateTime
5. Set ODM2.ResultValues.ValueDateTimeUTCOffset = ODM1.DataValues.UTCOffset
6. Set ODM2.ResultValues.OffsetOriginID = ODM1.DataValues.OffsetTypeID
7. Set ODM2.ResultValues.ValueXLocation = NULL - doesn't exist in ODM1
8. Set ODM2.ResultValues.ValueYLocation = NULL - doesn't exist in ODM1
9. Set ODM2.ResultValues.ValueZLocation = ODM1.DataValues.OffsetValue
10. Set ODM2.ResultValues.CensorCodeCV = ODM1.DataValues.CensorCode
11. Set ODM2.ResultValues.QualityCodeCV = NULL - doesn't exist in ODM1
12. Set ODM2.ResultValues.AggregationDuration = ODM1.SeriesCatalog.TimeSupport + ODM1.SeriesCatalog.TimeUnitsName - this field doesn't exits in ODM1, so I concatentated the time support and units to construct this field.  There's probably a better way to do it and this should either be broken up into two fields or should be expressed as a time interval according to a standard encoding
13. Set ODM2.ResultValues.InterpolationTypeCV = ODM1.SeriesCatalog.DataType

**(24,356,085 Records added to ODM2Results.ResultValues - will change every day since I am continuously adding new data)**

## Implementation Notes for Sample-Based Data ##

#### SamplingFeatures and Specimens
ODM1 has a Samples table that is used to populate ODM2.Specimens.  However, in ODM1, Samples were linked directly to DataValues.  In ODM2, this is not the case. Linking water quality samples to DataValues in ODM2 requires going from Specimens --> SamplingFeatures --> FeatureActionResult --> Result --> ResultValues.

1. I built a temporary table with a bunch of Specimen metadata so I could get the SamplingFeatureIDs, ActionIDs, and ResultIDs correct
    * Set SamplingFeatureIDs for the Specimens by adding DISTINCT ODM1.Samples.SampleID to the maximum SamplingFeatureID already in the ODM2.SamplingFeatures table.
    * Set ActionIDs for "Sample collection" Actions by adding DISTINCT ODM1.Samples.SampleID to the maximum ActionID already in ODM2.
    * Assumed only one "Sample analysis" action per Sample. *This is a little ambiguous in ODM1 because both SampleID and LabMethodID are in the Samples table*. Given this, I set ActionIDs for "Sample analysis" Actions by adding DISTINCT ODM1.Samples.SampleID to the maximum SampleID from ODM1 and the maximum ActionID already in ODM2 (with @MaxActionID being calculated before adding the Sample Collection Actions)
    * It is possible to have multiple DataValues as the result of a laboratory analysis on a Sample in ODM1. This isn't the case for my dataset, but could happen for others. So, I created ResultIDs by adding the maximum ResultID already in the Results table to the ValueID for the sample-based DataValue from ODM1.

**(3,634 Records added to #TempSpecimenInfo)**

**Specimens in ODM2Core.SamplingFeatures**: My water quality samples in ODM1 are Specimen SamplingFeatures in ODM2. I first need to create records for the water quality samples in ODM2Core.SamplingFeatures.  

1. Set ODM2Core.SamplingFeatures.SamplingFeatureID = ODM1.Samples.SampleID + @MaxSamplingFeatureID
2. Set ODM2Core.SamplingFeatures.SamplingFeatureTypeCV = 'Specimen'
3. Set ODM2Core.SamplingFeatures.SamplingFeatureName = ODM1.Samples.LabSampleCode
4. Set ODM2Core.SamplingFeatures.SamplingFeatureGeoTypeCV = NULL - not applicable for Specimens
5. Set ODM2Core.SamplingFeatures.SpatialReferenceID = NULL - not applicable for Specimens
6. Set ODM2Core.SamplingFeatures.FeatureGeometry = NULL - not applicable for Specimens
7. Set ODM2Core.SamplingFeatures.SamplingFeatureDescription = 'Water Quality Sample' - *This is appropriate for my database, but is not generic for all ODM1 databases.  Might be better to just set this to something like "ODM1 Sample" or something generic like that*

**(3,634 Records added to ODM2Core.SamplingFeatures)**

**Specimens in ODM2SamplingFeatures.Specimens**: Next, I need to create records for each water quality sample in the ODM2SamplingFeautures.Specimens table.

1. Set ODM2.Specimens.SamplingFeatureID = ODM1.Samples.SampleID + @MaxSamplingFeatureID
2. Set ODM2SamplingFeautures.Specimens.SpecimenTypeCV = ODM1.Samples.SampleType
3. Set ODM2SamplingFeautures.Specimens.SpecimenCode = ODM1.Samples.LabSampleCode
4. Set ODM2SamplingFeautures.Specimens.SpecimenMediumCV = ODM1.Variables.SampleMedium
5. Set ODM2SamplingFeautures.Specimens.IsFieldSpecimen = 1

**(3,634 Records added to ODM2SamplingFeatures.Specimens)**

**Specimens in ODM2SamplingFeatures.FeatureParents**: Once records have been created in both the Specimens and SamplingFeatures tables, I can add records to the ODM2SamplingFeatures.FeatureParents table to record which Site SamplingFeature each Specimen was collected at.

1. Set ODM2SamplingFeautures.FeatureParents.SamplingFeatureID = ODM1.Samples.SampleID + @MaxSamplingFeatureID
2. Set ODM2SamplingFeautures.FeatureParents.ParentFeatureID = ODM1.Sites.SiteID - *I can do this because I used the SiteIDs from the ODM1 database as the SamplingFeatureIDs in the ODM2 database*
3. Set ODM2SamplingFeautures.FeatureParents.RelationshipTypeCV = 'wasCollectedAt' - *this is supposed to be a CV, but I just made this up for now. But, this is essentially a way of saying that the Specimen recorded in SamplingFeatureID **wasCollectedAt** the SamplingFeature recorded in ParentFeatureID*.
4. Set ODM2SamplingFeautures.FeatureParents.SpatialOffsetID = NULL - don't need this for any of my samples

**(3,634 Records added to ODM2SamplingFeatures.FeatureParents)**

#### Sample Collection Actions
Since I have a bunch of water quality samples (Specimens) in my ODM1 database, I need to create a "Sample collection" Action for each sample. Make sure to filter out DataValues that do not have a sample (e.g., ODM1.DataValues.SampleID IS NOT NULL).

1. Set ODM2Core.Actions.ActionID = @MaxActionID + ODM1.DataValues.SampleID
2. Set ODM2Core.Actions.ActionTypeCV = 'Sample collection'
3. Set ODM2Core.Actions.MethodID = ODM1.DataValues.MethodID - *this only works for the LBR data because of the way I have specified the ODM1 Method for sample-based data values as a sample collection Method. But, this may not work for all ODM1 databases because other data managers may not have done this*.
4. Set ODM2Core.Actions.BeginDateTime = ODM1.DataValues.LocalDateTime
5. Set ODM2Core.Actions.BeginDateTimeUTCOffset = ODM1.DataValues.UTCOffset
6. Set ODM2Core.Actions.EndDateTime = ODM1.DataValues.LocalDateTime
7. Set ODM2Core.Actions.EndDateTimeUTCOffset = ODM1.DataValues.UTCOffset
8. Set ODM2Core.Actions.ActionDescription = 'Sample collection'
9. Set ODM2Core.Actions.ActionFileLink = NULL

**(3,634 Records added to ODM2Core.Actions)**

**Populate ODM2Core.ActionBy for "Sample collection" Actions**: Each "Sample collection" action is performed by a person. In ODM1, I only have the person that is affiliated with the Source record. So, I arbitrarily use that person as the "Sample collector".

1. Set ODM2Core.ActionBy.ActionID = @MaxActionID + ODM1.DataValues.SampleID
2. Set ODM2Core.ActionBy.AffiliationID = ODM1.Sources.SourceID - this works because I used the ODM1 SourceIDs as the OrganizationIDs in ODM2
3. Set ODM2Core.ActionBy.IsActionLead = 1
4. Set ODM2Core.ActionBy.RoleDescription = 'Sample collector'

**(3,634 Records added to ODM2Core.ActionBy)**

**Populate ODM2Core.FeatureActionResult for "Sample collection" Actions**: Now I need to add records to the FeatureActionResult table linking the "Sample collection" Actions to the Specimen SamplingFeatures that were collected.

1. Set ODM2Core.FeatureActionResult.SamplingFeatureID = ODM1.Samples.SampleID + @MaxSamplingFeatureID
2. Set ODM2Core.FeatureActionResult.ActionID = @MaxActionID + ODM1.DataValues.SampleID
3. Set ODM2Core.FeatureActionResult.ResultID = NULL - since these are 'Sample collection' Actions, they have no result

**(3,634 Records added to ODM2Core.FeatureActionResult)**

#### Sample Analysis Actions
The "Sample analysis" Actions on the Specimens I just created for my water quality samples are the Actions that create the measurement Results. So, I need to create a "Sample analysis" Action for each Specimen to link it to its Result. I don't have any information about the dates and times at which the "Sample analysis" Actions occurred and so I am just going to use the dates and times recorded with the DataValues in the ODM1 database.

1. Set ODM2Core.Actions.ActionID = ODM1.Samples.SampleID + @MaxSampleID + @MaxActionID - the @MaxSampleID and @MaxActionID were evaluated before adding either the "Sample collection" or "Sample analysis" actions
2. Set ODM2Core.Actions.ActionTypeCV = 'Sample analysis'
3. Set ODM2Core.Actions.MethodID = ODM2.Methods.MethodID - this is the MethodID for the appropriate LabMethod from ODM1, which I have already added to the database
4. Set ODM2Core.Actions.BeginDateTime = ODM1.DataValues.LocalDateTime
5. Set ODM2Core.Actions.BeginDateTimeUTCOffset = ODM1.DataValues.UTCOffset
6. Set ODM2Core.Actions.EndDateTime = ODM1.DataValues.LocalDateTime
7. Set ODM2Core.Actions.EndDateTimeUTCOffset = ODM1.DataValues.UTCOffset
8. Set ODM2Core.Actions.ActionDescription = 'Sample laboratory analysis'
9. Set ODM2Core.Actions.ActionFileLink = NULL

**(3,634 Records added to ODM2Core.Actions)**

**Populate ODM2Core.ActionBy for "Sample analysis" Actions**: Each "Sample analysis" action is performed by a person. In ODM1, I only have the person that is affiliated with the Source record. So, I arbitrarily use that person as the "Analyst".

1. Set ODM2Core.ActionBy.ActionID = ODM1.Samples.SampleID + @MaxActionID + @SampleCount - @MaxActionID and @SampleCount were evaluated before adding either the "Sample collection" or "Sample analysis" actions
2. Set ODM2Core.ActionBy.AffiliationID = ODM1.Sources.SourceID - this works because I used the ODM1 SourceIDs as the OrganizationIDs in ODM2
3. Set ODM2Core.ActionBy.IsActionLead = 1
4. Set ODM2Core.ActionBy.RoleDescription = 'Analyst'

**(3,634 Records added to ODM2Core.ActionBy)**

#### Results
Each Result record will detail a "Measurement" Result that has a single ResultValue.

1. Set ODM2Core.Results.ResultID = 
2. Set ODM2Core.Results.ResultTypeCV = 'Measurement'
3. Set ODM2Core.Results.VariableID = ODM1.DataValues.VariableID - I can do this because I used the ODM1 VariableIDs in ODM2
4. Set ODM2Core.Results.UnitsID = ODM1.Variables.VariableUnitsID - I can do this because I used the ODM1 UnitsIDs in ODM2
5. Set ODM2Core.Results.TaxonomicClassifierID = NULL
6. Set ODM2Core.Results.QualityControlLevelID = 1
7. Set ODM2Core.Results.ResultDateTime = ODM1.DataValues.LocalDateTime
8. Set ODM2Core.Results.ResultDateTimeUTCOffset = ODM1.DataValues.UTCOffset
9. Set ODM2Core.Results.ValidDateTime = NULL
10. Set ODM2Core.Results.ValidDateTimeUTCOffset = NULL
11. Set ODM2Core.Results.StatusCV = 'Complete'
12. Set ODM2Core.Results.SampledMediumCV = ODM1.Variables.SampleMedium
13. Set ODM2Core.Results.ValueCount = 1
14. Set ODM2Core.Results.IntendedObservationSpacing = 'Unknown'

**(3,634 Records added to ODM2Core.Results)**

**Populate ODM2Core.FeatureActionResult for "Sample analysis" Actions**: Now I need to add records to the FeatureActionResult table linking the "Sample analysis" Actions to the Specimen SamplingFeatures that they were performed on and their Result. This is a little tricky because a single laboratory analysis on a Sample in ODM1 could potentially result in multiple DataValues. The Results have to exist before I can do this.

1. Set ODM2Core.FeatureActionResult.SamplingFeatureID = ODM1.Samples.SampleID + @MaxSamplingFeatureID
2. Set ODM2Core.FeatureActionResult.ActionID = ODM1.Samples.SampleID + @MaxActionID + @SampleCount - the "Sample analysis" Action
3. Set ODM2Core.FeatureActionResult.ResultID = @MaxResultID + ODM1.DataValues.ValueID - I'm using the ValueID from ODM1.DataValues to create the ResultID.

**(3,634 Records added to ODM2Core.FeatureActionResults)**

#### Related Actions ####
The "Sample collection" Activities are related to the "Sample analysis" Actions and I want to store that relationship. So, I need to relate them in the ODM2Core.RelatedActions table. @MaxActionID and @SampleCount have to be calculated before either of the "Sample collection" or "Sample analysis" Actions are created in the database.

1. Set ODM2Core.RelatedActions.ActionID = ODM1.Samples.SampleID + @MaxActionID - the "Sample collection" Action
2. Set ODM2Core.RelatedActions.RelatedActionID = ODM1.Samples.SampleID + @MaxActionID + @SampleCount - the "Sample analysis" Action
3. Set ODM2Core.RelatedActions.RelationshipTypeCV = 'isSampleCollectionFor' - *this is supposed to be a CV, but I just made it up for now. The term I used asserts that the Action recorded by ActionID (the "Sample collection" Action) **isSampleCollectionFor** the Action recorded in RelatedActionID (the "Sample analysis" Action*.

**(3,634 Records added to ODM2Core.RelatedActions)**

#### ResultValues for Sample-based Results ####
Add the DataValues from the Sample-based data in ODM1 to ODM2 as ResultValues.

1. Set ODM2Results.ResultValues.ValueID = ODM1.DataValues.ValueID
2. Set ODM2Results.ResultValues.ResultID = @MaxResultID + ODM1.DataValues.ValueID
3. Set ODM2Results.ResultValues.DataValue = ODM1.DataValues.DataValue
4. Set ODM2Results.ResultValues.ValueDateTime = ODM1.DataValues.LocalDateTime
5. Set ODM2Results.ResultValues.ValueDateTimeUTCOffset = ODM1.DataValues.UTCOffset
6. Set ODM2Results.ResultValues.OffsetOriginID = ODM1.DataValues.OffsetTypeID
7. Set ODM2Results.ResultValues.ValueXLocation = NULL
8. Set ODM2Results.ResultValues.ValueYLocation = NULL
9. Set ODM2Results.ResultValues.ValueZLocation = ODM1.DataValues.OffsetValue
10. Set ODM2Results.ResultValues.CensorCodeCV = ODM1.DataValues.CensorCode
11. Set ODM2Results.ResultValues.QualityCodeCV = NULL
12. Set ODM2Results.ResultValues.AggregationDuration = CAST(ODM1.Variables.TimeSupport AS VARCHAR(5)) + ' ' + ODM1.Units.UnitsName
13. Set ODM2Results.ResultValues.InterpolationTypeCV = ODM1.Variables.DataType

**(3,634 Records added to ODM2Results.ResultValues)**

#### Annotations ####
I need to add the DataValue Qualifiers from ODM1 to ODM2. DataValue Qualifiers were really the only types of Annotations supported by ODM1.

Adding records to the **ODM2Annotations.Annotations** table:

1. Set ODM2Annotations.Annotations.AnnotatioID = ODM1.Qualifiers.QualifierID - I can do this because DataValue Qualifiers are the only Annotations in ODM1
2. Set ODM2Annotations.Annotations.AnnotationTypeCV = 'Data Value Qualifier' - this needs to eventually conform to a CV
3. Set ODM2Annotations.Annotations.AnnotationCode = ODM1.Qualifiers.QualifierCode
4. Set ODM2Annotations.Annotations.AnnotationText = ODM1.Qualifiers.QualifierDescription - had to truncate this to 500 characters to match ODM2 schema. ODM1 allowed more characters.
5. Set ODM2Annotations.Annotations.AnnotationDateTime = NULL - I really don't know anything about when these annotations were applied
6. Set ODM2Annotations.Annotations.AnnotationUTCOffset = NULL
7. Set ODM2Annotations.Annotations.AnnotatorID = NULL

Adding records to the **ODM2Annotations.ResultValueAnnotations** table:

1. Set ODM2Annotations.ResultValueAnnotations.ValueID = ODM1.DataValues.ValueID - I can do this because I preserved the ValueIDs when I moved the data across
2. Set ODM2Annotations.ResultValueAnnotations.AnnotationID = ODM1.DataValues.QualifierID - I can do this because I used the QualifierIDs from ODM1 as the AnnotationIDs in ODM2

**(10 Records added to ODM2Annotations.Annotations)**
**(68,643 Records added to ODM2Annotations.ResultValueAnnotations)**

## TODO: ##
1.  Modify some fields that should conform to CVs to use accepted CV values.






