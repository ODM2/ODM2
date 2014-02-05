ODM2 Core: Results
==================

In ODM2, an observation is made up of two elements - an Action that is of type "Observation act" and a "Result" that is the outcome of that Action. This is a critical distinction for ODM2 as the separation of Actions and their Results enables:

1. A single Action may have many Results (e.g., a sample analysis that results in concentration values for many different variables). 
2. Actions may be of many different types (e.g., site visits, calibration events, sensor deployments, etc.). Many Action types do not have data value Results.
3. Results may be of many different types (e.g., individual measurements, time series, etc.).

**A Result consists of one or more data values that are a consequnce of an observation act.** The data values themselves are not encoded in the Results entity. Only metadata describing the resulting data values are encoded in the Results entity. This is done to enable catalog implementations of ODM2 that would enable data discovery over the metadata, but would not contain the data values themselves. 

### Result Types ###
Similar to OGC's Observations & Measurements (O&M), Results can be of many different types. Result types are chosen from a controlled vocabulary. The following are examples of Result types:

* **Time series coverage:** A time sequenced set of individual data values (e.g., the time series of dissolved oxygen from an in situ stream sensor deployment).
* **Measurement:** A single data value resulting from a sample analysis.
* **Category observation:** A single data value that is categorical and not numeric(e.g., "cloudy", "sunny", "partly cloudy", etc.).
* **Count observation:** A single data value that is a count of some phenomenon.
* **Truth observation:** A single data value that is a boolean (true/false).
* **Profile coverage:** A series of data values along a depth profile that may be measured at the same time or sequentially as an instrument is moved along the profile (e.g., a water quality depth profile).
* **Point coverage:** A series of data values collected at the same time, but across many point locations (e.g., precipitation at many weather stations at a single time).

### Result Metadata ###
Each Result is described by the following metadata:

* Result type (from a controlled vocabulary)
* The Action that created it (via ActionID)
* The Variable that is represented (via VariableID)
* The Units of measure (via UnitsID)
* The QualityControlLevel (via QualityControlLevelID)
* The ResultDateTime, which is the time at which the Result became available.
* A ValidDateTime, which is a time for which the Result is valid (e.g., in the case of a forecast)
* A Status that describes the state of the Result (from a controlled vocabulary)
* A SampledMedium that described the environmental media (e.g., soil, water, air, etc.) from which the Result was derived (from a controlled vocabulary)
* A ValueCount that specifies the number of data values in the result
* An IntendedObservationSpacing that specifies the intended temporal spacing of the resulting data values (some Results may have data values whose spacing varies)

#### SampledMedium ####
The SampledMedium field is intended to capture the physical medium that is sampled. For example, if a physical sample (e.g., bottle) of stream water is collected, the SampleMedium would be “Surface water.” If a physical sample of water from a groundwater well is collected, the SampleMedium would be “Groundwater.” For in-situ sensors, the SampleMedium is generally the medium in which the sensor is installed (e.g., “Surface water” for a temperature sensor in a stream) or the medium that the sensor actually measured (e.g., “Precipitation” for a tipping bucket rain gage).

It is possible for there to be multiple sampled media at a single given Site. For example, at a Site having SiteType = “Stream,” one might install a temperature sensor in the water column (SampledMedium = “Surface water”), collect bottles of water for nutrient concentration measurements (SampledMedium = “Surface water”), collect sediment samples for measurement of trace metal concentrations (SampledMedium = “Sediment”), and collect fish specimens for analysis of toxic chemical concentrations (SampledMedium = “Tissue”). The SampleMedium field should be populated using terms from the SampledMedium controlled vocabulary.



