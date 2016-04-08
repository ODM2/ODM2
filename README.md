ODM2
====

The next version of the Observations Data Model.

For more information about the ODM2 development project, visit the [wiki](https://github.com/ODM2/ODM2/wiki). 

Have a look at the ODM2 paper in Environmental Modelling & Software. It's open access!

Horsburgh, J. S., Aufdenkampe, A. K., Mayorga, E., Lehnert, K. A., Hsu, L., Song, L., Spackman Jones, A., Damiano, S. G., Tarboton, D. G., Valentine, D., Zaslavsky, I., Whitenack, T. (2016). Observations Data Model 2: A community information model for spatially discrete Earth observations, Environmental Modelling & Software, 79, 55-74, [http://dx.doi.org/10.1016/j.envsoft.2016.01.010](http://dx.doi.org/10.1016/j.envsoft.2016.01.010)

##  Getting Started with ODM2 ##

SQL scripts for generating blank ODM2 databases can be found at the following locations:

* [Microsoft SQL Server](https://github.com/ODM2/ODM2/blob/master/src/blank_schema_scripts/ms_sql_server/ODM2_for_MSSQL.sql)
* [MySQL](https://github.com/ODM2/ODM2/blob/master/src/blank_schema_scripts/mysql/ODM2_for_MySQL.sql)
* [PostgreSQL](https://github.com/ODM2/ODM2/blob/master/src/blank_schema_scripts/postgresql/ODM2_for_PostgreSQL.sql)
* [SQLite](https://github.com/ODM2/ODM2/blob/master/src/blank_schema_scripts/sqlite/ODM2_for_SQLite.sql)

###  View Documentation of ODM2 Concepts ###

For more information on ODM2 concepts, examples, best practices, etc., visit the [Documentation](https://github.com/ODM2/ODM2/wiki/documentation) page on the wiki.

###  View Diagrams and Documentation of the ODM2 Schema ###

Schema diagrams for the current version of the ODM2 schema are at:

* [Entity Relationship Diagrams](http://ODM2.github.io/ODM2/schemas/ODM2_Current/)
* [UML (probably not yet fully in sync with ERD)](http://ODM2.github.io/ODM2/uml/index.htm)


##  Data Use Cases ##

The following data use cases are available. We have focused on designing ODM2 to support these data use cases. Available code and documentation show how these data use cases were mapped to the ODM2.

* [Little Bear River](https://github.com/ODM2/ODM2/tree/master/usecases/littlebearriver) - Hydrologic time series and water quality samples from an ODM 1.1.1 database.  Implements an ODM2 database in Microsoft SQL Server.
* [PRISM-XAN](https://github.com/ODM2/ODM2/tree/master/usecases/prismxan) - Water quality depth profiles and samples from Puget Sound. Implements an ODM2 database in PostgreSQL.

##  Our Goal with ODM2 ##

We are working to develop a community information model to extend interoperability of spatially discrete, feature based earth observations derived from sensors and samples and improve the capture, sharing, and archival of these data. This information model, called ODM2, is being designed from a general perspective, with extensibility for achieving interoperability across multiple disciplines and systems that support publication of earth observations.

![ODM2 Schematic](/doc/images/odm2_schematic.jpg)

## Credits ##

This work was supported by National Science Foundation Grant [EAR-1224638](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1224638). Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation. 

ODM2 draws heavily form our prior work with the CUAHSI Hydrologic information system and ODM 1.1.1 (Horsburgh et al., 2008; Horsburgh and Tarboton, 2008), our experiences workin on the Critical Zone Observatory Integrated Data Management System (CZOData), and our experiences with the EarthChem systems (e.g., Lehnert et al., 2007; Lehnert et al., 2009). It also extensively uses concepts from the Open Geospatial Consortium's Observations & Measurements standard (Cox, 2007a; Cox, 2007b; Cox, 2011a; Cox, 2011b; ISO, 2011).

### References ###
[See a full list of ODM2 related references](https://github.com/ODM2/ODM2/wiki/References)

Cox, S.J.D. (2007a). Observations and Measurements - Part 1 - Observation schema, OGC Implementation Specification, OGC 07-022r1. 73 + xi. http://portal.opengeospatial.org/files/22466.
 
Cox, S.J.D. (2007b). Observations and Measurements – Part 2 - Sampling Features, OGC Implementation Specification, OGC 07-002r3. 36 + ix. http://portal.opengeospatial.org/files/22467.
 
Cox, S.J.D. (2011a). Geographic Information - Observations and Measurements, OGC Abstract Specification Topic 20 (same as ISO 19156:2011), OGC 10-004r3. 54. http://dx.doi.org/10.13140/2.1.1142.3042.
 
Cox, S.J.D. (2011b). Observations and Measurements - XML Implementation, OGC Implementation Standard, OGC 10-025r1. 66 + x. http://portal.opengeospatial.org/files/41510 (accessed September 16, 2014).

Horsburgh, J.S., D.G. Tarboton, D.R. Maidment, and I. Zaslavsky (2008). A relational model for environmental and water resources data, Water Resources Research, 44, W05406, http://dx.doi.org/10.1029/2007WR006392.

Horsburgh, J.S., D.G. Tarboton (2008). CUAHSI Community Observations Data Model (ODM) Version 1.1.1 Design Specifications, CUAHSI Open Source Software Tools, http://www.codeplex.com/Download?ProjectName=HydroServer&DownloadId=349176. 

ISO 19156:2011 - Geographic information -- Observations and Measurements, International Standard (2011), International Organization for Standardization, Geneva. http://dx.doi.org/10.13140/2.1.1142.3042.

Lehnert, K.A., Walker, D., Vinay, S., Djapic, B., Ash, J., Falk, B. (2007). Community-Based Development of Standards for Geochemical and Geochronological Data, Eos Trans. AGU, 88(52), Fall Meet. Suppl., Abstract IN52A-09.

Lehnert, K.A., Walker, D., Block, K.A., Ash, J.M., Chan, C. (2009). EarthChem: Next developments to meet new demands, American Geophysical Union, Fall Meeting 2009, Abstract #V12C-01.
