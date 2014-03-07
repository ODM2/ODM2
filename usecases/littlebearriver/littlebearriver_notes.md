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

### Notes on Implementation of ODM2 for Little Bear River Data

#### SamplingFeatures and Sites
Sites in ODM2 are essentially the same as in ODM1 except that both Sites and SamplingFeatures have to be populated.

1. Used the existing SiteIDs from ODM1 as the SamplingFeatureIDs for Sites in ODM2.
2. Used the SiteName from ODM1 as the SamplingFeatureName in ODM2.
3. Used ODM1.Sites.Comments as the SamplingFeatureDescription in ODM2.
4. Copied all of the SpatialReferences records from ODM1 to ODM2 - these are pretty much the same. 
5. Used the LatLongDatumID from ODM1.Sites as the SpatialReferenceID in ODM2.SamplingFeatures.
6. Some of the ODM1 Site attributes don't get copied across because they are no longer part of the Core (e.g., LocalX, LocalY, LocalProjectionID, PosAccuracy_m, State, County, Comments)

**(16 Records added to ODM2Core.SamplingFeatures)**
**(16 Records added to ODM2SamplingFeatures.Sites)**

#### SamplingFeatures and Specimens
ODM1 has a Samples table that is used to populate ODM2.Specimens.  However, in ODM1, Samples were linked directly to DataValues.  In ODM2, this is not the case. Linking water quality samples to DataValues in ODM2 requires going from Specimens --> SamplingFeatures --> FeatureActionResult --> Result --> ResultValues.

1. Used the SampleIDs from ODM1 to create SamplingFeatureIDs for my Specimens (water quality samples). But, had to increment them by adding the maximum SamplingFeatureID in the SamplingFeatures table after I added the Sites.
2. I created a temporary table that has the Specimen metadata and IDs in it.
    * Set ODM2.SamplingFeatures.SamplingFeatureID = ODM1.Samples.SampleID + @MaxSamplingFeatureID
    * ODM2.SamplingFeatures.SamplingFeatureTypeCV = "Specimen"
    * Set ODM2.SamplingFeatures.SamplingFeatureName = ODM1.LabSampleCode
    * ODM2.SamplingFeatures.SamplingFeatureGeoTypeCV, ODM2.SamplingFeatures
    * SpatialReferenceID, and ODM2.SamplingFeatures.FeatureGeometry are NULL
    * Set ODM2.SamplingFeatures.SamplingFeatureDescription = "Water quality sample".  *This is appropriate for my database, but is not generic for all ODM1 databases.  Might be better to just set this to something like "ODM1 Sample" or something generic like that*
    * ODM2.Specimens.SpecimenTypeCV = ODM1.Samples.SampleType
    * ODM2.Specimens.SpecimenCode = ODM1.Samples.LabSampleCode
    * ODM2.Specimens.SpecimenMediumCV = ODM1.Variables.SampleMedium
    * ODM2.Specimens.IsFieldSpecimen = 1

**(3,634 Records added to ODM2Core.SamplingFeatures)**
**(3,634 Records added to ODM2SamplingFeatures.Specimens)**

#### Units
Units are the same in ODM1 an ODM2.  The only change is the order in which the attributes appear in the table and ODM1.Units.UnitsType = ODM2.Units.UnitsTypeCV.  Copied Units straight across from ODM1, preserving the UnitsIDs.

**(355 Records added to ODM2Core.Units)**

#### QualityControlLevels
QualityControlLevels are the same in ODM1 and ODM2. Copied QualityControlLevels straight across from ODM1, preserving the QualityControlLevelIDs.

**(6 Records added to ODM2Core.QualityControlLevels)**

#### Variables
Variables in ODM2 have fewer attributes because some of the information has been moved to the Result (e.g., Units). Additionaly, the CV fields in ODM2.Variables are named with a "CV" at the end.

1. Copied Variables from ODM1 preserving VariableIDs
2. Set ODM2.Variables.VariableTypeCV to 'Unknown' - It's required, but I don't know what to do with this field yet
3. Set ODM2.Variables.VariableDefinition = "NULL" - not sure what to do here
4. All of the other ODM2 fields are the same as they are in ODM1

**(63 Records added to ODM2Core.Variables)**

#### Organizations
Organizations in ODM2 roughly map to Sources in ODM1. However, the attributes aren't quite the same.

