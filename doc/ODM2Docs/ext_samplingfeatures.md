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

The [ODM2SamplingFeatures extension](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2SamplingFeatures.html) enables the encoding of detailed information about SamplingFeatures. ODM2 focuses on SamplingFeatures that are Sites/Stations and Specimens, which are relevent to a large percentage of data use cases, but several other types of SamplingFeatures can be represented. Every SamplingFeature, regardless of type, is described first in the [**SamplingFeatures** entity](http://uchic.github.io/ODM2/schemas/ODM2_Current/tables/ODM2Core_SamplingFeatures.html). Then, specific attributes of the SamplingFeature are encoded in the entity for the specific SamplingFeature type (e.g., Sites or Specimens).

### Sampling Features that are Sites ###
ODM2 adopts the ODM 1.1.1 representation of point monitoring locations as [Sites](http://uchic.github.io/ODM2/schemas/ODM2_Current/tables/ODM2SamplingFeatures_Sites.html). Each Site can have a SiteType, a unique identifying text code (expressed in SamplingFeatureCode), a name (expressed in SamplingFeatureName), Latitude and Longitude coordinates, and elevation (Elevation_m). Additional Site attributes can be expressed using either ODM2Annotations or ODM2ExtensionProperties. The geometry of the site location can be stored in the FeatureGeometry attribute of SamplingFeatures entity.

#### Sites.SiteType ####
The SiteType field should be populated using terms from the ODM2 SiteType controlled vocabulary. The SiteType CV currently includes terms from the USGS Site Type Codes (USGS SiteTypes). Although a good place to start, the USGS site types include a few terms that could be considered “Features of Interest” and not “Sampling Features” (e.g., "stream", "ocean", "canal", "ditch", "spring", "glacier", "atmosphere", etc."). Some moderation is needed to ensure that ODM2 SiteTypes are consistently “Sampling Features” and not “Features of Interest.”

#### Sites.LatLonDatumID and SpatialReferences ####
The datum of the Latitude and Longitude coordinates in the Sites entity is given by a spatial reference system (SRS). Sites can be linked to an appropriate record in the **SpatialReferences** entity that specifies the SRS. Users must encode a name for the SRS, but are strongly encouraged to use the SRSCode field to encode the specific SRS used. Where possible, SRSs should be selected from existing lists such as those maintained by EPSG or ESRI and should be encoded using the prefix for the system from which they were selected followed by a colon and the specific SRS identifier (e.g., "epsg:4326" for Latitude and Longitude coordinates on the WGS84 reference ellipsoid).

### Sampling Features that are Specimens ###
**Specimens** are equivalent to "samples" and may take many forms. Specimens can have a SpecimenType chosen from a controlled vocabulary. They can also be qualified by a SpecimenMedium, which is the environmental medium of the sample - e.g., rock, water, sediment, tissue, etc. 

Specimens are typically collected at a **Site**.  For example, a researcher might collect many water quality Specimens at a fixed aquatic monitoring Site in a stream. Or, a researcher may collect many soil Specimens at a single Site. In these cases, a **Geometry** can be applied to the Site SamplingFeature to indicate the geospatial location of the Site. The Specimens themselves would not have a Geometry, but the relationship between Specimens and the Site at which they were collected would then be stored in the **FeatureParents** entity. 

However, there are also instances when a researcher may collect many Specimens over a spatial domain, but where there is no intention to ever return to any of the exact locations at which the Specimens were collected. In this case, the researcher may choose not to create a formal Site for each spatial location at which a Specimen was collected, but it is still important to record the exact location at which each Specimen was collected. In these cases, ODM2 allows users to apply a Geometry directly to the Specimen. Where a Specimen has a Geometry, it would be interpreted as the location at which the Specimen was collected and would most likey a point specified by point coordinates.

### Relationships Among SamplingFeatures ###
As described above, SamplingFeatures may be related. A Specimen SamplingFeature may be collected at a Site SamplingFeature. A Profile SamplingFeature may be located at a Site SamplingFeature. Other relationships are also possible. In all cases, these relationships are encoded in the **FeatureParents** entity. Each Samplingfeature may be associated with a SamplingFeature that is its parent. Additionally, a more specific RelationshipType can be chosen from a controlled vocabulary. Finally, if the relationship involves a spatial offset between the parent and child features, the spatial offset can be specified in the **SpatialOffsets** entity.

### Spatial Offsets for SamplingFeatures ###
TODO:  Anthony!