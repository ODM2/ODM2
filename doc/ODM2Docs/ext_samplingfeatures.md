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

The [ODM2SamplingFeatures extension](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2SamplingFeatures.html) enables the encoding of detailed information about SamplingFeatures. ODM2 focuses on SamplingFeatures that are Sites/Stations and Specimens, which are relevant to a large percentage of data use cases, but several other types of SamplingFeatures can be represented. OGC's O&M considers Points, Curves, Surfaces and Volumes all as spatial SamplingFeatures, in which "the value of a property varies within the scope of the feature."  Therefore these SamplingFeatures can be used to record Coverage results.

Every SamplingFeature, regardless of type, is described first in the [**SamplingFeatures** entity](http://uchic.github.io/ODM2/schemas/ODM2_Current/tables/ODM2Core_SamplingFeatures.html). Then, specific attributes of the SamplingFeature are encoded in the entity for the specific SamplingFeature type (e.g., Sites or Specimens). In the SamplingFeatures entity, each SamplingFeature can be assigned a SamplingFeatureType, a unique text SamplingFeatureCode, and an optional text SamplingFeatureName and SamplingFeatureDescription. Each SamplingFeature may have a SamplingFeatureGeoType and Geometry that together specify the geometry of the SamplingFeature if relevant. Finally, each SamplingFeature may be assigned an elevation using the Elevation_m and ElevationDatumCV attributes.

### Sampling Features that are Sites ###
ODM2 adopts the ODM 1.1.1 representation of point monitoring locations as [Sites](http://uchic.github.io/ODM2/schemas/ODM2_Current/tables/ODM2SamplingFeatures_Sites.html). In all cases, a Site is a point location that has been established for the purpose of making observations on a "Feature of Interest." It may also be true that multiple SamplingFeatures of other types may be associated with a single Site SamplingFeature.  For example, many Specimen SamplingFeatures may be collected at a Site.

In addition to those attributes included in the SamplingFeatures entity, each Site can have a SiteType along with Latitude and Longitude coordinates. Additional Site attributes can be expressed using either ODM2Annotations or ODM2ExtensionProperties. The geometry of the site location should also be stored in the FeatureGeometry attribute of SamplingFeatures entity.

#### Sites.SiteType ####
A categorization of Sites that indicates the type of "Feature of Interest" that the Site was established to measure is useful for the purpose of enabling data discovery and for filtering different kinds of Results. The SiteTypeCV field was created for this purpose. The SiteTypeCV field in the Sites entity should be populated using terms from the ODM2 SiteType controlled vocabulary. The SiteTypeCV contains terms that describe the primary **type** of "Feature of Interest" that the Site was established to observe. For example a Site with a SiteTypeCV = "Stream" would have been established to make observations of a stream, which is a real world "Feature of Interest." It should be noted that the SiteTypeCV is not intended to indicate the specific "Feature of Interest" that the site was established to measure (e.g., "the Little Bear River"), although the Site SamplingFeature may bear a name that indicates such specific information. Rather, the SiteTypeCV is intended to describe the **type** of "Feature of Interest."  Given the extreme variability in the scales and scope of "Features of Interest" and the fact that ODM2 Results may ultimately be associated with multiple "Features of Interest," ODM2 currently does not include entities to fully describe "Features of Interest" or their geometries. The ODM2 SiteTypeCV primarily includes terms adapted from the United States Geological Survey's Site Type Codes (USGS SiteTypes). 

#### Sites.SpatialReferenceID and SpatialReferences ####
The spatial reference system of the Latitude and Longitude coordinates in the Sites entity is given by a spatial reference system (SRS). Sites can be linked to an appropriate record in the **SpatialReferences** entity that specifies the SRS. SRSName is the only required field in the SpatialReferences entity; however, users are strongly encouraged to fully describe each SRS and to select SRSs from an existing registry such as the one maintained by EPSG. The recommended convention is to use the SRSCode field to encode the specific SRS used. SRSCodes should be encoded using the prefix for the system from which they were selected followed by a colon and the specific SRS identifier (e.g., "EPSG:4326" for Latitude and Longitude coordinates on the WGS84 reference ellipsoid as described by EPSG). Where an existing SRS is used, it is also recommended that the SRSName and SRSDescription be copied and pasted from the system from which it was selected.

The EPSG registry can be found at [http://www.epsg-registry.org](http://www.epsg-registry.org).  The following is a full example for the SRS associated with WGS84 (EPSG:4326) as extracted from the EPSG registry:

- **SRSCode**: EPSG:4326
- **SRSName**: WGS 84
- **SRSDescription**: Horizontal component of 3D system. Used by the GPS satellite navigation system and for NATO military geodetic surveying.
- **SRSLink**: http://www.epsg-registry.org/export.htm?wkt=urn:ogc:def:crs:EPSG::4326

In this case the SRSLink attribute is used to specify a URL that returns the Well Known Text (WKT) representation of the SRS. The EPSG registry provides capability for building a similar URL for any SRS defined in their system. These URLs can be created by clicking on the "WKT" button on the EPSG webpage that defines the SRS. 

#### SpatialReferences and Results ####
The SpatialReferences entity is also used to store the descriptions of SRSs used to describe the X, Y, and Z coordinates associated with Results and their values (see the ODM2 Results extension). In many of these cases, a local site coordinate system may be used. The following is an example of how a local SRS can be encoded in the SpatialReferences entity:

- **SRSCode**: NULL
- **SRSName**: Local coordinate system for climate monitoring site
- **SRSDescription**: A local coordinate system used with climate monitoring sites. It is expressed using Cartesian coordinates where X is distance along an axis aligned with true East, Y is distance aligned with true North, and Z is distance aligned straight up. Depths are expressed a negative numbers. The origin of the coordinate system is a marker at the base of the instrumentation tower or tripod. 
- **SRSLink**: NULL

### Sampling Features that are Specimens ###
**Specimens** are equivalent to "samples" and may take many forms. Specimens can have a SpecimenType chosen from a controlled vocabulary. They can also be qualified by a SpecimenMedium, which is the environmental medium of the sample - e.g., rock, gas, sediment, tissue, etc. 

Specimens are typically collected at a **Site**.  For example, a researcher might collect many water quality Specimens at a fixed aquatic monitoring Site in a stream. Or, a researcher may collect many soil Specimens at a single Site. In these cases, a **Geometry** can be applied to the Site SamplingFeature to indicate the geospatial location of the Site. The Specimens themselves would not have a Geometry, but the relationship between Specimens and the Site at which they were collected would then be stored in the **RelatedFeatures** entity. 

However, there are also instances when a researcher may collect many Specimens over a spatial domain, but where there is no intention to ever return to any of the exact locations at which the Specimens were collected. In this case, the researcher may choose not to create a formal Site for each spatial location at which a Specimen was collected, but it is still important to record the exact location at which each Specimen was collected. In these cases, ODM2 allows users to apply a Geometry directly to the Specimen. Where a Specimen has a Geometry, it would be interpreted as the location at which the Specimen was collected and would most likely a point specified by point coordinates.

### Relationships Among SamplingFeatures ###
As described above, SamplingFeatures may be related. A Specimen SamplingFeature may be collected at a Site SamplingFeature. A Profile SamplingFeature may be located at a Site SamplingFeature. Other relationships are also possible. In all cases, these relationships are encoded in the **RelatedFeatures** entity. Each SamplingFeature may be associated with a SamplingFeature that is its parent. Additionally, a more specific RelationshipType can be chosen from a controlled vocabulary. Finally, if the relationship involves a spatial offset between the parent and child features, the spatial offset can be specified in the **SpatialOffsets** entity.

### Spatial Offsets for SamplingFeatures ###
Spatial offsets for SamplingFeatures provide the ability to describe relationships among SamplingFeatures that involve some sort of geographical separation between the two features. An example would be a Specimen that was collected at a Site, but at a specific distance below the surface of the water or soil. Spatial offsets are specified in the SpatialOffsets entity and are expressed using three coordinates, each of which has a value and units. The SpatialOffset is also described by a SpatialOffsetType, which is chosen from a controlled vocabulary. The SpatialOffsetType determines how each of the three coordinates is used. For example, a simple depth offset can be expressed using a single coordinate that records the depth below the earth or water surface. In this example, Offset1 would be used to record the depth offset. Offset2 and Offset3 would be NULL.
