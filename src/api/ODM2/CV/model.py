# coding: utf-8
from sqlalchemy import Column, Integer, String
#from ODM2 import modelBase as Base
from ODM2.Core.model import Base


class Cvterm(Base):
    __tablename__ = u'CVTerms'
    __table_args__ = {u'schema': 'ODM2'}

    TermID = Column(Integer, primary_key=True)
    Term = Column(String(255), nullable=False)
    Definition = Column(String(500))
    ODMVocabulary = Column(String(255), nullable=False)
    SourceVocabulary = Column(String(255))
