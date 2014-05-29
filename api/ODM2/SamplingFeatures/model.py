# coding: utf-8
from sqlalchemy import Column, Float, ForeignKey, Integer, String
from sqlalchemy.types import NullType
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mssql.base import BIT
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


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


class Specimen(Samplingfeature):
    __tablename__ = u'Specimens'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), primary_key=True)
    SpecimenTypeCV = Column(String(255), nullable=False)
    SpecimenMediumCV = Column(String(255), nullable=False)
    IsFieldSpecimen = Column(BIT, nullable=False)


class Site(Samplingfeature):
    __tablename__ = u'Sites'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), primary_key=True)
    SiteTypeCV = Column(String(255), nullable=False)
    Latitude = Column(Float(53), nullable=False)
    Longitude = Column(Float(53), nullable=False)
    LatLonDatumID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'), nullable=False)

    SpatialReference = relationship(u'Spatialreference')


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


class Relatedfeature(Base):
    __tablename__ = u'RelatedFeatures'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    RelationID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    SpatialOffsetID = Column(ForeignKey('ODM2SamplingFeatures.SpatialOffsets.SpatialOffsetID'))

    SamplingFeature = relationship(u'Samplingfeature', primaryjoin='Relatedfeature.RelatedFeatureID == Samplingfeature.SamplingFeatureID')
    SamplingFeature1 = relationship(u'Samplingfeature', primaryjoin='Relatedfeature.SamplingFeatureID == Samplingfeature.SamplingFeatureID')
    SpatialOffset = relationship(u'Spatialoffset')


class Spatialoffset(Base):
    __tablename__ = u'SpatialOffsets'
    __table_args__ = {u'schema': u'ODM2SamplingFeatures'}

    SpatialOffsetID = Column(Integer, primary_key=True)
    SpatialOffsetTypeCV = Column(String(255), nullable=False)
    Offset1Value = Column(Float(53), nullable=False)
    Offset1UnitID = Column(Integer, nullable=False)
    Offset2Value = Column(Float(53))
    Offset2UnitID = Column(Integer)
    Offset3Value = Column(Float(53))
    Offset3UnitID = Column(Integer)


class Spatialreference(Base):
    __tablename__ = u'SpatialReferences'
    __table_args__ = {u'schema': u'ODM2SamplingFeatures'}

    SpatialReferenceID = Column(Integer, primary_key=True)
    SRSCode = Column(String(50))
    SRSName = Column(String(255), nullable=False)
    SRSDescription = Column(String(500))


class Specimentaxonomicclassifier(Base):
    __tablename__ = u'SpecimenTaxonomicClassifiers'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2SamplingFeatures.Specimens.SamplingFeatureID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2Core.TaxonomicClassifiers.TaxonomicClassifierID'), nullable=False)
    CitationID = Column(Integer)

    Specimen = relationship(u'Specimen')
    TaxonomicClassifier = relationship(u'Taxonomicclassifier')
