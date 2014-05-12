ODM2 Core: Processing Levels
=================================

Each **Result** recorded in ODM2 has a **ProcessingLevel**, which specifies the level of quality control or data processing that the Result has been subjected to. ProcessingLevels are not specified using a controlled vocabulary, but every Result must have a designated ProcessingLevel. ProcessingLevels are specified by a code, a definition, and an explanation. The following is a default ProcessingLevel system that can be adopted by users of ODM2.

* **ProcessingLevelCode = “0” - Raw Data:**  Raw data is defined as unprocessed data and data products that have not undergone quality control. Depending on the data type and data transmission system, raw data may be available within seconds or minutes after real-time. Examples include real time precipitation, streamflow and water quality measurements
* **ProcessingLevelCode = “1” – Quality Controlled Data:** Quality controlled data have passed quality assurance procedures such as routine estimation of timing and sensor calibration or visual inspection and removal of obvious errors. An example is USGS published streamflow records following parsing through USGS quality control procedures.
* **ProcessingLevelCode = “2” – Derived Products:** Derived products require scientific and technical interpretation and include multiple-sensor data. An example might be basin average precipitation derived from rain gages using an interpolation procedure.
* **ProcessingLevelCode = “3” – Interpreted Products:** These products require researcher (PI) driven analysis and interpretation, model-based interpretation using other data and/or strong prior assumptions. An example is basin average precipitation derived from the combination of rain gages and radar return data.
* **ProcessingLevelCode = “4” – Knowledge Products:** These products require researcher (PI) driven scientific interpretation and multidisciplinary data integration and include model-based interpretation using other data and/or strong prior assumptions. An example is percentages of old or new water in a hydrograph inferred from an isotope analysis.

Users can also create thier own ProcessingLevel system that suits their particular data processing or quality control process. The following is an example of how ProcessingLevel could be used to manage multiple versions of a time series Result recorded by a sensor as it moves through the quality control process:

* **ProcessingLevelCode = “0” - Raw Data:**  Same as above.
* **ProcessingLevelCode = “0.1” - First Pass QC:**  A first quality control pass has been performed to remove out of range and obviously erronious values. These values are either deleted from the record, or, for short durations, values are interpolated.
* **ProcessingLevelCode = “0.2” - Second Pass QC:**  A second quality control pass has been performed to adjust values for instrument drift. Drift corrections are performed using a linear drift correction algorithm and field notes designating when sensor cleaning and calibration occurred.
* **ProcessingLevelCode = “1” – Quality Controlled Data:** Same as above.
