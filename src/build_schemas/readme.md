This is a basic DDL build script that uses the DbWrench XML file to forward engineer to MsSQL, MySQL, and PostgreSQL.

This is a command line application

* run build_ddl.py [options]  

Useful commands

build_ddl.py -h 
 
build_ddl.py -xml /path/to/db_wrench/schema.xml -g MyOdmDB

The following commands are currently used to generate the DDL SQL Scripts:

**For Microsoft SQL Server:**

python build_ddl.py -d mssql -x ODM2_DBWrench_Schema.xml -c -o ddl -g ODM2

**For MySQL:**

python build_ddl.py -d mysql -x ODM2_DBWrench_Schema.xml -o ddl -g ODM2

**For PostgreSQL:**

python build_ddl.py -d postgresql -x ODM2_DBWrench_Schema.xml -o ddl -g ODM2

**For SQLite:**

python build_ddl.py -d sqlite -x ODM2_DBWrench_Schema.xml -o ddl -g ODM2
