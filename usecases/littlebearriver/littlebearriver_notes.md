ODM2 Data Use Case:  Little Bear River
======================================

The Little Bear River data are currently stored in a CUAHSI Hydrologic Information System (HIS) ODM Version 1.1.1 database in Microsoft SQL Server. The data consist of time series of hydrologic observations collected at aquatic and weather monitoring sites in the Little Bear River of Northern Utah, USA. Also included are water quality samples collected in the Little Bear River and analyzed for constutents such as sediment and nutrient concentrations.

[Documentation for ODM 1.1.1](http://hydroserver.codeplex.com/wikipage?title=Observations%20Data%20Model&referringTitle=Documentation) is available online. More information about the Little Bear River data is available [here](http://littlebearriver.usu.edu).


### Notes on Implementation of ODM2 for Little Bear River Data

#### SamplingFeatures and Sites
1. Used the existing SiteIDs from ODM1 as the SamplingFeatureIDs in ODM2
2. Used the LatLongDatumID from ODM1.Sites as the SpatialReferenceID in ODM2.SamplingFeatures
3. Copied the SpatialReference from ODM1 to ODM2

#### SamplingFeatures and Specimens
1. Used the SampleIDs from ODM1 to create SamplingFeatureIDs for my Specimens (water quality samples). But, had to increment them by adding the maximum SamplingFeatureID in the SamplingFeatures table after I added the Sites.
2. I create a temporary table that has the Specimen metadata and IDs in it.
    * Set ODM2.SamplingFeatureID = ODM1.SampleID + MaxSamplingFeatureID
    * Set ODM2.SamplingFeatureName = ODM1.LabSampleCode
    * SamplingFeatureGeoTypeCV, SpatialReferenceID, and FeatureGeometry are NULL
    * Set ODM2.SamplingFeatureDescription = "Water quality sample".  *This is appropriate for my database, but is not generic for all ODM1 databases*.