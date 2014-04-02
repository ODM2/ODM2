ODM2 Extensions: Results - Measurement Result Type
===========================================================

A **Measurement** Result consists of a single ResultValue for a single Variable, measured on or at a single SamplingFeature (e.g., in most cases a Specimen), using a single Method (e.g., laboratory analytical Method), with specific Units, and having a specific ProcessingLevel. An example of an observation with a Measurement Result is *ex situ* analysis of a Specimen in a laboratory. In the case that the laboratory analysis produces ResultValues for multiple Variables from the same Specimen, each ResultValue would be associated with a separate Result because the Variable is specified at the Result level in ODM2 and not at the ResultValue level. The following are details of the measurement framework for a Measurement Result.

**Table 1**. Measurement Result measurement framework.

| **Component** | **Role** | **Description** |
| ------------- | -------- | --------------- |
| Space         |Fixed     |Space is fixed and usually described by a SamplingFeature that is a Site (X, Y, and Z are fixed). Measurement Results are typically for Specimens collected at a Site. The location at which a Specimen was collected may be offset from the Site location (e.g., below the water surface in a lake or below the soil surface.) |
|Time           |Fixed | Measurement Results are fixed in time, with the ValueDateTime being associated with the instant at which the Specimen was collected, or, in the case where the measurement was made in the field and does not involve a Specimen, the instant at which the Measurement was made.  |
|Variable       |Measured   | The ResultValue represents a measurement of a Variable. ProcessingLevel, Units, Status, and SampledMedium describe the ResultValue. |

A Measurement ResultValue is a floating point number. The following is an example of a Measurement Result:

A Measurement observation of "Total phosphorus concentration" (Variable) of "Specimen 1234567" (SamplingFeature) measured using the "ascorbic acid method" (Method) had ResultValue "0.05 mg/L".