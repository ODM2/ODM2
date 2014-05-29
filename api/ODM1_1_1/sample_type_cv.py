from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class SampleTypeCV(Base):
	__tablename__ = 'SampleTypeCV'

	term   	   = Column('Term', String, primary_key=True)
	definition = Column('Definition', String)

	def __repr__(self):
		return "<SampleTypeCV('%s', '%s')>" % (self.term, self.definition)