
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

from ODM2.DataQuality.model import Dataquality


from ODMconnection import dbconnection




conn = dbconnection.createConnection('mssql', '(local)', 'TestODM2', 'ODM', 'odm')
#conn = dbconnection.createConnection('postgresql', 'localhost:5432', 'ODM2', 'postgres', '')



cs = CSread(conn)
dq =DQread(conn)
dq.getAllDataQuality()
#print cs.getAllVariables()


#print cs.getAllSamplingFeature()
print cs.getSamplingFeatureByCode("USU-LBR-Mendon")


sf = SFread(conn)
#print sf.getAllSites()
print sf.getSiteBySFCode("USU-LBR-Mendon")





#factory = cs._session_factory.getSession()
#print factory.query(Samplingfeature).all()
