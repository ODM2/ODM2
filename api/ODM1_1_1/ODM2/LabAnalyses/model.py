# coding: utf-8
from sqlalchemy import Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
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


class Specimenbatchpostion(Featureaction):
    __tablename__ = u'SpecimenBatchPostions'
    __table_args__ = {u'schema': 'ODM2LabAnalyses'}

    FeatureActionID = Column(ForeignKey('ODM2Core.FeatureActions.FeatureActionID'), primary_key=True)
    BatchPositionNumber = Column(Integer, nullable=False)
    BatchPositionLabel = Column(String(255))


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


class Actiondirective(Base):
    __tablename__ = u'ActionDirectives'
    __table_args__ = {u'schema': 'ODM2LabAnalyses'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)
    DirectiveID = Column(ForeignKey('ODM2LabAnalyses.Directives.DirectiveID'), nullable=False)

    Action = relationship(u'Action')
    Directive = relationship(u'Directive')


class Directive(Base):
    __tablename__ = u'Directives'
    __table_args__ = {u'schema': u'ODM2LabAnalyses'}

    DirectiveID = Column(Integer, primary_key=True)
    DirectiveTypeCV = Column(String(255), nullable=False)
    DirectiveDescription = Column(String(500), nullable=False)
