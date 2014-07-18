from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class CensorCodeCV(Base):
	__tablename__ = 'CensorCodeCV'

	term   	   = Column('Term', String, primary_key=True)
	definition = Column('Definition', String)

	def __repr__(self):
		return "<CensorCodeCV('%s', '%s')>" % (self.term, self.definition)