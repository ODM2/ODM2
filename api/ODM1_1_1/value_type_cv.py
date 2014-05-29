from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class ValueTypeCV(Base):
	__tablename__ = 'ValueTypeCV'

	term   	   = Column('Term', String, primary_key=True)
	definition = Column('Definition', String)

	def __repr__(self):
		return "<ValueTypeCV('%s', '%s')>" % (self.term, self.definition)