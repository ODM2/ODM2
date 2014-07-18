# Declare a mapped class
from sqlalchemy import *
from sqlalchemy.orm import relationship, backref
from base import Base
from spatial_reference import SpatialReference

class Site(Base):
	__tablename__ = 'Sites'

	id 					= Column('SiteID', Integer, primary_key=True)
	code 			    = Column('SiteCode', String)
	name 	 		    = Column('SiteName', String)
	latitude  		    = Column('Latitude', Float)
	longitude			= Column('Longitude', Float)
	lat_long_datum_id   = Column('LatLongDatumID', Integer, ForeignKey('SpatialReferences.SpatialReferenceID'))
	elevation_m 	    = Column('Elevation_m', Float)
	vertical_datum_id   = Column('VerticalDatum', Integer)
	local_x			    = Column('LocalX', Float)
	local_y			    = Column('LocalY', Float)
	local_projection_id = Column('LocalProjectionID', Integer, ForeignKey('SpatialReferences.SpatialReferenceID'))
	pos_accuracy_m	    = Column('PosAccuracy_m', Float)
	state			    = Column('State', String)
	county			    = Column('County', String)
	comments		    = Column('Comments', String)

	type				= Column('SiteType', String)

	# relationships
	spatial_ref = relationship(SpatialReference, primaryjoin=("SpatialReference.id==Site.lat_long_datum_id"))
	local_spatial_ref = relationship(SpatialReference, primaryjoin=("SpatialReference.id==Site.local_projection_id"))

	def __init__(self, site_code, site_name):
		self.code = site_code
		self.name = site_name

	def __repr__(self):
		return "<Site('%s', '%s')>" % (self.code, self.name)