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

class Cvterm(Base):
    __tablename__ = u'CVTerms'
    __table_args__ = {u'schema': 'ODM2'}

    TermID = Column(Integer, primary_key=True)
    Term = Column(String(255), nullable=False)
    Definition = Column(String(500))
    ODMVocabulary = Column(String(255), nullable=False)
    SourceVocabulary = Column(String(255))


# ################################################################################
# Core
# ################################################################################



class Person(Base):
    __tablename__ = u'People'
    __table_args__ = {u'schema': u'ODM2'}

    PersonID = Column(Integer, primary_key=True)
    PersonFirstName = Column(String(255), nullable=False)
    PersonMiddleName = Column(String(255))
    PersonLastName = Column(String(255), nullable=False)

    def __repr__(self):
        return "<Person('%s', '%s', '%s')>" % (self.PersonID, self.PersonFirstName,
                                               self.PersonLastName)

class Organization(Base):
    __tablename__ = u'Organizations'
    __table_args__ = {u'schema': u'ODM2'}

    OrganizationID = Column(Integer, primary_key=True)
    OrganizationTypeCV = Column(String(255), nullable=False)
    OrganizationCode = Column(String(50), nullable=False)
    OrganizationName = Column(String(255), nullable=False)
    OrganizationDescription = Column(String(500))
    OrganizationLink = Column(String(255))
    ParentOrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'))

    parent = relationship(u'Organization', remote_side=[OrganizationID])


class Affiliation(Base):
    __tablename__ = 'Affiliations'
    __table_args__ = {u'schema': 'ODM2'}

    AffiliationID = Column(Integer, primary_key=True)
    PersonID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    OrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'))
    IsPrimaryOrganizationContact = Column(Boolean)
    AffiliationStartDate = Column(Date, nullable=False)
    AffiliationEndDate = Column(Date)
    PrimaryPhone = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'))
    PrimaryEmail = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    PrimaryAddress = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    PersonLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))

    OrganizationObj = relationship(Organization)
    PersonObj = relationship(Person)


class Method(Base):
    __tablename__ = 'Methods'
    __table_args__ = {u'schema': 'ODM2'}

    MethodID = Column(Integer, primary_key=True)
    MethodTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    MethodDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    MethodLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    OrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'))

    OrganizationObj = relationship(Organization)


class Action(Base):
    __tablename__ = u'Actions'
    __table_args__ = {u'schema': u'ODM2'}

    ActionID = Column(Integer, primary_key=True)
    ActionTypeCV = Column(String(255), nullable=False)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    BeginDateTimeUTCOffset = Column(Integer, nullable=False)
    EndDateTime = Column(DateTime)
    EndDateTimeUTCOffset = Column(Integer)
    ActionDescription = Column(String(500))
    ActionFileLink = Column(String(255))

    MethodObj = relationship(Method)


    def __repr__(self):
        return "<Action('%s', '%s', '%s', '%s')>" % (
            self.ActionID, self.ActionTypeCV, self.BeginDateTime, self.ActionDescription)


class Actionby(Base):
    __tablename__ = u'ActionBy'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    AffiliationID = Column(ForeignKey('ODM2.Affiliations.AffiliationID'), nullable=False)
    IsActionLead = Column(Boolean, nullable=False)
    RoleDescription = Column(String(500))

    ActionObj = relationship(Action)
    AffiliationObj = relationship(Affiliation)


class Samplingfeature(Base):
    __tablename__ = u'SamplingFeatures'
    __table_args__ = {u'schema': u'ODM2'}

    SamplingFeatureID = Column(Integer, primary_key=True)
    SamplingFeatureTypeCV = Column(String(255), nullable=False)
    SamplingFeatureCode = Column(String(50), nullable=False)
    SamplingFeatureName = Column(String(255))
    SamplingFeatureDescription = Column(String(500))
    SamplingFeatureGeotypeCV = Column(String(255))
    Elevation_m = Column(Float(53))
    ElevationDatumCV = Column(String(255))
    FeatureGeometry = Column(Geometry)

    def __repr__(self):
        return "<SamplingFeature('%s', '%s', '%s', '%s')>" % (
            self.SamplingFeatureCode, self.SamplingFeatureName, self.SamplingFeatureDescription, self.FeatureGeometry)


class Featureaction(Base):
    __tablename__ = u'FeatureActions'
    __table_args__ = {u'schema': u'ODM2'}

    FeatureActionID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)

    ActionObj = relationship(Action)
    SamplingFeatureObj = relationship(Samplingfeature)


    def __repr__(self):
        return "<FeatureAction('%s', '%s', '%s', )>" % (self.FeatureActionID, self.SamplingFeatureID, self.ActionID)


