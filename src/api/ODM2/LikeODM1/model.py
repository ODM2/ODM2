from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import column_property, relationship
from sqlalchemy import select, MetaData, Integer, String, Column, ForeignKey, DateTime, Float

Base = declarative_base()

metadata = MetaData()

################ODM 2 Tables###########
from ..models import Actions, ActionBy, Organizations, Affiliations, People, \
    SamplingFeatures, Results, Variables, Methods, TimeSeriesResults, \
    TimeSeriesResultValues, Sites, SpatialReferences, CVTerms, FeatureActions, ProcessingLevels

action_table = Actions()

# ###################################################################################
#                           Monitoring Site Locations
# ###################################################################################


class SpatialReference(Base):
    __tablename__ = 'SpatialReferences'
    __table_args__ = {u'schema': 'ODM2'}

    id = Column('SpatialReferenceID', Integer, primary_key=True)
    srs_id = Column('SRSID', String)
    srs_name = Column('SRSName', String)
    is_geographic = None
    #is_geographic = Column('IsGeographic', Boolean)
    notes = Column('Description', String)

    def __repr__(self):
        return "<SpatialReference('%s', '%s')>" % (self.id, self.srs_name)

sf_table = SamplingFeatures().__table__
site_table = Sites().__table__
site_join = site_table.join(sf_table, site_table.c.SamplingFeatureID == sf_table.c.SamplingFeatureID)
class Site(Base):
    __tablename__ = u'Sites'
    __table__ = site_join

    id = site_join.c.ODM2_Sites_SamplingFeatureID
    code = site_join.c.ODM2_SamplingFeatures_SamplingFeatureCode
    name = site_join.c.ODM2_SamplingFeatures_SamplingFeatureName
    latitude = site_join.c.ODM2_Sites_Latitude
    longitude = site_join.c.ODM2_Sites_Longitude
    lat_long_datum_id = site_join.c.ODM2_Sites_SpatialReferenceID # ._clone().foreign_keys = ForeignKey("SpatialReference.id")#, Integer, ForeignKey("SpatialReference.id"))#column_property(site_table.c.LatLonDatumID, ForeignKey('SpatialReference.id'))
    elevation_m = site_join.c.ODM2_SamplingFeatures_Elevation_m
    vertical_datum_id = site_join.c.ODM2_SamplingFeatures_ElevationDatumCV

    local_x = None
    local_y = None
    local_projection_id = None#Column('LocalProjectionID', Integer, ForeignKey('SpatialReferences.SpatialReferenceID'))
    pos_accuracy_m = None
    state = None
    county = None
    comments = None



    # relationships
    # TODO @sreeder, Please take a look at this line as it throws: sqlalchemy.exc.InvalidRequestError: Class <class 'ODM2.LikeODM1.model.Site2'> does not have a mapped column named 'lat_long_datum_id'
    # :)
    #spatial_ref = relationship(SpatialReference, primaryjoin=("SpatialReference.id==Site2.lat_long_datum_id"))
    #spatial_ref = relationship(SpatialReference)
    #spatial_ref = relationship(SpatialReference, primaryjoin="Site.lat_long_datum_id == SpatialReference.id")


    def __repr__(self):
        return "<Site('%s', '%s')>" % (self.code, self.name)

# ###################################################################################
#                            Units
# ###################################################################################

class Unit(Base):
    __tablename__ = u'Units'
    __table_args__ = {u'schema': 'ODM2'}

    id = Column('UnitsID', Integer, primary_key=True)
    name = Column('UnitsName', String)
    type = Column('UnitsTypeCV', String)
    abbreviation = Column('UnitsAbbreviation', String)

    def __repr__(self):
        return "<Unit('%s', '%s', '%s', '%s')>" % (self.id, self.name, self.type, self.abbreviation)

# ###################################################################################
#                            Variables
# ###################################################################################

"""Requires joining with Variable, Result, and Timeseriesresult to build Variable for ODM1_1_1"""
variables_table = Variables().__table__
ts_table = TimeSeriesResults().__table__

