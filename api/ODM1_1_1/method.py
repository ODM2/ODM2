from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class Method(Base):
	__tablename__ = 'Methods'

	id 			= Column('MethodID', Integer, primary_key=True)
	description	= Column('MethodDescription', String, nullable=False)
	link		= Column('MethodLink', String)

	def __repr__(self):
		return "<Method('%s', '%s', '%s')>" % (self.id, self.description, self.link)