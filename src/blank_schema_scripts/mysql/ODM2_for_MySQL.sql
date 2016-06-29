
DROP SCHEMA IF EXISTS ODM2;

CREATE SCHEMA IF NOT EXISTS ODM2;

/***************************************************************************/
/************************* CREATE ODM2ANNOTATIONS **************************/
/***************************************************************************/
USE ODM2;

CREATE TABLE ActionAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE Annotations (
	AnnotationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AnnotationTypeCV VARCHAR (255)  NOT NULL,
	AnnotationCode VARCHAR (50)  NULL,
	AnnotationText VARCHAR (500)  NOT NULL,
	AnnotationDateTime DATETIME   NULL,
	AnnotationUTCOffset INT   NULL,
	AnnotationLink VARCHAR (255)  NULL,
	AnnotatorID INT   NULL,
	CitationID INT   NULL
);

CREATE TABLE CategoricalResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE EquipmentAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	EquipmentID INT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE MeasurementResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE MethodAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodID INT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE PointCoverageResultValueAnnotations (
	BridgeID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE ProfileResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE ResultAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	BeginDateTime DATETIME   NOT NULL,
	EndDateTime DATETIME   NOT NULL
);

CREATE TABLE SamplingFeatureAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE SectionResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE SpectraResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE TimeSeriesResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE TrajectoryResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL
);

CREATE TABLE TransectResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL
);

/***************************************************************************/
/***************************** CREATE ODM2CORE *****************************/
/***************************************************************************/
USE ODM2;

CREATE TABLE ActionBy (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	AffiliationID INT   NOT NULL,
	IsActionLead TINYINT(1)   NOT NULL,
	RoleDescription VARCHAR (5000)  NULL
);

CREATE TABLE Actions (
	ActionID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionTypeCV VARCHAR (255)  NOT NULL,
	MethodID INT   NOT NULL,
	BeginDateTime DATETIME   NOT NULL,
	BeginDateTimeUTCOffset INT   NOT NULL,
	EndDateTime DATETIME   NULL,
	EndDateTimeUTCOffset INT   NULL,
	ActionDescription VARCHAR (5000)  NULL,
	ActionFileLink VARCHAR (255)  NULL
);

CREATE TABLE Affiliations (
	AffiliationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PersonID INT   NOT NULL,
	OrganizationID INT   NULL,
	IsPrimaryOrganizationContact TINYINT(1)   NULL,
	AffiliationStartDate DATE   NOT NULL,
	AffiliationEndDate DATE   NULL,
	PrimaryPhone VARCHAR (50)  NULL,
	PrimaryEmail VARCHAR (255)  NOT NULL,
	PrimaryAddress VARCHAR (255)  NULL,
	PersonLink VARCHAR (255)  NULL
);

CREATE TABLE Datasets (
	DatasetID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DatasetUUID VARCHAR(36)   NOT NULL,
	DatasetTypeCV VARCHAR (255)  NOT NULL,
	DatasetCode VARCHAR (50)  NOT NULL,
	DatasetTitle VARCHAR (255)  NOT NULL,
	DatasetAbstract VARCHAR (5000)  NOT NULL,
	CONSTRAINT uc_DatasetCode UNIQUE (DatasetCode)
);

CREATE TABLE DatasetsResults (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DatasetID INT   NOT NULL,
	ResultID BIGINT   NOT NULL
);

CREATE TABLE FeatureActions (
	FeatureActionID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	ActionID INT   NOT NULL
);

CREATE TABLE Methods (
	MethodID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodTypeCV VARCHAR (255)  NOT NULL,
	MethodCode VARCHAR (50)  NOT NULL,
	MethodName VARCHAR (255)  NOT NULL,
	MethodDescription VARCHAR (5000)  NULL,
	MethodLink VARCHAR (255)  NULL,
	OrganizationID INT   NULL,
	CONSTRAINT uc_MethodCode UNIQUE (MethodCode)
);

CREATE TABLE Organizations (
	OrganizationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	OrganizationTypeCV VARCHAR (255)  NOT NULL,
	OrganizationCode VARCHAR (50)  NOT NULL,
	OrganizationName VARCHAR (255)  NOT NULL,
	OrganizationDescription VARCHAR (5000)  NULL,
	OrganizationLink VARCHAR (255)  NULL,
	ParentOrganizationID INT   NULL,
	CONSTRAINT uc_OrganizationCode UNIQUE (OrganizationCode)
);

CREATE TABLE People (
	PersonID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PersonFirstName VARCHAR (255)  NOT NULL,
	PersonMiddleName VARCHAR (255)  NULL,
	PersonLastName VARCHAR (255)  NOT NULL
);

CREATE TABLE ProcessingLevels (
	ProcessingLevelID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ProcessingLevelCode VARCHAR (50)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Explanation VARCHAR (5000)  NULL,
	CONSTRAINT uc_ProcessingLevelCode UNIQUE (ProcessingLevelCode)
);

CREATE TABLE RelatedActions (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedActionID INT   NOT NULL
);

CREATE TABLE Results (
	ResultID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultUUID VARCHAR(36)   NOT NULL,
	FeatureActionID INT   NOT NULL,
	ResultTypeCV VARCHAR (255)  NOT NULL,
	VariableID INT   NOT NULL,
	UnitsID INT   NOT NULL,
	TaxonomicClassifierID INT   NULL,
	ProcessingLevelID INT   NOT NULL,
	ResultDateTime DATETIME   NULL,
	ResultDateTimeUTCOffset BIGINT   NULL,
	ValidDateTime DATETIME   NULL,
	ValidDateTimeUTCOffset BIGINT   NULL,
	StatusCV VARCHAR (255)  NULL,
	SampledMediumCV VARCHAR (255)  NOT NULL,
	ValueCount INT   NOT NULL
);