result_table = Results().__table__
result_aliased_table = select([
    result_table.c.ResultID.label("RID"),
    result_table.c.UnitsID,
    result_table.c.VariableID,
    result_table.c.SampledMediumCV,

]).alias("ODM2_Aliased")

ts_join = result_aliased_table.join(ts_table, result_aliased_table.c.RID == ts_table.c.ResultID)
variable_join = ts_join.join(variables_table, variables_table.c.VariableID == ts_join.c.ODM2_Aliased_RID)

class Variable(Base):
    __table__ = variable_join
    __tablename__ = u'Variables'

    id = variable_join.c.ODM2_Variables_VariableID                                            # Column('VariableID', Integer, primary_key=True)
    code = variable_join.c.ODM2_Variables_VariableCode                                        # Column('VariableCode', String, nullable=False)
    name = variable_join.c.ODM2_Variables_VariableNameCV                                      # Column('VariableNameCV', String, nullable=False)
    speciation = variable_join.c.ODM2_Variables_SpeciationCV                                  # Column('SpeciationCV', String, nullable=False)
    no_data_value = variable_join.c.ODM2_Variables_NoDataValue                                # Column('NoDataValue', Float, nullable=False)

    variable_unit_id = variable_join.c.ODM2_Aliased_UnitsID                                   # Column('VariableUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
    sample_medium = variable_join.c.ODM2_Aliased_SampledMediumCV                              # Column('ODM2_Results_UnitsID', String, nullable=False)
    value_type = variable_join.c.ODM2_Variables_VariableTypeCV                                # Column('ValueType', String, nullable=False)
    is_regular = None                                                                   # Column('IsRegular', Boolean, nullable=False)
    time_support = variable_join.c.ODM2_TimeSeriesResults_IntendedTimeSpacing                 # Column('TimeSupport', Float, nullable=False)
    time_unit_id = variable_join.c.ODM2_TimeSeriesResults_IntendedTimeSpacingUnitsID          # Column('TimeUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
    data_type = variable_join.c.ODM2_TimeSeriesResults_AggregationStatisticCV                 # Column('DataType', String, nullable=False)
    general_category = None                                                             # Column('GeneralCategory', String, nullable=False)

    """
    # relationships
    variable_unit = relationship(Unit, primaryjoin=(
    "Unit.id==Variable.variable_unit_id"))  # <-- Uses class attribute names, not table column names
    time_unit = relationship(Unit, primaryjoin=("Unit.id==Variable.time_unit_id"))
    """
    def __repr__(self):
        return "<Variable('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')>" % \
               (self.id, self.code, self.name, self.speciation, self.no_data_value, self.variable_unit_id,
               self.sample_medium, self.value_type, self.time_support, self.time_unit_id, self.data_type)


# ###################################################################################
#                            Data Sources
# ###################################################################################

people_table = People().__table__
affiliation_table = Affiliations().__table__
organization_table = Organizations().__table__

result_aliased_table = select([
    people_table.c.PersonID.label("PID"),
    people_table.c.PersonFirstName,
    people_table.c.PersonMiddleName,
    people_table.c.PersonLastName,
]).alias("ODM2_Aliased")

affiliation_join = result_aliased_table.join(affiliation_table, affiliation_table.c.AffiliationID == result_aliased_table.c.PID)
source_join = affiliation_join.join(organization_table, affiliation_join.c.ODM2_Affiliations_OrganizationID == organization_table.c.OrganizationID)

