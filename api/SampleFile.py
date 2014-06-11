
import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(this_file)
#print "dir: "+directory
sys.path.insert(0, directory)

from ODM2.Core.model import Samplingfeature
from ODM2.Core.services import readCore as CSread
#from ODM2.DataQuality.services import readDataQuality as DQread
#from ODM2.DataQuality.model import Dataquality

from ODMconnection import dbconnection




conn = dbconnection.createConnection('mssql', 'arroyo.uwrl.usu.edu', 'TestODM2', 'ODM', 'odm')
#conn = sm.build_conn_dict('mssql', '(local)', 'TestODM2', 'ODM', 'odm')
cs = CSread(conn)
#print cs.getAllVariables()
#dq = DQread(conn)
#print dq.getAllDataQuality()


sf = cs._session_factory.getSession()
#print sf.query(Dataquality).all()

print sf.query(Samplingfeature).all()