CREATE TABLE SamplingFeatures (
	SamplingFeatureID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureUUID VARCHAR(36)   NOT NULL,
	SamplingFeatureTypeCV VARCHAR (255)  NOT NULL,
	SamplingFeatureCode VARCHAR (50)  NOT NULL,
	SamplingFeatureName VARCHAR (255)  NULL,
	SamplingFeatureDescription VARCHAR (5000)  NULL,
	SamplingFeatureGeotypeCV VARCHAR (255)  NULL,
	FeatureGeometry geometry   NULL,
	FeatureGeometryWKT VARCHAR (8000)  NULL,
	Elevation_m FLOAT   NULL,
	ElevationDatumCV VARCHAR (255)  NULL,
	CONSTRAINT uc_SamplingFeatureCode UNIQUE (SamplingFeatureCode)
);

CREATE TABLE TaxonomicClassifiers (
	TaxonomicClassifierID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	TaxonomicClassifierTypeCV VARCHAR (255)  NOT NULL,
	TaxonomicClassifierName VARCHAR (255)  NOT NULL,
	TaxonomicClassifierCommonName VARCHAR (255)  NULL,
	TaxonomicClassifierDescription VARCHAR (5000)  NULL,
	ParentTaxonomicClassifierID INT   NULL
);

CREATE TABLE Units (
	UnitsID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	UnitsTypeCV VARCHAR (255)  NOT NULL,
	UnitsAbbreviation VARCHAR (50)  NOT NULL,
	UnitsName VARCHAR (255)  NOT NULL,
	UnitsLink VARCHAR (255)  NULL
);

CREATE TABLE Variables (
	VariableID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	VariableTypeCV VARCHAR (255)  NOT NULL,
	VariableCode VARCHAR (50)  NOT NULL,
	VariableNameCV VARCHAR (255)  NOT NULL,
	VariableDefinition VARCHAR (500)  NULL,
	SpeciationCV VARCHAR (255)  NULL,
	NoDataValue DOUBLE   NOT NULL,
	CONSTRAINT uc_VariableCode UNIQUE (VariableCode)
);

/***************************************************************************/
/****************************** CREATE ODM2CV ******************************/
/***************************************************************************/
USE ODM2;

