This folder contains a Python script for automatically loading CV terms from the master lists at http://vocabulary.odm2.org into a blank instance of an ODM2 database. It should work with ODM2 databases in Microsoft SQL Server, MySQL, and PostgreSQL. 

This script should be run from the command line.  The following is an example:

python cvload.py mysql+pymysql://ODM:odm@localhost:3306/odm2

The connection string can be any format supported by sqlalchemy.  For example: 

{database type}+{driver name}://{username}:{password}@{server address}:{port number}/{database name}

This script has the following dependencies:
Python 2.7 
Sqlalchemy
Database Driver (choose the one for your database)
* mysql: pymysql 
* mssql: pyodbc
* postgresql: psycopg2
