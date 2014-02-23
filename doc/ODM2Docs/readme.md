ODM2 Documentation Index
========================

The next version of the Observations Data Model.

### ODM2 Architecture ###

ODM2 is organized with a "core" schema and multiple "extension" schemas that extend the functionality of the core. The following sections cover some overarching concepts for ODM2 and then focus on specific entities within the ODM2 Core schema and ODM2's extension schemas.

ODM2 inherits extensively from ODM 1.1.1, which was developed as part of the Consortium of Universities for the Advancement of Hydrologic Science, Inc. (CUAHSI) Hydrologic Information System (HIS) project. ODM2 also inherits features from the Open Geospatial Consortium (OGC) Observations & Measurements (O&M) standard. 

### ODM2Core Entities ###
The following are entities in the [ODM2 Core schema](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Core.html):

* [Actions](core_actions.md) - Actions are performed by people and may have a result.
* [Datasets](core_datasets.md) - Enables grouping of results into a larger dataset.
* [Directives](core_directives.md) - The reason(s) for which an action was taken.
* [Methods](core_methods.md) - The procedure used to perform an action.
* [Organizations](core_organizations.md) - A group of people.
* [People](core_people.md) - Individuals that perform actions.
* [Quality Control Levels](core_qualitycontrollevels.md) - Levels to which data have been quality controlled.
* [Related Actions](core_relatedactions.md) - Enables specifying relationships among Actions (e.g., workflows, etc.)
* [Related Results](core_relatedresults.md) - Enables specifying relationships among results.
* [Results](core_results.md) - The result of an action.
* [Roles](core_roles.md) - Capacities in which people act.
* [Sampling Features](core_samplingfeatures.md) - Where or on what an action was performed.
* [Taxonomic Classifiers](core_taxonomicclassifiers.md) - Terms for classifying results.
* [Units](core_units.md) - Units of measure.
* [Variables](core_variables.md) - What was observed.

### ODM2 Extensions ###
The following are extensions to the ODM2 Core:

* [Annotations](ext_annotations.md) ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Annotations.html)) - Data qualifying comments and annotations on other entities.
* [Equipment](ext_equipment.md) ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Equipment.html)) - Information for managing sampling or laboratory equipment.
* Controlled Vocabulary ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2CV.html)) - Entities for enforcing CVs.
* Extension ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Extension.html)) - A general extensibility mechanism for ODM2 (adding new attributes).
* External Identifiers ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2ExternalIdentifers.html)) - Linking entities in ODM2 to external repositories.
* Provenance ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Provenance.html)) - Information about versions and provenance.
* [Results](ext_results.md) ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Results.html)) - Values for observation results.
* Samples ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Samples.html)) - Information for managing ex situ, sample-based data.
* [Sampling Features](ext_samplingfeatures.md) ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2SamplingFeatures.html)) - Information about sampling features on which observations are made.
* Sensors ([Schema Diagram](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Sensors.html)) - Information about sensors and in situ sampling equipment.

### Additional Concepts ###
The following are additional concepts that are important.

* Geography, location, and spatial offsets
* Support, Spacing, and Extent
* ...

### ODM2 Best Practices ###
The following are articles that describe best practices for using ODM2:

* [Preparing Site information](bp_preparingsiteinformation.md)
* [Preparing Variable information](bp_preparingvariableinformation.md)
* [Handling dates and times](bp_handlingdatesandtimes.md)
* [Use of NoData values](bp_nodatavalues.md)
* [Encode data reported as trace concentration](bp_traceconcentrations.bp)
* [Encode data for co-located sensors](bp_co-locatedsensors.md)
* [Encode data for which the exact date is unknown](bp_unknowndates.md)

###  Project WIKI ###
For more information about the project, visit the [wiki](https://github.com/UCHIC/ODM2/wiki). 

### View HTML based documentation of the ODM2 schema ###
HTML-based documentation for the current version of the ODM2 schema is at:

* [Current Version](http://uchic.github.io/ODM2/schemas/ODM2_Current/)
