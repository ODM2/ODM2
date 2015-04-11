__author__ = 'jmeline'

from sqlalchemy import BigInteger, Column, Date, DateTime, Float, ForeignKey, Integer, String, Boolean, func, Table
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.dialects.mssql.base import BIT

from apiCustomType import Geometry

Base = declarative_base()
metadata = Base.metadata



# ################################################################################
# CV
# ################################################################################

class CVTerms(Base):
    __tablename__ = u'CVTerms'
    __table_args__ = {u'schema': 'ODM2'}

    TermID = Column(Integer, primary_key=True, nullable=False)
    Term = Column(String(255), nullable=False)
    Definition = Column(String(500))
    ODMVocabulary = Column(String(255), nullable=False)
    SourceVocabulary = Column(String(255))

class CVActionType(Base):
    __tablename__ = 'CV_ActionType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVAggregationStatistic(Base):
    __tablename__ = 'CV_AggregationStatistic'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVAnnotationType(Base):
    __tablename__ = 'CV_AnnotationType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVCensorCode(Base):
    __tablename__ = 'CV_CensorCode'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVDatasetType(Base):
    __tablename__ = 'CV_DatasetType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVDirectiveType(Base):
    __tablename__ = 'CV_DirectiveType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVElevationDatum(Base):
    __tablename__ = 'CV_ElevationDatum'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVEquipmentType(Base):
    __tablename__ = 'CV_EquipmentType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVMethodType(Base):
    __tablename__ = 'CV_MethodType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVOrganizationType(Base):
    __tablename__ = 'CV_OrganizationType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVPropertyDataType(Base):
    __tablename__ = 'CV_PropertyDataType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVQualityCode(Base):
    __tablename__ = 'CV_QualityCode'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVResultType(Base):
    __tablename__ = 'CV_ResultType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSampledMedium(Base):
    __tablename__ = 'CV_SampledMedium'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSamplingFeatureGeoType(Base):
    __tablename__ = 'CV_SamplingFeatureGeoType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSamplingFeatureType(Base):
    __tablename__ = 'CV_SamplingFeatureType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSpatialOffsetType(Base):
    __tablename__ = 'CV_SpatialOffsetType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSpeciation(Base):
    __tablename__ = 'CV_Speciation'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSpecimenMedium(Base):
    __tablename__ = 'CV_SpecimenMedium'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVSpecimenType(Base):
    __tablename__ = 'CV_SpecimenType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))

class CVReferenceMaterialMedium(Base):
    __tablename__ = 'CV_ReferenceMaterialMedium'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))

class CVSiteType(Base):
    __tablename__ = 'CV_SiteType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVStatus(Base):
    __tablename__ = 'CV_Status'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVTaxonomicClassifierType(Base):
    __tablename__ = 'CV_TaxonomicClassifierType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVUnitsType(Base):
    __tablename__ = 'CV_UnitsType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVVariableName(Base):
    __tablename__ = 'CV_VariableName'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))


class CVVariableType(Base):
    __tablename__ = 'CV_VariableType'
    __table_args__ = {u'schema': 'ODM2'}

    Term = Column(String(255), nullable=False)
    Name = Column(String(255), primary_key=True)
    Definition = Column(String(500))
    Category = Column(String(255))
    SourceVocabularyURI = Column(String(255))



# ################################################################################
# Core
# ################################################################################
class People(Base):
    __tablename__ = u'People'
    __table_args__ = {u'schema': u'ODM2'}

    PersonID = Column(Integer, primary_key=True, nullable=False)
    PersonFirstName = Column(String(255), nullable=False)
    PersonMiddleName = Column(String(255))
    PersonLastName = Column(String(255), nullable=False)

    def __repr__(self):
        return "<Person('%s', '%s', '%s')>" % (self.PersonID, self.PersonFirstName,
                                               self.PersonLastName)

class Organizations(Base):
    __tablename__ = u'Organizations'
    __table_args__ = {u'schema': u'ODM2'}

    OrganizationID = Column(Integer, primary_key=True, nullable=False)
    OrganizationTypeCV = Column(ForeignKey(u'ODM2.CV_OrganizationType.Name'), nullable=False, index=True)
    OrganizationCode = Column(String(50), nullable=False)
    OrganizationName = Column(String(255), nullable=False)
    OrganizationDescription = Column(String(500))
    OrganizationLink = Column(String(255))
    ParentOrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'))

    parent = relationship(u'Organizations', remote_side=[OrganizationID])


class Affiliations(Base):
    __tablename__ = 'Affiliations'
    __table_args__ = {u'schema': 'ODM2'}

    AffiliationID = Column(Integer, primary_key=True, nullable=False)
    PersonID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    OrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'))
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
    __tablename__ = 'Methods'
    __table_args__ = {u'schema': 'ODM2'}

    MethodID = Column(Integer, primary_key=True, nullable=False)
    MethodTypeCV = Column(ForeignKey(u'ODM2.CV_MethodType.Name'), nullable=False, index=True)
    MethodCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    MethodLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    OrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'))

    OrganizationObj = relationship(Organizations)

    def __repr__(self):
        return "<Methods('%s', '%s', '%s', '%s', '%s', '%s', '%s')>" \
               % (self.MethodID, self.MethodTypeCV, self.MethodCode, self.MethodName, self.MethodDescription, self.MethodLink, self.OrganizationID)


class Actions(Base):
    __tablename__ = u'Actions'
    __table_args__ = {u'schema': u'ODM2'}

    ActionID = Column(Integer, primary_key=True, nullable=False)
    ActionTypeCV = Column(ForeignKey(u'ODM2.CV_ActionType.Name'), nullable=False, index=True)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
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
    __tablename__ = u'ActionBy'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    AffiliationID = Column(ForeignKey('ODM2.Affiliations.AffiliationID'), nullable=False)
    IsActionLead = Column(Boolean, nullable=False)
    RoleDescription = Column(String(500))

    ActionObj = relationship(Actions)
    AffiliationObj = relationship(Affiliations)


