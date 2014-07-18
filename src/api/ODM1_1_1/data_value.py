# Declare a mapped class
from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base
from site import Site
from variable import Variable
from qualifier import Qualifier
from method import Method
from source import Source
from quality_control_level import QualityControlLevel
from offset_type import OffsetType
from sample import Sample

def copy_data_value(from_dv):
	new = DataValue()
	new.data_value = from_dv.data_value
	new.value_accuracy = from_dv.value_accuracy
	new.local_date_time = from_dv.local_date_time
	new.utc_offset = from_dv.utc_offset
	new.date_time_utc = from_dv.date_time_utc
	new.site_id = from_dv.site_id
	new.variable_id = from_dv.variable_id
	new.offset_value = from_dv.offset_value
	new.offset_type_id = from_dv.offset_type_id
	new.censor_code = from_dv.censor_code
	new.qualifier_id = from_dv.qualifier_id
	new.method_id = from_dv.method_id
	new.source_id = from_dv.source_id
	new.sample_id = from_dv.sample_id
	new.derived_from_id = from_dv.derived_from_id
	new.quality_control_level_id = from_dv.quality_control_level_id
	return new

class DataValue(Base):
	__tablename__ = 'DataValues'

	id 						 = Column('ValueID', Integer, primary_key=True)
	data_value 		    	 = Column('DataValue', Float)
	value_accuracy	    	 = Column('ValueAccuracy', Float)
	local_date_time	    	 = Column('LocalDateTime', DateTime)
	utc_offset		    	 = Column('UTCOffset', Float)
	date_time_utc			 = Column('DateTimeUTC', DateTime)
	site_id		 	    	 = Column('SiteID', Integer, ForeignKey('Sites.SiteID'), nullable=False)
	variable_id			   	 = Column('VariableID', Integer, ForeignKey('Variables.VariableID'), nullable=False)
	offset_value	    	 = Column('OffsetValue', Float)
	offset_type_id			 = Column('OffsetTypeID', Integer, ForeignKey('OffsetTypes.OffsetTypeID'))
	censor_code		    	 = Column('CensorCode', String)
	qualifier_id	    	 = Column('QualifierID', Integer, ForeignKey('Qualifiers.QualifierID'))
	method_id		    	 = Column('MethodID', Integer, ForeignKey('Methods.MethodID'), nullable=False)
	source_id		    	 = Column('SourceID', Integer, ForeignKey('Sources.SourceID'), nullable=False)
	sample_id			  	 = Column('SampleID', Integer, ForeignKey('Samples.SampleID'))
	derived_from_id	    	 = Column('DerivedFromID', Integer)
	quality_control_level_id = Column('QualityControlLevelID', Integer, ForeignKey('QualityControlLevels.QualityControlLevelID'), nullable=False)

	# relationships
	site 				  = relationship(Site)
	variable 			  = relationship(Variable)
	method 				  = relationship(Method)
	source 				  = relationship(Source)
	quality_control_level = relationship(QualityControlLevel)

	qualifier 			  = relationship(Qualifier)
	offset_type			  = relationship(OffsetType)
	sample 				  = relationship(Sample)

	def list_repr(self):
		return [self.id, self.data_value, self.value_accuracy, self.local_date_time,
			self.utc_offset, self.date_time_utc, self.site_id, self.variable_id, 
			self.offset_value, self.offset_type_id, self.censor_code, self.qualifier_id,
			self.method_id, self.source_id, self.sample_id, self.derived_from_id,
			self.quality_control_level_id]

	def __repr__(self):
		return "<DataValue('%s', '%s', '%s')>" % (self.data_value, self.local_date_time, self.value_accuracy)
