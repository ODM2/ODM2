ODM2 Best Practices: Preparing Site Information
===============================================

### Assigning SamplingFeatureType ###
A Site is a special case of Sampling Feature that can be described by as a point in space. To describe a site, "Site" should be assigned as the SamplingFeatureTypeCV. The other SamplingFeatures attributes should be completed, along with the attributes of the Sites table.

### Assigning SamplingFeatureCodes ###
A SamplingFeatureCode is a short, unique text identifier for a single record in the Sampling Features table such as a site. Both its uniqueness and its conciseness lend towards performing queries on the data, as opposed to using the longer SamplingFeatureName.

Example:

>I have a SamplingFeature of type "Site" named “USGS NWIS Stream Gage at the Colorado River at Austin”. This Site has a SamplingFeatureCode of “08158000”.

### Make SamplingFeatureCodes Unique within an ODM2 Database ###
Each Sampling Feature (e.g., a stream gage) is assigned a SamplingFeatureCode that must be unique within your ODM2 database. SamplingFeatureCode may be used by various tools to locate a specific feature within ODM2, so that’s why it must be unique.

Example:

>I operate a water quality observations network, that I’ll call UTdata. Within this network, I have two sensors on the Colorado River at different locations. I would NOT give both of these sites a SamplingFeatureCode of “UTSite”. Instead, I might call one “UTSite1” and the other “UTSite2”.

>Typically, each instance of an ODM2 database represents a single observation network. It’s OK for features in different ODM2 databases to have the same SamplingFeatureCode. These features are differentiated by the observations network to which they belong.

Example:

>I have a database of USGS NWIS sites. The SamplingFeatureCode for a stream gage in Austin is "08158000." I also have my own water quality sensor that I have installed next to the USGS sensor, to which I had previously assigned a SamplingFeatureCode of “UTSite1”. As a reminder that my sensor is at the same location as the USGS sensor, I give my sensor a SamplingFeatureCode of “08158000”. This is ok, because the USGS site and my own site are in different observations networks, and in different ODM2 databases.

>Note that in this example, I could also just as easily have stuck with “UTSite1” for this site. The choice about which SamplingFeatureCodes you assign is up to you, just so long as they are unique within your ODM2 database.

### Make SamplingFeatureCodes Concise ###
When you query for these data, you might be typing in queries by hand. Typing in very long SamplingFeatureCodes can be tedious, so keeping them brief is recommended.

**Important:** For your SamplingFeatureCodes, try to avoid using special characters that might be used by other applications to parse text, or that might be altered or removed by web applications. Example of characters to avoid include commas, tildes, semicolons, plus signs, spaces, and colons.

Example:

>“Colorado River, Texas: River Mile 41” is not a very good SamplingFeatureCode because it is long and has some special characters in it. A better SamplingFeatureCode is “CoRiver41”.

### Assigning SamplingGeatureGeoType ###
The SamplingFeatureGeoType refers to the dimensionality of the Sampling Feature and comes from a controlled vocabulary. A Site is a two-dimensional point, so the GeoType would be "point2d".

### Assigning SiteType ###
In addition to the attributes in the SamplingFeatures entity, a Site needs a SiteType and Latitude and Longitude coordinate.
Additional Site attributes can be expressed using either ODM2Annotations or ODM2ExtensionProperties. The SiteType field should be populated using terms from the ODM2 SiteType controlled vocabulary. 

### Assinging Sites.LatLonDatumID and SpatialReferences
The datum of the Latitude and Longitude coordinates in the Sites entity is given by a spatial reference system (SRS). Sites can be linked to an appropriate record in the SpatialReferences entity that specifies the SRS. Users must encode a name for the SRS, but are strongly encouraged to use the SRSCode field to encode the specific SRS used. Where possible, SRSs should be selected from existing lists such as those maintained by EPSG or ESRI and should be encoded using the prefix for the system from which they were selected followed by a colon and the specific SRS identifier (e.g., "epsg:4326" for Latitude and Longitude coordinates on the WGS84 reference ellipsoid).
