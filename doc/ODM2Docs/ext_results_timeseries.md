ODM2 Extensions: Results - Time Series Coverage Result Type
===========================================================

A **Time Series Coverage** Result consists of a series of ResultValues for a single Variable, measured on or at a single SamplingFeature (e.g., a Site), using a single Method (e.g., sensor), with specific Units, and having a specific ProcessingLevel, but measured over time. In most cases, a Time Series Coverage will Result from a sensor deployment. The following are the details of the measurement framework for a Time Series Coverage Result.

**Table 1**. Time Series Coverage Result measurement framework.

| **Component** | **Role** | **Description** |
| ------------- | -------- | --------------- |
| Space         |Fixed     |Space is fixed and usually described by a SamplingFeature that is a Site (X, Y, and Z are fixed). Location of the sensor or measurement device may be offset from the Site location (e.g., installed below the soil surface or mounted a distance above the ground.) |
|Time           |Controlled | Time Series Coverages have an IntendedObservationSpacing that indicates the intended temporal spacing with which the ResultValues will be recorded. Actual temporal spacing is inherent in the ValueDateTime recorded with each ResultValue. Spacing and time support are controlled by the sensor or logger that records the measurement. |
|Variable       |Measured   | ResultValues represent measurements of a Variable. ProcessingLevel, Units, Status, and SampledMedium are the same for every ResultValue in a Time Series Coverage Result. |

Each ResultValue within a Time Series Coverage is a floating point number. The following is an example of a Time Series Coverage Result:

A Time Series Coverage observation of "Oxygen, dissolved" (Variable) in the "Logan River near Logan, UT" (SamplingFeature) measured using a "Hydrolab Minisonde 5 multiparameter water quality sonde" (Method) had the following ResultValues expressed in "mg/L" (Units):

| **ValueDateTime** | **DataValue** |
| :---------------- | ---------------------: |
| 2014-03-31 12:00 PM | 9.8 |
| 2014-03-31 12:15 PM | 10.0 |
| 2014-03-31 12:30 PM | 10.2 |
| ... | ... |

### Spatial Offset for Time Series Results
ResultValue spatial offsets for Time Series Results are specified using the **XLocation**, **YLocation**, **ZLocation**, and **SpatialReferenceID** attributes in the **TimeSeriesResults** entity. Numeric values and Units can be specified for all three dimensions, with the spatial reference of the three-dimensional coordinate system given in the **SpatialReferences** entity. For example the spatial offset of the values resulting from a soil moisture sensor installed 5 cm below the surface of the soil could use the following: 

* XLocation = 0 
* YLocation = 0 
* ZLocation = -5
* ZLocationUnitsID that indicates units of cm
* SRSDescription = "Distance from the soil surface at the base of the weather station" 

### Spatial Aggregation for Time Series Results
For Time Series Results, the spatial offset (e.g., the location of the sensor with respect to the Site) is fixed in all three dimensions and so no spatial aggregation is specified. 

### Time Aggregation for Time Series Results
Each ResultValue within a Time Series Result may have a time interval over which the recorded value represents an aggregation. For example, the recorded value may be an average of multiple instantaneous observations made over a specific period of time, or time support. If the ResultValue represents a time aggregation, this can be specified using the AggregationStatisticCV, TimeAggregationInterval, and TimeAggregationIntevalUnitsID.

It is possible for a single Time Series Result to have varying TimeAggregationIntervals. For example, the operator of an aquatic monitoring site may choose to very the frequency of data aggregation and recording with storm or other events that occur. Because of this, the TimeAggregationInterval
