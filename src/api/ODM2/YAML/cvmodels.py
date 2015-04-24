from sqlalchemy import BigInteger, Column, Date, DateTime, Float, ForeignKey, Integer, String, Boolean, func, Table
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.dialects.mssql.base import BIT

#from apiCustomType import Geometry

Base = declarative_base()
metadata = Base.metadata



# ################################################################################
# CV
# ################################################################################

class CVTerms(Base):
    __tablename__ = u'CVTerms'
    __table_args__ = {u'schema': 'ODM2'}

    TermID = Column(Integer, primary_key=True, nullable=False)
    Term = Column(String(255), nullable=False)
    Definition = Column(String(500))
    ODMVocabulary = Column(String(255), nullable=False)
    SourceVocabulary = Column(String(255))

class CVActionType(Base):
    __tablename__ = 'CV_ActionType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVAggregationStatistic(Base):
    __tablename__ = 'CV_AggregationStatistic'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVAnnotationType(Base):
    __tablename__ = 'CV_AnnotationType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVCensorCode(Base):
    __tablename__ = 'CV_CensorCode'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVDatasetType(Base):
    __tablename__ = 'CV_DatasetTypeCV'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVDirectiveType(Base):
    __tablename__ = 'CV_DirectiveType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVElevationDatum(Base):
    __tablename__ = 'CV_ElevationDatum'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVEquipmentType(Base):
    __tablename__ = 'CV_EquipmentType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVMethodType(Base):
    __tablename__ = 'CV_MethodType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVOrganizationType(Base):
    __tablename__ = 'CV_OrganizationType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVPropertyDataType(Base):
    __tablename__ = 'CV_PropertyDataType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVQualityCode(Base):
    __tablename__ = 'CV_QualityCode'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVResultType(Base):
    __tablename__ = 'CV_ResultType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSampledMedium(Base):
    __tablename__ = 'CV_SampledMedium'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSamplingFeatureGeoType(Base):
    __tablename__ = 'CV_SamplingFeatureGeoType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSamplingFeatureType(Base):
    __tablename__ = 'CV_SamplingFeatureType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSpatialOffsetType(Base):
    __tablename__ = 'CV_SpatialOffsetType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSpeciation(Base):
    __tablename__ = 'CV_Speciation'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSpecimenMedium(Base):
    __tablename__ = 'CV_SpecimenMedium'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSpecimenType(Base):
    __tablename__ = 'CV_SpecimenType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))

class CVReferenceMaterialMedium(Base):
    __tablename__ = 'CV_ReferenceMaterialMedium'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))

class CVSiteType(Base):
    __tablename__ = 'CV_SiteType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVStatus(Base):
    __tablename__ = 'CV_Status'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVTaxonomicClassifierType(Base):
    __tablename__ = 'CV_TaxonomicClassifierType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVUnitsType(Base):
    __tablename__ = 'CV_UnitsType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVVariableName(Base):
    __tablename__ = 'CV_VariableName'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVVariableType(Base):
    __tablename__ = 'CV_VariableType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


