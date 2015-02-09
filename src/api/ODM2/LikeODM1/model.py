from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import column_property

Base = declarative_base()

from sqlalchemy import *
from sqlalchemy.orm import relationship


metadata = MetaData()

################ODM 2 Tables###########
from ODM2.Core.model import Action, Organization, Affiliation, Person, Samplingfeature, Result,  Variable
from ODM2.Results.model import Timeseriesresult
from ODM2.SamplingFeatures.model import Site, Spatialreference
from ODM2.CV.model import Cvterm




organization_table =Table()
people_table = Person()
sampling_feature_table = Samplingfeature()
site_table =Site()
variables_table =Variable()
result_table =Result()
affiliation_table=Affiliation()
#ts_result_table=Timeseriesresult()
action_table=Action()

##########joined tables#########
#source_join = join(people_table, affiliation_table)
#site_join = join(site_table, sampling_feature_table)
#print site_join
###############joined Classes###########
class Site(Base):
    __table__ = site_table
    #id = column_property(sampling_feature_table.c.SamplingFeatureId)
    #code = address_table.c.id

    id = site_table.SamplingFeatureID
    code = site_table.SamplingFeatureCode
    name = site_table.SamplingFeatureName
    latitude = site_table.Latitude
    longitude = site_table.Longitude
    lat_long_datum_id = site_table.LatLonDatumID#, Integer, ForeignKey('ODM2.Spatialreference.SpatialReferenceID'))
    elevation_m = site_table.Elevation_m
    vertical_datum_id = site_table.ElevationDatumCV

    local_x = None#Column('LocalX', Float)
    local_y = None#Column('LocalY', Float)
    local_projection_id = None#Column('LocalProjectionID', Integer, ForeignKey('SpatialReferences.SpatialReferenceID'))
    pos_accuracy_m = None#Column('PosAccuracy_m', Float)
    state = None#Column('State', String)
    county = None#Column('County', String)
    comments = None#Column('Comments', String)

    type =None #Column('SiteTypeCV', String)


    # relationships
    #spatial_ref = relationship(SpatialReference, primaryjoin=("SpatialReference.id==Site.lat_long_datum_id"))
   # local_spatial_ref = relationship(SpatialReference, primaryjoin=("SpatialReference.id==Site.local_projection_id"))


    def __repr__(self):
        return "<Site('%s', '%s')>" % (self.code, self.name)


class Unit(Base):
    __tablename__ = 'Units'
    __table_args__ = {u'schema': 'ODM2'}

    id = Column('UnitsID', Integer, primary_key=True)
    name = Column('UnitsName', String)
    type = Column('UnitsTypeCV', String)
    abbreviation = Column('UnitsAbbreviation', String)

    def __repr__(self):
        return "<Unit('%s', '%s', '%s')>" % (self.id, self.name, self.type)

'''class ISOMetadata(Base):
    __tablename__ = 'ISOMetadata'

    id = Column('MetadataID', Integer, primary_key=True)
    topic_category = Column('TopicCategory', String, nullable=False)
    title = Column('Title', String, nullable=False)
    abstract = Column('Abstract', String, nullable=False)
    profile_version = Column('ProfileVersion', String, nullable=False)
    metadata_link = Column('MetadataLink', String)

    def __repr__(self):
        return "<ISOMetadata('%s', '%s', '%s')>" % (self.id, self.topic_category, self.title)

#combined with Methods
class LabMethod(Base):
    __tablename__ = 'LabMethods'

    id = Column('LabMethodID', Integer, primary_key=True)
    name = Column('LabName', String, nullable=False)
    organization = Column('LabOrganization', String, nullable=False)
    method_name = Column('LabMethodName', String, nullable=False)
    method_description = Column('LabMethodDescription', String, nullable=False)
    method_link = Column('LabMethodLink', String)

    def __repr__(self):
        return "<LabMethod('%s', '%s', '%s', '%s')>" % (self.id, self.name, self.organization, self.method_name)
'''
class ODMVersion:
    #__tablename__ = 'ODMVersion'

    #version_number = Column('VersionNumber', String, primary_key=True)
    version_number = 2

    def __repr__(self):
        return "<ODMVersion('%s')>" % (self.version_number)



class SpatialReference(Base):
    __tablename__ = 'SpatialReferences'
    __table_args__ = {u'schema': 'ODM2'}

    id = Column('SpatialReferenceID', Integer, primary_key=True)
    srs_id = Column('SRSID', String)
    srs_name = Column('SRSName', String)
    #is_geographic = Column('IsGeographic', Boolean)
    notes = Column('Description', String)

    def __repr__(self):
        return "<SpatialReference('%s', '%s')>" % (self.id, self.srs_name)
