"""
    cvScript:
        Downloads and loads Controlled Vocabulary terms from the Vocabulary's online api and populates a empty ODM2 database

"""

__author__ = 'jmeline'


import cvmodels
import xml.etree.ElementTree as ET
import pprint
pp = pprint.PrettyPrinter(indent=8)

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from progressbar import ProgressBar, Percentage, Bar, RotatingMarker, FormatLabel, ReverseBar
try:
    # python 3
    import urllib.request as request
    basestring = str

except:
    # python 2
    import urllib as request


conn_string = 'mysql+pymysql://root:zxc@localhost/ODM2'
####################################
#       Custom object to hold the values
####################################
class CVObject:
    def __init__(self, term=None, name=None, defi=None, cat=None, uri=None):
        self.Term = term
        self.Name = name
        self.Definition = defi
        self.Category = cat
        self.SourceVocabularyURI = uri

    def __repr__ (self):
        return "<cvObject('%s', '%s', '%s', '%s', '%s'>" % (
            self.Term, self.Name, self.Definition,
            self.Category, self.SourceVocabularyURI)

    def get_elements(self):
        return {"Term": self.Term,
                "Name": self.Name,
                "Definition": self.Definition,
                "Category": self.Category,
                "SourceVocabularyURI": self.SourceVocabularyURI
            }

########################################
#       List of CV's:
#           Note: This must be updated if more types are introduced
########################################

vocab= ["actiontype", "qualitycode", "samplingfeaturegeotype", "elevationdatum",
        "resulttype", "sampledmedium", "speciation", "aggregationstatistic",
        "methodtype", "taxonomicclassifiertype", "sitetype", "censorcode",
        "directivetype", "datasettype", "organizationtype", "status",
        "annotationtype", "samplingfeaturetype", "equipmenttype", "specimenmedium",
        "spatialoffsettype", "referencematerialmedium", "specimentype",
        "variabletype", "variablename", "actiontype", "propertydatatype"]

objects = ['CVActionType', 'CVQualityCode', 'CVSamplingFeatureGeoType', 'CVElevationDatum','CVResultType', 'CVSampledMedium',
    'CVSpeciation', 'CVAggregationStatistic', 'CVMethodType', 'CVTaxonomicClassifierType', 'CVSiteType', 'CVCensorCode',
    'CVDirectiveType', 'CVDatasetType', 'CVOrganizationType', 'CVStatus', 'CVAnnotationType', 'CVSamplingFeatureType',
    'CVEquipmentType', 'CVSpecimenMedium','CVSpatialOffsetType', 'CVReferenceMaterialMedium', 'CVSpecimenType',
    'CVVariableType', 'CVVariableName', 'CVActionType', 'CVActionType', 'CVPropertyDataType']
####################################

dictionary = list(zip(vocab, objects))

####################################
#       Urls and skos links
####################################

url ="http://vocabulary.odm2.org/api/v1/%s/?format=skos"
dc="{http://purl.org/dc/elements/1.1/}%s"
rdf="{http://www.w3.org/1999/02/22-rdf-syntax-ns#}%s"
skos="{http://www.w3.org/2004/02/skos/core#}%s"
odm2="{http://vocabulary.odm2.org/ODM2/ODM2Terms/}%s"

engine = create_engine(conn_string,echo=False, encoding='utf-8')
Session = sessionmaker(bind=engine)
session = Session()

####################################
#       Load up all the cvmodels into a list
####################################
modules = []
def load_up_cvmodels():
    model = [cvmodels]
    assert model
    for item in model:
        if isinstance(item, basestring):
            modules.append(__import__(item))
        else:
            modules.append(item)

####################################
#       Converts string class names into functions
####################################
def get_klass(klass_name):
    klass = None
    for module in modules:
        klass = getattr(module, klass_name)
        break
    return klass

####################################
#       Obtain xml_data from vocabulary website
####################################
def obtain_url(vocab):
    vocab_site = url % vocab
    try:
        xml_data = request.urlopen(vocab_site).read()
        return xml_data
    except Exception as e:
        print ("There was an error with connecting to the site: ", e)

#####################################
#       Converts a cv_object to the respective SQLAlchemy object
#####################################
def build_sql_object(cv_object, str_obj):
        _class_object = get_klass(str_obj)
        return _class_object(**cv_object.get_elements())

#####################################
#       Parses xml_data and creates cv_obj
#####################################
def build_cv_object(item):
        cv_obj = CVObject()

        try:
            cv_obj.Name = item.find(skos % "prefLabel").text
        except:
            return None
        cv_obj.Term = item.attrib[rdf % "about"].split('/')[-1]
        cv_obj.Definition = item.find(skos % "definition").text
        cv_obj.SourceVocabularyURI = item.attrib[rdf % 'about']
        try:
            cv_obj.Category = item.find(odm2 % 'category').text
        except:
            pass

        return cv_obj

#####################################
#       Loads sql_objects into SQLAlchemy session
#####################################
def load_up_objects():
    widgets=[FormatLabel("Loading CV_Terms"), ':', Percentage(), " <<<", Bar(), ">>>"]
    pbar = ProgressBar(widgets=widgets, maxval=len(dictionary)).start()
    objs = []
    for i, (vocab, obj) in enumerate(dictionary):
        xml_data = obtain_url(vocab)
        root = ET.fromstring(xml_data)
        skos_items = root.findall(rdf % 'Description')

        for item in skos_items:
            cv_obj = build_cv_object(item)
            if not cv_obj:
                continue
            # print("TableName: ", sql_obj.__tablename__)
            sql_obj = build_sql_object(cv_obj, obj)
            session.add(sql_obj)
            objs.append(sql_obj)

        try:
            output = session.new
            session.commit()
        except Exception as e:
            session.rollback()
            pass
        pbar.update(i)
    pbar.finish()

    print ("Finished Loading Terms: ")

if __name__ == '__main__':
    load_up_cvmodels()
    assert len(modules) > 0
    load_up_objects()