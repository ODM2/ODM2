__author__ = 'jmeline'

from sqlalchemy import BigInteger, Column, Date, DateTime, Float, ForeignKey, Integer, String, Boolean, func, Table
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.dialects.mssql.base import BIT

from apiCustomType import Geometry

Base = declarative_base()
metadata = Base.metadata


from sqlalchemy import BigInteger, Column, Date, DateTime, Float, ForeignKey, Integer, String, Boolean
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base



Base = declarative_base()
metadata = Base.metadata



# ################################################################################
# CV
# ################################################################################

class CVActionType(Base):
    __tablename__ = 'cv_actiontype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))

    def __repr__(self):
        return "<CVActionType('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVAggregationStatistic(Base):
    __tablename__ = 'cv_aggregationstatistic'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CVAggregationStatisticsType('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVAnnotationType(Base):
    __tablename__ = 'cv_annotationtype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CVAnnotationType('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVCensorCode(Base):
    __tablename__ = 'cv_censorcode'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CVActionType('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVDatasetType(Base):
    __tablename__ = 'cv_datasettypecv'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVDirectiveType(Base):
    __tablename__ = 'cv_directivetype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVElevationDatum(Base):
    __tablename__ = 'cv_elevationdatum'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVEquipmentType(Base):
    __tablename__ = 'cv_equipmenttype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVMethodType(Base):
    __tablename__ = 'cv_methodtype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVOrganizationType(Base):
    __tablename__ = 'cv_organizationtype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVPropertyDataType(Base):
    __tablename__ = 'cv_propertydatatype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVQualityCode(Base):
     __tablename__ = 'cv_qualitycode'
     __table_args__ = {u'schema': 'odm2'}

     Term = Column(String(255), nullable=False)
     Name = Column(String(255), primary_key=True)
     Definition = Column(String(1000))
     Category = Column(String(255))
     SourceVocabularyUri = Column(String(255))

     def __repr__(self):
         return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVResultType(Base):
    __tablename__ = 'cv_resulttype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSampledMedium(Base):
    __tablename__ = 'cv_sampledmedium'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))

    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSamplingFeatureGeoType(Base):
    __tablename__ = 'cv_samplingfeaturegeotype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))

    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSamplingFeatureType(Base):
    __tablename__ = 'cv_samplingfeaturetype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSpatialOffsetType(Base):
    __tablename__ = 'cv_spatialoffsettype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSpeciation(Base):
    __tablename__ = 'cv_speciation'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSpecimenMedium(Base):
    __tablename__ = 'cv_specimenmedium'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSpecimenType(Base):
    __tablename__ = 'cv_specimentype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVSiteType(Base):
    __tablename__ = 'cv_sitetype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVReferenceMaterialMedium(Base):
    __tablename__ = 'cv_referencematerialmedium'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVStatus(Base):
    __tablename__ = 'cv_status'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVTaxonomicClassifierType(Base):
    __tablename__ = 'cv_taxonomicclassifiertype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVUnitsType(Base):
    __tablename__ = 'cv_unitstype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVVariableName(Base):
    __tablename__ = 'cv_variablename'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)


class CVVariableType(Base):
    __tablename__ = 'cv_variabletype'
    __table_args__ = {u'schema': 'odm2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(1000))
    Category = Column(String(255))
    SourceVocabularyUri = Column(String(255))
    def __repr__(self):
        return "<CV('%s', '%s', '%s', '%s')>" %(self.Term, self.Name, self.Definition, self.Category)




# ################################################################################
# Core
# ################################################################################
class People(Base):
    __tablename__ = u'people'
    __table_args__ = {u'schema': u'odm2'}

    PersonID = Column(Integer, primary_key=True, nullable=False)
    PersonFirstName = Column(String(255), nullable=False)
    PersonMiddleName = Column(String(255))
    PersonLastName = Column(String(255), nullable=False)

    def __repr__(self):
        return "<Person('%s', '%s', '%s')>" % (self.PersonID, self.PersonFirstName,
                                               self.PersonLastName)

class Organizations(Base):
    __tablename__ = u'organizations'
    __table_args__ = {u'schema': u'odm2'}

    OrganizationID = Column(Integer, primary_key=True, nullable=False)
    OrganizationTypeCV = Column(ForeignKey('odm2.cv_organizationtype.Name'), nullable=False, index=True)
    OrganizationCode = Column(String(50), nullable=False)
    OrganizationName = Column(String(255), nullable=False)
    OrganizationDescription = Column(String(500))
    OrganizationLink = Column(String(255))
    ParentOrganizationID = Column(ForeignKey('odm2.organizations.OrganizationID'))

    OrganizationObj = relationship(u'Organizations', remote_side=[OrganizationID])

    def __repr__(self):
        return "<Organizations('%s', '%s', '%s', '%s', '%s', '%s')>" % (
            self.OrganizationID, self.OrganizationTypeCV, self.OrganizationCode,
            self.OrganizationName, self.OrganizationDescription, self.OrganizationLink
        )


class Affiliations(Base):
    __tablename__ = 'affiliations'
    __table_args__ = {u'schema': u'odm2'}

    AffiliationID = Column(Integer, primary_key=True, nullable=False)
    PersonID = Column(ForeignKey('odm2.people.PersonID'), nullable=False)
    OrganizationID = Column(ForeignKey('odm2.organizations.OrganizationID'))
    IsPrimaryOrganizationContact = Column(Boolean)
    AffiliationStartDate = Column(Date, nullable=False)
    AffiliationEndDate = Column(Date)
    PrimaryPhone = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'))
    PrimaryEmail = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    PrimaryAddress = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    PersonLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))

    OrganizationObj = relationship(Organizations)
    PersonObj = relationship(People)


class Methods(Base):
    __tablename__ = 'methods'
    __table_args__ = {u'schema': u'odm2'}

    MethodID = Column(Integer, primary_key=True, nullable=False)
    MethodTypeCV = Column(ForeignKey('odm2.cv_methodtype.Name'), nullable=False, index=True)
    MethodCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    MethodLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    OrganizationID = Column(ForeignKey('odm2.organizations.OrganizationID'))

    OrganizationObj = relationship(Organizations)

    def __repr__(self):
        return "<Methods('%s', '%s', '%s', '%s', '%s', '%s', '%s')>" \
               % (self.MethodID, self.MethodTypeCV, self.MethodCode, self.MethodName, self.MethodDescription, self.MethodLink, self.OrganizationID)


