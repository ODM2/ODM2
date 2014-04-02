ODM2 Extensions: Results - Time Series Coverage Result Type
===========================================================

A **Time Series Coverage** Result consists of a time series of ResultValues for a single Variable, measured on or at a single SamplingFeature (e.g., a Site), using a single Method (e.g., sensor), with specific Units, and having a specific ProcessingLevel. In most cases, a Time Series Coverage will Result from a sensor deployment. The following are the details of the measurement framework for a Time Series Coverage Result.

**Table 1**. Time Series Coverage Result measurement framework.

| **Component** | **Role** | **Description** |
| ------------- | -------- | --------------- |
| Space         |Fixed     |Space is fixed and usually described by a SamplingFeature that is a Site. Location of the sensor or measurement device may be offset from the Site location (e.g., installed below the soil surface or mounted a distance above the ground.) |
|Time           |Controlled | Time Series Coverages have an IntendedObservationSpacing that indicates the intended temporal spacing with which the ResultValues will be recorded. Actual temporal spacing is inherent in the ValueDateTime recorded with each ResultValue. Spacing and time support are controlled by the sensor or logger that records the measurement. |
|Variable       |Measured   | ResultValues represent a measured Variable. ProcessingLevel, Units, Status, and SampledMedium are the same for every ResultValue in a Time Series Coverage Result. |

Each ResultValue within a Time Series Coverage is a floating point number.

