ODM2 Extensions: Results - Depth Profile Coverage Result Type
===========================================================

An **Depth Profile Coverage** Result consists of a series of ResultValues for a single Variable, at a single location, measured using a single Method, with specific Units, having a specific ProcessingLevel, but measured over multiple depths. In many cases, a **Depth Profile** will Result from deployment of one or more sensors, but it may also result from a series of Specimens taken at multiple depths and later analyzed in a laboratory. The following are the details of the measurement framework for a Time Series Coverage Result.

**Table 1**. Depth Profile Coverage Result measurement framework.

| **Component** | **Role** | **Description** |
| ------------- | -------- | --------------- |
| Space         | Controlled | A Depth Profile is generally located at a Site (X and Y are fixed), but individual ResultValues within the profile are measured at controlled depths (Z is controlled).  Depths are measured relative to some datum or origin (e.g., water surface, soil surface, well head elevation, etc.). There may be an intended vertical spacing for the ResultValues. |
|Time           |Fixed or Controlled | Depth profiles may be collected instantaneously (e.g., from a string of sensors that all sample simultaneously in time) or over time (e.g.,  where an instrument is dropped from the top of a profile to the bottom over time). In the case where time is controlled, Depth Profiles may have an intended temporal spacing that indicates the intended time spacing with which the ResultValues will be recorded. Actual temporal spacing is inherent in the  ValueDateTime recorded with each ResultValue. Temporal spacing and support are controlled by the sensor or logger that records the measurement or, in the case of a profile of samples, by the apparatus or Method that collects the samples. |
|Variable       |Measured   | ResultValues represent measurements of a Variable at each depth within the profile. ProcessingLevel, Units, Status, and SampledMedium are the same for every ResultValue in the Depth Profile Result. |

Each ResultValue within a Depth Profile Coverage is a floating point number. The following is an example of a Depth Profile Coverage Result:

A Depth Profile Coverage observation of "Oxygen, dissolved" (Variable) at "Puget Sound Site 1" (SamplingFeature) measured "using a YSI 6000 Series Sonde" (Method) on "2014-03-31" (ValueDateTime) had ResultValues:

| **Depth Z (m)** | **ResultValue (mg/L)** |
| :-------------- | ---------------------: |
| 0.5 | 10.0 |
| 1 | 9.8 |
| 1.5 | 9.7 |
| 2.0 | 9.6 |
| 2.5 | 9.5 |
| ... | ... |
