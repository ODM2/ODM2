ODM2 Documentation Index
========================

The next version of the Observations Data Model.

### ODM2 Architecture ###

ODM2 is organized with a "core" schema and multiple "extension" schemas that extend the functionality of the core. The following sections cover some overarching concepts for ODM2 and then focus on specific entities within the ODM2 Core schema and ODM2's extension schemas.

### ODM2 Overarching Concepts ###
ODM2 inherits extensively from ODM 1.1.1, which was developed as part of the Consortium of Universities for the Advancement of Hydrologic Science, Inc. (CUAHSI) Hydrologic Information System (HIS) project. ODM2 also inherits features from the Open Geospatial Consortium (OGC) Observations & Measurements (O&M) standard. The following are general, overarching concepts within ODM2.

* Observations 
* Geography, location, and spatial offsets
* Support, Spacing, and Extent
* ...

### ODM2Core Entities ###
The following are entities in the [ODM2 Core schema](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Core.html):

* [Actions](actions.md) - Actions are performed by people and may have a result.
* [Datasets](datasets.md) - Enables grouping of results into a larger dataset.
* [Directives](directives.md) - The reason(s) for which an action was taken.
* [Methods](methods.md) - The procedure used to perform an action.
* [Organizations](organizations.md) - A group of people.
* [People](people.md) - Individuals that perform actions.
* [Quality Control Levels](qualitycontrollevels.md) - Levels to which data have been quality controlled.
* [Related Results](relatedresults.md) - Enables specifying relationships among results.
* [Results](results.md) - The result of an action.
* [Roles](roles.md) - Capacities in which people act.
* [Sampling Features](samplingfeatures.md) - Where or on what an action was performed.
* [Units](units.md) - Units of measure.
* [Variables](variables.md) - What was observed.

### ODM2 Extensions ###
The following are extensions to the ODM2 Core:

* Annotations - Data qualifying comments and annotations on other entities.
* Equipment - Information for managing sampling or laboratory equipment.
* Controlled Vocabulary - Entities for enforcing CVs.
* Extension - A general extensibility mechanism for ODM2 (adding new attributes).
* External Identifiers - Linking entities in ODM2 to external repositories.
* Provenance - Information about versions and provenance.
* [Results](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2Results.html) - Values for observation results.
* Samples - Information for managing ex situ, sample-based data.
* [Sampling Features](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2SamplingFeatures.html) - Information about sampling features on which observations are made.
* Sensors - Information about sensors and in situ sampling equipment.

###  Project WIKI ###
For more information about the project, visit the [wiki](https://github.com/UCHIC/ODM2/wiki). 

### View HTML based documentation of the ODM2 schema ###
HTML-based documentation for the current version of the ODM2 schema is at:

* [Current Version](http://uchic.github.io/ODM2/schemas/ODM2_Current/)
