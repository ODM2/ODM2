ODM2 Extensions: Results
========================

The ODM2Results extension is where the actual data values associated with Results are encoded. ResultValues are included in an extension to the ODM2Core schema to support a catalog implementation of ODM2 that would store all of the metadata for Results, but not ResultValues. ODM2 supports Results of multiple types, with resulting values for each ResultType being expressed differently as described in the articles below.

### Definition of ResultTypes
ODM2 currently supports a number of ResultTypes (listed below). Entities and attributes for fully specifying each of these ResultTypes have been designed and included in the ODM2Results schema.  However, it is anticipated that additional ResultTypes may be needed by ODM2 users - or that minor modifications to existing ResultTypes may be needed to accommodate users' data use cases. The structure of ODM2 enables the creation of additional ResultTypes by adding them to the ODM2Results schema - without affecting the ODM2Core or other schemas.

### ResultTypes Supported by ODM2 ###
The articles at the following links describe each of the ResultTypes supported by ODM2. The [measurement framework](ext_results_measurementframeworks.md) for each ResultType is described, as are the attributes required to record an observation of each ResultType.

* [Measurement Result](ext_results_measurement.md)
* Categorical Result
* [Time Series Coverage Result](ext_results_timeseries.md)
* [Depth Profile Coverage Result](ext_results_profile.md)
* Point Coverage Result
* Section Coverage Result
* Transect Coverage Result
* Trajectory Coverage Result
* Spectra Coverage Result

### Attributes Common to ResultValues of all ResultTypes ###
The following are attributes of each individual ResultValue, regardless of the type of Result the ResultValue belongs to:

* **ValueDateTime** and **ValueDateTimeUTCOffset**: Date/time that unambiguously specify the real-world time associated with the ResultValue. For *in situ* sensor observations, it is the time at which the ResultValue was recorded. In the case of *ex-situ*, sample-based data, this is most likely the time at which the sample was collected. For field Measurements, it is the time at which the Measurement Result was created.
* **CensorCodeCV**: Code that indicates whether the ResultValue is above or below a detection limit or censoring level. Values for this attribute are selected from a controlled vocabulary.
* **QualityCodeCV**: Code that specifies the relative quality of the value (e.g., "Good", "Suspect"). Values for this attribute are selected from a controlled vocabulary.
* **TimeAggregationInterval**: A numeric value that indicates the time support for the recorded ResultValue.
* **TimeAggregationIntervalUnitsID**: Specifies the units of the TimeAggregationInterval.
* **AggregationStatisticCV**: A text string that specifies the statistic that was recorded (e.g., "Minimum", "Maximum", "Average") over the TimeAggregationInterval. Values for this attribute are selected from a controlled vocabulary.

### Spatial Offsets of ResultValues ###
Regardless of the ResultType, each individual ResultValue may have a spatial offset associated with it. Spatial offsets for ResultValues are used where an offset from a SamplingFeature location is used, but where that offset does not constitute creation of a new SamplingFeature. An example is a weather station Site where sensors are located a fixed distance above the ground or below the soil surface. Another example is a water quality depth profile.  The way spatial offsets are handled is specific to the ResultType and is described for each ResultType in the articles at the links above.

### Aggregation of ResultValues in Space and Time ###
Depending upon the ResultType, ODM2 allows some degree of aggregation in both space and time. THe following are examples:

* A MeasurementResult may be based on a composite sample that was collected over a period of time. 
* Each recorded Time Series ResultValue may represent an average over a specific time support interval. 
* A recorded Depth Profile ResultValue may represent an average (or some other statistic) over a specific depth interval rather than a single depth.

In the articles for each ResultType linked above, details are given for how spatial aggregation (if any) is handled for each ResultType.