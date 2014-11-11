
/***************************************************************************/
/************************* CREATE ODM2ANNOTATIONS **************************/
/***************************************************************************/

CREATE TABLE ActionAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	CitationID INT   NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AnnotatorID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CategoricalResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES CategoricalResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE EquipmentAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	EquipmentID INT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MeasurementResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (ValueID) REFERENCES MeasurementResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MethodAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodID INT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE PointCoverageResultValueAnnotations (
	BridgeID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES PointCoverageResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ProfileResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES ProfileResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	BeginDateTime DATETIME   NOT NULL,
	EndDateTime DATETIME   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SamplingFeatureAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SectionResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES SectionResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SpectraResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES SpectraResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TimeSeriesResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES TimeSeriesResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TrajectoryResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES TrajectoryResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TransectResultValueAnnotations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ValueID BIGINT   NOT NULL,
	AnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES TransectResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/***************************** CREATE ODM2CORE *****************************/
/***************************************************************************/

CREATE TABLE ActionBy (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	AffiliationID INT   NOT NULL,
	IsActionLead BIT   NOT NULL,
	RoleDescription VARCHAR (500)  NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Actions (
	ActionID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionTypeCV VARCHAR (255)  NOT NULL,
	MethodID INT   NOT NULL,
	BeginDateTime DATETIME   NOT NULL,
	BeginDateTimeUTCOffset INT   NOT NULL,
	EndDateTime DATETIME   NULL,
	EndDateTimeUTCOffset INT   NULL,
	ActionDescription VARCHAR (500)  NULL,
	ActionFileLink VARCHAR (255)  NULL,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Affiliations (
	AffiliationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PersonID INT   NOT NULL,
	OrganizationID INT   NULL,
	IsPrimaryOrganizationContact BIT   NULL,
	AffiliationStartDate DATE   NOT NULL,
	AffiliationEndDate DATE   NULL,
	PrimaryPhone VARCHAR (50)  NULL,
	PrimaryEmail VARCHAR (255)  NOT NULL,
	PrimaryAddress VARCHAR (255)  NULL,
	PersonLink VARCHAR (255)  NULL,
	FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE DataSets (
	DataSetID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DataSetUUID VARCHAR(36)   NOT NULL,
	DataSetTypeCV VARCHAR (255)  NOT NULL,
	DataSetCode VARCHAR (50)  NOT NULL,
	DataSetTitle VARCHAR (255)  NOT NULL,
	DataSetAbstract VARCHAR (500)  NOT NULL
);

CREATE TABLE DataSetsResults (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DataSetID INT   NOT NULL,
	ResultID BIGINT   NOT NULL,
	FOREIGN KEY (DataSetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE FeatureActions (
	FeatureActionID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	ActionID INT   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Methods (
	MethodID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodTypeCV VARCHAR (255)  NOT NULL,
	MethodCode VARCHAR (50)  NOT NULL,
	MethodName VARCHAR (255)  NOT NULL,
	MethodDescription VARCHAR (500)  NULL,
	MethodLink VARCHAR (255)  NULL,
	OrganizationID INT   NULL,
	FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Organizations (
	OrganizationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	OrganizationTypeCV VARCHAR (255)  NOT NULL,
	OrganizationCode VARCHAR (50)  NOT NULL,
	OrganizationName VARCHAR (255)  NOT NULL,
	OrganizationDescription VARCHAR (500)  NULL,
	OrganizationLink VARCHAR (255)  NULL,
	ParentOrganizationID INT   NULL,
	FOREIGN KEY (ParentOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	Definition VARCHAR (500)  NULL,
	Explanation VARCHAR (500)  NULL
);

CREATE TABLE RelatedActions (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedActionID INT   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	ValueCount INT   NOT NULL,
	FOREIGN KEY (FeatureActionID) REFERENCES FeatureActions (FeatureActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ProcessingLevelID) REFERENCES ProcessingLevels (ProcessingLevelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultTypeCV) REFERENCES ResultTypeCV (ResultTypeCV)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (UnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SamplingFeatures (
	SamplingFeatureID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureUUID VARCHAR(36)   NOT NULL,
	SamplingFeatureTypeCV VARCHAR (255)  NOT NULL,
	SamplingFeatureCode VARCHAR (50)  NOT NULL,
	SamplingFeatureName VARCHAR (255)  NULL,
	SamplingFeatureDescription VARCHAR (500)  NULL,
	SamplingFeatureGeotypeCV VARCHAR (255)  NULL,
	FeatureGeometry geometry   NULL,
	Elevation_m FLOAT   NULL,
	ElevationDatumCV VARCHAR (255)  NULL
);

CREATE TABLE TaxonomicClassifiers (
	TaxonomicClassifierID INT   NOT NULL PRIMARY KEY,
	TaxonomicClassifierTypeCV VARCHAR (255)  NOT NULL,
	TaxonomicClassifierName VARCHAR (255)  NOT NULL,
	TaxonomicClassifierCommonName VARCHAR (255)  NULL,
	TaxonomicClassifierDescription VARCHAR (500)  NULL,
	ParentTaxonomicClassifierID INT   NULL,
	FOREIGN KEY (ParentTaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Units (
	UnitsID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	UnitsTypeCV VARCHAR (255)  NOT NULL,
	UnitsAbbreviation VARCHAR (50)  NOT NULL,
	UnitsName VARCHAR (255)  NOT NULL
);

CREATE TABLE Variables (
	VariableID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	VariableTypeCV VARCHAR (255)  NOT NULL,
	VariableCode VARCHAR (50)  NOT NULL,
	VariableNameCV VARCHAR (255)  NOT NULL,
	VariableDefinition VARCHAR (500)  NULL,
	SpeciationCV VARCHAR (255)  NULL,
	NoDataValue DOUBLE   NOT NULL
);

/***************************************************************************/
/****************************** CREATE ODM2CV ******************************/
/***************************************************************************/

CREATE TABLE CVTerms (
	TermID INT   NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (500)  NULL,
	ODMVocabulary VARCHAR (255)  NOT NULL,
	SourceVocabulary VARCHAR (255)  NULL
);

/***************************************************************************/
/************************* CREATE ODM2DATAQUALITY **************************/
/***************************************************************************/

CREATE TABLE DataQuality (
	DataQualityID INT   NOT NULL PRIMARY KEY,
	DataQualityTypeCV VARCHAR (255)  NOT NULL,
	DataQualityCode VARCHAR (255)  NOT NULL,
	DataQualityValue FLOAT   NULL,
	DataQualityValueUnitsID INT   NULL,
	DataQualityDescription VARCHAR (500)  NULL,
	DataQualityLink VARCHAR (255)  NULL,
	FOREIGN KEY (DataQualityValueUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ReferenceMaterials (
	ReferenceMaterialID INT   NOT NULL PRIMARY KEY,
	ReferenceMaterialMediumCV VARCHAR (255)  NOT NULL,
	ReferenceMaterialOrganizationID INT   NOT NULL,
	ReferenceMaterialCode VARCHAR (50)  NOT NULL,
	ReferenceMaterialLotCode VARCHAR (255)  NULL,
	ReferenceMaterialPurchaseDate DATETIME   NULL,
	ReferenceMaterialExpirationDate DATETIME   NULL,
	ReferenceMaterialCertificateLink VARCHAR (255)  NULL,
	SamplingFeatureID INT   NULL,
	FOREIGN KEY (ReferenceMaterialOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ReferenceMaterialValues (
	ReferenceMaterialValueID INT   NOT NULL PRIMARY KEY,
	ReferenceMaterialID INT   NOT NULL,
	ReferenceMaterialValue FLOAT   NOT NULL,
	ReferenceMaterialAccuracy FLOAT   NULL,
	VariableID INT   NOT NULL,
	UnitsID INT   NOT NULL,
	CitationID INT   NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (UnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultNormalizationValues (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	NormalizedByReferenceMaterialValueID INT   NOT NULL,
	FOREIGN KEY (NormalizedByReferenceMaterialValueID) REFERENCES ReferenceMaterialValues (ReferenceMaterialValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultsDataQuality (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataQualityID INT   NOT NULL,
	FOREIGN KEY (DataQualityID) REFERENCES DataQuality (DataQualityID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/************************** CREATE ODM2EQUIPMENT ***************************/
/***************************************************************************/

CREATE TABLE CalibrationActions (
	ActionID INT   NOT NULL PRIMARY KEY,
	CalibrationCheckValue FLOAT   NULL,
	InstrumentOutputVariableID INT   NOT NULL,
	CalibrationEquation VARCHAR (255)  NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CalibrationReferenceEquipment (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	EquipmentID INT   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES CalibrationActions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CalibrationStandards (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	ReferenceMaterialID INT   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES CalibrationActions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE DataloggerFileColumns (
	DataloggerFileColumnID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NULL,
	DataLoggerFileID INT   NOT NULL,
	InstrumentOutputVariableID INT   NOT NULL,
	ColumnLabel VARCHAR (50)  NOT NULL,
	ColumnDescription VARCHAR (500)  NULL,
	MeasurementEquation VARCHAR (255)  NULL,
	ScanInterval FLOAT   NULL,
	ScanIntervalUnitsID INT   NULL,
	RecordingInterval FLOAT   NULL,
	RecordingIntervalUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NULL,
	FOREIGN KEY (DataLoggerFileID) REFERENCES DataLoggerFiles (DataLoggerFileID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RecordingIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ScanIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE DataLoggerFiles (
	DataLoggerFileID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ProgramID INT   NOT NULL,
	DataLoggerFileName VARCHAR (255)  NOT NULL,
	DataLoggerFileDescription VARCHAR (500)  NULL,
	DataLoggerFileLink VARCHAR (255)  NULL,
	FOREIGN KEY (ProgramID) REFERENCES DataloggerProgramFiles (ProgramID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE DataloggerProgramFiles (
	ProgramID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AffiliationID INT   NOT NULL,
	ProgramName VARCHAR (255)  NOT NULL,
	ProgramDescription VARCHAR (500)  NULL,
	ProgramVersion VARCHAR (50)  NULL,
	ProgramFileLink VARCHAR (255)  NULL,
	FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	EquipmentDescription VARCHAR (500)  NULL,
	EquipmentDocumentationLink VARCHAR (255)  NULL,
	FOREIGN KEY (EquipmentModelID) REFERENCES EquipmentModels (EquipmentModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (EquipmentVendorID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (EquipmentOwnerID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE EquipmentModels (
	EquipmentModelID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelManufacturerID INT   NOT NULL,
	ModelPartNumber VARCHAR (50)  NULL,
	ModelName VARCHAR (255)  NOT NULL,
	ModelDescription VARCHAR (500)  NULL,
	IsInstrument BIT   NOT NULL,
	ModelSpecificationsFileLink VARCHAR (255)  NULL,
	ModelLink VARCHAR (255)  NULL,
	FOREIGN KEY (ModelManufacturerID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE EquipmentUsed (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	EquipmentID INT   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE InstrumentOutputVariables (
	InstrumentOutputVariableID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelID INT   NOT NULL,
	VariableID INT   NOT NULL,
	InstrumentMethodID INT   NOT NULL,
	InstrumentResolution VARCHAR (255)  NULL,
	InstrumentAccuracy VARCHAR (255)  NULL,
	InstrumentRawOutputUnitsID INT   NOT NULL,
	FOREIGN KEY (ModelID) REFERENCES EquipmentModels (EquipmentModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (InstrumentMethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (InstrumentRawOutputUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MaintenanceActions (
	ActionID INT   NOT NULL PRIMARY KEY,
	IsFactoryService BIT   NOT NULL,
	MaintenanceCode VARCHAR (50)  NULL,
	MaintenanceReason VARCHAR (500)  NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedEquipment (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	EquipmentID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedEquipmentID INT   NOT NULL,
	RelationshipStartDateTime DATETIME   NOT NULL,
	RelationshipStartDateTimeUTCOffset INT   NOT NULL,
	RelationshipEndDateTime DATETIME   NULL,
	RelationshipEndDateTimeUTCOffset INT   NULL,
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedEquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/********************* CREATE ODM2EXTENSIONPROPERTIES **********************/
/***************************************************************************/

CREATE TABLE ActionExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CitationExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CitationID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ExtensionProperties (
	PropertyID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PropertyName VARCHAR (255)  NOT NULL,
	PropertyDescription VARCHAR (500)  NULL,
	PropertyDataTypeCV VARCHAR (255)  NOT NULL,
	PropertyUnitsID INT   NULL,
	FOREIGN KEY (PropertyUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MethodExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SamplingFeatureExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE VariableExtensionPropertyValues (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	VariableID INT   NOT NULL,
	PropertyID INT   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/********************* CREATE ODM2EXTERNALIDENTIFIERS **********************/
/***************************************************************************/

CREATE TABLE CitationExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CitationID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	CitationExternalIdentifer VARCHAR (255)  NOT NULL,
	CitationExternalIdentiferURI VARCHAR (255)  NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ExternalIdentifierSystems (
	ExternalIdentifierSystemID INT   NOT NULL PRIMARY KEY,
	ExternalIdentifierSystemName VARCHAR (255)  NOT NULL,
	IdentifierSystemOrganizationID INT   NOT NULL,
	ExternalIdentifierSystemDescription VARCHAR (500)  NULL,
	ExternalIdentifierSystemURL VARCHAR (255)  NULL,
	FOREIGN KEY (IdentifierSystemOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MethodExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	MethodExternalIdentifier VARCHAR (255)  NOT NULL,
	MethodExternalIdentifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE PersonExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PersonID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	PersonExternalIdentifier VARCHAR (255)  NOT NULL,
	PersonExternalIdenifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ReferenceMaterialExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ReferenceMaterialID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	ReferenceMaterialExternalIdentifier VARCHAR (255)  NOT NULL,
	ReferenceMaterialExternalIdentifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SamplingFeatureExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	SamplingFeatureExternalIdentifier VARCHAR (255)  NOT NULL,
	SamplingFeatureExternalIdentiferURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SpatialReferenceExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SpatialReferenceID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	SpatialReferenceExternalIdentifier VARCHAR (255)  NOT NULL,
	SpatialReferenceExternalIdentifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TaxonomicClassifierExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	TaxonomicClassifierID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	TaxonomicClassifierExternalIdentifier VARCHAR (255)  NOT NULL,
	TaxonomicClassifierExternalIdentifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE VariableExternalIdentifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	VariableID INT   NOT NULL,
	ExternalIdentifierSystemID INT   NOT NULL,
	VariableExternalIdentifer VARCHAR (255)  NOT NULL,
	VariableExternalIdentifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/************************* CREATE ODM2LABANALYSES **************************/
/***************************************************************************/

CREATE TABLE ActionDirectives (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	DirectiveID INT   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (DirectiveID) REFERENCES Directives (DirectiveID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Directives (
	DirectiveID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DirectiveTypeCV VARCHAR (255)  NOT NULL,
	DirectiveDescription VARCHAR (500)  NOT NULL
);

CREATE TABLE SpecimenBatchPostions (
	FeatureActionID INT   NOT NULL PRIMARY KEY,
	BatchPositionNumber INT   NOT NULL,
	BatchPositionLabel VARCHAR (255)  NULL,
	FOREIGN KEY (FeatureActionID) REFERENCES FeatureActions (FeatureActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/************************** CREATE ODM2PROVENANCE **************************/
/***************************************************************************/

CREATE TABLE AuthorLists (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CitationID INT   NOT NULL,
	PersonID INT   NOT NULL,
	AuthorOrder INT   NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Citations (
	CitationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Title VARCHAR (255)  NOT NULL,
	Publisher VARCHAR (255)  NOT NULL,
	PublicationYear INT   NOT NULL,
	CitationLink VARCHAR (255)  NULL
);

CREATE TABLE DataSetCitations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DataSetID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	CitationID INT   NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (DataSetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE DerivationEquations (
	DerivationEquationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DerivationEquation VARCHAR (255)  NOT NULL
);

CREATE TABLE MethodCitations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	CitationID INT   NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedAnnotations (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AnnotationID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedAnnotationID INT   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedAnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedCitations (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CitationID INT   NOT NULL,
	RelationshipTypeCV INT   NOT NULL,
	RelatedCitationID INT   NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedCitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedDatasets (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DataSetID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedDatasetID INT   NOT NULL,
	VersionCode VARCHAR (50)  NULL,
	FOREIGN KEY (DataSetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedDatasetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedResults (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedResultID BIGINT   NOT NULL,
	VersionCode VARCHAR (50)  NULL,
	RelatedResultSequenceNumber INT   NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultDerivationEquations (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	DerivationEquationID INT   NOT NULL,
	FOREIGN KEY (DerivationEquationID) REFERENCES DerivationEquations (DerivationEquationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/*************************** CREATE ODM2RESULTS ****************************/
/***************************************************************************/

CREATE TABLE CategoricalResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INT   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INT   NULL,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INT   NULL,
	SpatialReferenceID INT   NULL,
	QualityCodeCV BIGINT   NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CategoricalResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue VARCHAR (255)  NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES CategoricalResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	TimeAggregationIntervalUnitsID INT   NOT NULL,
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MeasurementResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES MeasurementResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	TimeAggregationIntervalUnitsID INT   NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedYSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE PointCoverageResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue BIGINT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INT   NOT NULL,
	XLocation FLOAT   NOT NULL,
	XLocationUnitsID INT   NOT NULL,
	YLocation FLOAT   NOT NULL,
	YLocationUnitsID INT   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES PointCoverageResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES ProfileResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultTypeCV (
	ResultTypeCV VARCHAR (255)  NOT NULL PRIMARY KEY,
	ResultTypeCategory VARCHAR (255)  NOT NULL,
	DataType VARCHAR (255)  NOT NULL,
	ResultTypeDefinition VARCHAR (500)  NOT NULL,
	FixedDimensions VARCHAR (255)  NOT NULL,
	VaryingDimensions VARCHAR (255)  NOT NULL,
	SpaceMeasurementFramework VARCHAR (255)  NOT NULL,
	TimeMeasurementFramework VARCHAR (255)  NOT NULL,
	VariableMeasurementFramework VARCHAR (255)  NOT NULL
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
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SectionResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue DOUBLE   NOT NULL,
	ValueDateTime BIGINT   NOT NULL,
	ValueDateTimeUTCOffset BIGINT   NOT NULL,
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
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES SectionResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedWavelengthSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES SpectraResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (WavelengthUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	FOREIGN KEY (ResultID) REFERENCES TimeSeriesResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TrajectoryResults (
	ResultID BIGINT   NOT NULL PRIMARY KEY,
	SpatialReferenceID INT   NULL,
	IntendedTrajectorySpacing FLOAT   NULL,
	IntendedTrajectorySpacingUnitsID INT   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INT   NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedTrajectorySpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	CensorCode VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INT   NOT NULL,
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES TrajectoryResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntendedTransectSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TransectResultValues (
	ValueID BIGINT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ResultID BIGINT   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset DATETIME   NOT NULL,
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
	FOREIGN KEY (ResultID) REFERENCES TransectResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/*********************** CREATE ODM2SAMPLINGFEATURES ***********************/
/***************************************************************************/

CREATE TABLE RelatedFeatures (
	RelationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedFeatureID INT   NOT NULL,
	SpatialOffsetID INT   NULL,
	FOREIGN KEY (RelatedFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialOffsetID) REFERENCES SpatialOffsets (SpatialOffsetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Sites (
	SamplingFeatureID INT   NOT NULL PRIMARY KEY,
	SiteTypeCV VARCHAR (255)  NOT NULL,
	Latitude FLOAT   NOT NULL,
	Longitude FLOAT   NOT NULL,
	LatLonDatumID INT   NOT NULL,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (LatLonDatumID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SpatialOffsets (
	SpatialOffsetID INT   NOT NULL PRIMARY KEY,
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
	SRSDescription VARCHAR (500)  NULL
);

CREATE TABLE Specimens (
	SamplingFeatureID INT   NOT NULL PRIMARY KEY,
	SpecimenTypeCV VARCHAR (255)  NOT NULL,
	SpecimenMediumCV VARCHAR (255)  NOT NULL,
	IsFieldSpecimen BIT   NOT NULL,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SpecimenTaxonomicClassifiers (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SamplingFeatureID INT   NOT NULL,
	TaxonomicClassifierID INT   NOT NULL,
	CitationID INT   NULL,
	FOREIGN KEY (SamplingFeatureID) REFERENCES Specimens (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/************************** CREATE ODM2SIMULATION **************************/
/***************************************************************************/

CREATE TABLE ModelAffiliations (
	BridgeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelID INT   NOT NULL,
	AffiliationID INT   NOT NULL,
	IsPrimary BIT   NOT NULL,
	RoleDescription VARCHAR (500)  NULL,
	FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ModelID) REFERENCES Models (ModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Models (
	ModelID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelCode VARCHAR (50)  NOT NULL,
	ModelName VARCHAR (255)  NOT NULL,
	ModelDescription VARCHAR (500)  NULL,
	Version VARCHAR (255)  NULL,
	ModelLink VARCHAR (255)  NULL
);

CREATE TABLE RelatedModels (
	RelatedID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelID INT   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedModelID INT   NOT NULL,
	FOREIGN KEY (ModelID) REFERENCES Models (ModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Simulations (
	SimulationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ActionID INT   NOT NULL,
	SimulationName VARCHAR (255)  NOT NULL,
	SimulationDescription VARCHAR (500)  NULL,
	SimulationStartDateTime DATETIME   NOT NULL,
	SimulationStartDateTimeUTCOffset INT   NOT NULL,
	SimulationEndDateTime DATETIME   NOT NULL,
	SimulationEndDateTimeUTCOffset INT   NOT NULL,
	TimeStepValue FLOAT   NOT NULL,
	TimeStepUnitsID INT   NOT NULL,
	InputDataSetID INT   NULL,
	ModelID INT   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ModelID) REFERENCES Models (ModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);
