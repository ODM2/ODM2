ODM2 Extensions: Sampling Features
==================================
In many cases, we wish to make observations on geospatial features that can be inaccessible or whose properties are not directly observable. OGC's O&M defines these geospatial features as "Features of Interest", or the feature of ultimate interest to an investigation. To overcome these limitations, proximate "Sampling Features" are used for observation. Sampling Features are accessible and have properties that are sensible. ODM2 adopts the term "Sampling Feature" from OGC's O&M to describe the entities on which or at which observations are made (and other Actions are performed). Sampling Features can be of many different types, including:

* Sites/Stations
* Specimens
* Transects
* Sections
* Profiles
* Bore holes
* Etc.

The ODM2 Sampling Features extension enables the encoding of detailed information about Sampling Features. ODM2 focuses on Sampling Features that are Sites/Stations and Specimens, but several other types of Sampling Features can be represented.

#### SiteType ####
The SiteType field should be populated using terms from the ODM2 SiteType controlled vocabulary. The SiteType CV currently includes terms from the USGS Site Type Codes (USGS SiteTypes). Although a good place to start, the USGS site types include a few terms that could be considered “Features of Interest” and not “Sampling Features” (e.g., "stream, ocean, canal, ditch spring, glacier, atmosphere, etc.""). Some moderation is needed to ensure that ODM2 SiteTypes are consistently “Sampling Features” and not “Features of Interest.”  