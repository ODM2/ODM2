# coding: utf-8
from sqlalchemy import Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.types import NullType
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


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


class Referencematerial(Base):
    __tablename__ = u'ReferenceMaterials'
    __table_args__ = {u'schema': u'ODM2DataQuality'}

    ReferenceMaterialID = Column(Integer, primary_key=True)
    ReferenceMaterialMediumCV = Column(String(255), nullable=False)
    ReferenceMaterialOrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'), nullable=False)
    ReferenceMaterialCode = Column(String(50), nullable=False)
    ReferenceMaterialLotCode = Column(String(255))
    ReferenceMaterialPurchaseDate = Column(DateTime)
    ReferenceMaterialExpirationDate = Column(DateTime)
    ReferenceMaterialCertificateLink = Column(String(255))
    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'))

    Organization = relationship(u'Organization')
    SamplingFeature = relationship(u'Samplingfeature')


class Citationexternalidentifier(Base):
    __tablename__ = u'CitationExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2ExternalIdentifiers'}

    BridgeID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2Provenance.Citations.CitationID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2ExternalIdentifiers.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    CitationExternalIdentifer = Column(String(255), nullable=False)
    CitationExternalIdentiferURI = Column(String(255))

    Citation = relationship(u'Citation')
    ExternalIdentifierSystem = relationship(u'Externalidentifiersystem')


class Externalidentifiersystem(Base):
    __tablename__ = u'ExternalIdentifierSystems'
    __table_args__ = {u'schema': u'ODM2ExternalIdentifiers'}

    ExternalIdentifierSystemID = Column(Integer, primary_key=True)
    ExternalIdentifierSystemName = Column(String(255), nullable=False)
    IdentifierSystemOrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'), nullable=False)
    ExternalIdentifierSystemDescription = Column(String(500))
    ExternalIdentifierSystemURL = Column(String(255))

    Organization = relationship(u'Organization')


class Methodexternalidentifier(Base):
    __tablename__ = u'MethodExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2ExternalIdentifiers'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2Core.Methods.MethodID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2ExternalIdentifiers.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    MethodExternalIdentifier = Column(String(255), nullable=False)
    MethodExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystem = relationship(u'Externalidentifiersystem')
    Method = relationship(u'Method')


class Personexternalidentifier(Base):
    __tablename__ = u'PersonExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2ExternalIdentifiers'}

    BridgeID = Column(Integer, primary_key=True)
    PersonID = Column(ForeignKey('ODM2Core.People.PersonID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2ExternalIdentifiers.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    PersonExternalIdentifier = Column(String(255), nullable=False)
    PersonExternalIdenifierURI = Column(String(255))

    ExternalIdentifierSystem = relationship(u'Externalidentifiersystem')
    Person = relationship(u'Person')


class Referencematerialexternalidentifier(Base):
    __tablename__ = u'ReferenceMaterialExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2ExternalIdentifiers'}

    BridgeID = Column(Integer, primary_key=True)
    ReferenceMaterialID = Column(ForeignKey('ODM2DataQuality.ReferenceMaterials.ReferenceMaterialID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2ExternalIdentifiers.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    ReferenceMaterialExternalIdentifier = Column(String(255), nullable=False)
    ReferenceMaterialExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystem = relationship(u'Externalidentifiersystem')
    ReferenceMaterial = relationship(u'Referencematerial')


class Samplingfeatureexternalidentifier(Base):
    __tablename__ = u'SamplingFeatureExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2ExternalIdentifiers'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2ExternalIdentifiers.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    SamplingFeatureExternalIdentifier = Column(String(255), nullable=False)
    SamplingFeatureExternalIdentiferURI = Column(String(255))

    ExternalIdentifierSystem = relationship(u'Externalidentifiersystem')
    SamplingFeature = relationship(u'Samplingfeature')


class Spatialreferenceexternalidentifier(Base):
    __tablename__ = u'SpatialReferenceExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2ExternalIdentifiers'}

    BridgeID = Column(Integer, primary_key=True)
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2ExternalIdentifiers.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    SpatialReferenceExternalIdentifier = Column(String(255), nullable=False)
    SpatialReferenceExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystem = relationship(u'Externalidentifiersystem')
    SpatialReference = relationship(u'Spatialreference')


class Taxonomicclassifierexternalidentifier(Base):
    __tablename__ = u'TaxonomicClassifierExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2ExternalIdentifiers'}

    BridgeID = Column(Integer, primary_key=True)
    TaxonomicClassifierID = Column(ForeignKey('ODM2Core.TaxonomicClassifiers.TaxonomicClassifierID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2ExternalIdentifiers.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    TaxonomicClassifierExternalIdentifier = Column(String(255), nullable=False)
    TaxonomicClassifierExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystem = relationship(u'Externalidentifiersystem')
    TaxonomicClassifier = relationship(u'Taxonomicclassifier')


class Variableexternalidentifier(Base):
    __tablename__ = u'VariableExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2ExternalIdentifiers'}

    BridgeID = Column(Integer, primary_key=True)
    VariableID = Column(ForeignKey('ODM2Core.Variables.VariableID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2ExternalIdentifiers.ExternalIdentifierSystems.ExternalIdentifierSystemID'), nullable=False)
    VariableExternalIdentifer = Column(String(255), nullable=False)
    VariableExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystem = relationship(u'Externalidentifiersystem')
    Variable = relationship(u'Variable')


class Citation(Base):
    __tablename__ = u'Citations'
    __table_args__ = {u'schema': u'ODM2Provenance'}

    CitationID = Column(Integer, primary_key=True)
    Title = Column(String(255), nullable=False)
    Publisher = Column(String(255), nullable=False)
    PublicationYear = Column(Integer, nullable=False)
    CitationLink = Column(String(255))


class Spatialreference(Base):
    __tablename__ = u'SpatialReferences'
    __table_args__ = {u'schema': u'ODM2SamplingFeatures'}

    SpatialReferenceID = Column(Integer, primary_key=True)
    SRSCode = Column(String(50))
    SRSName = Column(String(255), nullable=False)
    SRSDescription = Column(String(500))
