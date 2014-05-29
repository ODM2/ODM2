# coding: utf-8
from sqlalchemy import BigInteger, Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mssql.base import UNIQUEIDENTIFIER
from sqlalchemy.types import NullType
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Actionannotation(Base):
    __tablename__ = u'ActionAnnotations'
    __table_args__ = {u'schema': 'ODM2Annotations'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2Annotations.Annotations.AnnotationID'), nullable=False)

    Action = relationship(u'Action')
    Annotation = relationship(u'Annotation')


class Annotation(Base):
    __tablename__ = u'Annotations'


    __table_args__ = {u'schema': u'ODM2Annotations'}

    AnnotationID = Column(Integer, primary_key=True)
    AnnotationTypeCV = Column(String(255), nullable=False)
    AnnotationCode = Column(String(50))
    AnnotationText = Column(String(500), nullable=False)
    AnnotationDateTime = Column(DateTime)
    AnnotationUTCOffset = Column(Integer)
    AnnotationLink = Column(String(255))
    AnnotatorID = Column(ForeignKey('ODM2Core.People.PersonID'))
    CitationID = Column(ForeignKey('ODM2Provenance.Citations.CitationID'))

    Person = relationship(u'Person')
    Citation = relationship(u'Citation')


class Methodannotation(Base):
    __tablename__ = u'MethodAnnotations'
    __table_args__ = {u'schema': 'ODM2Annotations'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2Core.Methods.MethodID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2Annotations.Annotations.AnnotationID'), nullable=False)

    Annotation = relationship(u'Annotation')
    Method = relationship(u'Method')


class Resultannotation(Base):
    __tablename__ = u'ResultAnnotations'
    __table_args__ = {u'schema': 'ODM2Annotations'}

    BridgeID = Column(Integer, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2Annotations.Annotations.AnnotationID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    EndDateTime = Column(DateTime, nullable=False)

    Annotation = relationship(u'Annotation')
    Result = relationship(u'Result')


class Resultvalueannotation(Base):
    __tablename__ = u'ResultValueAnnotations'
    __table_args__ = {u'schema': 'ODM2Annotations'}

    BridgeID = Column(Integer, primary_key=True)
    ValueID = Column(BigInteger, nullable=False)
    AnnotationID = Column(ForeignKey('ODM2Annotations.Annotations.AnnotationID'), nullable=False)

    Annotation = relationship(u'Annotation')


class Samplingfeatureannotation(Base):
    __tablename__ = u'SamplingFeatureAnnotations'
    __table_args__ = {u'schema': 'ODM2Annotations'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2Annotations.Annotations.AnnotationID'), nullable=False)

    Annotation = relationship(u'Annotation')
    SamplingFeature = relationship(u'Samplingfeature')



















