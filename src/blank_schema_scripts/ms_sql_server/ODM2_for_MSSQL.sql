-- Drop the database called 'ODM2' if it exists and then create a new database called 'ODM2'
USE master;
GO

IF DB_ID(N'ODM2') IS NOT NULL
DROP DATABASE ODM2;
GO

CREATE DATABASE ODM2;
GO

USE ODM2;
GO

CREATE SCHEMA ODM2;
GO

/***************************************************************************/
/************************* CREATE ODM2ANNOTATIONS **************************/
/***************************************************************************/

CREATE TABLE ODM2.ActionAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ActionID int   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.Annotations (
	AnnotationID int  IDENTITY (1,1) NOT NULL,
	AnnotationTypeCV varchar (255)  NOT NULL,
	AnnotationCode varchar (50)  NULL,
	AnnotationText varchar (500)  NOT NULL,
	AnnotationDateTime datetime   NULL,
	AnnotationUTCOffset int   NULL,
	AnnotationLink varchar (255)  NULL,
	AnnotatorID int   NULL,
	CitationID int   NULL,
	PRIMARY KEY (AnnotationID)
)
CREATE TABLE ODM2.CategoricalResultValueAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ValueID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.EquipmentAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	EquipmentID int   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.MeasurementResultValueAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ValueID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.MethodAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	MethodID int   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.PointCoverageResultValueAnnotations (
	BridgeID bigint  IDENTITY (1,1) NOT NULL,
	ValueID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.ProfileResultValueAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ValueID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.ResultAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	BeginDateTime datetime   NOT NULL,
	EndDateTime datetime   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.SamplingFeatureAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	SamplingFeatureID int   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.SectionResultValueAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ValueID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.SpectraResultValueAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ValueID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.TimeSeriesResultValueAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ValueID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.TrajectoryResultValueAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ValueID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.TransectResultValueAnnotations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ValueID bigint   NOT NULL,
	AnnotationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
/***************************************************************************/
/***************************** CREATE ODM2CORE *****************************/
/***************************************************************************/

CREATE TABLE ODM2.ActionBy (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ActionID int   NOT NULL,
	AffiliationID int   NOT NULL,
	IsActionLead bit   NOT NULL,
	RoleDescription varchar (500)  NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.Actions (
	ActionID int  IDENTITY (1,1) NOT NULL,
	ActionTypeCV varchar (255)  NOT NULL,
	MethodID int   NOT NULL,
	BeginDateTime datetime   NOT NULL,
	BeginDateTimeUTCOffset int   NOT NULL,
	EndDateTime datetime   NULL,
	EndDateTimeUTCOffset int   NULL,
	ActionDescription varchar (500)  NULL,
	ActionFileLink varchar (255)  NULL,
	PRIMARY KEY (ActionID)
)
CREATE TABLE ODM2.Affiliations (
	AffiliationID int  IDENTITY (1,1) NOT NULL,
	PersonID int   NOT NULL,
	OrganizationID int   NULL,
	IsPrimaryOrganizationContact bit   NULL,
	AffiliationStartDate date   NOT NULL,
	AffiliationEndDate date   NULL,
	PrimaryPhone varchar (50)  NULL,
	PrimaryEmail varchar (255)  NOT NULL,
	PrimaryAddress varchar (255)  NULL,
	PersonLink varchar (255)  NULL,
	PRIMARY KEY (AffiliationID)
)
CREATE TABLE ODM2.DataSets (
	DataSetID int  IDENTITY (1,1) NOT NULL,
	DataSetUUID uniqueidentifier   NOT NULL,
	DataSetTypeCV varchar (255)  NOT NULL,
	DataSetCode varchar (50)  NOT NULL,
	DataSetTitle varchar (255)  NOT NULL,
	DataSetAbstract varchar (500)  NOT NULL,
	PRIMARY KEY (DataSetID)
)
CREATE TABLE ODM2.DataSetsResults (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	DataSetID int   NOT NULL,
	ResultID bigint   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.FeatureActions (
	FeatureActionID int  IDENTITY (1,1) NOT NULL,
	SamplingFeatureID int   NOT NULL,
	ActionID int   NOT NULL,
	PRIMARY KEY (FeatureActionID)
)
CREATE TABLE ODM2.Methods (
	MethodID int  IDENTITY (1,1) NOT NULL,
	MethodTypeCV varchar (255)  NOT NULL,
	MethodCode varchar (50)  NOT NULL,
	MethodName varchar (255)  NOT NULL,
	MethodDescription varchar (500)  NULL,
	MethodLink varchar (255)  NULL,
	OrganizationID int   NULL,
	PRIMARY KEY (MethodID)
)
CREATE TABLE ODM2.Organizations (
	OrganizationID int  IDENTITY (1,1) NOT NULL,
	OrganizationTypeCV varchar (255)  NOT NULL,
	OrganizationCode varchar (50)  NOT NULL,
	OrganizationName varchar (255)  NOT NULL,
	OrganizationDescription varchar (500)  NULL,
	OrganizationLink varchar (255)  NULL,
	ParentOrganizationID int   NULL,
	PRIMARY KEY (OrganizationID)
)
CREATE TABLE ODM2.People (
	PersonID int  IDENTITY (1,1) NOT NULL,
	PersonFirstName varchar (255)  NOT NULL,
	PersonMiddleName varchar (255)  NULL,
	PersonLastName varchar (255)  NOT NULL,
	PRIMARY KEY (PersonID)
)
CREATE TABLE ODM2.ProcessingLevels (
	ProcessingLevelID int  IDENTITY (1,1) NOT NULL,
	ProcessingLevelCode varchar (50)  NOT NULL,
	Definition varchar (500)  NULL,
	Explanation varchar (500)  NULL,
	PRIMARY KEY (ProcessingLevelID)
)
CREATE TABLE ODM2.RelatedActions (
	RelationID int  IDENTITY (1,1) NOT NULL,
	ActionID int   NOT NULL,
	RelationshipTypeCV varchar (255)  NOT NULL,
	RelatedActionID int   NOT NULL,
	PRIMARY KEY (RelationID)
)
CREATE TABLE ODM2.Results (
	ResultID bigint  IDENTITY (1,1) NOT NULL,
	ResultUUID uniqueidentifier   NOT NULL,
	FeatureActionID int   NOT NULL,
	ResultTypeCV varchar (255)  NOT NULL,
	VariableID int   NOT NULL,
	UnitsID int   NOT NULL,
	TaxonomicClassifierID int   NULL,
	ProcessingLevelID int   NOT NULL,
	ResultDateTime datetime   NULL,
	ResultDateTimeUTCOffset bigint   NULL,
	ValidDateTime datetime   NULL,
	ValidDateTimeUTCOffset bigint   NULL,
	StatusCV varchar (255)  NULL,
	SampledMediumCV varchar (255)  NOT NULL,
	ValueCount int   NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.SamplingFeatures (
	SamplingFeatureID int  IDENTITY (1,1) NOT NULL,
	SamplingFeatureUUID uniqueidentifier   NOT NULL,
	SamplingFeatureTypeCV varchar (255)  NOT NULL,
	SamplingFeatureCode varchar (50)  NOT NULL,
	SamplingFeatureName varchar (255)  NULL,
	SamplingFeatureDescription varchar (500)  NULL,
	SamplingFeatureGeotypeCV varchar (255)  NULL,
	FeatureGeometry geometry   NULL,
	Elevation_m float   NULL,
	ElevationDatumCV varchar (255)  NULL,
	PRIMARY KEY (SamplingFeatureID)
)
CREATE TABLE ODM2.TaxonomicClassifiers (
	TaxonomicClassifierID int   NOT NULL,
	TaxonomicClassifierTypeCV varchar (255)  NOT NULL,
	TaxonomicClassifierName varchar (255)  NOT NULL,
	TaxonomicClassifierCommonName varchar (255)  NULL,
	TaxonomicClassifierDescription varchar (500)  NULL,
	ParentTaxonomicClassifierID int   NULL,
	PRIMARY KEY (TaxonomicClassifierID)
)
CREATE TABLE ODM2.Units (
	UnitsID int  IDENTITY (1,1) NOT NULL,
	UnitsTypeCV varchar (255)  NOT NULL,
	UnitsAbbreviation varchar (50)  NOT NULL,
	UnitsName varchar (255)  NOT NULL,
	PRIMARY KEY (UnitsID)
)
CREATE TABLE ODM2.Variables (
	VariableID int  IDENTITY (1,1) NOT NULL,
	VariableTypeCV varchar (255)  NOT NULL,
	VariableCode varchar (50)  NOT NULL,
	VariableNameCV varchar (255)  NOT NULL,
	VariableDefinition varchar (500)  NULL,
	SpeciationCV varchar (255)  NULL,
	NoDataValue float   NOT NULL,
	PRIMARY KEY (VariableID)
)
/***************************************************************************/
/****************************** CREATE ODM2CV ******************************/
/***************************************************************************/

CREATE TABLE ODM2.CVTerms (
	TermID int   NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (500)  NULL,
	ODMVocabulary varchar (255)  NOT NULL,
	SourceVocabulary varchar (255)  NULL,
	PRIMARY KEY (TermID)
)
/***************************************************************************/
/************************* CREATE ODM2DATAQUALITY **************************/
/***************************************************************************/

CREATE TABLE ODM2.DataQuality (
	DataQualityID int   NOT NULL,
	DataQualityTypeCV varchar (255)  NOT NULL,
	DataQualityCode varchar (255)  NOT NULL,
	DataQualityValue float   NULL,
	DataQualityValueUnitsID int   NULL,
	DataQualityDescription varchar (500)  NULL,
	DataQualityLink varchar (255)  NULL,
	PRIMARY KEY (DataQualityID)
)
CREATE TABLE ODM2.ReferenceMaterials (
	ReferenceMaterialID int   NOT NULL,
	ReferenceMaterialMediumCV varchar (255)  NOT NULL,
	ReferenceMaterialOrganizationID int   NOT NULL,
	ReferenceMaterialCode varchar (50)  NOT NULL,
	ReferenceMaterialLotCode varchar (255)  NULL,
	ReferenceMaterialPurchaseDate datetime   NULL,
	ReferenceMaterialExpirationDate datetime   NULL,
	ReferenceMaterialCertificateLink varchar (255)  NULL,
	SamplingFeatureID int   NULL,
	PRIMARY KEY (ReferenceMaterialID)
)
CREATE TABLE ODM2.ReferenceMaterialValues (
	ReferenceMaterialValueID int   NOT NULL,
	ReferenceMaterialID int   NOT NULL,
	ReferenceMaterialValue float   NOT NULL,
	ReferenceMaterialAccuracy float   NULL,
	VariableID int   NOT NULL,
	UnitsID int   NOT NULL,
	CitationID int   NOT NULL,
	PRIMARY KEY (ReferenceMaterialValueID)
)
CREATE TABLE ODM2.ResultNormalizationValues (
	ResultID bigint   NOT NULL,
	NormalizedByReferenceMaterialValueID int   NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.ResultsDataQuality (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataQualityID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
/***************************************************************************/
/************************** CREATE ODM2EQUIPMENT ***************************/
/***************************************************************************/

CREATE TABLE ODM2.CalibrationActions (
	ActionID int   NOT NULL,
	CalibrationCheckValue float   NULL,
	InstrumentOutputVariableID int   NOT NULL,
	CalibrationEquation varchar (255)  NULL,
	PRIMARY KEY (ActionID)
)
CREATE TABLE ODM2.CalibrationReferenceEquipment (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ActionID int   NOT NULL,
	EquipmentID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.CalibrationStandards (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ActionID int   NOT NULL,
	ReferenceMaterialID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.DataloggerFileColumns (
	DataloggerFileColumnID int  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NULL,
	DataLoggerFileID int   NOT NULL,
	InstrumentOutputVariableID int   NOT NULL,
	ColumnLabel varchar (50)  NOT NULL,
	ColumnDescription varchar (500)  NULL,
	MeasurementEquation varchar (255)  NULL,
	ScanInterval float   NULL,
	ScanIntervalUnitsID int   NULL,
	RecordingInterval float   NULL,
	RecordingIntervalUnitsID int   NULL,
	AggregationStatisticCV varchar (255)  NULL,
	PRIMARY KEY (DataloggerFileColumnID)
)
CREATE TABLE ODM2.DataLoggerFiles (
	DataLoggerFileID int  IDENTITY (1,1) NOT NULL,
	ProgramID int   NOT NULL,
	DataLoggerFileName varchar (255)  NOT NULL,
	DataLoggerFileDescription varchar (500)  NULL,
	DataLoggerFileLink varchar (255)  NULL,
	PRIMARY KEY (DataLoggerFileID)
)
CREATE TABLE ODM2.DataloggerProgramFiles (
	ProgramID int  IDENTITY (1,1) NOT NULL,
	AffiliationID int   NOT NULL,
	ProgramName varchar (255)  NOT NULL,
	ProgramDescription varchar (500)  NULL,
	ProgramVersion varchar (50)  NULL,
	ProgramFileLink varchar (255)  NULL,
	PRIMARY KEY (ProgramID)
)
CREATE TABLE ODM2.Equipment (
	EquipmentID int  IDENTITY (1,1) NOT NULL,
	EquipmentCode varchar (50)  NOT NULL,
	EquipmentName varchar (255)  NOT NULL,
	EquipmentTypeCV varchar (255)  NOT NULL,
	EquipmentModelID int   NOT NULL,
	EquipmentSerialNumber varchar (50)  NOT NULL,
	EquipmentOwnerID int   NOT NULL,
	EquipmentVendorID int   NOT NULL,
	EquipmentPurchaseDate datetime   NOT NULL,
	EquipmentPurchaseOrderNumber varchar (50)  NULL,
	EquipmentDescription varchar (500)  NULL,
	EquipmentDocumentationLink varchar (255)  NULL,
	PRIMARY KEY (EquipmentID)
)
CREATE TABLE ODM2.EquipmentModels (
	EquipmentModelID int  IDENTITY (1,1) NOT NULL,
	ModelManufacturerID int   NOT NULL,
	ModelPartNumber varchar (50)  NULL,
	ModelName varchar (255)  NOT NULL,
	ModelDescription varchar (500)  NULL,
	IsInstrument bit   NOT NULL,
	ModelSpecificationsFileLink varchar (255)  NULL,
	ModelLink varchar (255)  NULL,
	PRIMARY KEY (EquipmentModelID)
)
CREATE TABLE ODM2.EquipmentUsed (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ActionID int   NOT NULL,
	EquipmentID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.InstrumentOutputVariables (
	InstrumentOutputVariableID int  IDENTITY (1,1) NOT NULL,
	ModelID int   NOT NULL,
	VariableID int   NOT NULL,
	InstrumentMethodID int   NOT NULL,
	InstrumentResolution varchar (255)  NULL,
	InstrumentAccuracy varchar (255)  NULL,
	InstrumentRawOutputUnitsID int   NOT NULL,
	PRIMARY KEY (InstrumentOutputVariableID)
)
CREATE TABLE ODM2.MaintenanceActions (
	ActionID int   NOT NULL,
	IsFactoryService bit   NOT NULL,
	MaintenanceCode varchar (50)  NULL,
	MaintenanceReason varchar (500)  NULL,
	PRIMARY KEY (ActionID)
)
CREATE TABLE ODM2.RelatedEquipment (
	RelationID int  IDENTITY (1,1) NOT NULL,
	EquipmentID int   NOT NULL,
	RelationshipTypeCV varchar (255)  NOT NULL,
	RelatedEquipmentID int   NOT NULL,
	RelationshipStartDateTime datetime   NOT NULL,
	RelationshipStartDateTimeUTCOffset int   NOT NULL,
	RelationshipEndDateTime datetime   NULL,
	RelationshipEndDateTimeUTCOffset int   NULL,
	PRIMARY KEY (RelationID)
)
/***************************************************************************/
/********************* CREATE ODM2EXTENSIONPROPERTIES **********************/
/***************************************************************************/

CREATE TABLE ODM2.ActionExtensionPropertyValues (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ActionID int   NOT NULL,
	PropertyID int   NOT NULL,
	PropertyValue varchar (255)  NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.CitationExtensionPropertyValues (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	CitationID int   NOT NULL,
	PropertyID int   NOT NULL,
	PropertyValue varchar (255)  NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.ExtensionProperties (
	PropertyID int  IDENTITY (1,1) NOT NULL,
	PropertyName varchar (255)  NOT NULL,
	PropertyDescription varchar (500)  NULL,
	PropertyDataTypeCV varchar (255)  NOT NULL,
	PropertyUnitsID int   NULL,
	PRIMARY KEY (PropertyID)
)
CREATE TABLE ODM2.MethodExtensionPropertyValues (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	MethodID int   NOT NULL,
	PropertyID int   NOT NULL,
	PropertyValue varchar (255)  NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.ResultExtensionPropertyValues (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	PropertyID int   NOT NULL,
	PropertyValue varchar (255)  NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.SamplingFeatureExtensionPropertyValues (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	SamplingFeatureID int   NOT NULL,
	PropertyID int   NOT NULL,
	PropertyValue varchar (255)  NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.VariableExtensionPropertyValues (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	VariableID int   NOT NULL,
	PropertyID int   NOT NULL,
	PropertyValue varchar (255)  NOT NULL,
	PRIMARY KEY (BridgeID)
)
/***************************************************************************/
/********************* CREATE ODM2EXTERNALIDENTIFIERS **********************/
/***************************************************************************/

CREATE TABLE ODM2.CitationExternalIdentifiers (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	CitationID int   NOT NULL,
	ExternalIdentifierSystemID int   NOT NULL,
	CitationExternalIdentifer varchar (255)  NOT NULL,
	CitationExternalIdentiferURI varchar (255)  NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.ExternalIdentifierSystems (
	ExternalIdentifierSystemID int   NOT NULL,
	ExternalIdentifierSystemName varchar (255)  NOT NULL,
	IdentifierSystemOrganizationID int   NOT NULL,
	ExternalIdentifierSystemDescription varchar (500)  NULL,
	ExternalIdentifierSystemURL varchar (255)  NULL,
	PRIMARY KEY (ExternalIdentifierSystemID)
)
CREATE TABLE ODM2.MethodExternalIdentifiers (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	MethodID int   NOT NULL,
	ExternalIdentifierSystemID int   NOT NULL,
	MethodExternalIdentifier varchar (255)  NOT NULL,
	MethodExternalIdentifierURI varchar (255)  NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.PersonExternalIdentifiers (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	PersonID int   NOT NULL,
	ExternalIdentifierSystemID int   NOT NULL,
	PersonExternalIdentifier varchar (255)  NOT NULL,
	PersonExternalIdenifierURI varchar (255)  NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.ReferenceMaterialExternalIdentifiers (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ReferenceMaterialID int   NOT NULL,
	ExternalIdentifierSystemID int   NOT NULL,
	ReferenceMaterialExternalIdentifier varchar (255)  NOT NULL,
	ReferenceMaterialExternalIdentifierURI varchar (255)  NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.SamplingFeatureExternalIdentifiers (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	SamplingFeatureID int   NOT NULL,
	ExternalIdentifierSystemID int   NOT NULL,
	SamplingFeatureExternalIdentifier varchar (255)  NOT NULL,
	SamplingFeatureExternalIdentiferURI varchar (255)  NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.SpatialReferenceExternalIdentifiers (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	SpatialReferenceID int   NOT NULL,
	ExternalIdentifierSystemID int   NOT NULL,
	SpatialReferenceExternalIdentifier varchar (255)  NOT NULL,
	SpatialReferenceExternalIdentifierURI varchar (255)  NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.TaxonomicClassifierExternalIdentifiers (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	TaxonomicClassifierID int   NOT NULL,
	ExternalIdentifierSystemID int   NOT NULL,
	TaxonomicClassifierExternalIdentifier varchar (255)  NOT NULL,
	TaxonomicClassifierExternalIdentifierURI varchar (255)  NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.VariableExternalIdentifiers (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	VariableID int   NOT NULL,
	ExternalIdentifierSystemID int   NOT NULL,
	VariableExternalIdentifer varchar (255)  NOT NULL,
	VariableExternalIdentifierURI varchar (255)  NULL,
	PRIMARY KEY (BridgeID)
)
/***************************************************************************/
/************************* CREATE ODM2LABANALYSES **************************/
/***************************************************************************/

CREATE TABLE ODM2.ActionDirectives (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ActionID int   NOT NULL,
	DirectiveID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.Directives (
	DirectiveID int  IDENTITY (1,1) NOT NULL,
	DirectiveTypeCV varchar (255)  NOT NULL,
	DirectiveDescription varchar (500)  NOT NULL,
	PRIMARY KEY (DirectiveID)
)
CREATE TABLE ODM2.SpecimenBatchPostions (
	FeatureActionID int   NOT NULL,
	BatchPositionNumber int   NOT NULL,
	BatchPositionLabel varchar (255)  NULL,
	PRIMARY KEY (FeatureActionID)
)
/***************************************************************************/
/************************** CREATE ODM2PROVENANCE **************************/
/***************************************************************************/

CREATE TABLE ODM2.AuthorLists (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	CitationID int   NOT NULL,
	PersonID int   NOT NULL,
	AuthorOrder int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.Citations (
	CitationID int  IDENTITY (1,1) NOT NULL,
	Title varchar (255)  NOT NULL,
	Publisher varchar (255)  NOT NULL,
	PublicationYear int   NOT NULL,
	CitationLink varchar (255)  NULL,
	PRIMARY KEY (CitationID)
)
CREATE TABLE ODM2.DataSetCitations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	DataSetID int   NOT NULL,
	RelationshipTypeCV varchar (255)  NOT NULL,
	CitationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.DerivationEquations (
	DerivationEquationID int  IDENTITY (1,1) NOT NULL,
	DerivationEquation varchar (255)  NOT NULL,
	PRIMARY KEY (DerivationEquationID)
)
CREATE TABLE ODM2.MethodCitations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	MethodID int   NOT NULL,
	RelationshipTypeCV varchar (255)  NOT NULL,
	CitationID int   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.RelatedAnnotations (
	RelationID int  IDENTITY (1,1) NOT NULL,
	AnnotationID int   NOT NULL,
	RelationshipTypeCV varchar (255)  NOT NULL,
	RelatedAnnotationID int   NOT NULL,
	PRIMARY KEY (RelationID)
)
CREATE TABLE ODM2.RelatedCitations (
	RelationID int  IDENTITY (1,1) NOT NULL,
	CitationID int   NOT NULL,
	RelationshipTypeCV int   NOT NULL,
	RelatedCitationID int   NOT NULL,
	PRIMARY KEY (RelationID)
)
CREATE TABLE ODM2.RelatedDatasets (
	RelationID int  IDENTITY (1,1) NOT NULL,
	DataSetID int   NOT NULL,
	RelationshipTypeCV varchar (255)  NOT NULL,
	RelatedDatasetID int   NOT NULL,
	VersionCode varchar (50)  NULL,
	PRIMARY KEY (RelationID)
)
CREATE TABLE ODM2.RelatedResults (
	RelationID int  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	RelationshipTypeCV varchar (255)  NOT NULL,
	RelatedResultID bigint   NOT NULL,
	VersionCode varchar (50)  NULL,
	RelatedResultSequenceNumber int   NULL,
	PRIMARY KEY (RelationID)
)
CREATE TABLE ODM2.ResultDerivationEquations (
	ResultID bigint   NOT NULL,
	DerivationEquationID int   NOT NULL,
	PRIMARY KEY (ResultID)
)
/***************************************************************************/
/*************************** CREATE ODM2RESULTS ****************************/
/***************************************************************************/

CREATE TABLE ODM2.CategoricalResults (
	ResultID bigint   NOT NULL,
	XLocation float   NULL,
	XLocationUnitsID int   NULL,
	YLocation float   NULL,
	YLocationUnitsID int   NULL,
	ZLocation float   NULL,
	ZLocationUnitsID int   NULL,
	SpatialReferenceID int   NULL,
	QualityCodeCV bigint   NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.CategoricalResultValues (
	ValueID bigint  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataValue varchar (255)  NOT NULL,
	ValueDateTime datetime   NOT NULL,
	ValueDateTimeUTCOffset int   NOT NULL,
	PRIMARY KEY (ValueID)
)
CREATE TABLE ODM2.MeasurementResults (
	ResultID bigint   NOT NULL,
	XLocation float   NULL,
	XLocationUnitsID int   NULL,
	YLocation float   NULL,
	YLocationUnitsID int   NULL,
	ZLocation float   NULL,
	ZLocationUnitsID int   NULL,
	SpatialReferenceID int   NULL,
	CensorCodeCV varchar (255)  NOT NULL,
	QualityCodeCV varchar (255)  NOT NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	TimeAggregationInterval float   NOT NULL,
	TimeAggregationIntervalUnitsID int   NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.MeasurementResultValues (
	ValueID bigint  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataValue float   NOT NULL,
	ValueDateTime datetime   NOT NULL,
	ValueDateTimeUTCOffset int   NOT NULL,
	PRIMARY KEY (ValueID)
)
CREATE TABLE ODM2.PointCoverageResults (
	ResultID bigint   NOT NULL,
	ZLocation float   NULL,
	ZLocationUnitsID int   NULL,
	SpatialReferenceID int   NULL,
	IntendedXSpacing float   NULL,
	IntendedXSpacingUnitsID int   NULL,
	IntendedYSpacing float   NULL,
	IntendedYSpacingUnitsID int   NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	TimeAggregationInterval float   NOT NULL,
	TimeAggregationIntervalUnitsID int   NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.PointCoverageResultValues (
	ValueID bigint  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataValue bigint   NOT NULL,
	ValueDateTime datetime   NOT NULL,
	ValueDateTimeUTCOffset int   NOT NULL,
	XLocation float   NOT NULL,
	XLocationUnitsID int   NOT NULL,
	YLocation float   NOT NULL,
	YLocationUnitsID int   NOT NULL,
	CensorCodeCV varchar (255)  NOT NULL,
	QualityCodeCV varchar (255)  NOT NULL,
	PRIMARY KEY (ValueID)
)
CREATE TABLE ODM2.ProfileResults (
	ResultID bigint   NOT NULL,
	XLocation float   NULL,
	XLocationUnitsID int   NULL,
	YLocation float   NULL,
	YLocationUnitsID int   NULL,
	SpatialReferenceID int   NULL,
	IntendedZSpacing float   NULL,
	IntendedZSpacingUnitsID int   NULL,
	IntendedTimeSpacing float   NULL,
	IntendedTimeSpacingUnitsID int   NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.ProfileResultValues (
	ValueID bigint  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataValue float   NOT NULL,
	ValueDateTime datetime   NOT NULL,
	ValueDateTimeUTCOffset int   NOT NULL,
	ZLocation float   NOT NULL,
	ZAggregationInterval float   NOT NULL,
	ZLocationUnitsID int   NOT NULL,
	CensorCodeCV varchar (255)  NOT NULL,
	QualityCodeCV varchar (255)  NOT NULL,
	TimeAggregationInterval float   NOT NULL,
	TimeAggregationIntervalUnitsID int   NOT NULL,
	PRIMARY KEY (ValueID)
)
CREATE TABLE ODM2.ResultTypeCV (
	ResultTypeCV varchar (255)  NOT NULL,
	ResultTypeCategory varchar (255)  NOT NULL,
	DataType varchar (255)  NOT NULL,
	ResultTypeDefinition varchar (500)  NOT NULL,
	FixedDimensions varchar (255)  NOT NULL,
	VaryingDimensions varchar (255)  NOT NULL,
	SpaceMeasurementFramework varchar (255)  NOT NULL,
	TimeMeasurementFramework varchar (255)  NOT NULL,
	VariableMeasurementFramework varchar (255)  NOT NULL,
	PRIMARY KEY (ResultTypeCV)
)
CREATE TABLE ODM2.SectionResults (
	ResultID bigint   NOT NULL,
	YLocation float   NULL,
	YLocationUnitsID int   NULL,
	SpatialReferenceID int   NULL,
	IntendedXSpacing float   NULL,
	IntendedXSpacingUnitsID int   NULL,
	IntendedZSpacing float   NULL,
	IntendedZSpacingUnitsID int   NULL,
	IntendedTimeSpacing float   NULL,
	IntendedTimeSpacingUnitsID int   NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.SectionResultValues (
	ValueID bigint  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataValue float   NOT NULL,
	ValueDateTime bigint   NOT NULL,
	ValueDateTimeUTCOffset bigint   NOT NULL,
	XLocation float   NOT NULL,
	XAggregationInterval float   NOT NULL,
	XLocationUnitsID int   NOT NULL,
	ZLocation bigint   NOT NULL,
	ZAggregationInterval float   NOT NULL,
	ZLocationUnitsID int   NOT NULL,
	CensorCodeCV varchar (255)  NOT NULL,
	QualityCodeCV varchar (255)  NOT NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	TimeAggregationInterval float   NOT NULL,
	TimeAggregationIntervalUnitsID int   NOT NULL,
	PRIMARY KEY (ValueID)
)
CREATE TABLE ODM2.SpectraResults (
	ResultID bigint   NOT NULL,
	XLocation float   NULL,
	XLocationUnitsID int   NULL,
	YLocation float   NULL,
	YLocationUnitsID int   NULL,
	ZLocation float   NULL,
	ZLocationUnitsID int   NULL,
	SpatialReferenceID int   NULL,
	IntendedWavelengthSpacing float   NULL,
	IntendedWavelengthSpacingUnitsID int   NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.SpectraResultValues (
	ValueID bigint  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataValue float   NOT NULL,
	ValueDateTime datetime   NOT NULL,
	ValueDateTimeUTCOffset int   NOT NULL,
	ExcitationWavelength float   NOT NULL,
	EmissionWavelength float   NOT NULL,
	WavelengthUnitsID int   NOT NULL,
	CensorCodeCV varchar (255)  NOT NULL,
	QualityCodeCV varchar (255)  NOT NULL,
	TimeAggregationInterval float   NOT NULL,
	TimeAggregationIntervalUnitsID int   NOT NULL,
	PRIMARY KEY (ValueID)
)
CREATE TABLE ODM2.TimeSeriesResults (
	ResultID bigint   NOT NULL,
	XLocation float   NULL,
	XLocationUnitsID int   NULL,
	YLocation float   NULL,
	YLocationUnitsID int   NULL,
	ZLocation float   NULL,
	ZLocationUnitsID int   NULL,
	SpatialReferenceID int   NULL,
	IntendedTimeSpacing float   NULL,
	IntendedTimeSpacingUnitsID int   NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.TimeSeriesResultValues (
	ValueID bigint  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataValue float   NOT NULL,
	ValueDateTime datetime   NOT NULL,
	ValueDateTimeUTCOffset int   NOT NULL,
	CensorCodeCV varchar (255)  NOT NULL,
	QualityCodeCV varchar (255)  NOT NULL,
	TimeAggregationInterval float   NOT NULL,
	TimeAggregationIntervalUnitsID int   NOT NULL,
	PRIMARY KEY (ValueID)
)
CREATE TABLE ODM2.TrajectoryResults (
	ResultID bigint   NOT NULL,
	SpatialReferenceID int   NULL,
	IntendedTrajectorySpacing float   NULL,
	IntendedTrajectorySpacingUnitsID int   NULL,
	IntendedTimeSpacing float   NULL,
	IntendedTimeSpacingUnitsID int   NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.TrajectoryResultValues (
	ValueID bigint  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataValue float   NOT NULL,
	ValueDateTime datetime   NOT NULL,
	ValueDateTimeUTCOffset int   NOT NULL,
	XLocation float   NOT NULL,
	XLocationUnitsID int   NOT NULL,
	YLocation float   NOT NULL,
	YLocationUnitsID int   NOT NULL,
	ZLocation float   NOT NULL,
	ZLocationUnitsID int   NOT NULL,
	TrajectoryDistance float   NOT NULL,
	TrajectoryDistanceAggregationInterval float   NOT NULL,
	TrajectoryDistanceUnitsID int   NOT NULL,
	CensorCode varchar (255)  NOT NULL,
	QualityCodeCV varchar (255)  NOT NULL,
	TimeAggregationInterval float   NOT NULL,
	TimeAggregationIntervalUnitsID int   NOT NULL,
	PRIMARY KEY (ValueID)
)
CREATE TABLE ODM2.TransectResults (
	ResultID bigint   NOT NULL,
	ZLocation float   NULL,
	ZLocationUnitsID int   NULL,
	SpatialReferenceID int   NULL,
	IntendedTransectSpacing float   NULL,
	IntendedTransectSpacingUnitsID int   NULL,
	IntendedTimeSpacing float   NULL,
	IntendedTimeSpacingUnitsID int   NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	PRIMARY KEY (ResultID)
)
CREATE TABLE ODM2.TransectResultValues (
	ValueID bigint  IDENTITY (1,1) NOT NULL,
	ResultID bigint   NOT NULL,
	DataValue float   NOT NULL,
	ValueDateTime datetime   NOT NULL,
	ValueDateTimeUTCOffset datetime   NOT NULL,
	XLocation float   NOT NULL,
	XLocationUnitsID int   NOT NULL,
	YLocation float   NOT NULL,
	YLocationUnitsID int   NOT NULL,
	TransectDistance float   NOT NULL,
	TransectDistanceAggregationInterval float   NOT NULL,
	TransectDistanceUnitsID int   NOT NULL,
	CensorCodeCV varchar (255)  NOT NULL,
	QualityCodeCV varchar (255)  NOT NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	TimeAggregationInterval float   NOT NULL,
	TimeAggregationIntervalUnitsID int   NOT NULL,
	PRIMARY KEY (ValueID)
)
/***************************************************************************/
/*********************** CREATE ODM2SAMPLINGFEATURES ***********************/
/***************************************************************************/

CREATE TABLE ODM2.RelatedFeatures (
	RelationID int  IDENTITY (1,1) NOT NULL,
	SamplingFeatureID int   NOT NULL,
	RelationshipTypeCV varchar (255)  NOT NULL,
	RelatedFeatureID int   NOT NULL,
	SpatialOffsetID int   NULL,
	PRIMARY KEY (RelationID)
)
CREATE TABLE ODM2.Sites (
	SamplingFeatureID int   NOT NULL,
	SiteTypeCV varchar (255)  NOT NULL,
	Latitude float   NOT NULL,
	Longitude float   NOT NULL,
	LatLonDatumID int   NOT NULL,
	PRIMARY KEY (SamplingFeatureID)
)
CREATE TABLE ODM2.SpatialOffsets (
	SpatialOffsetID int   NOT NULL,
	SpatialOffsetTypeCV varchar (255)  NOT NULL,
	Offset1Value float   NOT NULL,
	Offset1UnitID int   NOT NULL,
	Offset2Value float   NULL,
	Offset2UnitID int   NULL,
	Offset3Value float   NULL,
	Offset3UnitID int   NULL,
	PRIMARY KEY (SpatialOffsetID)
)
CREATE TABLE ODM2.SpatialReferences (
	SpatialReferenceID int  IDENTITY (1,1) NOT NULL,
	SRSCode varchar (50)  NULL,
	SRSName varchar (255)  NOT NULL,
	SRSDescription varchar (500)  NULL,
	PRIMARY KEY (SpatialReferenceID)
)
CREATE TABLE ODM2.Specimens (
	SamplingFeatureID int   NOT NULL,
	SpecimenTypeCV varchar (255)  NOT NULL,
	SpecimenMediumCV varchar (255)  NOT NULL,
	IsFieldSpecimen bit   NOT NULL,
	PRIMARY KEY (SamplingFeatureID)
)
CREATE TABLE ODM2.SpecimenTaxonomicClassifiers (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	SamplingFeatureID int   NOT NULL,
	TaxonomicClassifierID int   NOT NULL,
	CitationID int   NULL,
	PRIMARY KEY (BridgeID)
)
/***************************************************************************/
/************************** CREATE ODM2SIMULATION **************************/
/***************************************************************************/

CREATE TABLE ODM2.ModelAffiliations (
	BridgeID int  IDENTITY (1,1) NOT NULL,
	ModelID int   NOT NULL,
	AffiliationID int   NOT NULL,
	IsPrimary bit   NOT NULL,
	RoleDescription varchar (500)  NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ODM2.Models (
	ModelID int  IDENTITY (1,1) NOT NULL,
	ModelCode varchar (50)  NOT NULL,
	ModelName varchar (255)  NOT NULL,
	ModelDescription varchar (500)  NULL,
	Version varchar (255)  NULL,
	ModelLink varchar (255)  NULL,
	PRIMARY KEY (ModelID)
)
CREATE TABLE ODM2.RelatedModels (
	RelatedID int  IDENTITY (1,1) NOT NULL,
	ModelID int   NOT NULL,
	RelationshipTypeCV varchar (255)  NOT NULL,
	RelatedModelID int   NOT NULL,
	PRIMARY KEY (RelatedID)
)
CREATE TABLE ODM2.Simulations (
	SimulationID int  IDENTITY (1,1) NOT NULL,
	ActionID int   NOT NULL,
	SimulationName varchar (255)  NOT NULL,
	SimulationDescription varchar (500)  NULL,
	SimulationStartDateTime datetime   NOT NULL,
	SimulationStartDateTimeUTCOffset int   NOT NULL,
	SimulationEndDateTime datetime   NOT NULL,
	SimulationEndDateTimeUTCOffset int   NOT NULL,
	TimeStepValue float   NOT NULL,
	TimeStepUnitsID int   NOT NULL,
	InputDataSetID int   NULL,
	ModelID int   NOT NULL,
	PRIMARY KEY (SimulationID)
)

ALTER TABLE ODM2.ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Annotations ADD CONSTRAINT fk_Annotations_Citations
FOREIGN KEY (CitationID) REFERENCES ODM2.Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Annotations ADD CONSTRAINT fk_Annotations_People
FOREIGN KEY (AnnotatorID) REFERENCES ODM2.People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_CategoricalResultValues
FOREIGN KEY (ValueID) REFERENCES ODM2.CategoricalResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Equipment
FOREIGN KEY (EquipmentID) REFERENCES ODM2.Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MeasurementResultValueAnnotations ADD CONSTRAINT fk_MeasurementResultValueAnnotations_MeasurementResultValues
FOREIGN KEY (ValueID) REFERENCES ODM2.MeasurementResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MeasurementResultValueAnnotations ADD CONSTRAINT fk_ResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Methods
FOREIGN KEY (MethodID) REFERENCES ODM2.Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_PointCoverageResultValues
FOREIGN KEY (ValueID) REFERENCES ODM2.PointCoverageResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_ProfileResultValues
FOREIGN KEY (ValueID) REFERENCES ODM2.ProfileResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2.SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_SectionResultValues
FOREIGN KEY (ValueID) REFERENCES ODM2.SectionResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_SpectraResultValues
FOREIGN KEY (ValueID) REFERENCES ODM2.SpectraResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues
FOREIGN KEY (ValueID) REFERENCES ODM2.TimeSeriesResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_TrajectoryResultValues
FOREIGN KEY (ValueID) REFERENCES ODM2.TrajectoryResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_TransectResultValues
FOREIGN KEY (ValueID) REFERENCES ODM2.TransectResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ActionBy ADD CONSTRAINT fk_ActionPeople_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ActionBy ADD CONSTRAINT fk_ActionPeople_Affiliations
FOREIGN KEY (AffiliationID) REFERENCES ODM2.Affiliations (AffiliationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Actions ADD CONSTRAINT fk_Actions_Methods
FOREIGN KEY (MethodID) REFERENCES ODM2.Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Affiliations ADD CONSTRAINT fk_Affiliations_Organizations
FOREIGN KEY (OrganizationID) REFERENCES ODM2.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Affiliations ADD CONSTRAINT fk_Affiliations_People
FOREIGN KEY (PersonID) REFERENCES ODM2.People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataSetsResults ADD CONSTRAINT fk_DataSetsResults_DataSets
FOREIGN KEY (DataSetID) REFERENCES ODM2.DataSets (DataSetID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataSetsResults ADD CONSTRAINT fk_DataSetsResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.FeatureActions ADD CONSTRAINT fk_FeatureActions_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.FeatureActions ADD CONSTRAINT fk_FeatureActions_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2.SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Methods ADD CONSTRAINT fk_Methods_Organizations
FOREIGN KEY (OrganizationID) REFERENCES ODM2.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Organizations ADD CONSTRAINT fk_Organizations_Organizations
FOREIGN KEY (ParentOrganizationID) REFERENCES ODM2.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions_AreRelated
FOREIGN KEY (RelatedActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Results ADD CONSTRAINT fk_Results_FeatureActions
FOREIGN KEY (FeatureActionID) REFERENCES ODM2.FeatureActions (FeatureActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Results ADD CONSTRAINT fk_Results_ProcessingLevels
FOREIGN KEY (ProcessingLevelID) REFERENCES ODM2.ProcessingLevels (ProcessingLevelID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Results ADD CONSTRAINT fk_Results_ResultTypeCV
FOREIGN KEY (ResultTypeCV) REFERENCES ODM2.ResultTypeCV (ResultTypeCV)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Results ADD CONSTRAINT fk_Results_TaxonomicClassifiers
FOREIGN KEY (TaxonomicClassifierID) REFERENCES ODM2.TaxonomicClassifiers (TaxonomicClassifierID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Results ADD CONSTRAINT fk_Results_Units
FOREIGN KEY (UnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Results ADD CONSTRAINT fk_Results_Variables
FOREIGN KEY (VariableID) REFERENCES ODM2.Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TaxonomicClassifiers ADD CONSTRAINT fk_ParentTaxon_Taxon
FOREIGN KEY (ParentTaxonomicClassifierID) REFERENCES ODM2.TaxonomicClassifiers (TaxonomicClassifierID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataQuality ADD CONSTRAINT fk_DataQuality_Units
FOREIGN KEY (DataQualityValueUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_Organizations
FOREIGN KEY (ReferenceMaterialOrganizationID) REFERENCES ODM2.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2.SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Citations
FOREIGN KEY (CitationID) REFERENCES ODM2.Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_ReferenceMaterials
FOREIGN KEY (ReferenceMaterialID) REFERENCES ODM2.ReferenceMaterials (ReferenceMaterialID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Units
FOREIGN KEY (UnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Variables
FOREIGN KEY (VariableID) REFERENCES ODM2.Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_ReferenceMaterialValues
FOREIGN KEY (NormalizedByReferenceMaterialValueID) REFERENCES ODM2.ReferenceMaterialValues (ReferenceMaterialValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_DataQuality
FOREIGN KEY (DataQualityID) REFERENCES ODM2.DataQuality (DataQualityID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CalibrationActions ADD CONSTRAINT fk_CalibrationActions_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CalibrationActions ADD CONSTRAINT fk_CalibrationActions_InstrumentOutputVariables
FOREIGN KEY (InstrumentOutputVariableID) REFERENCES ODM2.InstrumentOutputVariables (InstrumentOutputVariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CalibrationReferenceEquipment ADD CONSTRAINT fk_CalibrationReferenceEquipment_CalibrationActions
FOREIGN KEY (ActionID) REFERENCES ODM2.CalibrationActions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CalibrationReferenceEquipment ADD CONSTRAINT fk_CalibrationReferenceEquipment_Equipment
FOREIGN KEY (EquipmentID) REFERENCES ODM2.Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CalibrationStandards ADD CONSTRAINT fk_CalibrationStandards_CalibrationActions
FOREIGN KEY (ActionID) REFERENCES ODM2.CalibrationActions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CalibrationStandards ADD CONSTRAINT fk_FieldCalibrationStandards_ReferenceMaterials
FOREIGN KEY (ReferenceMaterialID) REFERENCES ODM2.ReferenceMaterials (ReferenceMaterialID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_DataLoggerFiles
FOREIGN KEY (DataLoggerFileID) REFERENCES ODM2.DataLoggerFiles (DataLoggerFileID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_InstrumentOutputVariables
FOREIGN KEY (InstrumentOutputVariableID) REFERENCES ODM2.InstrumentOutputVariables (InstrumentOutputVariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_RecordingUnits
FOREIGN KEY (RecordingIntervalUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_ScanUnits
FOREIGN KEY (ScanIntervalUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataLoggerFiles ADD CONSTRAINT fk_DataLoggerFiles_DataloggerProgramFiles
FOREIGN KEY (ProgramID) REFERENCES ODM2.DataloggerProgramFiles (ProgramID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataloggerProgramFiles ADD CONSTRAINT fk_DataloggerProgramFiles_Affiliations
FOREIGN KEY (AffiliationID) REFERENCES ODM2.Affiliations (AffiliationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Equipment ADD CONSTRAINT fk_Equipment_EquipmentModels
FOREIGN KEY (EquipmentModelID) REFERENCES ODM2.EquipmentModels (EquipmentModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Equipment ADD CONSTRAINT fk_Equipment_Organizations
FOREIGN KEY (EquipmentVendorID) REFERENCES ODM2.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Equipment ADD CONSTRAINT fk_Equipment_People
FOREIGN KEY (EquipmentOwnerID) REFERENCES ODM2.People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.EquipmentModels ADD CONSTRAINT fk_EquipmentModels_Organizations
FOREIGN KEY (ModelManufacturerID) REFERENCES ODM2.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.EquipmentUsed ADD CONSTRAINT fk_EquipmentActions_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.EquipmentUsed ADD CONSTRAINT fk_EquipmentActions_Equipment
FOREIGN KEY (EquipmentID) REFERENCES ODM2.Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_EquipmentModels
FOREIGN KEY (ModelID) REFERENCES ODM2.EquipmentModels (EquipmentModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Methods
FOREIGN KEY (InstrumentMethodID) REFERENCES ODM2.Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Units
FOREIGN KEY (InstrumentRawOutputUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Variables
FOREIGN KEY (VariableID) REFERENCES ODM2.Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MaintenanceActions ADD CONSTRAINT fk_MaintenanceActions_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment
FOREIGN KEY (EquipmentID) REFERENCES ODM2.Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment_AreRelated
FOREIGN KEY (RelatedEquipmentID) REFERENCES ODM2.Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ODM2.ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_Citations
FOREIGN KEY (CitationID) REFERENCES ODM2.Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ODM2.ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ExtensionProperties ADD CONSTRAINT fk_ExtensionProperties_Units
FOREIGN KEY (PropertyUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ODM2.ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_Methods
FOREIGN KEY (MethodID) REFERENCES ODM2.Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ODM2.ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ODM2.ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2.SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ODM2.ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_Variables
FOREIGN KEY (VariableID) REFERENCES ODM2.Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_Citations
FOREIGN KEY (CitationID) REFERENCES ODM2.Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ExternalIdentifierSystems ADD CONSTRAINT fk_ExternalIdentifierSystems_Organizations
FOREIGN KEY (IdentifierSystemOrganizationID) REFERENCES ODM2.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_Methods
FOREIGN KEY (MethodID) REFERENCES ODM2.Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_People
FOREIGN KEY (PersonID) REFERENCES ODM2.People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_ExtIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_RefMaterials
FOREIGN KEY (ReferenceMaterialID) REFERENCES ODM2.ReferenceMaterials (ReferenceMaterialID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2.SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_ExtIDSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers
FOREIGN KEY (TaxonomicClassifierID) REFERENCES ODM2.TaxonomicClassifiers (TaxonomicClassifierID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_Variables
FOREIGN KEY (VariableID) REFERENCES ODM2.Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Directives
FOREIGN KEY (DirectiveID) REFERENCES ODM2.Directives (DirectiveID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpecimenBatchPostions ADD CONSTRAINT fk_SpecimenBatchPostions_FeatureActions
FOREIGN KEY (FeatureActionID) REFERENCES ODM2.FeatureActions (FeatureActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.AuthorLists ADD CONSTRAINT fk_AuthorLists_Citations
FOREIGN KEY (CitationID) REFERENCES ODM2.Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.AuthorLists ADD CONSTRAINT fk_AuthorLists_People
FOREIGN KEY (PersonID) REFERENCES ODM2.People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataSetCitations ADD CONSTRAINT fk_DataSetCitations_Citations
FOREIGN KEY (CitationID) REFERENCES ODM2.Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.DataSetCitations ADD CONSTRAINT fk_DataSetCitations_DataSets
FOREIGN KEY (DataSetID) REFERENCES ODM2.DataSets (DataSetID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MethodCitations ADD CONSTRAINT fk_MethodCitations_Citations
FOREIGN KEY (CitationID) REFERENCES ODM2.Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MethodCitations ADD CONSTRAINT fk_MethodCitations_Methods
FOREIGN KEY (MethodID) REFERENCES ODM2.Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations_AreRelated
FOREIGN KEY (RelatedAnnotationID) REFERENCES ODM2.Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations
FOREIGN KEY (CitationID) REFERENCES ODM2.Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations_AreRelated
FOREIGN KEY (RelatedCitationID) REFERENCES ODM2.Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets
FOREIGN KEY (DataSetID) REFERENCES ODM2.DataSets (DataSetID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets_AreRelated
FOREIGN KEY (RelatedDatasetID) REFERENCES ODM2.DataSets (DataSetID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedResults ADD CONSTRAINT fk_RelatedResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedResults ADD CONSTRAINT fk_RelatedResults_Results_AreRelated
FOREIGN KEY (RelatedResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_DerivationEquations
FOREIGN KEY (DerivationEquationID) REFERENCES ODM2.DerivationEquations (DerivationEquationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CategoricalResults ADD CONSTRAINT fk_CategoricalResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CategoricalResults ADD CONSTRAINT fk_CategoricalResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.CategoricalResultValues ADD CONSTRAINT fk_CategoricalResultValues_CategoricalResults
FOREIGN KEY (ResultID) REFERENCES ODM2.CategoricalResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.MeasurementResultValues ADD CONSTRAINT fk_MeasurementResultValues_MeasurementResults
FOREIGN KEY (ResultID) REFERENCES ODM2.MeasurementResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_XUnits
FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_YUnits
FOREIGN KEY (IntendedYSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_PointCoverageResults
FOREIGN KEY (ResultID) REFERENCES ODM2.PointCoverageResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResults ADD CONSTRAINT fk_ProfileResults_DUnits
FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResults ADD CONSTRAINT fk_ProfileResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResults ADD CONSTRAINT fk_ProfileResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResults ADD CONSTRAINT fk_ProfileResults_TUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResults ADD CONSTRAINT fk_ProfileResults_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResults ADD CONSTRAINT fk_ProfileResults_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_DUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_ProfileResults
FOREIGN KEY (ResultID) REFERENCES ODM2.ProfileResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResults ADD CONSTRAINT fk_SectionResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResults ADD CONSTRAINT fk_SectionResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResults ADD CONSTRAINT fk_SectionResults_TMUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResults ADD CONSTRAINT fk_SectionResults_Units
FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResults ADD CONSTRAINT fk_SectionResults_XUnits
FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResults ADD CONSTRAINT fk_SectionResults_ZUnits
FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_SectionResults
FOREIGN KEY (ResultID) REFERENCES ODM2.SectionResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResults ADD CONSTRAINT fk_SpectraResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResults ADD CONSTRAINT fk_SpectraResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResults ADD CONSTRAINT fk_SpectraResults_Units
FOREIGN KEY (IntendedWavelengthSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResults ADD CONSTRAINT fk_SpectraResults_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResults ADD CONSTRAINT fk_SpectraResults_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResults ADD CONSTRAINT fk_SpectraResults_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_SpectraResults
FOREIGN KEY (ResultID) REFERENCES ODM2.SpectraResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_WUnits
FOREIGN KEY (WavelengthUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_TUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_TimeSeriesResults
FOREIGN KEY (ResultID) REFERENCES ODM2.TimeSeriesResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_Units
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TSUnits
FOREIGN KEY (IntendedTrajectorySpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_TrajectoryResults
FOREIGN KEY (ResultID) REFERENCES ODM2.TrajectoryResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TransectResults ADD CONSTRAINT fk_TransectResults_Results
FOREIGN KEY (ResultID) REFERENCES ODM2.Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TransectResults ADD CONSTRAINT fk_TransectResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TransectResults ADD CONSTRAINT fk_TransectResults_TMUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TransectResults ADD CONSTRAINT fk_TransectResults_TSUnits
FOREIGN KEY (IntendedTransectSpacingUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TransectResults ADD CONSTRAINT fk_TransectResults_Units
FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2.Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.TransectResultValues ADD CONSTRAINT fk_TransectResultValues_TransectResults
FOREIGN KEY (ResultID) REFERENCES ODM2.TransectResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedFeatures ADD CONSTRAINT fk_FeatureParents_FeaturesParent
FOREIGN KEY (RelatedFeatureID) REFERENCES ODM2.SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2.SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SpatialOffsets
FOREIGN KEY (SpatialOffsetID) REFERENCES ODM2.SpatialOffsets (SpatialOffsetID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Sites ADD CONSTRAINT fk_Sites_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2.SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Sites ADD CONSTRAINT fk_Sites_SpatialReferences
FOREIGN KEY (LatLonDatumID) REFERENCES ODM2.SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Specimens ADD CONSTRAINT fk_Specimens_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2.SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_Specimens
FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2.Specimens (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers
FOREIGN KEY (TaxonomicClassifierID) REFERENCES ODM2.TaxonomicClassifiers (TaxonomicClassifierID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ModelAffiliations ADD CONSTRAINT fk_ModelAffiliations_Affiliations
FOREIGN KEY (AffiliationID) REFERENCES ODM2.Affiliations (AffiliationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.ModelAffiliations ADD CONSTRAINT fk_ModelAffiliations_Models
FOREIGN KEY (ModelID) REFERENCES ODM2.Models (ModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.RelatedModels ADD CONSTRAINT fk_RelatedModels_Models
FOREIGN KEY (ModelID) REFERENCES ODM2.Models (ModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Simulations ADD CONSTRAINT fk_Simulations_Actions
FOREIGN KEY (ActionID) REFERENCES ODM2.Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE ODM2.Simulations ADD CONSTRAINT fk_Simulations_Models
FOREIGN KEY (ModelID) REFERENCES ODM2.Models (ModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION