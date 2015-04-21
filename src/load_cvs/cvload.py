from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys

# Supporting Python3
try:
    import urllib.request as request
except ImportError:
    import urllib as request
import xml.etree.ElementTree as ET
import argparse



# ################################################################################
# CV  Objects
# ################################################################################
from sqlalchemy import Column,  String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata


class CVActionType(Base):
    __tablename__ = 'CV_ActionType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))

    def __repr__(self):
        return "<CVActionType('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVAggregationStatistic(Base):
    __tablename__ = 'CV_AggregationStatistic'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CVAggregationStatisticsType('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVAnnotationType(Base):
    __tablename__ = 'CV_AnnotationType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CVAnnotationType('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVCensorCode(Base):
    __tablename__ = 'CV_CensorCode'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CVActionType('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVDatasetType(Base):
    __tablename__ = 'CV_DatasetTypeCV'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVDirectiveType(Base):
    __tablename__ = 'CV_DirectiveType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVElevationDatum(Base):
    __tablename__ = 'CV_ElevationDatum'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVEquipmentType(Base):
    __tablename__ = 'CV_EquipmentType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVMethodType(Base):
    __tablename__ = 'CV_MethodType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVOrganizationType(Base):
    __tablename__ = 'CV_OrganizationType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVPropertyDataType(Base):
    __tablename__ = 'CV_PropertyDataType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(100))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVQualityCode(Base):
    __tablename__ = 'CV_QualityCode'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVResultType(Base):
    __tablename__ = 'CV_ResultType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSampledMedium(Base):
    __tablename__ = 'CV_SampledMedium'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSamplingFeatureGeoType(Base):
    __tablename__ = 'CV_SamplingFeatureGeoType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSamplingFeatureType(Base):
    __tablename__ = 'CV_SamplingFeatureType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSpatialOffsetType(Base):
    __tablename__ = 'CV_SpatialOffsetType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSpeciation(Base):
    __tablename__ = 'CV_Speciation'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSpecimenMedium(Base):
    __tablename__ = 'CV_SpecimenMedium'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSpecimenType(Base):
    __tablename__ = 'CV_SpecimenType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSiteType(Base):
    __tablename__ = 'CV_SiteType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVReferenceMaterialMedium(Base):
    __tablename__ = 'CV_ReferenceMaterialMedium'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVStatus(Base):
    __tablename__ = 'CV_Status'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVTaxonomicClassifierType(Base):
    __tablename__ = 'CV_TaxonomicClassifierType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVUnitsType(Base):
    __tablename__ = 'CV_UnitsType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVVariableName(Base):
    __tablename__ = 'CV_VariableName'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVVariableType(Base):
    __tablename__ = 'CV_VariableType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


# -----------------------------------------------------------------------------
# handles customizing the error messages from Argparse
# -----------------------------------------------------------------------------
class MyParser(argparse.ArgumentParser):
        def error(self, message):
            sys.stderr.write("------------------------------\n")
            sys.stderr.write('error: %s\n' % message)
            sys.stderr.write("------------------------------\n")
            self.print_help()
            sys.exit(2)

# handle argument parsing
info = "A simple script that loads up cvterms into a blank ODM2 database"
parser = MyParser(description=info, add_help=True)
parser.add_argument(
        help="Format: {engine}+{driver}://{user}:{pass}@{address}/{db}\n"
        "mysql+pymysql://ODM:odm@localhost/odm2\n"
        "mssql+pyodbc://ODM:123@localhost/odm2\n"
        "postgresql+psycopg2://ODM:odm@test.uwrl.usu.edu/odm2\n",
        default=True, type=str, dest='conn_string')
parser.add_argument('-d', '--debug', 
        help="Debugging program without commiting anything to" 
        " remote database",
        action="store_true")
args = parser.parse_args()

# ------------------------------------------------------------------------------
#                                   Script Begin
# ------------------------------------------------------------------------------
## Verify connection string 
conn_string = args.conn_string
engine = None
session = None
try:
    engine = create_engine(conn_string, encoding='utf-8')
    session = sessionmaker(bind=engine)()
except Exception as e:
    print (e)
    sys.exit(0)

print ("Loading CVs using connection string: %s" % conn_string)


vocab= [("actiontype", CVActionType),
        ("qualitycode", CVQualityCode),
        ("samplingfeaturegeotype", CVSamplingFeatureGeoType),
        ("elevationdatum", CVElevationDatum),
        ("resulttype", CVResultType),
        ("sampledmedium", CVSampledMedium),
        ("speciation", CVSpeciation),
        ("aggregationstatistic", CVAggregationStatistic),
        ("methodtype", CVMethodType),
        ("taxonomicclassifiertype", CVTaxonomicClassifierType),
        ("sitetype", CVSiteType),
        ("censorcode", CVCensorCode),
        ("directivetype", CVDirectiveType),
        ("datasettype",CVDatasetType),
        ("organizationtype", CVOrganizationType),
        ("status", CVStatus),
        ("annotationtype", CVAnnotationType),
        ("samplingfeaturetype", CVSamplingFeatureType),
        ("equipmenttype", CVEquipmentType),
        ("specimenmedium", CVSpecimenMedium),
        ("spatialoffsettype", CVSpatialOffsetType),
        ("referencematerialmedium", CVReferenceMaterialMedium),
        ("specimentype", CVSpecimenType),
        ("variabletype", CVVariableType),
        ("variablename", CVVariableName),
        ("propertydatatype", CVPropertyDataType)]

url = "http://vocabulary.odm2.org/api/v1/%s/?format=skos"

#XML encodings
dc = "{http://purl.org/dc/elements/1.1/}%s"
rdf = "{http://www.w3.org/1999/02/22-rdf-syntax-ns#}%s"
skos = "{http://www.w3.org/2004/02/skos/core#}%s"
odm2 = "{http://vocabulary.odm2.org/ODM2/ODM2Terms/}%s"

# ------------------------------------------------------------------------------
#                                  Progress bar 
# ------------------------------------------------------------------------------
def update_progress(count, value):
    sys.stdout.write("\033[K\r")
    sys.stdout.flush()
    sys.stdout.write("[%-26s] %d%% %s Loaded\r" % 
                     ('='*count, (count+0.0)/len(vocab)*100, str(value)))
    sys.stdout.flush()

for count, (key, value) in enumerate(vocab):
    # print (count, key, value)
    # print ("\tLoading %s" % key)
    update_progress(count, value)                
    try:
        data = request.urlopen(url % key).read()
        root = ET.fromstring(data)
        CVObject = value
        objs = []
        for voc in root.findall(rdf %"Description"):
            try:
                obj = CVObject()
                obj.Term = voc.attrib[rdf%"about"].split('/')[-1]
                obj.Name = voc.find(skos%"prefLabel").text
                obj.Definition = voc.find(skos%"definition").text
                obj.Category = category = voc.find(odm2%"category").text if voc.find(odm2 % "category") is not None else None
                obj.SourceVocabularyURI = voc.attrib[rdf%"about"]
                objs.append(obj)
            except:
                pass
        session.add_all(objs)
        if not args.debug:
           session.commit()
    except Exception as e:
        session.rollback()
        print ("\t...Load was unsuccesful: \n%s" % e)
        sys.stdout.write("\n\n...Load was unsuccessful: %s\r"%e)
        sys.stdout.flush()

update_progress(len(vocab), "CV_Terms")
sys.stdout.write("\nCV Load has completed\r\n")
sys.stdout.flush()

