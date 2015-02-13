import sys
import os
from ODMconnection import dbconnection
import pprint
from ODM2.LikeODM1.services import SeriesService

this_file = os.path.realpath(__file__)
directory = os.path.dirname(this_file)
sys.path.insert(0, directory)


# Create a connection to the ODM2 database
# ----------------------------------------
# conn = dbconnection.createConnection('mysql', 'localhost', 'odm2', 'ODM', 'ODM123!!')
conn = dbconnection.createConnection('mysql', 'jws.uwrl.usu.edu', 'odm2', 'ODM', 'ODM123!!')
#conn = dbconnection.createConnection('mssql', '(local)', 'ODM2SS', 'ODM', 'odm')
#conn = dbconnection.createConnection('postgresql', 'arroyo.uwrl.usu.edu:5432', 'ODMSS', 'Stephanie', 'odm')
#conn = dbconnection.createConnection('mysql', '127.0.0.1:3306', 'ODM2', 'Stephanie', 'odm')
# -------------------------------------------------

pp = pprint.PrettyPrinter(indent=8)

print
print "************************************************"
print "\t\tODM2 -> ODM1 Demo: "
print "************************************************"
print

odm1service = SeriesService(conn)
pp.pprint(conn)

print
print "************************************************"
print "\t\tUnits: get_all_units()"
print "************************************************"
print

pp.pprint(odm1service.get_all_units())

print
print "************************************************"
print "\t\tSites: get_all_sites()"
print "************************************************"
print

pp.pprint(odm1service.get_all_sites())

print
print "************************************************"
print "\t\tMethods: get_all_methods()"
print "************************************************"
print

pp.pprint(odm1service.get_all_methods())

print
print "************************************************"
print "\t\tVariables: get_all_variables()"
print "************************************************"
print

pp.pprint(odm1service.get_all_variables())

print
print "************************************************"
print "\t\tData Sources: get_all_Source()"
print "************************************************"
print

pp.pprint(odm1service.get_all_Source())

