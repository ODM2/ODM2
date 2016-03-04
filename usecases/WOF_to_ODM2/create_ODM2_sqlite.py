"""
 Summary: Create an ODM2 SQLite database from the ODM2_for_SQLite.sql
          DDL SQL script
 Created by: Jeff Horsburgh
 Created on: 11-13-2014

 Requirements:
 1.  Expects ODM2_for_SQLite.sql in the src/blank_schema_scripts/sqlite folder
 2.  Expects cvload.py in the src/load_cvs folder

 Outputs:
 1.  Creates a SQLite database called ODM2.sqlite in the same
     directory as the script file

 """
import sqlite3
import subprocess

# Create a new SQLite database and get a cursor
conn = sqlite3.connect('ODM2.sqlite')
c = conn.cursor()

# Open the DDL SQL file and read it
sqlFilePath = '../../src/blank_schema_scripts/sqlite/ODM2_for_SQLite.sql'
sqlString = open(sqlFilePath, 'r').read()

# Execute the DDL SQL script on the blank SQLite database
c.executescript(sqlString)

# Close the connection to the database
conn.close()

# Now execute the script to load the controlled vocabularies
cvScriptPath = '../../src/load_cvs/cvload.py'
cnxnString = 'sqlite:///ODM2.sqlite'
cmd = 'python ' + cvScriptPath + ' ' + cnxnString
p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
out, err = p.communicate()
result = out.split('\n')
for lin in result:
    if not lin.startswith('#'):
        print(lin)
