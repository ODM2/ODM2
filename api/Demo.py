
import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(this_file)
#print "dir: "+directory
sys.path.insert(0, directory)

from ODM2.Core.model import Samplingfeature
from ODM2.Core.services import readCore as CSread
from ODM2.SamplingFeatures.services import readSamplingFeatures as SFread
from ODM2.DataQuality.services import readDataQuality as DQread
from ODM2.Annotations.services import readAnnotations as Annoread
from ODM2.Equipment.services import readEquipment as EQread
from ODM2.Provenance.services import readProvenance as PRread
from ODM2.ExtensionProperties.services import readExtensionProperties as EPread
from ODM2.ExternalIdentifiers.services import readExternalIdentifiers as EIread
from ODM2.LabAnalyses.services import readLabAnalyses as LAread
from ODM2.Results.services import readResults as Rread
from ODM2.Sensors.services import readSensors as Sread
from ODM2.CV.services import readCV as CVread

from ODM2.DataQuality.model import Dataquality


from ODMconnection import dbconnection




conn = dbconnection.createConnection('postgresql', 'castro-server.bluezone.usu.edu', 'ODM2', 'postgres', 'postgres')


#create a connection for each of the schemas. Currently the schemas each of a different
#connection but it will be changed to all the services sharing a connection
cs = CSread(conn)
sf = SFread(conn)
dq =DQread(conn)
anno = Annoread(conn)
eq = EQread(conn)
pr = PRread(conn)
ep = EPread(conn)
ei = EIread(conn)
la = LAread(conn)
r = Rread(conn)
cv = CVread(conn)
s = Sread(conn)




print "Get all equipment: " ,eq.getAllEquipment()
print "Get all dataquality: " ,dq.getAllDataQuality()
print "Get all variable: " ,cs.getAllVariables()
print "Get all People: " ,cs.getAllPerson()#[0].PersonFirstName
print "Get all sites: " , sf.getAllSites()
print "Get all SamplingFeatures: ", cs.getAllSamplingFeature()
print "Get  SamplingFeatures by code: ",cs.getSamplingFeatureByCode(u'logan_river_outlet')



#shows that you can manipulate geometries within the code
#I can get back a union of two geometries( currently the Same Geometry),
#and convert from a string to Geometry type if it is in WKT

#Code that is being run
#Geom = self._session.query(Samplingfeature).first()
#TestGeom = "POINT (30 10)"
#GeomText = self._session.query(func.ST_Union(Geom.FeatureGeometry,func.ST_GeomFromText(TestGeom)).ST_AsText()).first()


print "\n\n------------GeometryTest--------- \n",
print cs.getGeometryTest()


# you can drill down into the code and get object linked by foreign keys
print "\n\n------------Foreign Key sample--------- \n",
#
result = cs.getAllResult()[0]
print "FeatureAction: ", result.FeatureActionObj
print "Action: ", result.FeatureActionObj.ActionObj
print "Action Attribute: ", result.FeatureActionObj.ActionObj.ActionTypeCV

samplingfeature = cs.getAllSamplingFeature()[0]
#print samplingfeature.

