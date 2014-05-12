ODM2 Extensions: Equipment
==========================

The ODM2 Equipment extension provides functionality for managing information related to the equipment used to make observations, including sensors, dataloggers, laboratory instruments, etc.  The Equipment extension is optional for ODM2, but must be used when either the Sensors or the LabAnalyses extensions are implemented. 

### Why Track Equipment in ODM2? ###
The Equipment extension plays a vital role in linking observations to the equipment that was used to create them. Which sensor was used to measure temperature at a site? Which datalogger was used to record the data? What was the model number of the mass spectrometer that made that measurement, and whose lab was it in? These details are usually kept in field or laboratory notebooks and, in most cases, separate from the observation values themselves. This makes it difficult to link an observation to the particular pieces of equipment used in the measurement. The Equipment extension, along with the DataQuality, Sensors and/or LabAnalyses extensions (depending on the type of data being collected), make it possible to explicitly link observation values with the pieces of equipment used to record them.

### Actions and Equipment ###
In general, there are two ActionTypes that are associated with Equipment:

* **ObservationActions** are Actions on a SamplingFeature that produce Results, often using one or more pieces of Equipment. The Methods and MethodTypes associated with the Observation Action distinguish the different uses of this ActionType:
  * Instrument Analysis
  * Sensor Deployment, which initiates the logging of Results
  * Instrument Calibration, which is an Observation Action if it produces a Result from a ReferenceMaterial Specimen
  * and others

* **EquipmentMaintenanceActions** are Actions that are performed on a piece of Equipment and do not act on a SamplingFeature or produce Results.  The Methods and MethodTypes associated with the Equipment maintenance action distinguish the different uses of this ActionType:
  * Equipment Configuration
  * Equipment Repair
  * Equipment Cleaning
  * Sensor Calibration, which is an Equipment maintenance action if it does not produce a Result (but it can specify the use of a ReferenceMaterial Specimen)
  * and others

Additional Action types related to Equipment are found in both the Sensors and LabAnalyses extensions. 

### Equipment Models ###
EquipmentModels are described by their manufacturer information, part number, name, description, and optional elements with description, link to specifications, and a link to a website describing the model. Individual pieces of Equipment have a model and are described by additional metadata specific to the piece of Equipment - e.g., name, serial number, owner, vendor, purchase date, etc.

### InstrumentOutputVariables
For EquipmentModels that are instruments (i.e., that can make measurements), the InstrumentOuputVariables entity records information about which Variables can be measured using that instrument model. Each InstrumentOutputVariable is linked directly to its EquipmentModel, the Variable it measures, the Method it uses to measure that Variable, the manufacturer's reported resolution and accuracy for the instrument (if applicable), and the Units of the raw output from the instrument. When an instrument is deployed to make measurements, a subset of the InstrumentOutputVariables that the instrument is capable of measuring may be measured by the deployment. For more information about sensor deployments, see the documentation for the [ODM2 Sensors extension](ext_Sensors.md).