class Dataset(Base):
    __tablename__ = u'DataSets'
    __table_args__ = {u'schema': 'ODM2'}

    DataSetID = Column(Integer, primary_key=True)

    # This has been changed to String to support multiple database uuid types

    DataSetUUID = Column(String(255), nullable=False)
    DataSetTypeCV = Column(String(255), nullable=False)
    DataSetCode = Column(String(50), nullable=False)
    DataSetTitle = Column(String(255), nullable=False)
    DataSetAbstract = Column(String(500), nullable=False)


class Processinglevel(Base):
    __tablename__ = 'ProcessingLevels'
    __table_args__ = {u'schema': 'ODM2'}

    ProcessingLevelID = Column(Integer, primary_key=True)
    ProcessingLevelCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    Definition = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    Explanation = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))


class Relatedaction(Base):
    __tablename__ = 'RelatedActions'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    RelationshipTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    RelatedActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)

    ActionObj = relationship(Action, primaryjoin='Relatedaction.ActionID == Action.ActionID')
    RelatedActionObj = relationship(Action, primaryjoin='Relatedaction.RelatedActionID == Action.ActionID')


class Taxonomicclassifier(Base):
    __tablename__ = 'TaxonomicClassifiers'
    __table_args__ = {u'schema': 'ODM2'}

    TaxonomicClassifierID = Column(Integer, primary_key=True)
    TaxonomicClassifierTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    TaxonomicClassifierName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    TaxonomicClassifierCommonName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    TaxonomicClassifierDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    ParentTaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'))

    parent = relationship(u'Taxonomicclassifier', remote_side=[TaxonomicClassifierID])


class Unit(Base):
    __tablename__ = 'Units'
    __table_args__ = {u'schema': 'ODM2'}

    UnitsID = Column(Integer, primary_key=True)
    '''
    UnitsTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    UnitsAbbreviation = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    UnitsName = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    '''
    UnitsTypeCV = Column(String(255), nullable=False)
    UnitsAbbreviation = Column(String(255), nullable=False)
    UnitsName = Column(String, nullable=False)


class Variable(Base):
    __tablename__ = 'Variables'
    __table_args__ = {u'schema': 'ODM2'}

    VariableID = Column(Integer, primary_key=True)
    VariableTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableNameCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    VariableDefinition = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    SpeciationCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    NoDataValue = Column(Float(53), nullable=False)

    def __repr__(self):
        return "<Variable('%s', '%s', '%s')>" % (self.VariableID, self.VariableCode, self.VariableNameCV)


class Resulttypecv(Base):
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


class Result(Base):
    __tablename__ = u'Results'
    __table_args__ = {u'schema': u'ODM2'}

    ResultID = Column(BigInteger, primary_key=True)

    # This has been changed to String to support multiple database uuid types
    # ResultUUID = Column(UNIQUEIDENTIFIER, nullable=False)
    ResultUUID = Column(String(255), nullable=False)

    FeatureActionID = Column(ForeignKey('ODM2.FeatureActions.FeatureActionID'), nullable=False)
    ResultTypeCV = Column(ForeignKey('ODM2.ResultTypeCV.ResultTypeCV'), nullable=False)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'))
    ProcessingLevelID = Column(ForeignKey('ODM2.ProcessingLevels.ProcessingLevelID'), nullable=False)
    ResultDateTime = Column(DateTime)
    ResultDateTimeUTCOffset = Column(BigInteger)
    ValidDateTime = Column(DateTime)
    ValidDateTimeUTCOffset = Column(BigInteger)
    StatusCV = Column(String(255))
    SampledMediumCV = Column(String(255), nullable=False)
    ValueCount = Column(Integer, nullable=False)

    # IntendedObservationSpacing = Column(String(255))

    FeatureActionObj = relationship(Featureaction)
    ProcessingLevelObj = relationship(Processinglevel)
    ResultTypeCVObj = relationship(Resulttypecv)
    TaxonomicClassifierObj = relationship(Taxonomicclassifier)
    UnitObj = relationship(Unit)
    VariableObj = relationship(Variable)


    def __repr__(self):
        return "<Result('%s', '%s', '%s', '%s')>" % (
            self.ResultID, self.ResultTypeCV, self.ProcessingLevelID, self.ValueCount)



# ################################################################################
# Equipment
# ################################################################################


class Equipmentmodel(Base):
    __tablename__ = u'EquipmentModels'
    __table_args__ = {u'schema': u'ODM2'}

    ModelID = Column(Integer, primary_key=True)
    ModelManufacturerID = Column(ForeignKey('ODM2.Organizations.OrganizationID'), nullable=False)
    ModelPartNumber = Column(String(50))
    ModelName = Column(String(255), nullable=False)
    ModelDescription = Column(String(500))
    ModelSpecificationsFileLink = Column(String(255))
    ModelLink = Column(String(255))
    IsInstrument = Column(BIT, nullable=False)

    OrganizationObj = relationship(Organization)


