# coding: utf-8
from sqlalchemy import BigInteger, Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from ODM2 import modelBase as Base
from ODM2.Core.model import Action, Unit, Method, Samplingfeature, Result, Variable, Base
from ODM2.Provenance.model import Citation



class Extensionproperty(Base):
    __tablename__ = u'ExtensionProperties'
    __table_args__ = {u'schema': u'ODM2'}

    PropertyID = Column(Integer, primary_key=True)
    PropertyName = Column(String(255), nullable=False)
    PropertyDescription = Column(String(500))
    PropertyDataTypeCV = Column(String(255), nullable=False)
    PropertyUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))

    UnitObj = relationship(Unit)


class Actionextensionpropertyvalue(Base):
    __tablename__ = u'ActionExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ActionObj = relationship(Action)
    ExtensionPropertyObj = relationship(Extensionproperty)


class Citationextensionpropertyvalue(Base):
    __tablename__ = u'CitationExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    CitationObj = relationship(Citation)
    ExtensionPropertyObj = relationship(Extensionproperty)


class Methodextensionpropertyvalue(Base):
    __tablename__ = u'MethodExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    MethodObj = relationship(Method)
    ExtensionPropertyObj = relationship(Extensionproperty)


class Resultextensionpropertyvalue(Base):
    __tablename__ = u'ResultExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(Extensionproperty)
    ResultObj = relationship(Result)


class Samplingfeatureextensionpropertyvalue(Base):
    __tablename__ = u'SamplingFeatureExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(Extensionproperty)
    SamplingFeatureObj = relationship(Samplingfeature)


class Variableextensionpropertyvalue(Base):
    __tablename__ = u'VariableExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(Extensionproperty)
    VariableObj = relationship(Variable)


