# coding: utf-8
from sqlalchemy import Column, Float, ForeignKey, Integer, String
from sqlalchemy.types import NullType
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mssql.base import BIT

#from ODM2.Core.model import Samplingfeature, Taxonomicclassifier, Base
from ..Core.model import Samplingfeature, Taxonomicclassifier, Base


#from ODM2 import modelBase as Base



class Spatialreference(Base):
    __tablename__ = u'SpatialReferences'
    __table_args__ = {u'schema': u'ODM2SamplingFeatures'}

    SpatialReferenceID = Column(Integer, primary_key=True)
    SRSCode = Column(String(50))
    SRSName = Column(String(255), nullable=False)
    SRSDescription = Column(String(500))

class Specimen(Samplingfeature):
    __tablename__ = u'Specimens'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), primary_key=True)
    SpecimenTypeCV = Column(String(255), nullable=False)
    SpecimenMediumCV = Column(String(255), nullable=False)
    IsFieldSpecimen = Column(BIT, nullable=False)


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


class Site(Samplingfeature):
    __tablename__ = u'Sites'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), primary_key=True)
    SiteTypeCV = Column(String(255), nullable=False)
    Latitude = Column(Float(53), nullable=False)
    Longitude = Column(Float(53), nullable=False)
    LatLonDatumID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'), nullable=False)

    SpatialReferenceObj = relationship(Spatialreference)


class Relatedfeature(Base):
    __tablename__ = u'RelatedFeatures'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    RelationID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    SpatialOffsetID = Column(ForeignKey('ODM2SamplingFeatures.SpatialOffsets.SpatialOffsetID'))

    SamplingFeatureObj = relationship(Samplingfeature, primaryjoin='Relatedfeature.RelatedFeatureID == Samplingfeature.SamplingFeatureID')
    RelatedFeatureObj = relationship(Samplingfeature, primaryjoin='Relatedfeature.SamplingFeatureID == Samplingfeature.SamplingFeatureID')
    SpatialOffsetObj = relationship(Spatialoffset)


class Specimentaxonomicclassifier(Base):
    __tablename__ = u'SpecimenTaxonomicClassifiers'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2SamplingFeatures.Specimens.SamplingFeatureID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2Core.TaxonomicClassifiers.TaxonomicClassifierID'), nullable=False)
    CitationID = Column(Integer)

    SpecimenObj = relationship(Specimen)
    TaxonomicClassifierObj = relationship(Taxonomicclassifier)
