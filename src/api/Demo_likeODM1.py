import sys
import os
import matplotlib.pyplot as plt
from matplotlib import dates
from ODM2.Core.services import readCore as CSread
from ODM2.Core.services import CoreServices
from ODM2.SamplingFeatures.services import readSamplingFeatures as SFread
from ODM2.Results.services import readResults as Rread
from ODMconnection import dbconnection

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


# Create a connection for each of the schemas. Currently the schemas each have a different
# connection but it will be changed to all the services sharing a connection
# ----------------------------------------------------------------------------------------
core_read = CSread(conn)
core = CoreServices(conn)
result_read = Rread(conn)
sampfeat_read = SFread(conn)



# Demo the LikeODM1 stuff
# -------------------------------------------------
import pprint
pp = pprint.PrettyPrinter(indent=8)
from ODM2.LikeODM1.services import SeriesService
#### LIKE ODM1 ####
#conn2 = dbconnection.createConnection('mysql', 'localhost', 'odm2', 'ODM', 'ODM123!!')

odm1service = SeriesService(conn)

print
print "************************************************"
print "\t\tUnits: "
print "************************************************"
print

pp.pprint(odm1service.get_all_units())

print
print "************************************************"
print "\t\tSites: "
print "************************************************"
print

pp.pprint(odm1service.get_all_sites())

print
print "************************************************"
print "\t\tVariables: "
print "************************************************"
print

pp.pprint(odm1service.get_all_variables())

print
print "************************************************"
print "\t\tData Sources: "
print "************************************************"
print

