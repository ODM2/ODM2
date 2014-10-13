/***********************************************************************************/
/* Creates all of the ODM2 schemas within a blank schema called "ODM2"             */                       
/* Create a blank schema called "ODM2" and then run this script on that schema     */   
/***********************************************************************************/

USE ODM2;


/************ Update: Tables ***************/

/******************** Add Table: ActionAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ActionAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ActionID INTEGER 
		COMMENT 'Foreign key of the Action being annotated.' NOT NULL,
	AnnotationID INTEGER 
		COMMENT 'Foreign key of the annotation being added to the Action.' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE ActionAnnotations COMMENT = 'Notes for or groups of one or more Actions.';


/******************** Add Table: Annotations ************************/

/* Build Table Structure */
CREATE TABLE Annotations
(
	AnnotationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for Annotations.' NOT NULL,
	AnnotationTypeCV VARCHAR(255) 
		COMMENT 'CV for types of annotations.' NOT NULL,
	AnnotationCode VARCHAR(50) 
		COMMENT 'A short text code that identifies the annotation (e.g., "A\' for "Approved data").' NULL,
	AnnotationText VARCHAR(500) 
		COMMENT 'Full text of the annotation.' NOT NULL,
	AnnotationDateTime DATETIME 
		COMMENT 'Date and time at which the annotation was created.' NULL,
	AnnotationUTCOffset INTEGER 
		COMMENT 'UTCOffset for the annotation creation date/time.' NULL,
	AnnotationLink VARCHAR(255) NULL,
	AnnotatorID INTEGER 
		COMMENT 'Foregn key identifier for the person that created the annotation' NULL,
	CitationID INTEGER NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Annotations COMMENT = 'Contains text annotations added to one or more records within various ODM2 tables.  Annotations can be used to record notes about a particular SamplingFeature, Action, Result, etc. or to create groups of records such as Specimens, Sites, People, etc.';


/******************** Add Table: CategoricalResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE CategoricalResultValueAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE CategoricalResultValueAnnotations COMMENT = 'Annotations for Categorical ResultValues';


/******************** Add Table: EquipmentAnnotations ************************/

/* Build Table Structure */
CREATE TABLE EquipmentAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	EquipmentID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE EquipmentAnnotations COMMENT = 'Bridge table linking Annotations to Equipment';


/******************** Add Table: MeasurementResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE MeasurementResultValueAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	ValueID BIGINT 
		COMMENT 'Foreign key of the result value being annotated' NOT NULL,
	AnnotationID INTEGER 
		COMMENT 'Foreign key of the annotation applied to the result value' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE MeasurementResultValueAnnotations COMMENT = 'Annotations for Measurement ResultValues';


/******************** Add Table: MethodAnnotations ************************/

/* Build Table Structure */
CREATE TABLE MethodAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	MethodID INTEGER 
		COMMENT 'Foreign key of the method being annotated' NOT NULL,
	AnnotationID INTEGER 
		COMMENT 'Foreign key of the annotation added to the method' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE MethodAnnotations COMMENT = 'Notes for or groups of one or more Methods.';


/******************** Add Table: PointCoverageResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE PointCoverageResultValueAnnotations
(
	BridgeID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE PointCoverageResultValueAnnotations COMMENT = 'Annotations for Point Coverage ResultValues';


/******************** Add Table: ProfileResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ProfileResultValueAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE ProfileResultValueAnnotations COMMENT = 'Annotations for Profile ResultValues';


/******************** Add Table: ResultAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ResultAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	ResultID BIGINT 
		COMMENT 'Foreign key of the result being annotated' NOT NULL,
	AnnotationID INTEGER 
		COMMENT 'Foreign key of the annotation added to the result' NOT NULL,
	BeginDateTime DATETIME 
		COMMENT 'Beginning date/time of the annotation' NOT NULL,
	EndDateTime DATETIME 
		COMMENT 'Ending date/time of the annotation' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE ResultAnnotations COMMENT = 'Notes for or groups of one or more Results [sets].';


/******************** Add Table: SamplingFeatureAnnotations ************************/

/* Build Table Structure */
CREATE TABLE SamplingFeatureAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	SamplingFeatureID INTEGER 
		COMMENT 'Foreign key of the SamplingFeature being annotated.' NOT NULL,
	AnnotationID INTEGER 
		COMMENT 'Foreign key of the Annotation applied to the SamplingFeature.' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE SamplingFeatureAnnotations COMMENT = 'Notes for or groups of one or more Sampling Features.';


/******************** Add Table: SectionResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE SectionResultValueAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE SectionResultValueAnnotations COMMENT = 'Annotations for Section ResultValues';


/******************** Add Table: SpectraResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE SpectraResultValueAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE SpectraResultValueAnnotations COMMENT = 'Annotations for Spectra ResultValues';


/******************** Add Table: TimeSeriesResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE TimeSeriesResultValueAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE TimeSeriesResultValueAnnotations COMMENT = 'Annotations for Time Series ResultValues';


/******************** Add Table: TrajectoryResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE TrajectoryResultValueAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE TrajectoryResultValueAnnotations COMMENT = 'Annotations for Trajectory ResultValues';


/******************** Add Table: TransectResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE TransectResultValueAnnotations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE TransectResultValueAnnotations COMMENT = 'Annotations for Transect ResultValues';


/******************** Add Table: CVTerms ************************/

/* Build Table Structure */
CREATE TABLE CVTerms
(
	TermID INTEGER 
		COMMENT 'Primary key' NOT NULL,
	Term VARCHAR(255) 
		COMMENT 'Controlled vocabulary term' NOT NULL,
	Definition VARCHAR(500) 
		COMMENT 'Definition of term' NULL,
	ODMVocabulary VARCHAR(255) 
		COMMENT 'Name of the ODM controlled vocabulary to which the term belongs' NOT NULL,
	SourceVocabulary VARCHAR(255) 
		COMMENT 'Name and/or description of the source vocabulary from which the term was derived' NULL
);

/* Add Primary Key */
ALTER TABLE CVTerms ADD CONSTRAINT pkCVTerms
	PRIMARY KEY (TermID);

/* Add Comments */
ALTER TABLE CVTerms COMMENT = 'Table containing terms used in the controlled vocabularies of ODM2.';


/******************** Add Table: ActionBy ************************/

/* Build Table Structure */
CREATE TABLE ActionBy
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	ActionID INTEGER 
		COMMENT 'Foreign key identifier of an action.' NOT NULL,
	AffiliationID INTEGER 
		COMMENT 'Foreign key identifier of a person' NOT NULL,
	IsActionLead BOOLEAN 
		COMMENT 'Indicator of whether the affiliated person was the lead for the action' NOT NULL,
	RoleDescription VARCHAR(500) 
		COMMENT 'Foreign key identifier for a role played by a person in performing an action' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE ActionBy COMMENT = 'Affiliates people with actions and describes thier role in the action.';


/******************** Add Table: Actions ************************/

/* Build Table Structure */
CREATE TABLE Actions
(
	ActionID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Unique identifier' NOT NULL,
	ActionTypeCV VARCHAR(255) 
		COMMENT 'CV term describing the type of action (e.g., observation, sample collection, sample analysis)' NOT NULL,
	MethodID INTEGER 
		COMMENT 'Foreign key identifier for the method used to complete the action' NOT NULL,
	BeginDateTime DATETIME 
		COMMENT 'The date/time at which the action began' NOT NULL,
	BeginDateTimeUTCOffset INTEGER 
		COMMENT 'The UTCOffset for the BeginDateTime' NOT NULL,
	EndDateTime DATETIME 
		COMMENT 'The date/time at which the action ended' NULL,
	EndDateTimeUTCOffset INTEGER 
		COMMENT 'The UTCOffset of for the EndDateTime' NULL,
	ActionDescription VARCHAR(500) 
		COMMENT 'Text that describes the action' NULL,
	ActionFileLink VARCHAR(255) 
		COMMENT 'A URL or path to a file created by or used by the Action, such as instrument output or configuration.' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Actions COMMENT = 'Describes actions (e.g., observation, sample collection, sample analysis, field visits, field activities, etc.)';


/******************** Add Table: Affiliations ************************/

/* Build Table Structure */
CREATE TABLE Affiliations
(
	AffiliationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primay key' NOT NULL,
	PersonID INTEGER 
		COMMENT 'Foreign key identifer for a person' NOT NULL,
	OrganizationID INTEGER 
		COMMENT 'Foreigh key identifier for an organization' NULL,
	IsPrimaryOrganizationContact BOOLEAN 
		COMMENT 'Boolean indication of whether the person is the organizations primary contact person' NULL,
	AffiliationStartDate DATE 
		COMMENT 'The date on which the person became affiliated with the organization' NOT NULL,
	AffiliationEndDate DATE 
		COMMENT 'The date on which the person\'s affiliation with the organization ended' NULL,
	PrimaryPhone VARCHAR(50) 
		COMMENT 'The primary phone number of the person' NULL,
	PrimaryEmail VARCHAR(255) 
		COMMENT 'The primary email address of the person' NOT NULL,
	PrimaryAddress VARCHAR(255) 
		COMMENT 'The primary mailing address of the person, including street, city, state, zip, and country' NULL,
	PersonLink VARCHAR(255) 
		COMMENT 'A URL for the website for a person' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Affiliations COMMENT = 'Describes affiliations of people with organizations.';


/******************** Add Table: DataSets ************************/

/* Build Table Structure */
CREATE TABLE DataSets
(
	DataSetID INTEGER 
		COMMENT 'Unique identifier' NOT NULL,
	DataSetUUID INTEGER NOT NULL,
	DataSetTypeCV VARCHAR(255) 
		COMMENT 'CV term(s) describing the Topic Category' NOT NULL,
	DataSetCode VARCHAR(50) 
		COMMENT 'A short text code identifying the dataset' NOT NULL,
	DataSetTitle VARCHAR(255) 
		COMMENT 'A text title for the dataset' NOT NULL,
	DataSetAbstract VARCHAR(500) 
		COMMENT 'A text abstract describing the dataset' NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE DataSets ADD CONSTRAINT pkDataSets
	PRIMARY KEY (DataSetID);

/* Add Comments */
ALTER TABLE DataSets COMMENT = 'Describes groupings of observation results that can be considered "datasets"';


/******************** Add Table: DataSetsResults ************************/

/* Build Table Structure */
CREATE TABLE DataSetsResults
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	DataSetID INTEGER 
		COMMENT 'Foreign key identifier of the DataSet' NOT NULL,
	ResultID BIGINT 
		COMMENT 'Foreign key identifier of the Result' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE DataSetsResults COMMENT = 'Lists the Results that are grouped into a DataSet';


/******************** Add Table: FeatureActions ************************/

/* Build Table Structure */
CREATE TABLE FeatureActions
(
	FeatureActionID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	SamplingFeatureID INTEGER 
		COMMENT 'Foreign key identifier for the SamplingFeature on which or at which the Action was performed' NOT NULL,
	ActionID INTEGER 
		COMMENT 'Foreign key identifier of the Action that was performed' NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: Methods ************************/

/* Build Table Structure */
CREATE TABLE Methods
(
	MethodID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Unique identifier' NOT NULL,
	MethodTypeCV VARCHAR(255) 
		COMMENT 'CV term describing the type of method (e.g., sample collection, laboratory analytical, field, sample prepratation, etc.)' NOT NULL,
	MethodCode VARCHAR(50) 
		COMMENT 'A text code identifiying the method (e.g., EPA 650.2)' NOT NULL,
	MethodName VARCHAR(255) 
		COMMENT 'Full text name of the method' NOT NULL,
	MethodDescription VARCHAR(500) 
		COMMENT 'Full text description of the method' NULL,
	MethodLink VARCHAR(255) 
		COMMENT 'A URL to a full description of the method' NULL,
	OrganizationID INTEGER 
		COMMENT 'Foreign key identifier for the Organization with which the method is affiliated' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Methods COMMENT = 'Describes methods used to perform actions recorded in ODM (e.g., observation methods, sample analysis methods, sample preparation methods, etc.)';


/******************** Add Table: Organizations ************************/

/* Build Table Structure */
CREATE TABLE Organizations
(
	OrganizationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Unique identifier' NOT NULL,
	OrganizationTypeCV VARCHAR(255) 
		COMMENT 'CV term defining the type of organization (e.g., government agency, university, etc.)' NOT NULL,
	OrganizationCode VARCHAR(50) 
		COMMENT 'A text code identifying the Organization (e.g., USGS)' NOT NULL,
	OrganizationName VARCHAR(255) 
		COMMENT 'The full text name of the organization' NOT NULL,
	OrganizationDescription VARCHAR(500) 
		COMMENT 'A text description of the organization' NULL,
	OrganizationLink VARCHAR(255) 
		COMMENT 'A URL for the organization\'s website' NULL,
	ParentOrganizationID INTEGER 
		COMMENT 'Foreign key of the parent organization of the current organization' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Organizations COMMENT = 'Describes organizations - as in research groups, companies, universities, etc.';


/******************** Add Table: People ************************/

/* Build Table Structure */
CREATE TABLE People
(
	PersonID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary Key' NOT NULL,
	PersonFirstName VARCHAR(255) 
		COMMENT 'First name of the person' NOT NULL,
	PersonMiddleName VARCHAR(255) 
		COMMENT 'Middle name of the person' NULL,
	PersonLastName VARCHAR(255) 
		COMMENT 'Last name of the person' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE People COMMENT = 'Describes people.';


/******************** Add Table: ProcessingLevels ************************/

/* Build Table Structure */
CREATE TABLE ProcessingLevels
(
	ProcessingLevelID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	ProcessingLevelCode VARCHAR(50) 
		COMMENT 'Text code identifying the level of processing the Result has been subject to' NOT NULL,
	Definition VARCHAR(500) 
		COMMENT 'Text defintion of the processing level' NULL,
	Explanation VARCHAR(500) 
		COMMENT 'Text explanation of the processing level' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE ProcessingLevels COMMENT = 'Describes the processing level of Results';


/******************** Add Table: RelatedActions ************************/

/* Build Table Structure */
CREATE TABLE RelatedActions
(
	RelationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a relationship table (i.e. named "Related...").' NOT NULL,
	ActionID INTEGER 
		COMMENT 'Foreign key identifier of the Action' NOT NULL,
	RelationshipTypeCV VARCHAR(255) 
		COMMENT 'Text description of the relationship between two Actions' NOT NULL,
	RelatedActionID INTEGER 
		COMMENT 'Foreign key identifier for a Action related to the Action identified by ActionID' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE RelatedActions COMMENT = 'Describes Actions that are related to one another.';


/******************** Add Table: Results ************************/

/* Build Table Structure */
CREATE TABLE Results
(
	ResultID BIGINT AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Unique identifier' NOT NULL,
	ResultUUID INTEGER 
		COMMENT 'Universally unique identifier for the Result' NOT NULL,
	FeatureActionID INTEGER 
		COMMENT 'Foreign key identifier for the combinaton of SamplingFeature and Action that created the Result' NOT NULL,
	ResultTypeCV VARCHAR(255) 
		COMMENT 'CV term describing the result type (e.g., time series, measurement, etc.)' NOT NULL,
	VariableID INTEGER 
		COMMENT 'Foreign key identifier for the Variable of the result' NOT NULL,
	UnitsID INTEGER 
		COMMENT 'Foreign key identifier for the Units of the result' NOT NULL,
	TaxonomicClassifierID INTEGER 
		COMMENT 'Foreign key identifier for a TaxonomicClassifier for the variable (if one exists)' NULL,
	ProcessingLevelID INTEGER 
		COMMENT 'Foreign key identifier for the ProcessingLevel of the result' NOT NULL,
	ResultDateTime DATETIME 
		COMMENT 'Date and time at which the result became available (could be used as analysis time for samples)' NULL,
	ResultDateTimeUTCOffset BIGINT 
		COMMENT 'UTDCOffset of ResultDateTime' NULL,
	ValidDateTime DATETIME 
		COMMENT 'Date and time for which the result is valid (e.g., for a forecast result). Should probably be expressed as a duration' NULL,
	ValidDateTimeUTCOffset BIGINT 
		COMMENT 'UTCOffset of ValidDateTime' NULL,
	StatusCV VARCHAR(255) 
		COMMENT 'Status of the result (e.g., finished, ongoing, etc.)' NULL,
	SampledMediumCV VARCHAR(255) 
		COMMENT 'CV term defining the environmental medium that the result represents (e.g., air, soil, water)' NOT NULL,
	ValueCount INTEGER 
		COMMENT 'Number of data values contained within the result' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Results COMMENT = 'Describes the results of observation actions (e.g., groups of one or more numeric data values that result from an observation action)';


/******************** Add Table: SamplingFeatures ************************/

/* Build Table Structure */
CREATE TABLE SamplingFeatures
(
	SamplingFeatureID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key.' NOT NULL,
	SamplingFeatureTypeCV VARCHAR(255) 
		COMMENT 'CV term descripting the type of sampling feature.' NOT NULL,
	SamplingFeatureCode VARCHAR(50) 
		COMMENT 'A short but meaningful text identifier for the sampling feature.' NOT NULL,
	SamplingFeatureName VARCHAR(255) 
		COMMENT 'Sampling Feature name (free text).' NULL,
	SamplingFeatureDescription VARCHAR(500) 
		COMMENT 'Text describing the sampling feature.' NULL,
	SamplingFeatureGeotypeCV VARCHAR(255) 
		COMMENT 'Dimensionality of SamplingFeature; point2d, line2d, etc.' NULL,
	FeatureGeometry GEOMETRY 
		COMMENT 'The location geometry of the sampling feature on the Earth. Can be a Point, Curve (profile, trajectory, etc), Surface (flat polygons, etc) or Solid/Volume (although often limited to 2D geometries). ' NULL,
	Elevation_m FLOAT 
		COMMENT 'The elevation of the sampling feature in meters, or in the case of Specimen, the elevation from where the SamplingFeature.Specimen was collected' NULL,
	ElevationDatumCV VARCHAR(255) 
		COMMENT 'The code for the vertical geodetic datum that specifies the zero point for the Sampling Feature Elevation.' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE SamplingFeatures COMMENT = 'Describes the sampling features on which observations are made.';


/******************** Add Table: TaxonomicClassifiers ************************/

/* Build Table Structure */
CREATE TABLE TaxonomicClassifiers
(
	TaxonomicClassifierID INTEGER 
		COMMENT 'ID' NOT NULL,
	TaxonomicClassifierTypeCV VARCHAR(255) 
		COMMENT 'Controlled Vocabulary for the type of taxonomy' NOT NULL,
	TaxonomicClassifierName VARCHAR(255) 
		COMMENT 'Taxonomic classification' NOT NULL,
	TaxonomicClassifierCommonName VARCHAR(255) 
		COMMENT 'Taxonomic classification using a common name' NULL,
	TaxonomicClassifierDescription VARCHAR(500) 
		COMMENT 'Description or remarks about Taxonomic Classifier' NULL,
	ParentTaxonomicClassifierID INTEGER 
		COMMENT 'ID of the Classifier that is one higher level in the taxonomic hiearchy' NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE TaxonomicClassifiers ADD CONSTRAINT pkTaxonomicClassifiers
	PRIMARY KEY (TaxonomicClassifierID);


/******************** Add Table: Units ************************/

/* Build Table Structure */
CREATE TABLE Units
(
	UnitsID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Unique identifier' NOT NULL,
	UnitsTypeCV VARCHAR(255) 
		COMMENT 'CV term that defines the unit type' NOT NULL,
	UnitsAbbreviation VARCHAR(50) 
		COMMENT 'Text abbreviation for the unit' NOT NULL,
	UnitsName VARCHAR(255) 
		COMMENT 'Text name for the unit' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Units COMMENT = 'Describes units of measure for varibles and time';


/******************** Add Table: Variables ************************/

/* Build Table Structure */
CREATE TABLE Variables
(
	VariableID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key' NOT NULL,
	VariableTypeCV VARCHAR(255) 
		COMMENT 'Controlled vocabulary for the type of variable' NOT NULL,
	VariableCode VARCHAR(50) 
		COMMENT 'Unique text code for the variable' NOT NULL,
	VariableNameCV VARCHAR(255) 
		COMMENT 'Controlled vocabulary for the name of the variable' NOT NULL,
	VariableDefinition VARCHAR(500) 
		COMMENT 'Text definition of the variable' NULL,
	SpeciationCV VARCHAR(255) 
		COMMENT 'Speciation for the variable (e.g., expressed as P or as PO4)' NULL,
	NoDataValue DOUBLE 
		COMMENT 'A numeric value indicating no data.' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Variables COMMENT = 'Stores information about measured properties.';


/******************** Add Table: DataQuality ************************/

/* Build Table Structure */
CREATE TABLE DataQuality
(
	DataQualityID INTEGER 
		COMMENT 'Primary Key for DataQuality entity' NOT NULL,
	DataQualityTypeCV VARCHAR(255) 
		COMMENT '	i.e. Precision_2sigma, MethodDetectionLimit, ReportingLevel, 95%ConfidenceNoFalsePositives.' NOT NULL,
	DataQualityCode VARCHAR(255) 
		COMMENT 'Code for DataQualityType' NOT NULL,
	DataQualityValue FLOAT 
		COMMENT 'Numeric value of the DataQuality' NULL,
	DataQualityValueUnitsID INTEGER 
		COMMENT 'Units for the DataQualityValue' NULL,
	DataQualityDescription VARCHAR(500) 
		COMMENT 'Text description of the DataQuality metadata' NULL,
	DataQualityLink VARCHAR(255) 
		COMMENT 'URL or path to a file or other resource supporting the DataQuality metadata' NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE DataQuality ADD CONSTRAINT pkDataQuality
	PRIMARY KEY (DataQualityID);


/******************** Add Table: ReferenceMaterialValues ************************/

/* Build Table Structure */
CREATE TABLE ReferenceMaterialValues
(
	ReferenceMaterialValueID INTEGER 
		COMMENT 'The primary key for ReferenceMaterialValues' NOT NULL,
	ReferenceMaterialID INTEGER 
		COMMENT 'A foreign key to ReferenceMaterials' NOT NULL,
	ReferenceMaterialValue FLOAT 
		COMMENT 'The established property value for the ReferenceMaterial.' NOT NULL,
	ReferenceMaterialAccuracy FLOAT 
		COMMENT 'The established accuracy of the property value for the ReferenceMaterial, in the same units as the value.' NULL,
	VariableID INTEGER 
		COMMENT 'The property that is quantified by the ReferenceMaterialValue' NOT NULL,
	UnitsID INTEGER 
		COMMENT 'The units for the ReferenceMaterialValue and ReferenceMaterialAccuracy' NOT NULL,
	CitationID INTEGER 
		COMMENT 'The attribution for source that established the ReferenceMaterialValue and ReferenceMaterialAccuracy' NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE ReferenceMaterialValues ADD CONSTRAINT pkReferenceMaterialValues
	PRIMARY KEY (ReferenceMaterialValueID);

/* Add Comments */
ALTER TABLE ReferenceMaterialValues COMMENT = '"Accepted" property values for a Reference Material, which can be certified by an agency or vendor, established in the literature by the research community, or developed for "in house" use only by a laboratory.';


/******************** Add Table: ReferenceMaterials ************************/

/* Build Table Structure */
CREATE TABLE ReferenceMaterials
(
	ReferenceMaterialID INTEGER 
		COMMENT 'The primary key to the Reference Material used to calibrate an instrument, assess a measurement method, or assign values to unknown specimens' NOT NULL,
	ReferenceMaterialMediumCV VARCHAR(255) 
		COMMENT 'The medium of a Reference Material, from the same CV as SpecimenMediumCV. Examples include: water, sediment, air, tissue, etc.' NOT NULL,
	ReferenceMaterialOrganizationID INTEGER 
		COMMENT 'A foreign key to the Organization that manufactured and established property values for the ReferenceMaterial' NOT NULL,
	ReferenceMaterialCode VARCHAR(50) 
		COMMENT 'A code or short name used to identify the reference material.' NOT NULL,
	ReferenceMaterialLotCode VARCHAR(255) 
		COMMENT 'The lot, or manufactured batch, of the reference material, that is often associated with a certified set of property values' NULL,
	ReferenceMaterialPurchaseDate DATETIME 
		COMMENT 'The purchase date of a reference material, when applicable' NULL,
	ReferenceMaterialExpirationDate DATETIME 
		COMMENT 'The expiration date of a reference material, when applicable' NULL,
	ReferenceMaterialCertificateLink VARCHAR(255) 
		COMMENT 'A URL or file path to the Certificate that provides established property values for the given lot number.' NULL,
	SamplingFeatureID INTEGER 
		COMMENT 'A foreign key to SamplingFeatures. Only required when the ReferenceMaterial is Analyzed as if it were an unknown specimen.' NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE ReferenceMaterials ADD CONSTRAINT pkReferenceMaterials
	PRIMARY KEY (ReferenceMaterialID);

/* Add Comments */
ALTER TABLE ReferenceMaterials COMMENT = 'Describes materials that are used for the calibration of an instrument, the assessment of a measurement method, or for assigning values to unknown specimens.';


/******************** Add Table: ResultNormalizationValues ************************/

/* Build Table Structure */
CREATE TABLE ResultNormalizationValues
(
	ResultID BIGINT 
		COMMENT 'Unique identifier' NOT NULL,
	NormalizedByReferenceMaterialValueID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE ResultNormalizationValues ADD CONSTRAINT pkResultNormalizationValues
	PRIMARY KEY (ResultID);

/* Add Comments */
ALTER TABLE ResultNormalizationValues COMMENT = 'Extends the Results table with a foreign key to NormalizationReferenceMaterialValues when the optional DataQuality schema is implemented.  In a database implementation, we would not implement this as a separate table from Results.';


/******************** Add Table: ResultsDataQuality ************************/

/* Build Table Structure */
CREATE TABLE ResultsDataQuality
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	ResultID BIGINT 
		COMMENT 'Foreign key identifier of the Result' NOT NULL,
	DataQualityID INTEGER 
		COMMENT 'Foreign key identifier of the DataQuality entity.' NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: CalibrationActions ************************/

/* Build Table Structure */
CREATE TABLE CalibrationActions
(
	ActionID INTEGER NOT NULL,
	CalibrationCheckValue FLOAT NULL,
	InstrumentOutputVariableID INTEGER NOT NULL,
	CalibrationEquation VARCHAR(255) NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE CalibrationActions ADD CONSTRAINT pkCalibrationActions
	PRIMARY KEY (ActionID);

/* Add Comments */
ALTER TABLE CalibrationActions COMMENT = 'Information about calibration Actions';


/******************** Add Table: CalibrationReferenceEquipment ************************/

/* Build Table Structure */
CREATE TABLE CalibrationReferenceEquipment
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier ' NOT NULL,
	ActionID INTEGER 
		COMMENT 'Foreign key identifier of the Calibration Action' NOT NULL,
	EquipmentID INTEGER 
		COMMENT 'Foreign key identifier of the Equipment used in the Calibration Action' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE CalibrationReferenceEquipment COMMENT = 'Information about equipment used as referenece for a calibration';


/******************** Add Table: CalibrationStandards ************************/

/* Build Table Structure */
CREATE TABLE CalibrationStandards
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	ActionID INTEGER 
		COMMENT 'Foreign key identifier of the calibration Action' NOT NULL,
	ReferenceMaterialID INTEGER 
		COMMENT 'Foreign key identifier of the ReferenceMaterial used in the calibration' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE CalibrationStandards COMMENT = 'Bridge table linking field calibrations to the reference materials used';


/******************** Add Table: DataLoggerFiles ************************/

/* Build Table Structure */
CREATE TABLE DataLoggerFiles
(
	DataLoggerFileID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	ProgramID INTEGER 
		COMMENT 'Foreign key identifier of the datalogger program that created the file' NOT NULL,
	DataLoggerFileName VARCHAR(255) 
		COMMENT 'Text name of the datalogger file' NOT NULL,
	DataLoggerFileDescription VARCHAR(500) 
		COMMENT 'Text description of the datalogger file' NULL,
	DataLoggerFileLink VARCHAR(255) 
		COMMENT 'URL or file path to the datalogger file' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE DataLoggerFiles COMMENT = 'Destibes datalogger files created by a deployment action';


/******************** Add Table: DataloggerFileColumns ************************/

/* Build Table Structure */
CREATE TABLE DataloggerFileColumns
(
	DataloggerFileColumnID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	ResultID BIGINT 
		COMMENT 'Foreign key identifier for the Result associated with the datalogger file column' NULL,
	DataLoggerFileID INTEGER 
		COMMENT 'Foreign key identifier for the datalogger file in which the column appears' NOT NULL,
	InstrumentOutputVariableID INTEGER 
		COMMENT 'Foreign key identifier for the instrument output variable recorded in the column' NOT NULL,
	ColumnLabel VARCHAR(50) 
		COMMENT 'Text column label' NOT NULL,
	ColumnDescription VARCHAR(500) 
		COMMENT 'Text description of the contents of the column' NULL,
	MeasurementEquation VARCHAR(255) 
		COMMENT 'Text specificaiton of the equation used to calculate the column contents' NULL,
	ScanInterval FLOAT 
		COMMENT 'Scanning time interval used in the datalogger program' NULL,
	ScanIntervalUnitsID INTEGER 
		COMMENT 'Foreign key identifier for the Units of the scanning time interval' NULL,
	RecordingInterval FLOAT 
		COMMENT 'Recording time interval used in the datalogger program' NULL,
	RecordingIntervalUnitsID INTEGER 
		COMMENT 'Foreign key identifier for the Units of the recording time interval' NULL,
	AggregationStatisticCV VARCHAR(255) NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE DataloggerFileColumns COMMENT = 'Information about columns in datalogger files';


/******************** Add Table: DataloggerProgramFiles ************************/

/* Build Table Structure */
CREATE TABLE DataloggerProgramFiles
(
	ProgramID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	AffiliationID INTEGER 
		COMMENT 'Foreign key identifier of the affiliation for the person that created the program' NOT NULL,
	ProgramName VARCHAR(255) 
		COMMENT 'Text name of the datalogger program file' NOT NULL,
	ProgramDescription VARCHAR(500) 
		COMMENT 'Text description of the datalogger program file' NULL,
	ProgramVersion VARCHAR(50) 
		COMMENT 'Text description of the version of the datalogger program file' NULL,
	ProgramFileLink VARCHAR(255) 
		COMMENT 'URL or file path to the datalogger program file' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE DataloggerProgramFiles COMMENT = 'Information about datalogger program files';


/******************** Add Table: Equipment ************************/

/* Build Table Structure */
CREATE TABLE Equipment
(
	EquipmentID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	EquipmentCode VARCHAR(50) 
		COMMENT 'A text code that identifies the piece of equipment' NOT NULL,
	EquipmentName VARCHAR(255) 
		COMMENT 'A text name for the piece of equipment' NOT NULL,
	EquipmentTypeCV VARCHAR(255) 
		COMMENT 'CV term describing the equipment type (e.g., sensor, datalogger, solar panel, etc.)' NOT NULL,
	EquipmentModelID INTEGER 
		COMMENT 'Foreign key identifier for the model of the equipment' NOT NULL,
	EquipmentSerialNumber VARCHAR(50) 
		COMMENT 'Manufacturer\'s serial number for the specific piece of equipment' NOT NULL,
	EquipmentOwnerID INTEGER 
		COMMENT 'Foreign key identifer for the person that owns the piece of equipment' NOT NULL,
	EquipmentVendorID INTEGER 
		COMMENT 'Foreign key identifier for the vendor organization for the piece of equipment' NOT NULL,
	EquipmentPurchaseDate DATETIME 
		COMMENT 'Date that the piece of equipment was purchased' NOT NULL,
	EquipmentPurchaseOrderNumber VARCHAR(50) 
		COMMENT 'A text string identifying the purchase order used to purchase the piece of equipment' NULL,
	EquipmentDescription VARCHAR(500) 
		COMMENT 'Text notes about the specific piece of equipment' NULL,
	EquipmentDocumentationLink VARCHAR(255) 
		COMMENT 'A file name, path, or URL to a photo of the specific piece of equipment' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Equipment COMMENT = 'Descriptions of specific pieces of equipment.';


/******************** Add Table: EquipmentModels ************************/

/* Build Table Structure */
CREATE TABLE EquipmentModels
(
	EquipmentModelID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	ModelManufacturerID INTEGER 
		COMMENT 'Foreign key identifier of the model manufacturer' NOT NULL,
	ModelPartNumber VARCHAR(50) 
		COMMENT 'Text string for a part number for the equipment model' NULL,
	ModelName VARCHAR(255) 
		COMMENT 'Text name of the equipment model' NOT NULL,
	ModelDescription VARCHAR(500) 
		COMMENT 'Text description of the equipment model' NULL,
	IsInstrument BOOLEAN 
		COMMENT 'A boolean indication of whether the equipment is a sensor/instrument used to make observations' NOT NULL,
	ModelSpecificationsFileLink VARCHAR(255) 
		COMMENT 'File name, path, or URL to a specifications file for the equipment' NULL,
	ModelLink VARCHAR(255) 
		COMMENT 'A URL to a website or file having a description of the equipment model' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE EquipmentModels COMMENT = 'Describes models of sensors, loggers, and related equipment used in making observations.';


/******************** Add Table: EquipmentUsed ************************/

/* Build Table Structure */
CREATE TABLE EquipmentUsed
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	ActionID INTEGER 
		COMMENT 'Foreign key identifier of the Action' NOT NULL,
	EquipmentID INTEGER 
		COMMENT 'Foreign key identifier of the Equipment entity associated with the Action' NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: InstrumentOutputVariables ************************/

/* Build Table Structure */
CREATE TABLE InstrumentOutputVariables
(
	InstrumentOutputVariableID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	ModelID INTEGER 
		COMMENT 'Foreign key identifier of the Equipment Model' NOT NULL,
	VariableID INTEGER 
		COMMENT 'Foreign key identifier of the Variable output by the Equipment Model' NOT NULL,
	InstrumentMethodID INTEGER 
		COMMENT 'Foreign key identifier of the Method used to output the Variable from the Equipment Model' NOT NULL,
	InstrumentResolution VARCHAR(255) 
		COMMENT 'Text description of the resolution of the output variable' NULL,
	InstrumentAccuracy VARCHAR(255) 
		COMMENT 'Text description of the accuracy of the output variable' NULL,
	InstrumentRawOutputUnitsID INTEGER 
		COMMENT 'Foreign key identifier of the raw output Units associated with the output variable' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE InstrumentOutputVariables COMMENT = 'Information about the Variables that an instrument is capable of measuring';


/******************** Add Table: MaintenanceActions ************************/

/* Build Table Structure */
CREATE TABLE MaintenanceActions
(
	ActionID INTEGER 
		COMMENT 'Primary key and foreign key idenfier of the Equipment MaintenanceAction' NOT NULL,
	IsFactoryService BOOLEAN 
		COMMENT 'Boolean indicator of whether the Action is a factory service' NOT NULL,
	MaintenanceCode VARCHAR(50) 
		COMMENT 'Text code assigned to the service performed' NULL,
	MaintenanceReason VARCHAR(500) 
		COMMENT 'Text description of why the service Action was required' NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE MaintenanceActions ADD CONSTRAINT pkMaintenanceActions
	PRIMARY KEY (ActionID);

/* Add Comments */
ALTER TABLE MaintenanceActions COMMENT = 'Information about maintenance Actions performed on Equipment';


/******************** Add Table: RelatedEquipment ************************/

/* Build Table Structure */
CREATE TABLE RelatedEquipment
(
	RelationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	EquipmentID INTEGER 
		COMMENT 'Foreign key identifier for a piece of Equipment' NOT NULL,
	RelationshipTypeCV VARCHAR(255) 
		COMMENT 'Controlled Vocabulary term indicating the type of relationship between two pieces of equipment' NOT NULL,
	RelatedEquipmentID INTEGER 
		COMMENT 'Foreign key identifier of the related piece of equipment' NOT NULL,
	RelationshipStartDateTime DATETIME 
		COMMENT 'Beginning date/time of the relationship between the two pieces of equipment' NOT NULL,
	RelationshipStartDateTimeUTCOffset INTEGER 
		COMMENT 'UTCOffset of the beginning date/time' NOT NULL,
	RelationshipEndDateTime DATETIME 
		COMMENT 'Ending date/time of the relationship between two pieces of equipment' NULL,
	RelationshipEndDateTimeUTCOffset INTEGER 
		COMMENT 'UTCOffset of the ending date/time' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE RelatedEquipment COMMENT = 'Information about relationships among Equipment';


/******************** Add Table: ActionExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ActionExtensionPropertyValues
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	ActionID INTEGER 
		COMMENT 'Foreign key of the Action' NOT NULL,
	PropertyID INTEGER 
		COMMENT 'Foreign key of the extension property added to the Action' NOT NULL,
	PropertyValue VARCHAR(255) 
		COMMENT 'Value of the extension property added to the Action' NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: CitationExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE CitationExtensionPropertyValues
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	CitationID INTEGER 
		COMMENT 'Foreign key identifier of the Citation being extended' NOT NULL,
	PropertyID INTEGER 
		COMMENT 'Foreign key identifier for the Property being applied to the Citation' NOT NULL,
	PropertyValue VARCHAR(255) 
		COMMENT 'Value of the property being applied to the Citation' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE CitationExtensionPropertyValues COMMENT = 'Values for Citation Extension Properties';


/******************** Add Table: ExtensionProperties ************************/

/* Build Table Structure */
CREATE TABLE ExtensionProperties
(
	PropertyID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Unique identifier' NOT NULL,
	PropertyName VARCHAR(255) 
		COMMENT 'Text name of the extension property' NOT NULL,
	PropertyDescription VARCHAR(500) 
		COMMENT 'Text description of the extension property' NULL,
	PropertyDataTypeCV VARCHAR(255) 
		COMMENT 'CV term specifying the data type of the property value' NOT NULL,
	PropertyUnitsID INTEGER 
		COMMENT 'Foreign key identifier for the units of the property value' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE ExtensionProperties COMMENT = 'Describes extension properties added to objects in an ODM database';


/******************** Add Table: MethodExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE MethodExtensionPropertyValues
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	MethodID INTEGER 
		COMMENT 'Foreign key identifier for the Method' NOT NULL,
	PropertyID INTEGER 
		COMMENT 'Foreign key identifier for the extension property' NOT NULL,
	PropertyValue VARCHAR(255) 
		COMMENT 'Text or numeric value of the extension property' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE MethodExtensionPropertyValues COMMENT = 'Links extnsion properties to a Method';


/******************** Add Table: ResultExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ResultExtensionPropertyValues
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	ResultID BIGINT 
		COMMENT 'Foreign key identifier for the result to which the extension property applies' NOT NULL,
	PropertyID INTEGER 
		COMMENT 'Foreign key identifier for the extension propery' NOT NULL,
	PropertyValue VARCHAR(255) 
		COMMENT 'Text or numeric value of the extension property' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE ResultExtensionPropertyValues COMMENT = 'Links extension properties to a Result';


/******************** Add Table: SamplingFeatureExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE SamplingFeatureExtensionPropertyValues
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	SamplingFeatureID INTEGER 
		COMMENT 'Foreign key of the SamplingFeature being extended' NOT NULL,
	PropertyID INTEGER 
		COMMENT 'Foreign key of the extension property being added to the sampling feature ' NOT NULL,
	PropertyValue VARCHAR(255) 
		COMMENT 'Value of the property being added to the sampling feature' NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: VariableExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE VariableExtensionPropertyValues
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	VariableID INTEGER 
		COMMENT 'Foreign key of the variable being extended' NOT NULL,
	PropertyID INTEGER 
		COMMENT 'Foreign key of the extension property being applied to the variable' NOT NULL,
	PropertyValue VARCHAR(255) 
		COMMENT 'Text or numeric value of the extension property for the variable' NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: CitationExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE CitationExternalIdentifiers
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	CitationID INTEGER 
		COMMENT 'Forign key of the Citation linked to the external identifer' NOT NULL,
	ExternalIdentifierSystemID INTEGER 
		COMMENT 'Foreign Key to ExternalIdentifierSystems' NOT NULL,
	CitationExternalIdentifer VARCHAR(255) 
		COMMENT 'A resolvable, globally unique ID, such as a DOI; could be a Uniform Resource Name (URN).' NOT NULL,
	CitationExternalIdentiferURI VARCHAR(255) 
		COMMENT 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.' NULL
) ENGINE=InnoDB;


/******************** Add Table: ExternalIdentifierSystems ************************/

/* Build Table Structure */
CREATE TABLE ExternalIdentifierSystems
(
	ExternalIdentifierSystemID INTEGER 
		COMMENT 'Primary key identifier' NOT NULL,
	ExternalIdentifierSystemName VARCHAR(255) 
		COMMENT 'Defines the identifier system used (i.e. IGSN, SWRC Sample Number, etc.)' NOT NULL,
	IdentifierSystemOrganizationID INTEGER 
		COMMENT 'Foreign Key identifer for the organization overseeing or affiliated with the identifier system' NOT NULL,
	ExternalIdentifierSystemDescription VARCHAR(500) 
		COMMENT 'Description of identifier system.' NULL,
	ExternalIdentifierSystemURL VARCHAR(255) 
		COMMENT 'Universal Resource Locator (URL) for resolution/translation of an identifier system\'s URNs (i.e. http://dx.doi.org/ is the resolver URL for doi:10.1002/2013GL057450)' NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE ExternalIdentifierSystems ADD CONSTRAINT pkExternalIdentifierSystems
	PRIMARY KEY (ExternalIdentifierSystemID);

/* Add Comments */
ALTER TABLE ExternalIdentifierSystems COMMENT = 'A single table for connecting various primary keys with points to outside systems.';


/******************** Add Table: MethodExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE MethodExternalIdentifiers
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	MethodID INTEGER 
		COMMENT 'Foreign Key to SamplingFeatures' NOT NULL,
	ExternalIdentifierSystemID INTEGER 
		COMMENT 'Foreign Key to ExternalIdentifierSystems' NOT NULL,
	MethodExternalIdentifier VARCHAR(255) 
		COMMENT 'A resolvable, globally unique ID, such as a NEMI method number; could be a Uniform Resource Name (URN).' NOT NULL,
	MethodExternalIdentifierURI VARCHAR(255) 
		COMMENT 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.' NULL
) ENGINE=InnoDB;


/******************** Add Table: PersonExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE PersonExternalIdentifiers
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	PersonID INTEGER 
		COMMENT 'Foreign Key to People table' NOT NULL,
	ExternalIdentifierSystemID INTEGER 
		COMMENT 'Foreign Key to ExternalIdentifierSystems' NOT NULL,
	PersonExternalIdentifier VARCHAR(255) 
		COMMENT 'A resolvable, globally unique ID, such as an IGSN; could be a Uniform Resource Name (URN).' NOT NULL,
	PersonExternalIdenifierURI VARCHAR(255) 
		COMMENT 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE PersonExternalIdentifiers COMMENT = 'Cross reference "linking" table to allow many to many ';


/******************** Add Table: ReferenceMaterialExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ReferenceMaterialExternalIdentifiers
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	ReferenceMaterialID INTEGER 
		COMMENT 'Foreign Key to ReferenceMaterials' NOT NULL,
	ExternalIdentifierSystemID INTEGER 
		COMMENT 'Foreign Key to ExternalIdentifierSystems' NOT NULL,
	ReferenceMaterialExternalIdentifier VARCHAR(255) 
		COMMENT 'A resolvable, globally unique ID, such as NBS-19; could be a Uniform Resource Name (URN).' NOT NULL,
	ReferenceMaterialExternalIdentifierURI VARCHAR(255) 
		COMMENT 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.' NULL
) ENGINE=InnoDB;


/******************** Add Table: SamplingFeatureExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE SamplingFeatureExternalIdentifiers
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	SamplingFeatureID INTEGER 
		COMMENT 'Foreign Key to SamplingFeatures' NOT NULL,
	ExternalIdentifierSystemID INTEGER 
		COMMENT 'Foreign Key to ExternalIdentifierSystems' NOT NULL,
	SamplingFeatureExternalIdentifier VARCHAR(255) 
		COMMENT 'A resolvable, globally unique ID, such as an IGSN; could be a Uniform Resource Name (URN).' NOT NULL,
	SamplingFeatureExternalIdentiferURI VARCHAR(255) 
		COMMENT 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.' NULL
) ENGINE=InnoDB;


/******************** Add Table: SpatialReferenceExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE SpatialReferenceExternalIdentifiers
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	SpatialReferenceID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	SpatialReferenceExternalIdentifier VARCHAR(255) NOT NULL,
	SpatialReferenceExternalIdentifierURI VARCHAR(255) NULL
) ENGINE=InnoDB;


/******************** Add Table: TaxonomicClassifierExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE TaxonomicClassifierExternalIdentifiers
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	TaxonomicClassifierID INTEGER 
		COMMENT 'Foreign Key to TaxonomicClassifiers' NOT NULL,
	ExternalIdentifierSystemID INTEGER 
		COMMENT 'Foreign Key to ExternalIdentifierSystems' NOT NULL,
	TaxonomicClassifierExternalIdentifier VARCHAR(255) 
		COMMENT 'A resolvable, globally unique ID, such as a GBIF ID; could be a Uniform Resource Name (URN).' NOT NULL,
	TaxonomicClassifierExternalIdentifierURI VARCHAR(255) 
		COMMENT 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.' NULL
) ENGINE=InnoDB;


/******************** Add Table: VariableExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE VariableExternalIdentifiers
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	VariableID INTEGER 
		COMMENT 'Foreign Key to Variables' NOT NULL,
	ExternalIdentifierSystemID INTEGER 
		COMMENT 'Foreign Key to ExternalIdentifierSystems' NOT NULL,
	VariableExternalIdentifer VARCHAR(255) 
		COMMENT 'A resolvable, globally unique ID; could be a Uniform Resource Name (URN).' NOT NULL,
	VariableExternalIdentifierURI VARCHAR(255) 
		COMMENT 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.' NULL
) ENGINE=InnoDB;


/******************** Add Table: ActionDirectives ************************/

/* Build Table Structure */
CREATE TABLE ActionDirectives
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	ActionID INTEGER 
		COMMENT 'Foreign key identifier of the Action' NOT NULL,
	DirectiveID INTEGER 
		COMMENT 'Foreign key identifier of the Directive' NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: Directives ************************/

/* Build Table Structure */
CREATE TABLE Directives
(
	DirectiveID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Unique identifier.' NOT NULL,
	DirectiveTypeCV VARCHAR(255) 
		COMMENT 'Directive type, such as project, intended analyte/analysis for a Specimen, etc.' NOT NULL,
	DirectiveDescription VARCHAR(500) 
		COMMENT 'Text description of the directive or purpose under which the action was taken.' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Directives COMMENT = 'Describes the directive or purpose under which actions are made.  Directives can be projects, intended analyses for a specimen, etc.';


/******************** Add Table: SpecimenBatchPostions ************************/

/* Build Table Structure */
CREATE TABLE SpecimenBatchPostions
(
	FeatureActionID INTEGER 
		COMMENT 'Foriegn key identifer for the Specimen Preparation or Analysis Batch' NOT NULL,
	BatchPositionNumber INTEGER 
		COMMENT 'The position or line number of a specimen within a PreparationBatchAction or an InstrumentAnalysisAction.' NOT NULL,
	BatchPositionLabel VARCHAR(255) 
		COMMENT 'The label text for a specimen within a PreparationBatchAction or an InstrumentAnalysisAction.' NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE SpecimenBatchPostions ADD CONSTRAINT pkSpecimenBatchPostions
	PRIMARY KEY (FeatureActionID);

/* Add Comments */
ALTER TABLE SpecimenBatchPostions COMMENT = 'Extends the FeatureActions table with a foreign key when the optional LabAnalyses schema is implemented.  In a database implementation, we would not implement this as a separate table from FeatureActions, but rather just add the additional field(s).';


/******************** Add Table: AuthorLists ************************/

/* Build Table Structure */
CREATE TABLE AuthorLists
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	CitationID INTEGER 
		COMMENT 'Foreign key identifier for a Citation' NOT NULL,
	PersonID INTEGER 
		COMMENT 'Foreign key identifier for a Person that is an author of the Citation' NOT NULL,
	AuthorOrder INTEGER 
		COMMENT 'Integer order of the authors of the Citation starting with 1 for first author' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE AuthorLists COMMENT = 'Relationship between Citations and their Authors';


/******************** Add Table: Citations ************************/

/* Build Table Structure */
CREATE TABLE Citations
(
	CitationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key identifier' NOT NULL,
	Title VARCHAR(255) 
		COMMENT 'Text title of the Citation' NOT NULL,
	Publisher VARCHAR(255) 
		COMMENT 'Text publisher of the Citation' NOT NULL,
	PublicationYear INTEGER 
		COMMENT 'Integer publication year (4 digits) of the Citation' NOT NULL,
	CitationLink VARCHAR(255) 
		COMMENT 'Text link to the Citation (i.e. URL or path).' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE Citations COMMENT = 'Information about Citations';


/******************** Add Table: DataSetCitations ************************/

/* Build Table Structure */
CREATE TABLE DataSetCitations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	DataSetID INTEGER 
		COMMENT 'Foreign key identifier for a DataSet' NOT NULL,
	RelationshipTypeCV VARCHAR(255) 
		COMMENT 'CV term describing the relationship between the DataSet and the Citation (e.g., "cites" or "isCitedBy"), largely conforming to CV used by DataCite.org.' NOT NULL,
	CitationID INTEGER 
		COMMENT 'Foreign key identifier for a Citation that is associated with the DataSet identified by DataSetID' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE DataSetCitations COMMENT = 'Relationship between DataSets and Citations';


/******************** Add Table: DerivationEquations ************************/

/* Build Table Structure */
CREATE TABLE DerivationEquations
(
	DerivationEquationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for DerivationEquations, which include calibration equations, normalizations, etc. on one or more RelatedResults to produce a DerivedResult.' NOT NULL,
	DerivationEquation VARCHAR(255) 
		COMMENT 'Text of the equation used to derive a Result from one or more RelatedResults, where y is the DerivedResult and x1, x2, ..., xn are the RelatedResults specified in order by RelatedResultSequenceID.' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE DerivationEquations COMMENT = 'DerivationEquations include calibration equations, normalizations, etc. on one or more RelatedResults to produce a DerivedResult.';


/******************** Add Table: MethodCitations ************************/

/* Build Table Structure */
CREATE TABLE MethodCitations
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	MethodID INTEGER 
		COMMENT 'Foreign key identifier for a Method' NOT NULL,
	RelationshipTypeCV VARCHAR(255) 
		COMMENT 'CV term describing the relationship between the Methods and the Citation (e.g., "References" or "isDocumentedBy"), largely conforming to CV used by DataCite.org.' NOT NULL,
	CitationID INTEGER 
		COMMENT 'Foreign key identifier for a Citation that is associated with the Method identified by MethodID' NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: RelatedAnnotations ************************/

/* Build Table Structure */
CREATE TABLE RelatedAnnotations
(
	RelationID INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	AnnotationID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedAnnotationID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE RelatedAnnotations COMMENT = 'Stores information about relationships among Annotations';


/******************** Add Table: RelatedCitations ************************/

/* Build Table Structure */
CREATE TABLE RelatedCitations
(
	RelationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a relationship table (i.e. named "Related...").' NOT NULL,
	CitationID INTEGER 
		COMMENT 'Foreign key identifier for a Citation' NOT NULL,
	RelationshipTypeCV INTEGER 
		COMMENT 'CV term describing the relationship between Citations (e.g., "IsSupplementTo" or "IsPartOf"), largely conforming to CV used by DataCite.org.' NOT NULL,
	RelatedCitationID INTEGER 
		COMMENT 'Foreign key identifier for a Citation that is related to the Citation identified by CitationID' NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE RelatedCitations COMMENT = 'Information about relationships among citations';


/******************** Add Table: RelatedDatasets ************************/

/* Build Table Structure */
CREATE TABLE RelatedDatasets
(
	RelationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a relationship table (i.e. named "Related...").' NOT NULL,
	DataSetID INTEGER 
		COMMENT 'Foreign key identifier for a DataSet' NOT NULL,
	RelationshipTypeCV VARCHAR(255) 
		COMMENT 'CV term describing the relationship between DataSets (e.g., "IsNewVersionOf" or "Continues"), largely conforming to CV used by DataCite.org.' NOT NULL,
	RelatedDatasetID INTEGER 
		COMMENT 'Foreign key identifier for a DataSet related to the DataSet identified by DataSetID' NOT NULL,
	VersionCode VARCHAR(50) 
		COMMENT 'Text version number/code that can be specified if the DataSet is an explicit version of another DataSet and where the RelationshipTypeCV = "isNewVersionOf".' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE RelatedDatasets COMMENT = 'Information about relationships among DataSets';


/******************** Add Table: RelatedResults ************************/

/* Build Table Structure */
CREATE TABLE RelatedResults
(
	RelationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a relationship table (i.e. named "Related...").' NOT NULL,
	ResultID BIGINT 
		COMMENT 'Foreign key identifier for a Result' NOT NULL,
	RelationshipTypeCV VARCHAR(255) 
		COMMENT 'Text description of the relationship between the Results from a controlled vocabulary (e.g., "isDerivedFrom")' NOT NULL,
	RelatedResultID BIGINT 
		COMMENT 'Foreign key identifier for a Result that is related to the Result identified by ResultID' NOT NULL,
	VersionCode VARCHAR(50) 
		COMMENT 'Text version number/code that can be specified if the Result is an explicit version of another Result and where the RelationshipTypeCV = "isNewVersionOf".' NULL,
	RelatedResultSequenceNumber INTEGER 
		COMMENT 'Integer sequence number indicating the order in which a RelatedResults appears in a DerivationEquation (i.e. 1 for x1, 2 for x2...) and where a Result "isDerivedFrom" one or more RelatedResults.' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE RelatedResults COMMENT = 'Information about relationships among Results';


/******************** Add Table: ResultDerivationEquations ************************/

/* Build Table Structure */
CREATE TABLE ResultDerivationEquations
(
	ResultID BIGINT 
		COMMENT 'Foreign key identifier for a Result that was derived using the Equation specified by DerivationEquationID' NOT NULL,
	DerivationEquationID INTEGER 
		COMMENT 'Foreign key identifier for the DerivationEquation used to derive the Result identified by ResultID' NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE ResultDerivationEquations ADD CONSTRAINT pkResultDerivationEquations
	PRIMARY KEY (ResultID);

/* Add Comments */
ALTER TABLE ResultDerivationEquations COMMENT = 'Relationship between Results and Equations used to derive them';


/******************** Add Table: CategoricalResultValues ************************/

/* Build Table Structure */
CREATE TABLE CategoricalResultValues
(
	ValueID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue VARCHAR(255) NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: CategoricalResults ************************/

/* Build Table Structure */
CREATE TABLE CategoricalResults
(
	ResultID BIGINT NOT NULL,
	XLocation FLOAT NULL,
	XLocationUnitsID INTEGER NULL,
	YLocation FLOAT NULL,
	YLocationUnitsID INTEGER NULL,
	ZLocation FLOAT NULL,
	ZLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	QualityCodeCV BIGINT NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE CategoricalResults ADD CONSTRAINT pkCategoricalResults
	PRIMARY KEY (ResultID);


/******************** Add Table: MeasurementResultValues ************************/

/* Build Table Structure */
CREATE TABLE MeasurementResultValues
(
	ValueID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: MeasurementResults ************************/

/* Build Table Structure */
CREATE TABLE MeasurementResults
(
	ResultID BIGINT NOT NULL,
	XLocation FLOAT NULL,
	XLocationUnitsID INTEGER NULL,
	YLocation FLOAT NULL,
	YLocationUnitsID INTEGER NULL,
	ZLocation FLOAT NULL,
	ZLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE MeasurementResults ADD CONSTRAINT pkMeasurementResults
	PRIMARY KEY (ResultID);


/******************** Add Table: PointCoverageResultValues ************************/

/* Build Table Structure */
CREATE TABLE PointCoverageResultValues
(
	ValueID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue BIGINT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	XLocation FLOAT NOT NULL,
	XLocationUnitsID INTEGER NOT NULL,
	YLocation FLOAT NOT NULL,
	YLocationUnitsID INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: PointCoverageResults ************************/

/* Build Table Structure */
CREATE TABLE PointCoverageResults
(
	ResultID BIGINT NOT NULL,
	ZLocation FLOAT NULL,
	ZLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedXSpacing FLOAT NULL,
	IntendedXSpacingUnitsID INTEGER NULL,
	IntendedYSpacing FLOAT NULL,
	IntendedYSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE PointCoverageResults ADD CONSTRAINT pkPointCoverageResults
	PRIMARY KEY (ResultID);


/******************** Add Table: ProfileResultValues ************************/

/* Build Table Structure */
CREATE TABLE ProfileResultValues
(
	ValueID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	ZLocation FLOAT NOT NULL,
	ZAggregationInterval FLOAT NOT NULL,
	ZLocationUnitsID INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE ProfileResultValues COMMENT = 'Numeric values of Depth Profile Results.';


/******************** Add Table: ProfileResults ************************/

/* Build Table Structure */
CREATE TABLE ProfileResults
(
	ResultID BIGINT NOT NULL,
	XLocation FLOAT NULL,
	XLocationUnitsID INTEGER NULL,
	YLocation FLOAT NULL,
	YLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedZSpacing FLOAT NULL,
	IntendedZSpacingUnitsID INTEGER NULL,
	IntendedTimeSpacing FLOAT NULL,
	IntendedTimeSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE ProfileResults ADD CONSTRAINT pkProfileResults
	PRIMARY KEY (ResultID);

/* Add Comments */
ALTER TABLE ProfileResults COMMENT = 'Information about Profile Results';


/******************** Add Table: ResultTypeCV ************************/

/* Build Table Structure */
CREATE TABLE ResultTypeCV
(
	ResultTypeCV VARCHAR(255) NOT NULL,
	ResultTypeCategory VARCHAR(255) NOT NULL,
	DataType VARCHAR(255) NOT NULL,
	ResultTypeDefinition VARCHAR(500) NOT NULL,
	FixedDimensions VARCHAR(255) NOT NULL,
	VaryingDimensions VARCHAR(255) NOT NULL,
	SpaceMeasurementFramework VARCHAR(255) NOT NULL,
	TimeMeasurementFramework VARCHAR(255) NOT NULL,
	VariableMeasurementFramework VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE ResultTypeCV ADD CONSTRAINT pkResultTypeCV
	PRIMARY KEY (ResultTypeCV);


/******************** Add Table: SectionResultValues ************************/

/* Build Table Structure */
CREATE TABLE SectionResultValues
(
	ValueID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue DOUBLE NOT NULL,
	ValueDateTime BIGINT NOT NULL,
	ValueDateTimeUTCOffset BIGINT NOT NULL,
	XLocation DOUBLE NOT NULL,
	XAggregationInterval FLOAT NOT NULL,
	XLocationUnitsID INTEGER NOT NULL,
	ZLocation BIGINT NOT NULL,
	ZAggregationInterval FLOAT NOT NULL,
	ZLocationUnitsID INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: SectionResults ************************/

/* Build Table Structure */
CREATE TABLE SectionResults
(
	ResultID BIGINT NOT NULL,
	YLocation FLOAT NULL,
	YLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedXSpacing FLOAT NULL,
	IntendedXSpacingUnitsID INTEGER NULL,
	IntendedZSpacing FLOAT NULL,
	IntendedZSpacingUnitsID INTEGER NULL,
	IntendedTimeSpacing FLOAT NULL,
	IntendedTimeSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE SectionResults ADD CONSTRAINT pkSectionResults
	PRIMARY KEY (ResultID);


/******************** Add Table: SpectraResultValues ************************/

/* Build Table Structure */
CREATE TABLE SpectraResultValues
(
	ValueID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	ExcitationWavelength FLOAT NOT NULL,
	EmissionWavelength FLOAT NOT NULL,
	WavelengthUnitsID INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval DOUBLE NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: SpectraResults ************************/

/* Build Table Structure */
CREATE TABLE SpectraResults
(
	ResultID BIGINT NOT NULL,
	XLocation FLOAT NULL,
	XLocationUnitsID INTEGER NULL,
	YLocation FLOAT NULL,
	YLocationUnitsID INTEGER NULL,
	ZLocation FLOAT NULL,
	ZLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedWavelengthSpacing DOUBLE NULL,
	IntendedWavelengthSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE SpectraResults ADD CONSTRAINT pkSpectraResults
	PRIMARY KEY (ResultID);


/******************** Add Table: TimeSeriesResultValues ************************/

/* Build Table Structure */
CREATE TABLE TimeSeriesResultValues
(
	ValueID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: TimeSeriesResults ************************/

/* Build Table Structure */
CREATE TABLE TimeSeriesResults
(
	ResultID BIGINT NOT NULL,
	XLocation FLOAT NULL,
	XLocationUnitsID INTEGER NULL,
	YLocation FLOAT NULL,
	YLocationUnitsID INTEGER NULL,
	ZLocation FLOAT NULL,
	ZLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedTimeSpacing FLOAT NULL,
	IntendedTimeSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE TimeSeriesResults ADD CONSTRAINT pkTimeSeriesResults
	PRIMARY KEY (ResultID);


/******************** Add Table: TrajectoryResultValues ************************/

/* Build Table Structure */
CREATE TABLE TrajectoryResultValues
(
	ValueID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	XLocation FLOAT NOT NULL,
	XLocationUnitsID INTEGER NOT NULL,
	YLocation FLOAT NOT NULL,
	YLocationUnitsID INTEGER NOT NULL,
	ZLocation FLOAT NOT NULL,
	ZLocationUnitsID INTEGER NOT NULL,
	TrajectoryDistance FLOAT NOT NULL,
	TrajectoryDistanceAggregationInterval FLOAT NOT NULL,
	TrajectoryDistanceUnitsID INTEGER NOT NULL,
	CensorCode VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: TrajectoryResults ************************/

/* Build Table Structure */
CREATE TABLE TrajectoryResults
(
	ResultID BIGINT NOT NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedTrajectorySpacing FLOAT NULL,
	IntendedTrajectorySpacingUnitsID INTEGER NULL,
	IntendedTimeSpacing FLOAT NULL,
	IntendedTimeSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE TrajectoryResults ADD CONSTRAINT pkTrajectoryResults
	PRIMARY KEY (ResultID);


/******************** Add Table: TransectResultValues ************************/

/* Build Table Structure */
CREATE TABLE TransectResultValues
(
	ValueID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset DATETIME NOT NULL,
	XLocation FLOAT NOT NULL,
	XLocationUnitsID INTEGER NOT NULL,
	YLocation FLOAT NOT NULL,
	YLocationUnitsID INTEGER NOT NULL,
	TransectDistance FLOAT NOT NULL,
	TransectDistanceAggregationInterval FLOAT NOT NULL,
	TransectDistanceUnitsID INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
) ENGINE=InnoDB;


/******************** Add Table: TransectResults ************************/

/* Build Table Structure */
CREATE TABLE TransectResults
(
	ResultID BIGINT NOT NULL,
	ZLocation FLOAT NULL,
	ZLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedTransectSpacing FLOAT NULL,
	IntendedTransectSpacingUnitsID INTEGER NULL,
	IntendedTimeSpacing FLOAT NULL,
	IntendedTimeSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE TransectResults ADD CONSTRAINT pkTransectResults
	PRIMARY KEY (ResultID);


/******************** Add Table: RelatedFeatures ************************/

/* Build Table Structure */
CREATE TABLE RelatedFeatures
(
	RelationID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a relationship table (i.e. named "Related...").' NOT NULL,
	SamplingFeatureID INTEGER 
		COMMENT 'Foregn key identifier of a Sampling Feature' NOT NULL,
	RelationshipTypeCV VARCHAR(255) 
		COMMENT 'CV term describing the relationship between SamplingFeatures (e.g., "IsChildOf", "IsFractionOf" or "IsCompositeOf").' NOT NULL,
	RelatedFeatureID INTEGER 
		COMMENT 'Foreign key identifier of a Sampling Feature that is the parent of the current Sampling Feature' NOT NULL,
	SpatialOffsetID INTEGER 
		COMMENT 'Foreign key identifier of a spatial offset from the feature parent' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE RelatedFeatures COMMENT = 'Describes parrent/child relationships among Sampling Features';


/******************** Add Table: Sites ************************/

/* Build Table Structure */
CREATE TABLE Sites
(
	SamplingFeatureID INTEGER 
		COMMENT 'Foreign key identifier of the Sampling Feature that is the Site' NOT NULL,
	SiteTypeCV VARCHAR(255) 
		COMMENT 'A CV term describing the site type' NOT NULL,
	Latitude FLOAT 
		COMMENT 'Latitude of the site' NOT NULL,
	Longitude FLOAT 
		COMMENT 'Longitude of the site' NOT NULL,
	LatLonDatumID INTEGER 
		COMMENT 'Foreign key identifier for the Spatial Reference System that describes the latitude and longitude coordinates' NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE Sites ADD CONSTRAINT pkSites
	PRIMARY KEY (SamplingFeatureID);

/* Add Comments */
ALTER TABLE Sites COMMENT = 'Describes sampling features that are point sites';


/******************** Add Table: SpatialOffsets ************************/

/* Build Table Structure */
CREATE TABLE SpatialOffsets
(
	SpatialOffsetID INTEGER 
		COMMENT 'Primary Key of SpatialOffset' NOT NULL,
	SpatialOffsetTypeCV VARCHAR(255) 
		COMMENT 'Type of SpatialOffset, such as Depth, DepthInterval, HorizaontalRadial' NOT NULL,
	Offset1Value FLOAT 
		COMMENT 'Numerical value for 1st SpatialOffset, which is defined by SpatialOffsetType' NOT NULL,
	Offset1UnitID INTEGER 
		COMMENT 'Units for 1st SpatialOffset, which is defined by SpatialOffsetType' NOT NULL,
	Offset2Value FLOAT 
		COMMENT 'Numerical value for 2nd SpatialOffset, which is defined by SpatialOffsetType' NULL,
	Offset2UnitID INTEGER 
		COMMENT 'Units for 2nd SpatialOffset, which is defined by SpatialOffsetType' NULL,
	Offset3Value FLOAT 
		COMMENT 'Numerical value for 3rd SpatialOffset, which is defined by SpatialOffsetType' NULL,
	Offset3UnitID INTEGER 
		COMMENT 'Units for 3rd SpatialOffset, which is defined by SpatialOffsetType' NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE SpatialOffsets ADD CONSTRAINT pkSpatialOffsets
	PRIMARY KEY (SpatialOffsetID);

/* Add Comments */
ALTER TABLE SpatialOffsets COMMENT = 'An explicit spatial relationship between a sampling feature relative to it\'s parent.';


/******************** Add Table: SpatialReferences ************************/

/* Build Table Structure */
CREATE TABLE SpatialReferences
(
	SpatialReferenceID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Unique identifier' NOT NULL,
	SRSCode VARCHAR(50) 
		COMMENT 'SRS code for the spatial reference system' NULL,
	SRSName VARCHAR(255) 
		COMMENT 'Text name of the spatial reference system' NOT NULL,
	SRSDescription VARCHAR(500) 
		COMMENT 'Text notes describing the spatial reference system' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE SpatialReferences COMMENT = 'Describes spatial reference systems used to reference the coordinates for sites';


/******************** Add Table: SpecimenTaxonomicClassifiers ************************/

/* Build Table Structure */
CREATE TABLE SpecimenTaxonomicClassifiers
(
	BridgeID INTEGER AUTO_INCREMENT PRIMARY KEY 
		COMMENT 'Primary key for a bridge table, enabling many-to-many joins.' NOT NULL,
	SamplingFeatureID INTEGER 
		COMMENT 'Foreign key to SamplingFeatures.Specimens.' NOT NULL,
	TaxonomicClassifierID INTEGER 
		COMMENT 'Foreign key to TaxonomicClassifiers.' NOT NULL,
	CitationID INTEGER 
		COMMENT 'Foreign key to the attribution, or Citation, for the classification.' NULL
) ENGINE=InnoDB;

/* Add Comments */
ALTER TABLE SpecimenTaxonomicClassifiers COMMENT = 'This cross-reference table allows Taxonomic Classification of Specimens as an annotation, rather than as a Result.';


/******************** Add Table: Specimens ************************/

/* Build Table Structure */
CREATE TABLE Specimens
(
	SamplingFeatureID INTEGER 
		COMMENT 'Foreign key identifier for the Sampling Feature that is the specimen' NOT NULL,
	SpecimenTypeCV VARCHAR(255) 
		COMMENT 'A CV term defining the type of specimen (e.g., aquatic sample, core, etc.)' NOT NULL,
	SpecimenMediumCV VARCHAR(255) 
		COMMENT 'A CV term defining the medium of the specimen (i.e. water, sediment, etc.)' NOT NULL,
	IsFieldSpecimen BOOLEAN 
		COMMENT 'A boolean indicating whether the specimen was collected in the field' NOT NULL
) ENGINE=InnoDB;

/* Add Primary Key */
ALTER TABLE Specimens ADD CONSTRAINT pkSpecimens
	PRIMARY KEY (SamplingFeatureID);

/* Add Comments */
ALTER TABLE Specimens COMMENT = 'Equivalent to O&M Sampling Feature Type "Specimen".  Describes physical samples or specimens.';





/************ Add Foreign Keys ***************/
/*-----------------------------------------------------------
Warning: Versions of MySQL prior to 4.1.2 require indexes on all columns involved in a foreign key. The following indexes may be required: 
fk_ActionAnnotations_Actions may require an index on table: ActionAnnotations, column: ActionID
fk_ActionAnnotations_Annotations may require an index on table: ActionAnnotations, column: AnnotationID
fk_Annotations_Citations may require an index on table: Annotations, column: CitationID
fk_Annotations_People may require an index on table: Annotations, column: AnnotatorID
fk_CategoricalResultValueAnnotations_Annotations may require an index on table: CategoricalResultValueAnnotations, column: AnnotationID
fk_CategoricalResultValueAnnotations_CategoricalResultValues may require an index on table: CategoricalResultValueAnnotations, column: ValueID
fk_EquipmentAnnotations_Annotations may require an index on table: EquipmentAnnotations, column: AnnotationID
fk_EquipmentAnnotations_Equipment may require an index on table: EquipmentAnnotations, column: EquipmentID
fk_MeasurementResultValueAnnotations_MeasurementResultValues may require an index on table: MeasurementResultValueAnnotations, column: ValueID
fk_ResultValueAnnotations_Annotations may require an index on table: MeasurementResultValueAnnotations, column: AnnotationID
fk_MethodAnnotations_Annotations may require an index on table: MethodAnnotations, column: AnnotationID
fk_MethodAnnotations_Methods may require an index on table: MethodAnnotations, column: MethodID
fk_PointCoverageResultValueAnnotations_Annotations may require an index on table: PointCoverageResultValueAnnotations, column: AnnotationID
fk_PointCoverageResultValueAnnotations_PointCoverageResultValues may require an index on table: PointCoverageResultValueAnnotations, column: ValueID
fk_ProfileResultValueAnnotations_Annotations may require an index on table: ProfileResultValueAnnotations, column: AnnotationID
fk_ProfileResultValueAnnotations_ProfileResultValues may require an index on table: ProfileResultValueAnnotations, column: ValueID
fk_ResultAnnotations_Annotations may require an index on table: ResultAnnotations, column: AnnotationID
fk_ResultAnnotations_Results may require an index on table: ResultAnnotations, column: ResultID
fk_SamplingFeatureAnnotations_Annotations may require an index on table: SamplingFeatureAnnotations, column: AnnotationID
fk_SamplingFeatureAnnotations_SamplingFeatures may require an index on table: SamplingFeatureAnnotations, column: SamplingFeatureID
fk_SectionResultValueAnnotations_Annotations may require an index on table: SectionResultValueAnnotations, column: AnnotationID
fk_SectionResultValueAnnotations_SectionResultValues may require an index on table: SectionResultValueAnnotations, column: ValueID
fk_SpectraResultValueAnnotations_Annotations may require an index on table: SpectraResultValueAnnotations, column: AnnotationID
fk_SpectraResultValueAnnotations_SpectraResultValues may require an index on table: SpectraResultValueAnnotations, column: ValueID
fk_TimeSeriesResultValueAnnotations_Annotations may require an index on table: TimeSeriesResultValueAnnotations, column: AnnotationID
fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues may require an index on table: TimeSeriesResultValueAnnotations, column: ValueID
fk_TrajectoryResultValueAnnotations_Annotations may require an index on table: TrajectoryResultValueAnnotations, column: AnnotationID
fk_TrajectoryResultValueAnnotations_TrajectoryResultValues may require an index on table: TrajectoryResultValueAnnotations, column: ValueID
fk_TransectResultValueAnnotations_Annotations may require an index on table: TransectResultValueAnnotations, column: AnnotationID
fk_TransectResultValueAnnotations_TransectResultValues may require an index on table: TransectResultValueAnnotations, column: ValueID
fk_ActionPeople_Actions may require an index on table: ActionBy, column: ActionID
fk_ActionPeople_Affiliations may require an index on table: ActionBy, column: AffiliationID
fk_Actions_Methods may require an index on table: Actions, column: MethodID
fk_Affiliations_Organizations may require an index on table: Affiliations, column: OrganizationID
fk_Affiliations_People may require an index on table: Affiliations, column: PersonID
fk_DataSetsResults_DataSets may require an index on table: DataSetsResults, column: DataSetID
fk_DataSetsResults_Results may require an index on table: DataSetsResults, column: ResultID
fk_FeatureActions_Actions may require an index on table: FeatureActions, column: ActionID
fk_FeatureActions_SamplingFeatures may require an index on table: FeatureActions, column: SamplingFeatureID
fk_Methods_Organizations may require an index on table: Methods, column: OrganizationID
fk_Organizations_Organizations may require an index on table: Organizations, column: ParentOrganizationID
fk_RelatedActions_Actions may require an index on table: RelatedActions, column: ActionID
fk_RelatedActions_Actions_AreRelated may require an index on table: RelatedActions, column: RelatedActionID
fk_Results_FeatureActions may require an index on table: Results, column: FeatureActionID
fk_Results_ProcessingLevels may require an index on table: Results, column: ProcessingLevelID
fk_Results_ResultTypeCV may require an index on table: Results, column: ResultTypeCV
fk_Results_TaxonomicClassifiers may require an index on table: Results, column: TaxonomicClassifierID
fk_Results_Units may require an index on table: Results, column: UnitsID
fk_Results_Variables may require an index on table: Results, column: VariableID
fk_ParentTaxon_Taxon may require an index on table: TaxonomicClassifiers, column: ParentTaxonomicClassifierID
fk_DataQuality_Units may require an index on table: DataQuality, column: DataQualityValueUnitsID
fk_ReferenceMaterialValues_Citations may require an index on table: ReferenceMaterialValues, column: CitationID
fk_ReferenceMaterialValues_ReferenceMaterials may require an index on table: ReferenceMaterialValues, column: ReferenceMaterialID
fk_ReferenceMaterialValues_Units may require an index on table: ReferenceMaterialValues, column: UnitsID
fk_ReferenceMaterialValues_Variables may require an index on table: ReferenceMaterialValues, column: VariableID
fk_ReferenceMaterials_Organizations may require an index on table: ReferenceMaterials, column: ReferenceMaterialOrganizationID
fk_ReferenceMaterials_SamplingFeatures may require an index on table: ReferenceMaterials, column: SamplingFeatureID
fk_ResultNormalizationValues_ReferenceMaterialValues may require an index on table: ResultNormalizationValues, column: NormalizedByReferenceMaterialValueID
fk_ResultsDataQuality_DataQuality may require an index on table: ResultsDataQuality, column: DataQualityID
fk_ResultsDataQuality_Results may require an index on table: ResultsDataQuality, column: ResultID
fk_CalibrationActions_InstrumentOutputVariables may require an index on table: CalibrationActions, column: InstrumentOutputVariableID
fk_CalibrationReferenceEquipment_CalibrationActions may require an index on table: CalibrationReferenceEquipment, column: ActionID
fk_CalibrationReferenceEquipment_Equipment may require an index on table: CalibrationReferenceEquipment, column: EquipmentID
fk_CalibrationStandards_CalibrationActions may require an index on table: CalibrationStandards, column: ActionID
fk_FieldCalibrationStandards_ReferenceMaterials may require an index on table: CalibrationStandards, column: ReferenceMaterialID
fk_DataLoggerFiles_DataloggerProgramFiles may require an index on table: DataLoggerFiles, column: ProgramID
fk_DataloggerFileColumns_DataLoggerFiles may require an index on table: DataloggerFileColumns, column: DataLoggerFileID
fk_DataloggerFileColumns_InstrumentOutputVariables may require an index on table: DataloggerFileColumns, column: InstrumentOutputVariableID
fk_DataloggerFileColumns_RecordingUnits may require an index on table: DataloggerFileColumns, column: RecordingIntervalUnitsID
fk_DataloggerFileColumns_Results may require an index on table: DataloggerFileColumns, column: ResultID
fk_DataloggerFileColumns_ScanUnits may require an index on table: DataloggerFileColumns, column: ScanIntervalUnitsID
fk_DataloggerProgramFiles_Affiliations may require an index on table: DataloggerProgramFiles, column: AffiliationID
fk_Equipment_EquipmentModels may require an index on table: Equipment, column: EquipmentModelID
fk_Equipment_Organizations may require an index on table: Equipment, column: EquipmentVendorID
fk_Equipment_People may require an index on table: Equipment, column: EquipmentOwnerID
fk_EquipmentModels_Organizations may require an index on table: EquipmentModels, column: ModelManufacturerID
fk_EquipmentActions_Actions may require an index on table: EquipmentUsed, column: ActionID
fk_EquipmentActions_Equipment may require an index on table: EquipmentUsed, column: EquipmentID
fk_InstrumentOutputVariables_EquipmentModels may require an index on table: InstrumentOutputVariables, column: ModelID
fk_InstrumentOutputVariables_Methods may require an index on table: InstrumentOutputVariables, column: InstrumentMethodID
fk_InstrumentOutputVariables_Units may require an index on table: InstrumentOutputVariables, column: InstrumentRawOutputUnitsID
fk_InstrumentOutputVariables_Variables may require an index on table: InstrumentOutputVariables, column: VariableID
fk_RelatedEquipment_Equipment may require an index on table: RelatedEquipment, column: EquipmentID
fk_RelatedEquipment_Equipment_AreRelated may require an index on table: RelatedEquipment, column: RelatedEquipmentID
fk_ActionExtensionPropertyValues_Actions may require an index on table: ActionExtensionPropertyValues, column: ActionID
fk_ActionExtensionPropertyValues_ExtensionProperties may require an index on table: ActionExtensionPropertyValues, column: PropertyID
fk_CitationExtensionPropertyValues_Citations may require an index on table: CitationExtensionPropertyValues, column: CitationID
fk_CitationExtensionPropertyValues_ExtensionProperties may require an index on table: CitationExtensionPropertyValues, column: PropertyID
fk_ExtensionProperties_Units may require an index on table: ExtensionProperties, column: PropertyUnitsID
fk_MethodExtensionPropertyValues_ExtensionProperties may require an index on table: MethodExtensionPropertyValues, column: PropertyID
fk_MethodExtensionPropertyValues_Methods may require an index on table: MethodExtensionPropertyValues, column: MethodID
fk_ResultExtensionPropertyValues_ExtensionProperties may require an index on table: ResultExtensionPropertyValues, column: PropertyID
fk_ResultExtensionPropertyValues_Results may require an index on table: ResultExtensionPropertyValues, column: ResultID
fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties may require an index on table: SamplingFeatureExtensionPropertyValues, column: PropertyID
fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures may require an index on table: SamplingFeatureExtensionPropertyValues, column: SamplingFeatureID
fk_VariableExtensionPropertyValues_ExtensionProperties may require an index on table: VariableExtensionPropertyValues, column: PropertyID
fk_VariableExtensionPropertyValues_Variables may require an index on table: VariableExtensionPropertyValues, column: VariableID
fk_CitationExternalIdentifiers_Citations may require an index on table: CitationExternalIdentifiers, column: CitationID
fk_CitationExternalIdentifiers_ExternalIdentifierSystems may require an index on table: CitationExternalIdentifiers, column: ExternalIdentifierSystemID
fk_ExternalIdentifierSystems_Organizations may require an index on table: ExternalIdentifierSystems, column: IdentifierSystemOrganizationID
fk_MethodExternalIdentifiers_ExternalIdentifierSystems may require an index on table: MethodExternalIdentifiers, column: ExternalIdentifierSystemID
fk_MethodExternalIdentifiers_Methods may require an index on table: MethodExternalIdentifiers, column: MethodID
fk_PersonExternalIdentifiers_ExternalIdentifierSystems may require an index on table: PersonExternalIdentifiers, column: ExternalIdentifierSystemID
fk_PersonExternalIdentifiers_People may require an index on table: PersonExternalIdentifiers, column: PersonID
fk_RefMaterialExtIdentifiers_ExtIdentifierSystems may require an index on table: ReferenceMaterialExternalIdentifiers, column: ExternalIdentifierSystemID
fk_RefMaterialExtIdentifiers_RefMaterials may require an index on table: ReferenceMaterialExternalIdentifiers, column: ReferenceMaterialID
fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems may require an index on table: SamplingFeatureExternalIdentifiers, column: ExternalIdentifierSystemID
fk_SamplingFeatureExternalIdentifiers_SamplingFeatures may require an index on table: SamplingFeatureExternalIdentifiers, column: SamplingFeatureID
fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems may require an index on table: SpatialReferenceExternalIdentifiers, column: ExternalIdentifierSystemID
fk_SpatialReferenceExternalIdentifiers_SpatialReferences may require an index on table: SpatialReferenceExternalIdentifiers, column: SpatialReferenceID
fk_TaxonomicClassifierExtIDs_ExtIDSystems may require an index on table: TaxonomicClassifierExternalIdentifiers, column: ExternalIdentifierSystemID
fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers may require an index on table: TaxonomicClassifierExternalIdentifiers, column: TaxonomicClassifierID
fk_VariableExternalIdentifiers_ExternalIdentifierSystems may require an index on table: VariableExternalIdentifiers, column: ExternalIdentifierSystemID
fk_VariableExternalIdentifiers_Variables may require an index on table: VariableExternalIdentifiers, column: VariableID
fk_ActionDirectives_Actions may require an index on table: ActionDirectives, column: ActionID
fk_ActionDirectives_Directives may require an index on table: ActionDirectives, column: DirectiveID
fk_AuthorLists_Citations may require an index on table: AuthorLists, column: CitationID
fk_AuthorLists_People may require an index on table: AuthorLists, column: PersonID
fk_DataSetCitations_Citations may require an index on table: DataSetCitations, column: CitationID
fk_DataSetCitations_DataSets may require an index on table: DataSetCitations, column: DataSetID
fk_MethodCitations_Citations may require an index on table: MethodCitations, column: CitationID
fk_MethodCitations_Methods may require an index on table: MethodCitations, column: MethodID
fk_RelatedAnnotations_Annotations may require an index on table: RelatedAnnotations, column: AnnotationID
fk_RelatedAnnotations_Annotations_AreRelated may require an index on table: RelatedAnnotations, column: RelatedAnnotationID
fk_RelatedCitations_Citations may require an index on table: RelatedCitations, column: CitationID
fk_RelatedCitations_Citations_AreRelated may require an index on table: RelatedCitations, column: RelatedCitationID
fk_RelatedDatasets_DataSets may require an index on table: RelatedDatasets, column: DataSetID
fk_RelatedDatasets_DataSets_AreRelated may require an index on table: RelatedDatasets, column: RelatedDatasetID
fk_RelatedResults_Results may require an index on table: RelatedResults, column: ResultID
fk_RelatedResults_Results_AreRelated may require an index on table: RelatedResults, column: RelatedResultID
fk_ResultDerivationEquations_DerivationEquations may require an index on table: ResultDerivationEquations, column: DerivationEquationID
fk_CategoricalResultValues_CategoricalResults may require an index on table: CategoricalResultValues, column: ResultID
fk_CategoricalResults_SpatialReferences may require an index on table: CategoricalResults, column: SpatialReferenceID
fk_MeasurementResultValues_MeasurementResults may require an index on table: MeasurementResultValues, column: ResultID
fk_MeasurementResults_AIUnits may require an index on table: MeasurementResults, column: TimeAggregationIntervalUnitsID
fk_MeasurementResults_SpatialReferences may require an index on table: MeasurementResults, column: SpatialReferenceID
fk_MeasurementResults_XUnits may require an index on table: MeasurementResults, column: XLocationUnitsID
fk_MeasurementResults_YUnits may require an index on table: MeasurementResults, column: YLocationUnitsID
fk_MeasurementResults_ZUnits may require an index on table: MeasurementResults, column: ZLocationUnitsID
fk_PointCoverageResultValues_PointCoverageResults may require an index on table: PointCoverageResultValues, column: ResultID
fk_PointCoverageResultValues_XUnits may require an index on table: PointCoverageResultValues, column: XLocationUnitsID
fk_PointCoverageResultValues_YUnits may require an index on table: PointCoverageResultValues, column: YLocationUnitsID
fk_PointCoverageResults_SpatialReferences may require an index on table: PointCoverageResults, column: SpatialReferenceID
fk_PointCoverageResults_XUnits may require an index on table: PointCoverageResults, column: IntendedXSpacingUnitsID
fk_PointCoverageResults_YUnits may require an index on table: PointCoverageResults, column: IntendedYSpacingUnitsID
fk_PointCoverageResults_ZUnits may require an index on table: PointCoverageResults, column: ZLocationUnitsID
fk_ProfileResultValues_AIUnits may require an index on table: ProfileResultValues, column: TimeAggregationIntervalUnitsID
fk_ProfileResultValues_DUnits may require an index on table: ProfileResultValues, column: ZLocationUnitsID
fk_ProfileResultValues_ProfileResults may require an index on table: ProfileResultValues, column: ResultID
fk_ProfileResults_DUnits may require an index on table: ProfileResults, column: IntendedZSpacingUnitsID
fk_ProfileResults_SpatialReferences may require an index on table: ProfileResults, column: SpatialReferenceID
fk_ProfileResults_TUnits may require an index on table: ProfileResults, column: IntendedTimeSpacingUnitsID
fk_ProfileResults_XUnits may require an index on table: ProfileResults, column: XLocationUnitsID
fk_ProfileResults_YUnits may require an index on table: ProfileResults, column: YLocationUnitsID
fk_SectionResultValues_AIUnits may require an index on table: SectionResultValues, column: TimeAggregationIntervalUnitsID
fk_SectionResultValues_SectionResults may require an index on table: SectionResultValues, column: ResultID
fk_SectionResultValues_XUnits may require an index on table: SectionResultValues, column: XLocationUnitsID
fk_SectionResultValues_ZUnits may require an index on table: SectionResultValues, column: ZLocationUnitsID
fk_SectionResults_SpatialReferences may require an index on table: SectionResults, column: SpatialReferenceID
fk_SectionResults_TMUnits may require an index on table: SectionResults, column: IntendedTimeSpacingUnitsID
fk_SectionResults_Units may require an index on table: SectionResults, column: YLocationUnitsID
fk_SectionResults_XUnits may require an index on table: SectionResults, column: IntendedXSpacingUnitsID
fk_SectionResults_ZUnits may require an index on table: SectionResults, column: IntendedZSpacingUnitsID
fk_SpectraResultValues_AIUnits may require an index on table: SpectraResultValues, column: TimeAggregationIntervalUnitsID
fk_SpectraResultValues_SpectraResults may require an index on table: SpectraResultValues, column: ResultID
fk_SpectraResultValues_WUnits may require an index on table: SpectraResultValues, column: WavelengthUnitsID
fk_SpectraResults_SpatialReferences may require an index on table: SpectraResults, column: SpatialReferenceID
fk_SpectraResults_Units may require an index on table: SpectraResults, column: IntendedWavelengthSpacingUnitsID
fk_SpectraResults_XUnits may require an index on table: SpectraResults, column: XLocationUnitsID
fk_SpectraResults_YUnits may require an index on table: SpectraResults, column: YLocationUnitsID
fk_SpectraResults_ZUnits may require an index on table: SpectraResults, column: ZLocationUnitsID
fk_TimeSeriesResultValues_TimeSeriesResults may require an index on table: TimeSeriesResultValues, column: ResultID
fk_TimeSeriesResultValues_Units may require an index on table: TimeSeriesResultValues, column: TimeAggregationIntervalUnitsID
fk_TimeSeriesResults_SpatialReferences may require an index on table: TimeSeriesResults, column: SpatialReferenceID
fk_TimeSeriesResults_TUnits may require an index on table: TimeSeriesResults, column: IntendedTimeSpacingUnitsID
fk_TimeSeriesResults_XUnits may require an index on table: TimeSeriesResults, column: XLocationUnitsID
fk_TimeSeriesResults_YUnits may require an index on table: TimeSeriesResults, column: YLocationUnitsID
fk_TimeSeriesResults_ZUnits may require an index on table: TimeSeriesResults, column: ZLocationUnitsID
fk_TrajectoryResultValues_AIUnits may require an index on table: TrajectoryResultValues, column: TimeAggregationIntervalUnitsID
fk_TrajectoryResultValues_TrajectoryResults may require an index on table: TrajectoryResultValues, column: ResultID
fk_TrajectoryResultValues_XUnits may require an index on table: TrajectoryResultValues, column: XLocationUnitsID
fk_TrajectoryResultValues_YUnits may require an index on table: TrajectoryResultValues, column: YLocationUnitsID
fk_TrajectoryResultValues_ZUnits may require an index on table: TrajectoryResultValues, column: ZLocationUnitsID
fk_TrajectoryResults_SpatialReferences may require an index on table: TrajectoryResults, column: SpatialReferenceID
fk_TrajectoryResults_TSUnits may require an index on table: TrajectoryResults, column: IntendedTrajectorySpacingUnitsID
fk_TrajectoryResults_TUnits may require an index on table: TrajectoryResults, column: IntendedTimeSpacingUnitsID
fk_TransectResultValues_TransectResults may require an index on table: TransectResultValues, column: ResultID
fk_TransectResults_SpatialReferences may require an index on table: TransectResults, column: SpatialReferenceID
fk_TransectResults_TMUnits may require an index on table: TransectResults, column: IntendedTimeSpacingUnitsID
fk_TransectResults_TSUnits may require an index on table: TransectResults, column: IntendedTransectSpacingUnitsID
fk_TransectResults_Units may require an index on table: TransectResults, column: ZLocationUnitsID
fk_FeatureParents_FeaturesParent may require an index on table: RelatedFeatures, column: RelatedFeatureID
fk_FeatureParents_SamplingFeatures may require an index on table: RelatedFeatures, column: SamplingFeatureID
fk_FeatureParents_SpatialOffsets may require an index on table: RelatedFeatures, column: SpatialOffsetID
fk_Sites_SpatialReferences may require an index on table: Sites, column: LatLonDatumID
fk_SpecimenTaxonomicClassifiers_Specimens may require an index on table: SpecimenTaxonomicClassifiers, column: SamplingFeatureID
fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers may require an index on table: SpecimenTaxonomicClassifiers, column: TaxonomicClassifierID
-----------------------------------------------------------
*/

/* Add Foreign Key: fk_ActionAnnotations_Actions */
ALTER TABLE ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Actions
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionAnnotations_Annotations */
ALTER TABLE ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Annotations_Citations */
ALTER TABLE Annotations ADD CONSTRAINT fk_Annotations_Citations
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Annotations_People */
ALTER TABLE Annotations ADD CONSTRAINT fk_Annotations_People
	FOREIGN KEY (AnnotatorID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValueAnnotations_Annotations */
ALTER TABLE CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValueAnnotations_CategoricalResultValues */
ALTER TABLE CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_CategoricalResultValues
	FOREIGN KEY (ValueID) REFERENCES CategoricalResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentAnnotations_Annotations */
ALTER TABLE EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentAnnotations_Equipment */
ALTER TABLE EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResultValueAnnotations_MeasurementResultValues */
ALTER TABLE MeasurementResultValueAnnotations ADD CONSTRAINT fk_MeasurementResultValueAnnotations_MeasurementResultValues
	FOREIGN KEY (ValueID) REFERENCES MeasurementResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultValueAnnotations_Annotations */
ALTER TABLE MeasurementResultValueAnnotations ADD CONSTRAINT fk_ResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Annotations */
ALTER TABLE MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Methods */
ALTER TABLE MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Methods
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValueAnnotations_Annotations */
ALTER TABLE PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValueAnnotations_PointCoverageResultValues */
ALTER TABLE PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_PointCoverageResultValues
	FOREIGN KEY (ValueID) REFERENCES PointCoverageResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValueAnnotations_Annotations */
ALTER TABLE ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValueAnnotations_ProfileResultValues */
ALTER TABLE ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_ProfileResultValues
	FOREIGN KEY (ValueID) REFERENCES ProfileResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Annotations */
ALTER TABLE ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Results */
ALTER TABLE ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureAnnotations_Annotations */
ALTER TABLE SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureAnnotations_SamplingFeatures */
ALTER TABLE SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValueAnnotations_Annotations */
ALTER TABLE SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValueAnnotations_SectionResultValues */
ALTER TABLE SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_SectionResultValues
	FOREIGN KEY (ValueID) REFERENCES SectionResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValueAnnotations_Annotations */
ALTER TABLE SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValueAnnotations_SpectraResultValues */
ALTER TABLE SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_SpectraResultValues
	FOREIGN KEY (ValueID) REFERENCES SpectraResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValueAnnotations_Annotations */
ALTER TABLE TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues */
ALTER TABLE TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues
	FOREIGN KEY (ValueID) REFERENCES TimeSeriesResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValueAnnotations_Annotations */
ALTER TABLE TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValueAnnotations_TrajectoryResultValues */
ALTER TABLE TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_TrajectoryResultValues
	FOREIGN KEY (ValueID) REFERENCES TrajectoryResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValueAnnotations_Annotations */
ALTER TABLE TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValueAnnotations_TransectResultValues */
ALTER TABLE TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_TransectResultValues
	FOREIGN KEY (ValueID) REFERENCES TransectResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Actions */
ALTER TABLE ActionBy ADD CONSTRAINT fk_ActionPeople_Actions
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Affiliations */
ALTER TABLE ActionBy ADD CONSTRAINT fk_ActionPeople_Affiliations
	FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Actions_Methods */
ALTER TABLE Actions ADD CONSTRAINT fk_Actions_Methods
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Affiliations_Organizations */
ALTER TABLE Affiliations ADD CONSTRAINT fk_Affiliations_Organizations
	FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Affiliations_People */
ALTER TABLE Affiliations ADD CONSTRAINT fk_Affiliations_People
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetsResults_DataSets */
ALTER TABLE DataSetsResults ADD CONSTRAINT fk_DataSetsResults_DataSets
	FOREIGN KEY (DataSetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetsResults_Results */
ALTER TABLE DataSetsResults ADD CONSTRAINT fk_DataSetsResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureActions_Actions */
ALTER TABLE FeatureActions ADD CONSTRAINT fk_FeatureActions_Actions
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureActions_SamplingFeatures */
ALTER TABLE FeatureActions ADD CONSTRAINT fk_FeatureActions_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Methods_Organizations */
ALTER TABLE Methods ADD CONSTRAINT fk_Methods_Organizations
	FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Organizations_Organizations */
ALTER TABLE Organizations ADD CONSTRAINT fk_Organizations_Organizations
	FOREIGN KEY (ParentOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedActions_Actions */
ALTER TABLE RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedActions_Actions_AreRelated */
ALTER TABLE RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions_AreRelated
	FOREIGN KEY (RelatedActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_FeatureActions */
ALTER TABLE Results ADD CONSTRAINT fk_Results_FeatureActions
	FOREIGN KEY (FeatureActionID) REFERENCES FeatureActions (FeatureActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_ProcessingLevels */
ALTER TABLE Results ADD CONSTRAINT fk_Results_ProcessingLevels
	FOREIGN KEY (ProcessingLevelID) REFERENCES ProcessingLevels (ProcessingLevelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_ResultTypeCV */
ALTER TABLE Results ADD CONSTRAINT fk_Results_ResultTypeCV
	FOREIGN KEY (ResultTypeCV) REFERENCES ResultTypeCV (ResultTypeCV)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_TaxonomicClassifiers */
ALTER TABLE Results ADD CONSTRAINT fk_Results_TaxonomicClassifiers
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Units */
ALTER TABLE Results ADD CONSTRAINT fk_Results_Units
	FOREIGN KEY (UnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Variables */
ALTER TABLE Results ADD CONSTRAINT fk_Results_Variables
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ParentTaxon_Taxon */
ALTER TABLE TaxonomicClassifiers ADD CONSTRAINT fk_ParentTaxon_Taxon
	FOREIGN KEY (ParentTaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataQuality_Units */
ALTER TABLE DataQuality ADD CONSTRAINT fk_DataQuality_Units
	FOREIGN KEY (DataQualityValueUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Citations */
ALTER TABLE ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Citations
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_ReferenceMaterials */
ALTER TABLE ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_ReferenceMaterials
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Units */
ALTER TABLE ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Units
	FOREIGN KEY (UnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Variables */
ALTER TABLE ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Variables
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterials_Organizations */
ALTER TABLE ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_Organizations
	FOREIGN KEY (ReferenceMaterialOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterials_SamplingFeatures */
ALTER TABLE ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultNormalizationValues_ReferenceMaterialValues */
ALTER TABLE ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_ReferenceMaterialValues
	FOREIGN KEY (NormalizedByReferenceMaterialValueID) REFERENCES ReferenceMaterialValues (ReferenceMaterialValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultNormalizationValues_Results */
ALTER TABLE ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsDataQuality_DataQuality */
ALTER TABLE ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_DataQuality
	FOREIGN KEY (DataQualityID) REFERENCES DataQuality (DataQualityID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsDataQuality_Results */
ALTER TABLE ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationActions_Actions */
ALTER TABLE CalibrationActions ADD CONSTRAINT fk_CalibrationActions_Actions
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationActions_InstrumentOutputVariables */
ALTER TABLE CalibrationActions ADD CONSTRAINT fk_CalibrationActions_InstrumentOutputVariables
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationReferenceEquipment_CalibrationActions */
ALTER TABLE CalibrationReferenceEquipment ADD CONSTRAINT fk_CalibrationReferenceEquipment_CalibrationActions
	FOREIGN KEY (ActionID) REFERENCES CalibrationActions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationReferenceEquipment_Equipment */
ALTER TABLE CalibrationReferenceEquipment ADD CONSTRAINT fk_CalibrationReferenceEquipment_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationStandards_CalibrationActions */
ALTER TABLE CalibrationStandards ADD CONSTRAINT fk_CalibrationStandards_CalibrationActions
	FOREIGN KEY (ActionID) REFERENCES CalibrationActions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FieldCalibrationStandards_ReferenceMaterials */
ALTER TABLE CalibrationStandards ADD CONSTRAINT fk_FieldCalibrationStandards_ReferenceMaterials
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataLoggerFiles_DataloggerProgramFiles */
ALTER TABLE DataLoggerFiles ADD CONSTRAINT fk_DataLoggerFiles_DataloggerProgramFiles
	FOREIGN KEY (ProgramID) REFERENCES DataloggerProgramFiles (ProgramID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_DataLoggerFiles */
ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_DataLoggerFiles
	FOREIGN KEY (DataLoggerFileID) REFERENCES DataLoggerFiles (DataLoggerFileID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_InstrumentOutputVariables */
ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_InstrumentOutputVariables
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_RecordingUnits */
ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_RecordingUnits
	FOREIGN KEY (RecordingIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_Results */
ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_ScanUnits */
ALTER TABLE DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_ScanUnits
	FOREIGN KEY (ScanIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerProgramFiles_Affiliations */
ALTER TABLE DataloggerProgramFiles ADD CONSTRAINT fk_DataloggerProgramFiles_Affiliations
	FOREIGN KEY (AffiliationID) REFERENCES Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_EquipmentModels */
ALTER TABLE Equipment ADD CONSTRAINT fk_Equipment_EquipmentModels
	FOREIGN KEY (EquipmentModelID) REFERENCES EquipmentModels (EquipmentModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_Organizations */
ALTER TABLE Equipment ADD CONSTRAINT fk_Equipment_Organizations
	FOREIGN KEY (EquipmentVendorID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_People */
ALTER TABLE Equipment ADD CONSTRAINT fk_Equipment_People
	FOREIGN KEY (EquipmentOwnerID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentModels_Organizations */
ALTER TABLE EquipmentModels ADD CONSTRAINT fk_EquipmentModels_Organizations
	FOREIGN KEY (ModelManufacturerID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentActions_Actions */
ALTER TABLE EquipmentUsed ADD CONSTRAINT fk_EquipmentActions_Actions
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentActions_Equipment */
ALTER TABLE EquipmentUsed ADD CONSTRAINT fk_EquipmentActions_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_EquipmentModels */
ALTER TABLE InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_EquipmentModels
	FOREIGN KEY (ModelID) REFERENCES EquipmentModels (EquipmentModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Methods */
ALTER TABLE InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Methods
	FOREIGN KEY (InstrumentMethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Units */
ALTER TABLE InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Units
	FOREIGN KEY (InstrumentRawOutputUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Variables */
ALTER TABLE InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Variables
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MaintenanceActions_Actions */
ALTER TABLE MaintenanceActions ADD CONSTRAINT fk_MaintenanceActions_Actions
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedEquipment_Equipment */
ALTER TABLE RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedEquipment_Equipment_AreRelated */
ALTER TABLE RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment_AreRelated
	FOREIGN KEY (RelatedEquipmentID) REFERENCES Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionExtensionPropertyValues_Actions */
ALTER TABLE ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_Actions
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExtensionPropertyValues_Citations */
ALTER TABLE CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_Citations
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExtensionPropertyValues_ExtensionProperties */
ALTER TABLE CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExtensionProperties_Units */
ALTER TABLE ExtensionProperties ADD CONSTRAINT fk_ExtensionProperties_Units
	FOREIGN KEY (PropertyUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_ExtensionProperties */
ALTER TABLE MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_Methods */
ALTER TABLE MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_Methods
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultExtensionPropertyValues_Results */
ALTER TABLE ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties */
ALTER TABLE SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures */
ALTER TABLE SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_ExtensionProperties */
ALTER TABLE VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_Variables */
ALTER TABLE VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_Variables
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExternalIdentifiers_Citations */
ALTER TABLE CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_Citations
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_Organizations */
ALTER TABLE ExternalIdentifierSystems ADD CONSTRAINT fk_ExternalIdentifierSystems_Organizations
	FOREIGN KEY (IdentifierSystemOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExternalIdentifiers_Methods */
ALTER TABLE MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_Methods
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PersonExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PersonExternalIdentifiers_People */
ALTER TABLE PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_People
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RefMaterialExtIdentifiers_ExtIdentifierSystems */
ALTER TABLE ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_ExtIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RefMaterialExtIdentifiers_RefMaterials */
ALTER TABLE ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_RefMaterials
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExternalIdentifiers_SamplingFeatures */
ALTER TABLE SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpatialReferenceExternalIdentifiers_SpatialReferences */
ALTER TABLE SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TaxonomicClassifierExtIDs_ExtIDSystems */
ALTER TABLE TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_ExtIDSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers */
ALTER TABLE TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExternalIdentifiers_Variables */
ALTER TABLE VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_Variables
	FOREIGN KEY (VariableID) REFERENCES Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionDirectives_Actions */
ALTER TABLE ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Actions
	FOREIGN KEY (ActionID) REFERENCES Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionDirectives_Directives */
ALTER TABLE ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Directives
	FOREIGN KEY (DirectiveID) REFERENCES Directives (DirectiveID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenBatchPostions_FeatureActions */
ALTER TABLE SpecimenBatchPostions ADD CONSTRAINT fk_SpecimenBatchPostions_FeatureActions
	FOREIGN KEY (FeatureActionID) REFERENCES FeatureActions (FeatureActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AuthorLists_Citations */
ALTER TABLE AuthorLists ADD CONSTRAINT fk_AuthorLists_Citations
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AuthorLists_People */
ALTER TABLE AuthorLists ADD CONSTRAINT fk_AuthorLists_People
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetCitations_Citations */
ALTER TABLE DataSetCitations ADD CONSTRAINT fk_DataSetCitations_Citations
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetCitations_DataSets */
ALTER TABLE DataSetCitations ADD CONSTRAINT fk_DataSetCitations_DataSets
	FOREIGN KEY (DataSetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodCitations_Citations */
ALTER TABLE MethodCitations ADD CONSTRAINT fk_MethodCitations_Citations
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodCitations_Methods */
ALTER TABLE MethodCitations ADD CONSTRAINT fk_MethodCitations_Methods
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedAnnotations_Annotations */
ALTER TABLE RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedAnnotations_Annotations_AreRelated */
ALTER TABLE RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations_AreRelated
	FOREIGN KEY (RelatedAnnotationID) REFERENCES Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedCitations_Citations */
ALTER TABLE RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations
	FOREIGN KEY (CitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedCitations_Citations_AreRelated */
ALTER TABLE RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations_AreRelated
	FOREIGN KEY (RelatedCitationID) REFERENCES Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedDatasets_DataSets */
ALTER TABLE RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets
	FOREIGN KEY (DataSetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedDatasets_DataSets_AreRelated */
ALTER TABLE RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets_AreRelated
	FOREIGN KEY (RelatedDatasetID) REFERENCES DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results */
ALTER TABLE RelatedResults ADD CONSTRAINT fk_RelatedResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results_AreRelated */
ALTER TABLE RelatedResults ADD CONSTRAINT fk_RelatedResults_Results_AreRelated
	FOREIGN KEY (RelatedResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultDerivationEquations_DerivationEquations */
ALTER TABLE ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_DerivationEquations
	FOREIGN KEY (DerivationEquationID) REFERENCES DerivationEquations (DerivationEquationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultDerivationEquations_Results */
ALTER TABLE ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValues_CategoricalResults */
ALTER TABLE CategoricalResultValues ADD CONSTRAINT fk_CategoricalResultValues_CategoricalResults
	FOREIGN KEY (ResultID) REFERENCES CategoricalResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResults_Results */
ALTER TABLE CategoricalResults ADD CONSTRAINT fk_CategoricalResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResults_SpatialReferences */
ALTER TABLE CategoricalResults ADD CONSTRAINT fk_CategoricalResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResultValues_MeasurementResults */
ALTER TABLE MeasurementResultValues ADD CONSTRAINT fk_MeasurementResultValues_MeasurementResults
	FOREIGN KEY (ResultID) REFERENCES MeasurementResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_AIUnits */
ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_Results */
ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_SpatialReferences */
ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_XUnits */
ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_YUnits */
ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_ZUnits */
ALTER TABLE MeasurementResults ADD CONSTRAINT fk_MeasurementResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_PointCoverageResults */
ALTER TABLE PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_PointCoverageResults
	FOREIGN KEY (ResultID) REFERENCES PointCoverageResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_XUnits */
ALTER TABLE PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_YUnits */
ALTER TABLE PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_Results */
ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_SpatialReferences */
ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_XUnits */
ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_XUnits
	FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_YUnits */
ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_YUnits
	FOREIGN KEY (IntendedYSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_ZUnits */
ALTER TABLE PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_AIUnits */
ALTER TABLE ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_DUnits */
ALTER TABLE ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_DUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_ProfileResults */
ALTER TABLE ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_ProfileResults
	FOREIGN KEY (ResultID) REFERENCES ProfileResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_DUnits */
ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_DUnits
	FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_Results */
ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_SpatialReferences */
ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_TUnits */
ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_TUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_XUnits */
ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_YUnits */
ALTER TABLE ProfileResults ADD CONSTRAINT fk_ProfileResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_AIUnits */
ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_SectionResults */
ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_SectionResults
	FOREIGN KEY (ResultID) REFERENCES SectionResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_XUnits */
ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_ZUnits */
ALTER TABLE SectionResultValues ADD CONSTRAINT fk_SectionResultValues_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_Results */
ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_SpatialReferences */
ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_TMUnits */
ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_TMUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_Units */
ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_Units
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_XUnits */
ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_XUnits
	FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_ZUnits */
ALTER TABLE SectionResults ADD CONSTRAINT fk_SectionResults_ZUnits
	FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_AIUnits */
ALTER TABLE SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_SpectraResults */
ALTER TABLE SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_SpectraResults
	FOREIGN KEY (ResultID) REFERENCES SpectraResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_WUnits */
ALTER TABLE SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_WUnits
	FOREIGN KEY (WavelengthUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_Results */
ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_SpatialReferences */
ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_Units */
ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_Units
	FOREIGN KEY (IntendedWavelengthSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_XUnits */
ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_YUnits */
ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_ZUnits */
ALTER TABLE SpectraResults ADD CONSTRAINT fk_SpectraResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValues_TimeSeriesResults */
ALTER TABLE TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_TimeSeriesResults
	FOREIGN KEY (ResultID) REFERENCES TimeSeriesResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValues_Units */
ALTER TABLE TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_Units
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_Results */
ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_SpatialReferences */
ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_TUnits */
ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_TUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_XUnits */
ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_YUnits */
ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_ZUnits */
ALTER TABLE TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_AIUnits */
ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_TrajectoryResults */
ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_TrajectoryResults
	FOREIGN KEY (ResultID) REFERENCES TrajectoryResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_XUnits */
ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_YUnits */
ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_ZUnits */
ALTER TABLE TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_Results */
ALTER TABLE TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_SpatialReferences */
ALTER TABLE TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_TSUnits */
ALTER TABLE TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TSUnits
	FOREIGN KEY (IntendedTrajectorySpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_TUnits */
ALTER TABLE TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValues_TransectResults */
ALTER TABLE TransectResultValues ADD CONSTRAINT fk_TransectResultValues_TransectResults
	FOREIGN KEY (ResultID) REFERENCES TransectResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_Results */
ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_Results
	FOREIGN KEY (ResultID) REFERENCES Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_SpatialReferences */
ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_TMUnits */
ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_TMUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_TSUnits */
ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_TSUnits
	FOREIGN KEY (IntendedTransectSpacingUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_Units */
ALTER TABLE TransectResults ADD CONSTRAINT fk_TransectResults_Units
	FOREIGN KEY (ZLocationUnitsID) REFERENCES Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_FeaturesParent */
ALTER TABLE RelatedFeatures ADD CONSTRAINT fk_FeatureParents_FeaturesParent
	FOREIGN KEY (RelatedFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_SamplingFeatures */
ALTER TABLE RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_SpatialOffsets */
ALTER TABLE RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SpatialOffsets
	FOREIGN KEY (SpatialOffsetID) REFERENCES SpatialOffsets (SpatialOffsetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Sites_SamplingFeatures */
ALTER TABLE Sites ADD CONSTRAINT fk_Sites_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Sites_SpatialReferences */
ALTER TABLE Sites ADD CONSTRAINT fk_Sites_SpatialReferences
	FOREIGN KEY (LatLonDatumID) REFERENCES SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenTaxonomicClassifiers_Specimens */
ALTER TABLE SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_Specimens
	FOREIGN KEY (SamplingFeatureID) REFERENCES Specimens (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers */
ALTER TABLE SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Specimens_SamplingFeatures */
ALTER TABLE Specimens ADD CONSTRAINT fk_Specimens_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;