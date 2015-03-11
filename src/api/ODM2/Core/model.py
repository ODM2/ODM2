# coding: utf-8
from sqlalchemy import BigInteger, Column, Date, DateTime, Float, ForeignKey, Integer, String, Boolean, func
from ODM2.apiCustomType import Geometry


from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()






class Person(Base):
    __tablename__ = u'People'
    __table_args__ = {u'schema': u'ODM2'}

    PersonID = Column(Integer, primary_key=True)
    PersonFirstName = Column(String(255), nullable=False)
    PersonMiddleName = Column(String(255))
    PersonLastName = Column(String(255), nullable=False)


class Organization(Base):
    __tablename__ = u'Organizations'
    __table_args__ = {u'schema': u'ODM2'}

    OrganizationID = Column(Integer, primary_key=True)
    OrganizationTypeCV = Column(String(255), nullable=False)
    OrganizationCode = Column(String(50), nullable=False)
    OrganizationName = Column(String(255), nullable=False)
    OrganizationDescription = Column(String(500))
    OrganizationLink = Column(String(255))
    ParentOrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'))

    parent = relationship(u'Organization', remote_side=[OrganizationID])

class Affiliation(Base):
    __tablename__ = 'Affiliations'
    __table_args__ = {u'schema': 'ODM2'}

    AffiliationID = Column(Integer, primary_key=True)
    PersonID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    OrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'))
    IsPrimaryOrganizationContact = Column(Boolean)
    AffiliationStartDate = Column(Date, nullable=False)
    AffiliationEndDate = Column(Date)
    PrimaryPhone = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'))
    PrimaryEmail = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    PrimaryAddress = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    PersonLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))


    OrganizationObj = relationship(Organization)
    PersonObj = relationship(Person)


class Method(Base):
    __tablename__ = 'Methods'
    __table_args__ = {u'schema': 'ODM2'}

    MethodID = Column(Integer, primary_key=True)
    MethodTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    MethodLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    OrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'))

    OrganizationObj = relationship(Organization)


class Action(Base):
    __tablename__ = u'Actions'
    __table_args__ = {u'schema': u'ODM2'}

    ActionID = Column(Integer, primary_key=True)
    ActionTypeCV = Column(String(255), nullable=False)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    BeginDateTimeUTCOffset = Column(Integer, nullable=False)
    EndDateTime = Column(DateTime)
    EndDateTimeUTCOffset = Column(Integer)
    ActionDescription = Column(String(500))
    ActionFileLink = Column(String(255))


    MethodObj = relationship(Method)


    def __repr__(self):
		return "<Action('%s', '%s', '%s', '%s')>" % (self.ActionID, self.ActionTypeCV, self.BeginDateTime, self.ActionDescription)


class Actionby(Base):
    __tablename__ = u'ActionBy'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    AffiliationID = Column(ForeignKey('ODM2.Affiliations.AffiliationID'), nullable=False)
    IsActionLead = Column(Boolean, nullable=False)
    RoleDescription = Column(String(500))

    ActionObj = relationship(Action)
    AffiliationObj = relationship(Affiliation)


class Samplingfeature(Base):
    __tablename__ = u'SamplingFeatures'
    __table_args__ = {u'schema': u'ODM2'}

    SamplingFeatureID = Column(Integer, primary_key=True)
    SamplingFeatureTypeCV = Column(String(255), nullable=False)
    SamplingFeatureCode = Column(String(50), nullable=False)
    SamplingFeatureName = Column(String(255))
    SamplingFeatureDescription = Column(String(500))
    SamplingFeatureGeotypeCV = Column(String(255))
    Elevation_m = Column(Float(53))
    ElevationDatumCV = Column(String(255))
    FeatureGeometry = Column(Geometry)

    def __repr__(self):
		return "<SamplingFeature('%s', '%s', '%s', '%s')>" % (self.SamplingFeatureCode, self.SamplingFeatureName, self.SamplingFeatureDescription, self.FeatureGeometry)

class Featureaction(Base):
    __tablename__ = u'FeatureActions'
    __table_args__ = {u'schema': u'ODM2'}

    FeatureActionID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)

    ActionObj = relationship(Action)
    SamplingFeatureObj = relationship(Samplingfeature)



    def __repr__(self):
		return "<FeatureAction('%s', '%s', '%s', )>" % (self.FeatureActionID, self.SamplingFeatureID, self.ActionID)


class Dataset(Base):
    __tablename__ = u'DataSets'
    __table_args__ = {u'schema': 'ODM2'}

    DataSetID = Column(Integer, primary_key=True)

    # This has been changed to String to support multiple database uuid types

    DataSetUUID = Column(String(255),nullable=False)
    DataSetTypeCV = Column(String(255), nullable=False)
    DataSetCode = Column(String(50), nullable=False)
    DataSetTitle = Column(String(255), nullable=False)
    DataSetAbstract = Column(String(500), nullable=False)