CREATE TABLE CV_ActionType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_AggregationStatistic (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_AnnotationType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_CensorCode (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_DataQualityType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_DatasetType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_DirectiveType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_ElevationDatum (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_EquipmentType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_Medium (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_MethodType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_OrganizationType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_PropertyDataType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_QualityCode (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_RelationshipType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_ResultType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_SamplingFeatureGeoType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_SamplingFeatureType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_SiteType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_SpatialOffsetType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_Speciation (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_SpecimenType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_Status (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_TaxonomicClassifierType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_UnitsType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_VariableName (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

CREATE TABLE CV_VariableType (
	Term VARCHAR (255)  NOT NULL,
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI VARCHAR (255)  NULL
);

/***************************************************************************/
/************************* CREATE ODM2DATAQUALITY **************************/
/***************************************************************************/
USE ODM2;

CREATE TABLE DataQuality (
	DataQualityID INT   NOT NULL PRIMARY KEY,
	DataQualityTypeCV VARCHAR (255)  NOT NULL,
	DataQualityCode VARCHAR (255)  NOT NULL,
	DataQualityValue FLOAT   NULL,
	DataQualityValueUnitsID INT   NULL,
	DataQualityDescription VARCHAR (5000)  NULL,
	DataQualityLink VARCHAR (255)  NULL,
	CONSTRAINT uc_DataQualityCode UNIQUE (DataQualityCode)
);

CREATE TABLE ReferenceMaterials (
	ReferenceMaterialID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ReferenceMaterialMediumCV VARCHAR (255)  NOT NULL,
	ReferenceMaterialOrganizationID INT   NOT NULL,
	ReferenceMaterialCode VARCHAR (50)  NOT NULL,
	ReferenceMaterialLotCode VARCHAR (255)  NULL,
	ReferenceMaterialPurchaseDate DATETIME   NULL,
	ReferenceMaterialExpirationDate DATETIME   NULL,
	ReferenceMaterialCertificateLink VARCHAR (255)  NULL,
	SamplingFeatureID INT   NULL,
	CONSTRAINT uc_ReferenceMaterialCode UNIQUE (ReferenceMaterialCode)
);

CREATE TABLE ReferenceMaterialValues (
	ReferenceMaterialValueID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ReferenceMaterialID INT   NOT NULL,
	ReferenceMaterialValue FLOAT   NOT NULL,
	ReferenceMaterialAccuracy FLOAT   NULL,
	VariableID INT   NOT NULL,
	UnitsID INT   NOT NULL,
	CitationID INT   NULL
);

CREATE TABLE ResultNormalizationValues (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	NormalizedByReferenceMaterialValueID INT   NOT NULL
);

CREATE TABLE ResultsDataQuality (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataQualityID INT   NOT NULL
);

/***************************************************************************/
/************************** CREATE ODM2EQUIPMENT ***************************/
/***************************************************************************/
USE ODM2;

CREATE TABLE CalibrationActions (
	ActionID INT   NOT NULL PRIMARY KEY,
	CalibrationCheckValue FLOAT   NULL,
	InstrumentOutputVariableID INT   NOT NULL,
	CalibrationEquation VARCHAR (255)  NULL
);

CREATE TABLE CalibrationReferenceEquipment (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	EquipmentID INT   NOT NULL
);

CREATE TABLE CalibrationStandards (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	ReferenceMaterialID INT   NOT NULL
);

CREATE TABLE DataloggerFileColumns (
	DataloggerFileColumnID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NULL,
	DataLoggerFileID INT   NOT NULL,
	InstrumentOutputVariableID INT   NOT NULL,
	ColumnLabel VARCHAR (50)  NOT NULL,
	ColumnDescription VARCHAR (5000)  NULL,
	MeasurementEquation VARCHAR (255)  NULL,
	ScanInterval FLOAT   NULL,
	ScanIntervalUnitsID INT   NULL,
	RecordingInterval FLOAT   NULL,
	RecordingIntervalUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NULL
);

CREATE TABLE DataLoggerFiles (
	DataLoggerFileID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ProgramID INT   NOT NULL,
	DataLoggerFileName VARCHAR (255)  NOT NULL,
	DataLoggerFileDescription VARCHAR (5000)  NULL,
	DataLoggerFileLink VARCHAR (255)  NULL
);

CREATE TABLE DataloggerProgramFiles (
	ProgramID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AffiliationID INT   NOT NULL,
	ProgramName VARCHAR (255)  NOT NULL,
	ProgramDescription VARCHAR (5000)  NULL,
	ProgramVersion VARCHAR (50)  NULL,
	ProgramFileLink VARCHAR (255)  NULL
);

CREATE TABLE Equipment (
	EquipmentID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	EquipmentCode VARCHAR (50)  NOT NULL,
	EquipmentName VARCHAR (255)  NOT NULL,
	EquipmentTypeCV VARCHAR (255)  NOT NULL,
	EquipmentModelID INT   NOT NULL,
	EquipmentSerialNumber VARCHAR (50)  NOT NULL,
	EquipmentOwnerID INT   NOT NULL,
	EquipmentVendorID INT   NOT NULL,
	EquipmentPurchaseDate DATETIME   NOT NULL,
	EquipmentPurchaseOrderNumber VARCHAR (50)  NULL,
	EquipmentDescription VARCHAR (5000)  NULL,
	EquipmentDocumentationLink VARCHAR (255)  NULL,
	CONSTRAINT uc_EquipmentCode UNIQUE (EquipmentCode)
);

CREATE TABLE EquipmentModels (
	EquipmentModelID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelManufacturerID INT   NOT NULL,
	ModelPartNumber VARCHAR (50)  NULL,
	ModelName VARCHAR (255)  NOT NULL,
	ModelDescription VARCHAR (5000)  NULL,
	IsInstrument TINYINT(1)   NOT NULL,
	ModelSpecificationsFileLink VARCHAR (255)  NULL,
	ModelLink VARCHAR (255)  NULL
);

CREATE TABLE EquipmentUsed (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	EquipmentID INT   NOT NULL
);

CREATE TABLE InstrumentOutputVariables (
	InstrumentOutputVariableID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelID INT   NOT NULL,
	VariableID INT   NOT NULL,
	InstrumentMethodID INT   NOT NULL,
	InstrumentResolution VARCHAR (255)  NULL,
	InstrumentAccuracy VARCHAR (255)  NULL,
	InstrumentRawOutputUnitsID INT   NOT NULL
);

CREATE TABLE MaintenanceActions (
	ActionID INT   NOT NULL PRIMARY KEY,
	IsFactoryService TINYINT(1)   NOT NULL,
	MaintenanceCode VARCHAR (50)  NULL,
	MaintenanceReason VARCHAR (500)  NULL
);

CREATE TABLE RelatedEquipment (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	EquipmentID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedEquipmentID INT   NOT NULL,
	RelationshipStartDateTime DATETIME   NOT NULL,
	RelationshipStartDateTimeUTCOffset INT   NOT NULL,
	RelationshipEndDateTime DATETIME   NULL,
	RelationshipEndDateTimeUTCOffset INT   NULL
);

/***************************************************************************/
/********************* CREATE ODM2EXTENSIONPROPERTIES **********************/
/***************************************************************************/
USE ODM2;

CREATE TABLE ActionExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL
);

CREATE TABLE CitationExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CitationID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL
);

CREATE TABLE ExtensionProperties (
	PropertyID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PropertyName VARCHAR (255)  NOT NULL,
	PropertyDescription VARCHAR (5000)  NULL,
	PropertyDataTypeCV VARCHAR (255)  NOT NULL,
	PropertyUnitsID INT   NULL
);

CREATE TABLE MethodExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL
);

CREATE TABLE ResultExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL
);

CREATE TABLE SamplingFeatureExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL
);

CREATE TABLE VariableExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	VariableID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL
);

/***************************************************************************/
/********************* CREATE ODM2EXTERNALIDENTIFIERS **********************/
/***************************************************************************/
USE ODM2;

CREATE TABLE CitationExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CitationID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	CitationExternalIdentifier VARCHAR (255)  NOT NULL,
	CitationExternalIdentifierURI VARCHAR (255)  NULL
);

CREATE TABLE ExternalIdentifierSystems (
	ExternalIdentifierSystemID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ExternalIdentifierSystemName VARCHAR (255)  NOT NULL,
	IdentifierSystemOrganizationID INT   NOT NULL,
	ExternalIdentifierSystemDescription VARCHAR (5000)  NULL,
	ExternalIdentifierSystemURL VARCHAR (255)  NULL
);

CREATE TABLE MethodExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	MethodExternalIdentifier VARCHAR (255)  NOT NULL,
	MethodExternalIdentifierURI VARCHAR (255)  NULL
);

CREATE TABLE PersonExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PersonID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	PersonExternalIdentifier VARCHAR (255)  NOT NULL,
	PersonExternalIdentifierURI VARCHAR (255)  NULL
);

CREATE TABLE ReferenceMaterialExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ReferenceMaterialID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	ReferenceMaterialExternalIdentifier VARCHAR (255)  NOT NULL,
	ReferenceMaterialExternalIdentifierURI VARCHAR (255)  NULL
);

CREATE TABLE SamplingFeatureExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	SamplingFeatureExternalIdentifier VARCHAR (255)  NOT NULL,
	SamplingFeatureExternalIdentifierURI VARCHAR (255)  NULL
);

CREATE TABLE SpatialReferenceExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SpatialReferenceID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	SpatialReferenceExternalIdentifier VARCHAR (255)  NOT NULL,
	SpatialReferenceExternalIdentifierURI VARCHAR (255)  NULL
);

CREATE TABLE TaxonomicClassifierExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	TaxonomicClassifierID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	TaxonomicClassifierExternalIdentifier VARCHAR (255)  NOT NULL,
	TaxonomicClassifierExternalIdentifierURI VARCHAR (255)  NULL
);

CREATE TABLE VariableExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	VariableID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	VariableExternalIdentifer VARCHAR (255)  NOT NULL,
	VariableExternalIdentifierURI VARCHAR (255)  NULL
);

/***************************************************************************/
/************************* CREATE ODM2LABANALYSES **************************/
/***************************************************************************/
USE ODM2;

CREATE TABLE ActionDirectives (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	DirectiveID INT   NOT NULL
);

CREATE TABLE Directives (
	DirectiveID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DirectiveTypeCV VARCHAR (255)  NOT NULL,
	DirectiveDescription VARCHAR (5000)  NOT NULL
);

