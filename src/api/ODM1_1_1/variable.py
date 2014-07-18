from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base
from unit import Unit

class Variable(Base):
	__tablename__ = 'Variables'

	id 				  = Column('VariableID', Integer, primary_key=True)
	code	  		  = Column('VariableCode', String, nullable=False)
	name	  		  = Column('VariableName', String, nullable=False)
	speciation 		  = Column('Speciation', String, nullable=False)
	variable_unit_id  = Column('VariableUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
	sample_medium	  = Column('SampleMedium', String, nullable=False)
	value_type		  = Column('ValueType', String, nullable=False)
	is_regular		  = Column('IsRegular', Boolean, nullable=False)
	time_support	  = Column('TimeSupport', Float, nullable=False)
	time_unit_id	  = Column('TimeUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
	data_type		  = Column('DataType', String, nullable=False)
	general_category  = Column('GeneralCategory', String, nullable=False)
	no_data_value	  = Column('NoDataValue', Float, nullable=False)

	# relationships
	variable_unit = relationship(Unit, primaryjoin=("Unit.id==Variable.variable_unit_id"))		# <-- Uses class attribute names, not table column names
	time_unit 	  = relationship(Unit, primaryjoin=("Unit.id==Variable.time_unit_id"))

	def __repr__(self):
		return "<Variable('%s', '%s', '%s')>" % (self.id, self.code, self.name)