'''
class CensorCodeCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<CensorCodeCV('%s', '%s')>" % (self.term, self.definition)

class DataTypeCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<DataTypeCV('%s', '%s')>" % (self.term, self.definition)  # Declare a mapped class

class GeneralCategoryCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<GeneralCategoryCV('%s', '%s')>" % (self.term, self.definition)

class SampleMediumCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<SampleMedium('%s', '%s')>" % (self.term, self.definition)

class SampleTypeCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<SampleTypeCV('%s', '%s')>" % (self.term, self.definition)

class SiteTypeCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<SiteTypeCV('%s', '%s')>" % (self.term, self.definition)

class SpeciationCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<SpeciationCV('%s', '%s')>" % (self.term, self.definition)

class TopicCategoryCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<TopicCategoryCV('%s', '%s')>" % (self.term, self.definition)

class ValueTypeCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<ValueTypeCV('%s', '%s')>" % (self.term, self.definition)

class VariableNameCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<VariableNameCV('%s', '%s')>" % (self.term, self.definition)

class VerticalDatumCV(Base):
    __tablename__ = 'cvterms'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<VerticalDatumCV('%s', '%s')>" % (self.term, self.definition)
'''
class Sample(Base):
    __tablename__ = 'Samples'

    id = Column('SampleID', Integer, primary_key=True)
    type = Column('SampleType', String, nullable=False)
    lab_sample_code = Column('LabSampleCode', String, nullable=False)
    lab_method_id = Column('LabMethodID', Integer, ForeignKey('ODM2.LabMethods.LabMethodID'), nullable=False)

    # relationships
    #lab_method = relationship(LabMethod)

    def __repr__(self):
        return "<Sample('%s', '%s', '%s', '%s')>" % (self.id, self.type, self.lab_sample_code, self.lab_method_id)

class Qualifier(Base):
    __tablename__ = u'Annotations'
    __table_args__ = {u'schema': u'ODM2'}

    id = Column('AnnotationID', Integer, primary_key=True)
    code = Column('AnnotationCode', String, nullable=False)
    description = Column('AnnotationText', String, nullable=False)

    def __repr__(self):
        return "<Qualifier('%s', '%s', '%s')>" % (self.id, self.code, self.description)

