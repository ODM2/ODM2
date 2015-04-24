from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import column_property, relationship
from sqlalchemy import select, MetaData, Integer, String, Column, ForeignKey, DateTime, Float

Base = declarative_base()

metadata = MetaData()

################ODM 2 Tables###########
from ..models import Actions, ActionBy, Organizations, Affiliations, People, \
    SamplingFeatures, Results, Variables, Methods, TimeSeriesResults, \
    TimeSeriesResultValues, Sites, SpatialReferences, FeatureActions, ProcessingLevels

action_table = Actions()

# ###################################################################################
#                           Monitoring Site Locations
# ###################################################################################


class SpatialReference(Base):
    __tablename__ = u'spatialreferences'
    __table_args__ = {u'schema': 'odm2'}

    id = Column('spatialreferenceid', Integer, primary_key=True)
    srs_id = Column('srsid', String)
    srs_name = Column('srsName', String)
    is_geographic = None
    #is_geographic = Column('IsGeographic', Boolean)
    notes = Column('description', String)

    def __repr__(self):
        return "<SpatialReference('%s', '%s')>" % (self.id, self.srs_name)

sf_table = SamplingFeatures().__table__
site_table = Sites().__table__
site_join = site_table.join(sf_table, site_table.c.samplingfeatureid == sf_table.c.samplingfeatureid)
class Site(Base):
    __tablename__ = u'sites'
    __table__ = site_join

    id = site_join.c.odm2_sites_samplingfeatureid
    code = site_join.c.odm2_samplingfeatures_samplingfeaturecode
    name = site_join.c.odm2_samplingfeatures_samplingfeaturename
    latitude = site_join.c.odm2_sites_latitude
    longitude = site_join.c.odm2_sites_longitude
    lat_long_datum_id = site_join.c.odm2_sites_spatialreferenceid # ._clone().foreign_keys = ForeignKey("SpatialReference.id")#, Integer, ForeignKey("SpatialReference.id"))#column_property(site_table.c.LatLonDatumID, ForeignKey('SpatialReference.id'))
    elevation_m = site_join.c.odm2_samplingfeatures_elevation_m
    vertical_datum_id = site_join.c.odm2_samplingfeatures_elevationdatumcv

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
    __tablename__ = u'units'
    __table_args__ = {u'schema': 'odm2'}

    id = Column('unitsid', Integer, primary_key=True)
    name = Column('unitsname', String)
    type = Column('unitstypecv', String)
    abbreviation = Column('unitsabbreviation', String)

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
    result_table.c.resultid.label("RID"),
    result_table.c.unitsid,
    result_table.c.variableid,
    result_table.c.sampledmediumcv,

]).alias("ODM2_Aliased")

ts_join = result_aliased_table.join(ts_table, result_aliased_table.c.RID == ts_table.c.resultid)
variable_join = ts_join.join(variables_table, variables_table.c.variableid == ts_join.c.ODM2_Aliased_RID)

class Variable(Base):
    __table__ = variable_join
    __tablename__ = u'variables'

    id = variable_join.c.odm2_variables_variableid                                            # Column('VariableID', Integer, primary_key=True)
    code = variable_join.c.odm2_variables_variablecode                                        # Column('VariableCode', String, nullable=False)
    name = variable_join.c.odm2_variables_variablenamecv                                      # Column('VariableNameCV', String, nullable=False)
    speciation = variable_join.c.odm2_variables_speciationcv                                  # Column('SpeciationCV', String, nullable=False)
    no_data_value = variable_join.c.odm2_variables_nodatavalue                                # Column('NoDataValue', Float, nullable=False)

    variable_unit_id = variable_join.c.ODM2_Aliased_unitsid                                   # Column('VariableUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
    sample_medium = variable_join.c.ODM2_Aliased_sampledmediumcv                            # Column('ODM2_Results_UnitsID', String, nullable=False)
    value_type = variable_join.c.odm2_variables_variabletypecv                                # Column('ValueType', String, nullable=False)
    is_regular = None                                                                   # Column('IsRegular', Boolean, nullable=False)
    time_support = variable_join.c.odm2_timeseriesresults_intendedtimespacing                 # Column('TimeSupport', Float, nullable=False)
    time_unit_id = variable_join.c.odm2_timeseriesresults_intendedtimespacingunitsid          # Column('TimeUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
    data_type = variable_join.c.odm2_timeseriesresults_aggregationstatisticcv                 # Column('DataType', String, nullable=False)
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
    people_table.c.personid.label("PID"),
    people_table.c.personfirstname,
    people_table.c.personmiddlename,
    people_table.c.personlastname,
]).alias("ODM2_Aliased")

