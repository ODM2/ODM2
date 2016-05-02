# ---------------------------------------------------------------------
# Summary: Create an ODM2 SQLite database from the ODM2_for_SQLite.sql
#          DDL SQL script
# Created by: Jeff Horsburgh
# Created on: 11-13-2014
#
# Requirements:
# 1.  Expects ODM2_for_SQLite.sql in the same directory as
#     the script file
#
# Outputs:
# 1.  Creates a SQLite database called ODM2.sqlite in the same
#     directory as the script file
# ---------------------------------------------------------------------
import sqlite3

# Create a new SQLite database and get a cursor
conn = sqlite3.connect('ODM2.sqlite')
c = conn.cursor()

# Open the DDL SQL file and read it
sqlString = open('ODM2_for_SQLite.sql', 'r').read()

# Execute the DDL SQL script on the blank SQLite database
c.executescript(sqlString)

# Close the connection to the database
conn.close()
