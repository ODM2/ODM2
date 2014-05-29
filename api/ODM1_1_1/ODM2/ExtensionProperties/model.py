# coding: utf-8
from sqlalchemy import BigInteger, Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mssql.base import UNIQUEIDENTIFIER
from sqlalchemy.types import NullType
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Action(Base):
    __tablename__ = u'Actions'
    __table_args__ = {u'schema': u'ODM2Core'}

    ActionID = Column(Integer, primary_key=True)
    ActionTypeCV = Column(String(255), nullable=False)
    MethodID = Column(ForeignKey('ODM2Core.Methods.MethodID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    BeginDateTimeUTCOffset = Column(Integer, nullable=False)
    EndDateTime = Column(DateTime)
    EndDateTimeUTCOffset = Column(Integer)
    ActionDescription = Column(String(500))
    ActionFileLink = Column(String(255))

    Method = relationship(u'Method')


class Featureaction(Base):
    __tablename__ = u'FeatureActions'
    __table_args__ = {u'schema': u'ODM2Core'}

    FeatureActionID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)

    Action = relationship(u'Action')
    SamplingFeature = relationship(u'Samplingfeature')


class Method(Base):
    __tablename__ = u'Methods'
    __table_args__ = {u'schema': u'ODM2Core'}

    MethodID = Column(Integer, primary_key=True)
    MethodTypeCV = Column(String(255), nullable=False)
    MethodCode = Column(String(50), nullable=False)
    MethodName = Column(String(255), nullable=False)
    MethodDescription = Column(String(500))
    MethodLink = Column(String(255))
    OrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))

    Organization = relationship(u'Organization')


class Organization(Base):
    __tablename__ = u'Organizations'
    __table_args__ = {u'schema': u'ODM2Core'}

    OrganizationID = Column(Integer, primary_key=True)
    OrganizationTypeCV = Column(String(255), nullable=False)
    OrganizationCode = Column(String(50), nullable=False)
    OrganizationName = Column(String(255), nullable=False)
    OrganizationDescription = Column(String(500))
    OrganizationLink = Column(String(255))
    ParentOrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))

    parent = relationship(u'Organization', remote_side=[OrganizationID])


class Processinglevel(Base):
    __tablename__ = u'ProcessingLevels'
    __table_args__ = {u'schema': u'ODM2Core'}

    ProcessingLevelID = Column(Integer, primary_key=True)
    ProcessingLevelCode = Column(String(50), nullable=False)
    Definition = Column(String(500))
    Explanation = Column(String(500))


class Result(Base):
    __tablename__ = u'Results'
    __table_args__ = {u'schema': u'ODM2Core'}

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
    StatusCV = Column(String(255))
    SampledMediumCV = Column(String(255), nullable=False)
    ValueCount = Column(Integer, nullable=False)
    IntendedObservationSpacing = Column(String(255))

    FeatureAction = relationship(u'Featureaction')
    ProcessingLevel = relationship(u'Processinglevel')
    ResultTypeCV1 = relationship(u'Resulttypecv')
    TaxonomicClassifier = relationship(u'Taxonomicclassifier')
    Unit = relationship(u'Unit')
    Variable = relationship(u'Variable')


class Samplingfeature(Base):
    __tablename__ = u'SamplingFeatures'
    __table_args__ = {u'schema': u'ODM2Core'}

    SamplingFeatureID = Column(Integer, primary_key=True)
    SamplingFeatureTypeCV = Column(String(255), nullable=False)
    SamplingFeatureCode = Column(String(50), nullable=False)
    SamplingFeatureName = Column(String(255))
    SamplingFeatureDescription = Column(String(500))
    SamplingFeatureGeotypeCV = Column(String(255))
    Elevation_m = Column(Float(53))
    ElevationDatumCV = Column(String(255))
    FeatureGeometry = Column(NullType)


class Taxonomicclassifier(Base):
    __tablename__ = u'TaxonomicClassifiers'
    __table_args__ = {u'schema': u'ODM2Core'}

    TaxonomicClassifierID = Column(Integer, primary_key=True)
    TaxonomicClassifierTypeCV = Column(String(255), nullable=False)
    TaxonomicClassifierName = Column(String(255), nullable=False)
    TaxonomicClassifierCommonName = Column(String(255))
    TaxonomicClassifierDescription = Column(String(500))
    ParentTaxonomicClassifierID = Column(ForeignKey('ODM2Core.TaxonomicClassifiers.TaxonomicClassifierID'))

    parent = relationship(u'Taxonomicclassifier', remote_side=[TaxonomicClassifierID])