class Equipment(Base):
    __tablename__ = u'Equipment'
    __table_args__ = {u'schema': 'ODM2'}

    EquipmentID = Column(Integer, primary_key=True)
    EquipmentCode = Column(String(50), nullable=False)
    EquipmentName = Column(String(255), nullable=False)
    EquipmentTypeCV = Column(String(255), nullable=False)
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

    PersonObj = relationship(Person)
    OrganizationObj = relationship(Organization)
    EquipmentModelObj = relationship(Equipmentmodel)
    parent = relationship(u'Equipment', remote_side=[EquipmentID])


class Equipmentaction(Base):
    __tablename__ = u'EquipmentActions'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    EquipmentID = Column(ForeignKey('ODM2.Equipment.EquipmentID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)

    ActionObj = relationship(Action)
    EquipmentObj = relationship(Equipment)


class Instrumentoutputvariable(Base):
    __tablename__ = u'InstrumentOutputVariables'
    __table_args__ = {u'schema': 'ODM2'}

    InstrumentOutputVariableID = Column(Integer, primary_key=True)
    ModelID = Column(ForeignKey('ODM2.EquipmentModels.ModelID'), nullable=False)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    InstrumentMethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    InstrumentResolution = Column(String(255))
    InstrumentAccuracy = Column(String(255))
    InstrumentRawOutputUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    MethodObj = relationship(Method)
    OutputUnitObj = relationship(Unit)
    EquipmentModelObj = relationship(Equipmentmodel)
    VariableObj = relationship(Variable)






# ################################################################################
# Lab Analyses
# ################################################################################

class Directive(Base):
    __tablename__ = u'Directives'
    __table_args__ = {u'schema': u'ODM2'}

    DirectiveID = Column(Integer, primary_key=True)
    DirectiveTypeCV = Column(String(255), nullable=False)
    DirectiveDescription = Column(String(500), nullable=False)


class Actiondirective(Base):
    __tablename__ = u'ActionDirectives'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    DirectiveID = Column(ForeignKey('ODM2.Directives.DirectiveID'), nullable=False)

    ActionObj = relationship(Action)
    DirectiveObj = relationship(Directive)


# ################################################################################
# Like ODM 1
# ################################################################################

## TODO add ODM 1




# ################################################################################
# Sampling Features
# ################################################################################



class Spatialreference(Base):
    __tablename__ = u'SpatialReferences'
    __table_args__ = {u'schema': u'ODM2'}

    SpatialReferenceID = Column(Integer, primary_key=True)
    SRSCode = Column(String(50))
    SRSName = Column(String(255), nullable=False)
    SRSDescription = Column(String(500))


class Specimen(Samplingfeature):
    __tablename__ = u'Specimens'
    __table_args__ = {u'schema': 'ODM2'}

    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), primary_key=True)
    SpecimenTypeCV = Column(String(255), nullable=False)
    SpecimenMediumCV = Column(String(255), nullable=False)
    IsFieldSpecimen = Column(BIT, nullable=False)


class Spatialoffset(Base):
    __tablename__ = u'SpatialOffsets'
    __table_args__ = {u'schema': u'ODM2'}

    SpatialOffsetID = Column(Integer, primary_key=True)
    SpatialOffsetTypeCV = Column(String(255), nullable=False)
    Offset1Value = Column(Float(53), nullable=False)
    Offset1UnitID = Column(Integer, nullable=False)
    Offset2Value = Column(Float(53))
    Offset2UnitID = Column(Integer)
    Offset3Value = Column(Float(53))
    Offset3UnitID = Column(Integer)


class Site(Samplingfeature):
    __tablename__ = u'Sites'
    __table_args__ = {u'schema': 'ODM2'}

    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), primary_key=True)
    SiteTypeCV = Column(String(255), nullable=False)
    Latitude = Column(Float(53), nullable=False)
    Longitude = Column(Float(53), nullable=False)
    LatLonDatumID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'), nullable=False)

    SpatialReferenceObj = relationship(Spatialreference)


class Relatedfeature(Base):
    __tablename__ = u'RelatedFeatures'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    SpatialOffsetID = Column(ForeignKey('ODM2.SpatialOffsets.SpatialOffsetID'))

    SamplingFeatureObj = relationship(Samplingfeature,
                                      primaryjoin='Relatedfeature.RelatedFeatureID == Samplingfeature.SamplingFeatureID')
    RelatedFeatureObj = relationship(Samplingfeature,
                                     primaryjoin='Relatedfeature.SamplingFeatureID == Samplingfeature.SamplingFeatureID')
    SpatialOffsetObj = relationship(Spatialoffset)


class Specimentaxonomicclassifier(Base):
    __tablename__ = u'SpecimenTaxonomicClassifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2.Specimens.SamplingFeatureID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'), nullable=False)
    CitationID = Column(Integer)

    SpecimenObj = relationship(Specimen)
    TaxonomicClassifierObj = relationship(Taxonomicclassifier)


