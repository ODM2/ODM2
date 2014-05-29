# coding: utf-8
from sqlalchemy import Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Cvterm(Base):
    __tablename__ = u'CVTerms'
    __table_args__ = {u'schema': 'ODM2CV'}

    TermID = Column(Integer, primary_key=True)
    Term = Column(String(255), nullable=False)
    Definition = Column(String(500))
    ODMVocabulary = Column(String(255), nullable=False)
    SourceVocabulary = Column(String(255))