#TODO Table no longer exists
class OffsetType(Base):
    
    __tablename__ = u'TimeSeriesResults'
    __table_args__ = {u'schema': 'ODM2'}

    id = Column('OffsetTypeID', Integer, primary_key=True)
    unit_id = Column('ZLocationUnitsID', Integer, ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    description = Column('OffsetDescription', String)

    # relationships
    unit = relationship(Unit)

    def __repr__(self):
        return "<Unit('%s', '%s', '%s')>" % (self.id, self.unit_id, self.description)

class Method(Base):
    __tablename__ = u'Methods'
    __table_args__ = {u'schema': u'ODM2'}

    id = Column('MethodID', Integer, primary_key=True)
    description = Column('MethodDescription', String, nullable=False)
    link = Column('MethodLink', String)

    def __repr__(self):
        return "<Method('%s', '%s', '%s')>" % (self.id, self.description, self.link)

class QualityControlLevel(Base):
    __tablename__ = u'ProcessingLevels'
    __table_args__ = {u'schema': u'ODM2'}

    id = Column('ProcessingLevelID', Integer, primary_key=True)
    code = Column('ProcessingLevelCode', String, nullable=False)
    definition = Column('Definition', String, nullable=False)
    explanation = Column('Explanation', String, nullable=False)

    def __repr__(self):
        return "<QualityControlLevel('%s', '%s', '%s', '%s')>" % (self.id, self.code, self.definition, self.explanation)

class Source(Base):
    __tablename__ = u'Organizations'
    __table_args__ = {u'schema': u'ODM2'}

    id = Column('OrganizationID', Integer, primary_key=True)
    organization = Column('OrganizationName', String, nullable=False)#TODO organization
    description = Column('OrganizationDescription', String, nullable=False)
    link = Column('OrganizationLink', String)

    #TODO Affiliation, People
    contact_name = Column('ContactName', String, nullable=False)
    phone = Column('Phone', String, nullable=False)
    email = Column('Email', String, nullable=False)
    address = Column('Address', String, nullable=False)
    city = Column('City', String, nullable=False)
    state = Column('State', String, nullable=False)
    zip_code = Column('ZipCode', String, nullable=False)
    citation = Column('Citation', String, nullable=False)
    iso_metadata_id = Column('MetadataID', Integer, ForeignKey('ODM2.ISOMetadata.MetadataID'), nullable=False)

    # relationships
    #iso_metadata = relationship(ISOMetadata)

    def __repr__(self):
        return "<Source('%s', '%s', '%s')>" % (self.id, self.organization, self.description)

#ToDO join Sampling feature and sites
class Site(Base):
    
    __tablename__ = u'Sites'
    __table_args__ = {u'schema': 'ODM2'}

    id = Column('SamplingFeatureID', Integer, primary_key=True)
    code = Column('SiteCode', String)
    name = Column('SiteName', String)
    latitude = Column('Latitude', Float)
    longitude = Column('Longitude', Float)

    #
    # def __init__(self, site_code, site_name):
    #     self.code = site_code
    #     self.name = site_name

    def __repr__(self):
        return "<Site('%s', '%s')>" % (self.code, self.name)

class Variable(Base):
    #TODO join with Result
    __tablename__ = u'Variables'
    __table_args__ = {u'schema': u'ODM2'}

    id = Column('VariableID', Integer, primary_key=True)
    code = Column('VariableCode', String, nullable=False)
    name = Column('VariableNameCV', String, nullable=False)
    speciation = Column('SpeciationCV', String, nullable=False)
    no_data_value = Column('NoDataValue', Float, nullable=False)

'''
    variable_unit_id = Column('VariableUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
    sample_medium = Column('SampleMedium', String, nullable=False)
    value_type = Column('ValueType', String, nullable=False)
    is_regular = Column('IsRegular', Boolean, nullable=False)
    time_support = Column('TimeSupport', Float, nullable=False)
    time_unit_id = Column('TimeUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
    data_type = Column('DataType', String, nullable=False)
    general_category = Column('GeneralCategory', String, nullable=False)


    # relationships
    variable_unit = relationship(Unit, primaryjoin=(
    "Unit.id==Variable.variable_unit_id"))  # <-- Uses class attribute names, not table column names
    time_unit = relationship(Unit, primaryjoin=("Unit.id==Variable.time_unit_id"))

    def __repr__(self):
        return "<Variable('%s', '%s', '%s')>" % (self.id, self.code, self.name)
'''


'''
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
'''
'''
class DataValue(Base):
    __tablename__ = 'DataValues'

    id = Column('ValueID', Integer, primary_key=True)
    data_value = Column('DataValue', Float)
    value_accuracy = Column('ValueAccuracy', Float)
    local_date_time = Column('LocalDateTime', DateTime)
    utc_offset = Column('UTCOffset', Float)
    date_time_utc = Column('DateTimeUTC', DateTime)
    site_id = Column('SiteID', Integer, ForeignKey('Sites.SiteID'), nullable=False)
    variable_id = Column('VariableID', Integer, ForeignKey('Variables.VariableID'), nullable=False)
    offset_value = Column('OffsetValue', Float)
    offset_type_id = Column('OffsetTypeID', Integer, ForeignKey('OffsetTypes.OffsetTypeID'))
    censor_code = Column('CensorCode', String)
    qualifier_id = Column('QualifierID', Integer, ForeignKey('Qualifiers.QualifierID'))
    method_id = Column('MethodID', Integer, ForeignKey('Methods.MethodID'), nullable=False)
    source_id = Column('SourceID', Integer, ForeignKey('Sources.SourceID'), nullable=False)
    sample_id = Column('SampleID', Integer, ForeignKey('Samples.SampleID'))
    derived_from_id = Column('DerivedFromID', Integer)
    quality_control_level_id = Column('QualityControlLevelID', Integer,
                                      ForeignKey('QualityControlLevels.QualityControlLevelID'), nullable=False)

    # relationships
    site = relationship(Site)
    variable = relationship(Variable)
    method = relationship(Method)
    source = relationship(Source)
    quality_control_level = relationship(QualityControlLevel)

    qualifier = relationship(Qualifier)
    offset_type = relationship(OffsetType)
    sample = relationship(Sample)

    def list_repr(self):
        return [self.id, self.data_value, self.value_accuracy, self.local_date_time,
                self.utc_offset, self.date_time_utc, self.site_id, self.variable_id,
                self.offset_value, self.offset_type_id, self.censor_code, self.qualifier_id,
                self.method_id, self.source_id, self.sample_id, self.derived_from_id,
                self.quality_control_level_id]

    def __repr__(self):
        return "<DataValue('%s', '%s', '%s')>" % (self.data_value, self.local_date_time, self.value_accuracy)

def copy_series(from_series):
    new = Series()
    new.site_id = from_series.site_id
    new.site_code = from_series.site_code
    new.site_name = from_series.site_name
    new.variable_id = from_series.variable_id
    new.variable_code = from_series.variable_code
    new.variable_name = from_series.variable_name
    new.speciation = from_series.speciation
    new.variable_units_id = from_series.variable_units_id
    new.variable_units_name = from_series.variable_units_name
    new.sample_medium = from_series.sample_medium
    new.value_type = from_series.value_type
    new.time_support = from_series.time_support
    new.time_units_id = from_series.time_units_id
    new.time_units_name = from_series.time_units_name
    new.data_type = from_series.data_type
    new.general_category = from_series.general_category
    new.method_id = from_series.method_id
    new.method_description = from_series.method_description
    new.source_id = from_series.source_id
    new.organization = from_series.organization
    new.citation = from_series.citation
    new.quality_control_level_id = from_series.quality_control_level_id
    new.quality_control_level_code = from_series.quality_control_level_code
    new.begin_date_time = from_series.begin_date_time
    new.begin_date_time_utc = from_series.begin_date_time_utc
    new.end_date_time_utc = from_series.end_date_time_utc
    new.value_count = from_series.value_count
    return new
class Series(Base):
    __tablename__ = 'SeriesCatalog'

    id = Column('SeriesID', Integer, primary_key=True)
    site_id = Column('SiteID', Integer, ForeignKey('Sites.SiteID'), nullable=False)
    site_code = Column('SiteCode', String)
    site_name = Column('SiteName', String)
    variable_id = Column('VariableID', Integer, ForeignKey('Variables.VariableID'), nullable=False)
    variable_code = Column('VariableCode', String)
    variable_name = Column('VariableName', String)
    speciation = Column('Speciation', String)
    variable_units_id = Column('VariableUnitsID', Integer)
    variable_units_name = Column('VariableUnitsName', String)
    sample_medium = Column('SampleMedium', String)
    value_type = Column('ValueType', String)
    time_support = Column('TimeSupport', Float)
    time_units_id = Column('TimeUnitsID', Integer)
    time_units_name = Column('TimeUnitsName', String)
    data_type = Column('DataType', String)
    general_category = Column('GeneralCategory', String)
    method_id = Column('MethodID', Integer, ForeignKey('Methods.MethodID'), nullable=False)
    method_description = Column('MethodDescription', String)
    source_id = Column('SourceID', Integer, ForeignKey('Sources.SourceID'), nullable=False)
    source_description = Column('SourceDescription', String)
    organization = Column('Organization', String)
    citation = Column('Citation', String)
    quality_control_level_id = Column('QualityControlLevelID', Integer,
                                      ForeignKey('QualityControlLevels.QualityControlLevelID'), nullable=False)
    quality_control_level_code = Column('QualityControlLevelCode', String)
    begin_date_time = Column('BeginDateTime', DateTime)
    end_date_time = Column('EndDateTime', DateTime)
    begin_date_time_utc = Column('BeginDateTimeUTC', DateTime)
    end_date_time_utc = Column('EndDateTimeUTC', DateTime)
    value_count = Column('ValueCount', Integer)

    data_values = relationship("DataValue",
                               primaryjoin="and_(DataValue.site_id == Series.site_id, "
                                           "DataValue.variable_id == Series.variable_id, "
                                           "DataValue.method_id == Series.method_id, "
                                           "DataValue.source_id == Series.source_id, "
                                           "DataValue.quality_control_level_id == Series.quality_control_level_id)",
                               foreign_keys="[DataValue.site_id, DataValue.variable_id, DataValue.method_id, DataValue.source_id, DataValue.quality_control_level_id]",
                               order_by="DataValue.local_date_time",
                               backref="series")

    site = relationship(Site)
    variable = relationship(Variable)
    method = relationship(Method)
    source = relationship(Source)
    quality_control_level = relationship(QualityControlLevel)

    # TODO add all to repr
    def __repr__(self):
        return "<Series('%s')>" % (self.id)

    def get_table_columns(self):
        return self.__table__.columns.keys()

'''