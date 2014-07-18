# coding: utf-8
from sqlalchemy import Column, Date, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Action(Base):
    __tablename__ = 'Actions'
    __table_args__ = {u'schema': 'ODM2Core'}

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


class Dataset(Base):
    __tablename__ = 'DataSets'
    __table_args__ = {u'schema': 'ODM2Core'}

    DataSetID = Column(Integer, primary_key=True)
    DataSetUUID = Column(String(255), nullable=False)
    DataSetTypeCV = Column(String(255), nullable=False)
    DataSetCode = Column(String(50), nullable=False)
    DataSetTitle = Column(String(255), nullable=False)
    DataSetAbstract = Column(String(500), nullable=False)


class Method(Base):
    __tablename__ = 'Methods'
    __table_args__ = {u'schema': 'ODM2Core'}

    MethodID = Column(Integer, primary_key=True)
    MethodTypeCV = Column(String(255), nullable=False)
    MethodCode = Column(String(50), nullable=False)
    MethodName = Column(String(255), nullable=False)
    MethodDescription = Column(String(500))
    MethodLink = Column(String(255))
    OrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))

    Organization = relationship(u'Organization')


class Organization(Base):
    __tablename__ = 'Organizations'
    __table_args__ = {u'schema': 'ODM2Core'}

    OrganizationID = Column(Integer, primary_key=True)
    OrganizationTypeCV = Column(String(255), nullable=False)
    OrganizationCode = Column(String(50), nullable=False)
    OrganizationName = Column(String(255), nullable=False)
    OrganizationDescription = Column(String(500))
    OrganizationLink = Column(String(255))
    ParentOrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))

    parent = relationship(u'Organization', remote_side=[OrganizationID])


class Unit(Base):
    __tablename__ = 'Units'
    __table_args__ = {u'schema': 'ODM2Core'}

    UnitsID = Column(Integer, primary_key=True)
    UnitsTypeCV = Column(String(255), nullable=False)
    UnitsAbbreviation = Column(String(50), nullable=False)
    UnitsName = Column(String(255), nullable=False)


class Model(Base):
    __tablename__ = 'Models'
    __table_args__ = {u'schema': 'ODM2Simulation'}

    ModelID = Column(Integer, primary_key=True)
    ModelCode = Column(String(255), nullable=False)
    ModelName = Column(String(255), nullable=False)
    ModelDescription = Column(String(500))


class Relatedmodel(Base):
    __tablename__ = 'RelatedModels'
    __table_args__ = {u'schema': 'ODM2Simulation'}

    RelationID = Column(Integer, primary_key=True)
    ModelID = Column(ForeignKey('ODM2Simulation.Models.ModelID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedModelID = Column(ForeignKey('ODM2Simulation.Models.ModelID'), nullable=False)

    Model = relationship(u'Model', primaryjoin='Relatedmodel.ModelID == Model.ModelID')
    Model1 = relationship(u'Model', primaryjoin='Relatedmodel.RelatedModelID == Model.ModelID')


class Simulation(Base):
    __tablename__ = 'Simulations'
    __table_args__ = {u'schema': 'ODM2Simulation'}

    SimulationID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)
    SimulationName = Column(String(255), nullable=False)
    SimulationDescription = Column(String(500))
    SimulationStartDateTime = Column(Date, nullable=False)
    SimulationStartDateTimeUTCOffset = Column(Integer, nullable=False)
    SimulationEndDateTime = Column(Date, nullable=False)
    SimulationEndDateTimeUTCOffset = Column(Integer, nullable=False)
    TimeStepValue = Column(Float(53), nullable=False)
    TimeStepUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    InputDataSetID = Column(ForeignKey('ODM2Core.DataSets.DataSetID'))
    OutputDataSetID = Column(Integer)
    ModelID = Column(ForeignKey('ODM2Simulation.Models.ModelID'), nullable=False)

    Action = relationship(u'Action')
    DataSet = relationship(u'Dataset')
    Model = relationship(u'Model')
    Unit = relationship(u'Unit')
