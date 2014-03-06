ODM2 Extensions: Results
========================
The ODM2Results extension is where the actual DataValues associated with Results are encoded. Results are included in an extension to support a catalog implementation of ODM2 that would not use the Results extension. 

ODM2 supports results of multiple types, with DataValues for each type being expressed differently as described in the following sections. ResultTypes supported by ODM2 include:

* **Time Series Coverage** - An observation Result consisting of a time series of DataValues at a fixed location.
* **Depth Profile Coverage** - An observation Result consisting of a profile of DataValues at a single location, but measured over multiple depths.
* **Spatial Coverage** - An observation Result consisting of a coverage of DataValues at a single instant in time, but at many locations in space (e.g., Precipitation at many weather stations at a given time).
* **Measurement** - An observation Result whose value is from a single measurement (e.g., *ex situ* analysis of a sample in a laboratory)
* **Count** - An observation Result whose value represents a count.
* **Truth** - An observation Result whose value is either true or false (boolean) 
* **Category** - An observation Result whose value is a category (e.g., "cloudy", "sunny") 

### Time Series Coverage Observation Result Values ###
A "time series coverage" Result consists of a time series of DataValues for a single Variable, measured on or at a single SamplingFeature (e.g., a Site), using a single Method (e.g., sensor), with specific Units, and having a specific QualityControlLevel. In most cases, a time series coverage will Result from a sensor deployment.

Each DataValue within a time series has a ValueDateTime and ValueDateTimeUTCOffset that unambiguously specify the time at which the value was recorded. Each individual DataValue may have an assigned QualityCode, which specifies the relative quality of the value (e.g., "Good", "Suspect"). Each individual DataValue is also described by an AggregationDuration, which specifies the time support for the DataValue and an InterpolationType, which specifies the statistic that was recorded (e.g., "Minimum", "Maximum", "Average") over the AggregationDuration and is chosen from a controlled vocabulary.

### Depth Profile Coverage Observation Result Values ###

### Spatial Coverage Observation Result Values ###

### Measurement Observation Result Values ###

### Count Observation Result Values ###

### Truth Observation Result Values ###

### Category Observation Result Values ###

### Spatial Offsets of Result Values ###
Each individual DataValue can have a spatial offset associated with it. Spatial offsets for DataValues are used where an offset from a SamplingFeature location is used, but where that offset does not constitute creation of a new SamplingFeature. An example is a weather station Site where sensors are located a fixed distance above the ground or below the soil surface. Another example is a water quality depth profile.

DataValue spatial offsets are specified using the **ValueXLocation**, **ValueYLocation**, and **ValueZLocation** attributes in the **ResultValues** entity. Numeric values can be specified for all three dimensions, with the origin of the three-dimensional coordinate system given in the **OffsetOrigins** entity. For example the spatial offset of the values resulting from a soil moisture sensor installed 5 cm below the surface of the soil could use the following: 

* ValueXLocation = 0 
* ValueYLocation = 0 
* ValueZLocation = -5
* OffsetOriginDescription = "Distance from the soil surface at the base of the weather station" 
* OffsetCoordinateUnitsID that indicates units of cm

As another example, in a water quality depth profile each DataValue that is part of the profile would have a different spatial offset as an instrument might be lowered from the top of a water column to the bottom. 

Thus the X, Y, and Z offsets provide a three dimensional system within which an offset can be fixed for all DataValues in a Result or varying for individual DataValues within a Result.