class Actions(Base):
    __tablename__ = u'actions'
    __table_args__ = {u'schema': u'odm2'}

    ActionID = Column(Integer, primary_key=True, nullable=False)
    ActionTypeCV = Column(ForeignKey('odm2.cv_actiontype.Name'), nullable=False, index=True)
    MethodID = Column(ForeignKey('odm2.methods.MethodID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    BeginDateTimeUTCOffset = Column(Integer, nullable=False)
    EndDateTime = Column(DateTime)
    EndDateTimeUTCOffset = Column(Integer)
    ActionDescription = Column(String(500))
    ActionFileLink = Column(String(255))

    MethodObj = relationship(Methods)


    def __repr__(self):
        return "<Actions('%s', '%s', '%s', '%s')>" % (
            self.ActionID, self.ActionTypeCV, self.BeginDateTime, self.ActionDescription)


class ActionBy(Base):
    __tablename__ = u'actionby'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)
    AffiliationID = Column(ForeignKey('odm2.affiliations.AffiliationID'), nullable=False)
    IsActionLead = Column(Boolean, nullable=False)
    RoleDescription = Column(String(500))

    ActionObj = relationship(Actions)
    AffiliationObj = relationship(Affiliations)


class SamplingFeatures(Base):
    __tablename__ = u'samplingfeatures'
    __table_args__ = {u'schema': u'odm2'}

    SamplingFeatureID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureUUID = Column(String(36), nullable=False)
    SamplingFeatureTypeCV = Column(ForeignKey('odm2.cv_samplingfeaturetype.Name'), nullable=False, index=True)
    SamplingFeatureCode = Column(String(50), nullable=False)
    SamplingFeatureName = Column(String(255))
    SamplingFeatureDescription = Column(String(500))
    SamplingFeatureGeotypeCV = Column(ForeignKey('odm2.cv_samplingfeaturegeotype.Name'), index=True)
    Elevation_m = Column(Float(53))
    ElevationDatumCV = Column(ForeignKey('odm2.cv_elevationdatum.Name'), index=True)
    FeatureGeometry = Column(Geometry)

    def __repr__(self):
        return "<SamplingFeatures('%s', '%s', '%s', '%s')>" % (
            self.SamplingFeatureCode, self.SamplingFeatureName, self.SamplingFeatureDescription, self.Elevation_m)#self.FeatureGeometry)


class FeatureActions(Base):
    __tablename__ = u'featureactions'
    __table_args__ = {u'schema': u'odm2'}

    FeatureActionID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('odm2.samplingfeatures.SamplingFeatureID'), nullable=False)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)

    ActionObj = relationship(Actions)
    SamplingFeatureObj = relationship(SamplingFeatures)


    def __repr__(self):
        return "<FeatureActions('%s', '%s', '%s', )>" % (self.FeatureActionID, self.SamplingFeatureID, self.ActionID)


class Datasets(Base):
    __tablename__ = u'datasets'
    __table_args__ = {u'schema': u'odm2'}

    DatasetID = Column(Integer, primary_key=True, nullable=False)

    # This has been changed to String to support multiple database uuid types

    DatasetUUID = Column(String(255), nullable=False)
    DatasetTypeCV = Column(ForeignKey('odm2.cv_datasettypecv.Name'), nullable=False, index=True)
    DatasetCode = Column(String(50), nullable=False)
    DatasetTitle = Column(String(255), nullable=False)
    DatasetAbstract = Column(String(500), nullable=False)

    def __repr__(self):
        return "<Datasets('%s', '%s', '%s', '%s', '%s')>" % (
            self.DatasetID, self.DatasetTypeCV, self.DatasetCode, self.DatasetTitle, self.DatasetAbstract)


class ProcessingLevels(Base):
    __tablename__ = u'processinglevels'
    __table_args__ = {u'schema': u'odm2'}

    ProcessingLevelID = Column(Integer, primary_key=True, nullable=False)
    ProcessingLevelCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    Definition = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    Explanation = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))

    def __repr__(self):
        return "<ProcessingLevels('%s', '%s', '%s', '%s')>" \
               % (self.ProcessingLevelID, self.ProcessingLevelCode, self.Definition, self.Explanation)


class RelatedActions(Base):
    __tablename__ = u'relatedactions'
    __table_args__ = {u'schema': u'odm2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    ActionTypeCV = Column(ForeignKey('odm2.cv_actiontype.Name'), nullable=False, index=True)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)
    RelationshipTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    RelatedActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)

    ActionObj = relationship(Actions, primaryjoin='RelatedActions.ActionID == Actions.ActionID')
    RelatedActionObj = relationship(Actions, primaryjoin='RelatedActions.RelatedActionID == Actions.ActionID')


class TaxonomicClassifiers(Base):
    __tablename__ = u'taxonomicclassifiers'
    __table_args__ = {u'schema': u'odm2'}

    TaxonomicClassifierID = Column(Integer, primary_key=True, nullable=False)
    TaxonomicClassifierTypeCV = Column(ForeignKey('odm2.cv_taxonomicclassifiertype.Name'), nullable=False, index=True)
    TaxonomicClassifierName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    TaxonomicClassifierCommonName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    TaxonomicClassifierDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    ParentTaxonomicClassifierID = Column(ForeignKey('odm2.taxonomicclassifiers.TaxonomicClassifierID'))

    parent = relationship(u'TaxonomicClassifiers', remote_side=[TaxonomicClassifierID])


class Units(Base):
    __tablename__ = u'units'
    __table_args__ = {u'schema': u'odm2'}

    UnitsID = Column(Integer, primary_key=True, nullable=False)
    UnitsTypeCV = Column(ForeignKey('odm2.cv_unitstype.Name'), nullable=False, index=True)
    UnitsAbbreviation = Column(String(255), nullable=False)
    UnitsName = Column(String, nullable=False)
    UnitsLink = Column(String(255))

    def __repr__(self):
        return "<Units('%s', '%s', '%s', '%s')>" % (self.UnitsID, self.UnitsTypeCV, self.UnitsAbbreviation, self.UnitsName)


class Variables(Base):
    __tablename__ = u'variables'
    __table_args__ = {u'schema': u'odm2'}

    VariableID = Column(Integer, primary_key=True, nullable=False)
    VariableTypeCV = Column(ForeignKey('odm2.cv_variabletype.Name'), nullable=False, index=True)
    VariableCode = Column(String(50), nullable=False)
    VariableNameCV = Column(ForeignKey('odm2.cv_variablename.Name'), nullable=False, index=True)
    VariableDefinition = Column(String(500))
    SpeciationCV = Column(ForeignKey('odm2.cv_speciation.Name'), index=True)
    NoDataValue = Column(Float(asdecimal=True), nullable=False)


    def __repr__(self):
        return "<Variables('%s', '%s', '%s')>" % (self.VariableID, self.VariableCode, self.VariableNameCV)

'''
class ResultTypeCV(Base):
    __tablename__ = u'ResultTypeCV'
    __table_args__ = {u'schema': u'odm2'}

    ResultTypeCV = Column(String(255), primary_key=True)
    ResultTypeCategory = Column(String(255), nullable=False)
    DataType = Column(String(255), nullable=False)
    ResultTypeDefinition = Column(String(500), nullable=False)
    FixedDimensions = Column(String(255), nullable=False)
    VaryingDimensions = Column(String(255), nullable=False)
    SpaceMeasurementFramework = Column(String(255), nullable=False)
    TimeMeasurementFramework = Column(String(255), nullable=False)
    VariableMeasurementFramework = Column(String(255), nullable=False)
'''

