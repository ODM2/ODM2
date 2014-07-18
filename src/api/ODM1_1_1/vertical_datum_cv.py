from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class VerticalDatumCV(Base):
	__tablename__ = 'VerticalDatumCV'

	term   	   = Column('Term', String, primary_key=True)
	definition = Column('Definition', String)

	def __repr__(self):
		return "<VerticalDatumCV('%s', '%s')>" % (self.term, self.definition)