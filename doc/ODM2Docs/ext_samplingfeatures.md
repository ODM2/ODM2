ODM2 Extensions: Sampling Features
==================================
In many cases, we wish to make observations on geospatial features that can be inaccessible or whose properties are not directly observable. The Open Geospatial Consortium's (OGC) Observations & Measurements (O&M) standard defines these geospatial features as "Features of Interest", or the feature of ultimate interest to an investigation. To overcome these limitations, proximate **SamplingFeatures** are used for observation. SamplingFeatures are accessible and have properties that are sensible. ODM2 adopts the term "SamplingFeature" from OGC's O&M to describe the entities on which or at which observations are made (and other Actions are performed). SamplingFeatures can be of many different types, including:

* Sites/Stations
* Specimens
* Transects
* Sections
* Profiles
* Bore holes
* Etc.

The ODM2SamplingFeatures extension enables the encoding of detailed information about SamplingFeatures. ODM2 focuses on SamplingFeatures that are Sites/Stations and Specimens, which are relevent to a large percentage of data use cases, but several other types of SamplingFeatures can be represented. Every SamplingFeature, regardless of type, is described first in the **SamplingFeatures** entity. Then, specific attributes of the SamplingFeature are encoded in the entity for the specific SamplingFeature type (e.g., Sites or Specimens).

### Sampling Features that are Sites ###
ODM2 adopts the ODM 1.1.1 representation of point monitoring locations as Sites. Each Site can have a SiteType, a unique identifying text code (SiteCode), a name (SiteName), Latitude and Longitude coordinates, and elevation (Elevation_m). Additional Site attributes can be expressed using either ODM2Annotations or ODM2ExtensionProperties. The geometry of the site location can be stored in the FeatureGeometry attribute of SamplingFeatures entity.

#### SiteType ####
The SiteType field should be populated using terms from the ODM2 SiteType controlled vocabulary. The SiteType CV currently includes terms from the USGS Site Type Codes (USGS SiteTypes). Although a good place to start, the USGS site types include a few terms that could be considered “Features of Interest” and not “Sampling Features” (e.g., "stream", "ocean", "canal", "ditch", "spring", "glacier", "atmosphere", etc."). Some moderation is needed to ensure that ODM2 SiteTypes are consistently “Sampling Features” and not “Features of Interest.”  

### Sampling Features that are Specimens ###


### Relationships Among Sampling Features ###
