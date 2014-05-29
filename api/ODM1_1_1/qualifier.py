from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class Qualifier(Base):
	__tablename__ = 'Qualifiers'

	id 			= Column('QualifierID', Integer, primary_key=True)
	code 		= Column('QualifierCode', String, nullable=False)
	description	= Column('QualifierDescription', String, nullable=False)

	def __repr__(self):
		return "<Qualifier('%s', '%s', '%s')>" % (self.id, self.code, self.description)