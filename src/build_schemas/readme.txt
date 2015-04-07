This is a basic DDL build script that uses the DbWrench XML file to forward engineer to MsSQL, MySQL, and PostgreSQL.

This is a command line application

* run build_ddl.py [options]  

Useful commands

build_ddl.py -h 
 
build_ddl.py -xml /path/to/db_wrench/schema.xml -g MyOdmDB

The following command is currenlty used to generate all of the DDL SQL Scripts:

python build_ddl.py -d all -x ODM2_DBWrench_Schema.xml -c -o ddl -g ODM2
