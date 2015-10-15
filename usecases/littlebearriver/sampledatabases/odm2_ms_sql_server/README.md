Little Bear River Microsoft SQL Server Test Database
====================================================
This folder contains a Microsoft SQL Server ODM2 database containing a subset of data from the Little Bear River data use case.  It contains approximately one month of continuous time series data for two monitoring sites, one water quality station in the Little Bear River and one weather station.  Also included are a number of water quality samples and associated results from the water quality station.

To attach the database to Microsoft SQL Server, do the following:

1. Download the the .mdf and .ldf files and copy them to the SQL Server data directory on the server to which you want to attach the database
2. Open Microsoft SQL Server Management Studio
3. Connect to the database server to which you want to attach the database
4. In the object explorer, right click on "Databases" and select "Attach"
5. Click the "Add" button near the center of the "Attach Databases" form
6. Navigate to your SQL Server data directory and select "ODM2.mdf"
7. Click the "OK" button on the "Attach Databases" form

To use the MSQL Dump File (SQL script) instead, do the following:

1. Download the .sql script file
2. Create a new database called 'ODM2' in your SQL Server instance
3. Open the script and run it on your 'ODM2' database

**NOTE**: The sample database and SQL dump file in this folder were created using Microsoft SQL Server 2008 R2. 

### Details ###
The database and SQL dump script in this folder were produced using the following steps:

1. Download the ODM2 for Microsoft SQL Server blank schema script from the GitHub repository
2. Open and execute the script in SQL Server Management Studio - this creates a new database called ODM2 that contains all of the ODM2 structure, but no data
3. Execute the Python script for loading the ODM2 controlled vocabularies into the database
4. Execute the the SQL script from the Little Bear River data use case folder to copy data from a sample ODM 1.1.1 database for the Little Bear River to the new ODM2 database.
5. Script the database to the .sql dump file
6. Detach the database and copy the database files