# ################################################################################
# Sensors
# ################################################################################

class Deploymentaction(Base):
    __tablename__ = u'DeploymentActions'
    __table_args__ = {u'schema': u'ODM2'}

    DeploymentActionID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    DeploymentTypeCV = Column(String(255), nullable=False)
    DeploymentDescription = Column(String(500))
    ConfigurationActionID = Column(Integer, nullable=False)
    CalibrationActionID = Column(Integer, nullable=False)
    SpatialOffsetID = Column(Integer)
    DeploymentSchematicLink = Column(String(255))

    ActionObj = relationship(Action)


class Dataloggerfile(Base):
    __tablename__ = u'DataLoggerFiles'
    __table_args__ = {u'schema': 'ODM2'}

    DataLoggerFileID = Column(Integer, primary_key=True)
    DeploymentActionID = Column(ForeignKey('ODM2.DeploymentActions.DeploymentActionID'), nullable=False)
    DataLoggerOutputFileLink = Column(String(255), nullable=False)
    DataLoggerOutputFileDescription = Column(String(500))

    DeploymentActionObj = relationship(Deploymentaction)


class Photo(Base):
    __tablename__ = u'Photos'
    __table_args__ = {u'schema': 'ODM2'}

    PhotoID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    PhotoFileLink = Column(String(255), nullable=False)
    PhotoDescription = Column(String(500))

    ActionObj = relationship(Action)


# ################################################################################
# Simulation
# ################################################################################


class Model(Base):
    __tablename__ = 'Models'
    __table_args__ = {u'schema': 'ODM2'}

    ModelID = Column(Integer, primary_key=True)
    ModelCode = Column(String(255), nullable=False)
    ModelName = Column(String(255), nullable=False)
    ModelDescription = Column(String(500))


class Relatedmodel(Base):
    __tablename__ = 'RelatedModels'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    ModelID = Column(ForeignKey('ODM2.Models.ModelID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedModelID = Column(ForeignKey('ODM2.Models.ModelID'), nullable=False)

    Model = relationship(u'Model', primaryjoin='Relatedmodel.ModelID == Model.ModelID')
    Model1 = relationship(u'Model', primaryjoin='Relatedmodel.RelatedModelID == Model.ModelID')


class Simulation(Base):
    __tablename__ = 'Simulations'
    __table_args__ = {u'schema': 'ODM2'}

    SimulationID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    SimulationName = Column(String(255), nullable=False)
    SimulationDescription = Column(String(500))
    SimulationStartDateTime = Column(Date, nullable=False)
    SimulationStartDateTimeUTCOffset = Column(Integer, nullable=False)
    SimulationEndDateTime = Column(Date, nullable=False)
    SimulationEndDateTimeUTCOffset = Column(Integer, nullable=False)
    TimeStepValue = Column(Float(53), nullable=False)
    TimeStepUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    InputDataSetID = Column(ForeignKey('ODM2.DataSets.DataSetID'))
    OutputDataSetID = Column(Integer)
    ModelID = Column(ForeignKey('ODM2.Models.ModelID'), nullable=False)

    Action = relationship(u'Action')
    DataSet = relationship(u'Dataset')
    Model = relationship(u'Model')
    Unit = relationship(u'Unit')

# Part of the Provenance table, needed here to meet dependancies
class Citation(Base):
    __tablename__ = u'Citations'
    __table_args__ = {u'schema': u'ODM2'}

    CitationID = Column(Integer, primary_key=True)
    Title = Column(String(255), nullable=False)
    Publisher = Column(String(255), nullable=False)
    PublicationYear = Column(Integer, nullable=False)
    CitationLink = Column(String(255))


# ################################################################################
# Annotations
# ################################################################################
class Annotation(Base):
    __tablename__ = u'Annotations'

    __table_args__ = {u'schema': u'ODM2'}

    AnnotationID = Column(Integer, primary_key=True)
    AnnotationTypeCV = Column(String(255), nullable=False)
    AnnotationCode = Column(String(50))
    AnnotationText = Column(String(500), nullable=False)
    AnnotationDateTime = Column(DateTime)
    AnnotationUTCOffset = Column(Integer)
    AnnotationLink = Column(String(255))
    AnnotatorID = Column(ForeignKey('ODM2.People.PersonID'))
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'))

    PersonObj = relationship(Person)
    CitationObj = relationship(Citation)


class Actionannotation(Base):
    __tablename__ = u'ActionAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    ActionObj = relationship(Action)
    AnnotationObj = relationship(Annotation)


class Methodannotation(Base):
    __tablename__ = u'MethodAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotation)
    MethodObj = relationship(Method)


class Resultannotation(Base):
    __tablename__ = u'ResultAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    EndDateTime = Column(DateTime, nullable=False)

    AnnotationObj = relationship(Annotation)
    ResultObj = relationship(Result)


class Resultvalueannotation(Base):
    __tablename__ = u'ResultValueAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ValueID = Column(BigInteger, nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    Annotation = relationship(Annotation)


class Samplingfeatureannotation(Base):
    __tablename__ = u'SamplingFeatureAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotation)
    SamplingFeatureObj = relationship(Samplingfeature)

# ################################################################################
# Data Quality
# ################################################################################

class Datasetsresult(Base):
    __tablename__ = u'DataSetsResults'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    DataSetID = Column(ForeignKey('ODM2.DataSets.DataSetID'), nullable=False)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)

    DataSetObj = relationship(Dataset)
    ResultObj = relationship(Result)


class Dataquality(Base):
    __tablename__ = 'DataQuality'
    __table_args__ = {u'schema': 'ODM2'}

    DataQualityID = Column(Integer, primary_key=True)
    DataQualityTypeCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    DataQualityCode = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    DataQualityValue = Column(Float(53))
    DataQualityValueUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    DataQualityDescription = Column(String(500, u'SQL_Latin1_General_CP1_CI_AS'))
    DataQualityLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))

    UnitObj = relationship(Unit)