CREATE TABLE SpecimenBatchPostions (
	FeatureActionID INT   NOT NULL PRIMARY KEY,
	BatchPositionNumber INT   NOT NULL,
	BatchPositionLabel VARCHAR (255)  NULL
);

/***************************************************************************/
/************************** CREATE ODM2PROVENANCE **************************/
/***************************************************************************/
USE ODM2;

CREATE TABLE AuthorLists (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CitationID INT   NOT NULL,
	PersonID INT   NOT NULL,
	AuthorOrder INT   NOT NULL
);

CREATE TABLE Citations (
	CitationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Title VARCHAR (255)  NOT NULL,
	Publisher VARCHAR (255)  NOT NULL,
	PublicationYear INT   NOT NULL,
	CitationLink VARCHAR (255)  NULL
);

CREATE TABLE DatasetCitations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DataSetID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	CitationID INT   NOT NULL
);

CREATE TABLE DerivationEquations (
	DerivationEquationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DerivationEquation VARCHAR (255)  NOT NULL
);

CREATE TABLE MethodCitations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	CitationID INT   NOT NULL
);

CREATE TABLE RelatedAnnotations (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AnnotationID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedAnnotationID INT   NOT NULL
);

CREATE TABLE RelatedCitations (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CitationID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedCitationID INT   NOT NULL
);

CREATE TABLE RelatedDatasets (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DataSetID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedDatasetID INT   NOT NULL,
	VersionCode VARCHAR (50)  NULL
);

CREATE TABLE RelatedResults (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedResultID BIGINT   NOT NULL,
	VersionCode VARCHAR (50)  NULL,
	RelatedResultSequenceNumber INT   NULL
);

CREATE TABLE ResultDerivationEquations (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	DerivationEquationID INT   NOT NULL
);

/***************************************************************************/
/*************************** CREATE ODM2RESULTS ****************************/
/***************************************************************************/
USE ODM2;

CREATE TABLE CategoricalResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INT   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INT   NULL,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INT   NULL,
	SpatialReferenceID INT   NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL
);

CREATE TABLE CategoricalResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue VARCHAR (255)  NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	CONSTRAINT uc_CategoricalResultValues UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset)
);

CREATE TABLE MeasurementResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INT   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INT   NULL,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INT   NULL,
	SpatialReferenceID INT   NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INT   NOT NULL
);

CREATE TABLE MeasurementResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	CONSTRAINT uc_MeasurementResultValues UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset)
);

CREATE TABLE PointCoverageResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INT   NULL,
	SpatialReferenceID INT   NULL,
	IntendedXSpacing FLOAT   NULL,
	IntendedXSpacingUnitsID INT   NULL,
	IntendedYSpacing FLOAT   NULL,
	IntendedYSpacingUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INT   NOT NULL
);

CREATE TABLE PointCoverageResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue DOUBLE   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	XLocation FLOAT   NOT NULL,
	XLocationUnitsID INT   NOT NULL,
	YLocation FLOAT   NOT NULL,
	YLocationUnitsID INT   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	CONSTRAINT uc_PointCoverageResultValues UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, XLocation, XLocationUnitsID, YLocation, YLocationUnitsID, CensorCodeCV, QualityCodeCV)
);

CREATE TABLE ProfileResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INT   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INT   NULL,
	SpatialReferenceID INT   NULL,
	IntendedZSpacing FLOAT   NULL,
	IntendedZSpacingUnitsID INT   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL
);

CREATE TABLE ProfileResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	ZLocation FLOAT   NOT NULL,
	ZAggregationInterval FLOAT   NOT NULL,
	ZLocationUnitsID INT   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INT   NOT NULL,
	CONSTRAINT uc_ProfileResultValues UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, ZLocation, ZAggregationInterval, ZLocationUnitsID, CensorCodeCV, QualityCodeCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);

CREATE TABLE SectionResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	YLocation FLOAT   NULL,
	YLocationUnitsID INT   NULL,
	SpatialReferenceID INT   NULL,
	IntendedXSpacing FLOAT   NULL,
	IntendedXSpacingUnitsID INT   NULL,
	IntendedZSpacing FLOAT   NULL,
	IntendedZSpacingUnitsID INT   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL
);

CREATE TABLE SectionResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue DOUBLE   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	XLocation DOUBLE   NOT NULL,
	XAggregationInterval FLOAT   NOT NULL,
	XLocationUnitsID INT   NOT NULL,
	ZLocation BIGINT   NOT NULL,
	ZAggregationInterval FLOAT   NOT NULL,
	ZLocationUnitsID INT   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INT   NOT NULL,
	CONSTRAINT uc_SectionResultValues UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, XLocation, XAggregationInterval, XLocationUnitsID, ZLocation, ZAggregationInterval, ZLocationUnitsID, CensorCodeCV, QualityCodeCV, AggregationStatisticCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);

CREATE TABLE SpectraResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INT   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INT   NULL,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INT   NULL,
	SpatialReferenceID INT   NULL,
	IntendedWavelengthSpacing DOUBLE   NULL,
	IntendedWavelengthSpacingUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL
);

CREATE TABLE SpectraResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	ExcitationWavelength FLOAT   NOT NULL,
	EmissionWavelength FLOAT   NOT NULL,
	WavelengthUnitsID INT   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval DOUBLE   NOT NULL,
	TimeAggregationIntervalUnitsID INT   NOT NULL,
	CONSTRAINT uc_SpectraResultValues UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, ExcitationWavelength, EmissionWavelength, WavelengthUnitsID, CensorCodeCV, QualityCodeCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);

CREATE TABLE TimeSeriesResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INT   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INT   NULL,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INT   NULL,
	SpatialReferenceID INT   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL
);

CREATE TABLE TimeSeriesResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INT   NOT NULL,
	CONSTRAINT uc_TimeSeriesResultValues UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, CensorCodeCV, QualityCodeCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);

CREATE TABLE TrajectoryResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	SpatialReferenceID INT   NULL,
	IntendedTrajectorySpacing FLOAT   NULL,
	IntendedTrajectorySpacingUnitsID INT   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL
);