class Source(Base):
    __table__ = source_join
    __tablename__ = u'Data Sources'
    __table_args__ = {u'schema': u'ODM2'}

    id = source_join.c.ODM2_Affiliations_AffiliationID                      # Column('OrganizationID', Integer, primary_key=True)
    organization = source_join.c.ODM2_Affiliations_OrganizationID           # Column('OrganizationName', String, nullable=False)
    description = source_join.c.ODM2_Organizations_OrganizationDescription  # Column('OrganizationDescription', String, nullable=False)
    link = source_join.c.ODM2_Organizations_OrganizationLink                # Column('OrganizationLink', String)

    first_name = source_join.c.ODM2_Aliased_PersonFirstName
    middle_name = source_join.c.ODM2_Aliased_PersonMiddleName
    last_name = source_join.c.ODM2_Aliased_PersonLastName
    # this doesnt work...
    # contact_name = column_property(first_name + " " + middle_name + " " + last_name)
    contact_name = column_property(first_name + " " + last_name)

    phone = source_join.c.ODM2_Affiliations_PrimaryPhone                    # Column('Phone', String, nullable=False)
    email = source_join.c.ODM2_Affiliations_PrimaryEmail                    # Column('Email', String, nullable=False)
    address = source_join.c.ODM2_Affiliations_PrimaryAddress                # Column('Address', String, nullable=False)
    city = "Unknown"                                                   # Column('City', String, nullable=False)
    state = "Unknown"                                                  # Column('State', String, nullable=False)
    zip_code = "Unknown"                                               # Column('ZipCode', String, nullable=False)
    citation = "Not specified"
    #iso_metadata_id = Column('MetadataID', Integer, ForeignKey('ODM2.ISOMetadata.MetadataID'), nullable=False)

    # relationships
    #iso_metadata = relationship(ISOMetadata)

    def __repr__(self):
        return "<Source('%s', '%s', '%s', '%s', '%s', '%s', '%s')>" % \
               (self.id, self.contact_name, self.first_name, self.last_name,
                self.phone, self.organization, self.description)

class ISOMetadata(Base):
    __tablename__ = 'ISOMetadata'

    id = Column('MetadataID', Integer, primary_key=True)
    topic_category = Column('TopicCategory', String, nullable=False)
    title = Column('Title', String, nullable=False)
    abstract = Column('Abstract', String, nullable=False)
    profile_version = Column('ProfileVersion', String, nullable=False)
    metadata_link = Column('MetadataLink', String)

    def __repr__(self):
        return "<ISOMetadata('%s', '%s', '%s')>" % (self.id, self.topic_category, self.title)

# ###################################################################################
#                            Data Collection Methods
# ###################################################################################

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

class Method(Base):
    # __table__ = method_tabl
    __tablename__ = 'Methods'
    __table_args__ = {u'schema': 'ODM2'}

    id=Column('MethodID', Integer, primary_key=True)
    description= Column('MethodDescription', String, nullable=False)
    link=Column('MethodLink', String)

    def __repr__(self):
        return "<Method('%s', '%s', '%s')>" % (self.id, self.description, self.link)

# ###################################################################################
#                            ODMVersion
# ###################################################################################
class ODMVersion:
    #__tablename__ = 'ODMVersion'

    #version_number = Column('VersionNumber', String, primary_key=True)
    version_number = 2

    def __repr__(self):
        return "<ODMVersion('%s')>" % (self.version_number)

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


class QualityControlLevel(Base):
    __tablename__ = u'ProcessingLevels'
    __table_args__ = {u'schema': u'ODM2'}

    id = Column('ProcessingLevelID', Integer, primary_key=True)
    code = Column('ProcessingLevelCode', String, nullable=False)
    definition = Column('Definition', String, nullable=False)
    explanation = Column('Explanation', String, nullable=False)

    def __repr__(self):
        return "<QualityControlLevel('%s', '%s', '%s', '%s')>" % (self.id, self.code, self.definition, self.explanation)


timeseriesresultvalues_table = TimeSeriesResultValues.__table__
# timeseriesresults_table = TimeSeriesResults.__table__
feature_action_table = FeatureActions.__table__
result_table = Results.__table__
action_table = Actions.__table__
action_by_table = ActionBy.__table__

result_aliased_table = select([
    result_table.c.ResultID.label("RID"),
    result_table.c.UnitsID,
    result_table.c.VariableID,
    result_table.c.SampledMediumCV,
    result_table.c.FeatureActionID.label("FAID"),
    result_table.c.ProcessingLevelID,
    result_table.c.ValueCount,


]).alias("ODM2_RESULT_Aliased")

action_aliased_table = select([
    action_table.c.ActionID.label("AID"),
    action_table.c.MethodID,

]).alias("ODM2_ACTION_ALIASED")