1. Created an Organization in ODM2 for each record in the ODM1.Sources table
2. Set ODM2.Organizations.OrganizationID = ODM1.Sources.SourceID 
3. Set ODM2.Organizations.OrganizationTypeCV = 'Research Institute' - *this may not be quite right, and may even be wrong for many types of Sources that people have used in ODM1 databases*.
4. Set ODM2.Organizations.OrganizationCode = ODM1.Sources.SourceID - there is no OrganizationCode in ODM1, so I just used the ID as the code.
5. Set ODM2.Organization.OrganizationName = ODM1.Sources.Organization
6. Set ODM2.Organization.OrganizationDescription = ODM1.Sources.SourceDescription
7. Set ODM2.Organization.OrganizationLink = ODM1.Sources.SourceLink
8. Set ODM2.Organization.ParentOrganization = NULL - this concept doesn't exist in ODM1 and so there's nothing for me to move across

**(7 Records added to ODM2Core.Organizations)**

#### Methods
Methods in ODM2 have more attributes than Methods in ODM1. But, Methods can essentially be copied straight across using the same IDs.

1. Copied Methods from ODM1, preserving MethodIDs
2. Set ODM2.Methods.MethodTypeCV = 'Unknown' - this is required, but I have no way of getting this from ODM1 because there is no MethodType in ODM1.  So, I set this to 'Unknown' since it has to have a value
3. Set ODM2.Methods.MethodCode = ODM1.Methods.MethodID - the code is required, but doesn't exist in ODM1, so I used the MethodID
4. Set ODM2.Methods.MethodName = ODM1.Methods.MethodDescription - there is no MethodName in ODM1, so I just used the MethodDescription
5. Set ODM2.Methods.MethodDescription = ODM1.Methods.MethodDecription - this duplicates information, but only because ODM1 doesn't have a MethodName
6. Set ODM2.Methods.MethodLink = ODM1.Methods.MethodLink
7. Set ODM2.Methods.OrganizationID = NULL - ODM1 doesn't have the capability to link Methods to Organizations, so this has to be NULL

**(59 Records added to ODM2Core.Methods)**

In ODM1, there was also a LabMethods table that was linked to Samples. This is where laboratory analytical methods used to analyze samples were stored. In ODM2 we have generalized Methods and so I need to add the LabMethods from ODM1 to the Methods table in ODM2.  Additionally, LabMethods in ODM1 do have Organization information associated with them and so I need to create appropriate Organization records in ODM2 and associate them with the ODM1.LabMethods that I add to the ODM2.Methods table.

First, I created the ODM2 Organizations for the ODM1 analytical labs:

1. Set ODM2.Organizations.OrganizationTypeCV = 'Analytical Laboratory'
2. Set ODM2.Organizations.OrganizationCode = ODM1.LabMethods.LabName - there is no OrganizationCode in ODM1, so just used the LabName
3. Set ODM2.Organizations.OrganizationName = ODM1.LabMethods.LabName
4. Set ODM2.Organizations.OrganizationDescription = ODM1.LabMethods.LabOrganization
5. Set ODM2.Organizations.OrganizationLink = NULL - doesn't exist in ODM1
6. Set ODM2.Organizations.ParentOrganizationID = NULL - doesn't exist in ODM1

**(7 Records added to ODM2Core.Organizations)**

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
There is no separate People table in ODM1. However, there is a contact person for each organization in the ODM1.Sources table.

1. Created a record in the ODM2.People table for each person in the ODM1.Sources table.
2. *I used a substring function that splits the person's name into first and last.  this may not work for all names - especially in cases where someone has input a middle name or initial*.  The mapping may be imperfect for some ODM1 databases.

**(4 Records added to ODM2Core.People)**

#### Affiliations
There is no Affiliations entity in ODM1. So, I just mapped the PersonIDs to the Organizations from which they came in the ODM1 database.

1. Get ODM2.Affiliations.PersonID from the People tabl
2. Set ODM2.Affiliations.OrganizationID = ODM1.Sources.SourceID
3. Set ODM2.Affiliations.IsPrimaryOrganizationContact = 1 - this is essentially what inclusion of this person in the the ODM1 Sources table meant.
4. Set ODM2.Affiliations.AffiliationStartDate = the current system date. *This is a total punt, but didn't know what else to do since it is required and ODM1 does not have this information.* 
5. Set ODM2.Affiliations.AffiliationEndDate = NULL - *ODM1 does not have thing information, but it's nullable*
6. Set ODM2.Affiliations.PrimaryPhone = ODM1.Sources.Phone
7. Set ODM2.Affiliations.PrimaryEmail = ODM1.Sources.Email
8. Set ODM2.Affiliations.PrimaryAddress = ODM1.Sources.Address + ODM1.Sources.City + ODM1.Sources.State + ODM1.Sources.State + ODM1.Sources.Zipcode

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

**(24,334,243 Records added to ODM2Results.ResultValues)**







