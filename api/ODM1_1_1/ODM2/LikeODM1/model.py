from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import column_property

Base = declarative_base()

from sqlalchemy import *
from sqlalchemy.orm import relationship
from sqlalchemy import String, Column
from sqlalchemy.dialects.mssql.base import BIT, UNIQUEIDENTIFIER
from sqlalchemy.types import NullType

metadata = MetaData()



class Unit(Base):
    __tablename__ = 'Units'
    __table_args__ = {u'schema': 'ODM2Core'}

    id = Column('UnitsID', Integer, primary_key=True)
    name = Column('UnitsName', String)
    type = Column('UnitsTypeCV', String)
    abbreviation = Column('UnitsAbbreviation', String(convert_unicode=True))

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
class ODMVersion(Base):
    __tablename__ = 'ODMVersion'

    version_number = Column('VersionNumber', String, primary_key=True)

    def __repr__(self):
        return "<ODMVersion('%s')>" % (self.version_number)



class SpatialReference(Base):
    __tablename__ = 'SpatialReferences'
    __table_args__ = {u'schema': 'ODM2Core'}

    id = Column('SpatialReferenceID', Integer, primary_key=True)
    srs_id = Column('SRSID', String)
    srs_name = Column('SRSName', String)
    #is_geographic = Column('IsGeographic', Boolean)
    notes = Column('Description', String)

    def __repr__(self):
        return "<SpatialReference('%s', '%s')>" % (self.id, self.srs_name)

class CensorCodeCV(Base):
    __tablename__ = 'CensorCodeCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<CensorCodeCV('%s', '%s')>" % (self.term, self.definition)

class DataTypeCV(Base):
    __tablename__ = 'DataTypeCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<DataTypeCV('%s', '%s')>" % (self.term, self.definition)  # Declare a mapped class

class GeneralCategoryCV(Base):
    __tablename__ = 'GeneralCategoryCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<GeneralCategoryCV('%s', '%s')>" % (self.term, self.definition)

class SampleMediumCV(Base):
    __tablename__ = 'SampleMediumCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<SampleMedium('%s', '%s')>" % (self.term, self.definition)

class SampleTypeCV(Base):
    __tablename__ = 'SampleTypeCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<SampleTypeCV('%s', '%s')>" % (self.term, self.definition)

class SiteTypeCV(Base):
    __tablename__ = 'SiteTypeCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<SiteTypeCV('%s', '%s')>" % (self.term, self.definition)

class SpeciationCV(Base):
    __tablename__ = 'SpeciationCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<SpeciationCV('%s', '%s')>" % (self.term, self.definition)

class TopicCategoryCV(Base):
    __tablename__ = 'TopicCategoryCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<TopicCategoryCV('%s', '%s')>" % (self.term, self.definition)

class ValueTypeCV(Base):
    __tablename__ = 'ValueTypeCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<ValueTypeCV('%s', '%s')>" % (self.term, self.definition)

class VariableNameCV(Base):
    __tablename__ = 'VariableNameCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<VariableNameCV('%s', '%s')>" % (self.term, self.definition)

class VerticalDatumCV(Base):
    __tablename__ = 'VerticalDatumCV'

    term = Column('Term', String, primary_key=True)
    definition = Column('Definition', String)

    def __repr__(self):
        return "<VerticalDatumCV('%s', '%s')>" % (self.term, self.definition)

class Sample(Base):
    __tablename__ = 'Samples'

    id = Column('SampleID', Integer, primary_key=True)
    type = Column('SampleType', String, nullable=False)
    lab_sample_code = Column('LabSampleCode', String, nullable=False)
    lab_method_id = Column('LabMethodID', Integer, ForeignKey('LabMethods.LabMethodID'), nullable=False)

    # relationships
    #lab_method = relationship(LabMethod)

    def __repr__(self):
        return "<Sample('%s', '%s', '%s', '%s')>" % (self.id, self.type, self.lab_sample_code, self.lab_method_id)

class Qualifier(Base):
    __tablename__ = u'Annotations'
    __table_args__ = {u'schema': u'ODM2Annotations'}

    id = Column('AnnotationID', Integer, primary_key=True)
    code = Column('AnnotationCode', String, nullable=False)
    description = Column('AnnotationText', String, nullable=False)

    def __repr__(self):
        return "<Qualifier('%s', '%s', '%s')>" % (self.id, self.code, self.description)

