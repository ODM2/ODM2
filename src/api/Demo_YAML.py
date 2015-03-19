import sys
import os

import pprint
from ODM2.models import *

from ODM2.new_services import *
from ODMconnection import dbconnection
from ODM2.YAML.yamlFunctions import YamlFunctions


this_file = os.path.realpath(__file__)
directory = os.path.dirname(this_file)
sys.path.insert(0, directory)


# Create a connection to the ODM2 database
# ----------------------------------------

#conn = dbconnection.createConnection('mysql', 'localhost', 'odm2', 'ODM', 'ODM123!!')

#session_factory = dbconnection.createConnection('mysql', 'localhost', 'ODM2', 'root', 'zxc')
session_factory = dbconnection.createConnection('mysql', 'jws.uwrl.usu.edu', 'odm2', 'ODM', 'ODM123!!')

#session_factory = dbconnection.createConnection('mssql', '(local)', 'ODM2SS', 'ODM', 'odm')
# conn = dbconnection.createConnection('postgresql', 'arroyo.uwrl.usu.edu:5432', 'ODMSS', 'Stephanie', 'odm')
#conn = dbconnection.createConnection('mysql', '127.0.0.1:3306', 'ODM2', 'Stephanie', 'odm')


# Create a connection for each of the schemas. Currently the schemas each have a different
# connection but it will be changed to all the services sharing a connection
# ----------------------------------------------------------------------------------------

_session = session_factory.getSession()




pp = pprint.PrettyPrinter(indent=8)
# Demonstrate loading a yaml file into an ODM2 database
print
print "---------------------------------------------------------------------"
print "---------                                                  ----------"
print "-------- \tExample of Loading yaml file into SQLAlchemy \t---------"
print "---------                                                  ----------"
print "---------------------------------------------------------------------"


files = []
# files.append(os.path.join('.', 'ODM2/YAML/iUTAH_MultiTimeSeriesExample_CompactHeader2.yaml'))
# files.append(os.path.join('.', 'ODM2/YAML/iUTAH_SpecimenTimeSeriesExample_CompactHeader.yaml'))
# files.append(os.path.join('.', 'ODM2/YAML/iUTAH_MultiTimeSeriesExample_CompactHeader.yaml'))
# files.append(os.path.join('.', 'ODM2/YAML/Examples/iUTAH_MultiTimeSeriesExample_LongHeader+AKA.yaml'))
# files.append(os.path.join('.', 'ODM2/YAML/Examples/iUTAH_MultiTimeSeriesExample_LongHeader.yaml'))
files.append(os.path.join('.', 'ODM2/YAML/Examples/test.yaml'))

## Working files
# files.append(os.path.join('.', 'ODM2/YAML/Examples/iUTAH_MultiTimeSeriesExample_CompactHeader.yaml'))




import timeit
start = timeit.default_timer()
yaml_load = YamlFunctions(_session)

# d = {}
# for i in files:
#     d[i] = yaml_load.extractYaml(i)


yaml_load.loadFromFile(files[0])

print
print "-------- Performance Results using python module: timeit --------"
print "Loaded YAML file in ", timeit.default_timer() - start, " seconds"

# citation =

_session.autoflush = False

# yaml_load._session.autoflush = False
_session.flush()
persons = _session.query(People).all()
datasets = _session.query(DataSets).all()
citations = _session.query(Citations).all()
authorlists = _session.query(AuthorLists).all()
spatial_references = _session.query(SpatialReferences).all()

# sampling_features = _session.query(SamplingFeatures).all()
sampling_features = []
# sites = _session.query(Sites).all()
sites = []

methods = _session.query(Methods).all()
variables = _session.query(Variables).all()
units = _session.query(Units).all()
processing_levels = _session.query(ProcessingLevels).all()
actions = _session.query(Actions).all()

# yaml_load._session.commit()

person_read = core_read.getPeople()
print
pp.pprint("---Example YAML reading <People>---")
pp.pprint(person_read)
print
pp.pprint("---Example YAML reading <Citation>---")
pp.pprint(citations)
print
pp.pprint("---Example YAML reading <AuthorLists>---")
pp.pprint(authorlists)
print
pp.pprint("---Example YAML reading <DataSets>---")
pp.pprint(datasets)
print
pp.pprint("---Example YAML reading <Spatial References>---")
pp.pprint(spatial_references)
print
pp.pprint("---Example YAML reading <Methods>---")
pp.pprint(methods)
print
pp.pprint("---Example YAML reading <Variables>---")
pp.pprint(variables)
print
pp.pprint("---Example YAML reading <Units>---")
pp.pprint(units)
print
pp.pprint("---Example YAML reading <ProcessingLevels>---")
pp.pprint(processing_levels)
print
pp.pprint("---Example YAML reading <Sites>---")
pp.pprint(sites)
print
pp.pprint("---Example YAML reading <SamplingFeatures>---")
pp.pprint(sampling_features)
print
pp.pprint("---Example YAML reading <Actions>---")
pp.pprint(actions)
print