class Results(Base):
    __tablename__ = u'results'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(BigInteger, primary_key=True)

    # This has been changed to String to support multiple database uuid types
    # ResultUUID = Column(UNIQUEIDENTIFIER, nullable=False)
    ResultUUID = Column(String(36), nullable=False)
    FeatureActionID = Column(ForeignKey('odm2.featureactions.FeatureActionID'), nullable=False)
    ResultTypeCV = Column(ForeignKey('odm2.cv_resulttype.Name'), nullable=False, index=True)
    VariableID = Column(ForeignKey('odm2.variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('odm2.taxonomicclassifiers.TaxonomicClassifierID'))
    ProcessingLevelID = Column(ForeignKey('odm2.processinglevels.ProcessingLevelID'), nullable=False)
    ResultDateTime = Column(DateTime)
    ResultDateTimeUTCOffset = Column(BigInteger)
    ValidDateTime = Column(DateTime)
    ValidDateTimeUTCOffset = Column(BigInteger)
    StatusCV = Column(ForeignKey('odm2.cv_status.Name'), index=True)
    SampledMediumCV = Column(ForeignKey('odm2.cv_sampledmedium.Name'), nullable=False, index=True)
    ValueCount = Column(Integer, nullable=False)

    # IntendedObservationSpacing = Column(String(255))

    FeatureActionObj = relationship(FeatureActions)
    ProcessingLevelObj = relationship(ProcessingLevels)

    TaxonomicClassifierObj = relationship(TaxonomicClassifiers)
    UnitsObj = relationship(Units)
    VariableObj = relationship(Variables)


    def __repr__(self):
        return "<Results('%s', '%s', '%s', '%s', '%s')>" % (
            self.ResultID, self.ResultUUID , self.ResultTypeCV, self.ProcessingLevelID, self.ValueCount)


# ################################################################################
# Equipment
# ################################################################################
class EquipmentModels(Base):
    __tablename__ = u'equipmentmodels'
    __table_args__ = {u'schema': u'odm2'}

    ModelID = Column(Integer, primary_key=True, nullable=False)
    ModelManufacturerID = Column(ForeignKey('odm2.organizations.OrganizationID'), nullable=False)
    ModelPartNumber = Column(String(50))
    ModelName = Column(String(255), nullable=False)
    ModelDescription = Column(String(500))
    ModelSpecificationsFileLink = Column(String(255))
    ModelLink = Column(String(255))
    IsInstrument = Column(BIT, nullable=False)

    OrganizationObj = relationship(Organizations)


class Equipment(Base):
    __tablename__ = u'equipment'
    __table_args__ = {u'schema': u'odm2'}

    EquipmentID = Column(Integer, primary_key=True, nullable=False)
    EquipmentCode = Column(String(50), nullable=False)
    EquipmentName = Column(String(255), nullable=False)
    EquipmentTypeCV = Column(ForeignKey('odm2.cv_equipmenttype.Name'), nullable=False, index=True)
    ModelID = Column(ForeignKey('odm2.equipmentmodels.ModelID'), nullable=False)
    EquipmentSerialNumber = Column(String(50), nullable=False)
    EquipmentInventoryNumber = Column(String(50))
    EquipmentOwnerID = Column(ForeignKey('odm2.people.PersonID'), nullable=False)
    EquipmentVendorID = Column(ForeignKey('odm2.organizations.OrganizationID'), nullable=False)
    EquipmentPurchaseDate = Column(DateTime, nullable=False)
    EquipmentPurchaseOrderNumber = Column(String(50))
    EquipmentPhotoFileLink = Column(String(255))
    EquipmentDescription = Column(String(500))
    ParentEquipmentID = Column(ForeignKey('odm2.equipment.EquipmentID'))

    PersonObj = relationship(People)
    OrganizationObj = relationship(Organizations)
    EquipmentModelObj = relationship(EquipmentModels)

    parent = relationship(u'Equipment', remote_side=[EquipmentID])


class EquipmentActions(Base):
    __tablename__ = u'equipmentactions'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    EquipmentID = Column(ForeignKey('odm2.equipment.EquipmentID'), nullable=False)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)

    ActionObj = relationship(Actions)
    EquipmentObj = relationship(Equipment)


class InstrumentOutputVariables(Base):
    __tablename__ = u'instrumentoutputvariables'
    __table_args__ = {u'schema': u'odm2'}

    InstrumentOutputVariableID = Column(Integer, primary_key=True, nullable=False)
    ModelID = Column(ForeignKey('odm2.equipmentmodels.ModelID'), nullable=False)
    VariableID = Column(ForeignKey('odm2.variables.VariableID'), nullable=False)
    InstrumentMethodID = Column(ForeignKey('odm2.methods.MethodID'), nullable=False)
    InstrumentResolution = Column(String(255))
    InstrumentAccuracy = Column(String(255))
    InstrumentRawOutputUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)

    MethodObj = relationship(Methods)
    OutputUnitObj = relationship(Units)
    EquipmentModelObj = relationship(EquipmentModels)
    VariableObj = relationship(Variables)


# ################################################################################
# Lab Analyses
# ################################################################################
class Directives(Base):
    __tablename__ = u'directives'
    __table_args__ = {u'schema': u'odm2'}

    DirectiveID = Column(Integer, primary_key=True, nullable=False)
    DirectiveTypeCV = Column(ForeignKey('odm2.cv_directivetype.Name'), nullable=False, index=True)
    DirectiveDescription = Column(String(500), nullable=False)


class ActionDirectives(Base):
    __tablename__ = u'actiondirectives'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)
    DirectiveID = Column(ForeignKey('odm2.directives.DirectiveID'), nullable=False)

    ActionObj = relationship(Actions)
    DirectiveObj = relationship(Directives)


# ################################################################################
# Sampling Features
# ################################################################################
class SpatialReferences(Base):
    __tablename__ = u'spatialreferences'
    __table_args__ = {u'schema': u'odm2'}

    SpatialReferenceID = Column(Integer, primary_key=True, nullable=False)
    SRSCode = Column(String(50))
    SRSName = Column(String(255), nullable=False)
    SRSDescription = Column(String(500))
    SRSLink = Column(String(255))

    def __repr__(self):
        return "<SpatialReferences('%s', '%s', '%s', '%s', '%s')>" \
               % (self.SpatialReferenceID, self.SRSCode, self.SRSName, self.SRSDescription, self.SRSLink)



class Specimens(Base):
    __tablename__ = u'specimens'
    __table_args__ = {u'schema': u'odm2'}

    SamplingFeatureID = Column(ForeignKey('odm2.samplingfeatures.SamplingFeatureID'), primary_key=True)
    SpecimenTypeCV = Column(ForeignKey('odm2.cv_specimentype.Name'), nullable=False, index=True)
    SpecimenMediumCV = Column(ForeignKey('odm2.cv_specimenmedium.Name'), nullable=False, index=True)
    IsFieldSpecimen = Column(BIT, nullable=False)

    SamplingFeatureObj = relationship(SamplingFeatures)



class SpatialOffsets(Base):
    __tablename__ = u'spatialoffsets'
    __table_args__ = {u'schema': u'odm2'}

    SpatialOffsetID = Column(Integer, primary_key=True, nullable=False)
    SpatialOffsetTypeCV = Column(ForeignKey('odm2.cv_spatialoffsettype.Name'), nullable=False, index=True)
    Offset1Value = Column(Float(53), nullable=False)
    Offset1UnitID = Column(Integer, nullable=False)
    Offset2Value = Column(Float(53))
    Offset2UnitID = Column(Integer)
    Offset3Value = Column(Float(53))
    Offset3UnitID = Column(Integer)


