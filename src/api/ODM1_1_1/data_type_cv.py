from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class DataTypeCV(Base):
	__tablename__ = 'DataTypeCV'

	term   	   = Column('Term', String, primary_key=True)
	definition = Column('Definition', String)

	def __repr__(self):
		return "<DataTypeCV('%s', '%s')>" % (self.term, self.definition)