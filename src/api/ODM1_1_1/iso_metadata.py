from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base

class ISOMetadata(Base):
	__tablename__ = 'ISOMetadata'

	id 			    = Column('MetadataID', Integer, primary_key=True)
	topic_category 	= Column('TopicCategory', String, nullable=False)
	title  	   	 	= Column('Title', String, nullable=False)
	abstract     	= Column('Abstract', String, nullable=False)
	profile_version = Column('ProfileVersion', String, nullable=False)
	metadata_link   = Column('MetadataLink', String)

	def __repr__(self):
		return "<ISOMetadata('%s', '%s', '%s')>" % (self.id, self.topic_category, self.title)