class Referencematerial(Base):
    __tablename__ = 'ReferenceMaterials'
    __table_args__ = {u'schema': 'ODM2'}

    ReferenceMaterialID = Column(Integer, primary_key=True)
    ReferenceMaterialMediumCV = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    ReferenceMaterialOrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'), nullable=False)
    ReferenceMaterialCode = Column(String(50, u'SQL_Latin1_General_CP1_CI_AS'), nullable=False)
    ReferenceMaterialLotCode = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    ReferenceMaterialPurchaseDate = Column(DateTime)
    ReferenceMaterialExpirationDate = Column(DateTime)
    ReferenceMaterialCertificateLink = Column(String(255, u'SQL_Latin1_General_CP1_CI_AS'))
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'))

    OrganizationObj = relationship(Organization)
    SamplingFeature = relationship(Samplingfeature)


Resultnormalizationvalue = Table(
    u'ResultNormalizationValues', Base.metadata,
    Column(u'ResultID', ForeignKey('ODM2.Results.ResultID'), primary_key=True),
    Column(u'NormalizedByReferenceMaterialValueID', ForeignKey('ODM2.ReferenceMaterialValues.ReferenceMaterialValueID'),
           nullable=False),
    schema='ODM2'
)


class Referencematerialvalue(Base):
    __tablename__ = u'ReferenceMaterialValues'
    __table_args__ = {u'schema': 'ODM2'}

    ReferenceMaterialValueID = Column(Integer, primary_key=True)
    ReferenceMaterialID = Column(ForeignKey('ODM2.ReferenceMaterials.ReferenceMaterialID'), nullable=False)
    ReferenceMaterialValue = Column(Float(53), nullable=False)
    ReferenceMaterialAccuracy = Column(Float(53))
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citation)
    ReferenceMaterialObj = relationship(Referencematerial)
    UnitObj = relationship(Unit)
    VariableObj = relationship(Variable)
    ResultsObj = relationship(Result, secondary=Resultnormalizationvalue)


class Resultsdataquality(Base):
    __tablename__ = 'ResultsDataQuality'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    DataQualityID = Column(ForeignKey('ODM2.DataQuality.DataQualityID'), nullable=False)

    DataQualityObj = relationship(Dataquality)
    ResultObj = relationship(Result)

# ################################################################################
# Extension Properties
# ################################################################################


class Extensionproperty(Base):
    __tablename__ = u'ExtensionProperties'
    __table_args__ = {u'schema': u'ODM2'}

    PropertyID = Column(Integer, primary_key=True)
    PropertyName = Column(String(255), nullable=False)
    PropertyDescription = Column(String(500))
    PropertyDataTypeCV = Column(String(255), nullable=False)
    PropertyUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))

    UnitObj = relationship(Unit)


class Actionextensionpropertyvalue(Base):
    __tablename__ = u'ActionExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ActionObj = relationship(Action)
    ExtensionPropertyObj = relationship(Extensionproperty)


class Citationextensionpropertyvalue(Base):
    __tablename__ = u'CitationExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    CitationObj = relationship(Citation)
    ExtensionPropertyObj = relationship(Extensionproperty)


class Methodextensionpropertyvalue(Base):
    __tablename__ = u'MethodExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    MethodObj = relationship(Method)
    ExtensionPropertyObj = relationship(Extensionproperty)


class Resultextensionpropertyvalue(Base):
    __tablename__ = u'ResultExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(Extensionproperty)
    ResultObj = relationship(Result)


