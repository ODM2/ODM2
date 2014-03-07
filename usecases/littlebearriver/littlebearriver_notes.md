ODM2 Data Use Case:  Little Bear River
======================================

The Little Bear River data are currently stored in a CUAHSI Hydrologic Information System (HIS) ODM Version 1.1.1 database in Microsoft SQL Server. The data consist of time series of hydrologic observations collected at aquatic and weather monitoring sites in the Little Bear River of Northern Utah, USA. Also included are water quality samples collected in the Little Bear River and analyzed for constutents such as sediment and nutrient concentrations.

[Documentation for ODM 1.1.1](http://hydroserver.codeplex.com/wikipage?title=Observations%20Data%20Model&referringTitle=Documentation) is available online. More information about the Little Bear River data is available [here](http://littlebearriver.usu.edu).

### Notes on Implementation of ODM2 for Little Bear River Data

#### SamplingFeatures and Sites
Sites in ODM2 are essentially the same as in ODM1 except that both Sites and SamplingFeatures have to be populated.

1. Used the existing SiteIDs from ODM1 as the SamplingFeatureIDs for Sites in ODM2.
2. Used the SiteName from ODM1 as the SamplingFeatureName in ODM2.
3. Used ODM1.Sites.Comments as the SamplingFeatureDescription in ODM2.
4. Copied all of the SpatialReferences records from ODM1 to ODM2 - these are pretty much the same. 
5. Used the LatLongDatumID from ODM1.Sites as the SpatialReferenceID in ODM2.SamplingFeatures.
6. Some of the ODM1 Site attributes don't get copied across because they are no longer part of the Core (e.g., LocalX, LocalY, LocalProjectionID, PosAccuracy_m, State, County, Comments)

#### SamplingFeatures and Specimens
ODM1 has a Samples table that is used to populate ODM2.Specimens.  However, in ODM1, Samples were linked directly to DataValues.  In ODM2, this is not the case. Linking water quality samples to DataValues in ODM2 requires going from Specimens --> SamplingFeatures --> FeatureActionResult --> Result --> ResultValues.

1. Used the SampleIDs from ODM1 to create SamplingFeatureIDs for my Specimens (water quality samples). But, had to increment them by adding the maximum SamplingFeatureID in the SamplingFeatures table after I added the Sites.
2. I created a temporary table that has the Specimen metadata and IDs in it.
    * Set ODM2.SamplingFeatureID = ODM1.SampleID + MaxSamplingFeatureID
    * SamplingFeatureTypeCV = "Specimen"
    * Set ODM2.SamplingFeatureName = ODM1.LabSampleCode
    * SamplingFeatureGeoTypeCV, SpatialReferenceID, and FeatureGeometry are NULL
    * Set ODM2.SamplingFeatureDescription = "Water quality sample".  *This is appropriate for my database, but is not generic for all ODM1 databases*.
    * 