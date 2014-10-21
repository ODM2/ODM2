
import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(this_file)
sys.path.insert(0, directory)


from ODM2.Core.services import readCore as CSread
from ODM2.Core.services import CoreServices
from ODM2.SamplingFeatures.services import readSamplingFeatures as SFread
from ODM2.Results.services import readResults as Rread

from ODMconnection import dbconnection



#create connection to the database
conn = dbconnection.createConnection('mssql', '(local)', 'ODM2SS', 'ODM', 'odm')
conn = dbconnection.createConnection('postgresql', 'arroyo.uwrl.usu.edu:5432', 'ODMSS', 'Stephanie', 'odm')
#conn = dbconnection.createConnection('mysql', '127.0.0.1:3306', 'ODM2', 'Stephanie', 'odm')




#create a connection for each of the schemas. Currently the schemas each of a different
#connection but it will be changed to all the services sharing a connection
core_read = CSread(conn)
core = CoreServices(conn)
result_read = Rread(conn)
sampfeat_read = SFread(conn)



#run some basic sample queries.
vars = core.read.getAllVariables()
print "Get all variable: ", vars
people= core_read.getAllPersons()
print "Get all People: ", people

sfs= core_read.getAllSamplingFeatures()
print "Get all SamplingFeatures: ", sfs
if len(sfs)>0:
    temp = sfs[0]
    print temp.SamplingFeatureCode
    val= core.read.getSamplingFeatureByCode(temp.SamplingFeatureCode)
    sf = core_read.getSamplingFeatureByCode(u'logan_river_outlet')
    print "Get SamplingFeatures by code: ", sf



#The following query shows that you can manipulate geometries within the code
#I can get back a union of two geometries
#and convert from a string to Geometry type if it is in WKT

#Code that is being run:
#Geom = self._session.query(Samplingfeature).first()
#GeomText = self._session.query(func.ST_Union(Geom.FeatureGeometry,func.ST_GeomFromText(TestGeom)).ST_AsText()).first()

'''
print "\n\n------------GeometryTest--------- \n",
TestGeom = "POINT (30 10)"
print "Static Test Geometry:", TestGeom
print core_read.getGeometryTest(TestGeom)



geomsf = core_read.getSamplingFeatureByGeometry('POINT(111.781944 41.743333)')
print "Get Sampling Feature by Geometry: ", geomsf
'''

# you can drill down into the code and get object linked by foreign keys
print "\n\n------------Foreign Key sample--------- \n",
#

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
#print dir(result)


from ODM2.LikeODM1.services import SeriesService
#### LIKE ODM1 ####
#conn2 = dbconnection.createConnection('mssql', 'arroyo.uwrl.usu.edu', 'TestODM2', 'ODM', 'odm')
odm1service = SeriesService(conn)
#print odm1service.get_all_units()
#print odm1service.get_all_sites()





