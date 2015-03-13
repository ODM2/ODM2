"""
Example using bootalchemy (if the model is within the same module)
"""
from bootalchemy.loader import Loader, YamlLoader
from .. import serviceBase
import ODM2.models as models
import yaml
from collections import OrderedDict

class YamlFunctions(object):

    # _mapping_tag = yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG
    #
    # def dict_representer(dumper, data):
    #     return dumper.represent_dict(data.iteritems())
    #
    # def dict_constructor(loader, node):
    #     return OrderedDict(loader.construct_pairs(node))
    #
    # yaml.add_representer(OrderedDict, dict_representer)
    # yaml.add_constructor(_mapping_tag, dict_constructor)

    def __init__(self, session):
        self._session = session

    def loadFromFile(self, filename):
        """
        Open a YAML file to be loaded into the SQLAlchemy connection
        :filename: path to yaml file
        """

        s = self.extractYaml(filename)

        if 'YODA' in s:
            print "<YODA Field FOUND! ... Manually removing it using 'dict.pop'> " \
                  "else it'll crash the program as sqlalchemy doesn't know what to do with it"
            s.pop('YODA')

        # debugging information
        # self.printValues(s)

        yl = YamlLoader(models)
        yl.from_list(self._session, [s])

    def loadFromFiles(self, files):
        """
        Load data from a list of yaml files
        """
        if not isinstance(files, list):
            files = [files]

        for item in files:
            self.loadFromFile(item)
    def extractYaml(self, filename):
        s = yaml.load(open(filename).read())
        return s
    def writeValues(self,s ):
        import os
        print "PWD: ", os.getcwd()
        with open('data.yaml', 'w') as outfile:
            outfile.write( yaml.dump(s, default_flow_style=True) )

    def printValues(self, s):
        import pprint
        pp =pprint.PrettyPrinter(indent=8)
        pp.pprint([s])

        for k,v in s.iteritems():
            print '-'*45
            print k
            print '-'*45
            for values in v:
                if isinstance(values, dict):
                    for item in values.iteritems():
                        print item
                    print

                elif isinstance(values, basestring):
                    print values