action_by_aliased_table = select([
    action_by_table.c.ActionID.label("ABID"),
    action_by_table.c.AffiliationID,

]).alias("ODM2_ACTION_BY_ALIASED")

joined_table = timeseriesresultvalues_table.join(result_aliased_table, timeseriesresultvalues_table.c.ResultID ==
                                                 result_aliased_table.c.RID)
joined_table = joined_table.join(feature_action_table, feature_action_table.c.FeatureActionID == result_aliased_table.c.FAID)
joined_table = joined_table.join(action_aliased_table, feature_action_table.c.ActionID == action_aliased_table.c.AID)
joined_table = joined_table.join(action_by_aliased_table, action_aliased_table.c.AID == action_by_aliased_table.c.ABID)


class DataValue(Base):
    # __tablename__ = 'DataValues'
    __table__ = joined_table

    id = joined_table.c.ODM2_TimeSeriesResultValues_ValueID
    data_value = joined_table.c.ODM2_TimeSeriesResultValues_DataValue
    value_accuracy = None ## question for jeff
    local_date_time = joined_table.c.ODM2_TimeSeriesResultValues_ValueDateTime
    utc_offset = joined_table.c.ODM2_TimeSeriesResultValues_ValueDateTimeUTCOffset
    date_time_utc = None ## column propertly datetimeutcoffset
    site_id = joined_table.c.ODM2_FeatureActions_SamplingFeatureID
    variable_id = joined_table.c.ODM2_RESULT_Aliased_VariableID
    offset_value = None ## Question for jeff
    offset_type_id = None ## Question for Jeff
    censor_code = joined_table.c.ODM2_TimeSeriesResultValues_CensorCodeCV
    qualifier_id = None ## Join with annotations..
    method_id = joined_table.c.ODM2_ACTION_ALIASED_MethodID
    source_id = joined_table.c.ODM2_ACTION_BY_ALIASED_AffiliationID
    sample_id = site_id ## Question for jeff
    derived_from_id = None
    quality_control_level_id = joined_table.c.ODM2_TimeSeriesResultValues_QualityCodeCV

    # relationships
    # site = relationship(Site)
    # variable = relationship(Variable)
    # method = relationship(Method)
    # source = relationship(Source)
    # quality_control_level = relationship(QualityControlLevel)
    #
    # qualifier = relationship(Qualifier)
    # offset_type = relationship(OffsetType)
    # sample = relationship(Sample)

    def list_repr(self):
        return [self.id, self.data_value, self.value_accuracy, self.local_date_time,
                self.utc_offset, self.date_time_utc, self.site_id, self.variable_id,
                self.offset_value, self.offset_type_id, self.censor_code, self.qualifier_id,
                self.method_id, self.source_id, self.sample_id, self.derived_from_id,
                self.quality_control_level_id]

    # def __repr__(self):
    #     return "<DataValue('%s', '%s', '%s')>" % (self.id, self.data_value, self.local_date_time, self.value_accuracy)
    #
    def __repr__(self):
        return "<DataValue(%s)>" % ', '.join([str(x) for x in self.list_repr()])


method_table = Methods().__table__
processing_levels_table = ProcessingLevels().__table__


joined_table = feature_action_table.join(result_aliased_table, result_table.c.FeatureActionID == feature_action_table.c.FeatureActionID)
joined_table = joined_table.join(site_join, site_join.c.ODM2_Sites_SamplingFeatureID == joined_table.c.ODM2_FeatureActions_SamplingFeatureID)
joined_table = joined_table.join(variable_join, joined_table.c.ODM2_RESULT_Aliased_RID == variable_join.c.ODM2_Aliased_RID)

# Obtaining Action
joined_table = joined_table.join(action_table, joined_table.c.ODM2_FeatureActions_ActionID == action_table.c.ActionID)

# Obtaining Method
joined_table = joined_table.join(method_table, joined_table.c.ODM2_Actions_MethodID == method_table.c.MethodID)