affiliation_join = result_aliased_table.join(affiliation_table, affiliation_table.c.affiliationid == result_aliased_table.c.PID)
source_join = affiliation_join.join(organization_table, affiliation_join.c.odm2_affiliations_organizationid == organization_table.c.organizationid)

class Source(Base):
    __table__ = source_join
    __tablename__ = u'datasources'
    __table_args__ = {u'schema': u'odm2'}

    id = source_join.c.odm2_affiliations_affiliationid                      # Column('OrganizationID', Integer, primary_key=True)
    organization = source_join.c.odm2_affiliations_organizationid           # Column('OrganizationName', String, nullable=False)
    description = source_join.c.odm2_organizations_organizationdescription  # Column('OrganizationDescription', String, nullable=False)
    link = source_join.c.odm2_organizations_organizationlink                # Column('OrganizationLink', String)

    first_name = source_join.c.ODM2_Aliased_personfirstname
    middle_name = source_join.c.ODM2_Aliased_personmiddlename
    last_name = source_join.c.ODM2_Aliased_personlastname
    # this doesnt work...
    # contact_name = column_property(first_name + " " + middle_name + " " + last_name)
    contact_name = column_property(first_name + " " + last_name)

    phone = source_join.c.odm2_affiliations_primaryphone                    # Column('Phone', String, nullable=False)
    email = source_join.c.odm2_affiliations_primaryemail                    # Column('Email', String, nullable=False)
    address = source_join.c.odm2_affiliations_primaryaddress                # Column('Address', String, nullable=False)
    city = "Unknown"                                                   # Column('City', String, nullable=False)
    state = "Unknown"                                                  # Column('State', String, nullable=False)
    zip_code = "Unknown"                                               # Column('ZipCode', String, nullable=False)
    citation = "Not specified"
    #iso_metadata_id = Column('MetadataID', Integer, ForeignKey('ODM2.ISOMetadata.Metadataid'), nullable=False)

    # relationships
    #iso_metadata = relationship(ISOMetadata)

    def __repr__(self):
        return "<Source('%s', '%s', '%s', '%s', '%s', '%s', '%s')>" % \
               (self.id, self.contact_name, self.first_name, self.last_name,
                self.phone, self.organization, self.description)

class ISOMetadata(Base):
    __tablename__ = 'isometadata'
    __table_args__ = {u'schema': u'odm2'}

    id = Column('metadataid', Integer, primary_key=True)
    topic_category = Column('topiccategory', String, nullable=False)
    title = Column('title', String, nullable=False)
    abstract = Column('abstract', String, nullable=False)
    profile_version = Column('profileversion', String, nullable=False)
    metadata_link = Column('metadatalink', String)

    def __repr__(self):
        return "<ISOMetadata('%s', '%s', '%s')>" % (self.id, self.topic_category, self.title)

# ###################################################################################
#                            Data Collection Methods
# ###################################################################################

class LabMethod(Base):
    __tablename__ = 'labmethods'
    __table_args__ = {u'schema': u'odm2'}

    id = Column('labmethodid', Integer, primary_key=True)
    name = Column('labname', String, nullable=False)
    organization = Column('laborganization', String, nullable=False)
    method_name = Column('labmethodname', String, nullable=False)
    method_description = Column('labmethoddescription', String, nullable=False)
    method_link = Column('labmethodlink', String)

    def __repr__(self):
        return "<LabMethod('%s', '%s', '%s', '%s')>" % (self.id, self.name, self.organization, self.method_name)

