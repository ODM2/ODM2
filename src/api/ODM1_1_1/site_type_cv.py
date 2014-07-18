from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class SiteTypeCV(Base):
	__tablename__ = 'SiteTypeCV'

	term   	   = Column('Term', String, primary_key=True)
	definition = Column('Definition', String)

	def __repr__(self):
		return "<SiteTypeCV('%s', '%s')>" % (self.term, self.definition)