CREATE TABLE TrajectoryResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	XLocation FLOAT   NOT NULL,
	XLocationUnitsID INT   NOT NULL,
	YLocation FLOAT   NOT NULL,
	YLocationUnitsID INT   NOT NULL,
	ZLocation FLOAT   NOT NULL,
	ZLocationUnitsID INT   NOT NULL,
	TrajectoryDistance FLOAT   NOT NULL,
	TrajectoryDistanceAggregationInterval FLOAT   NOT NULL,
	TrajectoryDistanceUnitsID INT   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INT   NOT NULL,
	CONSTRAINT uc_TrajectoryResultValues UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, XLocation, XLocationUnitsID, YLocation, YLocationUnitsID, ZLocation, ZLocationUnitsID, TrajectoryDistance, TrajectoryDistanceAggregationInterval, TrajectoryDistanceUnitsID, CensorCodeCV, QualityCodeCV, TimeAggregationInterval)
);

CREATE TABLE TransectResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INT   NULL,
	SpatialReferenceID INT   NULL,
	IntendedTransectSpacing FLOAT   NULL,
	IntendedTransectSpacingUnitsID INT   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL
);

CREATE TABLE TransectResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	XLocation FLOAT   NOT NULL,
	XLocationUnitsID INT   NOT NULL,
	YLocation FLOAT   NOT NULL,
	YLocationUnitsID INT   NOT NULL,
	TransectDistance FLOAT   NOT NULL,
	TransectDistanceAggregationInterval FLOAT   NOT NULL,
	TransectDistanceUnitsID INT   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INT   NOT NULL,
	CONSTRAINT uc_TransectResultValues UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, XLocation, XLocationUnitsID, YLocation, YLocationUnitsID, TransectDistance, TransectDistanceAggregationInterval, TransectDistanceUnitsID, CensorCodeCV, QualityCodeCV, AggregationStatisticCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);

/***************************************************************************/
/*********************** CREATE ODM2SAMPLINGFEATURES ***********************/
/***************************************************************************/
USE ODM2;

CREATE TABLE RelatedFeatures (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedFeatureID INT   NOT NULL,
	SpatialOffsetID INT   NULL
);

CREATE TABLE Sites (
	SamplingFeatureID INT   NOT NULL PRIMARY KEY,
	SiteTypeCV VARCHAR (255)  NOT NULL,
	Latitude FLOAT   NOT NULL,
	Longitude FLOAT   NOT NULL,
	SpatialReferenceID INT   NOT NULL
);

CREATE TABLE SpatialOffsets (
	SpatialOffsetID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SpatialOffsetTypeCV VARCHAR (255)  NOT NULL,
	Offset1Value FLOAT   NOT NULL,
	Offset1UnitID INT   NOT NULL,
	Offset2Value FLOAT   NULL,
	Offset2UnitID INT   NULL,
	Offset3Value FLOAT   NULL,
	Offset3UnitID INT   NULL
);

CREATE TABLE SpatialReferences (
	SpatialReferenceID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SRSCode VARCHAR (50)  NULL,
	SRSName VARCHAR (255)  NOT NULL,
	SRSDescription VARCHAR (5000)  NULL,
	SRSLink VARCHAR (255)  NULL
);

CREATE TABLE Specimens (
	SamplingFeatureID INT   NOT NULL PRIMARY KEY,
	SpecimenTypeCV VARCHAR (255)  NOT NULL,
	SpecimenMediumCV VARCHAR (255)  NOT NULL,
	IsFieldSpecimen TINYINT(1)   NOT NULL
);

CREATE TABLE SpecimenTaxonomicClassifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	TaxonomicClassifierID INT   NOT NULL,
	CitationID INT   NULL
);

/***************************************************************************/
/************************** CREATE ODM2SIMULATION **************************/
/***************************************************************************/
USE ODM2;

CREATE TABLE ModelAffiliations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelID INT   NOT NULL,
	AffiliationID INT   NOT NULL,
	IsPrimary TINYINT(1)   NOT NULL,
	RoleDescription VARCHAR (5000)  NULL
);

CREATE TABLE Models (
	ModelID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelCode VARCHAR (50)  NOT NULL,
	ModelName VARCHAR (255)  NOT NULL,
	ModelDescription VARCHAR (5000)  NULL,
	Version VARCHAR (255)  NULL,
	ModelLink VARCHAR (255)  NULL,
	CONSTRAINT uc_ModelCode UNIQUE (ModelCode)
);

CREATE TABLE RelatedModels (
	RelatedID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedModelID INT   NOT NULL
);

CREATE TABLE Simulations (
	SimulationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	SimulationName VARCHAR (255)  NOT NULL,
	SimulationDescription VARCHAR (5000)  NULL,
	SimulationStartDateTime DATETIME   NOT NULL,
	SimulationStartDateTimeUTCOffset INT   NOT NULL,
	SimulationEndDateTime DATETIME   NOT NULL,
	SimulationEndDateTimeUTCOffset INT   NOT NULL,
	TimeStepValue FLOAT   NOT NULL,
	TimeStepUnitsID INT   NOT NULL,
	InputDataSetID INT   NULL,
	ModelID INT   NOT NULL
);


