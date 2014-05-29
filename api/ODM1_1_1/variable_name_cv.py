from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class VariableNameCV(Base):
	__tablename__ = 'VariableNameCV'

	term   	   = Column('Term', String, primary_key=True)
	definition = Column('Definition', String)

	def __repr__(self):
		return "<VariableNameCV('%s', '%s')>" % (self.term, self.definition)