class Sites(Base):
    __tablename__ = u'sites'
    __table_args__ = {u'schema': u'odm2'}

    SamplingFeatureID = Column(ForeignKey('odm2.samplingfeatures.SamplingFeatureID'), primary_key=True)
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'), nullable=False)
    SiteTypeCV = Column(ForeignKey('odm2.cv_sitetype.Name'), nullable=False, index=True)
    Latitude = Column(Float(53), nullable=False)
    Longitude = Column(Float(53), nullable=False)
    # LatLonDatumID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'), nullable=False)

    SpatialReferenceObj = relationship(SpatialReferences)
    SamplingFeatureObj = relationship(SamplingFeatures)

    def __repr__(self):
        return "<Sites('%s', '%s', '%s', '%s', '%s', '%s', '%s')>" \
               % (self.SamplingFeatureID, self.SpatialReferenceID, self.SiteTypeCV, self.Latitude, self.Longitude,
                  self.SpatialReferenceObj, self.SamplingFeatureObj)


class RelatedFeatures(Base):
    __tablename__ = u'relatedfeatures'
    __table_args__ = {u'schema': u'odm2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('odm2.samplingfeatures.SamplingFeatureID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey('odm2.cv_relationshiptype.Name'), nullable=False, index=True)
    RelatedFeatureID = Column(ForeignKey('odm2.samplingfeatures.SamplingFeatureID'), nullable=False)
    SpatialOffsetID = Column(ForeignKey('odm2.spatialoffsets.SpatialOffsetID'))

    SamplingFeatureObj = relationship(SamplingFeatures,
                                      primaryjoin='RelatedFeatures.RelatedFeatureID == SamplingFeatures.SamplingFeatureID')
    RelatedFeatureObj = relationship(SamplingFeatures,
                                     primaryjoin='RelatedFeatures.SamplingFeatureID == SamplingFeatures.SamplingFeatureID')
    SpatialOffsetObj = relationship(SpatialOffsets)


class SpecimenTaxonomicClassifiers(Base):
    __tablename__ = u'specimentaxonomicclassifiers'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('odm2.specimens.SamplingFeatureID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('odm2.taxonomicclassifiers.TaxonomicClassifierID'), nullable=False)
    CitationID = Column(Integer)

    SpecimenObj = relationship(Specimens)
    TaxonomicClassifierObj = relationship(TaxonomicClassifiers)


# ################################################################################
# Sensors
# ################################################################################
class DeploymentActions(Base):
    __tablename__ = u'deploymentactions'
    __table_args__ = {u'schema': u'odm2'}

    DeploymentActionID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)
    DeploymentTypeCV = Column(ForeignKey(u'odm2.cv_deploymenttype.Name'), nullable=False, index=True)
    DeploymentDescription = Column(String(500))
    ConfigurationActionID = Column(Integer, nullable=False)
    CalibrationActionID = Column(Integer, nullable=False)
    SpatialOffsetID = Column(Integer)
    DeploymentSchematicLink = Column(String(255))

    ActionObj = relationship(Actions)


class DataLoggerFiles(Base):
    __tablename__ = u'dataloggerfiles'
    __table_args__ = {u'schema': u'odm2'}

    DataLoggerFileID = Column(Integer, primary_key=True, nullable=False)
    DeploymentActionID = Column(ForeignKey('odm2.deploymentactions.DeploymentActionID'), nullable=False)
    DataLoggerOutputFileLink = Column(String(255), nullable=False)
    DataLoggerOutputFileDescription = Column(String(500))

    DeploymentActionObj = relationship(DeploymentActions)


class Photos(Base):
    __tablename__ = u'photos'
    __table_args__ = {u'schema': u'odm2'}

    PhotoID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)
    PhotoFileLink = Column(String(255), nullable=False)
    PhotoDescription = Column(String(500))

    ActionObj = relationship(Actions)


# ################################################################################
# Simulation
# ################################################################################
class Models(Base):
    __tablename__ = 'models'
    __table_args__ = {u'schema': u'odm2'}

    ModelID = Column(Integer, primary_key=True, nullable=False)
    ModelCode = Column(String(255), nullable=False)
    ModelName = Column(String(255), nullable=False)
    ModelDescription = Column(String(500))


class RelatedModels(Base):
    __tablename__ = 'relatedmodels'
    __table_args__ = {u'schema': u'odm2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    ModelID = Column(ForeignKey('odm2.models.ModelID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey('odm2.cv_relationshiptype.Name'), nullable=False, index=True)
    RelatedModelID = Column(ForeignKey('odm2.models.ModelID'), nullable=False)

    ModelObj = relationship(Models, primaryjoin='RelatedModels.ModelID == Models.ModelID')
    RelatedModelObj = relationship(Models, primaryjoin='RelatedModels.RelatedModelID == Models.ModelID')


class Simulations(Base):
    __tablename__ = 'simulations'
    __table_args__ = {u'schema': u'odm2'}

    SimulationID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)
    SimulationName = Column(String(255), nullable=False)
    SimulationDescription = Column(String(500))
    SimulationStartDateTime = Column(Date, nullable=False)
    SimulationStartDateTimeUTCOffset = Column(Integer, nullable=False)
    SimulationEndDateTime = Column(Date, nullable=False)
    SimulationEndDateTimeUTCOffset = Column(Integer, nullable=False)
    TimeStepValue = Column(Float(53), nullable=False)
    TimeStepUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    InputDatasetID = Column(ForeignKey('odm2.datasets.DatasetID'))
    OutputDatasetID = Column(Integer)
    ModelID = Column(ForeignKey('odm2.models.ModelID'), nullable=False)

    Action = relationship(Actions)
    Dataset = relationship(Datasets)
    Model = relationship(Models)
    Unit = relationship(Units)


# Part of the Provenance table, needed here to meet dependancies
class Citations(Base):
    __tablename__ = u'citations'
    __table_args__ = {u'schema': u'odm2'}

    CitationID = Column(Integer, primary_key=True, nullable=False)
    Title = Column(String(255), nullable=False)
    Publisher = Column(String(255), nullable=False)
    PublicationYear = Column(Integer, nullable=False)
    CitationLink = Column(String(255))

    def __repr__(self):
        return "<Citations('%s', '%s', '%s', '%s', '%s')>" % (self.CitationID, self.Title, self.Publisher, self.PublicationYear, self.CitationLink)


# ################################################################################
# Annotations
# ################################################################################
class Annotations(Base):
    __tablename__ = u'annotations'

    __table_args__ = {u'schema': u'odm2'}

    AnnotationID = Column(Integer, primary_key=True, nullable=False)
    AnnotationTypeCV = Column(ForeignKey('odm2.cv_annotationtype.Name'), nullable=False, index=True)
    AnnotationCode = Column(String(50))
    AnnotationText = Column(String(500), nullable=False)
    AnnotationDateTime = Column(DateTime)
    AnnotationUTCOffset = Column(Integer)
    AnnotationLink = Column(String(255))
    AnnotatorID = Column(ForeignKey('odm2.people.PersonID'))
    CitationID = Column(ForeignKey('odm2.citations.CitationID'))

    PersonObj = relationship(People)
    CitationObj = relationship(Citations)


class ActionAnnotations(Base):
    __tablename__ = u'actionannotations'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)
    AnnotationID = Column(ForeignKey('odm2.annotations.AnnotationID'), nullable=False)

    ActionObj = relationship(Actions)
    AnnotationObj = relationship(Annotations)


