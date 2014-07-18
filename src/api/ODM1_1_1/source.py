from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base
from iso_metadata import ISOMetadata

class Source(Base):
	__tablename__ = 'Sources'

	id 			 	 = Column('SourceID', Integer, primary_key=True)
	organization 	 = Column('Organization', String, nullable=False)
	description	 	 = Column('SourceDescription', String, nullable=False)
	link	 	 	 = Column('SourceLink', String)
	contact_name 	 = Column('ContactName', String, nullable=False)
	phone		 	 = Column('Phone', String, nullable=False)
	email		 	 = Column('Email', String, nullable=False)
	address		 	 = Column('Address', String, nullable=False)
	city	  	 	 = Column('City', String, nullable=False)
	state	  	 	 = Column('State', String, nullable=False)
	zip_code	 	 = Column('ZipCode', String, nullable=False)
	citation	 	 = Column('Citation', String, nullable=False)
	iso_metadata_id	 = Column('MetadataID', Integer, ForeignKey('ISOMetadata.MetadataID'), nullable=False)

	# relationships
	iso_metadata = relationship(ISOMetadata)

	def __repr__(self):
		return "<Source('%s', '%s', '%s')>" % (self.id, self.organization, self.description)