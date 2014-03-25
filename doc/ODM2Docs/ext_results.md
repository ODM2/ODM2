ODM2 Extensions: Results
========================
The ODM2Results extension is where the actual data values associated with Results are encoded. ResultValues are included in an extension to support a catalog implementation of ODM2 that would store all of the metadata for Results, but not ResultValues. ODM2 supports Results of multiple types, with resulting values for each type being expressed differently as described in the sections below. 

## Measurement Frameworks ##
Before describing the individual ResultTypes, it is useful to describe the concept of a **Measurement Framework**. A measurement framework is a conceptual scheme that establishes rules for control of other components of a phenomenon to permit measurement of one component (Chrisman, 1995; 1997; 1999). In ODM2, each ResultType has a spatial component, a temporal component, and an observed Variable component. According to Chrisman (1999), there are three possible roles for the spatial, temporal, and observed Variable components. In general, in order to measure one component, one of the others has to be fixed, while the third serves as a control. Chrisman (1999) states that control denotes a mechanism of restraint on the variation of a component. For example, a water level sensor must be fixed in one location, and the rate of temporal sampling controlled so the depth of water (the attribute) can be measured. The following sections describe how these three components are handled in ODM2.

### Observed Variable Component ###
In ODM2, a fundamental, structural choice has been made that affects the measurement framework associated with the different ResultTypes. For *all* ODM2 ResultTypes, the  observed Variable component is "measured." For the purposes of ODM2, ProcessingLevel, Units, Status, and SampledMedium, which are all Attributes of a Result, are part of the observed Variable component that is measured in the measurement framework for each ResultType. Given that the attribute component of the measurement framework for all ODM ResultTypes is always measured, it is the spatial and temporal components that distinguish between the different ResultTypes. 

### Spatial Component ###
In the measurement frameworks for ODM2 ResultTypes, space may be fixed, but it may also be controlled or measured. For example, consider the following measurement scenarios for the spatial component:

1. Fixed space: A Result is measured on a single, fixed SamplingFeature (e.g., a Specimen or an individual Site). 
2. Fixed space: A Result is measured on a single, fixed SamplingFeature, but at a location that is offset from the SamplingFeature (e.g., a sensor that is installed at a Site, but located some distance below the soil surface or above the ground). 
3. Controlled space: A Result is measured across multiple SamplingFeatures (e.g., values representing a Variable at multiple sites at the same time).
4. Measured space: A Result is measured on on a SamplingFeauture that is not fixed (e.g., a glider or sensor mounted to a boat). 

### Temporal Component ###
Similar to the spatial component, the temporal component may be fixed or controlled in ODM2. For a sensor installed at a Site, individual ResultValues are regularly recorded with a spacing that is controlled by the datalogger. However, a Specimen is collected at single instant in time, effectively fixing the temporal component for any Results created from that Specimen. In some special cases, the temporal component may be measured (e.g., the time at which a particular value of a variable occurred).

Given this context of measurement frameworks, the following sections describe each of the ResultTypes supported by ODM2. The measurement framework for each ResultType is described, as are the attributes required to record an observation of each ResultType.

## Time Series Coverage Result ##
A **Time Series Coverage** Result consists of a time series of ResultValues for a single Variable, measured on or at a single SamplingFeature (e.g., a Site), using a single Method (e.g., sensor), with specific Units, and having a specific ProcessingLevel. In most cases, a Time Series Coverage will Result from a sensor deployment. The following are the details of the measurement framework for a Time Series Coverage Result.

**Table 1**. Time Series Coverage Result measurement framework.

| **Component** | **Role** | **Description** |
| ------------- | -------- | --------------- |
| Space         |Fixed     |Space is fixed and usually described by a SamplingFeature that is a Site. Location of the sensor or measurement device may be offset from the Site location (e.g., installed below the soil surface or mounted a distance above the ground.) |
|Time           |Controlled | Time Series Coverages have an IntendedObservationSpacing that indicates the intended temporal spacing with which the ResultValues will be recorded. Actual temporal spacing is inherent in the ValueDateTime recorded with each ResultValue. Spacing and time support are controlled by the sensor or logger that records the measurement. |
|Variable       |Measured   | ResultValues represent a measured Variable. ProcessingLevel, Units, Status, and SampledMedium are the same for every ResultValue in a Time Series Coverage Result. |

Each ResultValue within a Time Series Coverage is a floating point number and has the following attributes:

