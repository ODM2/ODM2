# coding: utf-8
from sqlalchemy import Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
#from ODM2 import modelBase as Base
from ODM2.Core.model import Organization, Samplingfeature, Method, Person, Taxonomicclassifier, Variable, Base
from ODM2.Provenance.model import Citation
from ODM2.DataQuality.model import Referencematerial
from ODM2.SamplingFeatures.model import Spatialreference



class Externalidentifiersystem(Base):
    __tablename__ = u'ExternalIdentifierSystems'
    __table_args__ = {u'schema': u'ODM2'}

    ExternalIdentifierSystemID = Column(Integer, primary_key=True)
    ExternalIdentifierSystemName = Column(String(255), nullable=False)
    IdentifierSystemOrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'), nullable=False)
    ExternalIdentifierSystemDescription = Column(String(500))
    ExternalIdentifierSystemURL = Column(String(255))

    OrganizationObj = relationship(Organization)


class Citationexternalidentifier(Base):
    __tablename__ = u'CitationExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    CitationExternalIdentifer = Column(String(255), nullable=False)
    CitationExternalIdentiferURI = Column(String(255))

    CitationObj = relationship(Citation)
    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)


class Methodexternalidentifier(Base):
    __tablename__ = u'MethodExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    MethodExternalIdentifier = Column(String(255), nullable=False)
    MethodExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    MethodObj = relationship(Method)


class Personexternalidentifier(Base):
    __tablename__ = u'PersonExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    PersonID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    PersonExternalIdentifier = Column(String(255), nullable=False)
    PersonExternalIdenifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    PersonObj = relationship(Person)


class Referencematerialexternalidentifier(Base):
    __tablename__ = u'ReferenceMaterialExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ReferenceMaterialID = Column(ForeignKey('ODM2.ReferenceMaterials.ReferenceMaterialID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    ReferenceMaterialExternalIdentifier = Column(String(255), nullable=False)
    ReferenceMaterialExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    ReferenceMaterialObj = relationship(Referencematerial)


class Samplingfeatureexternalidentifier(Base):
    __tablename__ = u'SamplingFeatureExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    SamplingFeatureExternalIdentifier = Column(String(255), nullable=False)
    SamplingFeatureExternalIdentiferURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    SamplingFeatureObj = relationship(Samplingfeature)


class Spatialreferenceexternalidentifier(Base):
    __tablename__ = u'SpatialReferenceExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    SpatialReferenceExternalIdentifier = Column(String(255), nullable=False)
    SpatialReferenceExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    SpatialReferenceObj = relationship(Spatialreference)


class Taxonomicclassifierexternalidentifier(Base):
    __tablename__ = u'TaxonomicClassifierExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    TaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    TaxonomicClassifierExternalIdentifier = Column(String(255), nullable=False)
    TaxonomicClassifierExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    TaxonomicClassifierObj = relationship(Taxonomicclassifier)


class Variableexternalidentifier(Base):
    __tablename__ = u'VariableExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    VariableExternalIdentifer = Column(String(255), nullable=False)
    VariableExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    VariableObj = relationship(Variable)