class OffsetType(Base):
    #TODO Table no longer exists
    __tablename__ = u'TimeSeriesResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    id = Column('OffsetTypeID', Integer, primary_key=True)
    unit_id = Column('ZLocationUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
    description = Column('OffsetDescription', String)

    # relationships
    unit = relationship(Unit)

    def __repr__(self):
        return "<Unit('%s', '%s', '%s')>" % (self.id, self.unit_id, self.description)

class Method(Base):
    __tablename__ = u'Methods'
    __table_args__ = {u'schema': u'ODM2Core'}

    id = Column('MethodID', Integer, primary_key=True)
    description = Column('MethodDescription', String, nullable=False)
    link = Column('MethodLink', String)

    def __repr__(self):
        return "<Method('%s', '%s', '%s')>" % (self.id, self.description, self.link)

class QualityControlLevel(Base):
    __tablename__ = u'ProcessingLevels'
    __table_args__ = {u'schema': u'ODM2Core'}

    id = Column('ProcessingLevelID', Integer, primary_key=True)
    code = Column('ProcessingLevelCode', String, nullable=False)
    definition = Column('Definition', String, nullable=False)
    explanation = Column('Explanation', String, nullable=False)

    def __repr__(self):
        return "<QualityControlLevel('%s', '%s', '%s', '%s')>" % (self.id, self.code, self.definition, self.explanation)

class Source(Base):
    __tablename__ = u'Organizations'
    __table_args__ = {u'schema': u'ODM2Core'}

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
    iso_metadata_id = Column('MetadataID', Integer, ForeignKey('ISOMetadata.MetadataID'), nullable=False)

    # relationships
    #iso_metadata = relationship(ISOMetadata)

    def __repr__(self):
        return "<Source('%s', '%s', '%s')>" % (self.id, self.organization, self.description)

class Site(Base):
    #ToDO join Sampling feature and sites
    __tablename__ = u'Sites'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    id = Column('SamplingFeatureID', Integer, primary_key=True)
    code = Column('SiteCode', String)
    name = Column('SiteName', String)
    latitude = Column('Latitude', Float)
    longitude = Column('Longitude', Float)
    lat_long_datum_id = Column('LatLongDatumID', Integer, ForeignKey('SpatialReferences.SpatialReferenceID'))
    elevation_m = Column('Elevation_m', Float)
    vertical_datum_id = Column('VerticalDatum', Integer)
    local_x = Column('LocalX', Float)
    local_y = Column('LocalY', Float)
    local_projection_id = Column('LocalProjectionID', Integer, ForeignKey('SpatialReferences.SpatialReferenceID'))
    pos_accuracy_m = Column('PosAccuracy_m', Float)
    state = Column('State', String)
    county = Column('County', String)
    comments = Column('Comments', String)

    type = Column('SiteTypeCV', String)

    # relationships
    spatial_ref = relationship(SpatialReference, primaryjoin=("SpatialReference.id==Site.lat_long_datum_id"))
    local_spatial_ref = relationship(SpatialReference, primaryjoin=("SpatialReference.id==Site.local_projection_id"))

    def __init__(self, site_code, site_name):
        self.code = site_code
        self.name = site_name

    def __repr__(self):
        return "<Site('%s', '%s')>" % (self.code, self.name)

class Variable(Base):
    #TODO join with Result
    _tablename__ = u'Variables'
    __table_args__ = {u'schema': u'ODM2Core'}

    id = Column('VariableID', Integer, primary_key=True)
    code = Column('VariableCode', String, nullable=False)
    name = Column('VariableNameCV', String, nullable=False)
    speciation = Column('SpeciationCV', String, nullable=False)
    no_data_value = Column('NoDataValue', Float, nullable=False)



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


################ODM 2 TAbles###########

class Action(Base):
    __tablename__ = u'Actions'
    __table_args__ = {u'schema': u'ODM2Core'}

    ActionID = Column(Integer, primary_key=True)
    ActionTypeCV = Column(String(255), nullable=False)
    MethodID = Column(ForeignKey('ODM2Core.Methods.MethodID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    BeginDateTimeUTCOffset = Column(Integer, nullable=False)
    EndDateTime = Column(DateTime)
    EndDateTimeUTCOffset = Column(Integer)
    ActionDescription = Column(String(500))
    ActionFileLink = Column(String(255))

    Method = relationship(u'Method')

class Organization(Base):
    __tablename__ = u'Organizations'
    __table_args__ = {u'schema': u'ODM2Core'}

    OrganizationID = Column(Integer, primary_key=True)
    OrganizationTypeCV = Column(String(255), nullable=False)
    OrganizationCode = Column(String(50), nullable=False)
    OrganizationName = Column(String(255), nullable=False)
    OrganizationDescription = Column(String(500))
    OrganizationLink = Column(String(255))
    ParentOrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))

    parent = relationship(u'Organization', remote_side=[OrganizationID])



class Affiliation(Base):
    __tablename__ = u'Affiliations'
    __table_args__ = {u'schema': u'ODM2Core'}

    AffiliationID = Column(Integer, primary_key=True)
    PersonID = Column(ForeignKey('ODM2Core.People.PersonID'), nullable=False)
    OrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))
    IsPrimaryOrganizationContact = Column(BIT)
    AffiliationStartDate = Column(Date, nullable=False)
    AffiliationEndDate = Column(Date)
    PrimaryPhone = Column(String(50))
    PrimaryEmail = Column(String(255), nullable=False)
    PrimaryAddress = Column(String(255))
    PersonLink = Column(String(255))

    Organization = relationship(u'Organization')
    Person = relationship(u'Person')

