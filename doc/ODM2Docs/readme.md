ODM2 Documentation Index
========================

The next version of the Observations Data Model.

### ODM2 Architecture ###

ODM2 is organized with a "core" schema and multiple "extension" schemas that extend the functionality of the core.

### ODM2Core ###

The following are entities in the ODM2 Core schema:

* [Actions](actions.md) - Actions are performed by people and may have a result.
* [Datasets](datasets.md) - Enables grouping of results into a larger dataset.
* [Directives](directives.md) - The reason(s) for which an action was taken.
* [Methods](methods.md) - The procedure used to perform an action.
* [Organizations](organizations.md) - A group of people.
* [People](people.md) - Individuals that perform actions.
* [Quality Control Levels](qualitycontrollevels.md) - Levels to which data have been quality controlled.
* [Related Results](relatedresults.md) - Enables specifying relationships among results.
* Results - The result of an action.
* Roles - Capacities in which people act.
* Sampling Features - Where an action was performed.
* Units - Units of measure.
* Variables - What was observed.

### ODM2 Extensions ###

The following are extensions to the ODM2 Core:

* Annotations - Data qualifying comments and annotations on other entities.
* Equipment - Information for managing sampling or laboratory equipment.
* Controlled Vocabulary - Entities for enforcing CVs.
* Extension - A general extensibility mechanism for ODM2 (adding new attributes).
* External Identifiers - Linking entities in ODM2 to external repositories.
* Provenance - Information about versions and provenance.
* Results - Values for observation results.
* Samples - Information for managing ex situ, sample-based data.
* Sampling Features - Information about sampling features on which observations are made.
* Sensors - Information about sensors and in situ sampling equipment.

###  Project WIKI ###

For more information about the project, visit the [wiki](https://github.com/UCHIC/ODM2/wiki). 

### View HTML based documentation of the ODM2 schema ###

HTML-based documentation for the current version of the ODM2 schema is at:

* [Current Version](http://uchic.github.io/ODM2/schemas/ODM2_Current/)
