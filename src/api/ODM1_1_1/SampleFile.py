
import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(this_file)
#print "dir: "+directory
sys.path.insert(0, directory)

from ODM2.Core.model import Samplingfeature
from ODM2.Core.services import CoreService


from ODMconnection import dbconnection




conn = dbconnection.create_connection('mssql', '(local)', 'TestODM2', 'ODM', 'odm')
#conn = sm.build_conn_dict('mssql', '(local)', 'TestODM2', 'ODM', 'odm')
cs = CoreService(conn)
print cs.get_all_variables()


sf = cs._session_factory.getSession()

print sf.query(Samplingfeature).all()