class Person(Base):
    __tablename__ = u'People'
    __table_args__ = {u'schema': u'ODM2Core'}

    PersonID = Column(Integer, primary_key=True)
    PersonFirstName = Column(String(255), nullable=False)
    PersonMiddleName = Column(String(255))
    PersonLastName = Column(String(255), nullable=False)

class Samplingfeature(Base):
    __tablename__ = u'SamplingFeatures'
    __table_args__ = {u'schema': u'ODM2Core'}

    SamplingFeatureID = Column(Integer, primary_key=True)
    SamplingFeatureTypeCV = Column(String(255), nullable=False)
    SamplingFeatureCode = Column(String(50), nullable=False)
    SamplingFeatureName = Column(String(255))
    SamplingFeatureDescription = Column(String(500))
    SamplingFeatureGeotypeCV = Column(String(255))
    Elevation_m = Column(Float(53))
    ElevationDatumCV = Column(String(255))
    FeatureGeometry = Column(NullType)

class Result(Base):
    __tablename__ = u'Results'
    __table_args__ = {u'schema': u'ODM2Core'}

    ResultID = Column(BigInteger, primary_key=True)
    ResultUUID = Column(UNIQUEIDENTIFIER, nullable=False)
    FeatureActionID = Column(ForeignKey('ODM2Core.FeatureActions.FeatureActionID'), nullable=False)
    ResultTypeCV = Column(ForeignKey('ODM2Results.ResultTypeCV.ResultTypeCV'), nullable=False)
    VariableID = Column(ForeignKey('ODM2Core.Variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2Core.TaxonomicClassifiers.TaxonomicClassifierID'))
    ProcessingLevelID = Column(ForeignKey('ODM2Core.ProcessingLevels.ProcessingLevelID'), nullable=False)
    ResultDateTime = Column(DateTime)
    ResultDateTimeUTCOffset = Column(BigInteger)
    ValidDateTime = Column(DateTime)
    ValidDateTimeUTCOffset = Column(BigInteger)
    StatusCV = Column(String(255))
    SampledMediumCV = Column(String(255), nullable=False)
    ValueCount = Column(Integer, nullable=False)
    IntendedObservationSpacing = Column(String(255))

    FeatureAction = relationship(u'Featureaction')
    ProcessingLevel = relationship(u'Processinglevel')
    ResultTypeCV1 = relationship(u'Resulttypecv')
    TaxonomicClassifier = relationship(u'Taxonomicclassifier')
    Unit = relationship(u'Unit')
    Variable = relationship(u'Variable')

class Timeseriesresult(Result):
    __tablename__ = u'TimeSeriesResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    AggregationStatisticCV = Column(String(255), nullable=False)

    Unit = relationship(u'Unit', primaryjoin='Timeseriesresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    SpatialReference = relationship(u'Spatialreference')
    Unit1 = relationship(u'Unit', primaryjoin='Timeseriesresult.XLocationUnitsID == Unit.UnitsID')
    Unit2 = relationship(u'Unit', primaryjoin='Timeseriesresult.YLocationUnitsID == Unit.UnitsID')
    Unit3 = relationship(u'Unit', primaryjoin='Timeseriesresult.ZLocationUnitsID == Unit.UnitsID')


class Site(Samplingfeature):
    __tablename__ = u'Sites'
    __table_args__ = {u'schema': 'ODM2SamplingFeatures'}

    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), primary_key=True)
    SiteTypeCV = Column(String(255), nullable=False)
    Latitude = Column(Float(53), nullable=False)
    Longitude = Column(Float(53), nullable=False)
    LatLonDatumID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'), nullable=False)

    SpatialReference = relationship(u'Spatialreference')

class Variable(Base):
    __tablename__ = u'Variables'
    __table_args__ = {u'schema': u'ODM2Core'}

    VariableID = Column(Integer, primary_key=True)
    VariableTypeCV = Column(String(255), nullable=False)
    VariableCode = Column(String(50), nullable=False)
    VariableNameCV = Column(String(255), nullable=False)
    VariableDefinition = Column(String(500))
    SpeciationCV = Column(String(255))
    NoDataValue = Column(Float(53), nullable=False)



organization_table =Table()
people_table = Person()
sampling_feature_table = Samplingfeature()
site_table =Site()
variables_table =Variable()
result_table =Result()
affiliation_table=Affiliation()
ts_result_table=Timeseriesresult()
action_table=Action()


source_join = join(people_table, affiliation_table)
