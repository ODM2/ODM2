This directory contains a simple example of how to create an ODM2 database for SQLite and then load data into it from a call to a CUAHSI HIS WaterOneFlow web service. The web service call returns a WaterML 1.1 document containing a single time series of data, which is then parsed into the ODM2 database.

*create_ODM2_sqlite.py*
This script creates a new, blank ODM2 database called "ODM2.sqlite" and loads the controlled vocabularies.


*load_wof_to_ODM2.py*
This script makes a web service call to return a time series from the WOF web service and writes it to the blank ODM2 database.