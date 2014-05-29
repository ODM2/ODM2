# coding: utf-8
from sqlalchemy import Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mssql.base import BIT
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


class Person(Base):
    __tablename__ = u'People'
    __table_args__ = {u'schema': u'ODM2Core'}

    PersonID = Column(Integer, primary_key=True)
    PersonFirstName = Column(String(255), nullable=False)
    PersonMiddleName = Column(String(255))
    PersonLastName = Column(String(255), nullable=False)


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


class Equipment(Base):
    __tablename__ = u'Equipment'
    __table_args__ = {u'schema': 'ODM2Equipment'}

    EquipmentID = Column(Integer, primary_key=True)
    EquipmentCode = Column(String(50), nullable=False)
    EquipmentName = Column(String(255), nullable=False)
    EquipmentTypeCV = Column(String(255), nullable=False)
    ModelID = Column(ForeignKey('ODM2Equipment.EquipmentModels.ModelID'), nullable=False)
    EquipmentSerialNumber = Column(String(50), nullable=False)
    EquipmentInventoryNumber = Column(String(50))
    EquipmentOwnerID = Column(ForeignKey('ODM2Core.People.PersonID'), nullable=False)
    EquipmentVendorID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'), nullable=False)
    EquipmentPurchaseDate = Column(DateTime, nullable=False)
    EquipmentPurchaseOrderNumber = Column(String(50))
    EquipmentPhotoFileLink = Column(String(255))
    EquipmentDescription = Column(String(500))
    ParentEquipmentID = Column(ForeignKey('ODM2Equipment.Equipment.EquipmentID'))

    Person = relationship(u'Person')
    Organization = relationship(u'Organization')
    EquipmentModel = relationship(u'Equipmentmodel')
    parent = relationship(u'Equipment', remote_side=[EquipmentID])


class Equipmentaction(Base):
    __tablename__ = u'EquipmentActions'
    __table_args__ = {u'schema': 'ODM2Equipment'}

    BridgeID = Column(Integer, primary_key=True)
    EquipmentID = Column(ForeignKey('ODM2Equipment.Equipment.EquipmentID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)

    Action = relationship(u'Action')
    Equipment = relationship(u'Equipment')


class Equipmentmodel(Base):
    __tablename__ = u'EquipmentModels'
    __table_args__ = {u'schema': u'ODM2Equipment'}

    ModelID = Column(Integer, primary_key=True)
    ModelManufacturerID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'), nullable=False)
    ModelPartNumber = Column(String(50))
    ModelName = Column(String(255), nullable=False)
    ModelDescription = Column(String(500))
    ModelSpecificationsFileLink = Column(String(255))
    ModelLink = Column(String(255))
    IsInstrument = Column(BIT, nullable=False)

    Organization = relationship(u'Organization')


class Instrumentoutputvariable(Base):
    __tablename__ = u'InstrumentOutputVariables'
    __table_args__ = {u'schema': 'ODM2Equipment'}

    InstrumentOutputVariableID = Column(Integer, primary_key=True)
    ModelID = Column(ForeignKey('ODM2Equipment.EquipmentModels.ModelID'), nullable=False)
    VariableID = Column(ForeignKey('ODM2Core.Variables.VariableID'), nullable=False)
    InstrumentMethodID = Column(ForeignKey('ODM2Core.Methods.MethodID'), nullable=False)
    InstrumentResolution = Column(String(255))
    InstrumentAccuracy = Column(String(255))
    InstrumentRawOutputUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)

    Method = relationship(u'Method')
    Unit = relationship(u'Unit')
    EquipmentModel = relationship(u'Equipmentmodel')
    Variable = relationship(u'Variable')
