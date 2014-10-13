# coding: utf-8
from sqlalchemy import BigInteger, Column, DateTime, Float, ForeignKey, Integer, String, Table
from sqlalchemy.orm import relationship

#from ODM2 import modelBase as Base

from ODM2.Core.model import Person, Dataset,  Method, Result, Base


class Citation(Base):
    __tablename__ = u'Citations'
    __table_args__ = {u'schema': u'ODM2'}

    CitationID = Column(Integer, primary_key=True)
    Title = Column(String(255), nullable=False)
    Publisher = Column(String(255), nullable=False)
    PublicationYear = Column(Integer, nullable=False)
    CitationLink = Column(String(255))


class Authorlist(Base):
    __tablename__ = u'AuthorLists'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    PersonID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    AuthorOrder = Column(Integer, nullable=False)

    CitationObj = relationship(Citation)
    PersonObj = relationship(Person)


class Datasetcitation(Base):
    __tablename__ = u'DataSetCitations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    DataSetID = Column(ForeignKey('ODM2.DataSets.DataSetID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citation)
    DataSetObj = relationship(Dataset)


Resultderivationequation = Table(
    u'ResultDerivationEquations', Base.metadata,
    Column(u'ResultID', ForeignKey('ODM2.Results.ResultID'), primary_key=True),
    Column(u'DerivationEquationID', ForeignKey('ODM2.DerivationEquations.DerivationEquationID'), nullable=False),
    schema='ODM2'
)


class Derivationequation(Base):
    __tablename__ = u'DerivationEquations'
    __table_args__ = {u'schema': 'ODM2'}

    DerivationEquationID = Column(Integer, primary_key=True)
    DerivationEquation = Column(String(255), nullable=False)

    ResultsObj = relationship(Result, secondary=Resultderivationequation)


class Methodcitation(Base):
    __tablename__ = u'MethodCitations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citation)
    MethodObj = relationship(Method)


from ODM2.Annotations.model import Annotation
class Relatedannotation(Base):
    __tablename__ = u'RelatedAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedAnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotation, primaryjoin='Relatedannotation.AnnotationID == Annotation.AnnotationID')
    RelatedAnnotationObj = relationship(Annotation, primaryjoin='Relatedannotation.RelatedAnnotationID == Annotation.AnnotationID')


class Relatedcitation(Base):
    __tablename__ = u'RelatedCitations'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    RelationshipTypeCV = Column(Integer, nullable=False)
    RelatedCitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj= relationship(Citation, primaryjoin='Relatedcitation.CitationID == Citation.CitationID')
    RelatedCitationObj = relationship(Citation, primaryjoin='Relatedcitation.RelatedCitationID == Citation.CitationID')


class Relateddataset(Base):
    __tablename__ = u'RelatedDatasets'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    DataSetID = Column(ForeignKey('ODM2.DataSets.DataSetID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedDatasetID = Column(ForeignKey('ODM2.DataSets.DataSetID'), nullable=False)
    VersionCode = Column(String(50))

    DataSetObj = relationship(Dataset, primaryjoin='Relateddataset.DataSetID == Dataset.DataSetID')
    RelatedDatasetObj = relationship(Dataset, primaryjoin='Relateddataset.RelatedDatasetID == Dataset.DataSetID')


class Relatedresult(Base):
    __tablename__ = u'RelatedResults'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    VersionCode = Column(String(50))
    RelatedResultSequenceNumber = Column(Integer)

    ResultObj = relationship(Result, primaryjoin='Relatedresult.RelatedResultID == Result.ResultID')
    RelatedResultObj = relationship(Result, primaryjoin='Relatedresult.ResultID == Result.ResultID')





