# coding: utf-8
from sqlalchemy import Column, DateTime, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
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


class Sitevisitaction(Action):
    __tablename__ = u'SiteVisitActions'
    __table_args__ = {u'schema': 'ODM2Sensors'}

    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), primary_key=True)
    SiteVisitID = Column(Integer, nullable=False)
    SiteVisitEnvironmentalObservations = Column(String(500), nullable=False)


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


class Dataloggerfile(Base):
    __tablename__ = u'DataLoggerFiles'
    __table_args__ = {u'schema': 'ODM2Sensors'}

    DataLoggerFileID = Column(Integer, primary_key=True)
    DeploymentActionID = Column(ForeignKey('ODM2Sensors.DeploymentActions.DeploymentActionID'), nullable=False)
    DataLoggerOutputFileLink = Column(String(255), nullable=False)
    DataLoggerOutputFileDescription = Column(String(500))

    DeploymentAction = relationship(u'Deploymentaction')


class Deploymentaction(Base):
    __tablename__ = u'DeploymentActions'
    __table_args__ = {u'schema': u'ODM2Sensors'}

    DeploymentActionID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)
    DeploymentTypeCV = Column(String(255), nullable=False)
    DeploymentDescription = Column(String(500))
    ConfigurationActionID = Column(Integer, nullable=False)
    CalibrationActionID = Column(Integer, nullable=False)
    SpatialOffsetID = Column(Integer)
    DeploymentSchematicLink = Column(String(255))

    Action = relationship(u'Action')


class Photo(Base):
    __tablename__ = u'Photos'
    __table_args__ = {u'schema': 'ODM2Sensors'}

    PhotoID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)
    PhotoFileLink = Column(String(255), nullable=False)
    PhotoDescription = Column(String(500))

    Action = relationship(u'Action')
