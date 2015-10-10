Little Bear River MySQL Test Database
=====================================
This folder contains a MySQL dump file for generating a testing ODM2 database containing a subset of data from the Little Bear River data use case.  It contains approximately one month of continuous time series data for two monitoring sites, one water quality station in the Little Bear River and one weather station.  Also included are a number of water quality samples and associated results from the water quality station.

To create the new database in MySQL, do the following:

1. Download the the MySQL dump file
2. Create a new schema in MySQL called "ODM2"
3. Open the MySQL dump file in MySQL workbench or other software and execute it.  The dump file is coded to copy all objects and data to a schema named "ODM2".  If needed, this can be changed in the first line of the MySQL dump file.

### Details ###
The MySQL dump file in this folder was produced using the following steps:

1. Used the MySQL Workbench database migration tool to migrate the testing database from Microsoft SQL Server to a schema called "ODM2" within a MySQL instance. See the readme file in the folder for the SQL Server test database for more details about how that database was created.  The Microsoft SQL Server instance was on Windows, and the MySQL instance was on a Mac.  I used MySQL Workbench on the Windows machine to push to the MySQL server on the Mac.
2. Used the MySQL Export Data functionality to export the new ODM2 schema to a MySQL dump file. I did this on my Mac.