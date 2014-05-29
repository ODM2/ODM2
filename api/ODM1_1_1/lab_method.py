from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class LabMethod(Base):
	__tablename__ = 'LabMethods'

	id 				   = Column('LabMethodID', Integer, primary_key=True)
	name			   = Column('LabName', String, nullable=False)
	organization	   = Column('LabOrganization', String, nullable=False)
	method_name		   = Column('LabMethodName', String, nullable=False)
	method_description = Column('LabMethodDescription', String, nullable=False)
	method_link		   = Column('LabMethodLink', String)

	def __repr__(self):
		return "<LabMethod('%s', '%s', '%s', '%s')>" % (self.id, self.name, self.organization, self.method_name)