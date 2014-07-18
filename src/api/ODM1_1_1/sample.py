from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base
from lab_method import LabMethod

class Sample(Base):
	__tablename__ = 'Samples'

	id 			    = Column('SampleID', Integer, primary_key=True)
	type		 	= Column('SampleType', String, nullable=False)
	lab_sample_code	= Column('LabSampleCode', String, nullable=False)
	lab_method_id  	= Column('LabMethodID', Integer, ForeignKey('LabMethods.LabMethodID'), nullable=False)

	# relationships
	lab_method = relationship(LabMethod)

	def __repr__(self):
		return "<Sample('%s', '%s', '%s', '%s')>" % (self.id, self.type, self.lab_sample_code, self.lab_method_id)