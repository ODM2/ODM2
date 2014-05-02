ODM2 Extensions: Results - Categorical Result Type
===========================================================

A **Categorical** Result consists of a single ResultValue for a single Variable, measured on or at a single SamplingFeature (e.g., in most cases a Specimen), using a single Method (e.g., field observation Method). The effective difference between a Categorical Result and a Measurement Results is that a Categorical ResultValue is a string, whereas a Measurement ResultValue is a floating point number. An example of an observation with a Categorical Result is an observation of sky conditions, where the resulting values fit within a category (e.g., "cloudy", "sunny", "partly-cloudy", etc.). The following are details of the measurement framework for a Categorical Result.

**Table 1**. Categorical Result measurement framework.

| **Component** | **Role** | **Description** |
| ------------- | -------- | --------------- |
| Space         |Fixed     |Space is fixed and usually described by a SamplingFeature that is a Site (X, Y, and Z are fixed). The location at which the observation was made may be offset from the Site location (e.g., below the water surface in a lake or below the soil surface.) |
|Time           |Fixed | Categorical Results are fixed in time, with the ValueDateTime being associated with the instant at which the observation was made.  |
|Variable       |Measured   | The ResultValue represents a measurement/observation of a Variable. ProcessingLevel, Units, Status, and SampledMedium describe the ResultValue. |

A Categorical ResultValue is a string. The following is an example of a Categorical Result:

An observation of "Sky condition" (Variable) at the "Logan City Airport" (SamplingFeature) observed using the "Human observation" (Method) had a value of "Cloudy" (ResultValue).

### Spatial Offset for Measurement Results
A Categorical Result may have a spatial offset from a Site SamplingFeature that is specified using the X, Y, and Z coordinates and SpatialReference in the CategoricalResults entity. For example, an observation may be collected at a Site, but some distance from the location specified by the Site coordinates recorded in the Sites entity. 

### Spatial Aggregation for Measurement Results
In ODM2, space is fixed in the measurement framework for Categorical Results and so no spatial aggregation is supported.

### Time Aggregation for Measurement Results
ODM2 does not support time aggregation for Categorical ResultValues.