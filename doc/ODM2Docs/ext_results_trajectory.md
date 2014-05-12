ODM2 Extensions: Results - Trajectory Coverage Result Type
===========================================================

A **Trajectory Coverage** Result consists of a series of ResultValues for a single Variable, measured on a single SamplingFeature (i.e., a 3-dimensional trajectory line), using a single Method, with specific Units, having a specific ProcessingLevel, but measured over varying X, Y, Z, and D locations, where X and Y are horizontal coordinates, Z is a vertical coordinate, and D is the distance along the 3-dimensional trajectory line. ValueDateTime may be fixed (e.g., a Distributed Temperature Sensing device that measures temperature at many locations along a trajectory line instantaneously) or controlled (e.g., a glider with on-board instruments that is towed through a trajectory line). The following are the details of the measurement framework for a Trajectory Coverage Result.

**Table 1**. Trajectory Coverage Result measurement framework.

| **Component** | **Role** | **Description** |
| :------------ | :------- | :-------------- |
| Space         | Measured or Controlled | A Trajectory Coverage Result covers a SamplingFeature that is a 3-dimensional trajectory line. X, Y, and Z may vary. The Trajectory line is defined by connecting the points along the trajectory path, where each point along the Trajectory line is defined by X, Y, Z coordinates. Spacing along the Trajectory may be variable or consistent, in which case an IntendedTrajectorySpacing can be specified. |
|Time           |Fixed or Controlled | Trajectory Coverage Results may represent an instant in time (e.g., all ResultValues along the Trajectory have the same ResultDateTime) or, each ResultValue within the Trajectory Result may have it's own ResultDateTime (e.g., where a sensor is moved sequentially to different locations along the Trajectory).  |
|Variable       |Measured   | ResultValues represent measurements of a single Variable at each X, Y, Z location along the Trajectory line. ProcessingLevel, Units, Status, and SampledMedium are the same for every ResultValue in the Trajectory Coverage Result. |

Each ResultValue within a Trajectory Coverage Result is a floating point number. The following is an example of a Trajectory Coverage Result:

A Trajectory Coverage observation of "Water temperature" (Variable) for the "Monterey Bay Trajectory" (SamplingFeature) measured using a "Glider equipped with a temperature sensor" (Method) had ResultValues and Units:

| **ValueDateTime** | **XLocation (Decimal Degrees)** | **YLocation (Decimal Degrees)** | **ZLocation (m)** | **TrajectoryDistance (km)** | **ResultValue  (Deg. C)** |
| :---------------: | :---------------: | :---------------: |:----------------: | :----------------------------------------: | :-----------------------: |
| 2014-03-31 12:30 PM | -111.0345 | 43.5467 | -20 | 50 | 10 |
| 2014-03-31 1:00 PM | -111.0346 | 43.5468 | -25 | 50.5 | 11 |
| 2014-03-31 1:30 PM | -111.0347 | 43.5469 | -30 | 51 | 10 |
| ... | ... | ... | ... | ... | ... |

### Spatial Offset for Trajectory Coverage Results
In the measurement framework for Trajectory Coverage Results, space is either measured or controlled. The XLocation, YLocation, and ZLocation may vary for each individual ResultValue within the Trajectory Coverage and so each recorded value must have XLocation, YLocation, and ZLocation coordinates and their Units. Each measurement point within the Trajectory must also have an attribute that is the distance along the Trajectory path at which the measurement was made. For each measurement within the water temperature example above, the XLocation would be the distance in the X direction from an origin (specified by a SpatialReference), the YLocation would be the distance in the Y direction from an origin, and the ZLocation would be the distance in the Z direction from an origin. In the case where spacing of measurement locations along the Trajectory is regular, an IntendedTrajectorySpacing and IntendedTrajectorySpacingUnitsID can be specified in the TrajectoryResults entity.

### Spatial Aggregation for Trajectory Coverage Results
For Trajectory Results, each ResultValue may represent a measurement at a discrete point along a Trajectory - in which case there is no spatial aggregation. However, ODM2 does allow for spatial aggregation along the Trajectory line. Where aggregation is used, each ResultValue may have a distance along the Trajectory over which it was aggregated. The interval over which aggregation is performed can be specified by the TrajectoryDistanceAggregationInterval attribute. The aggregation interval is specified in the same Units as the TrajectoryDistance attribute. Using aggregation along the Trajectory line, a Trajectory line can be divided into smaller line segments within which a recorded ResultValue represents an aggregated statistic.

### Time Aggregation for Trajectory Coverage Results
Each ResultValue within a Trajectory Coverage Result may have a time interval over which the recorded value represents an aggregation. For example, the recorded value may be an average or sum of multiple instantaneous observations made over a specific period of time, or time support. If the ResultValue represents a time aggregation, this can be specified using the AggregationStatisticCV, TimeAggregationInterval, and TimeAggregationIntevalUnitsID. Additionally, an IntendedTimeSpacing and IntendedTimeSpacingUnits can be specified in the TrajectoryResults entity where it is desired to have a specific time spacing between recorded ResultValues.


