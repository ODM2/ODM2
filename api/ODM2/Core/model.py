# coding: utf-8
from sqlalchemy import BigInteger, Column, Date, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.dialects.mssql.base import BIT, UNIQUEIDENTIFIER
from sqlalchemy.orm import relationship
from sqlalchemy.sql.sqltypes import NullType
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Actionby(Base):
    __tablename__ = 'ActionBy'
    __table_args__ = {u'schema': 'ODM2Core'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)
    AffiliationID = Column(ForeignKey('ODM2Core.Affiliations.AffiliationID'), nullable=False)
    IsActionLead = Column(BIT, nullable=False)
    RoleDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))

    Action = relationship(u'Action')
    Affiliation = relationship(u'Affiliation')


class Action(Base):
    __tablename__ = 'Actions'
    __table_args__ = {u'schema': 'ODM2Core'}

    ActionID = Column(Integer, primary_key=True)
    ActionTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodID = Column(ForeignKey('ODM2Core.Methods.MethodID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    BeginDateTimeUTCOffset = Column(Integer, nullable=False)
    EndDateTime = Column(DateTime)
    EndDateTimeUTCOffset = Column(Integer)
    ActionDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    ActionFileLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))

    Method = relationship(u'Method')


class Affiliation(Base):
    __tablename__ = 'Affiliations'
    __table_args__ = {u'schema': 'ODM2Core'}

    AffiliationID = Column(Integer, primary_key=True)
    PersonID = Column(ForeignKey('ODM2Core.People.PersonID'), nullable=False)
    OrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))
    IsPrimaryOrganizationContact = Column(BIT)
    AffiliationStartDate = Column(Date, nullable=False)
    AffiliationEndDate = Column(Date)
    PrimaryPhone = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'))
    PrimaryEmail = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    PrimaryAddress = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    PersonLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))

    Organization = relationship(u'Organization')
    Person = relationship(u'Person')


class Dataset(Base):
    __tablename__ = 'DataSets'
    __table_args__ = {u'schema': 'ODM2Core'}

    DataSetID = Column(Integer, primary_key=True)
    DataSetUUID = Column(UNIQUEIDENTIFIER, nullable=False)
    DataSetTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    DataSetCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    DataSetTitle = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    DataSetAbstract = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)


class Datasetsresult(Base):
    __tablename__ = 'DataSetsResults'
    __table_args__ = {u'schema': 'ODM2Core'}

    BridgeID = Column(Integer, primary_key=True)
    DataSetID = Column(ForeignKey('ODM2Core.DataSets.DataSetID'), nullable=False)
    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), nullable=False)

    DataSet = relationship(u'Dataset')
    Result = relationship(u'Result')


class Featureaction(Base):
    __tablename__ = 'FeatureActions'
    __table_args__ = {u'schema': 'ODM2Core'}

    FeatureActionID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)

    Action = relationship(u'Action')
    SamplingFeature = relationship(u'Samplingfeature')


class Method(Base):
    __tablename__ = 'Methods'
    __table_args__ = {u'schema': 'ODM2Core'}

    MethodID = Column(Integer, primary_key=True)
    MethodTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    MethodLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    OrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))

    Organization = relationship(u'Organization')


class Organization(Base):
    __tablename__ = 'Organizations'
    __table_args__ = {u'schema': 'ODM2Core'}

    OrganizationID = Column(Integer, primary_key=True)
    OrganizationTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    OrganizationCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    OrganizationName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    OrganizationDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    OrganizationLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    ParentOrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))

    parent = relationship(u'Organization', remote_side=[OrganizationID])


class Person(Base):
    __tablename__ = 'People'
    __table_args__ = {u'schema': 'ODM2Core'}

    PersonID = Column(Integer, primary_key=True)
    PersonFirstName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    PersonMiddleName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    PersonLastName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)


class Processinglevel(Base):
    __tablename__ = 'ProcessingLevels'
    __table_args__ = {u'schema': 'ODM2Core'}

    ProcessingLevelID = Column(Integer, primary_key=True)
    ProcessingLevelCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    Definition = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    Explanation = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))


