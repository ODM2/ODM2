from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class Unit(Base):
	__tablename__ = 'Units'

	id 			 = Column('UnitsID', Integer, primary_key=True)
	name  	   	 = Column('UnitsName', String)
	type  	   	 = Column('UnitsType', String)
	abbreviation = Column('UnitsAbbreviation', String(convert_unicode=True))

	def __repr__(self):
		return "<Unit('%s', '%s', '%s')>" % (self.id, self.name, self.type)