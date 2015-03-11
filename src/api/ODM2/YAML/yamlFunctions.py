"""
Example using bootalchemy (if the model is within the same module)
"""
# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker
# from sqlalchemy.ext.declarative import declarative_base
# from sqlalchemy import Column, Integer, String, Text, ForeignKey, Date, Table, MetaData
#
# import pprint
#
# ## create a in-memory session
# engine = create_engine('sqlite:///:memory:', echo=True)
# Session = sessionmaker(bind=engine)
# session = Session()
#
# ## create a table
# Base = declarative_base()
# class User(Base):
#      __tablename__ = 'users'
#      id = Column(Integer, primary_key=True)
#      name = Column(String)
#      fullname = Column(String)
#      password = Column(String)
#      def __repr__(self):
#         return "<User(name='%s', fullname='%s', password='%s')>" % (
#                              self.name, self.fullname, self.password)
#
# ## bulid the table within memory
# ## Note: operational error will occur if this isn't called
# Base.metadata.create_all(engine)
#
# class DBObject(object):
#     """
#     This is the DBObject class which all other model classes rely on.
#     It allows us to instantiate an object with attributes simply by passing
#     them into the constructor.
#     """
#     def __init__(self, **kwargs):
#         for item, value in kwargs.iteritems():
#             setattr(self, item, value)
#
# modelObject = DBObject(User=User)
#
# yl = YamlLoader(modelObject)
# yl.loadf(session, 'example.yaml')
#
# users = session.query(User).all()
#
# pp = pprint.PrettyPrinter(indent=8)
# results = [(user.id, user.name, user.fullname, user.password) for user in users]
# print "-"*50
# print "Example using bootalchemy (Reading from a yaml file) "
# print "Querying usernames"
# pp.pprint(results)
# print "-"*50
from bootalchemy.loader import Loader, YamlLoader
from .. import serviceBase
import ODM2.models as models
import yaml
from collections import OrderedDict

class YamlFunctions(object):

    _mapping_tag = yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG

    def dict_representer(dumper, data):
        return dumper.represent_dict(data.iteritems())

    def dict_constructor(loader, node):
        return OrderedDict(loader.construct_pairs(node))

    yaml.add_representer(OrderedDict, dict_representer)
    yaml.add_constructor(_mapping_tag, dict_constructor)

    def __init__(self, session):
        self._session = session

    def loadFromFile(self, filename):
        """
        Open a YAML file to be loaded into the SQLAlchemy connection
        :filename: path to yaml file
        """

        yl = YamlLoader(models)
        # loader = Loader(models)
        s = yaml.load(open(filename).read())

        if 'YODA' in s:
            print "<YODA Field FOUND! ... Manually removing it using 'dict.pop'> " \
                  "else it'll crash the program as sqlalchemy doesn't know what to do with it"
            s.pop('YODA')

        # debugging information
        import pprint
        pp =pprint.PrettyPrinter(indent=8)
        pp.pprint([s])
        # yl.loadf(self._session, filename)
        yl.from_list(self._session, [s])
        # loader.from_list(self._session, [s])


    def loadFromFiles(self, files):
        """
        Load data from a list of yaml files
        """
        if not isinstance(files, list):
            files = [files]

        for item in files:
            self.loadFromFile(item)












