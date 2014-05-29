from sqlalchemy import String, Column
from sqlalchemy.orm import relationship
from base import Base

class ODMVersion(Base):
	__tablename__ = 'ODMVersion'

	version_number = Column('VersionNumber', String, primary_key=True)

	def __repr__(self):
		return "<ODMVersion('%s')>" % (self.version_number)