class SamplingFeatures(Base):
    __tablename__ = u'SamplingFeatures'
    __table_args__ = {u'schema': u'ODM2'}

    SamplingFeatureID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureUUID = Column(String(36), nullable=False)
    SamplingFeatureTypeCV = Column(ForeignKey(u'ODM2.CV_SamplingFeatureType.Name'), nullable=False, index=True)
    SamplingFeatureCode = Column(String(50), nullable=False)
    SamplingFeatureName = Column(String(255))
    SamplingFeatureDescription = Column(String(500))
    SamplingFeatureGeotypeCV = Column(ForeignKey(u'ODM2.CV_SamplingFeatureGeoType.Name'), index=True)
    Elevation_m = Column(Float(53))
    ElevationDatumCV = Column(ForeignKey(u'ODM2.CV_ElevationDatum.Name'), index=True)
    FeatureGeometry = Column(Geometry)

    def __repr__(self):
        return "<SamplingFeatures('%s', '%s', '%s', '%s')>" % (
            self.SamplingFeatureCode, self.SamplingFeatureName, self.SamplingFeatureDescription, self.Elevation_m)#self.FeatureGeometry)


class FeatureActions(Base):
    __tablename__ = u'FeatureActions'
    __table_args__ = {u'schema': u'ODM2'}

    FeatureActionID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)

    ActionObj = relationship(Actions)
    SamplingFeatureObj = relationship(SamplingFeatures)


    def __repr__(self):
        return "<FeatureActions('%s', '%s', '%s', )>" % (self.FeatureActionID, self.SamplingFeatureID, self.ActionID)


class Datasets(Base):
    __tablename__ = u'Datasets'
    __table_args__ = {u'schema': 'ODM2'}

    DatasetID = Column(Integer, primary_key=True, nullable=False)

    # This has been changed to String to support multiple database uuid types

    DatasetUUID = Column(String(255), nullable=False)
    DatasetTypeCV = Column(ForeignKey(u'ODM2.CV_DatasetTypeCV.Name'), nullable=False, index=True)
    DatasetCode = Column(String(50), nullable=False)
    DatasetTitle = Column(String(255), nullable=False)
    DatasetAbstract = Column(String(500), nullable=False)

    def __repr__(self):
        return "<Datasets('%s', '%s', '%s', '%s', '%s')>" % (
            self.DatasetUUID, self.DatasetTypeCV, self.DatasetCode, self.DatasetTitle, self.DatasetAbstract)


class ProcessingLevels(Base):
    __tablename__ = 'ProcessingLevels'
    __table_args__ = {u'schema': 'ODM2'}

    ProcessingLevelID = Column(Integer, primary_key=True, nullable=False)
    ProcessingLevelCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    Definition = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    Explanation = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))



    def __repr__(self):
        return "<ProcessingLevels('%s', '%s', '%s', '%s')>" \
               % (self.ProcessingLevelID, self.ProcessingLevelCode, self.Definition, self.Explanation)


class RelatedActions(Base):
    __tablename__ = 'RelatedActions'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    ActionTypeCV = Column(ForeignKey(u'ODM2.CV_ActionType.Name'), nullable=False, index=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    RelationshipTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    RelatedActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)

    ActionObj = relationship(Actions, primaryjoin='RelatedActions.ActionID == Actions.ActionID')
    RelatedActionObj = relationship(Actions, primaryjoin='RelatedActions.RelatedActionID == Actions.ActionID')


class TaxonomicClassifiers(Base):
    __tablename__ = 'TaxonomicClassifiers'
    __table_args__ = {u'schema': 'ODM2'}

    TaxonomicClassifierID = Column(Integer, primary_key=True, nullable=False)
    TaxonomicClassifierTypeCV = Column(ForeignKey(u'ODM2.CV_TaxonomicClassifierType.Name'), nullable=False, index=True)
    TaxonomicClassifierName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    TaxonomicClassifierCommonName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    TaxonomicClassifierDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    ParentTaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'))

    parent = relationship(u'TaxonomicClassifiers', remote_side=[TaxonomicClassifierID])


class Units(Base):
    __tablename__ = 'Units'
    __table_args__ = {u'schema': 'ODM2'}

    UnitsID = Column(Integer, primary_key=True, nullable=False)
    UnitsTypeCV = Column(ForeignKey(u'ODM2.CV_UnitsType.Name'), nullable=False, index=True)
    UnitsAbbreviation = Column(String(255), nullable=False)
    UnitsName = Column(String, nullable=False)
    UnitsLink = Column(String(255))

    def __repr__(self):
        return "<Units('%s', '%s', '%s', '%s')>" % (self.UnitsID, self.UnitsTypeCV, self.UnitsAbbreviation, self.UnitsName)


class Variables(Base):
    __tablename__ = u'Variables'
    __table_args__ = {u'schema': 'ODM2'}

    VariableID = Column(Integer, primary_key=True, nullable=False)
    VariableTypeCV = Column(ForeignKey(u'ODM2.CV_VariableType.Name'), nullable=False, index=True)
    VariableCode = Column(String(50), nullable=False)
    VariableNameCV = Column(ForeignKey(u'ODM2.CV_VariableName.Name'), nullable=False, index=True)
    VariableDefinition = Column(String(500))
    SpeciationCV = Column(ForeignKey(u'ODM2.CV_Speciation.Name'), index=True)
    NoDataValue = Column(Float(asdecimal=True), nullable=False)


    def __repr__(self):
        return "<Variables('%s', '%s', '%s')>" % (self.VariableID, self.VariableCode, self.VariableNameCV)

