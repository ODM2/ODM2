ODM2
====

The next version of the Observations Data Model.

For more information about the ODM2 development project, visit the [wiki](https://github.com/UCHIC/ODM2/wiki). 

##  Getting Started with ODM2 ##

SQL scripts for generating blank ODM2 databases can be found at the following locations:

* [Microsoft SQL Server](https://github.com/UCHIC/ODM2/blob/master/src/blank_schema_scripts/ms_sql_server/ODM2_for_MSSQL.sql)
* [MySQL](https://github.com/UCHIC/ODM2/blob/master/src/blank_schema_scripts/mysql/ODM2_for_MySQL.sql)
* [PostgreSQL](https://github.com/UCHIC/ODM2/blob/master/src/blank_schema_scripts/postgresql/ODM2_for_PostgreSQL.sql)
* [SQLite](https://github.com/UCHIC/ODM2/blob/master/src/blank_schema_scripts/sqlite/ODM2_for_SQLite.sql)

###  View Documentation of ODM2 Concepts ###

For more information on ODM2 concepts, examples, best practices, etc., visit the [Documentation](https://github.com/UCHIC/ODM2/wiki/documentation) page on the wiki.

###  View Diagrams and Documentation of the ODM2 Schema ###

Schema diagrams for the current version of the ODM2 schema are at:

* [Entity Relationship Diagrams](http://uchic.github.io/ODM2/schemas/ODM2_Current/)
* [UML (probably not yet fully in sync with ERD)](http://uchic.github.io/ODM2/uml/index.htm)


##  Data Use Cases ##

The following data use cases are available. We have focused on designing ODM2 to support these data use cases. Available code and documentation show how these data use cases were mapped to the ODM2.

* [Little Bear River](https://github.com/UCHIC/ODM2/tree/master/usecases/littlebearriver) - Hydrologic time series and water quality samples from an ODM 1.1.1 database.  Implements an ODM2 database in Microsoft SQL Server.
* [PRISM-XAN](https://github.com/UCHIC/ODM2/tree/master/usecases/prismxan) - Water quality depth profiles and samples from Puget Sound. Implements an ODM2 database in PostgreSQL.

##  Our Goal with ODM2 ##

We are working to develop a community information model to extend interoperability of spatially discrete, feature based earth observations derived from sensors and samples and improve the capture, sharing, and archival of these data. This information model, called ODM2, is being designed from a general perspective, with extensibility for achieving interoperability across multiple disciplines and systems that support publication of earth observations.

![ODM2 Schematic](/doc/images/odm2_schematic.jpg)