class Method(Base):
    # __table__ = method_tabl
    __tablename__ = 'methods'
    __table_args__ = {u'schema': u'odm2'}

    id=Column('methodid', Integer, primary_key=True)
    description= Column('methoddescription', String, nullable=False)
    link=Column('methodlink', String)

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
    __tablename__ = 'samples'
    __table_args__ = {u'schema': u'odm2'}

    id = Column('sampleid', Integer, primary_key=True)
    type = Column('sampletype', String, nullable=False)
    lab_sample_code = Column('labsamplecode', String, nullable=False)
    lab_method_id = Column('labmethodid', Integer, ForeignKey('odm2.labmethods.labmethodid'), nullable=False)

    # relationships
    #lab_method = relationship(LabMethod)

    def __repr__(self):
        return "<Sample('%s', '%s', '%s', '%s')>" % (self.id, self.type, self.lab_sample_code, self.lab_method_id)

class Qualifier(Base):
    __tablename__ = u'annotations'
    __table_args__ = {u'schema': u'odm2'}

    id = Column('annotationid', Integer, primary_key=True)
    code = Column('annotationcode', String, nullable=False)
    description = Column('annotationtext', String, nullable=False)

    def __repr__(self):
        return "<Qualifier('%s', '%s', '%s')>" % (self.id, self.code, self.description)

#TODO Table no longer exists
class OffsetType(Base):
    
    __tablename__ = u'timeseriesresults'
    __table_args__ = {u'schema': 'ODM2'}

    id = Column('offsettypeid', Integer, primary_key=True)
    unit_id = Column('zlocationunitsid', Integer, ForeignKey('odm2.units.unitsid'), nullable=False)
    description = Column('offsetdescription', String)

    # relationships
    unit = relationship(Unit)

    def __repr__(self):
        return "<Unit('%s', '%s', '%s')>" % (self.id, self.unit_id, self.description)


class QualityControlLevel(Base):
    __tablename__ = u'processinglevels'
    __table_args__ = {u'schema': u'ODM2'}

    id = Column('ProcessingLevelid', Integer, primary_key=True)
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
    result_table.c.resultid.label("RID"),
    result_table.c.unitsid,
    result_table.c.variableid,
    result_table.c.sampledmediumcv,
    result_table.c.featureactionid.label("FAID"),
    result_table.c.processinglevelid,
    result_table.c.valuecount,


]).alias("ODM2_RESULT_Aliased")

action_aliased_table = select([
    action_table.c.actionid.label("AID"),
    action_table.c.methodid,

]).alias("ODM2_ACTION_ALIASED")

action_by_aliased_table = select([
    action_by_table.c.actionid.label("ABID"),
    action_by_table.c.affiliationid,

]).alias("ODM2_ACTION_BY_ALIASED")

joined_table = timeseriesresultvalues_table.join(result_aliased_table, timeseriesresultvalues_table.c.resultid ==
                                                 result_aliased_table.c.RID)
joined_table = joined_table.join(feature_action_table, feature_action_table.c.featureactionid == result_aliased_table.c.FAID)
joined_table = joined_table.join(action_aliased_table, feature_action_table.c.actionid == action_aliased_table.c.AID)
joined_table = joined_table.join(action_by_aliased_table, action_aliased_table.c.AID == action_by_aliased_table.c.ABID)


class DataValue(Base):
    # __tablename__ = 'DataValues'
    __table__ = joined_table

    id = joined_table.c.odm2_timeseriesresultvalues_valueid
    data_value = joined_table.c.odm2_timeseriesresultvalues_datavalue
    value_accuracy = None ## question for jeff
    local_date_time = joined_table.c.odm2_timeseriesresultvalues_valuedatetime
    utc_offset = joined_table.c.odm2_timeseriesresultvalues_valuedatetimeutcoffset
    date_time_utc = None ## column propertly datetimeutcoffset
    site_id = joined_table.c.odm2_featureactions_samplingfeatureid
    variable_id = joined_table.c.ODM2_RESULT_Aliased_variableid
    offset_value = None ## Question for jeff
    offset_type_id = None ## Question for Jeff
    censor_code = joined_table.c.odm2_timeseriesresultvalues_censorcodecv
    qualifier_id = None ## Join with annotations..
    method_id = joined_table.c.ODM2_ACTION_ALIASED_methodid
    source_id = joined_table.c.ODM2_ACTION_BY_ALIASED_affiliationid
    sample_id = site_id ## Question for jeff
    derived_from_id = None
    quality_control_level_id = joined_table.c.odm2_timeseriesresultvalues_qualitycodecv

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