'''
class ResultTypeCV(Base):
    __tablename__ = u'ResultTypeCV'
    __table_args__ = {u'schema': u'ODM2'}

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
    __tablename__ = u'Results'
    __table_args__ = {u'schema': u'ODM2'}

    ResultID = Column(BigInteger, primary_key=True)

    # This has been changed to String to support multiple database uuid types
    # ResultUUID = Column(UNIQUEIDENTIFIER, nullable=False)
    ResultUUID = Column(String(36), nullable=False)
    FeatureActionID = Column(ForeignKey('ODM2.FeatureActions.FeatureActionID'), nullable=False)
    ResultTypeCV = Column(ForeignKey(u'ODM2.CV_ResultType.Name'), nullable=False, index=True)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'))
    ProcessingLevelID = Column(ForeignKey('ODM2.ProcessingLevels.ProcessingLevelID'), nullable=False)
    ResultDateTime = Column(DateTime)
    ResultDateTimeUTCOffset = Column(BigInteger)
    ValidDateTime = Column(DateTime)
    ValidDateTimeUTCOffset = Column(BigInteger)
    StatusCV = Column(ForeignKey(u'ODM2.CV_Status.Name'), index=True)
    SampledMediumCV = Column(ForeignKey(u'ODM2.CV_SampledMedium.Name'), nullable=False, index=True)
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
    __tablename__ = u'EquipmentModels'
    __table_args__ = {u'schema': u'ODM2'}

    ModelID = Column(Integer, primary_key=True, nullable=False)
    ModelManufacturerID = Column(ForeignKey('ODM2.Organizations.OrganizationID'), nullable=False)
    ModelPartNumber = Column(String(50))
    ModelName = Column(String(255), nullable=False)
    ModelDescription = Column(String(500))
    ModelSpecificationsFileLink = Column(String(255))
    ModelLink = Column(String(255))
    IsInstrument = Column(BIT, nullable=False)

    OrganizationObj = relationship(Organizations)


class Equipment(Base):
    __tablename__ = u'Equipment'
    __table_args__ = {u'schema': 'ODM2'}

    EquipmentID = Column(Integer, primary_key=True, nullable=False)
    EquipmentCode = Column(String(50), nullable=False)
    EquipmentName = Column(String(255), nullable=False)
    EquipmentTypeCV = Column(ForeignKey(u'ODM2.CV_EquipmentType.Name'), nullable=False, index=True)
    ModelID = Column(ForeignKey('ODM2.EquipmentModels.ModelID'), nullable=False)
    EquipmentSerialNumber = Column(String(50), nullable=False)
    EquipmentInventoryNumber = Column(String(50))
    EquipmentOwnerID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    EquipmentVendorID = Column(ForeignKey('ODM2.Organizations.OrganizationID'), nullable=False)
    EquipmentPurchaseDate = Column(DateTime, nullable=False)
    EquipmentPurchaseOrderNumber = Column(String(50))
    EquipmentPhotoFileLink = Column(String(255))
    EquipmentDescription = Column(String(500))
    ParentEquipmentID = Column(ForeignKey('ODM2.Equipment.EquipmentID'))

    PersonObj = relationship(People)
    OrganizationObj = relationship(Organizations)
    EquipmentModelObj = relationship(EquipmentModels)

    parent = relationship(u'Equipment', remote_side=[EquipmentID])


class EquipmentAction(Base):
    __tablename__ = u'EquipmentActions'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    EquipmentID = Column(ForeignKey('ODM2.Equipment.EquipmentID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)

    ActionObj = relationship(Actions)
    EquipmentObj = relationship(Equipment)


class InstrumentOutputVariables(Base):
    __tablename__ = u'InstrumentOutputVariables'
    __table_args__ = {u'schema': 'ODM2'}

    InstrumentOutputVariableID = Column(Integer, primary_key=True, nullable=False)
    ModelID = Column(ForeignKey('ODM2.EquipmentModels.ModelID'), nullable=False)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    InstrumentMethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    InstrumentResolution = Column(String(255))
    InstrumentAccuracy = Column(String(255))
    InstrumentRawOutputUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    MethodObj = relationship(Methods)
    OutputUnitObj = relationship(Units)
    EquipmentModelObj = relationship(EquipmentModels)
    VariableObj = relationship(Variables)


# ################################################################################
# Lab Analyses
# ################################################################################
class Directives(Base):
    __tablename__ = u'Directives'
    __table_args__ = {u'schema': u'ODM2'}

    DirectiveID = Column(Integer, primary_key=True, nullable=False)
    DirectiveTypeCV = Column(ForeignKey(u'ODM2.CV_DirectiveType.Name'), nullable=False, index=True)
    DirectiveDescription = Column(String(500), nullable=False)


class ActionDirectives(Base):
    __tablename__ = u'ActionDirectives'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    DirectiveID = Column(ForeignKey('ODM2.Directives.DirectiveID'), nullable=False)

    ActionObj = relationship(Actions)
    DirectiveObj = relationship(Directives)


# ################################################################################
# Sampling Features
# ################################################################################
class SpatialReferences(Base):
    __tablename__ = u'SpatialReferences'
    __table_args__ = {u'schema': u'ODM2'}

    SpatialReferenceID = Column(Integer, primary_key=True, nullable=False)
    SRSCode = Column(String(50))
    SRSName = Column(String(255), nullable=False)
    SRSDescription = Column(String(500))
    SRSLink = Column(String(255))

    def __repr__(self):
        return "<SpatialReferences('%s', '%s', '%s', '%s', '%s')>" \
               % (self.SpatialReferenceID, self.SRSCode, self.SRSName, self.SRSDescription, self.SRSLink)


class Specimen(Base):
    __tablename__ = u'Specimens'
    __table_args__ = {u'schema': 'ODM2'}

    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), primary_key=True)
    SpecimenTypeCV = Column(ForeignKey(u'ODM2.CV_SpecimenType.Name'), nullable=False, index=True)
    SpecimenMediumCV = Column(ForeignKey(u'ODM2.CV_SpecimenMedium.Name'), nullable=False, index=True)
    IsFieldSpecimen = Column(BIT, nullable=False)


class Spatialoffset(Base):
    __tablename__ = u'SpatialOffsets'
    __table_args__ = {u'schema': u'ODM2'}

    SpatialOffsetID = Column(Integer, primary_key=True, nullable=False)
    SpatialOffsetTypeCV = Column(ForeignKey(u'ODM2.CV_SpatialOffsetType.Name'), nullable=False, index=True)
    Offset1Value = Column(Float(53), nullable=False)
    Offset1UnitID = Column(Integer, nullable=False)
    Offset2Value = Column(Float(53))
    Offset2UnitID = Column(Integer)
    Offset3Value = Column(Float(53))
    Offset3UnitID = Column(Integer)


class Sites(Base):
    __tablename__ = u'Sites'
    __table_args__ = {u'schema': 'ODM2'}

    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), primary_key=True)
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'), nullable=False)
    SiteTypeCV = Column(ForeignKey(u'ODM2.CV_SiteType.Name'), nullable=False, index=True)
    Latitude = Column(Float(53), nullable=False)
    Longitude = Column(Float(53), nullable=False)
    # LatLonDatumID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'), nullable=False)

    SpatialReferenceObj = relationship(SpatialReferences)
    SamplingFeatureObj = relationship(SamplingFeatures)

    def __repr__(self):
        return "<Sites('%s', '%s', '%s', '%s', '%s', '%s', '%s')>" \
               % (self.SamplingFeatureID, self.SpatialReferenceID, self.SiteTypeCV, self.Latitude, self.Longitude,
                  self.SpatialReferenceObj, self.SamplingFeatureObj)


class RelatedFeatures(Base):
    __tablename__ = u'RelatedFeatures'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey(u'ODM2.CV_RelationshipType.Name'), nullable=False, index=True)
    RelatedFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    SpatialOffsetID = Column(ForeignKey('ODM2.SpatialOffsets.SpatialOffsetID'))

    SamplingFeatureObj = relationship(SamplingFeatures,
                                      primaryjoin='RelatedFeatures.RelatedFeatureID == SamplingFeatures.SamplingFeatureID')
    RelatedFeatureObj = relationship(SamplingFeatures,
                                     primaryjoin='RelatedFeatures.SamplingFeatureID == SamplingFeatures.SamplingFeatureID')
    SpatialOffsetObj = relationship(Spatialoffset)


class SpecimenTaxonomicClassifiers(Base):
    __tablename__ = u'SpecimenTaxonomicClassifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('ODM2.Specimens.SamplingFeatureID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'), nullable=False)
    CitationID = Column(Integer)

    SpecimenObj = relationship(Specimen)
    TaxonomicClassifierObj = relationship(TaxonomicClassifiers)


# ################################################################################
# Sensors
# ################################################################################
class DeploymentActions(Base):
    __tablename__ = u'DeploymentActions'
    __table_args__ = {u'schema': u'ODM2'}

    DeploymentActionID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    DeploymentTypeCV = Column(ForeignKey(u'ODM2.CV_DeploymentType.Name'), nullable=False, index=True)
    DeploymentDescription = Column(String(500))
    ConfigurationActionID = Column(Integer, nullable=False)
    CalibrationActionID = Column(Integer, nullable=False)
    SpatialOffsetID = Column(Integer)
    DeploymentSchematicLink = Column(String(255))

    ActionObj = relationship(Actions)


class DataLoggerFiles(Base):
    __tablename__ = u'DataLoggerFiles'
    __table_args__ = {u'schema': 'ODM2'}

    DataLoggerFileID = Column(Integer, primary_key=True, nullable=False)
    DeploymentActionID = Column(ForeignKey('ODM2.DeploymentActions.DeploymentActionID'), nullable=False)
    DataLoggerOutputFileLink = Column(String(255), nullable=False)
    DataLoggerOutputFileDescription = Column(String(500))

    DeploymentActionObj = relationship(DeploymentActions)


class Photos(Base):
    __tablename__ = u'Photos'
    __table_args__ = {u'schema': 'ODM2'}

    PhotoID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    PhotoFileLink = Column(String(255), nullable=False)
    PhotoDescription = Column(String(500))

    ActionObj = relationship(Actions)


# ################################################################################
# Simulation
# ################################################################################
class Models(Base):
    __tablename__ = 'Models'
    __table_args__ = {u'schema': 'ODM2'}

    ModelID = Column(Integer, primary_key=True, nullable=False)
    ModelCode = Column(String(255), nullable=False)
    ModelName = Column(String(255), nullable=False)
    ModelDescription = Column(String(500))


class RelatedModels(Base):
    __tablename__ = 'RelatedModels'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    ModelID = Column(ForeignKey('ODM2.Models.ModelID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey(u'ODM2.CV_RelationshipType.Name'), nullable=False, index=True)
    RelatedModelID = Column(ForeignKey('ODM2.Models.ModelID'), nullable=False)

    ModelObj = relationship(Models, primaryjoin='RelatedModels.ModelID == Models.ModelID')
    RelatedModelObj = relationship(Models, primaryjoin='RelatedModels.RelatedModelID == Models.ModelID')


class Simulations(Base):
    __tablename__ = 'Simulations'
    __table_args__ = {u'schema': 'ODM2'}

    SimulationID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    SimulationName = Column(String(255), nullable=False)
    SimulationDescription = Column(String(500))
    SimulationStartDateTime = Column(Date, nullable=False)
    SimulationStartDateTimeUTCOffset = Column(Integer, nullable=False)
    SimulationEndDateTime = Column(Date, nullable=False)
    SimulationEndDateTimeUTCOffset = Column(Integer, nullable=False)
    TimeStepValue = Column(Float(53), nullable=False)
    TimeStepUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    InputDatasetID = Column(ForeignKey('ODM2.Datasets.DatasetID'))
    OutputDatasetID = Column(Integer)
    ModelID = Column(ForeignKey('ODM2.Models.ModelID'), nullable=False)

    Action = relationship(Actions)
    Dataset = relationship(Datasets)
    Model = relationship(Models)
    Unit = relationship(Units)


# Part of the Provenance table, needed here to meet dependancies
class Citations(Base):
    __tablename__ = u'Citations'
    __table_args__ = {u'schema': u'ODM2'}

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
    __tablename__ = u'Annotations'

    __table_args__ = {u'schema': u'ODM2'}

    AnnotationID = Column(Integer, primary_key=True, nullable=False)
    AnnotationTypeCV = Column(ForeignKey(u'ODM2.CV_AnnotationType.Name'), nullable=False, index=True)
    AnnotationCode = Column(String(50))
    AnnotationText = Column(String(500), nullable=False)
    AnnotationDateTime = Column(DateTime)
    AnnotationUTCOffset = Column(Integer)
    AnnotationLink = Column(String(255))
    AnnotatorID = Column(ForeignKey('ODM2.People.PersonID'))
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'))

    PersonObj = relationship(People)
    CitationObj = relationship(Citations)


class ActionAnnotations(Base):
    __tablename__ = u'ActionAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    ActionObj = relationship(Actions)
    AnnotationObj = relationship(Annotations)


class MethodAnnotations(Base):
    __tablename__ = u'MethodAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotations)
    MethodObj = relationship(Methods)


class ResultAnnotations(Base):
    __tablename__ = u'ResultAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    EndDateTime = Column(DateTime, nullable=False)

    AnnotationObj = relationship(Annotations)
    ResultObj = relationship(Results)


class ResultValueAnnotations(Base):
    __tablename__ = u'ResultValueAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ValueID = Column(BigInteger, nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotations)


class SamplingFeatureAnnotations(Base):
    __tablename__ = u'SamplingFeatureAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotations)
    SamplingFeatureObj = relationship(SamplingFeatures)

# ################################################################################
# Data Quality
# ################################################################################
class DatasetsResults(Base):
    __tablename__ = u'DatasetsResults'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    DatasetID = Column(ForeignKey('ODM2.Datasets.DatasetID'), nullable=False)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)

    DatasetObj = relationship(Datasets)
    ResultObj = relationship(Results)


class DataQuality(Base):
    __tablename__ = 'DataQuality'
    __table_args__ = {u'schema': 'ODM2'}

    DataQualityID = Column(Integer, primary_key=True, nullable=False)
    DataQualityTypeCV = Column(ForeignKey(u'ODM2.CV_DataQualityType.Name'), nullable=False, index=True)
    DataQualityCode = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    DataQualityValue = Column(Float(53))
    DataQualityValueUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    DataQualityDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    DataQualityLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))

    UnitObj = relationship(Units)


class ReferenceMaterials(Base):
    __tablename__ = 'ReferenceMaterials'
    __table_args__ = {u'schema': 'ODM2'}

    ReferenceMaterialID = Column(Integer, primary_key=True, nullable=False)
    ReferenceMaterialMediumCV = Column(ForeignKey(u'ODM2.CV_ReferenceMaterialMedium.Name'), nullable=False, index=True)
    ReferenceMaterialOrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'), nullable=False)
    ReferenceMaterialCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    ReferenceMaterialLotCode = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    ReferenceMaterialPurchaseDate = Column(DateTime)
    ReferenceMaterialExpirationDate = Column(DateTime)
    ReferenceMaterialCertificateLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'))

    OrganizationObj = relationship(Organizations)
    SamplingFeatureObj = relationship(SamplingFeatures)


ResultNormalizationValues = Table(
    u'ResultNormalizationValues', Base.metadata,
    Column(u'ResultID', ForeignKey('ODM2.Results.ResultID'), primary_key=True),
    Column(u'NormalizedByReferenceMaterialValueID', ForeignKey('ODM2.ReferenceMaterialValues.ReferenceMaterialValueID'),
           nullable=False),
    schema='ODM2'
)


class Referencematerialvalue(Base):
    __tablename__ = u'ReferenceMaterialValues'
    __table_args__ = {u'schema': 'ODM2'}

    ReferenceMaterialValueID = Column(Integer, primary_key=True, nullable=False)
    ReferenceMaterialID = Column(ForeignKey('ODM2.ReferenceMaterials.ReferenceMaterialID'), nullable=False)
    ReferenceMaterialValue = Column(Float(53), nullable=False)
    ReferenceMaterialAccuracy = Column(Float(53))
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citations)
    ReferenceMaterialObj = relationship(ReferenceMaterials)
    UnitObj = relationship(Units)
    VariableObj = relationship(Variables)
    ResultsObj = relationship(Results, secondary=ResultNormalizationValues)


class ResultsDataQuality(Base):
    __tablename__ = 'ResultsDataQuality'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    DataQualityID = Column(ForeignKey('ODM2.DataQuality.DataQualityID'), nullable=False)

    DataQualityObj = relationship(DataQuality)
    ResultObj = relationship(Results)


# ################################################################################
# Extension Properties
# ################################################################################
class ExtensionProperties(Base):
    __tablename__ = u'ExtensionProperties'
    __table_args__ = {u'schema': u'ODM2'}

    PropertyID = Column(Integer, primary_key=True, nullable=False)
    PropertyName = Column(String(255), nullable=False)
    PropertyDescription = Column(String(500))
    PropertyDataTypeCV = Column(ForeignKey(u'ODM2.CV_PropertyDataType.Name'), nullable=False, index=True)
    PropertyUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))

    UnitObj = relationship(Units)


class ActionExtensionPropertyValues(Base):
    __tablename__ = u'ActionExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ActionObj = relationship(Actions)
    ExtensionPropertyObj = relationship(ExtensionProperties)


class CitationExtensionPropertyValues(Base):
    __tablename__ = u'CitationExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    CitationObj = relationship(Citations)
    ExtensionPropertyObj = relationship(ExtensionProperties)


class MethodExtensionPropertyValues(Base):
    __tablename__ = u'MethodExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    MethodObj = relationship(Methods)
    ExtensionPropertyObj = relationship(ExtensionProperties)


class ResultExtensionPropertyValues(Base):
    __tablename__ = u'ResultExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(ExtensionProperties)
    ResultObj = relationship(Results)


class SamplingFeatureExtensionPropertyValues(Base):
    __tablename__ = u'SamplingFeatureExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(ExtensionProperties)
    SamplingFeatureObj = relationship(SamplingFeatures)


class VariableExtensionPropertyValues(Base):
    __tablename__ = u'VariableExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(ExtensionProperties)
    VariableObj = relationship(Variables)


# ################################################################################
# Extension Identifiers
# ################################################################################
class ExternalIdentifierSystems(Base):
    __tablename__ = u'ExternalIdentifierSystems'
    __table_args__ = {u'schema': u'ODM2'}

    ExternalIdentifierSystemID = Column(Integer, primary_key=True, nullable=False)
    ExternalIdentifierSystemName = Column(String(255), nullable=False)
    IdentifierSystemOrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'), nullable=False)
    ExternalIdentifierSystemDescription = Column(String(500))
    ExternalIdentifierSystemURL = Column(String(255))

    OrganizationObj = relationship(Organizations)


class CitationExternalIdentifiers(Base):
    __tablename__ = u'CitationExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    CitationExternalIdentifer = Column(String(255), nullable=False)
    CitationExternalIdentiferURI = Column(String(255))

    CitationObj = relationship(Citations)
    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)


class MethodExternalIdentifiers(Base):
    __tablename__ = u'MethodExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    MethodExternalIdentifier = Column(String(255), nullable=False)
    MethodExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    MethodObj = relationship(Methods)


class PersonExternalIdentifiers(Base):
    __tablename__ = u'PersonExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    PersonID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    PersonExternalIdentifier = Column(String(255), nullable=False)
    PersonExternalIdenifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    PersonObj = relationship(People)


class ReferenceMaterialExternalIdentifiers(Base):
    __tablename__ = u'ReferenceMaterialExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    ReferenceMaterialID = Column(ForeignKey('ODM2.ReferenceMaterials.ReferenceMaterialID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    ReferenceMaterialExternalIdentifier = Column(String(255), nullable=False)
    ReferenceMaterialExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    ReferenceMaterialObj = relationship(ReferenceMaterials)


class SamplingFeatureExternalIdentifiers(Base):
    __tablename__ = u'SamplingFeatureExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    SamplingFeatureExternalIdentifier = Column(String(255), nullable=False)
    SamplingFeatureExternalIdentiferURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    SamplingFeatureObj = relationship(SamplingFeatures)


class SpatialReferenceExternalIdentifiers(Base):
    __tablename__ = u'SpatialReferenceExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    SpatialReferenceExternalIdentifier = Column(String(255), nullable=False)
    SpatialReferenceExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    SpatialReferenceObj = relationship(SpatialReferences)


class TaxonomicClassifierExternalIdentifiers(Base):
    __tablename__ = u'TaxonomicClassifierExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    TaxonomicClassifierExternalIdentifier = Column(String(255), nullable=False)
    TaxonomicClassifierExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    TaxonomicClassifierObj = relationship(TaxonomicClassifiers)


class VariableExternalIdentifiers(Base):
    __tablename__ = u'VariableExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    VariableExternalIdentifer = Column(String(255), nullable=False)
    VariableExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(ExternalIdentifierSystems)
    VariableObj = relationship(Variables)

# ################################################################################
# Provenance
# ################################################################################



class AuthorLists(Base):
    __tablename__ = u'AuthorLists'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    PersonID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    AuthorOrder = Column(Integer, nullable=False)

    CitationObj = relationship(Citations, primaryjoin='AuthorLists.CitationID == Citations.CitationID')
    PersonObj = relationship(People, primaryjoin='AuthorLists.PersonID == People.PersonID')

    def __repr__(self):
        return "<AuthorLists('%s', '%s', '%s', '%s', '%s', '%s')>" \
               % (self.BridgeID, self.CitationID, self.PersonID, self.AuthorOrder, self.CitationObj, self.PersonObj)


class DatasetCitations(Base):
    __tablename__ = u'DatasetCitations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    DatasetID = Column(ForeignKey('ODM2.Datasets.DatasetID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey(u'ODM2.CV_RelationshipType.Name'), nullable=False, index=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citations)
    DatasetObj = relationship(Datasets)


ResultDerivationEquations = Table(
    u'ResultDerivationEquations', Base.metadata,
    Column(u'ResultID', ForeignKey('ODM2.Results.ResultID'), primary_key=True),
    Column(u'DerivationEquationID', ForeignKey('ODM2.DerivationEquations.DerivationEquationID'), nullable=False),
    schema='ODM2'
)


class DerivationEquations(Base):
    __tablename__ = u'DerivationEquations'
    __table_args__ = {u'schema': 'ODM2'}

    DerivationEquationID = Column(Integer, primary_key=True, nullable=False)
    DerivationEquation = Column(String(255), nullable=False)

    ResultsObj = relationship(Results, secondary=ResultDerivationEquations)


class MethodCitations(Base):
    __tablename__ = u'MethodCitations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True, nullable=False)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey(u'ODM2.CV_RelationshipType.Name'), nullable=False, index=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citations)
    MethodObj = relationship(Methods)


# from ODM2.Annotations.model import Annotation
class RelatedAnnotations(Base):
    __tablename__ = u'RelatedAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey(u'ODM2.CV_RelationshipType.Name'), nullable=False, index=True)
    RelatedAnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotations, primaryjoin='RelatedAnnotations.AnnotationID == Annotations.AnnotationID')
    RelatedAnnotationObj = relationship(Annotations,
                                        primaryjoin='RelatedAnnotations.RelatedAnnotationID == Annotations.AnnotationID')


class RelatedCitations(Base):
    __tablename__ = u'RelatedCitations'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey(u'ODM2.CV_RelationshipType.Name'), nullable=False, index=True)
    RelatedCitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citations, primaryjoin='RelatedCitations.CitationID == Citations.CitationID')
    RelatedCitationObj = relationship(Citations, primaryjoin='RelatedCitations.RelatedCitationID == Citations.CitationID')


class RelatedDatasets(Base):
    __tablename__ = u'RelatedDatasets'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    DatasetID = Column(ForeignKey('ODM2.Datasets.DatasetID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey(u'ODM2.CV_RelationshipType.Name'), nullable=False, index=True)
    RelatedDatasetID = Column(ForeignKey('ODM2.Datasets.DatasetID'), nullable=False)
    VersionCode = Column(String(50))

    DatasetObj = relationship(Datasets, primaryjoin='RelatedDatasets.DatasetID == Datasets.DatasetID')
    RelatedDatasetObj = relationship(Datasets, primaryjoin='RelatedDatasets.RelatedDatasetID == Datasets.DatasetID')


class RelatedResults(Base):
    __tablename__ = u'RelatedResults'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True, nullable=False)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    RelationshipTypeCV = Column(ForeignKey(u'ODM2.CV_RelationshipType.Name'), nullable=False, index=True)
    RelatedResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    VersionCode = Column(String(50))
    RelatedResultSequenceNumber = Column(Integer)

    ResultObj = relationship(Results, primaryjoin='RelatedResults.RelatedResultID == Results.ResultID')
    RelatedResultObj = relationship(Results, primaryjoin='RelatedResults.ResultID == Results.ResultID')

# ################################################################################
# Results
# ################################################################################


class PointCoverageResults(Base):
    __tablename__ = u'PointCoverageResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    IntendedXSpacing = Column(Float(53))
    IntendedXSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    IntendedYSpacing = Column(Float(53))
    IntendedYSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(Integer, nullable=False)

    XUnitObj = relationship(Units, primaryjoin='PointCoverageResults.IntendedXSpacingUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='PointCoverageResults.IntendedYSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    ZUnitObj = relationship(Units, primaryjoin='PointCoverageResults.ZLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='PointCoverageResults.ResultID == Results.ResultID')


class ProfileResults(Base):
    __tablename__ = u'ProfileResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    IntendedZSpacing = Column(Float(53))
    IntendedZSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)

    TimeUnitObj = relationship(Units, primaryjoin='ProfileResults.IntendedTimeSpacingUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='ProfileResults.IntendedZSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    XUnitObj = relationship(Units, primaryjoin='ProfileResults.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='ProfileResults.YLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='ProfileResults.ResultID == Results.ResultID')


class CategoricalResults(Base):
    __tablename__ = u'CategoricalResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(Integer)
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(Integer)
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(Integer)
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    QualityCodeCV = Column(ForeignKey(u'ODM2.CV_QualityCode.Name'), nullable=False, index=True)

    SpatialReferenceObj = relationship(SpatialReferences)
    ResultObj = relationship(Results, primaryjoin='CategoricalResults.ResultID == Results.ResultID')


class TransectResults(Base):
    __tablename__ = u'TransectResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    IntendedTransectSpacing = Column(Float(53))
    IntendedTransectSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)

    TimeUnitObj = relationship(Units, primaryjoin='TransectResults.IntendedTimeSpacingUnitsID == Units.UnitsID')
    TransectUnitObj = relationship(Units, primaryjoin='TransectResults.IntendedTransectSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    ZUnitObj = relationship(Units, primaryjoin='TransectResults.ZLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='TransectResults.ResultID == Results.ResultID')


class SpectraResults(Base):
    __tablename__ = u'SpectraResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    IntendedWavelengthSpacing = Column(Float(53))
    IntendedWavelengthSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)

    WaveUnitObj = relationship(Units, primaryjoin='SpectraResults.IntendedWavelengthSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    XUnitObj = relationship(Units, primaryjoin='SpectraResults.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='SpectraResults.YLocationUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='SpectraResults.ZLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='SpectraResults.ResultID == Results.ResultID')


class TimeSeriesResults(Base):
    __tablename__ = u'TimeSeriesResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)

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
    __tablename__ = u'SectionResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    IntendedXSpacing = Column(Float(53))
    IntendedXSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    IntendedZSpacing = Column(Float(53))
    IntendedZSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)

    TimeUnitObj = relationship(Units, primaryjoin='SectionResults.IntendedTimeSpacingUnitsID == Units.UnitsID')
    XUnitObj = relationship(Units, primaryjoin='SectionResults.IntendedXSpacingUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='SectionResults.IntendedZSpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    YUnitObj = relationship(Units, primaryjoin='SectionResults.YLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='SectionResults.ResultID == Results.ResultID')


class TrajectoryResults(Base):
    __tablename__ = u'TrajectoryResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    IntendedTrajectorySpacing = Column(Float(53))
    IntendedTrajectorySpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)

    TimeUnitObj = relationship(Units, primaryjoin='TrajectoryResults.IntendedTimeSpacingUnitsID == Units.UnitsID')
    TrajectoryUnitObj = relationship(Units,
                                     primaryjoin='TrajectoryResults.IntendedTrajectorySpacingUnitsID == Units.UnitsID')
    SpatialReferenceObj = relationship(SpatialReferences)
    ResultObj = relationship(Results, primaryjoin='TrajectoryResults.ResultID == Results.ResultID')


class MeasurementResults(Base):
    __tablename__ = u'MeasurementResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    CensorCodeCV = Column(ForeignKey(u'ODM2.CV_CensorCode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey(u'ODM2.CV_QualityCode.Name'), nullable=False, index=True)
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    SpatialReferenceObj = relationship(SpatialReferences)
    TimeUnitObj = relationship(Units, primaryjoin='MeasurementResults.TimeAggregationIntervalUnitsID == Units.UnitsID')
    XUnitObjObj = relationship(Units, primaryjoin='MeasurementResults.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='MeasurementResults.YLocationUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='MeasurementResults.ZLocationUnitsID == Units.UnitsID')
    ResultObj = relationship(Results, primaryjoin='MeasurementResults.ResultID == Results.ResultID')


class CategoricalResultValues(Base):
    __tablename__ = u'CategoricalResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.CategoricalResults.ResultID'), nullable=False)
    DataValue = Column(String(255), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    CategoricalResultObj = relationship(CategoricalResults)


class MeasurementResultValues(Base):
    __tablename__ = u'MeasurementResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.MeasurementResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    MeasurementResultObj = relationship(MeasurementResults)


class PointCoverageResultValues(Base):
    __tablename__ = u'PointCoverageResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.PointCoverageResults.ResultID'), nullable=False)
    DataValue = Column(BigInteger, nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    YLocation = Column(Float(53), nullable=False)
    YLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    CensorCodeCV = Column(ForeignKey(u'ODM2.CV_CensorCode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey(u'ODM2.CV_QualityCode.Name'), nullable=False, index=True)

    PointCoverageResultObj = relationship(PointCoverageResults)
    XUnitObj = relationship(Units, primaryjoin='PointCoverageResultValues.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='PointCoverageResultValues.YLocationUnitsID == Units.UnitsID')


class ProfileResultValues(Base):
    __tablename__ = u'ProfileResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.ProfileResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    ZLocation = Column(Float(53), nullable=False)
    ZAggregationInterval = Column(Float(53), nullable=False)
    ZLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    CensorCodeCV = Column(ForeignKey(u'ODM2.CV_CensorCode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey(u'ODM2.CV_QualityCode.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    ProfileResultObj = relationship(u'ProfileResults')
    TimeUnitObj = relationship(Units, primaryjoin='ProfileResultValues.TimeAggregationIntervalUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='ProfileResultValues.ZLocationUnitsID == Units.UnitsID')


class SectionResultValues(Base):
    __tablename__ = u'SectionResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.SectionResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(BigInteger, nullable=False)
    ValueDateTimeUTCOffset = Column(BigInteger, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XAggregationInterval = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    ZLocation = Column(BigInteger, nullable=False)
    ZAggregationInterval = Column(Float(53), nullable=False)
    ZLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    CensorCodeCV = Column(ForeignKey(u'ODM2.CV_CensorCode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey(u'ODM2.CV_QualityCode.Name'), nullable=False, index=True)
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    SectionResultObj = relationship(SectionResults)
    TimeUnitObj = relationship(Units, primaryjoin='SectionResultValues.TimeAggregationIntervalUnitsID == Units.UnitsID')
    XUnitObj = relationship(Units, primaryjoin='SectionResultValues.XLocationUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='SectionResultValues.ZLocationUnitsID == Units.UnitsID')


class SpectraResultValues(Base):
    __tablename__ = u'SpectraResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.SpectraResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    ExcitationWavelength = Column(Float(53), nullable=False)
    EmissionWavelength = Column(Float(53), nullable=False)
    WavelengthUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    CensorCodeCV = Column(ForeignKey(u'ODM2.CV_CensorCode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey(u'ODM2.CV_QualityCode.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    SpectraResultObj = relationship(SpectraResults)
    TimeUnitObj = relationship(Units, primaryjoin='SpectraResultValues.TimeAggregationIntervalUnitsID == Units.UnitsID')
    WavelengthUnitObj = relationship(Units, primaryjoin='SpectraResultValues.WavelengthUnitsID == Units.UnitsID')


class TimeSeriesResultValues(Base):
    __tablename__ = u'TimeSeriesResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.TimeSeriesResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    CensorCodeCV = Column(ForeignKey(u'ODM2.CV_CensorCode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey(u'ODM2.CV_QualityCode.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

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
    __tablename__ = u'TrajectoryResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.TrajectoryResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    YLocation = Column(Float(53), nullable=False)
    YLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    ZLocation = Column(Float(53), nullable=False)
    ZLocationUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    TrajectoryDistance = Column(Float(53), nullable=False)
    TrajectoryDistanceAggregationInterval = Column(Float(53), nullable=False)
    TrajectoryDistanceUnitsID = Column(Integer, nullable=False)
    CensorCodeCV = Column(ForeignKey(u'ODM2.CV_CensorCode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey(u'ODM2.CV_QualityCode.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    TrajectoryResultObj = relationship(TrajectoryResults)
    TimeUnitObj = relationship(Units, primaryjoin='TrajectoryResultValues.TimeAggregationIntervalUnitsID == Units.UnitsID')
    XUnitObj = relationship(Units, primaryjoin='TrajectoryResultValues.XLocationUnitsID == Units.UnitsID')
    YUnitObj = relationship(Units, primaryjoin='TrajectoryResultValues.YLocationUnitsID == Units.UnitsID')
    ZUnitObj = relationship(Units, primaryjoin='TrajectoryResultValues.ZLocationUnitsID == Units.UnitsID')


class TransectResultValues(Base):
    __tablename__ = u'TransectResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.TransectResults.ResultID'), nullable=False)
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
    CensorCodeCV = Column(ForeignKey(u'ODM2.CV_CensorCode.Name'), nullable=False, index=True)
    QualityCodeCV = Column(ForeignKey(u'ODM2.CV_QualityCode.Name'), nullable=False, index=True)
    AggregationStatisticCV = Column(ForeignKey(u'ODM2.CV_AggregationStatistic.Name'), nullable=False, index=True)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(Integer, nullable=False)

    TransectResultObj = relationship(TransectResults)
