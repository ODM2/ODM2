from sqlalchemy import *
from sqlalchemy.orm import relationship
from base import Base
from unit import Unit

class OffsetType(Base):
	__tablename__ = 'OffsetTypes'

	id 			= Column('OffsetTypeID', Integer, primary_key=True)
	unit_id     = Column('OffsetUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
	description = Column('OffsetDescription', String)

	# relationships
	unit = relationship(Unit)

	def __repr__(self):
		return "<Unit('%s', '%s', '%s')>" % (self.id, self.unit_id, self.description)