from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys
import urllib as request
import xml.etree.ElementTree as ET




# ################################################################################
# CV  Objects
# ################################################################################
from sqlalchemy import Column,  String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata


class CVActionType(Base):
    __tablename__ = 'cv_actiontype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))

    def __repr__(self):
        return "<CVActionType('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVAggregationStatistic(Base):
    __tablename__ = 'cv_aggregationstatistic'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CVAggregationStatisticsType('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVAnnotationType(Base):
    __tablename__ = 'cv_annotationtype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CVAnnotationType('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVCensorCode(Base):
    __tablename__ = 'cv_censorcode'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CVActionType('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVDatasetType(Base):
    __tablename__ = 'cv_datasettypecv'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVDirectiveType(Base):
    __tablename__ = 'cv_directivetype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVElevationDatum(Base):
    __tablename__ = 'cv_elevationdatum'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVEquipmentType(Base):
    __tablename__ = 'cv_equipmenttype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVMethodType(Base):
    __tablename__ = 'cv_methodtype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVOrganizationType(Base):
    __tablename__ = 'cv_organizationtype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVPropertyDataType(Base):
    __tablename__ = 'cv_propertydatatype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(100))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVQualityCode(Base):
     __tablename__ = 'cv_qualitycode'
     __table_args__ = {u'schema': 'odm2'}

     term = Column(String(255), nullable=False)
     name = Column(String(255), primary_key=True)
     definition = Column(String(1000))
     category = Column(String(255))
     sourcevocabularyuri = Column(String(255))
     def __repr__(self):
         return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVResultType(Base):
    __tablename__ = 'cv_resulttype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVSampledMedium(Base):
    __tablename__ = 'cv_sampledmedium'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVSamplingFeatureGeoType(Base):
    __tablename__ = 'cv_samplingfeaturegeotype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVSamplingFeatureType(Base):
    __tablename__ = 'cv_samplingfeaturetype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVSpatialOffsetType(Base):
    __tablename__ = 'cv_spatialoffsettype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVSpeciation(Base):
    __tablename__ = 'cv_speciation'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVSpecimenMedium(Base):
    __tablename__ = 'cv_specimenmedium'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVSpecimenType(Base):
    __tablename__ = 'cv_specimentype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVSiteType(Base):
    __tablename__ = 'cv_sitetype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVReferenceMaterialMedium(Base):
    __tablename__ = 'cv_referencematerialmedium'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVStatus(Base):
    __tablename__ = 'cv_status'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVTaxonomicClassifierType(Base):
    __tablename__ = 'cv_taxonomicclassifiertype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVUnitsType(Base):
    __tablename__ = 'cv_unitstype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVVariablename(Base):
    __tablename__ = 'cv_variablename'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)


class CVVariableType(Base):
    __tablename__ = 'cv_variabletype'
    __table_args__ = {u'schema': 'odm2'}

    term = Column(String(255), nullable=False)
    name = Column(String(255), primary_key=True)
    definition = Column(String(1000))
    category = Column(String(255))
    sourcevocabularyuri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.term, self.name, self.definition, self.category)





if len(sys.argv)<2:
    print ("Error, must contain a connection string")
else:


    #conn_string = {engine}+{driver}://{user}:{pass}@{address}/{db}
    #conn_string = "mysql+pymysql://ODM:odm@localhost/odm2"
    conn_string = sys.argv[1]
    engine = create_engine(conn_string, encoding='utf-8')
    session = sessionmaker(bind=engine)()
    print ("Loading CVs using connection string: %s" % conn_string)


    vocab= {"actiontype": CVActionType,
            "qualitycode": CVQualityCode,
            "samplingfeaturegeotype": CVSamplingFeatureGeoType,
            "elevationdatum": CVElevationDatum,
            "resulttype": CVResultType,
            "sampledmedium": CVSampledMedium,
            "speciation": CVSpeciation,
            "aggregationstatistic": CVAggregationStatistic,
            "methodtype": CVMethodType,
            "taxonomicclassifiertype": CVTaxonomicClassifierType,
            "sitetype": CVSiteType,
            "censorcode": CVCensorCode,
            "directivetype": CVDirectiveType,
            "datasettype":CVDatasetType,
            "organizationtype": CVOrganizationType,
            "status": CVStatus,
            "annotationtype": CVAnnotationType,
            "samplingfeaturetype": CVSamplingFeatureType,
            "equipmenttype": CVEquipmentType,
            "specimenmedium": CVSpecimenMedium,
            "spatialoffsettype": CVSpatialOffsetType,
            "referencematerialmedium": CVReferenceMaterialMedium,
            "specimentype": CVSpecimenType,
            "variabletype": CVVariableType,
            "variablename": CVVariablename,
            "propertydatatype": CVPropertyDataType}

    url = "http://vocabulary.odm2.org/api/v1/%s/?format=skos"

    #XML encodings
    dc = "{http://purl.org/dc/elements/1.1/}%s"
    rdf = "{http://www.w3.org/1999/02/22-rdf-syntax-ns#}%s"
    skos = "{http://www.w3.org/2004/02/skos/core#}%s"
    odm2 = "{http://vocabulary.odm2.org/ODM2/ODM2terms/}%s"



    for key, value in vocab.iteritems():
        print ("\tLoading %s" % key)
        try:


            data = request.urlopen(url % key).read()
            root = ET.fromstring(data)
            CVObject = value
            objs = []
            for voc in root.findall(rdf %"Description"):
                try:
                    obj = CVObject()
                    obj.term = voc.attrib[rdf%"about"].split('/')[-1]
                    obj.name = voc.find(skos%"prefLabel").text
                    obj.definition = voc.find(skos%"definition").text
                    obj.category = category = voc.find(odm2%"category").text if voc.find(odm2 % "category") is not None else None
                    obj.sourcevocabularyuri = voc.attrib[rdf%"about"]
                    objs.append(obj)


                except:
                    pass

            session.add_all(objs)
            session.commit()
        except Exception as e:
            session.rollback()
            print ("\t...Load was unsuccesful: \n%s" % e)


    print ("CV Load has completed")

    #session.commit()
