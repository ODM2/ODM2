ODM2 Extensions: Results - Point Coverage Result Type
===========================================================

A **Point Coverage** Result consists of a series of ResultValues for a single Variable, measured on or at a single SamplingFeature (i.e., a polygon within which the individual points lie), using a single Method, with specific Units, having a specific ProcessingLevel, with a fixed ValueDateTime, but measured over varying X, Y locations (where X and Y are horizontal coordinates. In the case of a Point Coverage Result, the associated SamplingFeature is most likely a line or polygon within or on which the X, Y locations at which the measurements were made fall. In many cases, a Point Coverage will result from deployment of one or more sensors, each of which are collecting data at synchronized times. The following are the details of the measurement framework for a Point Coverage Result.

**Table 1**. Point Coverage Result measurement framework.

| **Component** | **Role** | **Description** |
| :------------ | :------- | :-------------- |
| Space         | Controlled | A Point Coverage Result covers a SamplingFeature that is a line or Polygon. Z is fixed for each ResultValue, but X and Y may vary. The X and Y spacing may be consistent or variable. |
|Time           |Fixed | Point Coverage Results represent an instant in time.  |
|Variable       |Measured   | ResultValues represent measurements of a single Variable at each X, Y location within the Point Coverage. ProcessingLevel, Units, Status, and SampledMedium are the same for every ResultValue in the Point Coverage Result. |

Each ResultValue within a Point Coverage Result is a floating point number. The following is an example of a Point Coverage Result:

A Point Coverage observation of "Snow water equivalent" (Variable) over the "Logan River Watershed" (SamplingFeature) created by the "Utah Energy Balance Model" (Method) on "2014-03-31 12:00 PM" (ValueDateTime) had ResultValues and Units:

| **X (Decimal Degrees)** | **Y (Decimal Degrees)** | **ResultValue (in)** |
| :---------------------: | :---------------------: | :------------------: |
| -111.673090 | 41.870724 | 40 |
| -111.672919 | 41.842340 | 37.5 |
| -111.631377 | 41.899607 | 45 |
| ... | ... | ... |

### Spatial Offset for Point Coverage Results
In the measurement framework for Point Coverage Results, the ZLocation is fixed, but can be specified.  The XLocation and YLocation may vary for each individual ResultValue within the Point Coverage and so each recorded value must have both XLocation and YLocation and their Units. In the case where X and Y spacing is regular, an IntendedXSpacing and IntendedYSpacing attribute and their Units can be specified in the PointCoverageResults entity.  

### Spatial Aggregation for Point Coverage Results
ResultValues within a Point Coverage Result are values at individual X, Y point locations and so no spatial aggregation is supported for Point Coverage Results.

### Time Aggregation for Point Coverage Results
Each ResultValue within a Point Coverage Result may have a time interval over which the recorded value represents an aggregation. For example, the recorded value may be an average or sum of multiple instantaneous observations made over a specific period of time, or time support. If the ResultValue represents a time aggregation, this can be specified using the AggregationStatisticCV, TimeAggregationInterval, and TimeAggregationIntevalUnitsID. Every ResultValue within a Point Coverage Result must have the same time aggregation.