class Unit(Base):
    __tablename__ = u'Units'
    __table_args__ = {u'schema': u'ODM2Core'}

    UnitsID = Column(Integer, primary_key=True)
    UnitsTypeCV = Column(String(255), nullable=False)
    UnitsAbbreviation = Column(String(50), nullable=False)
    UnitsName = Column(String(255), nullable=False)


class Variable(Base):
    __tablename__ = u'Variables'
    __table_args__ = {u'schema': u'ODM2Core'}

    VariableID = Column(Integer, primary_key=True)
    VariableTypeCV = Column(String(255), nullable=False)
    VariableCode = Column(String(50), nullable=False)
    VariableNameCV = Column(String(255), nullable=False)
    VariableDefinition = Column(String(500))
    SpeciationCV = Column(String(255))
    NoDataValue = Column(Float(53), nullable=False)


class Actionextensionpropertyvalue(Base):
    __tablename__ = u'ActionExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2ExtensionProperties'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2ExtensionProperties.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    Action = relationship(u'Action')
    ExtensionProperty = relationship(u'Extensionproperty')


class Citationextensionpropertyvalue(Base):
    __tablename__ = u'CitationExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2ExtensionProperties'}

    BridgeID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2Provenance.Citations.CitationID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2ExtensionProperties.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    Citation = relationship(u'Citation')
    ExtensionProperty = relationship(u'Extensionproperty')


class Extensionproperty(Base):
    __tablename__ = u'ExtensionProperties'
    __table_args__ = {u'schema': u'ODM2ExtensionProperties'}

    PropertyID = Column(Integer, primary_key=True)
    PropertyName = Column(String(255), nullable=False)
    PropertyDescription = Column(String(500))
    PropertyDataTypeCV = Column(String(255), nullable=False)
    PropertyUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))

    Unit = relationship(u'Unit')


class Methodextensionpropertyvalue(Base):
    __tablename__ = u'MethodExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2ExtensionProperties'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2Core.Methods.MethodID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2ExtensionProperties.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    Method = relationship(u'Method')
    ExtensionProperty = relationship(u'Extensionproperty')


class Resultextensionpropertyvalue(Base):
    __tablename__ = u'ResultExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2ExtensionProperties'}

    BridgeID = Column(Integer, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2ExtensionProperties.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionProperty = relationship(u'Extensionproperty')
    Result = relationship(u'Result')


class Samplingfeatureextensionpropertyvalue(Base):
    __tablename__ = u'SamplingFeatureExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2ExtensionProperties'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2ExtensionProperties.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionProperty = relationship(u'Extensionproperty')
    SamplingFeature = relationship(u'Samplingfeature')


class Variableextensionpropertyvalue(Base):
    __tablename__ = u'VariableExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2ExtensionProperties'}

    BridgeID = Column(Integer, primary_key=True)
    VariableID = Column(ForeignKey('ODM2Core.Variables.VariableID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2ExtensionProperties.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionProperty = relationship(u'Extensionproperty')
    Variable = relationship(u'Variable')


class Citation(Base):
    __tablename__ = u'Citations'
    __table_args__ = {u'schema': u'ODM2Provenance'}

    CitationID = Column(Integer, primary_key=True)
    Title = Column(String(255), nullable=False)
    Publisher = Column(String(255), nullable=False)
    PublicationYear = Column(Integer, nullable=False)
    CitationLink = Column(String(255))


class Resulttypecv(Base):
    __tablename__ = u'ResultTypeCV'
    __table_args__ = {u'schema': u'ODM2Results'}

    ResultTypeCV = Column(String(255), primary_key=True)
    ResultTypeCategory = Column(String(255), nullable=False)
    DataType = Column(String(255), nullable=False)
    ResultTypeDefinition = Column(String(500), nullable=False)
    FixedDimensions = Column(String(255), nullable=False)
    VaryingDimensions = Column(String(255), nullable=False)
    SpaceMeasurementFramework = Column(String(255), nullable=False)
    TimeMeasurementFramework = Column(String(255), nullable=False)
    VariableMeasurementFramework = Column(String(255), nullable=False)
