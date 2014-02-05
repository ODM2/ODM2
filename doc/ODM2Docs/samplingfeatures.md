[Sampling Features](http://uchic.github.io/ODM2/schemas/ODM2_Current/tables/ODM2Core_SamplingFeatures.html)
=================

In many cases, we wish to make observations on geospatial features that can be inaccessible or whose properties are not directly observable. OGC's O&M defines these geospatial features as "Features of Interest", or the feature of ultimate interest to an investigation. To overcome these limitations, proximate "Sampling Features" are used for observation. Sampling Features are accessible and have properties that are sensible. ODM2 adopts the term "Sampling Feature" from OGC's O&M to describe the entities on which or at which observations are made (and other Actions are performed). Sampling Features can be of many different types, including:

* Sites/Stations
* Specimens
* Transects
* Sections
* Profiles
* Bore holes
* Etc.

Every Action must be performed on or at a Sampling Feature. For example, a field vist Action is made to a "Site" Sampling Feature. A laboratory analysis Action is performed on a "Specimen" Sampling Feature. In the ODM2 Core schema, only the type of the Sampling Feature and its geometry are given. All other details of the Sampling Feature are encoded within the ODM2 Sampling Features extension.

Sampling Features are described in more detail in the section about the ODM2 Sampling Features extension.