class Samplingfeatureextensionpropertyvalue(Base):
    __tablename__ = u'SamplingFeatureExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(Extensionproperty)
    SamplingFeatureObj = relationship(Samplingfeature)


class Variableextensionpropertyvalue(Base):
    __tablename__ = u'VariableExtensionPropertyValues'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    PropertyID = Column(ForeignKey('ODM2.ExtensionProperties.PropertyID'), nullable=False)
    PropertyValue = Column(String(255), nullable=False)

    ExtensionPropertyObj = relationship(Extensionproperty)
    VariableObj = relationship(Variable)

# ################################################################################
# Extension Identifiers
# ################################################################################


class Externalidentifiersystem(Base):
    __tablename__ = u'ExternalIdentifierSystems'
    __table_args__ = {u'schema': u'ODM2'}

    ExternalIdentifierSystemID = Column(Integer, primary_key=True)
    ExternalIdentifierSystemName = Column(String(255), nullable=False)
    IdentifierSystemOrganizationID = Column(ForeignKey('ODM2.Organizations.OrganizationID'), nullable=False)
    ExternalIdentifierSystemDescription = Column(String(500))
    ExternalIdentifierSystemURL = Column(String(255))

    OrganizationObj = relationship(Organization)


class Citationexternalidentifier(Base):
    __tablename__ = u'CitationExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    CitationExternalIdentifer = Column(String(255), nullable=False)
    CitationExternalIdentiferURI = Column(String(255))

    CitationObj = relationship(Citation)
    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)


class Methodexternalidentifier(Base):
    __tablename__ = u'MethodExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    MethodExternalIdentifier = Column(String(255), nullable=False)
    MethodExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    MethodObj = relationship(Method)


class Personexternalidentifier(Base):
    __tablename__ = u'PersonExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    PersonID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    PersonExternalIdentifier = Column(String(255), nullable=False)
    PersonExternalIdenifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    PersonObj = relationship(Person)


class Referencematerialexternalidentifier(Base):
    __tablename__ = u'ReferenceMaterialExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ReferenceMaterialID = Column(ForeignKey('ODM2.ReferenceMaterials.ReferenceMaterialID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    ReferenceMaterialExternalIdentifier = Column(String(255), nullable=False)
    ReferenceMaterialExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    ReferenceMaterialObj = relationship(Referencematerial)


class Samplingfeatureexternalidentifier(Base):
    __tablename__ = u'SamplingFeatureExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    SamplingFeatureExternalIdentifier = Column(String(255), nullable=False)
    SamplingFeatureExternalIdentiferURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    SamplingFeatureObj = relationship(Samplingfeature)


class Spatialreferenceexternalidentifier(Base):
    __tablename__ = u'SpatialReferenceExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    SpatialReferenceExternalIdentifier = Column(String(255), nullable=False)
    SpatialReferenceExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    SpatialReferenceObj = relationship(Spatialreference)


class Taxonomicclassifierexternalidentifier(Base):
    __tablename__ = u'TaxonomicClassifierExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    TaxonomicClassifierID = Column(ForeignKey('ODM2.TaxonomicClassifiers.TaxonomicClassifierID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    TaxonomicClassifierExternalIdentifier = Column(String(255), nullable=False)
    TaxonomicClassifierExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    TaxonomicClassifierObj = relationship(Taxonomicclassifier)


class Variableexternalidentifier(Base):
    __tablename__ = u'VariableExternalIdentifiers'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    VariableID = Column(ForeignKey('ODM2.Variables.VariableID'), nullable=False)
    ExternalIdentifierSystemID = Column(ForeignKey('ODM2.ExternalIdentifierSystems.ExternalIdentifierSystemID'),
                                        nullable=False)
    VariableExternalIdentifer = Column(String(255), nullable=False)
    VariableExternalIdentifierURI = Column(String(255))

    ExternalIdentifierSystemObj = relationship(Externalidentifiersystem)
    VariableObj = relationship(Variable)

# ################################################################################
# Provenance
# ################################################################################



class Authorlist(Base):
    __tablename__ = u'AuthorLists'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    PersonID = Column(ForeignKey('ODM2.People.PersonID'), nullable=False)
    AuthorOrder = Column(Integer, nullable=False)

    CitationObj = relationship(Citation)
    PersonObj = relationship(Person)


class Datasetcitation(Base):
    __tablename__ = u'DataSetCitations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    DataSetID = Column(ForeignKey('ODM2.DataSets.DataSetID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citation)
    DataSetObj = relationship(Dataset)


Resultderivationequation = Table(
    u'ResultDerivationEquations', Base.metadata,
    Column(u'ResultID', ForeignKey('ODM2.Results.ResultID'), primary_key=True),
    Column(u'DerivationEquationID', ForeignKey('ODM2.DerivationEquations.DerivationEquationID'), nullable=False),
    schema='ODM2'
)


