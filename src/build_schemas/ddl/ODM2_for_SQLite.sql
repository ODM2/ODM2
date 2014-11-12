
/***************************************************************************/
/************************* CREATE ODM2ANNOTATIONS **************************/
/***************************************************************************/

CREATE TABLE ActionAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ActionID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Annotations (
	AnnotationID INTEGER   NOT NULL PRIMARY KEY,
	AnnotationTypeCV VARCHAR (255)  NOT NULL,
	AnnotationCode VARCHAR (50)  NULL,
	AnnotationText VARCHAR (500)  NOT NULL,
	AnnotationDateTime DATETIME   NULL,
	AnnotationUTCOffset INTEGER   NULL,
	AnnotationLink VARCHAR (255)  NULL,
	AnnotatorID INTEGER   NULL,
	CitationID INTEGER   NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AnnotatorID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CategoricalResultValueAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ValueID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES CategoricalResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE EquipmentAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	EquipmentID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MeasurementResultValueAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ValueID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (ValueID) REFERENCES MeasurementResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MethodAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	MethodID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE PointCoverageResultValueAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ValueID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES PointCoverageResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ProfileResultValueAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ValueID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES ProfileResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	BeginDateTime DATETIME   NOT NULL,
	EndDateTime DATETIME   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SamplingFeatureAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	SamplingFeatureID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SectionResultValueAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ValueID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES SectionResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SpectraResultValueAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ValueID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES SpectraResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TimeSeriesResultValueAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ValueID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES TimeSeriesResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TrajectoryResultValueAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ValueID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES TrajectoryResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TransectResultValueAnnotations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ValueID INTEGER   NOT NULL,
	AnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ValueID) REFERENCES TransectResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/***************************** CREATE ODM2CORE *****************************/
/***************************************************************************/

