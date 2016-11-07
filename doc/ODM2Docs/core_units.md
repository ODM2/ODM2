ODM2 Core: Units
================

The ODM2 **Units** entity contains units of measure. Given that there are multiple systems from which Units can be derived, Units are not a controlled vocabulary in ODM2. Rather, ODM2 provies for describing a UnitsName, a UnitsType, a common UnitsAbbreviation, and an optional UnitsLink that can be used to specify a URL that describes the adopted units. Units are primarily used to specify the units of measure for the data values within a Result. Units are separate from Variables and are specified at the Result level. In ODM2, multiple Results may exist for the same Variable, but be specified with different Units. The Units entity is also linked to other entities within the ODM2 schema and its extensions where Units information is needed:

* **Results:** Units are specified for spacing and aggregation attributes, which are unique to each result type (e.g.,  TimeAggregationIntervalUnits, IntendedTimeSpacingUnits, XLocationUnits, YLocationUnits, ZLocationUnits, etc.).
* **Data Quality:** Units are specified for the value representing a measure of data quality (e.g., accuracy, standard deviation, confidence interval) as well as to specify the units of measure of a reference material (e.g., a specific conductance calibration solution could have units of microSiemens/cm).
* **Equipment:** Units are included to describe the time increment of the RecordingInterval and the ScanInterval of each DataloggerFileColumn. Units are also specified for the raw output of each InstrumentOutputVariable.
* **Sampling Features:**  Units are specified for X, Y, and Z locations of spatial offsets.
