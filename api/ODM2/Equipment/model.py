# coding: utf-8
from sqlalchemy import Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mssql.base import BIT
#from ODM2 import modelBase as Base

from ODM2.Core.model import Person, Organization, Action, Method, Unit, Variable, Base


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

    PersonObj = relationship(Person)
    OrganizationObj = relationship(Organization)
    EquipmentModelObj = relationship(Equipmentmodel)
    parent = relationship(u'Equipment', remote_side=[EquipmentID])


class Equipmentaction(Base):
    __tablename__ = u'EquipmentActions'
    __table_args__ = {u'schema': 'ODM2Equipment'}

    BridgeID = Column(Integer, primary_key=True)
    EquipmentID = Column(ForeignKey('ODM2Equipment.Equipment.EquipmentID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)

    ActionObj = relationship(Action)
    EquipmentObj = relationship(Equipment)


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

    OrganizationObj = relationship(Organization)


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

    MethodObj = relationship(Method)
    OutputUnitObj = relationship(Unit)
    EquipmentModelObj = relationship(Equipmentmodel)
    VariableObj = relationship(Variable)
