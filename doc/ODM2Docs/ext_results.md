ODM2 Extensions: Results
========================
The ODM2Results extension is where the actual data values associated with Results are encoded. ResultValues are included in an extension to the ODM2Core schema to support a catalog implementation of ODM2 that would store all of the metadata for Results, but not ResultValues. ODM2 supports Results of multiple types, with resulting values for each ResultType being expressed differently as described in the articles below. 

### Result Types Supported by ODM2 ###
The articles at the following links describe each of the ResultTypes supported by ODM2. The [measurement framework](ext_results_measurementframeworks.md) for each ResultType is described, as are the attributes required to record an observation of each ResultType.

* [Measurement Result](ext_results_measurement.md)
* Temporal Result
* Count Result
* Truth Result
* Category Result
* [Time Series Coverage Result](ext_results_timeseries.md)
* Point Coverage Result
* [Depth Profile Coverage Result](ext_results_profile.md)
* Transect Coverage Result
* Section Coverage Result
* Trajectory Coverage
* Spectra Coverage

### Attributes Common to ResultValues of all ResultTypes ###
The following are attributes of each individual ResultValue, regardless of the type of Result the ResultValue belongs to:

* **ValueDateTime** and **ValueDateTimeUTCOffset**: Date/time that unambiguously specify the real-world time associated with the ResultValue. For *in situ* sensor observations, it is the time at which the ResultValue was recorded. In the case of *ex-situ*, sample-based data, this is most likely the time at which the sample was collected. For field Measurements, it is the time at which the Measurement Result was created.
* **CensorCodeCV**: Code that indicates whether the ResultValue is above or below a detection limit or censoring level. Values for this attribute are selected from a controlled vocabulary.
* **QualityCodeCV**: Code that specifies the relative quality of the value (e.g., "Good", "Suspect"). Values for this attribute are selected from a controlled vocabulary.
* **AggregationDuration**: A text string that indicates the time support for the recorded ResultValue expressed as a time duration.
* **InterpolationTypeCV**: A text string that specifies the statistic that was recorded (e.g., "Minimum", "Maximum", "Average") over the AggregationDuration. Values for this attribute are selected from a controlled vocabulary.



## Spatial Offsets of Result Values (NEEDS REVISION) ##
Each individual ResultValue can have a spatial offset associated with it. Spatial offsets for ResultValues are used where an offset from a SamplingFeature location is used, but where that offset does not constitute creation of a new SamplingFeature. An example is a weather station Site where sensors are located a fixed distance above the ground or below the soil surface. Another example is a water quality depth profile.

ResultValue spatial offsets are specified using the **ValueXLocation**, **ValueYLocation**, and **ValueZLocation** attributes in the **ResultValues** entity. Numeric values can be specified for all three dimensions, with the origin of the three-dimensional coordinate system given in the **OffsetOrigins** entity. For example the spatial offset of the values resulting from a soil moisture sensor installed 5 cm below the surface of the soil could use the following: 

* ValueXLocation = 0 
* ValueYLocation = 0 
* ValueZLocation = -5
* OffsetOriginDescription = "Distance from the soil surface at the base of the weather station" 
* OffsetCoordinateUnitsID that indicates units of cm

As another example, in a water quality depth profile each DataValue that is part of the profile would have a different spatial offset as an instrument might be lowered from the top of a water column to the bottom. 

Thus the X, Y, and Z offsets provide a three dimensional system within which an offset can be fixed for all DataValues in a Result or varying for individual DataValues within a Result.