class Processinglevel(Base):
    __tablename__ = 'ProcessingLevels'
    __table_args__ = {u'schema': 'ODM2'}

    ProcessingLevelID = Column(Integer, primary_key=True)
    ProcessingLevelCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    Definition = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    Explanation = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))

class Relatedaction(Base):
    __tablename__ = 'RelatedActions'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    RelationshipTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    RelatedActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)

    ActionObj = relationship(Action, primaryjoin='Relatedaction.ActionID == Action.ActionID')
    RelatedActionObj = relationship( Action, primaryjoin='Relatedaction.RelatedActionID == Action.ActionID')


class Taxonomicclassifier(Base):
    __tablename__ = 'TaxonomicClassifiers'
    __table_args__ = {u'schema': 'ODM2'}

    TaxonomicClassifierID = Column(Integer, primary_key=True)
    TaxonomicClassifierTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    TaxonomicClassifierName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    TaxonomicClassifierCommonName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    TaxonomicClassifierDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    ParentTaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'))

    parent = relationship(u'Taxonomicclassifier', remote_side=[TaxonomicClassifierID])

class Unit(Base):
    __tablename__ = 'Units'
    __table_args__ = {u'schema': 'ODM2'}

    UnitsID = Column(Integer, primary_key=True)
    '''
    UnitsTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    UnitsAbbreviation = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    UnitsName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    '''
    UnitsTypeCV = Column(String(255), nullable=False)
    UnitsAbbreviation = Column(String(255), nullable=False)
    UnitsName = Column(String, nullable=False)

class Variable(Base):
    __tablename__ = 'Variables'
    __table_args__ = {u'schema': 'ODM2'}

    VariableID = Column(Integer, primary_key=True)
    VariableTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableNameCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableDefinition = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    SpeciationCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    NoDataValue = Column(Float(53), nullable=False)

    def __repr__(self):
		return "<Variable('%s', '%s', '%s')>" % (self.VariableID, self.VariableCode, self.VariableNameCV)

class Resulttypecv(Base):
    __tablename__ = u'ResultTypeCV'
    __table_args__ = {u'schema': u'ODM2'}

    ResultTypeCV = Column(String(255), primary_key=True)
    ResultTypeCategory = Column(String(255), nullable=False)
    DataType = Column(String(255), nullable=False)
    ResultTypeDefinition = Column(String(500), nullable=False)
    FixedDimensions = Column(String(255), nullable=False)
    VaryingDimensions = Column(String(255), nullable=False)
    SpaceMeasurementFramework = Column(String(255), nullable=False)
    TimeMeasurementFramework = Column(String(255), nullable=False)
    VariableMeasurementFramework = Column(String(255), nullable=False)

class Results(Base):
    __tablename__ = u'Results'
    __table_args__ = {u'schema': u'ODM2'}

    ResultID = Column(BigInteger, primary_key=True)

    # This has been changed to String to support multiple database uuid types
    # ResultUUID = Column(UNIQUEIDENTIFIER, nullable=False)
    ResultUUID = Column(String(255),nullable=False)

    FeatureActionID = Column(ForeignKey('ODM2.FeatureActions.FeatureActionID'), nullable=False)
    ResultTypeCV = Column(ForeignKey('ODM2.ResultTypeCV.ResultTypeCV'), nullable=False)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'))
    ProcessingLevelID = Column(ForeignKey('ODM2.ProcessingLevels.ProcessingLevelID'), nullable=False)
    ResultDateTime = Column(DateTime)
    ResultDateTimeUTCOffset = Column(BigInteger)
    ValidDateTime = Column(DateTime)
    ValidDateTimeUTCOffset = Column(BigInteger)
    StatusCV = Column(String(255))
    SampledMediumCV = Column(String(255), nullable=False)
    ValueCount = Column(Integer, nullable=False)

    #IntendedObservationSpacing = Column(String(255))

    FeatureActionObj = relationship(Featureaction)
    ProcessingLevelObj = relationship(Processinglevel)
    ResultTypeCVObj = relationship(Resulttypecv)
    TaxonomicClassifierObj = relationship(Taxonomicclassifier)
    UnitObj = relationship(Unit)
    VariableObj = relationship(Variable)


    def __repr__(self):
		return "<Result('%s', '%s', '%s', '%s')>" % (self.ResultID, self.ResultTypeCV, self.ProcessingLevelID, self.ValueCount)


class Datasetsresult(Base):
    __tablename__ = u'DataSetsResults'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    DataSetID = Column(ForeignKey('ODM2.DataSets.DataSetID'), nullable=False)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)

    DataSetObj = relationship(Dataset)
    ResultObj = relationship(Results)

