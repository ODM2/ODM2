ODM2 Extensions: Equipment
==========================

The ODM2 Equipment extension provides functionality for managing information related to the equipment used to make observations, including sensors, dataloggers, laboratory instruments, etc.  The Equipment extension is optional for ODM2, but must be used when either the Sensors or the Samples extensions are implemented. 

### Why Track Equipment in ODM2? ###
The Equipment extension plays a vital role in linking observations to the equipment that was used to create them. Which sensor was used to measure temperature at a site? Which datalogger was used to record the data? These details are usually kept in field or laboratory notebooks and, in most cases, separate from the observation values themselves. This makes it difficult to link an observation to the particular pieces of equipment used in the measurement. The Equipment extension, along with the Samples or Sensors extensions (depending on the type of data being collected), make it possible to explicity link observation values with the peices of equipment used to record them.

### Actions and Equipment ###
In general, each Action can be perfomed either using one or more pieces of equipment or, in some cases, Actions are performed on a piece of equipment (e.g., in the case of a calibration action or a deployment action). There are multiple types of actions that can be performed on equipment, including:

* Configuration actions
* Calibration actions
* Maintenance actions

Additional Action types related to equipment are found in both the Samples and Sensors extensions. 

### Equipment Models ###
Equipment models are described by their manufacturer information, part number, name, description, and optional elements with notes, specifications, and a link to a website describing the model. Individual peices of equipment have a model and are described by additional metadata specific to the piece of equipment - e.g., name, serial number, owner, vendor, purchase date, etc.