class Derivationequation(Base):
    __tablename__ = u'DerivationEquations'
    __table_args__ = {u'schema': 'ODM2'}

    DerivationEquationID = Column(Integer, primary_key=True)
    DerivationEquation = Column(String(255), nullable=False)

    ResultsObj = relationship(Result, secondary=Resultderivationequation)


class Methodcitation(Base):
    __tablename__ = u'MethodCitations'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    MethodID = Column(ForeignKey('ODM2.Methods.MethodID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citation)
    MethodObj = relationship(Method)


# from ODM2.Annotations.model import Annotation
class Relatedannotation(Base):
    __tablename__ = u'RelatedAnnotations'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    AnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedAnnotationID = Column(ForeignKey('ODM2.Annotations.AnnotationID'), nullable=False)

    AnnotationObj = relationship(Annotation, primaryjoin='Relatedannotation.AnnotationID == Annotation.AnnotationID')
    RelatedAnnotationObj = relationship(Annotation,
                                        primaryjoin='Relatedannotation.RelatedAnnotationID == Annotation.AnnotationID')


class Relatedcitation(Base):
    __tablename__ = u'RelatedCitations'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    CitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)
    RelationshipTypeCV = Column(Integer, nullable=False)
    RelatedCitationID = Column(ForeignKey('ODM2.Citations.CitationID'), nullable=False)

    CitationObj = relationship(Citation, primaryjoin='Relatedcitation.CitationID == Citation.CitationID')
    RelatedCitationObj = relationship(Citation, primaryjoin='Relatedcitation.RelatedCitationID == Citation.CitationID')


class Relateddataset(Base):
    __tablename__ = u'RelatedDatasets'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    DataSetID = Column(ForeignKey('ODM2.DataSets.DataSetID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedDatasetID = Column(ForeignKey('ODM2.DataSets.DataSetID'), nullable=False)
    VersionCode = Column(String(50))

    DataSetObj = relationship(Dataset, primaryjoin='Relateddataset.DataSetID == Dataset.DataSetID')
    RelatedDatasetObj = relationship(Dataset, primaryjoin='Relateddataset.RelatedDatasetID == Dataset.DataSetID')


class Relatedresult(Base):
    __tablename__ = u'RelatedResults'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedResultID = Column(ForeignKey('ODM2.Results.ResultID'), nullable=False)
    VersionCode = Column(String(50))
    RelatedResultSequenceNumber = Column(Integer)

    ResultObj = relationship(Result, primaryjoin='Relatedresult.RelatedResultID == Result.ResultID')
    RelatedResultObj = relationship(Result, primaryjoin='Relatedresult.ResultID == Result.ResultID')

# ################################################################################
# Results
# ################################################################################


class Pointcoverageresult(Result):
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
    AggregationStatisticCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(Integer, nullable=False)

    XUnitObj = relationship(Unit, primaryjoin='Pointcoverageresult.IntendedXSpacingUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Pointcoverageresult.IntendedYSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    ZUnitObj = relationship(Unit, primaryjoin='Pointcoverageresult.ZLocationUnitsID == Unit.UnitsID')


class Profileresult(Result):
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
    AggregationStatisticCV = Column(String(255), nullable=False)

    TimeUnitObj = relationship(Unit, primaryjoin='Profileresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Profileresult.IntendedZSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    XUnitObj = relationship(Unit, primaryjoin='Profileresult.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Profileresult.YLocationUnitsID == Unit.UnitsID')


class Categoricalresult(Result):
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
    QualityCodeCV = Column(BigInteger, nullable=False)

    SpatialReferenceObj = relationship(Spatialreference)


class Transectresult(Result):
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
    AggregationStatisticCV = Column(String(255), nullable=False)

    TimeUnitObj = relationship(Unit, primaryjoin='Transectresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    TransectUnitObj = relationship(Unit, primaryjoin='Transectresult.IntendedTransectSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    ZUnitObj = relationship(Unit, primaryjoin='Transectresult.ZLocationUnitsID == Unit.UnitsID')


class Spectraresult(Result):
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
    AggregationStatisticCV = Column(String(255), nullable=False)

    WaveUnitObj = relationship(Unit, primaryjoin='Spectraresult.IntendedWavelengthSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    XUnitObj = relationship(Unit, primaryjoin='Spectraresult.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Spectraresult.YLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Spectraresult.ZLocationUnitsID == Unit.UnitsID')


class Timeseriesresult(Result):
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
    AggregationStatisticCV = Column(String(255), nullable=False)

    TimeUnitObj = relationship(Unit, primaryjoin='Timeseriesresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    XUnitObj = relationship(Unit, primaryjoin='Timeseriesresult.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Timeseriesresult.YLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Timeseriesresult.ZLocationUnitsID == Unit.UnitsID')


class Sectionresult(Result):
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
    AggregationStatisticCV = Column(String(255), nullable=False)

    TimeUnitObj = relationship(Unit, primaryjoin='Sectionresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    XUnitObj = relationship(Unit, primaryjoin='Sectionresult.IntendedXSpacingUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Sectionresult.IntendedZSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    YUnitObj = relationship(Unit, primaryjoin='Sectionresult.YLocationUnitsID == Unit.UnitsID')


class Trajectoryresult(Result):
    __tablename__ = u'TrajectoryResults'
    __table_args__ = {u'schema': 'ODM2'}

    ResultID = Column(ForeignKey('ODM2.Results.ResultID'), primary_key=True)
    SpatialReferenceID = Column(ForeignKey('ODM2.SpatialReferences.SpatialReferenceID'))
    IntendedTrajectorySpacing = Column(Float(53))
    IntendedTrajectorySpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'))
    AggregationStatisticCV = Column(String(255), nullable=False)

    TimeUnitObj = relationship(Unit, primaryjoin='Trajectoryresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    TrajectoryUnitObj = relationship(Unit,
                                     primaryjoin='Trajectoryresult.IntendedTrajectorySpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)


class Measurementresult(Result):
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
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    AggregationStatisticCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    SpatialReferenceObj = relationship(Spatialreference)
    TimeUnitObj = relationship(Unit, primaryjoin='Measurementresult.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    XUnitObjObj = relationship(Unit, primaryjoin='Measurementresult.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Measurementresult.YLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Measurementresult.ZLocationUnitsID == Unit.UnitsID')


class Categoricalresultvalue(Base):
    __tablename__ = u'CategoricalResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.CategoricalResults.ResultID'), nullable=False)
    DataValue = Column(String(255), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    CategoricalResultObj = relationship(Categoricalresult)


class Measurementresultvalue(Base):
    __tablename__ = u'MeasurementResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.MeasurementResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    MeasurementResultObj = relationship(Measurementresult)


class Pointcoverageresultvalue(Base):
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
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)

    PointCoverageResultObj = relationship(Pointcoverageresult)
    XUnitObj = relationship(Unit, primaryjoin='Pointcoverageresultvalue.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Pointcoverageresultvalue.YLocationUnitsID == Unit.UnitsID')


class Profileresultvalue(Base):
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
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    ProfileResultObj = relationship(u'Profileresult')
    TimeUnitObj = relationship(Unit, primaryjoin='Profileresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Profileresultvalue.ZLocationUnitsID == Unit.UnitsID')


class Sectionresultvalue(Base):
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
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    AggregationStatisticCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    SectionResultObj = relationship(Sectionresult)
    TimeUnitObj = relationship(Unit, primaryjoin='Sectionresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    XUnitObj = relationship(Unit, primaryjoin='Sectionresultvalue.XLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Sectionresultvalue.ZLocationUnitsID == Unit.UnitsID')


class Spectraresultvalue(Base):
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
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    SpectraResultObj = relationship(Spectraresult)
    TimeUnitObj = relationship(Unit, primaryjoin='Spectraresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    WavelengthUnitObj = relationship(Unit, primaryjoin='Spectraresultvalue.WavelengthUnitsID == Unit.UnitsID')


class Timeseriesresultvalue(Base):
    __tablename__ = u'TimeSeriesResultValues'
    __table_args__ = {u'schema': 'ODM2'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2.TimeSeriesResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    TimeSeriesResultObj = relationship(Timeseriesresult)
    TimeUnitObj = relationship(Unit)

    def get_columns(self):
        return ["ValueID", "ResultID", "DataValue", "ValueDateTime", "ValueDateTimeUTCOffset",
                "CensorCodeCV", "QualityCodeCV", "TimeAggregationInterval", "TimeAggregationIntervalUnitsID"]

    def list_repr(self):
        return [self.ValueID, self.ResultID, self.DataValue, self.ValueDateTime, self.ValueDateTimeUTCOffset,
                self.CensorCodeCV, self.QualityCodeCV, self.TimeAggregationInterval,
                self.TimeAggregationIntervalUnitsID]

    def __repr__(self):
        return "<DataValue('%s', '%s', '%s')>" % (self.DataValue, self.ValueDateTime, self.TimeAggregationInterval)


class Trajectoryresultvalue(Base):
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
    CensorCode = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)

    TrajectoryResultObj = relationship(Trajectoryresult)
    TimeUnitObj = relationship(Unit, primaryjoin='Trajectoryresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    XUnitObj = relationship(Unit, primaryjoin='Trajectoryresultvalue.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Trajectoryresultvalue.YLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Trajectoryresultvalue.ZLocationUnitsID == Unit.UnitsID')


class Transectresultvalue(Base):
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
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    AggregationStatisticCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(Integer, nullable=False)

    TransectResultObj = relationship(Transectresult)

