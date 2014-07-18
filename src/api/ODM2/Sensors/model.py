# coding: utf-8
from sqlalchemy import Column, DateTime, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
#from ODM2 import modelBase as Base
from ODM2.Core.model import Action, Base


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

    ActionObj = relationship(Action)

class Dataloggerfile(Base):
    __tablename__ = u'DataLoggerFiles'
    __table_args__ = {u'schema': 'ODM2Sensors'}

    DataLoggerFileID = Column(Integer, primary_key=True)
    DeploymentActionID = Column(ForeignKey('ODM2Sensors.DeploymentActions.DeploymentActionID'), nullable=False)
    DataLoggerOutputFileLink = Column(String(255), nullable=False)
    DataLoggerOutputFileDescription = Column(String(500))

    DeploymentActionObj = relationship(Deploymentaction)


class Photo(Base):
    __tablename__ = u'Photos'
    __table_args__ = {u'schema': 'ODM2Sensors'}

    PhotoID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)
    PhotoFileLink = Column(String(255), nullable=False)
    PhotoDescription = Column(String(500))

    ActionObj = relationship(Action)