# Obtaining Source
joined_table = joined_table.join(action_by_table, joined_table.c.ODM2_Actions_ActionID == action_by_table.c.ActionID)
joined_table = joined_table.join(source_join, joined_table.c.ODM2_ActionBy_AffiliationID == source_join.c.ODM2_Affiliations_AffiliationID)

# Obtaining Processing Level
joined_table = joined_table.join(processing_levels_table, joined_table.c.ODM2_RESULT_Aliased_ProcessingLevelID == processing_levels_table.c.ProcessingLevelID)


class Series:
    pass
#
# class Series(Base):
#     # __tablename__ = 'SeriesCatalog'
#     __table__ = joined_table
#
#     id = joined_table.c.ODM2_RESULT_Aliased_RID
#     site_id = joined_table.c.ODM2_Sites_SamplingFeatureID
#     site_code = joined_table.c.ODM2_SamplingFeatures_SamplingFeatureCode
#     site_name = joined_table.c.ODM2_SamplingFeatures_SamplingFeatureName
#     variable_id = joined_table.c.ODM2_RESULT_Aliased_VariableID
#     variable_code = joined_table.c.ODM2_Variables_VariableCode
#     variable_name = joined_table.c.ODM2_Variables_VariableNameCV
#     speciation = joined_table.c.ODM2_Variables_SpeciationCV
#     variable_units_id = joined_table.c.ODM2_Aliased_UnitsID
#     variable_units_name = None #joined_table.c.
#     sample_medium = joined_table.c.ODM2_RESULT_Aliased_SampledMediumCV
#     value_type = joined_table.c.ODM2_Variables_VariableTypeCV
#     time_support = joined_table.c.ODM2_TimeSeriesResults_IntendedTimeSpacing                 # Column('TimeSupport', Float, nullable=False)
#     time_unit_id = joined_table.c.ODM2_TimeSeriesResults_IntendedTimeSpacingUnitsID          # Column('TimeUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
#     data_type = joined_table.c.ODM2_TimeSeriesResults_AggregationStatisticCV
#     time_units_name = None # join with units
#     general_category = None
#     method_id = joined_table.c.ODM2_Methods_MethodID
#     method_description = joined_table.c.ODM2_Methods_MethodDescription
#     source_id = joined_table.c.ODM2_Affiliations_AffiliationID
#     description = joined_table.c.ODM2_Organizations_OrganizationDescription  # Column('OrganizationDescription', String, nullable=False)
#     link = joined_table.c.ODM2_Organizations_OrganizationLink
#     citation = None # please calculate
#     quality_control_level_id = joined_table.c.ODM2_ProcessingLevels_ProcessingLevelID
#     quality_control_level_code = joined_table.c.ODM2_ProcessingLevels_ProcessingLevelCode
#     begin_date_time = joined_table.c.ODM2_Actions_BeginDateTime
#     end_date_time = joined_table.c.ODM2_Actions_EndDateTime
#     begin_date_time_utc = None #Column('BeginDateTimeUTC', DateTime)
#     end_date_time_utc = None #Column('EndDateTimeUTC', DateTime)
#     value_count = joined_table.c.ODM2_RESULT_Aliased_ValueCount
#
#     # data_values = relationship("DataValue",
#     #                            primaryjoin="and_(DataValue.site_id == Series.site_id, "
#     #                                        "DataValue.variable_id == Series.variable_id, "
#     #                                        "DataValue.method_id == Series.method_id, "
#     #                                        "DataValue.source_id == Series.source_id, "
#     #                                        "DataValue.quality_control_level_id == Series.quality_control_level_id)",
#     #                            foreign_keys="[DataValue.site_id, DataValue.variable_id, DataValue.method_id, DataValue.source_id, DataValue.quality_control_level_id]",
#     #                            order_by="DataValue.local_date_time",
#     #                            backref="series")
#     #
#     # site = relationship(Site)
#     # variable = relationship(Variable)
#     # method = relationship(Method)
#     # source = relationship(Source)
#     # quality_control_level = relationship(QualityControlLevel)
#
#     # TODO add all to repr
#     def __repr__(self):
#         return "<Series('%s')>" % (self.id)
#
#     def get_table_columns(self):
#         return self.__table__.columns.keys()
#