class MethodAnnotations(Base):
    __tablename__ = u'methodannotations'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    MethodID = Column(ForeignKey('odm2.methods.MethodID'), nullable=False)
    AnnotationID = Column(ForeignKey('odm2.annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotations)
    MethodObj = relationship(Methods)


class ResultAnnotations(Base):
    __tablename__ = u'resultannotations'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ResultID = Column(ForeignKey('odm2.results.ResultID'), nullable=False)
    AnnotationID = Column(ForeignKey('odm2.annotations.AnnotationID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    EndDateTime = Column(DateTime, nullable=False)

    AnnotationObj = relationship(Annotations)
    ResultObj = relationship(Results)


class ResultValueAnnotations(Base):
    __tablename__ = u'resultvalueannotations'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ValueID = Column(BigInteger, nullable=False)
    AnnotationID = Column(ForeignKey('odm2.annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotations)


class SamplingFeatureAnnotations(Base):
    __tablename__ = u'samplingfeatureannotations'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('odm2.samplingfeatures.SamplingFeatureID'), nullable=False)
    AnnotationID = Column(ForeignKey('odm2.annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotations)
    SamplingFeatureObj = relationship(SamplingFeatures)

# ################################################################################
# Data Quality
# ################################################################################
class DatasetsResults(Base):
    __tablename__ = u'datasetsresults'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    DatasetID = Column(ForeignKey('odm2.datasets.DatasetID'), nullable=False)
    ResultID = Column(ForeignKey('odm2.results.ResultID'), nullable=False)

    DatasetObj = relationship(Datasets)
    ResultObj = relationship(Results)


class DataQuality(Base):
    __tablename__ = 'dataquality'
    __table_args__ = {u'schema': u'odm2'}

    DataQualityID = Column(Integer, primary_key=True, nullable=False)
    DataQualityTypeCV = Column(ForeignKey('odm2.cv_dataqualitytype.Name'), nullable=False, index=True)
    DataQualityCode = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    DataQualityValue = Column(Float(53))
    DataQualityValueUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    DataQualityDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    DataQualityLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))

    UnitObj = relationship(Units)


class ReferenceMaterials(Base):
    __tablename__ = 'referencematerials'
    __table_args__ = {u'schema': u'odm2'}

    ReferenceMaterialID = Column(Integer, primary_key=True, nullable=False)
    ReferenceMaterialMediumCV = Column(ForeignKey('odm2.cv_referencematerialmedium.Name'), nullable=False, index=True)
    ReferenceMaterialOrganizationID = Column(ForeignKey('odm2.organizations.OrganizationID'), nullable=False)
    ReferenceMaterialCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    ReferenceMaterialLotCode = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    ReferenceMaterialPurchaseDate = Column(DateTime)
    ReferenceMaterialExpirationDate = Column(DateTime)
    ReferenceMaterialCertificateLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    SamplingFeatureID = Column(ForeignKey('odm2.samplingfeatures.SamplingFeatureID'))

    OrganizationObj = relationship(Organizations)
    SamplingFeatureObj = relationship(SamplingFeatures)


ResultNormalizationValues = Table(
    u'resultnormalizationvalues', Base.metadata,
    Column(u'ResultID', ForeignKey('odm2.results.ResultID'), primary_key=True),
    Column(u'NormalizedByReferenceMaterialValueID', ForeignKey('odm2.referencematerialvalues.ReferenceMaterialValueID'),
           nullable=False),
    schema='ODM2'
)


class Referencematerialvalue(Base):
    __tablename__ = u'referencematerialvalues'
    __table_args__ = {u'schema': u'odm2'}

    ReferenceMaterialValueID = Column(Integer, primary_key=True, nullable=False)
    ReferenceMaterialID = Column(ForeignKey('odm2.referencematerials.ReferenceMaterialID'), nullable=False)
    ReferenceMaterialValue = Column(Float(53), nullable=False)
    ReferenceMaterialAccuracy = Column(Float(53))
    VariableID = Column(ForeignKey('odm2.variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    CitationID = Column(ForeignKey('odm2.citations.CitationID'), nullable=False)

    CitationObj = relationship(Citations)
    ReferenceMaterialObj = relationship(ReferenceMaterials)
    UnitObj = relationship(Units)
    VariableObj = relationship(Variables)
    ResultsObj = relationship(Results, secondary=ResultNormalizationValues)


class ResultsDataQuality(Base):
    __tablename__ = 'resultsdataquality'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ResultID = Column(ForeignKey('odm2.results.ResultID'), nullable=False)
    DataQualityID = Column(ForeignKey('odm2.dataquality.DataQualityID'), nullable=False)

    DataQualityObj = relationship(DataQuality)
    ResultObj = relationship(Results)


# ################################################################################
# Extension Properties
# ################################################################################
class ExtensionProperties(Base):
    __tablename__ = u'extensionproperties'
    __table_args__ = {u'schema': u'odm2'}

    PropertyID = Column(Integer, primary_key=True, nullable=False)
    PropertyName = Column(String(255), nullable=False)
    PropertyDescription = Column(String(500))
    PropertyDataTypeCV = Column(ForeignKey('odm2.cv_propertydatatype.Name'), nullable=False, index=True)
    PropertyUnitsID = Column(ForeignKey('odm2.units.UnitsID'))

    UnitObj = relationship(Units)


class ActionExtensionPropertyValues(Base):
    __tablename__ = u'actionextensionpropertyvalues'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('odm2.actions.ActionID'), nullable=False)
    PropertyID = Column(ForeignKey('odm2.extensionproperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ActionObj = relationship(Actions)
    ExtensionPropertyObj = relationship(ExtensionProperties)


class CitationExtensionPropertyValues(Base):
    __tablename__ = u'citationextensionpropertyvalues'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    CitationID = Column(ForeignKey('odm2.citations.CitationID'), nullable=False)
    PropertyID = Column(ForeignKey('odm2.extensionproperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    CitationObj = relationship(Citations)
    ExtensionPropertyObj = relationship(ExtensionProperties)


class MethodExtensionPropertyValues(Base):
    __tablename__ = u'methodextensionpropertyvalues'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    MethodID = Column(ForeignKey('odm2.methods.MethodID'), nullable=False)
    PropertyID = Column(ForeignKey('odm2.extensionproperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    MethodObj = relationship(Methods)
    ExtensionPropertyObj = relationship(ExtensionProperties)


class ResultExtensionPropertyValues(Base):
    __tablename__ = u'resultextensionpropertyvalues'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ResultID = Column(ForeignKey('odm2.results.ResultID'), nullable=False)
    PropertyID = Column(ForeignKey('odm2.extensionproperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(ExtensionProperties)
    ResultObj = relationship(Results)


class SamplingFeatureExtensionPropertyValues(Base):
    __tablename__ = u'samplingfeatureextensionpropertyvalues'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('odm2.samplingfeatures.SamplingFeatureID'), nullable=False)
    PropertyID = Column(ForeignKey('odm2.extensionproperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(ExtensionProperties)
    SamplingFeatureObj = relationship(SamplingFeatures)


class VariableExtensionPropertyValues(Base):
    __tablename__ = u'variableextensionpropertyvalues'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    VariableID = Column(ForeignKey('odm2.variables.VariableID'), nullable=False)
    PropertyID = Column(ForeignKey('odm2.extensionproperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(ExtensionProperties)
    VariableObj = relationship(Variables)


# ################################################################################
# Extension Identifiers
# ################################################################################
class ExternalIdentifierSystems(Base):
    __tablename__ = u'externalidentifiersystems'
    __table_args__ = {u'schema': u'odm2'}

    ExternalIdentifierSystemID = Column(Integer, primary_key=True, nullable=False)
    ExternalIdentifierSystemName = Column(String(255), nullable=False)
    IdentifierSystemOrganizationID = Column(ForeignKey('odm2.organizations.OrganizationID'), nullable=False)
    ExternalIdentifierSystemDescription = Column(String(500))
    ExternalIdentifierSystemURL = Column(String(255))

    IdentifierSystemOrganizationObj = relationship(Organizations)

    def __repr__(self):
        return "<ExternalIdentifierSystems('%s', '%s', '%s', '%s', '%s')>" % (
            self.ExternalIdentifierSystemID, self.ExternalIdentifierSystemName,
            self.IdentifierSystemOrganizationID, self.ExternalIdentifierSystemDescription,
            self.ExternalIdentifierSystemURL)



class CitationExternalIdentifiers(Base):
    __tablename__ = u'citationexternalidentifiers'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    CitationID = Column(ForeignKey('odm2.citations.CitationID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('odm2.externalidentifiersystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    CitationExternalIdentifer = Column(String(255), nullable=False)
    CitationExternalIdentiferURI = Column(String(255))

    CitationObj = relationship(Citations)
    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)


class MethodExternalIdentifiers(Base):
    __tablename__ = u'methodexternalidentifiers'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    MethodID = Column(ForeignKey('odm2.methods.MethodID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('odm2.externalidentifiersystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    MethodExternalIdentifier = Column(String(255), nullable=False)
    MethodExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    MethodObj = relationship(Methods)


class PersonExternalIdentifiers(Base):
    __tablename__ = u'personexternalidentifiers'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    PersonID = Column(ForeignKey('odm2.people.PersonID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('odm2.externalidentifiersystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    PersonExternalIdentifier = Column(String(255), nullable=False)
    PersonExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    PersonObj = relationship(People)


class ReferenceMaterialExternalIdentifiers(Base):
    __tablename__ = u'referencematerialexternalidentifiers'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ReferenceMaterialID = Column(ForeignKey('odm2.referencematerials.ReferenceMaterialID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('odm2.externalidentifiersystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    ReferenceMaterialExternalIdentifier = Column(String(255), nullable=False)
    ReferenceMaterialExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    ReferenceMaterialObj = relationship(ReferenceMaterials)


class SamplingFeatureExternalIdentifiers(Base):
    __tablename__ = u'samplingfeatureexternalidentifiers'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('odm2.samplingfeatures.SamplingFeatureID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('odm2.externalidentifiersystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    SamplingFeatureExternalIdentifier = Column(String(255), nullable=False)
    SamplingFeatureExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    SamplingFeatureObj = relationship(SamplingFeatures)


class SpatialReferenceExternalIdentifiers(Base):
    __tablename__ = u'spatialreferenceexternaledentifiers'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('odm2.externalidentifiersystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    SpatialReferenceExternalIdentifier = Column(String(255), nullable=False)
    SpatialReferenceExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    SpatialReferenceObj = relationship(SpatialReferences)


class TaxonomicClassifierExternalIdentifiers(Base):
    __tablename__ = u'taxonomicclassifierexternalidentifiers'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('odm2.taxonomicclassifiers.TaxonomicClassifierID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('odm2.externalidentifiersystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    TaxonomicClassifierExternalIdentifier = Column(String(255), nullable=False)
    TaxonomicClassifierExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    TaxonomicClassifierObj = relationship(TaxonomicClassifiers)


class VariableExternalIdentifiers(Base):
    __tablename__ = u'variableexternalidentifiers'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    VariableID = Column(ForeignKey('odm2.variables.VariableID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('odm2.externalidentifiersystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    VariableExternalIdentifer = Column(String(255), nullable=False)
    VariableExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    VariableObj = relationship(Variables)

# ################################################################################
# Provenance
# ################################################################################



class AuthorLists(Base):
    __tablename__ = u'authorlists'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    CitationID = Column(ForeignKey('odm2.citations.CitationID'), nullable=False)
    PersonID = Column(ForeignKey('odm2.people.PersonID'), nullable=False)
    AuthorOrder = Column(Integer, nullable=False)

    CitationObj = relationship(Citations, primaryjoin='AuthorLists.CitationID == Citations.CitationID')
    PersonObj = relationship(People, primaryjoin='AuthorLists.PersonID == People.PersonID')

    def __repr__(self):
        return "<AuthorLists('%s', '%s', '%s', '%s', '%s', '%s')>" \
               % (self.BridgeID, self.CitationID, self.PersonID, self.AuthorOrder, self.CitationObj, self.PersonObj)


class DatasetCitations(Base):
    __tablename__ = u'datasetcitations'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    DatasetID = Column(ForeignKey('odm2.datasets.DatasetID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey('odm2.cv_relationshiptype.Name'), nullable=False, index=True)
    CitationID = Column(ForeignKey('odm2.citations.CitationID'), nullable=False)

    CitationObj = relationship(Citations)
    DatasetObj = relationship(Datasets)


ResultDerivationEquations = Table(
    u'resultderivationequations', Base.metadata,
    Column(u'ResultID', ForeignKey('odm2.results.ResultID'), primary_key=True),
    Column(u'DerivationEquationID', ForeignKey('odm2.derivationequations.DerivationEquationID'), nullable=False),
    schema='ODM2'
)


class DerivationEquations(Base):
    __tablename__ = u'derivationequations'
    __table_args__ = {u'schema': u'odm2'}

    DerivationEquationID = Column(Integer, primary_key=True, nullable=False)
    DerivationEquation = Column(String(255), nullable=False)

    ResultsObj = relationship(Results, secondary=ResultDerivationEquations)


class MethodCitations(Base):
    __tablename__ = u'methodcitations'
    __table_args__ = {u'schema': u'odm2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    MethodID = Column(ForeignKey('odm2.methods.MethodID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey('odm2.cv_relationshiptype.Name'), nullable=False, index=True)
    CitationID = Column(ForeignKey('odm2.citations.CitationID'), nullable=False)

    CitationObj = relationship(Citations)
    MethodObj = relationship(Methods)


# from odm2.Annotations.model import Annotation
class RelatedAnnotations(Base):
    __tablename__ = u'relatedannotations'
    __table_args__ = {u'schema': u'odm2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    AnnotationID = Column(ForeignKey('odm2.annotations.AnnotationID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey('odm2.cv_relationshiptype.Name'), nullable=False, index=True)
    RelatedAnnotationID = Column(ForeignKey('odm2.annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotations, primaryjoin='RelatedAnnotations.AnnotationID == Annotations.AnnotationID')
    RelatedAnnotationObj = relationship(Annotations,
                                        primaryjoin='RelatedAnnotations.RelatedAnnotationID == Annotations.AnnotationID')


class RelatedCitations(Base):
    __tablename__ = u'relatedcitations'
    __table_args__ = {u'schema': u'odm2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    CitationID = Column(ForeignKey('odm2.citations.CitationID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey('odm2.cv_relationshiptype.Name'), nullable=False, index=True)
    RelatedCitationID = Column(ForeignKey('odm2.citations.CitationID'), nullable=False)

    CitationObj = relationship(Citations, primaryjoin='RelatedCitations.CitationID == Citations.CitationID')
    RelatedCitationObj = relationship(Citations, primaryjoin='RelatedCitations.RelatedCitationID == Citations.CitationID')


class RelatedDatasets(Base):
    __tablename__ = u'relateddatasets'
    __table_args__ = {u'schema': u'odm2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    DatasetID = Column(ForeignKey('odm2.datasets.DatasetID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey('odm2.cv_relationshiptype.Name'), nullable=False, index=True)
    RelatedDatasetID = Column(ForeignKey('odm2.datasets.DatasetID'), nullable=False)
    VersionCode = Column(String(50))

    DatasetObj = relationship(Datasets, primaryjoin='RelatedDatasets.DatasetID == Datasets.DatasetID')
    RelatedDatasetObj = relationship(Datasets, primaryjoin='RelatedDatasets.RelatedDatasetID == Datasets.DatasetID')


class RelatedResults(Base):
    __tablename__ = u'relatedresults'
    __table_args__ = {u'schema': u'odm2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    ResultID = Column(ForeignKey('odm2.results.ResultID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey('odm2.cv_relationshiptype.Name'), nullable=False, index=True)
    RelatedResultID = Column(ForeignKey('odm2.results.ResultID'), nullable=False)
    VersionCode = Column(String(50))
    RelatedResultSequenceNumber = Column(Integer)

    ResultObj = relationship(Results, primaryjoin='RelatedResults.RelatedResultID == Results.ResultID')
    RelatedResultObj = relationship(Results, primaryjoin='RelatedResults.ResultID == Results.ResultID')

# ################################################################################
# Results
# ################################################################################


class PointCoverageResults(Base):
    __tablename__ = u'pointcoverageresults'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(ForeignKey('odm2.results.ResultID'), primary_key=True)
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'))
    IntendedXSpacing = Column(Float(53))
    IntendedXSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    IntendedYSpacing = Column(Float(53))
    IntendedYSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(Integer, nullable=False)

    XUnitObj = relationship(Units, primaryjoin='PointCoverageResults.IntendedXSpacingUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='PointCoverageResults.IntendedYSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    ZUnitObj = relationship(Units, primaryjoin='PointCoverageResults.ZLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='PointCoverageResults.ResultID == Results.ResultID')


class ProfileResults(Base):
    __tablename__ = u'profileresults'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(ForeignKey('odm2.results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'))
    IntendedZSpacing = Column(Float(53))
    IntendedZSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)

    TimeUnitObj = relationship(Units, primaryjoin='ProfileResults.IntendedTimeSpacingUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='ProfileResults.IntendedZSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    XUnitObj = relationship(Units, primaryjoin='ProfileResults.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='ProfileResults.YLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='ProfileResults.ResultID == Results.ResultID')


class CategoricalResults(Base):
    __tablename__ = u'categoricalresults'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(ForeignKey('odm2.results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(Integer)
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(Integer)
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(Integer)
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'))
    QualityCodeCV = Column(ForeignKey('odm2.cv_qualitycode.Name'), nullable=False, index=True)

    SpatialReferenceObj = relationship(SpatialReferences)
    ResultObj = relationship(Results, primaryjoin='CategoricalResults.ResultID == Results.ResultID')


class TransectResults(Base):
    __tablename__ = u'transectresults'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(ForeignKey('odm2.results.ResultID'), primary_key=True)
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'))
    IntendedTransectSpacing = Column(Float(53))
    IntendedTransectSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)

    TimeUnitObj = relationship(Units, primaryjoin='TransectResults.IntendedTimeSpacingUnitsID == Units.UnitsID')
    TransectUnitObj = relationship(Units, primaryjoin='TransectResults.IntendedTransectSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    ZUnitObj = relationship(Units, primaryjoin='TransectResults.ZLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='TransectResults.ResultID == Results.ResultID')


class SpectraResults(Base):
    __tablename__ = u'spectraresults'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(ForeignKey('odm2.results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'))
    IntendedWavelengthSpacing = Column(Float(53))
    IntendedWavelengthSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)

    WaveUnitObj = relationship(Units, primaryjoin='SpectraResults.IntendedWavelengthSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    XUnitObj = relationship(Units, primaryjoin='SpectraResults.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='SpectraResults.YLocationUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='SpectraResults.ZLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='SpectraResults.ResultID == Results.ResultID')


class TimeSeriesResults(Base):
    __tablename__ = u'timeseriesresults'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(ForeignKey('odm2.results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)

    IntendedTimeSpacingUnitsObj = relationship(Units, primaryjoin='TimeSeriesResults.IntendedTimeSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    XLocationUnitsObj = relationship(Units, primaryjoin='TimeSeriesResults.XLocationUnitsID == Units.UnitsID')
    YLocationUnitsObj = relationship(Units, primaryjoin='TimeSeriesResults.YLocationUnitsID == Units.UnitsID')
    ZLocationUnitsObj = relationship(Units, primaryjoin='TimeSeriesResults.ZLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='TimeSeriesResults.ResultID == Results.ResultID')

    def __repr__(self):
        return "<TimeSeriesResults('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')>" % \
            (self.ResultID, self.XLocation, self.YLocation, self.XLocation,
             self.ResultObj,  self.XLocationUnitsObj, self.SpatialReferenceObj,
             self.IntendedTimeSpacing, self.AggregationStatisticCV )


class SectionResults(Base):
    __tablename__ = u'sectionresults'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(ForeignKey('odm2.results.ResultID'), primary_key=True)
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'))
    IntendedXSpacing = Column(Float(53))
    IntendedXSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    IntendedZSpacing = Column(Float(53))
    IntendedZSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)

    TimeUnitObj = relationship(Units, primaryjoin='SectionResults.IntendedTimeSpacingUnitsID == Units.UnitsID')
    XUnitObj = relationship(Units, primaryjoin='SectionResults.IntendedXSpacingUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='SectionResults.IntendedZSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    YUnitObj = relationship(Units, primaryjoin='SectionResults.YLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='SectionResults.ResultID == Results.ResultID')


class TrajectoryResults(Base):
    __tablename__ = u'trajectoryresults'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(ForeignKey('odm2.results.ResultID'), primary_key=True)
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'))
    IntendedTrajectorySpacing = Column(Float(53))
    IntendedTrajectorySpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)

    TimeUnitObj = relationship(Units, primaryjoin='TrajectoryResults.IntendedTimeSpacingUnitsID == Units.UnitsID')
    TrajectoryUnitObj = relationship(Units,
                                     primaryjoin='TrajectoryResults.IntendedTrajectorySpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    ResultObj = relationship(Results, primaryjoin='TrajectoryResults.ResultID == Results.ResultID')


class MeasurementResults(Base):
    __tablename__ = u'measurementresults'
    __table_args__ = {u'schema': u'odm2'}

    ResultID = Column(ForeignKey('odm2.results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('odm2.spatialreferences.SpatialReferenceID'))
    CensorCodeCV = Column(ForeignKey('odm2.cv_censorcode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey('odm2.cv_qualitycode.Name'), nullable=False, index=True)
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)

    SpatialReferenceObj = relationship(SpatialReferences)
    TimeUnitObj = relationship(Units, primaryjoin='MeasurementResults.TimeAggregationIntervalUnitsID == Units.UnitsID')
    XUnitObjObj = relationship(Units, primaryjoin='MeasurementResults.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='MeasurementResults.YLocationUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='MeasurementResults.ZLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='MeasurementResults.ResultID == Results.ResultID')


class CategoricalResultValues(Base):
    __tablename__ = u'categoricalresultvalues'
    __table_args__ = {u'schema': u'odm2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('odm2.categoricalresults.ResultID'), nullable=False)
    DataValue = Column(String(255), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    CategoricalResultObj = relationship(CategoricalResults)


class MeasurementResultValues(Base):
    __tablename__ = u'measurementresultvalues'
    __table_args__ = {u'schema': u'odm2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('odm2.measurementresults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    MeasurementResultObj = relationship(MeasurementResults)


class PointCoverageResultValues(Base):
    __tablename__ = u'pointcoverageresultvalues'
    __table_args__ = {u'schema': u'odm2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('odm2.pointcoverageresults.ResultID'), nullable=False)
    DataValue = Column(BigInteger, nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    YLocation = Column(Float(53), nullable=False)
    YLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    CensorCodeCV = Column(ForeignKey('odm2.cv_censorcode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey('odm2.cv_qualitycode.Name'), nullable=False, index=True)

    PointCoverageResultObj = relationship(PointCoverageResults)
    XUnitObj = relationship(Units, primaryjoin='PointCoverageResultValues.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='PointCoverageResultValues.YLocationUnitsID == Units.UnitsID')


class ProfileResultValues(Base):
    __tablename__ = u'profileresultvalues'
    __table_args__ = {u'schema': u'odm2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('odm2.profileresults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    ZLocation = Column(Float(53), nullable=False)
    ZAggregationInterval = Column(Float(53), nullable=False)
    ZLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    CensorCodeCV = Column(ForeignKey('odm2.cv_censorcode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey('odm2.cv_qualitycode.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)

    ProfileResultObj = relationship(ProfileResults)
    TimeUnitObj = relationship(Units, primaryjoin='ProfileResultValues.TimeAggregationIntervalUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='ProfileResultValues.ZLocationUnitsID == Units.UnitsID')


class SectionResultValues(Base):
    __tablename__ = u'sectionresultvalues'
    __table_args__ = {u'schema': u'odm2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('odm2.sectionresults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(BigInteger, nullable=False)
    ValueDateTimeUTCOffset = Column(BigInteger, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XAggregationInterval = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    ZLocation = Column(BigInteger, nullable=False)
    ZAggregationInterval = Column(Float(53), nullable=False)
    ZLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    CensorCodeCV = Column(ForeignKey('odm2.cv_censorcode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey('odm2.cv_qualitycode.Name'), nullable=False, index=True)
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)

    SectionResultObj = relationship(SectionResults)
    TimeUnitObj = relationship(Units, primaryjoin='SectionResultValues.TimeAggregationIntervalUnitsID == Units.UnitsID')
    XUnitObj = relationship(Units, primaryjoin='SectionResultValues.XLocationUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='SectionResultValues.ZLocationUnitsID == Units.UnitsID')


class SpectraResultValues(Base):
    __tablename__ = u'spectraresultvalues'
    __table_args__ = {u'schema': u'odm2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('odm2.spectraresults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    ExcitationWavelength = Column(Float(53), nullable=False)
    EmissionWavelength = Column(Float(53), nullable=False)
    WavelengthUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    CensorCodeCV = Column(ForeignKey('odm2.cv_censorcode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey('odm2.cv_qualitycode.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)

    SpectraResultObj = relationship(SpectraResults)
    TimeUnitObj = relationship(Units, primaryjoin='SpectraResultValues.TimeAggregationIntervalUnitsID == Units.UnitsID')
    WavelengthUnitObj = relationship(Units, primaryjoin='SpectraResultValues.WavelengthUnitsID == Units.UnitsID')


class TimeSeriesResultValues(Base):
    __tablename__ = u'timeseriesresultvalues'
    __table_args__ = {u'schema': u'odm2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('odm2.timeseriesresults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    CensorCodeCV = Column(ForeignKey('odm2.cv_censorcode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey('odm2.cv_qualitycode.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)

    TimeSeriesResultObj = relationship(TimeSeriesResults)
    TimeUnitObj = relationship(Units)

    def get_columns(self):
        return ["ValueID", "ResultID", "DataValue", "ValueDateTime", "ValueDateTimeUTCOffset",
                "CensorCodeCV", "QualityCodeCV", "TimeAggregationInterval", "TimeAggregationIntervalUnitsID"]

    def list_repr(self):
        return [self.ValueID, self.ResultID, self.DataValue, self.ValueDateTime, self.ValueDateTimeUTCOffset,
                self.CensorCodeCV, self.QualityCodeCV, self.TimeAggregationInterval,
                self.TimeAggregationIntervalUnitsID]

    def __repr__(self):
        return "<DataValue('%s', '%s', '%s')>" % (self.DataValue, self.ValueDateTime, self.TimeAggregationInterval)


class TrajectoryResultValues(Base):
    __tablename__ = u'trajectoryresultvalues'
    __table_args__ = {u'schema': u'odm2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('odm2.trajectoryresults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    YLocation = Column(Float(53), nullable=False)
    YLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    ZLocation = Column(Float(53), nullable=False)
    ZLocationUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)
    TrajectoryDistance = Column(Float(53), nullable=False)
    TrajectoryDistanceAggregationInterval = Column(Float(53), nullable=False)
    TrajectoryDistanceUnitsID = Column(Integer, nullable=False)
    CensorCodeCV = Column(ForeignKey('odm2.cv_censorcode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey('odm2.cv_qualitycode.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('odm2.units.UnitsID'), nullable=False)

    TrajectoryResultObj = relationship(TrajectoryResults)
    TimeUnitObj = relationship(Units, primaryjoin='TrajectoryResultValues.TimeAggregationIntervalUnitsID == Units.UnitsID')
    XUnitObj = relationship(Units, primaryjoin='TrajectoryResultValues.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='TrajectoryResultValues.YLocationUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='TrajectoryResultValues.ZLocationUnitsID == Units.UnitsID')


class TransectResultValues(Base):
    __tablename__ = u'transectresultvalues'
    __table_args__ = {u'schema': u'odm2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('odm2.transectresults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(DateTime, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(Integer, nullable=False)
    YLocation = Column(Float(53), nullable=False)
    YLocationUnitsID = Column(Integer, nullable=False)
    TransectDistance = Column(Float(53), nullable=False)
    TransectDistanceAggregationInterval = Column(Float(53), nullable=False)
    TransectDistanceUnitsID = Column(Integer, nullable=False)
    CensorCodeCV = Column(ForeignKey('odm2.cv_censorcode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey('odm2.cv_qualitycode.Name'), nullable=False, index=True)
    AggregationStatisticCV = Column(ForeignKey('odm2.cv_aggregationstatistic.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(Integer, nullable=False)

    TransectResultObj = relationship(TransectResults)
