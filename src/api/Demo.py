import sys
import os
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
conn = dbconnection.createConnection('mysql', 'localhost', 'odm2', 'ODM', 'ODM123!!')
#conn = dbconnection.createConnection('mysql', 'jws.uwrl.usu.edu', 'odm2', 'ODM', 'ODM123!!')
#conn = dbconnection.createConnection('postgresql', 'arroyo.uwrl.usu.edu:5432', 'TestODM', 'stephanie', 'odm')
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


# Run some basic sample queries.
# ------------------------------
# Get all of the variables from the database and print thier names to the console
allVars = core.read.getAllVariables()
numVars = len(allVars)
print "------------ Simple Variables Query ---------------"
print "There are " + str(numVars) + " Variables in the ODM2 database."
print "The list of variables includes:"
for x in allVars:
    print x.VariableCode + ": " + x.VariableNameCV


# Get all of the people from the database
allPeople = core_read.getAllPersons()
numPeople = len(allPeople)
print "------------ Simple People Query ------------------"
print "There are " + str(numPeople) + " People in the ODM2 database."
print "The list of People includes: "
for x in allPeople:
    print x.PersonFirstName + " " + x.PersonLastName


# Get all of the SamplingFeatures from the database
allFeatures = core_read.getAllSamplingFeatures()
numFeatures = len(allFeatures)
print "--------------- Information about SamplingFeatures ------------"
print "There are " + str(numFeatures) + " SamplingFeatures in the ODM2 database."
print "The list of SamplingFeatures includes: "
for x in allFeatures:
    print x.SamplingFeatureCode + ": " + x.SamplingFeatureName


# Now get the SamplingFeature object for a SamplingFeature code
sf = core_read.getSamplingFeatureByCode('USU-LBR-Mendon')
print "Get SamplingFeatureByCode result: ", sf


# You can drill down into the code and get object linked by foreign keys
print "\n\n------------Foreign Key sample--------- \n",


# Call getAllResult, but return only the first result
firstResult = core_read.getAllResult()[0]
print "FeatureAction: ", firstResult.FeatureActionObj
print "Action: ", firstResult.FeatureActionObj.ActionObj
print "Action Attribute: ", firstResult.FeatureActionObj.ActionObj.ActionTypeCV


# Now get a particular Result using a ResultID
TSResult = result_read.getTimeSeriesResultsByResultId(19)
print "TSResult: ", TSResult


# Get the values for a particular Result - in this case time series values from a time series result
TSValues = result_read.getTimeSeriesValuesByResultId(19)
print "Values: ", TSValues



# Another Results example
results = core_read.getAllResult()
if results:
    result = results[0]
    print "FeatureAction: ", result.FeatureActionObj
    print "Action: ", result.FeatureActionObj.ActionObj
    print "Action Attribute: ", result.FeatureActionObj.ActionObj.ActionTypeCV

    TSResult= result_read.getTimeSeriesResultsByResultId(result.ResultID)
    print "TSResult: ", TSResult
    TSValues = result_read.getTimeSeriesValuesByResultId(result.ResultID)
    print"Values: ", TSValues[0:10]
else:
    print "no Results returned"






# Demo the LikeODM1 stuff
from ODM2.LikeODM1.services import SeriesService
#### LIKE ODM1 ####
conn2 = dbconnection.createConnection('mssql', 'localhost', 'odm2', 'root', 'nlcd34GIS')
odm1service = SeriesService(conn2)
#print odm1service.get_all_units()
#print odm1service.get_all_sites()





#The following query shows that you can manipulate geometries within the code
#I can get back a union of two geometries
#and convert from a string to Geometry type if it is in WKT

#Code that is being run:
#Geom = self._session.query(Samplingfeature).first()
#GeomText = self._session.query(func.ST_Union(Geom.FeatureGeometry,func.ST_GeomFromText(TestGeom)).ST_AsText()).first()


#print "\n\n------------GeometryTest--------- \n",
#TestGeom = "POINT (30 10)"
#print "Static Test Geometry:", TestGeom
#print core_read.getGeometryTest(TestGeom)



#geomsf = core_read.getSamplingFeatureByGeometry('POINT(111.781944 41.743333)')
#print "Get Sampling Feature by Geometry: ", geomsf