ALTER TABLE ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Annotations ADD CONSTRAINT fk_Annotations_Citations
FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Annotations ADD CONSTRAINT fk_Annotations_CV_AnnotationType
FOREIGN KEY (AnnotationTypeCV) REFERENCES CV_AnnotationType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Annotations ADD CONSTRAINT fk_Annotations_People
FOREIGN KEY (AnnotatorID) REFERENCES People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_CategoricalResultValues
FOREIGN KEY (ValueID) REFERENCES CategoricalResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Equipment
FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResultValueAnnotations ADD CONSTRAINT fk_MeasurementResultValueAnnotations_MeasurementResultValues
FOREIGN KEY (ValueID) REFERENCES MeasurementResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResultValueAnnotations ADD CONSTRAINT fk_ResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_PointCoverageResultValues
FOREIGN KEY (ValueID) REFERENCES PointCoverageResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_ProfileResultValues
FOREIGN KEY (ValueID) REFERENCES ProfileResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_SectionResultValues
FOREIGN KEY (ValueID) REFERENCES SectionResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_SpectraResultValues
FOREIGN KEY (ValueID) REFERENCES SpectraResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues
FOREIGN KEY (ValueID) REFERENCES TimeSeriesResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_TrajectoryResultValues
FOREIGN KEY (ValueID) REFERENCES TrajectoryResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_TransectResultValues
FOREIGN KEY (ValueID) REFERENCES TransectResultValues (ValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ActionBy ADD CONSTRAINT fk_ActionPeople_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ActionBy ADD CONSTRAINT fk_ActionPeople_Affiliations
FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Actions ADD CONSTRAINT fk_Actions_CV_ActionType
FOREIGN KEY (ActionTypeCV) REFERENCES CV_ActionType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Actions ADD CONSTRAINT fk_Actions_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Affiliations ADD CONSTRAINT fk_Affiliations_Organizations
FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Affiliations ADD CONSTRAINT fk_Affiliations_People
FOREIGN KEY (PersonID) REFERENCES People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Datasets ADD CONSTRAINT fk_Datasets_CV_DatasetTypeCV
FOREIGN KEY (DatasetTypeCV) REFERENCES CV_DatasetType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DatasetsResults ADD CONSTRAINT fk_DataSetsResults_DataSets
FOREIGN KEY (DatasetID) REFERENCES Datasets (DatasetID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DatasetsResults ADD CONSTRAINT fk_DataSetsResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE FeatureActions ADD CONSTRAINT fk_FeatureActions_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE FeatureActions ADD CONSTRAINT fk_FeatureActions_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Methods ADD CONSTRAINT fk_Methods_CV_MethodType
FOREIGN KEY (MethodTypeCV) REFERENCES CV_MethodType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Methods ADD CONSTRAINT fk_Methods_Organizations
FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Organizations ADD CONSTRAINT fk_Organizations_CV_OrganizationType
FOREIGN KEY (OrganizationTypeCV) REFERENCES CV_OrganizationType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Organizations ADD CONSTRAINT fk_Organizations_Organizations
FOREIGN KEY (ParentOrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions_AreRelated
FOREIGN KEY (RelatedActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedActions ADD CONSTRAINT fk_RelatedActions_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Results ADD CONSTRAINT fk_Results_CV_Medium
FOREIGN KEY (SampledMediumCV) REFERENCES CV_Medium (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Results ADD CONSTRAINT fk_Results_CV_ResultType
FOREIGN KEY (ResultTypeCV) REFERENCES CV_ResultType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Results ADD CONSTRAINT fk_Results_CV_Status
FOREIGN KEY (StatusCV) REFERENCES CV_Status (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Results ADD CONSTRAINT fk_Results_FeatureActions
FOREIGN KEY (FeatureActionID) REFERENCES FeatureActions (FeatureActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Results ADD CONSTRAINT fk_Results_ProcessingLevels
FOREIGN KEY (ProcessingLevelID) REFERENCES ProcessingLevels (ProcessingLevelID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Results ADD CONSTRAINT fk_Results_TaxonomicClassifiers
FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Results ADD CONSTRAINT fk_Results_Units
FOREIGN KEY (UnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Results ADD CONSTRAINT fk_Results_Variables
FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SamplingFeatures ADD CONSTRAINT fk_SamplingFeatures_CV_ElevationDatum
FOREIGN KEY (ElevationDatumCV) REFERENCES CV_ElevationDatum (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SamplingFeatures ADD CONSTRAINT fk_SamplingFeatures_CV_SamplingFeatureGeoType
FOREIGN KEY (SamplingFeatureGeotypeCV) REFERENCES CV_SamplingFeatureGeoType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SamplingFeatures ADD CONSTRAINT fk_SamplingFeatures_CV_SamplingFeatureType
FOREIGN KEY (SamplingFeatureTypeCV) REFERENCES CV_SamplingFeatureType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TaxonomicClassifiers ADD CONSTRAINT fk_ParentTaxon_Taxon
FOREIGN KEY (ParentTaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TaxonomicClassifiers ADD CONSTRAINT fk_TaxonomicClassifiers_CV_TaxonomicClassifierType
FOREIGN KEY (TaxonomicClassifierTypeCV) REFERENCES CV_TaxonomicClassifierType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Units ADD CONSTRAINT fk_Units_CV_UnitsType
FOREIGN KEY (UnitsTypeCV) REFERENCES CV_UnitsType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Variables ADD CONSTRAINT fk_Variables_CV_Speciation
FOREIGN KEY (SpeciationCV) REFERENCES CV_Speciation (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Variables ADD CONSTRAINT fk_Variables_CV_VariableName
FOREIGN KEY (VariableNameCV) REFERENCES CV_VariableName (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Variables ADD CONSTRAINT fk_Variables_CV_VariableType
FOREIGN KEY (VariableTypeCV) REFERENCES CV_VariableType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataQuality ADD CONSTRAINT fk_DataQuality_CV_DataQualityType
FOREIGN KEY (DataQualityTypeCV) REFERENCES CV_DataQualityType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataQuality ADD CONSTRAINT fk_DataQuality_Units
FOREIGN KEY (DataQualityValueUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_CV_Medium
FOREIGN KEY (ReferenceMaterialMediumCV) REFERENCES CV_Medium (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_Organizations
FOREIGN KEY (ReferenceMaterialOrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Citations
FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_ReferenceMaterials
FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Units
FOREIGN KEY (UnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Variables
FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_ReferenceMaterialValues
FOREIGN KEY (NormalizedByReferenceMaterialValueID) REFERENCES ReferenceMaterialValues (ReferenceMaterialValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_DataQuality
FOREIGN KEY (DataQualityID) REFERENCES DataQuality (DataQualityID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CalibrationActions ADD CONSTRAINT fk_CalibrationActions_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CalibrationActions ADD CONSTRAINT fk_CalibrationActions_InstrumentOutputVariables
FOREIGN KEY (InstrumentOutputVariableID) REFERENCES InstrumentOutputVariables (InstrumentOutputVariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CalibrationReferenceEquipment ADD CONSTRAINT fk_CalibrationReferenceEquipment_CalibrationActions
FOREIGN KEY (ActionID) REFERENCES CalibrationActions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CalibrationReferenceEquipment ADD CONSTRAINT fk_CalibrationReferenceEquipment_Equipment
FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CalibrationStandards ADD CONSTRAINT fk_CalibrationStandards_CalibrationActions
FOREIGN KEY (ActionID) REFERENCES CalibrationActions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CalibrationStandards ADD CONSTRAINT fk_FieldCalibrationStandards_ReferenceMaterials
FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_DataLoggerFiles
FOREIGN KEY (DataLoggerFileID) REFERENCES DataLoggerFiles (DataLoggerFileID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_InstrumentOutputVariables
FOREIGN KEY (InstrumentOutputVariableID) REFERENCES InstrumentOutputVariables (InstrumentOutputVariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_RecordingUnits
FOREIGN KEY (RecordingIntervalUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_ScanUnits
FOREIGN KEY (ScanIntervalUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataLoggerFiles ADD CONSTRAINT fk_DataLoggerFiles_DataloggerProgramFiles
FOREIGN KEY (ProgramID) REFERENCES DataloggerProgramFiles (ProgramID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataloggerProgramFiles ADD CONSTRAINT fk_DataloggerProgramFiles_Affiliations
FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Equipment ADD CONSTRAINT fk_Equipment_CV_EquipmentType
FOREIGN KEY (EquipmentTypeCV) REFERENCES CV_EquipmentType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Equipment ADD CONSTRAINT fk_Equipment_EquipmentModels
FOREIGN KEY (EquipmentModelID) REFERENCES EquipmentModels (EquipmentModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Equipment ADD CONSTRAINT fk_Equipment_Organizations
FOREIGN KEY (EquipmentVendorID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Equipment ADD CONSTRAINT fk_Equipment_People
FOREIGN KEY (EquipmentOwnerID) REFERENCES People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE EquipmentModels ADD CONSTRAINT fk_EquipmentModels_Organizations
FOREIGN KEY (ModelManufacturerID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE EquipmentUsed ADD CONSTRAINT fk_EquipmentActions_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE EquipmentUsed ADD CONSTRAINT fk_EquipmentActions_Equipment
FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_EquipmentModels
FOREIGN KEY (ModelID) REFERENCES EquipmentModels (EquipmentModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Methods
FOREIGN KEY (InstrumentMethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Units
FOREIGN KEY (InstrumentRawOutputUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Variables
FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MaintenanceActions ADD CONSTRAINT fk_MaintenanceActions_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment
FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment_AreRelated
FOREIGN KEY (RelatedEquipmentID) REFERENCES Equipment (EquipmentID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_Citations
FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ExtensionProperties ADD CONSTRAINT fk_ExtensionProperties_CV_PropertyDataType
FOREIGN KEY (PropertyDataTypeCV) REFERENCES CV_PropertyDataType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ExtensionProperties ADD CONSTRAINT fk_ExtensionProperties_Units
FOREIGN KEY (PropertyUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_ExtensionProperties
FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_Variables
FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_Citations
FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ExternalIdentifierSystems ADD CONSTRAINT fk_ExternalIdentifierSystems_Organizations
FOREIGN KEY (IdentifierSystemOrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_People
FOREIGN KEY (PersonID) REFERENCES People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_ExtIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_RefMaterials
FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_ExtIDSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers
FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_ExternalIdentifierSystems
FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_Variables
FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Directives
FOREIGN KEY (DirectiveID) REFERENCES Directives (DirectiveID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Directives ADD CONSTRAINT fk_Directives_CV_DirectiveType
FOREIGN KEY (DirectiveTypeCV) REFERENCES CV_DirectiveType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpecimenBatchPostions ADD CONSTRAINT fk_SpecimenBatchPostions_FeatureActions
FOREIGN KEY (FeatureActionID) REFERENCES FeatureActions (FeatureActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AuthorLists ADD CONSTRAINT fk_AuthorLists_Citations
FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AuthorLists ADD CONSTRAINT fk_AuthorLists_People
FOREIGN KEY (PersonID) REFERENCES People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DatasetCitations ADD CONSTRAINT fk_DataSetCitations_Citations
FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DatasetCitations ADD CONSTRAINT fk_DatasetCitations_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DatasetCitations ADD CONSTRAINT fk_DataSetCitations_DataSets
FOREIGN KEY (DataSetID) REFERENCES Datasets (DatasetID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MethodCitations ADD CONSTRAINT fk_MethodCitations_Citations
FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MethodCitations ADD CONSTRAINT fk_MethodCitations_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MethodCitations ADD CONSTRAINT fk_MethodCitations_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations
FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations_AreRelated
FOREIGN KEY (RelatedAnnotationID) REFERENCES Annotations (AnnotationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations
FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations_AreRelated
FOREIGN KEY (RelatedCitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedCitations ADD CONSTRAINT fk_RelatedCitations_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets
FOREIGN KEY (DataSetID) REFERENCES Datasets (DatasetID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets_AreRelated
FOREIGN KEY (RelatedDatasetID) REFERENCES Datasets (DatasetID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedResults ADD CONSTRAINT fk_RelatedResults_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedResults ADD CONSTRAINT fk_RelatedResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedResults ADD CONSTRAINT fk_RelatedResults_Results_AreRelated
FOREIGN KEY (RelatedResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_DerivationEquations
FOREIGN KEY (DerivationEquationID) REFERENCES DerivationEquations (DerivationEquationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CategoricalResults ADD CONSTRAINT fk_CategoricalResults_CV_QualityCode
FOREIGN KEY (QualityCodeCV) REFERENCES CV_QualityCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CategoricalResults ADD CONSTRAINT fk_CategoricalResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CategoricalResults ADD CONSTRAINT fk_CategoricalResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CategoricalResultValues ADD CONSTRAINT fk_CategoricalResultValues_CategoricalResults
FOREIGN KEY (ResultID) REFERENCES CategoricalResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_CV_CensorCode
FOREIGN KEY (CensorCodeCV) REFERENCES CV_CensorCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_CV_QualityCode
FOREIGN KEY (QualityCodeCV) REFERENCES CV_QualityCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MeasurementResultValues ADD CONSTRAINT fk_MeasurementResultValues_MeasurementResults
FOREIGN KEY (ResultID) REFERENCES MeasurementResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_XUnits
FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_YUnits
FOREIGN KEY (IntendedYSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_CV_CensorCode
FOREIGN KEY (CensorCodeCV) REFERENCES CV_CensorCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_CV_QualityCode
FOREIGN KEY (QualityCodeCV) REFERENCES CV_QualityCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_PointCoverageResults
FOREIGN KEY (ResultID) REFERENCES PointCoverageResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_DUnits
FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_TUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_CV_CensorCode
FOREIGN KEY (CensorCodeCV) REFERENCES CV_CensorCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_CV_QualityCode
FOREIGN KEY (QualityCodeCV) REFERENCES CV_QualityCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_DUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_ProfileResults
FOREIGN KEY (ResultID) REFERENCES ProfileResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_TMUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_Units
FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_XUnits
FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_ZUnits
FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_CV_CensorCode
FOREIGN KEY (CensorCodeCV) REFERENCES CV_CensorCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_CV_QualityCode
FOREIGN KEY (QualityCodeCV) REFERENCES CV_QualityCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_SectionResults
FOREIGN KEY (ResultID) REFERENCES SectionResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_Units
FOREIGN KEY (IntendedWavelengthSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_CV_CensorCode
FOREIGN KEY (CensorCodeCV) REFERENCES CV_CensorCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_CV_QualityCode
FOREIGN KEY (QualityCodeCV) REFERENCES CV_QualityCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_SpectraResults
FOREIGN KEY (ResultID) REFERENCES SpectraResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_WUnits
FOREIGN KEY (WavelengthUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_TUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_CV_CensorCode
FOREIGN KEY (CensorCodeCV) REFERENCES CV_CensorCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_CV_QualityCode
FOREIGN KEY (QualityCodeCV) REFERENCES CV_QualityCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_TimeSeriesResults
FOREIGN KEY (ResultID) REFERENCES TimeSeriesResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TSUnits
FOREIGN KEY (IntendedTrajectorySpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_CV_CensorCode
FOREIGN KEY (CensorCodeCV) REFERENCES CV_CensorCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_CV_QualityCode
FOREIGN KEY (QualityCodeCV) REFERENCES CV_QualityCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_DistanceUnits
FOREIGN KEY (TrajectoryDistanceUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_TrajectoryResults
FOREIGN KEY (ResultID) REFERENCES TrajectoryResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_ZUnits
FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_Results
FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_TMUnits
FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_TSUnits
FOREIGN KEY (IntendedTransectSpacingUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_Units
FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValues ADD CONSTRAINT fk_TransectResultValues_AIUnits
FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValues ADD CONSTRAINT fk_TransectResultValues_CV_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValues ADD CONSTRAINT fk_TransectResultValues_CV_CensorCode
FOREIGN KEY (CensorCodeCV) REFERENCES CV_CensorCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValues ADD CONSTRAINT fk_TransectResultValues_CV_QualityCode
FOREIGN KEY (QualityCodeCV) REFERENCES CV_QualityCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValues ADD CONSTRAINT fk_TransectResultValues_DistanceUnits
FOREIGN KEY (TransectDistanceUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValues ADD CONSTRAINT fk_TransectResultValues_TransectResults
FOREIGN KEY (ResultID) REFERENCES TransectResults (ResultID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValues ADD CONSTRAINT fk_TransectResultValues_XUnits
FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TransectResultValues ADD CONSTRAINT fk_TransectResultValues_YUnits
FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedFeatures ADD CONSTRAINT fk_FeatureParents_FeaturesParent
FOREIGN KEY (RelatedFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SpatialOffsets
FOREIGN KEY (SpatialOffsetID) REFERENCES SpatialOffsets (SpatialOffsetID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedFeatures ADD CONSTRAINT fk_RelatedFeatures_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Sites ADD CONSTRAINT fk_Sites_CV_SiteType
FOREIGN KEY (SiteTypeCV) REFERENCES CV_SiteType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Sites ADD CONSTRAINT fk_Sites_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Sites ADD CONSTRAINT fk_Sites_SpatialReferences
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpatialOffsets ADD CONSTRAINT fk_SpatialOffsets_CV_SpatialOffsetType
FOREIGN KEY (SpatialOffsetTypeCV) REFERENCES CV_SpatialOffsetType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpatialOffsets ADD CONSTRAINT fk_SpatialOffsets_Offset1Units
FOREIGN KEY (Offset1UnitID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpatialOffsets ADD CONSTRAINT fk_SpatialOffsets_Offset2Units
FOREIGN KEY (Offset2UnitID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpatialOffsets ADD CONSTRAINT fk_SpatialOffsets_Offset3Units
FOREIGN KEY (Offset3UnitID) REFERENCES Units (UnitsID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Specimens ADD CONSTRAINT fk_Specimens_CV_Medium
FOREIGN KEY (SpecimenMediumCV) REFERENCES CV_Medium (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Specimens ADD CONSTRAINT fk_Specimens_CV_SpecimenType
FOREIGN KEY (SpecimenTypeCV) REFERENCES CV_SpecimenType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Specimens ADD CONSTRAINT fk_Specimens_SamplingFeatures
FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_Citations
FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_Specimens
FOREIGN KEY (SamplingFeatureID) REFERENCES Specimens (SamplingFeatureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers
FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ModelAffiliations ADD CONSTRAINT fk_ModelAffiliations_Affiliations
FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ModelAffiliations ADD CONSTRAINT fk_ModelAffiliations_Models
FOREIGN KEY (ModelID) REFERENCES Models (ModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedModels ADD CONSTRAINT fk_RelatedModels_CV_RelationshipType
FOREIGN KEY (RelationshipTypeCV) REFERENCES CV_RelationshipType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RelatedModels ADD CONSTRAINT fk_RelatedModels_Models
FOREIGN KEY (ModelID) REFERENCES Models (ModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Simulations ADD CONSTRAINT fk_Simulations_Actions
FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Simulations ADD CONSTRAINT fk_Simulations_Models
FOREIGN KEY (ModelID) REFERENCES Models (ModelID)
ON UPDATE NO ACTION ON DELETE NO ACTION;