CREATE TABLE ActionBy (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ActionID INTEGER   NOT NULL,
	AffiliationID INTEGER   NOT NULL,
	IsActionLead BIT   NOT NULL,
	RoleDescription VARCHAR (500)  NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Actions (
	ActionID INTEGER   NOT NULL PRIMARY KEY,
	ActionTypeCV VARCHAR (255)  NOT NULL,
	MethodID INTEGER   NOT NULL,
	BeginDateTime DATETIME   NOT NULL,
	BeginDateTimeUTCOffset INTEGER   NOT NULL,
	EndDateTime DATETIME   NULL,
	EndDateTimeUTCOffset INTEGER   NULL,
	ActionDescription VARCHAR (500)  NULL,
	ActionFileLink VARCHAR (255)  NULL,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Affiliations (
	AffiliationID INTEGER   NOT NULL PRIMARY KEY,
	PersonID INTEGER   NOT NULL,
	OrganizationID INTEGER   NULL,
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
	DataSetID INTEGER   NOT NULL PRIMARY KEY,
	DataSetUUID VARCHAR(36)   NOT NULL,
	DataSetTypeCV VARCHAR (255)  NOT NULL,
	DataSetCode VARCHAR (50)  NOT NULL,
	DataSetTitle VARCHAR (255)  NOT NULL,
	DataSetAbstract VARCHAR (500)  NOT NULL
);

CREATE TABLE DataSetsResults (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	DataSetID INTEGER   NOT NULL,
	ResultID INTEGER   NOT NULL,
	FOREIGN KEY (DataSetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE FeatureActions (
	FeatureActionID INTEGER   NOT NULL PRIMARY KEY,
	SamplingFeatureID INTEGER   NOT NULL,
	ActionID INTEGER   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Methods (
	MethodID INTEGER   NOT NULL PRIMARY KEY,
	MethodTypeCV VARCHAR (255)  NOT NULL,
	MethodCode VARCHAR (50)  NOT NULL,
	MethodName VARCHAR (255)  NOT NULL,
	MethodDescription VARCHAR (500)  NULL,
	MethodLink VARCHAR (255)  NULL,
	OrganizationID INTEGER   NULL,
	FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Organizations (
	OrganizationID INTEGER   NOT NULL PRIMARY KEY,
	OrganizationTypeCV VARCHAR (255)  NOT NULL,
	OrganizationCode VARCHAR (50)  NOT NULL,
	OrganizationName VARCHAR (255)  NOT NULL,
	OrganizationDescription VARCHAR (500)  NULL,
	OrganizationLink VARCHAR (255)  NULL,
	ParentOrganizationID INTEGER   NULL,
	FOREIGN KEY (ParentOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE People (
	PersonID INTEGER   NOT NULL PRIMARY KEY,
	PersonFirstName VARCHAR (255)  NOT NULL,
	PersonMiddleName VARCHAR (255)  NULL,
	PersonLastName VARCHAR (255)  NOT NULL
);

CREATE TABLE ProcessingLevels (
	ProcessingLevelID INTEGER   NOT NULL PRIMARY KEY,
	ProcessingLevelCode VARCHAR (50)  NOT NULL,
	Definition VARCHAR (500)  NULL,
	Explanation VARCHAR (500)  NULL
);

CREATE TABLE RelatedActions (
	RelationID INTEGER   NOT NULL PRIMARY KEY,
	ActionID INTEGER   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedActionID INTEGER   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Results (
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	ResultUUID VARCHAR(36)   NOT NULL,
	FeatureActionID INTEGER   NOT NULL,
	ResultTypeCV VARCHAR (255)  NOT NULL,
	VariableID INTEGER   NOT NULL,
	UnitsID INTEGER   NOT NULL,
	TaxonomicClassifierID INTEGER   NULL,
	ProcessingLevelID INTEGER   NOT NULL,
	ResultDateTime DATETIME   NULL,
	ResultDateTimeUTCOffset INTEGER   NULL,
	ValidDateTime DATETIME   NULL,
	ValidDateTimeUTCOffset INTEGER   NULL,
	StatusCV VARCHAR (255)  NULL,
	SampledMediumCV VARCHAR (255)  NOT NULL,
	ValueCount INTEGER   NOT NULL,
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
	SamplingFeatureID INTEGER   NOT NULL PRIMARY KEY,
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
	TaxonomicClassifierID INTEGER   NOT NULL PRIMARY KEY,
	TaxonomicClassifierTypeCV VARCHAR (255)  NOT NULL,
	TaxonomicClassifierName VARCHAR (255)  NOT NULL,
	TaxonomicClassifierCommonName VARCHAR (255)  NULL,
	TaxonomicClassifierDescription VARCHAR (500)  NULL,
	ParentTaxonomicClassifierID INTEGER   NULL,
	FOREIGN KEY (ParentTaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Units (
	UnitsID INTEGER   NOT NULL PRIMARY KEY,
	UnitsTypeCV VARCHAR (255)  NOT NULL,
	UnitsAbbreviation VARCHAR (50)  NOT NULL,
	UnitsName VARCHAR (255)  NOT NULL
);

CREATE TABLE Variables (
	VariableID INTEGER   NOT NULL PRIMARY KEY,
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
	TermID INTEGER   NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (500)  NULL,
	ODMVocabulary VARCHAR (255)  NOT NULL,
	SourceVocabulary VARCHAR (255)  NULL
);

/***************************************************************************/
/************************* CREATE ODM2DATAQUALITY **************************/
/***************************************************************************/

CREATE TABLE DataQuality (
	DataQualityID INTEGER   NOT NULL PRIMARY KEY,
	DataQualityTypeCV VARCHAR (255)  NOT NULL,
	DataQualityCode VARCHAR (255)  NOT NULL,
	DataQualityValue FLOAT   NULL,
	DataQualityValueUnitsID INTEGER   NULL,
	DataQualityDescription VARCHAR (500)  NULL,
	DataQualityLink VARCHAR (255)  NULL,
	FOREIGN KEY (DataQualityValueUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ReferenceMaterials (
	ReferenceMaterialID INTEGER   NOT NULL PRIMARY KEY,
	ReferenceMaterialMediumCV VARCHAR (255)  NOT NULL,
	ReferenceMaterialOrganizationID INTEGER   NOT NULL,
	ReferenceMaterialCode VARCHAR (50)  NOT NULL,
	ReferenceMaterialLotCode VARCHAR (255)  NULL,
	ReferenceMaterialPurchaseDate DATETIME   NULL,
	ReferenceMaterialExpirationDate DATETIME   NULL,
	ReferenceMaterialCertificateLink VARCHAR (255)  NULL,
	SamplingFeatureID INTEGER   NULL,
	FOREIGN KEY (ReferenceMaterialOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ReferenceMaterialValues (
	ReferenceMaterialValueID INTEGER   NOT NULL PRIMARY KEY,
	ReferenceMaterialID INTEGER   NOT NULL,
	ReferenceMaterialValue FLOAT   NOT NULL,
	ReferenceMaterialAccuracy FLOAT   NULL,
	VariableID INTEGER   NOT NULL,
	UnitsID INTEGER   NOT NULL,
	CitationID INTEGER   NOT NULL,
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
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	NormalizedByReferenceMaterialValueID INTEGER   NOT NULL,
	FOREIGN KEY (NormalizedByReferenceMaterialValueID) REFERENCES ReferenceMaterialValues (ReferenceMaterialValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultsDataQuality (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataQualityID INTEGER   NOT NULL,
	FOREIGN KEY (DataQualityID) REFERENCES DataQuality (DataQualityID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/************************** CREATE ODM2EQUIPMENT ***************************/
/***************************************************************************/

CREATE TABLE CalibrationActions (
	ActionID INTEGER   NOT NULL PRIMARY KEY,
	CalibrationCheckValue FLOAT   NULL,
	InstrumentOutputVariableID INTEGER   NOT NULL,
	CalibrationEquation VARCHAR (255)  NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CalibrationReferenceEquipment (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ActionID INTEGER   NOT NULL,
	EquipmentID INTEGER   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES CalibrationActions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CalibrationStandards (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ActionID INTEGER   NOT NULL,
	ReferenceMaterialID INTEGER   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES CalibrationActions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE DataloggerFileColumns (
	DataloggerFileColumnID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NULL,
	DataLoggerFileID INTEGER   NOT NULL,
	InstrumentOutputVariableID INTEGER   NOT NULL,
	ColumnLabel VARCHAR (50)  NOT NULL,
	ColumnDescription VARCHAR (500)  NULL,
	MeasurementEquation VARCHAR (255)  NULL,
	ScanInterval FLOAT   NULL,
	ScanIntervalUnitsID INTEGER   NULL,
	RecordingInterval FLOAT   NULL,
	RecordingIntervalUnitsID INTEGER   NULL,
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
	DataLoggerFileID INTEGER   NOT NULL PRIMARY KEY,
	ProgramID INTEGER   NOT NULL,
	DataLoggerFileName VARCHAR (255)  NOT NULL,
	DataLoggerFileDescription VARCHAR (500)  NULL,
	DataLoggerFileLink VARCHAR (255)  NULL,
	FOREIGN KEY (ProgramID) REFERENCES DataloggerProgramFiles (ProgramID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE DataloggerProgramFiles (
	ProgramID INTEGER   NOT NULL PRIMARY KEY,
	AffiliationID INTEGER   NOT NULL,
	ProgramName VARCHAR (255)  NOT NULL,
	ProgramDescription VARCHAR (500)  NULL,
	ProgramVersion VARCHAR (50)  NULL,
	ProgramFileLink VARCHAR (255)  NULL,
	FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Equipment (
	EquipmentID INTEGER   NOT NULL PRIMARY KEY,
	EquipmentCode VARCHAR (50)  NOT NULL,
	EquipmentName VARCHAR (255)  NOT NULL,
	EquipmentTypeCV VARCHAR (255)  NOT NULL,
	EquipmentModelID INTEGER   NOT NULL,
	EquipmentSerialNumber VARCHAR (50)  NOT NULL,
	EquipmentOwnerID INTEGER   NOT NULL,
	EquipmentVendorID INTEGER   NOT NULL,
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
	EquipmentModelID INTEGER   NOT NULL PRIMARY KEY,
	ModelManufacturerID INTEGER   NOT NULL,
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
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ActionID INTEGER   NOT NULL,
	EquipmentID INTEGER   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE InstrumentOutputVariables (
	InstrumentOutputVariableID INTEGER   NOT NULL PRIMARY KEY,
	ModelID INTEGER   NOT NULL,
	VariableID INTEGER   NOT NULL,
	InstrumentMethodID INTEGER   NOT NULL,
	InstrumentResolution VARCHAR (255)  NULL,
	InstrumentAccuracy VARCHAR (255)  NULL,
	InstrumentRawOutputUnitsID INTEGER   NOT NULL,
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
	ActionID INTEGER   NOT NULL PRIMARY KEY,
	IsFactoryService BIT   NOT NULL,
	MaintenanceCode VARCHAR (50)  NULL,
	MaintenanceReason VARCHAR (500)  NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedEquipment (
	RelationID INTEGER   NOT NULL PRIMARY KEY,
	EquipmentID INTEGER   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedEquipmentID INTEGER   NOT NULL,
	RelationshipStartDateTime DATETIME   NOT NULL,
	RelationshipStartDateTimeUTCOffset INTEGER   NOT NULL,
	RelationshipEndDateTime DATETIME   NULL,
	RelationshipEndDateTimeUTCOffset INTEGER   NULL,
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedEquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/********************* CREATE ODM2EXTENSIONPROPERTIES **********************/
/***************************************************************************/

CREATE TABLE ActionExtensionPropertyValues (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ActionID INTEGER   NOT NULL,
	PropertyID INTEGER   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CitationExtensionPropertyValues (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	CitationID INTEGER   NOT NULL,
	PropertyID INTEGER   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ExtensionProperties (
	PropertyID INTEGER   NOT NULL PRIMARY KEY,
	PropertyName VARCHAR (255)  NOT NULL,
	PropertyDescription VARCHAR (500)  NULL,
	PropertyDataTypeCV VARCHAR (255)  NOT NULL,
	PropertyUnitsID INTEGER   NULL,
	FOREIGN KEY (PropertyUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MethodExtensionPropertyValues (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	MethodID INTEGER   NOT NULL,
	PropertyID INTEGER   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultExtensionPropertyValues (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	PropertyID INTEGER   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SamplingFeatureExtensionPropertyValues (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	SamplingFeatureID INTEGER   NOT NULL,
	PropertyID INTEGER   NOT NULL,
	PropertyValue VARCHAR (255)  NOT NULL,
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE VariableExtensionPropertyValues (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	VariableID INTEGER   NOT NULL,
	PropertyID INTEGER   NOT NULL,
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
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	CitationID INTEGER   NOT NULL,
	ExternalIdentifierSystemID INTEGER   NOT NULL,
	CitationExternalIdentifer VARCHAR (255)  NOT NULL,
	CitationExternalIdentiferURI VARCHAR (255)  NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ExternalIdentifierSystems (
	ExternalIdentifierSystemID INTEGER   NOT NULL PRIMARY KEY,
	ExternalIdentifierSystemName VARCHAR (255)  NOT NULL,
	IdentifierSystemOrganizationID INTEGER   NOT NULL,
	ExternalIdentifierSystemDescription VARCHAR (500)  NULL,
	ExternalIdentifierSystemURL VARCHAR (255)  NULL,
	FOREIGN KEY (IdentifierSystemOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MethodExternalIdentifiers (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	MethodID INTEGER   NOT NULL,
	ExternalIdentifierSystemID INTEGER   NOT NULL,
	MethodExternalIdentifier VARCHAR (255)  NOT NULL,
	MethodExternalIdentifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE PersonExternalIdentifiers (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	PersonID INTEGER   NOT NULL,
	ExternalIdentifierSystemID INTEGER   NOT NULL,
	PersonExternalIdentifier VARCHAR (255)  NOT NULL,
	PersonExternalIdenifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ReferenceMaterialExternalIdentifiers (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ReferenceMaterialID INTEGER   NOT NULL,
	ExternalIdentifierSystemID INTEGER   NOT NULL,
	ReferenceMaterialExternalIdentifier VARCHAR (255)  NOT NULL,
	ReferenceMaterialExternalIdentifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SamplingFeatureExternalIdentifiers (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	SamplingFeatureID INTEGER   NOT NULL,
	ExternalIdentifierSystemID INTEGER   NOT NULL,
	SamplingFeatureExternalIdentifier VARCHAR (255)  NOT NULL,
	SamplingFeatureExternalIdentiferURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SpatialReferenceExternalIdentifiers (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	SpatialReferenceID INTEGER   NOT NULL,
	ExternalIdentifierSystemID INTEGER   NOT NULL,
	SpatialReferenceExternalIdentifier VARCHAR (255)  NOT NULL,
	SpatialReferenceExternalIdentifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TaxonomicClassifierExternalIdentifiers (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	TaxonomicClassifierID INTEGER   NOT NULL,
	ExternalIdentifierSystemID INTEGER   NOT NULL,
	TaxonomicClassifierExternalIdentifier VARCHAR (255)  NOT NULL,
	TaxonomicClassifierExternalIdentifierURI VARCHAR (255)  NULL,
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE VariableExternalIdentifiers (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	VariableID INTEGER   NOT NULL,
	ExternalIdentifierSystemID INTEGER   NOT NULL,
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
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ActionID INTEGER   NOT NULL,
	DirectiveID INTEGER   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (DirectiveID) REFERENCES Directives (DirectiveID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Directives (
	DirectiveID INTEGER   NOT NULL PRIMARY KEY,
	DirectiveTypeCV VARCHAR (255)  NOT NULL,
	DirectiveDescription VARCHAR (500)  NOT NULL
);

CREATE TABLE SpecimenBatchPostions (
	FeatureActionID INTEGER   NOT NULL PRIMARY KEY,
	BatchPositionNumber INTEGER   NOT NULL,
	BatchPositionLabel VARCHAR (255)  NULL,
	FOREIGN KEY (FeatureActionID) REFERENCES FeatureActions (FeatureActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/************************** CREATE ODM2PROVENANCE **************************/
/***************************************************************************/

CREATE TABLE AuthorLists (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	CitationID INTEGER   NOT NULL,
	PersonID INTEGER   NOT NULL,
	AuthorOrder INTEGER   NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Citations (
	CitationID INTEGER   NOT NULL PRIMARY KEY,
	Title VARCHAR (255)  NOT NULL,
	Publisher VARCHAR (255)  NOT NULL,
	PublicationYear INTEGER   NOT NULL,
	CitationLink VARCHAR (255)  NULL
);

CREATE TABLE DataSetCitations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	DataSetID INTEGER   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	CitationID INTEGER   NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (DataSetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE DerivationEquations (
	DerivationEquationID INTEGER   NOT NULL PRIMARY KEY,
	DerivationEquation VARCHAR (255)  NOT NULL
);

CREATE TABLE MethodCitations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	MethodID INTEGER   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	CitationID INTEGER   NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedAnnotations (
	RelationID INTEGER   NOT NULL PRIMARY KEY,
	AnnotationID INTEGER   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedAnnotationID INTEGER   NOT NULL,
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedAnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedCitations (
	RelationID INTEGER   NOT NULL PRIMARY KEY,
	CitationID INTEGER   NOT NULL,
	RelationshipTypeCV INTEGER   NOT NULL,
	RelatedCitationID INTEGER   NOT NULL,
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedCitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedDatasets (
	RelationID INTEGER   NOT NULL PRIMARY KEY,
	DataSetID INTEGER   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedDatasetID INTEGER   NOT NULL,
	VersionCode VARCHAR (50)  NULL,
	FOREIGN KEY (DataSetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedDatasetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE RelatedResults (
	RelationID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedResultID INTEGER   NOT NULL,
	VersionCode VARCHAR (50)  NULL,
	RelatedResultSequenceNumber INTEGER   NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ResultDerivationEquations (
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	DerivationEquationID INTEGER   NOT NULL,
	FOREIGN KEY (DerivationEquationID) REFERENCES DerivationEquations (DerivationEquationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/*************************** CREATE ODM2RESULTS ****************************/
/***************************************************************************/

CREATE TABLE CategoricalResults (
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INTEGER   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INTEGER   NULL,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INTEGER   NULL,
	SpatialReferenceID INTEGER   NULL,
	QualityCodeCV INTEGER   NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CategoricalResultValues (
	ValueID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataValue VARCHAR (255)  NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INTEGER   NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES CategoricalResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MeasurementResults (
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INTEGER   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INTEGER   NULL,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INTEGER   NULL,
	SpatialReferenceID INTEGER   NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER   NOT NULL,
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
	ValueID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INTEGER   NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES MeasurementResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE PointCoverageResults (
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INTEGER   NULL,
	SpatialReferenceID INTEGER   NULL,
	IntendedXSpacing FLOAT   NULL,
	IntendedXSpacingUnitsID INTEGER   NULL,
	IntendedYSpacing FLOAT   NULL,
	IntendedYSpacingUnitsID INTEGER   NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER   NOT NULL,
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
	ValueID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataValue INTEGER   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INTEGER   NOT NULL,
	XLocation FLOAT   NOT NULL,
	XLocationUnitsID INTEGER   NOT NULL,
	YLocation FLOAT   NOT NULL,
	YLocationUnitsID INTEGER   NOT NULL,
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
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INTEGER   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INTEGER   NULL,
	SpatialReferenceID INTEGER   NULL,
	IntendedZSpacing FLOAT   NULL,
	IntendedZSpacingUnitsID INTEGER   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INTEGER   NULL,
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
	ValueID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INTEGER   NOT NULL,
	ZLocation FLOAT   NOT NULL,
	ZAggregationInterval FLOAT   NOT NULL,
	ZLocationUnitsID INTEGER   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER   NOT NULL,
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
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	YLocation FLOAT   NULL,
	YLocationUnitsID INTEGER   NULL,
	SpatialReferenceID INTEGER   NULL,
	IntendedXSpacing FLOAT   NULL,
	IntendedXSpacingUnitsID INTEGER   NULL,
	IntendedZSpacing FLOAT   NULL,
	IntendedZSpacingUnitsID INTEGER   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INTEGER   NULL,
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
	ValueID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataValue DOUBLE   NOT NULL,
	ValueDateTime INTEGER   NOT NULL,
	ValueDateTimeUTCOffset INTEGER   NOT NULL,
	XLocation DOUBLE   NOT NULL,
	XAggregationInterval FLOAT   NOT NULL,
	XLocationUnitsID INTEGER   NOT NULL,
	ZLocation INTEGER   NOT NULL,
	ZAggregationInterval FLOAT   NOT NULL,
	ZLocationUnitsID INTEGER   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER   NOT NULL,
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
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INTEGER   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INTEGER   NULL,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INTEGER   NULL,
	SpatialReferenceID INTEGER   NULL,
	IntendedWavelengthSpacing DOUBLE   NULL,
	IntendedWavelengthSpacingUnitsID INTEGER   NULL,
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
	ValueID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INTEGER   NOT NULL,
	ExcitationWavelength FLOAT   NOT NULL,
	EmissionWavelength FLOAT   NOT NULL,
	WavelengthUnitsID INTEGER   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval DOUBLE   NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER   NOT NULL,
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ResultID) REFERENCES SpectraResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (WavelengthUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TimeSeriesResults (
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	XLocation FLOAT   NULL,
	XLocationUnitsID INTEGER   NULL,
	YLocation FLOAT   NULL,
	YLocationUnitsID INTEGER   NULL,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INTEGER   NULL,
	SpatialReferenceID INTEGER   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INTEGER   NULL,
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
	ValueID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INTEGER   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER   NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES TimeSeriesResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TrajectoryResults (
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	SpatialReferenceID INTEGER   NULL,
	IntendedTrajectorySpacing FLOAT   NULL,
	IntendedTrajectorySpacingUnitsID INTEGER   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INTEGER   NULL,
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
	ValueID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset INTEGER   NOT NULL,
	XLocation FLOAT   NOT NULL,
	XLocationUnitsID INTEGER   NOT NULL,
	YLocation FLOAT   NOT NULL,
	YLocationUnitsID INTEGER   NOT NULL,
	ZLocation FLOAT   NOT NULL,
	ZLocationUnitsID INTEGER   NOT NULL,
	TrajectoryDistance FLOAT   NOT NULL,
	TrajectoryDistanceAggregationInterval FLOAT   NOT NULL,
	TrajectoryDistanceUnitsID INTEGER   NOT NULL,
	CensorCode VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER   NOT NULL,
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
	ResultID INTEGER   NOT NULL PRIMARY KEY,
	ZLocation FLOAT   NULL,
	ZLocationUnitsID INTEGER   NULL,
	SpatialReferenceID INTEGER   NULL,
	IntendedTransectSpacing FLOAT   NULL,
	IntendedTransectSpacingUnitsID INTEGER   NULL,
	IntendedTimeSpacing FLOAT   NULL,
	IntendedTimeSpacingUnitsID INTEGER   NULL,
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
	ValueID INTEGER   NOT NULL PRIMARY KEY,
	ResultID INTEGER   NOT NULL,
	DataValue FLOAT   NOT NULL,
	ValueDateTime DATETIME   NOT NULL,
	ValueDateTimeUTCOffset DATETIME   NOT NULL,
	XLocation FLOAT   NOT NULL,
	XLocationUnitsID INTEGER   NOT NULL,
	YLocation FLOAT   NOT NULL,
	YLocationUnitsID INTEGER   NOT NULL,
	TransectDistance FLOAT   NOT NULL,
	TransectDistanceAggregationInterval FLOAT   NOT NULL,
	TransectDistanceUnitsID INTEGER   NOT NULL,
	CensorCodeCV VARCHAR (255)  NOT NULL,
	QualityCodeCV VARCHAR (255)  NOT NULL,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	TimeAggregationInterval FLOAT   NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER   NOT NULL,
	FOREIGN KEY (ResultID) REFERENCES TransectResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/*********************** CREATE ODM2SAMPLINGFEATURES ***********************/
/***************************************************************************/

CREATE TABLE RelatedFeatures (
	RelationID INTEGER   NOT NULL PRIMARY KEY,
	SamplingFeatureID INTEGER   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedFeatureID INTEGER   NOT NULL,
	SpatialOffsetID INTEGER   NULL,
	FOREIGN KEY (RelatedFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialOffsetID) REFERENCES SpatialOffsets (SpatialOffsetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Sites (
	SamplingFeatureID INTEGER   NOT NULL PRIMARY KEY,
	SiteTypeCV VARCHAR (255)  NOT NULL,
	Latitude FLOAT   NOT NULL,
	Longitude FLOAT   NOT NULL,
	LatLonDatumID INTEGER   NOT NULL,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (LatLonDatumID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SpatialOffsets (
	SpatialOffsetID INTEGER   NOT NULL PRIMARY KEY,
	SpatialOffsetTypeCV VARCHAR (255)  NOT NULL,
	Offset1Value FLOAT   NOT NULL,
	Offset1UnitID INTEGER   NOT NULL,
	Offset2Value FLOAT   NULL,
	Offset2UnitID INTEGER   NULL,
	Offset3Value FLOAT   NULL,
	Offset3UnitID INTEGER   NULL
);

CREATE TABLE SpatialReferences (
	SpatialReferenceID INTEGER   NOT NULL PRIMARY KEY,
	SRSCode VARCHAR (50)  NULL,
	SRSName VARCHAR (255)  NOT NULL,
	SRSDescription VARCHAR (500)  NULL
);

CREATE TABLE Specimens (
	SamplingFeatureID INTEGER   NOT NULL PRIMARY KEY,
	SpecimenTypeCV VARCHAR (255)  NOT NULL,
	SpecimenMediumCV VARCHAR (255)  NOT NULL,
	IsFieldSpecimen BIT   NOT NULL,
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SpecimenTaxonomicClassifiers (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	SamplingFeatureID INTEGER   NOT NULL,
	TaxonomicClassifierID INTEGER   NOT NULL,
	CitationID INTEGER   NULL,
	FOREIGN KEY (SamplingFeatureID) REFERENCES Specimens (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/************************** CREATE ODM2SIMULATION **************************/
/***************************************************************************/

CREATE TABLE ModelAffiliations (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	ModelID INTEGER   NOT NULL,
	AffiliationID INTEGER   NOT NULL,
	IsPrimary BIT   NOT NULL,
	RoleDescription VARCHAR (500)  NULL,
	FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ModelID) REFERENCES Models (ModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Models (
	ModelID INTEGER   NOT NULL PRIMARY KEY,
	ModelCode VARCHAR (50)  NOT NULL,
	ModelName VARCHAR (255)  NOT NULL,
	ModelDescription VARCHAR (500)  NULL,
	Version VARCHAR (255)  NULL,
	ModelLink VARCHAR (255)  NULL
);

CREATE TABLE RelatedModels (
	RelatedID INTEGER   NOT NULL PRIMARY KEY,
	ModelID INTEGER   NOT NULL,
	RelationshipTypeCV VARCHAR (255)  NOT NULL,
	RelatedModelID INTEGER   NOT NULL,
	FOREIGN KEY (ModelID) REFERENCES Models (ModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Simulations (
	SimulationID INTEGER   NOT NULL PRIMARY KEY,
	ActionID INTEGER   NOT NULL,
	SimulationName VARCHAR (255)  NOT NULL,
	SimulationDescription VARCHAR (500)  NULL,
	SimulationStartDateTime DATETIME   NOT NULL,
	SimulationStartDateTimeUTCOffset INTEGER   NOT NULL,
	SimulationEndDateTime DATETIME   NOT NULL,
	SimulationEndDateTimeUTCOffset INTEGER   NOT NULL,
	TimeStepValue FLOAT   NOT NULL,
	TimeStepUnitsID INTEGER   NOT NULL,
	InputDataSetID INTEGER   NULL,
	ModelID INTEGER   NOT NULL,
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ModelID) REFERENCES Models (ModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);
