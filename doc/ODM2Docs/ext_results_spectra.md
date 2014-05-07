ODM2 Extensions: Results - Spectra Coverage Result Type
===========================================================

A **Spectra Coverage** Result consists of a  series of ResultValues for a single Variable, measured on or at a single SamplingFeature (e.g., most likely a Site or a Specimen collected at Site), using a single Method, with specific Units, having a specific ProcessingLevel, but measured over one or more wavelengths of light. ValueDateTime may be fixed or controlled. The following are the details of the measurement framework for a Spectra Coverage Result.

**Table 1**. Spectra Coverage Result measurement framework.

| **Component** | **Role** | **Description** |
| :------------ | :------- | :-------------- |
| Space         | Fixed    | Spectra Coverage Results may be created using *in-situ* sensors or analyses of Specimens in a laboratory. Given this, the X, Y, and Z locations are fixed, but may be specified as offset from a Site location (e.g., the location at which a Specimen was collected with relationship to a site or the location at which a sensor is located with relationship to a Site. |
|Time           |Fixed     | Spectra Coverage Results may represent an instant in time (e.g., all ResultValues within the Result have the same ResultDateTime) or, each ResultValue within the Spectra Result may have it's own ResultDateTime (e.g., where a measurement is made at each wavelength sequentually in time). |
|Variable       |Measured  | ResultValues represent measurements of a single Variable at a given wavelength.  A Spectra Coverage Result may contain a single ResultValue corresponding to a single wavelength, or it may contain many ResultValues each of which was measured at a specific wavelength. ProcessingLevel, Units, Status, and SampledMedium are the same for every ResultValue in the Spectra Coverage Result. |

Each ResultValue within a Spectra Coverage Result is a floating point number. The following is an example of a Spectra Coverage Result:

A Spectra Coverage observation of "Flourescence intensity" (Variable) measured on Specimen "12345" (SamplingFeature) collected in the "Little Bear River at Mendon Road" (Parent SamplingFeature) measured using a "Fluorescence measurement instrument" (Method) on "2014-03-31 12:00 PM" (ValueDateTime) had ResultValues and Units:

| **ExcitationWavelength (nm)** | **EmissionWavelength (nm)** | **Fluorescence intensity (Raman units)** |
| :---------------------------: | :-------------------------: | :-----------------------------------------: |
| 360 | 425 | 0.05 |
| 365 | 430 | 0.08 |
| 370 | 435 | 0.09 |
| 375 | 440 | 0.04 |
| 380 | 445 | 0.02 |
| 385 | 450 | 0.02 |
| ... | ... | ... |

### Spatial Offset for Spectra Coverage Results
In the measurement framework for Spectra Coverage Results, space is fixed. The XLocation, YLocation, and ZLocation can be specified (e.g., in the case where a Specimen on which the measurement was made was collected at some spatial offset from a Site location), but all ResultValues in the Spectra Coverage Result have the same coordinates. For the example above, the XLocation would be the distance in the X direction from an origin (specified by a SpatialReference), the YLocation would be the distance in the Y direction from an origin, and the ZLocation would be the distance in the Z direction from an origin - the three coordinates specifying the location at which the measurement was made or specimen was collected with relationship to a Site SamplingFeature. 

### Spatial Aggregation for Spectra Coverage Results
In ODM2, space is fixed in the measurement framework for Spectra Coverage Results and so no spatial aggregation is supported.

### Time Aggregation for Spectra Coverage Results
Each ResultValue within a Spectra Coverage Result may have a time interval over which the recorded value represents an aggregation. For example, the recorded value may be an average or sum of multiple instantaneous observations made over a specific period of time, or time support. If the ResultValue represents a time aggregation, this can be specified using the AggregationStatisticCV, TimeAggregationInterval, and TimeAggregationIntevalUnitsID. 

### Wavelength Spacing and Aggregation
In some cases, there may be an intention to make measurements at set wavelength spacing. The IntendedWavelengthSpacing and IntendedWavelengthSpacingUnitsID enable the specification of the intended spacing. For a Spectra Coverage Result, it is assumed that measurements are made at specific wavelengths (i.e., a specific ExcitationWavelength is paired with a specific EmissionWavelength) and so no aggregation across wavelengths is currently supported.