joined_table = feature_action_table.join(result_aliased_table, result_table.c.featureactionid == feature_action_table.c.featureactionid)
joined_table = joined_table.join(site_join, site_join.c.odm2_sites_samplingfeatureid == joined_table.c.odm2_featureactions_samplingfeatureid)
joined_table = joined_table.join(variable_join, joined_table.c.ODM2_RESULT_Aliased_RID == variable_join.c.ODM2_Aliased_RID)

# Obtaining Action
joined_table = joined_table.join(action_table, joined_table.c.odm2_featureactions_actionid == action_table.c.actionid)

# Obtaining Method
joined_table = joined_table.join(method_table, joined_table.c.odm2_actions_methodid == method_table.c.methodid)

# Obtaining Source
joined_table = joined_table.join(action_by_table, joined_table.c.odm2_actions_actionid == action_by_table.c.actionid)
joined_table = joined_table.join(source_join, joined_table.c.odm2_actionby_affiliationid == source_join.c.odm2_affiliations_affiliationid)

# Obtaining Processing Level
joined_table = joined_table.join(processing_levels_table, joined_table.c.ODM2_RESULT_Aliased_processinglevelid == processing_levels_table.c.processinglevelid)


class Series:
    pass
#
# class Series(Base):
#     # __tablename__ = 'SeriesCatalog'
#     __table__ = joined_table
#
#     id = joined_table.c.ODM2_RESULT_Aliased_RID
#     site_id = joined_table.c.odm2_sites_samplingfeatureid
#     site_code = joined_table.c.odm2_samplingfeatuers_samplingfeaturecode
#     site_name = joined_table.c.odm2_samplingfeatuers_samplingfeaturename
#     variable_id = joined_table.c.ODM2_RESULT_Aliased_variableid
#     variable_code = joined_table.c.odm2_variables_variablecode
#     variable_name = joined_table.c.odm2_variables_variablenamecv
#     speciation = joined_table.c.odm2_variables_speciationcv
#     variable_units_id = joined_table.c.ODM2_Aliased_unitsid
#     variable_units_name = None #joined_table.c.
#     sample_medium = joined_table.c.ODM2_RESULT_Aliased_sampledmediumcv
#     value_type = joined_table.c.odm2_variables_variabletypecv
#     time_support = joined_table.c.odm2_timeseriesresults_intendedtimespacing                 # Column('TimeSupport', Float, nullable=False)
#     time_unit_id = joined_table.c.odm2_timeseriesresults_intendedtimespacingunitsid          # Column('TimeUnitsID', Integer, ForeignKey('Units.UnitsID'), nullable=False)
#     data_type = joined_table.c.odm2_timeseriesresults_aggregationstatisticcv
#     time_units_name = None # join with units
#     general_category = None
#     method_id = joined_table.c.odm2_methods_methodid
#     method_description = joined_table.c.odm2_methods_methoddescription
#     source_id = joined_table.c.odm2_affiliations_affiliationid
#     description = joined_table.c.odm2_organizations_organizationdescription  # Column('OrganizationDescription', String, nullable=False)
#     link = joined_table.c.odm2_organizations_organizationlink
#     citation = None # please calculate
#     quality_control_level_id = joined_table.c.odm2_processingLevels_processinglevelid
#     quality_control_level_code = joined_table.c.odm2_processingLevels_processinglevelcode
#     begin_date_time = joined_table.c.odm2_actions_begindatetime
#     end_date_time = joined_table.c.odm2_actions_enddatetime
#     begin_date_time_utc = None #Column('BeginDateTimeUTC', DateTime)
#     end_date_time_utc = None #Column('EndDateTimeUTC', DateTime)
#     value_count = joined_table.c.ODM2_RESULT_Aliased_valuecount
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