class Relatedaction(Base):
    __tablename__ = 'RelatedActions'
    __table_args__ = {u'schema': 'ODM2Core'}

    RelationID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)
    RelationshipTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    RelatedActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)

    Action = relationship(u'Action', primaryjoin='Relatedaction.ActionID == Action.ActionID')
    Action1 = relationship(u'Action', primaryjoin='Relatedaction.RelatedActionID == Action.ActionID')


class Result(Base):
    __tablename__ = 'Results'
    __table_args__ = {u'schema': 'ODM2Core'}

    ResultID = Column(BigInteger, primary_key=True)
    ResultUUID = Column(UNIQUEIDENTIFIER, nullable=False)
    FeatureActionID = Column(ForeignKey('ODM2Core.FeatureActions.FeatureActionID'), nullable=False)
    ResultTypeCV = Column(ForeignKey('ODM2Results.ResultTypeCV.ResultTypeCV'), nullable=False)
    VariableID = Column(ForeignKey('ODM2Core.Variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2Core.TaxonomicClassifiers.TaxonomicClassifierID'))
    ProcessingLevelID = Column(ForeignKey('ODM2Core.ProcessingLevels.ProcessingLevelID'), nullable=False)
    ResultDateTime = Column(DateTime)
    ResultDateTimeUTCOffset = Column(BigInteger)
    ValidDateTime = Column(DateTime)
    ValidDateTimeUTCOffset = Column(BigInteger)
    StatusCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    SampledMediumCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    ValueCount = Column(Integer, nullable=False)
    IntendedObservationSpacing = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))

    FeatureAction = relationship(u'Featureaction')
    ProcessingLevel = relationship(u'Processinglevel')
    ResultTypeCV1 = relationship(u'Resulttypecv')
    TaxonomicClassifier = relationship(u'Taxonomicclassifier')
    Unit = relationship(u'Unit')
    Variable = relationship(u'Variable')


class Samplingfeature(Base):
    __tablename__ = 'SamplingFeatures'
    __table_args__ = {u'schema': 'ODM2Core'}

    SamplingFeatureID = Column(Integer, primary_key=True)
    SamplingFeatureTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    SamplingFeatureCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    SamplingFeatureName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    SamplingFeatureDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    SamplingFeatureGeotypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    Elevation_m = Column(Float(53))
    ElevationDatumCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    FeatureGeometry = Column(NullType)


class Taxonomicclassifier(Base):
    __tablename__ = 'TaxonomicClassifiers'
    __table_args__ = {u'schema': 'ODM2Core'}

    TaxonomicClassifierID = Column(Integer, primary_key=True)
    TaxonomicClassifierTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    TaxonomicClassifierName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    TaxonomicClassifierCommonName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    TaxonomicClassifierDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    ParentTaxonomicClassifierID = Column(ForeignKey('ODM2Core.TaxonomicClassifiers.TaxonomicClassifierID'))

    parent = relationship(u'Taxonomicclassifier', remote_side=[TaxonomicClassifierID])


class Unit(Base):
    __tablename__ = 'Units'
    __table_args__ = {u'schema': 'ODM2Core'}

    UnitsID = Column(Integer, primary_key=True)
    UnitsTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    UnitsAbbreviation = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    UnitsName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)


class Variable(Base):
    __tablename__ = 'Variables'
    __table_args__ = {u'schema': 'ODM2Core'}

    VariableID = Column(Integer, primary_key=True)
    VariableTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableNameCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableDefinition = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    SpeciationCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    NoDataValue = Column(Float(53), nullable=False)


class Resulttypecv(Base):
    __tablename__ = 'ResultTypeCV'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), primary_key=True)
    ResultTypeCategory = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    DataType = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    ResultTypeDefinition = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    FixedDimensions = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VaryingDimensions = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    SpaceMeasurementFramework = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    TimeMeasurementFramework = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableMeasurementFramework = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