* **ValueDateTime** and **ValueDateTimeUTCOffset**: Date/time that unambiguously specify the real-world time associated with the ResultValue. For sensor observations, it is the time at which the ResultValue was recorded.
* **CensorCodeCV**: Code that indicates whether the ResultValue is above or below a detection limit or censoring level. Values for this attribute are selected from a controlled vocabulary.
* **QualityCodeCV**: Code that specifies the relative quality of the value (e.g., "Good", "Suspect"). Values for this attribute are selected from a controlled vocabulary.
* **AggregationDuration**: A text string that indicates the time support for the recorded ResultValue expressed as a time duration.
* **InterpolationTypeCV**: A text string that specifies the statistic that was recorded (e.g., "Minimum", "Maximum", "Average") over the AggregationDuration. Values for this attribute are selected from a controlled vocabulary.

## Measurement Result##
A **Measurement** Result consists of a single ResultValue for a single Variable, measured on or at a single SamplingFeature (e.g., in most cases a Specimen), using a single Method (e.g., laboratory analytical Method), with specific Units, and having a specific ProcessingLevel. An example of an observation with a Measurement Result is *ex situ* analysis of a Specimen in a laboratory. In the case that the laboratory analysis produces ResultValues for multiple Variables from the same Specimen, each ResultValue would be associated with a separate Result because the Variable is specified at the Result level in ODM2 and not at the ResultValue level. The following are details of the measurement framework for a Measurement Result.

**Table 2**. Measurement Result measurement framework.

| **Component** | **Role** | **Description** |
| ------------- | -------- | --------------- |
| Space         |Fixed     |Space is fixed and usually described by a SamplingFeature that is a Site. Measurement Results are typically for Specimens collected at a Site. The location at which a Specimen was collected may be offset from the Site location (e.g., below the water surface in a lake or below the soil surface.) |
|Time           |Fixed | Measurement Results are fixed in time, with the ValueDateTime being associated with the instant at which the Specimen was collected, or, in the case where the measurement was made in the field and does not involve a Specimen, the instant at which the Measurement was made.  |
|Variable       |Measured   | The ResultValue represents a measured Variable. ProcessingLevel, Units, Status, and SampledMedium describe the ResultValue. |

A Measurement ResultValue is a floating point number and has the following attributes:

* **ValueDateTime** and **ValueDateTimeUTCOffset**: Date/time that unambiguously specify the real-world date and time associated with the ResultValue. In the case of *ex-situ*, sample-based data, this is most likely the time at which the sample was taken. For field Measurements, it is the time at which the Measurement Result was created.
* **CensorCodeCV**: Code that indicates whether the ResultValue is above or below a detection limit or censoring level. Values for this attribute are selected from a controlled vocabulary.
* **QualityCodeCV**: Code that specifies the relative quality of the value (e.g., "Good", "Suspect"). Values for this attribute are selected from a controlled vocabulary.
* **AggregationDuration**: A text string that indicates the time support for the recorded ResultValue expressed as a time duration.  
* **InterpolationTypeCV**: A text string that specifies the statistic that was recorded (e.g., "Minimum", "Maximum", "Average") over the AggregationDuration. Values for this attribute are selected from a controlled vocabulary.

## Depth Profile ##
An **Depth Profile** Result consists of a series of ResultValues at a single location, measured using a single Method, with specific Units, having a specific ProcessingLevel, but measured over multiple depths. In many cases, a **Depth Profile** will Result from deployment of one or more sensors, but it may also result from a series of Specimens taken at multiple depths and later analyzed in a laboratory. The following are the details of the measurement framework for a Time Series Coverage Result.

**Table 3**. Time Series Coverage Result measurement framework.

| **Component** | **Role** | **Description** |
| ------------- | -------- | --------------- |
| Space         | Controlled | A Depth Profile is generally located at a Site, but individual ResultValues within the profile are measured at controlled depths.  Depths are measured relative to some datum (e.g., water surface, soil surface, well head elevation, etc.). There may be an intended vertical spacing for the ResultValues. |
|Time           |Fixed or Controlled | Depth profiles may be collected instantaneously (e.g., from a string of sensors that all sample simultaneously in time) or over time (e.g.,  where an instrument is dropped from the top of a profile to the bottom over time). Depth Profiles may have an intended temporal spacing that indicates the intended time spacing with which the ResultValues will be recorded. Actual temporal spacing is inherent in the  ValueDateTime recorded with each ResultValue. Temporal spacing and support are controlled by the sensor or logger that records the measurement or, in the case of a profile of samples, by the apparatus or Method that collects the samples. |
|Variable       |Measured   | ResultValues represent a measured Variable at each depth within the profile. ProcessingLevel, Units, Status, and SampledMedium are the same for every ResultValue in the Depth Profile Result. |

Each ResultValue within a Depth Profile is a floating point number and has the following attributes:

* **ValueDateTime** and **ValueDateTimeUTCOffset**: Date/time that unambiguously specify the real-world time associated with the ResultValue. For sensor observations, it is the time at which the ResultValue was recorded. For *ex situ* sample data, it is the time at which the sample was collected.
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
