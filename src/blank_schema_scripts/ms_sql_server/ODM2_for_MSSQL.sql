/***********************************************************************************/
/* Creates all of the ODM2 schemas within a blank database called "ODM2"           */                       
/* Create a blank database called "ODM2" and then run this script on that database */   
/***********************************************************************************/

USE ODM2;
GO

/************ Update: Schemas ***************/

/* Add Schema: ODM2Annotations */
CREATE SCHEMA ODM2Annotations;
GO
EXEC sp_addextendedproperty 'MS_Description', 'Annotations are used to add comments or qualifiers to entity instances in ODM2.', 'schema', 'ODM2Annotations', 
	null, null, null, null;
GO

/* Add Schema: ODM2CV */
CREATE SCHEMA ODM2CV;
GO
EXEC sp_addextendedproperty 'MS_Description', 'Controlled vocabularies for ODM2.', 'schema', 'ODM2CV', 
	null, null, null, null;
GO

/* Add Schema: ODM2Core */
CREATE SCHEMA ODM2Core;
GO
EXEC sp_addextendedproperty 'MS_Description', 'The core of ODM2.  Every ODM2 instance will implement the Core.', 'schema', 'ODM2Core', 
	null, null, null, null;
GO

/* Add Schema: ODM2DataQuality */
CREATE SCHEMA ODM2DataQuality;
GO
EXEC sp_addextendedproperty 'MS_Description', 'Entities and attributes related to data quality.', 'schema', 'ODM2DataQuality', 
	null, null, null, null;
GO

/* Add Schema: ODM2Equipment */
CREATE SCHEMA ODM2Equipment;
GO
EXEC sp_addextendedproperty 'MS_Description', 'Entities and attributes of equipment used to make observations (e.g., sensors and instruments).', 'schema', 'ODM2Equipment', 
	null, null, null, null;
GO

/* Add Schema: ODM2ExtensionProperties */
CREATE SCHEMA ODM2ExtensionProperties;
GO
EXEC sp_addextendedproperty 'MS_Description', 'A general extensibility mechanism for any entity/object/table in ODM2.', 'schema', 'ODM2ExtensionProperties', 
	null, null, null, null;
GO

/* Add Schema: ODM2ExternalIdentifiers */
CREATE SCHEMA ODM2ExternalIdentifiers;
GO
EXEC sp_addextendedproperty 'MS_Description', 'Entities and attributes for linking ODM2 entities (e.g., Sites, Methods, etc.) to external identifier systems.', 'schema', 'ODM2ExternalIdentifiers', 
	null, null, null, null;
GO

/* Add Schema: ODM2LabAnalyses */
CREATE SCHEMA ODM2LabAnalyses;
GO
EXEC sp_addextendedproperty 'MS_Description', 'Information about samples and laboratory analyses for ex-situ data.', 'schema', 'ODM2LabAnalyses', 
	null, null, null, null;
GO

/* Add Schema: ODM2Provenance */
CREATE SCHEMA ODM2Provenance;
GO
EXEC sp_addextendedproperty 'MS_Description', 'Entities and attributes for creating and storing provenance information and versions of observations in ODM2.', 'schema', 'ODM2Provenance', 
	null, null, null, null;
GO

/* Add Schema: ODM2Results */
CREATE SCHEMA ODM2Results;
GO
EXEC sp_addextendedproperty 'MS_Description', 'The resulting values of observations in ODM2.', 'schema', 'ODM2Results', 
	null, null, null, null;
GO

/* Add Schema: ODM2SamplingFeatures */
CREATE SCHEMA ODM2SamplingFeatures;
GO
EXEC sp_addextendedproperty 'MS_Description', 'Information about sampling features, including sites and specimens.', 'schema', 'ODM2SamplingFeatures', 
	null, null, null, null;
GO


/************ Update: Tables ***************/

/******************** Add Table: ODM2Annotations.ActionAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.ActionAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.ActionAnnotations ADD CONSTRAINT pkActionAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the Action being annotated.', 'schema', 'ODM2Annotations', 
	'table', 'ActionAnnotations', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the annotation being added to the Action.', 'schema', 'ODM2Annotations', 
	'table', 'ActionAnnotations', 'column', 'AnnotationID';

EXEC sp_addextendedproperty 'MS_Description', 'Notes for or groups of one or more Actions.', 'schema', 'ODM2Annotations', 
	'table', ActionAnnotations, null, null;


/******************** Add Table: ODM2Annotations.Annotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.Annotations
(
	AnnotationID INTEGER IDENTITY (1, 1) NOT NULL,
	AnnotationTypeCV VARCHAR(255) NOT NULL,
	AnnotationCode VARCHAR(50) NULL,
	AnnotationText VARCHAR(500) NOT NULL,
	AnnotationDateTime DATETIME NULL,
	AnnotationUTCOffset INTEGER NULL,
	AnnotationLink VARCHAR(255) NULL,
	AnnotatorID INTEGER NULL,
	CitationID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.Annotations ADD CONSTRAINT pkAnnotations
	PRIMARY KEY (AnnotationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for Annotations.', 'schema', 'ODM2Annotations', 
	'table', 'Annotations', 'column', 'AnnotationID';

EXEC sp_addextendedproperty 'MS_Description', 'CV for types of annotations.', 'schema', 'ODM2Annotations', 
	'table', 'Annotations', 'column', 'AnnotationTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'A short text code that identifies the annotation (e.g., "A'' for "Approved data").', 'schema', 'ODM2Annotations', 
	'table', 'Annotations', 'column', 'AnnotationCode';

EXEC sp_addextendedproperty 'MS_Description', 'Full text of the annotation.', 'schema', 'ODM2Annotations', 
	'table', 'Annotations', 'column', 'AnnotationText';

EXEC sp_addextendedproperty 'MS_Description', 'Date and time at which the annotation was created.', 'schema', 'ODM2Annotations', 
	'table', 'Annotations', 'column', 'AnnotationDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'UTCOffset for the annotation creation date/time.', 'schema', 'ODM2Annotations', 
	'table', 'Annotations', 'column', 'AnnotationUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'Foregn key identifier for the person that created the annotation', 'schema', 'ODM2Annotations', 
	'table', 'Annotations', 'column', 'AnnotatorID';

EXEC sp_addextendedproperty 'MS_Description', 'Contains text annotations added to one or more records within various ODM2 tables.  Annotations can be used to record notes about a particular SamplingFeature, Action, Result, etc. or to create groups of records such as Specimens, Sites, People, etc.', 'schema', 'ODM2Annotations', 
	'table', Annotations, null, null;


/******************** Add Table: ODM2Annotations.CategoricalResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.CategoricalResultValueAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.CategoricalResultValueAnnotations ADD CONSTRAINT pkCategoricalResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Annotations for Categorical ResultValues', 'schema', 'ODM2Annotations', 
	'table', CategoricalResultValueAnnotations, null, null;


/******************** Add Table: ODM2Annotations.EquipmentAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.EquipmentAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	EquipmentID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.EquipmentAnnotations ADD CONSTRAINT pkEquipmentAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Bridge table linking Annotations to Equipment', 'schema', 'ODM2Annotations', 
	'table', EquipmentAnnotations, null, null;


/******************** Add Table: ODM2Annotations.MeasurementResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.MeasurementResultValueAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.MeasurementResultValueAnnotations ADD CONSTRAINT pkMeasurementResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Annotations', 
	'table', 'MeasurementResultValueAnnotations', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the result value being annotated', 'schema', 'ODM2Annotations', 
	'table', 'MeasurementResultValueAnnotations', 'column', 'ValueID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the annotation applied to the result value', 'schema', 'ODM2Annotations', 
	'table', 'MeasurementResultValueAnnotations', 'column', 'AnnotationID';

EXEC sp_addextendedproperty 'MS_Description', 'Annotations for Measurement ResultValues', 'schema', 'ODM2Annotations', 
	'table', MeasurementResultValueAnnotations, null, null;


/******************** Add Table: ODM2Annotations.MethodAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.MethodAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	MethodID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.MethodAnnotations ADD CONSTRAINT pkMethodAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Annotations', 
	'table', 'MethodAnnotations', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the method being annotated', 'schema', 'ODM2Annotations', 
	'table', 'MethodAnnotations', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the annotation added to the method', 'schema', 'ODM2Annotations', 
	'table', 'MethodAnnotations', 'column', 'AnnotationID';

EXEC sp_addextendedproperty 'MS_Description', 'Notes for or groups of one or more Methods.', 'schema', 'ODM2Annotations', 
	'table', MethodAnnotations, null, null;


/******************** Add Table: ODM2Annotations.PointCoverageResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.PointCoverageResultValueAnnotations
(
	BridgeID BIGINT IDENTITY (1, 1) NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.PointCoverageResultValueAnnotations ADD CONSTRAINT pkPointCoverageResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Annotations for Point Coverage ResultValues', 'schema', 'ODM2Annotations', 
	'table', PointCoverageResultValueAnnotations, null, null;


/******************** Add Table: ODM2Annotations.ProfileResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.ProfileResultValueAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.ProfileResultValueAnnotations ADD CONSTRAINT pkProfileResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Annotations for Profile ResultValues', 'schema', 'ODM2Annotations', 
	'table', ProfileResultValueAnnotations, null, null;


/******************** Add Table: ODM2Annotations.ResultAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.ResultAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL,
	BeginDateTime DATETIME NOT NULL,
	EndDateTime DATETIME NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.ResultAnnotations ADD CONSTRAINT pkResultAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Annotations', 
	'table', 'ResultAnnotations', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the result being annotated', 'schema', 'ODM2Annotations', 
	'table', 'ResultAnnotations', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the annotation added to the result', 'schema', 'ODM2Annotations', 
	'table', 'ResultAnnotations', 'column', 'AnnotationID';

EXEC sp_addextendedproperty 'MS_Description', 'Beginning date/time of the annotation', 'schema', 'ODM2Annotations', 
	'table', 'ResultAnnotations', 'column', 'BeginDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'Ending date/time of the annotation', 'schema', 'ODM2Annotations', 
	'table', 'ResultAnnotations', 'column', 'EndDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'Notes for or groups of one or more Results [sets].', 'schema', 'ODM2Annotations', 
	'table', ResultAnnotations, null, null;


/******************** Add Table: ODM2Annotations.SamplingFeatureAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.SamplingFeatureAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.SamplingFeatureAnnotations ADD CONSTRAINT pkSamplingFeatureAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Annotations', 
	'table', 'SamplingFeatureAnnotations', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the SamplingFeature being annotated.', 'schema', 'ODM2Annotations', 
	'table', 'SamplingFeatureAnnotations', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the Annotation applied to the SamplingFeature.', 'schema', 'ODM2Annotations', 
	'table', 'SamplingFeatureAnnotations', 'column', 'AnnotationID';

EXEC sp_addextendedproperty 'MS_Description', 'Notes for or groups of one or more Sampling Features.', 'schema', 'ODM2Annotations', 
	'table', SamplingFeatureAnnotations, null, null;


/******************** Add Table: ODM2Annotations.SectionResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.SectionResultValueAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.SectionResultValueAnnotations ADD CONSTRAINT pkSectionResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Annotations for Section ResultValues', 'schema', 'ODM2Annotations', 
	'table', SectionResultValueAnnotations, null, null;


/******************** Add Table: ODM2Annotations.SpectraResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.SpectraResultValueAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.SpectraResultValueAnnotations ADD CONSTRAINT pkSpectraResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Annotations for Spectra ResultValues', 'schema', 'ODM2Annotations', 
	'table', SpectraResultValueAnnotations, null, null;


/******************** Add Table: ODM2Annotations.TimeSeriesResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.TimeSeriesResultValueAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.TimeSeriesResultValueAnnotations ADD CONSTRAINT pkTimeSeriesResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Annotations for Time Series ResultValues', 'schema', 'ODM2Annotations', 
	'table', TimeSeriesResultValueAnnotations, null, null;


/******************** Add Table: ODM2Annotations.TrajectoryResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.TrajectoryResultValueAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.TrajectoryResultValueAnnotations ADD CONSTRAINT pkTrajectoryResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Annotations for Trajectory ResultValues', 'schema', 'ODM2Annotations', 
	'table', TrajectoryResultValueAnnotations, null, null;


/******************** Add Table: ODM2Annotations.TransectResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.TransectResultValueAnnotations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.TransectResultValueAnnotations ADD CONSTRAINT pkTransectResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Annotations for Transect ResultValues', 'schema', 'ODM2Annotations', 
	'table', TransectResultValueAnnotations, null, null;


/******************** Add Table: ODM2CV.CVTerms ************************/

/* Build Table Structure */
CREATE TABLE ODM2CV.CVTerms
(
	TermID INTEGER NOT NULL,
	Term VARCHAR(255) NOT NULL,
	Definition VARCHAR(500) NULL,
	ODMVocabulary VARCHAR(255) NOT NULL,
	SourceVocabulary VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2CV.CVTerms ADD CONSTRAINT pkCVTerms
	PRIMARY KEY (TermID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key', 'schema', 'ODM2CV', 
	'table', 'CVTerms', 'column', 'TermID';

EXEC sp_addextendedproperty 'MS_Description', 'Controlled vocabulary term', 'schema', 'ODM2CV', 
	'table', 'CVTerms', 'column', 'Term';

EXEC sp_addextendedproperty 'MS_Description', 'Definition of term', 'schema', 'ODM2CV', 
	'table', 'CVTerms', 'column', 'Definition';

EXEC sp_addextendedproperty 'MS_Description', 'Name of the ODM controlled vocabulary to which the term belongs', 'schema', 'ODM2CV', 
	'table', 'CVTerms', 'column', 'ODMVocabulary';

EXEC sp_addextendedproperty 'MS_Description', 'Name and/or description of the source vocabulary from which the term was derived', 'schema', 'ODM2CV', 
	'table', 'CVTerms', 'column', 'SourceVocabulary';

EXEC sp_addextendedproperty 'MS_Description', 'Table containing terms used in the controlled vocabularies of ODM2.', 'schema', 'ODM2CV', 
	'table', CVTerms, null, null;


/******************** Add Table: ODM2Core.ActionBy ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.ActionBy
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	AffiliationID INTEGER NOT NULL,
	IsActionLead BIT NOT NULL,
	RoleDescription VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.ActionBy ADD CONSTRAINT pkActionBy
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Core', 
	'table', 'ActionBy', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of an action.', 'schema', 'ODM2Core', 
	'table', 'ActionBy', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of a person', 'schema', 'ODM2Core', 
	'table', 'ActionBy', 'column', 'AffiliationID';

EXEC sp_addextendedproperty 'MS_Description', 'Indicator of whether the affiliated person was the lead for the action', 'schema', 'ODM2Core', 
	'table', 'ActionBy', 'column', 'IsActionLead';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a role played by a person in performing an action', 'schema', 'ODM2Core', 
	'table', 'ActionBy', 'column', 'RoleDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Affiliates people with actions and describes thier role in the action.', 'schema', 'ODM2Core', 
	'table', ActionBy, null, null;


/******************** Add Table: ODM2Core.Actions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Actions
(
	ActionID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionTypeCV VARCHAR(255) NOT NULL,
	MethodID INTEGER NOT NULL,
	BeginDateTime DATETIME NOT NULL,
	BeginDateTimeUTCOffset INTEGER NOT NULL,
	EndDateTime DATETIME NULL,
	EndDateTimeUTCOffset INTEGER NULL,
	ActionDescription VARCHAR(500) NULL,
	ActionFileLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Actions ADD CONSTRAINT pkActions
	PRIMARY KEY (ActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the type of action (e.g., observation, sample collection, sample analysis)', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'ActionTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the method used to complete the action', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'The date/time at which the action began', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'BeginDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'The UTCOffset for the BeginDateTime', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'BeginDateTimeUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'The date/time at which the action ended', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'EndDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'The UTCOffset of for the EndDateTime', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'EndDateTimeUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'Text that describes the action', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'ActionDescription';

EXEC sp_addextendedproperty 'MS_Description', 'A URL or path to a file created by or used by the Action, such as instrument output or configuration.', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'ActionFileLink';

EXEC sp_addextendedproperty 'MS_Description', 'Describes actions (e.g., observation, sample collection, sample analysis, field visits, field activities, etc.)', 'schema', 'ODM2Core', 
	'table', Actions, null, null;


/******************** Add Table: ODM2Core.Affiliations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Affiliations
(
	AffiliationID INTEGER IDENTITY (1, 1) NOT NULL,
	PersonID INTEGER NOT NULL,
	OrganizationID INTEGER NULL,
	IsPrimaryOrganizationContact BIT NULL,
	AffiliationStartDate DATE NOT NULL,
	AffiliationEndDate DATE NULL,
	PrimaryPhone VARCHAR(50) NULL,
	PrimaryEmail VARCHAR(255) NOT NULL,
	PrimaryAddress VARCHAR(255) NULL,
	PersonLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Affiliations ADD CONSTRAINT pkAffiliations
	PRIMARY KEY (AffiliationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primay key', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'AffiliationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifer for a person', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'PersonID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreigh key identifier for an organization', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'OrganizationID';

EXEC sp_addextendedproperty 'MS_Description', 'Boolean indication of whether the person is the organizations primary contact person', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'IsPrimaryOrganizationContact';

EXEC sp_addextendedproperty 'MS_Description', 'The date on which the person became affiliated with the organization', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'AffiliationStartDate';

EXEC sp_addextendedproperty 'MS_Description', 'The date on which the person''s affiliation with the organization ended', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'AffiliationEndDate';

EXEC sp_addextendedproperty 'MS_Description', 'The primary phone number of the person', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'PrimaryPhone';

EXEC sp_addextendedproperty 'MS_Description', 'The primary email address of the person', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'PrimaryEmail';

EXEC sp_addextendedproperty 'MS_Description', 'The primary mailing address of the person, including street, city, state, zip, and country', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'PrimaryAddress';

EXEC sp_addextendedproperty 'MS_Description', 'A URL for the website for a person', 'schema', 'ODM2Core', 
	'table', 'Affiliations', 'column', 'PersonLink';

EXEC sp_addextendedproperty 'MS_Description', 'Describes affiliations of people with organizations.', 'schema', 'ODM2Core', 
	'table', Affiliations, null, null;


/******************** Add Table: ODM2Core.DataSets ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.DataSets
(
	DataSetID INTEGER NOT NULL,
	DataSetUUID UniqueIdentifier NOT NULL,
	DataSetTypeCV VARCHAR(255) NOT NULL,
	DataSetCode VARCHAR(50) NOT NULL,
	DataSetTitle VARCHAR(255) NOT NULL,
	DataSetAbstract VARCHAR(500) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.DataSets ADD CONSTRAINT pkDataSets
	PRIMARY KEY (DataSetID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'DataSets', 'column', 'DataSetID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term(s) describing the Topic Category', 'schema', 'ODM2Core', 
	'table', 'DataSets', 'column', 'DataSetTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'A short text code identifying the dataset', 'schema', 'ODM2Core', 
	'table', 'DataSets', 'column', 'DataSetCode';

EXEC sp_addextendedproperty 'MS_Description', 'A text title for the dataset', 'schema', 'ODM2Core', 
	'table', 'DataSets', 'column', 'DataSetTitle';

EXEC sp_addextendedproperty 'MS_Description', 'A text abstract describing the dataset', 'schema', 'ODM2Core', 
	'table', 'DataSets', 'column', 'DataSetAbstract';

EXEC sp_addextendedproperty 'MS_Description', 'Describes groupings of observation results that can be considered "datasets"', 'schema', 'ODM2Core', 
	'table', DataSets, null, null;


/******************** Add Table: ODM2Core.DataSetsResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.DataSetsResults
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	DataSetID INTEGER NOT NULL,
	ResultID BIGINT NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.DataSetsResults ADD CONSTRAINT pkDataSetsResults
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Core', 
	'table', 'DataSetsResults', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the DataSet', 'schema', 'ODM2Core', 
	'table', 'DataSetsResults', 'column', 'DataSetID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Result', 'schema', 'ODM2Core', 
	'table', 'DataSetsResults', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Lists the Results that are grouped into a DataSet', 'schema', 'ODM2Core', 
	'table', DataSetsResults, null, null;


/******************** Add Table: ODM2Core.FeatureActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.FeatureActions
(
	FeatureActionID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.FeatureActions ADD CONSTRAINT pkFeatureActions
	PRIMARY KEY (FeatureActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Core', 
	'table', 'FeatureActions', 'column', 'FeatureActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the SamplingFeature on which or at which the Action was performed', 'schema', 'ODM2Core', 
	'table', 'FeatureActions', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Action that was performed', 'schema', 'ODM2Core', 
	'table', 'FeatureActions', 'column', 'ActionID';


/******************** Add Table: ODM2Core.Methods ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Methods
(
	MethodID INTEGER IDENTITY (1, 1) NOT NULL,
	MethodTypeCV VARCHAR(255) NOT NULL,
	MethodCode VARCHAR(50) NOT NULL,
	MethodName VARCHAR(255) NOT NULL,
	MethodDescription VARCHAR(500) NULL,
	MethodLink VARCHAR(255) NULL,
	OrganizationID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Methods ADD CONSTRAINT pkMethods
	PRIMARY KEY (MethodID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'Methods', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the type of method (e.g., sample collection, laboratory analytical, field, sample prepratation, etc.)', 'schema', 'ODM2Core', 
	'table', 'Methods', 'column', 'MethodTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'A text code identifiying the method (e.g., EPA 650.2)', 'schema', 'ODM2Core', 
	'table', 'Methods', 'column', 'MethodCode';

EXEC sp_addextendedproperty 'MS_Description', 'Full text name of the method', 'schema', 'ODM2Core', 
	'table', 'Methods', 'column', 'MethodName';

EXEC sp_addextendedproperty 'MS_Description', 'Full text description of the method', 'schema', 'ODM2Core', 
	'table', 'Methods', 'column', 'MethodDescription';

EXEC sp_addextendedproperty 'MS_Description', 'A URL to a full description of the method', 'schema', 'ODM2Core', 
	'table', 'Methods', 'column', 'MethodLink';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Organization with which the method is affiliated', 'schema', 'ODM2Core', 
	'table', 'Methods', 'column', 'OrganizationID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes methods used to perform actions recorded in ODM (e.g., observation methods, sample analysis methods, sample preparation methods, etc.)', 'schema', 'ODM2Core', 
	'table', Methods, null, null;


/******************** Add Table: ODM2Core.Organizations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Organizations
(
	OrganizationID INTEGER IDENTITY (1, 1) NOT NULL,
	OrganizationTypeCV VARCHAR(255) NOT NULL,
	OrganizationCode VARCHAR(50) NOT NULL,
	OrganizationName VARCHAR(255) NOT NULL,
	OrganizationDescription VARCHAR(500) NULL,
	OrganizationLink VARCHAR(255) NULL,
	ParentOrganizationID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Organizations ADD CONSTRAINT pkOrganizations
	PRIMARY KEY (OrganizationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'Organizations', 'column', 'OrganizationID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term defining the type of organization (e.g., government agency, university, etc.)', 'schema', 'ODM2Core', 
	'table', 'Organizations', 'column', 'OrganizationTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'A text code identifying the Organization (e.g., USGS)', 'schema', 'ODM2Core', 
	'table', 'Organizations', 'column', 'OrganizationCode';

EXEC sp_addextendedproperty 'MS_Description', 'The full text name of the organization', 'schema', 'ODM2Core', 
	'table', 'Organizations', 'column', 'OrganizationName';

EXEC sp_addextendedproperty 'MS_Description', 'A text description of the organization', 'schema', 'ODM2Core', 
	'table', 'Organizations', 'column', 'OrganizationDescription';

EXEC sp_addextendedproperty 'MS_Description', 'A URL for the organization''s website', 'schema', 'ODM2Core', 
	'table', 'Organizations', 'column', 'OrganizationLink';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the parent organization of the current organization', 'schema', 'ODM2Core', 
	'table', 'Organizations', 'column', 'ParentOrganizationID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes organizations - as in research groups, companies, universities, etc.', 'schema', 'ODM2Core', 
	'table', Organizations, null, null;


/******************** Add Table: ODM2Core.People ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.People
(
	PersonID INTEGER IDENTITY (1, 1) NOT NULL,
	PersonFirstName VARCHAR(255) NOT NULL,
	PersonMiddleName VARCHAR(255) NULL,
	PersonLastName VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.People ADD CONSTRAINT pkPeople
	PRIMARY KEY (PersonID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary Key', 'schema', 'ODM2Core', 
	'table', 'People', 'column', 'PersonID';

EXEC sp_addextendedproperty 'MS_Description', 'First name of the person', 'schema', 'ODM2Core', 
	'table', 'People', 'column', 'PersonFirstName';

EXEC sp_addextendedproperty 'MS_Description', 'Middle name of the person', 'schema', 'ODM2Core', 
	'table', 'People', 'column', 'PersonMiddleName';

EXEC sp_addextendedproperty 'MS_Description', 'Last name of the person', 'schema', 'ODM2Core', 
	'table', 'People', 'column', 'PersonLastName';

EXEC sp_addextendedproperty 'MS_Description', 'Describes people.', 'schema', 'ODM2Core', 
	'table', People, null, null;


/******************** Add Table: ODM2Core.ProcessingLevels ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.ProcessingLevels
(
	ProcessingLevelID INTEGER IDENTITY (1, 1) NOT NULL,
	ProcessingLevelCode VARCHAR(50) NOT NULL,
	Definition VARCHAR(500) NULL,
	Explanation VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.ProcessingLevels ADD CONSTRAINT pkProcessingLevels
	PRIMARY KEY (ProcessingLevelID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Core', 
	'table', 'ProcessingLevels', 'column', 'ProcessingLevelID';

EXEC sp_addextendedproperty 'MS_Description', 'Text code identifying the level of processing the Result has been subject to', 'schema', 'ODM2Core', 
	'table', 'ProcessingLevels', 'column', 'ProcessingLevelCode';

EXEC sp_addextendedproperty 'MS_Description', 'Text defintion of the processing level', 'schema', 'ODM2Core', 
	'table', 'ProcessingLevels', 'column', 'Definition';

EXEC sp_addextendedproperty 'MS_Description', 'Text explanation of the processing level', 'schema', 'ODM2Core', 
	'table', 'ProcessingLevels', 'column', 'Explanation';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the processing level of Results', 'schema', 'ODM2Core', 
	'table', ProcessingLevels, null, null;


/******************** Add Table: ODM2Core.RelatedActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.RelatedActions
(
	RelationID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedActionID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.RelatedActions ADD CONSTRAINT pkRelatedActions
	PRIMARY KEY (RelationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a relationship table (i.e. named "Related...").', 'schema', 'ODM2Core', 
	'table', 'RelatedActions', 'column', 'RelationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Action', 'schema', 'ODM2Core', 
	'table', 'RelatedActions', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the relationship between two Actions', 'schema', 'ODM2Core', 
	'table', 'RelatedActions', 'column', 'RelationshipTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Action related to the Action identified by ActionID', 'schema', 'ODM2Core', 
	'table', 'RelatedActions', 'column', 'RelatedActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes Actions that are related to one another.', 'schema', 'ODM2Core', 
	'table', RelatedActions, null, null;


/******************** Add Table: ODM2Core.Results ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Results
(
	ResultID BIGINT IDENTITY (1, 1) NOT NULL,
	ResultUUID UniqueIdentifier NOT NULL,
	FeatureActionID INTEGER NOT NULL,
	ResultTypeCV VARCHAR(255) NOT NULL,
	VariableID INTEGER NOT NULL,
	UnitsID INTEGER NOT NULL,
	TaxonomicClassifierID INTEGER NULL,
	ProcessingLevelID INTEGER NOT NULL,
	ResultDateTime DATETIME NULL,
	ResultDateTimeUTCOffset BIGINT NULL,
	ValidDateTime DATETIME NULL,
	ValidDateTimeUTCOffset BIGINT NULL,
	StatusCV VARCHAR(255) NULL,
	SampledMediumCV VARCHAR(255) NOT NULL,
	ValueCount INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT pkResults
	PRIMARY KEY (ResultID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Universally unique identifier for the Result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ResultUUID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the combinaton of SamplingFeature and Action that created the Result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'FeatureActionID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the result type (e.g., time series, measurement, etc.)', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ResultTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Variable of the result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Units of the result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'UnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a TaxonomicClassifier for the variable (if one exists)', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'TaxonomicClassifierID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the ProcessingLevel of the result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ProcessingLevelID';

EXEC sp_addextendedproperty 'MS_Description', 'Date and time at which the result became available (could be used as analysis time for samples)', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ResultDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'UTDCOffset of ResultDateTime', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ResultDateTimeUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'Date and time for which the result is valid (e.g., for a forecast result).  Should probably be expressed as a duration', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ValidDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'UTCOffset of ValidDateTime', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ValidDateTimeUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'Status of the result (e.g., finished, ongoing, etc.)', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'StatusCV';

EXEC sp_addextendedproperty 'MS_Description', 'CV term defining the environmental medium that the result represents (e.g., air, soil, water)', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'SampledMediumCV';

EXEC sp_addextendedproperty 'MS_Description', 'Number of data values contained within the result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ValueCount';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the results of observation actions (e.g., groups of one or more numeric data values that result from an observation action)', 'schema', 'ODM2Core', 
	'table', Results, null, null;


/******************** Add Table: ODM2Core.SamplingFeatures ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.SamplingFeatures
(
	SamplingFeatureID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureTypeCV VARCHAR(255) NOT NULL,
	SamplingFeatureCode VARCHAR(50) NOT NULL,
	SamplingFeatureName VARCHAR(255) NULL,
	SamplingFeatureDescription VARCHAR(500) NULL,
	SamplingFeatureGeotypeCV VARCHAR(255) NULL,
	FeatureGeometry GEOMETRY NULL,
	Elevation_m FLOAT NULL,
	ElevationDatumCV VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.SamplingFeatures ADD CONSTRAINT pkSamplingFeatures
	PRIMARY KEY (SamplingFeatureID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key.', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term descripting the type of sampling feature.', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'SamplingFeatureTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'A short but meaningful text identifier for the sampling feature.', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'SamplingFeatureCode';

EXEC sp_addextendedproperty 'MS_Description', 'Sampling Feature name (free text).', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'SamplingFeatureName';

EXEC sp_addextendedproperty 'MS_Description', 'Text describing the sampling feature.', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'SamplingFeatureDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Dimensionality of SamplingFeature; point2d, line2d, etc.', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'SamplingFeatureGeotypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'The location geometry of the sampling feature on the Earth. Can be a Point, Curve (profile, trajectory, etc), Surface (flat polygons, etc) or Solid/Volume (although often limited to 2D geometries). ', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'FeatureGeometry';

EXEC sp_addextendedproperty 'MS_Description', 'The elevation of the sampling feature in meters, or in the case of Specimen, the elevation from where the SamplingFeature.Specimen was collected', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'Elevation_m';

EXEC sp_addextendedproperty 'MS_Description', 'The code for the vertical geodetic datum that specifies the zero point for the Sampling Feature Elevation.', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'ElevationDatumCV';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the sampling features on which observations are made.', 'schema', 'ODM2Core', 
	'table', SamplingFeatures, null, null;


/******************** Add Table: ODM2Core.TaxonomicClassifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.TaxonomicClassifiers
(
	TaxonomicClassifierID INTEGER NOT NULL,
	TaxonomicClassifierTypeCV VARCHAR(255) NOT NULL,
	TaxonomicClassifierName VARCHAR(255) NOT NULL,
	TaxonomicClassifierCommonName VARCHAR(255) NULL,
	TaxonomicClassifierDescription VARCHAR(500) NULL,
	ParentTaxonomicClassifierID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.TaxonomicClassifiers ADD CONSTRAINT pkTaxonomicClassifiers
	PRIMARY KEY (TaxonomicClassifierID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'ID', 'schema', 'ODM2Core', 
	'table', 'TaxonomicClassifiers', 'column', 'TaxonomicClassifierID';

EXEC sp_addextendedproperty 'MS_Description', 'Controlled Vocabulary for the type of taxonomy', 'schema', 'ODM2Core', 
	'table', 'TaxonomicClassifiers', 'column', 'TaxonomicClassifierTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Taxonomic classification', 'schema', 'ODM2Core', 
	'table', 'TaxonomicClassifiers', 'column', 'TaxonomicClassifierName';

EXEC sp_addextendedproperty 'MS_Description', 'Taxonomic classification using a common name', 'schema', 'ODM2Core', 
	'table', 'TaxonomicClassifiers', 'column', 'TaxonomicClassifierCommonName';

EXEC sp_addextendedproperty 'MS_Description', 'Description or remarks about Taxonomic Classifier', 'schema', 'ODM2Core', 
	'table', 'TaxonomicClassifiers', 'column', 'TaxonomicClassifierDescription';

EXEC sp_addextendedproperty 'MS_Description', 'ID of the Classifier that is one higher level in the taxonomic hiearchy', 'schema', 'ODM2Core', 
	'table', 'TaxonomicClassifiers', 'column', 'ParentTaxonomicClassifierID';


/******************** Add Table: ODM2Core.Units ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Units
(
	UnitsID INTEGER IDENTITY (1, 1) NOT NULL,
	UnitsTypeCV VARCHAR(255) NOT NULL,
	UnitsAbbreviation VARCHAR(50) NOT NULL,
	UnitsName VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Units ADD CONSTRAINT pkUnits
	PRIMARY KEY (UnitsID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'Units', 'column', 'UnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term that defines the unit type', 'schema', 'ODM2Core', 
	'table', 'Units', 'column', 'UnitsTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Text abbreviation for the unit', 'schema', 'ODM2Core', 
	'table', 'Units', 'column', 'UnitsAbbreviation';

EXEC sp_addextendedproperty 'MS_Description', 'Text name for the unit', 'schema', 'ODM2Core', 
	'table', 'Units', 'column', 'UnitsName';

EXEC sp_addextendedproperty 'MS_Description', 'Describes units of measure for varibles and time', 'schema', 'ODM2Core', 
	'table', Units, null, null;


/******************** Add Table: ODM2Core.Variables ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Variables
(
	VariableID INTEGER IDENTITY (1, 1) NOT NULL,
	VariableTypeCV VARCHAR(255) NOT NULL,
	VariableCode VARCHAR(50) NOT NULL,
	VariableNameCV VARCHAR(255) NOT NULL,
	VariableDefinition VARCHAR(500) NULL,
	SpeciationCV VARCHAR(255) NULL,
	NoDataValue FLOAT NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Variables ADD CONSTRAINT pkVariables
	PRIMARY KEY (VariableID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Controlled vocabulary for the type of variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Unique text code for the variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableCode';

EXEC sp_addextendedproperty 'MS_Description', 'Controlled vocabulary for the name of the variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableNameCV';

EXEC sp_addextendedproperty 'MS_Description', 'Text definition of the variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableDefinition';

EXEC sp_addextendedproperty 'MS_Description', 'Speciation for the variable (e.g., expressed as P or as PO4)', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'SpeciationCV';

EXEC sp_addextendedproperty 'MS_Description', 'A numeric value indicating no data.', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'NoDataValue';

EXEC sp_addextendedproperty 'MS_Description', 'Stores information about measured properties.', 'schema', 'ODM2Core', 
	'table', Variables, null, null;


/******************** Add Table: ODM2DataQuality.DataQuality ************************/

/* Build Table Structure */
CREATE TABLE ODM2DataQuality.DataQuality
(
	DataQualityID INTEGER NOT NULL,
	DataQualityTypeCV VARCHAR(255) NOT NULL,
	DataQualityCode VARCHAR(255) NOT NULL,
	DataQualityValue FLOAT NULL,
	DataQualityValueUnitsID INTEGER NULL,
	DataQualityDescription VARCHAR(500) NULL,
	DataQualityLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2DataQuality.DataQuality ADD CONSTRAINT pkDataQuality
	PRIMARY KEY (DataQualityID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary Key for DataQuality entity', 'schema', 'ODM2DataQuality', 
	'table', 'DataQuality', 'column', 'DataQualityID';

EXEC sp_addextendedproperty 'MS_Description', '	i.e. Precision_2sigma, MethodDetectionLimit, ReportingLevel, 95%ConfidenceNoFalsePositives.', 'schema', 'ODM2DataQuality', 
	'table', 'DataQuality', 'column', 'DataQualityTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Code for DataQualityType', 'schema', 'ODM2DataQuality', 
	'table', 'DataQuality', 'column', 'DataQualityCode';

EXEC sp_addextendedproperty 'MS_Description', 'Numeric value of the DataQuality', 'schema', 'ODM2DataQuality', 
	'table', 'DataQuality', 'column', 'DataQualityValue';

EXEC sp_addextendedproperty 'MS_Description', 'Units for the DataQualityValue', 'schema', 'ODM2DataQuality', 
	'table', 'DataQuality', 'column', 'DataQualityValueUnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the DataQuality metadata', 'schema', 'ODM2DataQuality', 
	'table', 'DataQuality', 'column', 'DataQualityDescription';

EXEC sp_addextendedproperty 'MS_Description', 'URL or path to a file or other resource supporting the DataQuality metadata', 'schema', 'ODM2DataQuality', 
	'table', 'DataQuality', 'column', 'DataQualityLink';


/******************** Add Table: ODM2DataQuality.ReferenceMaterialValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2DataQuality.ReferenceMaterialValues
(
	ReferenceMaterialValueID INTEGER NOT NULL,
	ReferenceMaterialID INTEGER NOT NULL,
	ReferenceMaterialValue FLOAT NOT NULL,
	ReferenceMaterialAccuracy FLOAT NULL,
	VariableID INTEGER NOT NULL,
	UnitsID INTEGER NOT NULL,
	CitationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2DataQuality.ReferenceMaterialValues ADD CONSTRAINT pkReferenceMaterialValues
	PRIMARY KEY (ReferenceMaterialValueID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'The primary key for ReferenceMaterialValues', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterialValues', 'column', 'ReferenceMaterialValueID';

EXEC sp_addextendedproperty 'MS_Description', 'A foreign key to ReferenceMaterials', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterialValues', 'column', 'ReferenceMaterialID';

EXEC sp_addextendedproperty 'MS_Description', 'The established property value for the ReferenceMaterial.', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterialValues', 'column', 'ReferenceMaterialValue';

EXEC sp_addextendedproperty 'MS_Description', 'The established accuracy of the property value for the ReferenceMaterial, in the same units as the value.', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterialValues', 'column', 'ReferenceMaterialAccuracy';

EXEC sp_addextendedproperty 'MS_Description', 'The property that is quantified by the ReferenceMaterialValue', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterialValues', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'The units for the ReferenceMaterialValue and ReferenceMaterialAccuracy', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterialValues', 'column', 'UnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'The attribution for source that established the ReferenceMaterialValue and ReferenceMaterialAccuracy', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterialValues', 'column', 'CitationID';

EXEC sp_addextendedproperty 'MS_Description', '"Accepted" property values for a Reference Material, which can be certified by an agency or vendor, established in the literature by the research community, or developed for "in house" use only by a laboratory.', 'schema', 'ODM2DataQuality', 
	'table', ReferenceMaterialValues, null, null;


/******************** Add Table: ODM2DataQuality.ReferenceMaterials ************************/

/* Build Table Structure */
CREATE TABLE ODM2DataQuality.ReferenceMaterials
(
	ReferenceMaterialID INTEGER NOT NULL,
	ReferenceMaterialMediumCV VARCHAR(255) NOT NULL,
	ReferenceMaterialOrganizationID INTEGER NOT NULL,
	ReferenceMaterialCode VARCHAR(50) NOT NULL,
	ReferenceMaterialLotCode VARCHAR(255) NULL,
	ReferenceMaterialPurchaseDate DATETIME NULL,
	ReferenceMaterialExpirationDate DATETIME NULL,
	ReferenceMaterialCertificateLink VARCHAR(255) NULL,
	SamplingFeatureID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2DataQuality.ReferenceMaterials ADD CONSTRAINT pkReferenceMaterials
	PRIMARY KEY (ReferenceMaterialID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'The primary key to the Reference Material used to calibrate an instrument, assess a measurement method, or assign values to unknown specimens', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterials', 'column', 'ReferenceMaterialID';

EXEC sp_addextendedproperty 'MS_Description', 'The medium of a Reference Material, from the same CV as SpecimenMediumCV. Examples include: water, sediment, air, tissue, etc.', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterials', 'column', 'ReferenceMaterialMediumCV';

EXEC sp_addextendedproperty 'MS_Description', 'A foreign key to the Organization that manufactured and established property values for the ReferenceMaterial', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterials', 'column', 'ReferenceMaterialOrganizationID';

EXEC sp_addextendedproperty 'MS_Description', 'A code or short name used to identify the reference material.', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterials', 'column', 'ReferenceMaterialCode';

EXEC sp_addextendedproperty 'MS_Description', 'The lot, or manufactured batch, of the reference material, that is often associated with a certified set of property values', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterials', 'column', 'ReferenceMaterialLotCode';

EXEC sp_addextendedproperty 'MS_Description', 'The purchase date of a reference material, when applicable', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterials', 'column', 'ReferenceMaterialPurchaseDate';

EXEC sp_addextendedproperty 'MS_Description', 'The expiration date of a reference material, when applicable', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterials', 'column', 'ReferenceMaterialExpirationDate';

EXEC sp_addextendedproperty 'MS_Description', 'A URL or file path to the Certificate that provides established property values for the given lot number.', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterials', 'column', 'ReferenceMaterialCertificateLink';

EXEC sp_addextendedproperty 'MS_Description', 'A foreign key to SamplingFeatures.  Only required when the ReferenceMaterial is Analyzed as if it were an unknown specimen.', 'schema', 'ODM2DataQuality', 
	'table', 'ReferenceMaterials', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes materials that are used for the calibration of an instrument, the assessment of a measurement method, or for assigning values to unknown specimens.', 'schema', 'ODM2DataQuality', 
	'table', ReferenceMaterials, null, null;


/******************** Add Table: ODM2DataQuality.ResultNormalizationValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2DataQuality.ResultNormalizationValues
(
	ResultID BIGINT NOT NULL,
	NormalizedByReferenceMaterialValueID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2DataQuality.ResultNormalizationValues ADD CONSTRAINT pkResultNormalizationValues
	PRIMARY KEY (ResultID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2DataQuality', 
	'table', 'ResultNormalizationValues', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Extends the Results table with a foreign key to NormalizationReferenceMaterialValues when the optional DataQuality schema is implemented.  In a database implementation, we would not implement this as a separate table from Results.', 'schema', 'ODM2DataQuality', 
	'table', ResultNormalizationValues, null, null;


/******************** Add Table: ODM2DataQuality.ResultsDataQuality ************************/

/* Build Table Structure */
CREATE TABLE ODM2DataQuality.ResultsDataQuality
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	DataQualityID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2DataQuality.ResultsDataQuality ADD CONSTRAINT pkResultsDataQuality
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2DataQuality', 
	'table', 'ResultsDataQuality', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Result', 'schema', 'ODM2DataQuality', 
	'table', 'ResultsDataQuality', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the DataQuality entity.', 'schema', 'ODM2DataQuality', 
	'table', 'ResultsDataQuality', 'column', 'DataQualityID';


/******************** Add Table: ODM2Equipment.CalibrationActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.CalibrationActions
(
	ActionID INTEGER NOT NULL,
	CalibrationCheckValue FLOAT NULL,
	InstrumentOutputVariableID INTEGER NOT NULL,
	CalibrationEquation VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.CalibrationActions ADD CONSTRAINT pkCalibrationActions
	PRIMARY KEY (ActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Information about calibration Actions', 'schema', 'ODM2Equipment', 
	'table', CalibrationActions, null, null;


/******************** Add Table: ODM2Equipment.CalibrationReferenceEquipment ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.CalibrationReferenceEquipment
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	EquipmentID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.CalibrationReferenceEquipment ADD CONSTRAINT pkCalibrationReferenceEquipment
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier ', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationReferenceEquipment', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Calibration Action', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationReferenceEquipment', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Equipment used in the Calibration Action', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationReferenceEquipment', 'column', 'EquipmentID';

EXEC sp_addextendedproperty 'MS_Description', 'Information about equipment used as referenece for a calibration', 'schema', 'ODM2Equipment', 
	'table', CalibrationReferenceEquipment, null, null;


/******************** Add Table: ODM2Equipment.CalibrationStandards ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.CalibrationStandards
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	ReferenceMaterialID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.CalibrationStandards ADD CONSTRAINT pkCalibrationStandards
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationStandards', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the calibration Action', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationStandards', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the ReferenceMaterial used in the calibration', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationStandards', 'column', 'ReferenceMaterialID';

EXEC sp_addextendedproperty 'MS_Description', 'Bridge table linking field calibrations to the reference materials used', 'schema', 'ODM2Equipment', 
	'table', CalibrationStandards, null, null;


/******************** Add Table: ODM2Equipment.DataLoggerFiles ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.DataLoggerFiles
(
	DataLoggerFileID INTEGER IDENTITY (1, 1) NOT NULL,
	ProgramID INTEGER NOT NULL,
	DataLoggerFileName VARCHAR(255) NOT NULL,
	DataLoggerFileDescription VARCHAR(500) NULL,
	DataLoggerFileLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.DataLoggerFiles ADD CONSTRAINT pkDataLoggerFiles
	PRIMARY KEY (DataLoggerFileID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Equipment', 
	'table', 'DataLoggerFiles', 'column', 'DataLoggerFileID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the datalogger program that created the file', 'schema', 'ODM2Equipment', 
	'table', 'DataLoggerFiles', 'column', 'ProgramID';

EXEC sp_addextendedproperty 'MS_Description', 'Text name of the datalogger file', 'schema', 'ODM2Equipment', 
	'table', 'DataLoggerFiles', 'column', 'DataLoggerFileName';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the datalogger file', 'schema', 'ODM2Equipment', 
	'table', 'DataLoggerFiles', 'column', 'DataLoggerFileDescription';

EXEC sp_addextendedproperty 'MS_Description', 'URL or file path to the datalogger file', 'schema', 'ODM2Equipment', 
	'table', 'DataLoggerFiles', 'column', 'DataLoggerFileLink';

EXEC sp_addextendedproperty 'MS_Description', 'Destibes datalogger files created by a deployment action', 'schema', 'ODM2Equipment', 
	'table', DataLoggerFiles, null, null;


/******************** Add Table: ODM2Equipment.DataloggerFileColumns ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.DataloggerFileColumns
(
	DataloggerFileColumnID INTEGER IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NULL,
	DataLoggerFileID INTEGER NOT NULL,
	InstrumentOutputVariableID INTEGER NOT NULL,
	ColumnLabel VARCHAR(50) NOT NULL,
	ColumnDescription VARCHAR(500) NULL,
	MeasurementEquation VARCHAR(255) NULL,
	ScanInterval FLOAT NULL,
	ScanIntervalUnitsID INTEGER NULL,
	RecordingInterval FLOAT NULL,
	RecordingIntervalUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.DataloggerFileColumns ADD CONSTRAINT pkDataloggerFileColumns
	PRIMARY KEY (DataloggerFileColumnID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'DataloggerFileColumnID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Result associated with the datalogger file column', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the datalogger file in which the column appears', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'DataLoggerFileID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the instrument output variable recorded in the column', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'InstrumentOutputVariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Text column label', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'ColumnLabel';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the contents of the column', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'ColumnDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Text specificaiton of the equation used to calculate the column contents', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'MeasurementEquation';

EXEC sp_addextendedproperty 'MS_Description', 'Scanning time interval used in the datalogger program', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'ScanInterval';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Units of the scanning time interval', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'ScanIntervalUnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Recording time interval used in the datalogger program', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'RecordingInterval';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Units of the recording time interval', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerFileColumns', 'column', 'RecordingIntervalUnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Information about columns in datalogger files', 'schema', 'ODM2Equipment', 
	'table', DataloggerFileColumns, null, null;


/******************** Add Table: ODM2Equipment.DataloggerProgramFiles ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.DataloggerProgramFiles
(
	ProgramID INTEGER IDENTITY (1, 1) NOT NULL,
	AffiliationID INTEGER NOT NULL,
	ProgramName VARCHAR(255) NOT NULL,
	ProgramDescription VARCHAR(500) NULL,
	ProgramVersion VARCHAR(50) NULL,
	ProgramFileLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.DataloggerProgramFiles ADD CONSTRAINT pkDataloggerProgramFiles
	PRIMARY KEY (ProgramID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerProgramFiles', 'column', 'ProgramID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the affiliation for the person that created the program', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerProgramFiles', 'column', 'AffiliationID';

EXEC sp_addextendedproperty 'MS_Description', 'Text name of the datalogger program file', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerProgramFiles', 'column', 'ProgramName';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the datalogger program file', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerProgramFiles', 'column', 'ProgramDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the version of the datalogger program file', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerProgramFiles', 'column', 'ProgramVersion';

EXEC sp_addextendedproperty 'MS_Description', 'URL or file path to the datalogger program file', 'schema', 'ODM2Equipment', 
	'table', 'DataloggerProgramFiles', 'column', 'ProgramFileLink';

EXEC sp_addextendedproperty 'MS_Description', 'Information about datalogger program files', 'schema', 'ODM2Equipment', 
	'table', DataloggerProgramFiles, null, null;


/******************** Add Table: ODM2Equipment.Equipment ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.Equipment
(
	EquipmentID INTEGER IDENTITY (1, 1) NOT NULL,
	EquipmentCode VARCHAR(50) NOT NULL,
	EquipmentName VARCHAR(255) NOT NULL,
	EquipmentTypeCV VARCHAR(255) NOT NULL,
	EquipmentModelID INTEGER NOT NULL,
	EquipmentSerialNumber VARCHAR(50) NOT NULL,
	EquipmentOwnerID INTEGER NOT NULL,
	EquipmentVendorID INTEGER NOT NULL,
	EquipmentPurchaseDate DATETIME NOT NULL,
	EquipmentPurchaseOrderNumber VARCHAR(50) NULL,
	EquipmentDescription VARCHAR(500) NULL,
	EquipmentDocumentationLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.Equipment ADD CONSTRAINT pkEquipment
	PRIMARY KEY (EquipmentID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentID';

EXEC sp_addextendedproperty 'MS_Description', 'A text code that identifies the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentCode';

EXEC sp_addextendedproperty 'MS_Description', 'A text name for the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentName';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the equipment type (e.g., sensor, datalogger, solar panel, etc.)', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the model of the equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentModelID';

EXEC sp_addextendedproperty 'MS_Description', 'Manufacturer''s serial number for the specific piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentSerialNumber';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifer for the person that owns the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentOwnerID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the vendor organization for the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentVendorID';

EXEC sp_addextendedproperty 'MS_Description', 'Date that the piece of equipment was purchased', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentPurchaseDate';

EXEC sp_addextendedproperty 'MS_Description', 'A text string identifying the purchase order used to purchase the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentPurchaseOrderNumber';

EXEC sp_addextendedproperty 'MS_Description', 'Text notes about the specific piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentDescription';

EXEC sp_addextendedproperty 'MS_Description', 'A file name, path, or URL to a photo of the specific piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentDocumentationLink';

EXEC sp_addextendedproperty 'MS_Description', 'Descriptions of specific pieces of equipment.', 'schema', 'ODM2Equipment', 
	'table', Equipment, null, null;


/******************** Add Table: ODM2Equipment.EquipmentModels ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.EquipmentModels
(
	EquipmentModelID INTEGER IDENTITY (1, 1) NOT NULL,
	ModelManufacturerID INTEGER NOT NULL,
	ModelPartNumber VARCHAR(50) NULL,
	ModelName VARCHAR(255) NOT NULL,
	ModelDescription VARCHAR(500) NULL,
	IsInstrument BIT NOT NULL,
	ModelSpecificationsFileLink VARCHAR(255) NULL,
	ModelLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.EquipmentModels ADD CONSTRAINT pkEquipmentModels
	PRIMARY KEY (EquipmentModelID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'EquipmentModelID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the model manufacturer', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelManufacturerID';

EXEC sp_addextendedproperty 'MS_Description', 'Text string for a part number for the equipment model', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelPartNumber';

EXEC sp_addextendedproperty 'MS_Description', 'Text name of the equipment model', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelName';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the equipment model', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelDescription';

EXEC sp_addextendedproperty 'MS_Description', 'A boolean indication of whether the equipment is a sensor/instrument used to make observations', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'IsInstrument';

EXEC sp_addextendedproperty 'MS_Description', 'File name, path, or URL to a specifications file for the equipment', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelSpecificationsFileLink';

EXEC sp_addextendedproperty 'MS_Description', 'A URL to a website or file having a description of the equipment model', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelLink';

EXEC sp_addextendedproperty 'MS_Description', 'Describes models of sensors, loggers, and related equipment used in making observations.', 'schema', 'ODM2Equipment', 
	'table', EquipmentModels, null, null;


/******************** Add Table: ODM2Equipment.EquipmentUsed ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.EquipmentUsed
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	EquipmentID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.EquipmentUsed ADD CONSTRAINT pkEquipmentUsed
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentUsed', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Action', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentUsed', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Equipment entity associated with the Action', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentUsed', 'column', 'EquipmentID';


/******************** Add Table: ODM2Equipment.InstrumentOutputVariables ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.InstrumentOutputVariables
(
	InstrumentOutputVariableID INTEGER IDENTITY (1, 1) NOT NULL,
	ModelID INTEGER NOT NULL,
	VariableID INTEGER NOT NULL,
	InstrumentMethodID INTEGER NOT NULL,
	InstrumentResolution VARCHAR(255) NULL,
	InstrumentAccuracy VARCHAR(255) NULL,
	InstrumentRawOutputUnitsID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.InstrumentOutputVariables ADD CONSTRAINT pkInstrumentOutputVariables
	PRIMARY KEY (InstrumentOutputVariableID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'InstrumentOutputVariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Equipment Model', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'ModelID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Variable output by the Equipment Model', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Method used to output the Variable from the Equipment Model', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'InstrumentMethodID';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the resolution of the output variable', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'InstrumentResolution';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the accuracy of the output variable', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'InstrumentAccuracy';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the raw output Units associated with the output variable', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'InstrumentRawOutputUnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Information about the Variables that an instrument is capable of measuring', 'schema', 'ODM2Equipment', 
	'table', InstrumentOutputVariables, null, null;


/******************** Add Table: ODM2Equipment.MaintenanceActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.MaintenanceActions
(
	ActionID INTEGER NOT NULL,
	IsFactoryService BIT NOT NULL,
	MaintenanceCode VARCHAR(50) NULL,
	MaintenanceReason VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.MaintenanceActions ADD CONSTRAINT pkMaintenanceActions
	PRIMARY KEY (ActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key and foreign key idenfier of the Equipment MaintenanceAction', 'schema', 'ODM2Equipment', 
	'table', 'MaintenanceActions', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Boolean indicator of whether the Action is a factory service', 'schema', 'ODM2Equipment', 
	'table', 'MaintenanceActions', 'column', 'IsFactoryService';

EXEC sp_addextendedproperty 'MS_Description', 'Text code assigned to the service performed', 'schema', 'ODM2Equipment', 
	'table', 'MaintenanceActions', 'column', 'MaintenanceCode';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of why the service Action was required', 'schema', 'ODM2Equipment', 
	'table', 'MaintenanceActions', 'column', 'MaintenanceReason';

EXEC sp_addextendedproperty 'MS_Description', 'Information about maintenance Actions performed on Equipment', 'schema', 'ODM2Equipment', 
	'table', MaintenanceActions, null, null;


/******************** Add Table: ODM2Equipment.RelatedEquipment ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.RelatedEquipment
(
	RelationID INTEGER IDENTITY (1, 1) NOT NULL,
	EquipmentID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedEquipmentID INTEGER NOT NULL,
	RelationshipStartDateTime DATETIME NOT NULL,
	RelationshipStartDateTimeUTCOffset INTEGER NOT NULL,
	RelationshipEndDateTime DATETIME NULL,
	RelationshipEndDateTimeUTCOffset INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.RelatedEquipment ADD CONSTRAINT pkRelatedEquipment
	PRIMARY KEY (RelationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Equipment', 
	'table', 'RelatedEquipment', 'column', 'RelationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a piece of Equipment', 'schema', 'ODM2Equipment', 
	'table', 'RelatedEquipment', 'column', 'EquipmentID';

EXEC sp_addextendedproperty 'MS_Description', 'Controlled Vocabulary term indicating the type of relationship between two pieces of equipment', 'schema', 'ODM2Equipment', 
	'table', 'RelatedEquipment', 'column', 'RelationshipTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the related piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'RelatedEquipment', 'column', 'RelatedEquipmentID';

EXEC sp_addextendedproperty 'MS_Description', 'Beginning date/time of the relationship between the two pieces of equipment', 'schema', 'ODM2Equipment', 
	'table', 'RelatedEquipment', 'column', 'RelationshipStartDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'UTCOffset of the beginning date/time', 'schema', 'ODM2Equipment', 
	'table', 'RelatedEquipment', 'column', 'RelationshipStartDateTimeUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'Ending date/time of the relationship between two pieces of equipment', 'schema', 'ODM2Equipment', 
	'table', 'RelatedEquipment', 'column', 'RelationshipEndDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'UTCOffset of the ending date/time', 'schema', 'ODM2Equipment', 
	'table', 'RelatedEquipment', 'column', 'RelationshipEndDateTimeUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'Information about relationships among Equipment', 'schema', 'ODM2Equipment', 
	'table', RelatedEquipment, null, null;


/******************** Add Table: ODM2ExtensionProperties.ActionExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExtensionProperties.ActionExtensionPropertyValues
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExtensionProperties.ActionExtensionPropertyValues ADD CONSTRAINT pkActionExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ActionExtensionPropertyValues', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the Action', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ActionExtensionPropertyValues', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the extension property added to the Action', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ActionExtensionPropertyValues', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Value of the extension property added to the Action', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ActionExtensionPropertyValues', 'column', 'PropertyValue';


/******************** Add Table: ODM2ExtensionProperties.CitationExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExtensionProperties.CitationExtensionPropertyValues
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	CitationID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExtensionProperties.CitationExtensionPropertyValues ADD CONSTRAINT pkCitationExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExtensionProperties', 
	'table', 'CitationExtensionPropertyValues', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Citation being extended', 'schema', 'ODM2ExtensionProperties', 
	'table', 'CitationExtensionPropertyValues', 'column', 'CitationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Property being applied to the Citation', 'schema', 'ODM2ExtensionProperties', 
	'table', 'CitationExtensionPropertyValues', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Value of the property being applied to the Citation', 'schema', 'ODM2ExtensionProperties', 
	'table', 'CitationExtensionPropertyValues', 'column', 'PropertyValue';

EXEC sp_addextendedproperty 'MS_Description', 'Values for Citation Extension Properties', 'schema', 'ODM2ExtensionProperties', 
	'table', CitationExtensionPropertyValues, null, null;


/******************** Add Table: ODM2ExtensionProperties.ExtensionProperties ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExtensionProperties.ExtensionProperties
(
	PropertyID INTEGER IDENTITY (1, 1) NOT NULL,
	PropertyName VARCHAR(255) NOT NULL,
	PropertyDescription VARCHAR(500) NULL,
	PropertyDataTypeCV VARCHAR(255) NOT NULL,
	PropertyUnitsID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExtensionProperties.ExtensionProperties ADD CONSTRAINT pkExtensionProperties
	PRIMARY KEY (PropertyID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ExtensionProperties', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Text name of the extension property', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ExtensionProperties', 'column', 'PropertyName';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the extension property', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ExtensionProperties', 'column', 'PropertyDescription';

EXEC sp_addextendedproperty 'MS_Description', 'CV term specifying the data type of the property value', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ExtensionProperties', 'column', 'PropertyDataTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the units of the property value', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ExtensionProperties', 'column', 'PropertyUnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes extension properties added to objects in an ODM database', 'schema', 'ODM2ExtensionProperties', 
	'table', ExtensionProperties, null, null;


/******************** Add Table: ODM2ExtensionProperties.MethodExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExtensionProperties.MethodExtensionPropertyValues
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	MethodID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExtensionProperties.MethodExtensionPropertyValues ADD CONSTRAINT pkMethodExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExtensionProperties', 
	'table', 'MethodExtensionPropertyValues', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Method', 'schema', 'ODM2ExtensionProperties', 
	'table', 'MethodExtensionPropertyValues', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the extension property', 'schema', 'ODM2ExtensionProperties', 
	'table', 'MethodExtensionPropertyValues', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Text or numeric value of the extension property', 'schema', 'ODM2ExtensionProperties', 
	'table', 'MethodExtensionPropertyValues', 'column', 'PropertyValue';

EXEC sp_addextendedproperty 'MS_Description', 'Links extnsion properties to a Method', 'schema', 'ODM2ExtensionProperties', 
	'table', MethodExtensionPropertyValues, null, null;


/******************** Add Table: ODM2ExtensionProperties.ResultExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExtensionProperties.ResultExtensionPropertyValues
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExtensionProperties.ResultExtensionPropertyValues ADD CONSTRAINT pkResultExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ResultExtensionPropertyValues', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the result to which the extension property applies', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ResultExtensionPropertyValues', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the extension propery', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ResultExtensionPropertyValues', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Text or numeric value of the extension property', 'schema', 'ODM2ExtensionProperties', 
	'table', 'ResultExtensionPropertyValues', 'column', 'PropertyValue';

EXEC sp_addextendedproperty 'MS_Description', 'Links extension properties to a Result', 'schema', 'ODM2ExtensionProperties', 
	'table', ResultExtensionPropertyValues, null, null;


/******************** Add Table: ODM2ExtensionProperties.SamplingFeatureExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExtensionProperties.SamplingFeatureExtensionPropertyValues
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExtensionProperties.SamplingFeatureExtensionPropertyValues ADD CONSTRAINT pkSamplingFeatureExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExtensionProperties', 
	'table', 'SamplingFeatureExtensionPropertyValues', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the SamplingFeature being extended', 'schema', 'ODM2ExtensionProperties', 
	'table', 'SamplingFeatureExtensionPropertyValues', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the extension property being added to the sampling feature ', 'schema', 'ODM2ExtensionProperties', 
	'table', 'SamplingFeatureExtensionPropertyValues', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Value of the property being added to the sampling feature', 'schema', 'ODM2ExtensionProperties', 
	'table', 'SamplingFeatureExtensionPropertyValues', 'column', 'PropertyValue';


/******************** Add Table: ODM2ExtensionProperties.VariableExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExtensionProperties.VariableExtensionPropertyValues
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	VariableID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExtensionProperties.VariableExtensionPropertyValues ADD CONSTRAINT pkVariableExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExtensionProperties', 
	'table', 'VariableExtensionPropertyValues', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the variable being extended', 'schema', 'ODM2ExtensionProperties', 
	'table', 'VariableExtensionPropertyValues', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the extension property being applied to the variable', 'schema', 'ODM2ExtensionProperties', 
	'table', 'VariableExtensionPropertyValues', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Text or numeric value of the extension property for the variable', 'schema', 'ODM2ExtensionProperties', 
	'table', 'VariableExtensionPropertyValues', 'column', 'PropertyValue';


/******************** Add Table: ODM2ExternalIdentifiers.CitationExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.CitationExternalIdentifiers
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	CitationID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	CitationExternalIdentifer VARCHAR(255) NOT NULL,
	CitationExternalIdentiferURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExternalIdentifiers.CitationExternalIdentifiers ADD CONSTRAINT pkCitationExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Forign key of the Citation linked to the external identifer', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'CitationExternalIdentifiers', 'column', 'CitationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'CitationExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, such as a DOI; could be a Uniform Resource Name (URN).', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'CitationExternalIdentifiers', 'column', 'CitationExternalIdentifer';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'CitationExternalIdentifiers', 'column', 'CitationExternalIdentiferURI';


/******************** Add Table: ODM2ExternalIdentifiers.ExternalIdentifierSystems ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.ExternalIdentifierSystems
(
	ExternalIdentifierSystemID INTEGER NOT NULL,
	ExternalIdentifierSystemName VARCHAR(255) NOT NULL,
	IdentifierSystemOrganizationID INTEGER NOT NULL,
	ExternalIdentifierSystemDescription VARCHAR(500) NULL,
	ExternalIdentifierSystemURL VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExternalIdentifiers.ExternalIdentifierSystems ADD CONSTRAINT pkExternalIdentifierSystems
	PRIMARY KEY (ExternalIdentifierSystemID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ExternalIdentifierSystems', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'Defines the identifier system used (i.e. IGSN, SWRC Sample Number, etc.)', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ExternalIdentifierSystems', 'column', 'ExternalIdentifierSystemName';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key identifer for the organization overseeing or affiliated with the identifier system', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ExternalIdentifierSystems', 'column', 'IdentifierSystemOrganizationID';

EXEC sp_addextendedproperty 'MS_Description', 'Description of identifier system.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ExternalIdentifierSystems', 'column', 'ExternalIdentifierSystemDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Universal Resource Locator (URL) for resolution/translation of an identifier system''s URNs (i.e. http://dx.doi.org/ is the resolver URL for doi:10.1002/2013GL057450)', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ExternalIdentifierSystems', 'column', 'ExternalIdentifierSystemURL';

EXEC sp_addextendedproperty 'MS_Description', 'A single table for connecting various primary keys with points to outside systems.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', ExternalIdentifierSystems, null, null;


/******************** Add Table: ODM2ExternalIdentifiers.MethodExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.MethodExternalIdentifiers
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	MethodID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	MethodExternalIdentifier VARCHAR(255) NOT NULL,
	MethodExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExternalIdentifiers.MethodExternalIdentifiers ADD CONSTRAINT pkMethodExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'MethodExternalIdentifiers', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to SamplingFeatures', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'MethodExternalIdentifiers', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'MethodExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, such as a NEMI method number; could be a Uniform Resource Name (URN).', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'MethodExternalIdentifiers', 'column', 'MethodExternalIdentifier';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'MethodExternalIdentifiers', 'column', 'MethodExternalIdentifierURI';


/******************** Add Table: ODM2ExternalIdentifiers.PersonExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.PersonExternalIdentifiers
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	PersonID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	PersonExternalIdentifier VARCHAR(255) NOT NULL,
	PersonExternalIdenifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExternalIdentifiers.PersonExternalIdentifiers ADD CONSTRAINT pkPersonExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'PersonExternalIdentifiers', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to People table', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'PersonExternalIdentifiers', 'column', 'PersonID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'PersonExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, such as an IGSN; could be a Uniform Resource Name (URN).', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'PersonExternalIdentifiers', 'column', 'PersonExternalIdentifier';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'PersonExternalIdentifiers', 'column', 'PersonExternalIdenifierURI';

EXEC sp_addextendedproperty 'MS_Description', 'Cross reference "linking" table to allow many to many ', 'schema', 'ODM2ExternalIdentifiers', 
	'table', PersonExternalIdentifiers, null, null;


/******************** Add Table: ODM2ExternalIdentifiers.ReferenceMaterialExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.ReferenceMaterialExternalIdentifiers
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ReferenceMaterialID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	ReferenceMaterialExternalIdentifier VARCHAR(255) NOT NULL,
	ReferenceMaterialExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExternalIdentifiers.ReferenceMaterialExternalIdentifiers ADD CONSTRAINT pkReferenceMaterialExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ReferenceMaterialExternalIdentifiers', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ReferenceMaterials', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ReferenceMaterialExternalIdentifiers', 'column', 'ReferenceMaterialID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ReferenceMaterialExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, such as NBS-19; could be a Uniform Resource Name (URN).', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ReferenceMaterialExternalIdentifiers', 'column', 'ReferenceMaterialExternalIdentifier';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'ReferenceMaterialExternalIdentifiers', 'column', 'ReferenceMaterialExternalIdentifierURI';


/******************** Add Table: ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	SamplingFeatureExternalIdentifier VARCHAR(255) NOT NULL,
	SamplingFeatureExternalIdentiferURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers ADD CONSTRAINT pkSamplingFeatureExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SamplingFeatureExternalIdentifiers', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to SamplingFeatures', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SamplingFeatureExternalIdentifiers', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SamplingFeatureExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, such as an IGSN; could be a Uniform Resource Name (URN).', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SamplingFeatureExternalIdentifiers', 'column', 'SamplingFeatureExternalIdentifier';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SamplingFeatureExternalIdentifiers', 'column', 'SamplingFeatureExternalIdentiferURI';


/******************** Add Table: ODM2ExternalIdentifiers.SpatialReferenceExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.SpatialReferenceExternalIdentifiers
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	SpatialReferenceID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	SpatialReferenceExternalIdentifier VARCHAR(255) NOT NULL,
	SpatialReferenceExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExternalIdentifiers.SpatialReferenceExternalIdentifiers ADD CONSTRAINT pkSpatialReferenceExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SpatialReferenceExternalIdentifiers', 'column', 'BridgeID';


/******************** Add Table: ODM2ExternalIdentifiers.TaxonomicClassifierExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.TaxonomicClassifierExternalIdentifiers
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	TaxonomicClassifierID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	TaxonomicClassifierExternalIdentifier VARCHAR(255) NOT NULL,
	TaxonomicClassifierExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExternalIdentifiers.TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT pkTaxonomicClassifierExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'TaxonomicClassifierExternalIdentifiers', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to TaxonomicClassifiers', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'TaxonomicClassifierExternalIdentifiers', 'column', 'TaxonomicClassifierID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'TaxonomicClassifierExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, such as a GBIF ID; could be a Uniform Resource Name (URN).', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'TaxonomicClassifierExternalIdentifiers', 'column', 'TaxonomicClassifierExternalIdentifier';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'TaxonomicClassifierExternalIdentifiers', 'column', 'TaxonomicClassifierExternalIdentifierURI';


/******************** Add Table: ODM2ExternalIdentifiers.VariableExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.VariableExternalIdentifiers
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	VariableID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	VariableExternalIdentifer VARCHAR(255) NOT NULL,
	VariableExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2ExternalIdentifiers.VariableExternalIdentifiers ADD CONSTRAINT pkVariableExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'VariableExternalIdentifiers', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to Variables', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'VariableExternalIdentifiers', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'VariableExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID; could be a Uniform Resource Name (URN).', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'VariableExternalIdentifiers', 'column', 'VariableExternalIdentifer';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'VariableExternalIdentifiers', 'column', 'VariableExternalIdentifierURI';


/******************** Add Table: ODM2LabAnalyses.ActionDirectives ************************/

/* Build Table Structure */
CREATE TABLE ODM2LabAnalyses.ActionDirectives
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	DirectiveID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2LabAnalyses.ActionDirectives ADD CONSTRAINT pkActionDirectives
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2LabAnalyses', 
	'table', 'ActionDirectives', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Action', 'schema', 'ODM2LabAnalyses', 
	'table', 'ActionDirectives', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Directive', 'schema', 'ODM2LabAnalyses', 
	'table', 'ActionDirectives', 'column', 'DirectiveID';


/******************** Add Table: ODM2LabAnalyses.Directives ************************/

/* Build Table Structure */
CREATE TABLE ODM2LabAnalyses.Directives
(
	DirectiveID INTEGER IDENTITY (1, 1) NOT NULL,
	DirectiveTypeCV VARCHAR(255) NOT NULL,
	DirectiveDescription VARCHAR(500) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2LabAnalyses.Directives ADD CONSTRAINT pkDirectives
	PRIMARY KEY (DirectiveID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier.', 'schema', 'ODM2LabAnalyses', 
	'table', 'Directives', 'column', 'DirectiveID';

EXEC sp_addextendedproperty 'MS_Description', 'Directive type, such as project, intended analyte/analysis for a Specimen, etc.', 'schema', 'ODM2LabAnalyses', 
	'table', 'Directives', 'column', 'DirectiveTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the directive or purpose under which the action was taken.', 'schema', 'ODM2LabAnalyses', 
	'table', 'Directives', 'column', 'DirectiveDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the directive or purpose under which actions are made.  Directives can be projects, intended analyses for a specimen, etc.', 'schema', 'ODM2LabAnalyses', 
	'table', Directives, null, null;


/******************** Add Table: ODM2LabAnalyses.SpecimenBatchPostions ************************/

/* Build Table Structure */
CREATE TABLE ODM2LabAnalyses.SpecimenBatchPostions
(
	FeatureActionID INTEGER NOT NULL,
	BatchPositionNumber INTEGER NOT NULL,
	BatchPositionLabel VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2LabAnalyses.SpecimenBatchPostions ADD CONSTRAINT pkSpecimenBatchPostions
	PRIMARY KEY (FeatureActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foriegn key identifer for the Specimen Preparation or Analysis Batch', 'schema', 'ODM2LabAnalyses', 
	'table', 'SpecimenBatchPostions', 'column', 'FeatureActionID';

EXEC sp_addextendedproperty 'MS_Description', 'The position or line number of a specimen within a PreparationBatchAction or an InstrumentAnalysisAction.', 'schema', 'ODM2LabAnalyses', 
	'table', 'SpecimenBatchPostions', 'column', 'BatchPositionNumber';

EXEC sp_addextendedproperty 'MS_Description', 'The label text for a specimen within a PreparationBatchAction or an InstrumentAnalysisAction.', 'schema', 'ODM2LabAnalyses', 
	'table', 'SpecimenBatchPostions', 'column', 'BatchPositionLabel';

EXEC sp_addextendedproperty 'MS_Description', 'Extends the FeatureActions table with a foreign key when the optional LabAnalyses schema is implemented.  In a database implementation, we would not implement this as a separate table from FeatureActions, but rather just add the additional field(s).', 'schema', 'ODM2LabAnalyses', 
	'table', SpecimenBatchPostions, null, null;


/******************** Add Table: ODM2Provenance.AuthorLists ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.AuthorLists
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	CitationID INTEGER NOT NULL,
	PersonID INTEGER NOT NULL,
	AuthorOrder INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.AuthorLists ADD CONSTRAINT pkAuthorLists
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Provenance', 
	'table', 'AuthorLists', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Citation', 'schema', 'ODM2Provenance', 
	'table', 'AuthorLists', 'column', 'CitationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Person that is an author of the Citation', 'schema', 'ODM2Provenance', 
	'table', 'AuthorLists', 'column', 'PersonID';

EXEC sp_addextendedproperty 'MS_Description', 'Integer order of the authors of the Citation starting with 1 for first author', 'schema', 'ODM2Provenance', 
	'table', 'AuthorLists', 'column', 'AuthorOrder';

EXEC sp_addextendedproperty 'MS_Description', 'Relationship between Citations and their Authors', 'schema', 'ODM2Provenance', 
	'table', AuthorLists, null, null;


/******************** Add Table: ODM2Provenance.Citations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.Citations
(
	CitationID INTEGER IDENTITY (1, 1) NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Publisher VARCHAR(255) NOT NULL,
	PublicationYear INTEGER NOT NULL,
	CitationLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.Citations ADD CONSTRAINT pkCitations
	PRIMARY KEY (CitationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key identifier', 'schema', 'ODM2Provenance', 
	'table', 'Citations', 'column', 'CitationID';

EXEC sp_addextendedproperty 'MS_Description', 'Text title of the Citation', 'schema', 'ODM2Provenance', 
	'table', 'Citations', 'column', 'Title';

EXEC sp_addextendedproperty 'MS_Description', 'Text publisher of the Citation', 'schema', 'ODM2Provenance', 
	'table', 'Citations', 'column', 'Publisher';

EXEC sp_addextendedproperty 'MS_Description', 'Integer publication year (4 digits) of the Citation', 'schema', 'ODM2Provenance', 
	'table', 'Citations', 'column', 'PublicationYear';

EXEC sp_addextendedproperty 'MS_Description', 'Text link to the Citation (i.e. URL or path).', 'schema', 'ODM2Provenance', 
	'table', 'Citations', 'column', 'CitationLink';

EXEC sp_addextendedproperty 'MS_Description', 'Information about Citations', 'schema', 'ODM2Provenance', 
	'table', Citations, null, null;


/******************** Add Table: ODM2Provenance.DataSetCitations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.DataSetCitations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	DataSetID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	CitationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.DataSetCitations ADD CONSTRAINT pkDataSetCitations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Provenance', 
	'table', 'DataSetCitations', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a DataSet', 'schema', 'ODM2Provenance', 
	'table', 'DataSetCitations', 'column', 'DataSetID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the relationship between the DataSet and the Citation (e.g., "cites" or "isCitedBy"), largely conforming to CV used by DataCite.org.', 'schema', 'ODM2Provenance', 
	'table', 'DataSetCitations', 'column', 'RelationshipTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Citation that is associated with the DataSet identified by DataSetID', 'schema', 'ODM2Provenance', 
	'table', 'DataSetCitations', 'column', 'CitationID';

EXEC sp_addextendedproperty 'MS_Description', 'Relationship between DataSets and Citations', 'schema', 'ODM2Provenance', 
	'table', DataSetCitations, null, null;


/******************** Add Table: ODM2Provenance.DerivationEquations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.DerivationEquations
(
	DerivationEquationID INTEGER IDENTITY (1, 1) NOT NULL,
	DerivationEquation VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.DerivationEquations ADD CONSTRAINT pkDerivationEquations
	PRIMARY KEY (DerivationEquationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for DerivationEquations, which include calibration equations, normalizations, etc. on one or more RelatedResults to produce a DerivedResult.', 'schema', 'ODM2Provenance', 
	'table', 'DerivationEquations', 'column', 'DerivationEquationID';

EXEC sp_addextendedproperty 'MS_Description', 'Text of the equation used to derive a Result from one or more RelatedResults, where y is the DerivedResult and x1, x2, ..., xn are the RelatedResults specified in order by RelatedResultSequenceID.', 'schema', 'ODM2Provenance', 
	'table', 'DerivationEquations', 'column', 'DerivationEquation';

EXEC sp_addextendedproperty 'MS_Description', 'DerivationEquations include calibration equations, normalizations, etc. on one or more RelatedResults to produce a DerivedResult.', 'schema', 'ODM2Provenance', 
	'table', DerivationEquations, null, null;


/******************** Add Table: ODM2Provenance.MethodCitations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.MethodCitations
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	MethodID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	CitationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.MethodCitations ADD CONSTRAINT pkMethodCitations
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2Provenance', 
	'table', 'MethodCitations', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Method', 'schema', 'ODM2Provenance', 
	'table', 'MethodCitations', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the relationship between the Methods and the Citation (e.g., "References" or "isDocumentedBy"), largely conforming to CV used by DataCite.org.', 'schema', 'ODM2Provenance', 
	'table', 'MethodCitations', 'column', 'RelationshipTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Citation that is associated with the Method identified by MethodID', 'schema', 'ODM2Provenance', 
	'table', 'MethodCitations', 'column', 'CitationID';


/******************** Add Table: ODM2Provenance.RelatedAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.RelatedAnnotations
(
	RelationID INTEGER IDENTITY (1, 1) NOT NULL,
	AnnotationID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedAnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.RelatedAnnotations ADD CONSTRAINT pkRelatedAnnotations
	PRIMARY KEY (RelationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Stores information about relationships among Annotations', 'schema', 'ODM2Provenance', 
	'table', RelatedAnnotations, null, null;


/******************** Add Table: ODM2Provenance.RelatedCitations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.RelatedCitations
(
	RelationID INTEGER IDENTITY (1, 1) NOT NULL,
	CitationID INTEGER NOT NULL,
	RelationshipTypeCV INTEGER NOT NULL,
	RelatedCitationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.RelatedCitations ADD CONSTRAINT pkRelatedCitations
	PRIMARY KEY (RelationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a relationship table (i.e. named "Related...").', 'schema', 'ODM2Provenance', 
	'table', 'RelatedCitations', 'column', 'RelationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Citation', 'schema', 'ODM2Provenance', 
	'table', 'RelatedCitations', 'column', 'CitationID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the relationship between Citations (e.g., "IsSupplementTo" or "IsPartOf"), largely conforming to CV used by DataCite.org.', 'schema', 'ODM2Provenance', 
	'table', 'RelatedCitations', 'column', 'RelationshipTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Citation that is related to the Citation identified by CitationID', 'schema', 'ODM2Provenance', 
	'table', 'RelatedCitations', 'column', 'RelatedCitationID';

EXEC sp_addextendedproperty 'MS_Description', 'Information about relationships among citations', 'schema', 'ODM2Provenance', 
	'table', RelatedCitations, null, null;


/******************** Add Table: ODM2Provenance.RelatedDatasets ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.RelatedDatasets
(
	RelationID INTEGER IDENTITY (1, 1) NOT NULL,
	DataSetID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedDatasetID INTEGER NOT NULL,
	VersionCode VARCHAR(50) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.RelatedDatasets ADD CONSTRAINT pkRelatedDatasets
	PRIMARY KEY (RelationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a relationship table (i.e. named "Related...").', 'schema', 'ODM2Provenance', 
	'table', 'RelatedDatasets', 'column', 'RelationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a DataSet', 'schema', 'ODM2Provenance', 
	'table', 'RelatedDatasets', 'column', 'DataSetID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the relationship between DataSets (e.g., "IsNewVersionOf" or "Continues"), largely conforming to CV used by DataCite.org.', 'schema', 'ODM2Provenance', 
	'table', 'RelatedDatasets', 'column', 'RelationshipTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a DataSet related to the DataSet identified by DataSetID', 'schema', 'ODM2Provenance', 
	'table', 'RelatedDatasets', 'column', 'RelatedDatasetID';

EXEC sp_addextendedproperty 'MS_Description', 'Text version number/code that can be specified if the DataSet is an explicit version of another DataSet and where the RelationshipTypeCV = "isNewVersionOf".', 'schema', 'ODM2Provenance', 
	'table', 'RelatedDatasets', 'column', 'VersionCode';

EXEC sp_addextendedproperty 'MS_Description', 'Information about relationships among DataSets', 'schema', 'ODM2Provenance', 
	'table', RelatedDatasets, null, null;


/******************** Add Table: ODM2Provenance.RelatedResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.RelatedResults
(
	RelationID INTEGER IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedResultID BIGINT NOT NULL,
	VersionCode VARCHAR(50) NULL,
	RelatedResultSequenceNumber INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.RelatedResults ADD CONSTRAINT pkRelatedResults
	PRIMARY KEY (RelationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a relationship table (i.e. named "Related...").', 'schema', 'ODM2Provenance', 
	'table', 'RelatedResults', 'column', 'RelationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Result', 'schema', 'ODM2Provenance', 
	'table', 'RelatedResults', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the relationship between the Results from a controlled vocabulary (e.g., "isDerivedFrom")', 'schema', 'ODM2Provenance', 
	'table', 'RelatedResults', 'column', 'RelationshipTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Result that is related to the Result identified by ResultID', 'schema', 'ODM2Provenance', 
	'table', 'RelatedResults', 'column', 'RelatedResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Text version number/code that can be specified if the Result is an explicit version of another Result and where the RelationshipTypeCV = "isNewVersionOf".', 'schema', 'ODM2Provenance', 
	'table', 'RelatedResults', 'column', 'VersionCode';

EXEC sp_addextendedproperty 'MS_Description', 'Integer sequence number indicating the order in which a RelatedResults appears in a DerivationEquation (i.e. 1 for x1, 2 for x2...) and where a Result "isDerivedFrom" one or more  RelatedResults.', 'schema', 'ODM2Provenance', 
	'table', 'RelatedResults', 'column', 'RelatedResultSequenceNumber';

EXEC sp_addextendedproperty 'MS_Description', 'Information about relationships among Results', 'schema', 'ODM2Provenance', 
	'table', RelatedResults, null, null;


/******************** Add Table: ODM2Provenance.ResultDerivationEquations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.ResultDerivationEquations
(
	ResultID BIGINT NOT NULL,
	DerivationEquationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.ResultDerivationEquations ADD CONSTRAINT pkResultDerivationEquations
	PRIMARY KEY (ResultID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a Result that was derived using the Equation specified by DerivationEquationID', 'schema', 'ODM2Provenance', 
	'table', 'ResultDerivationEquations', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the DerivationEquation used to derive the Result identified by ResultID', 'schema', 'ODM2Provenance', 
	'table', 'ResultDerivationEquations', 'column', 'DerivationEquationID';

EXEC sp_addextendedproperty 'MS_Description', 'Relationship between Results and Equations used to derive them', 'schema', 'ODM2Provenance', 
	'table', ResultDerivationEquations, null, null;


/******************** Add Table: ODM2Results.CategoricalResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.CategoricalResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue VARCHAR(255) NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Results.CategoricalResultValues ADD CONSTRAINT pkCategoricalResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: ODM2Results.CategoricalResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.CategoricalResults
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.CategoricalResults ADD CONSTRAINT pkCategoricalResults
	PRIMARY KEY (ResultID);


/******************** Add Table: ODM2Results.MeasurementResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.MeasurementResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Results.MeasurementResultValues ADD CONSTRAINT pkMeasurementResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: ODM2Results.MeasurementResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.MeasurementResults
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.MeasurementResults ADD CONSTRAINT pkMeasurementResults
	PRIMARY KEY (ResultID);


/******************** Add Table: ODM2Results.PointCoverageResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.PointCoverageResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.PointCoverageResultValues ADD CONSTRAINT pkPointCoverageResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: ODM2Results.PointCoverageResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.PointCoverageResults
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.PointCoverageResults ADD CONSTRAINT pkPointCoverageResults
	PRIMARY KEY (ResultID);


/******************** Add Table: ODM2Results.ProfileResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.ProfileResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.ProfileResultValues ADD CONSTRAINT pkProfileResultValues
	PRIMARY KEY (ValueID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Numeric values of Depth Profile Results.', 'schema', 'ODM2Results', 
	'table', ProfileResultValues, null, null;


/******************** Add Table: ODM2Results.ProfileResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.ProfileResults
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.ProfileResults ADD CONSTRAINT pkProfileResults
	PRIMARY KEY (ResultID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Information about Profile Results', 'schema', 'ODM2Results', 
	'table', ProfileResults, null, null;


/******************** Add Table: ODM2Results.ResultTypeCV ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.ResultTypeCV
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.ResultTypeCV ADD CONSTRAINT pkResultTypeCV
	PRIMARY KEY (ResultTypeCV);


/******************** Add Table: ODM2Results.SectionResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.SectionResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime BIGINT NOT NULL,
	ValueDateTimeUTCOffset BIGINT NOT NULL,
	XLocation FLOAT NOT NULL,
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.SectionResultValues ADD CONSTRAINT pkSectionResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: ODM2Results.SectionResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.SectionResults
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.SectionResults ADD CONSTRAINT pkSectionResults
	PRIMARY KEY (ResultID);


/******************** Add Table: ODM2Results.SpectraResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.SpectraResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	ExcitationWavelength FLOAT NOT NULL,
	EmissionWavelength FLOAT NOT NULL,
	WavelengthUnitsID INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Results.SpectraResultValues ADD CONSTRAINT pkSpectraResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: ODM2Results.SpectraResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.SpectraResults
(
	ResultID BIGINT NOT NULL,
	XLocation FLOAT NULL,
	XLocationUnitsID INTEGER NULL,
	YLocation FLOAT NULL,
	YLocationUnitsID INTEGER NULL,
	ZLocation FLOAT NULL,
	ZLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedWavelengthSpacing FLOAT NULL,
	IntendedWavelengthSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Results.SpectraResults ADD CONSTRAINT pkSpectraResults
	PRIMARY KEY (ResultID);


/******************** Add Table: ODM2Results.TimeSeriesResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.TimeSeriesResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Results.TimeSeriesResultValues ADD CONSTRAINT pkTimeSeriesResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: ODM2Results.TimeSeriesResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.TimeSeriesResults
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.TimeSeriesResults ADD CONSTRAINT pkTimeSeriesResults
	PRIMARY KEY (ResultID);


/******************** Add Table: ODM2Results.TrajectoryResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.TrajectoryResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.TrajectoryResultValues ADD CONSTRAINT pkTrajectoryResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: ODM2Results.TrajectoryResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.TrajectoryResults
(
	ResultID BIGINT NOT NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedTrajectorySpacing FLOAT NULL,
	IntendedTrajectorySpacingUnitsID INTEGER NULL,
	IntendedTimeSpacing FLOAT NULL,
	IntendedTimeSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Results.TrajectoryResults ADD CONSTRAINT pkTrajectoryResults
	PRIMARY KEY (ResultID);


/******************** Add Table: ODM2Results.TransectResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.TransectResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.TransectResultValues ADD CONSTRAINT pkTransectResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: ODM2Results.TransectResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.TransectResults
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
);

/* Add Primary Key */
ALTER TABLE ODM2Results.TransectResults ADD CONSTRAINT pkTransectResults
	PRIMARY KEY (ResultID);


/******************** Add Table: ODM2SamplingFeatures.RelatedFeatures ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.RelatedFeatures
(
	RelationID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedFeatureID INTEGER NOT NULL,
	SpatialOffsetID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2SamplingFeatures.RelatedFeatures ADD CONSTRAINT pkRelatedFeatures
	PRIMARY KEY (RelationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a relationship table (i.e. named "Related...").', 'schema', 'ODM2SamplingFeatures', 
	'table', 'RelatedFeatures', 'column', 'RelationID';

EXEC sp_addextendedproperty 'MS_Description', 'Foregn key identifier of a Sampling Feature', 'schema', 'ODM2SamplingFeatures', 
	'table', 'RelatedFeatures', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the relationship between SamplingFeatures (e.g., "IsChildOf", "IsFractionOf" or "IsCompositeOf").', 'schema', 'ODM2SamplingFeatures', 
	'table', 'RelatedFeatures', 'column', 'RelationshipTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of a Sampling Feature that is the parent of the current Sampling Feature', 'schema', 'ODM2SamplingFeatures', 
	'table', 'RelatedFeatures', 'column', 'RelatedFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of a spatial offset from the feature parent', 'schema', 'ODM2SamplingFeatures', 
	'table', 'RelatedFeatures', 'column', 'SpatialOffsetID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes parrent/child relationships among Sampling Features', 'schema', 'ODM2SamplingFeatures', 
	'table', RelatedFeatures, null, null;


/******************** Add Table: ODM2SamplingFeatures.Sites ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.Sites
(
	SamplingFeatureID INTEGER NOT NULL,
	SiteTypeCV VARCHAR(255) NOT NULL,
	Latitude FLOAT NOT NULL,
	Longitude FLOAT NOT NULL,
	LatLonDatumID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2SamplingFeatures.Sites ADD CONSTRAINT pkSites
	PRIMARY KEY (SamplingFeatureID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Sampling Feature that is the Site', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'A CV term describing the site type', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'SiteTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Latitude of the site', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'Latitude';

EXEC sp_addextendedproperty 'MS_Description', 'Longitude of the site', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'Longitude';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Spatial Reference System that describes the latitude and longitude coordinates', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'LatLonDatumID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes sampling features that are point sites', 'schema', 'ODM2SamplingFeatures', 
	'table', Sites, null, null;


/******************** Add Table: ODM2SamplingFeatures.SpatialOffsets ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.SpatialOffsets
(
	SpatialOffsetID INTEGER NOT NULL,
	SpatialOffsetTypeCV VARCHAR(255) NOT NULL,
	Offset1Value FLOAT NOT NULL,
	Offset1UnitID INTEGER NOT NULL,
	Offset2Value FLOAT NULL,
	Offset2UnitID INTEGER NULL,
	Offset3Value FLOAT NULL,
	Offset3UnitID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2SamplingFeatures.SpatialOffsets ADD CONSTRAINT pkSpatialOffsets
	PRIMARY KEY (SpatialOffsetID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary Key of SpatialOffset', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialOffsets', 'column', 'SpatialOffsetID';

EXEC sp_addextendedproperty 'MS_Description', 'Type of SpatialOffset, such as Depth, DepthInterval, HorizaontalRadial', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialOffsets', 'column', 'SpatialOffsetTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Numerical value for 1st SpatialOffset, which is defined by SpatialOffsetType', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialOffsets', 'column', 'Offset1Value';

EXEC sp_addextendedproperty 'MS_Description', 'Units for 1st SpatialOffset, which is defined by SpatialOffsetType', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialOffsets', 'column', 'Offset1UnitID';

EXEC sp_addextendedproperty 'MS_Description', 'Numerical value for 2nd SpatialOffset, which is defined by SpatialOffsetType', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialOffsets', 'column', 'Offset2Value';

EXEC sp_addextendedproperty 'MS_Description', 'Units for 2nd SpatialOffset, which is defined by SpatialOffsetType', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialOffsets', 'column', 'Offset2UnitID';

EXEC sp_addextendedproperty 'MS_Description', 'Numerical value for 3rd SpatialOffset, which is defined by SpatialOffsetType', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialOffsets', 'column', 'Offset3Value';

EXEC sp_addextendedproperty 'MS_Description', 'Units for 3rd SpatialOffset, which is defined by SpatialOffsetType', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialOffsets', 'column', 'Offset3UnitID';

EXEC sp_addextendedproperty 'MS_Description', 'An explicit spatial relationship between a sampling feature relative to it''s parent.', 'schema', 'ODM2SamplingFeatures', 
	'table', SpatialOffsets, null, null;


/******************** Add Table: ODM2SamplingFeatures.SpatialReferences ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.SpatialReferences
(
	SpatialReferenceID INTEGER IDENTITY (1, 1) NOT NULL,
	SRSCode VARCHAR(50) NULL,
	SRSName VARCHAR(255) NOT NULL,
	SRSDescription VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2SamplingFeatures.SpatialReferences ADD CONSTRAINT pkSpatialReferences
	PRIMARY KEY (SpatialReferenceID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialReferences', 'column', 'SpatialReferenceID';

EXEC sp_addextendedproperty 'MS_Description', 'SRS code for the spatial reference system', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialReferences', 'column', 'SRSCode';

EXEC sp_addextendedproperty 'MS_Description', 'Text name of the spatial reference system', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialReferences', 'column', 'SRSName';

EXEC sp_addextendedproperty 'MS_Description', 'Text notes describing the spatial reference system', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialReferences', 'column', 'SRSDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Describes spatial reference systems used to reference the coordinates for sites', 'schema', 'ODM2SamplingFeatures', 
	'table', SpatialReferences, null, null;


/******************** Add Table: ODM2SamplingFeatures.SpecimenTaxonomicClassifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.SpecimenTaxonomicClassifiers
(
	BridgeID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	TaxonomicClassifierID INTEGER NOT NULL,
	CitationID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2SamplingFeatures.SpecimenTaxonomicClassifiers ADD CONSTRAINT pkSpecimenTaxonomicClassifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key for a bridge table, enabling many-to-many joins.', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpecimenTaxonomicClassifiers', 'column', 'BridgeID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key to SamplingFeatures.Specimens.', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpecimenTaxonomicClassifiers', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key to TaxonomicClassifiers.', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpecimenTaxonomicClassifiers', 'column', 'TaxonomicClassifierID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key to the attribution, or Citation, for the classification.', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpecimenTaxonomicClassifiers', 'column', 'CitationID';

EXEC sp_addextendedproperty 'MS_Description', 'This cross-reference table allows Taxonomic Classification of Specimens as an annotation, rather than as a Result.', 'schema', 'ODM2SamplingFeatures', 
	'table', SpecimenTaxonomicClassifiers, null, null;


/******************** Add Table: ODM2SamplingFeatures.Specimens ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.Specimens
(
	SamplingFeatureID INTEGER NOT NULL,
	SpecimenTypeCV VARCHAR(255) NOT NULL,
	SpecimenMediumCV VARCHAR(255) NOT NULL,
	IsFieldSpecimen BIT NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2SamplingFeatures.Specimens ADD CONSTRAINT pkSpecimens
	PRIMARY KEY (SamplingFeatureID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Sampling Feature that is the specimen', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Specimens', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'A CV term defining the type of specimen (e.g., aquatic sample, core, etc.)', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Specimens', 'column', 'SpecimenTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'A CV term defining the medium of the specimen (i.e. water, sediment, etc.)', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Specimens', 'column', 'SpecimenMediumCV';

EXEC sp_addextendedproperty 'MS_Description', 'A boolean indicating whether the specimen was collected in the field', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Specimens', 'column', 'IsFieldSpecimen';

EXEC sp_addextendedproperty 'MS_Description', 'Equivalent to O&M Sampling Feature Type "Specimen".  Describes physical samples or specimens.', 'schema', 'ODM2SamplingFeatures', 
	'table', Specimens, null, null;





/************ Add Foreign Keys ***************/

/* Add Foreign Key: fk_ActionAnnotations_Actions */
ALTER TABLE ODM2Annotations.ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionAnnotations_Annotations */
ALTER TABLE ODM2Annotations.ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Annotations_Citations */
ALTER TABLE ODM2Annotations.Annotations ADD CONSTRAINT fk_Annotations_Citations
	FOREIGN KEY (CitationID) REFERENCES ODM2Provenance.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Annotations_People */
ALTER TABLE ODM2Annotations.Annotations ADD CONSTRAINT fk_Annotations_People
	FOREIGN KEY (AnnotatorID) REFERENCES ODM2Core.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValueAnnotations_CategoricalResultValues */
ALTER TABLE ODM2Annotations.CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_CategoricalResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.CategoricalResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentAnnotations_Annotations */
ALTER TABLE ODM2Annotations.EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentAnnotations_Equipment */
ALTER TABLE ODM2Annotations.EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES ODM2Equipment.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResultValueAnnotations_MeasurementResultValues */
ALTER TABLE ODM2Annotations.MeasurementResultValueAnnotations ADD CONSTRAINT fk_MeasurementResultValueAnnotations_MeasurementResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.MeasurementResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.MeasurementResultValueAnnotations ADD CONSTRAINT fk_ResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Annotations */
ALTER TABLE ODM2Annotations.MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Methods */
ALTER TABLE ODM2Annotations.MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Methods
	FOREIGN KEY (MethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValueAnnotations_PointCoverageResultValues */
ALTER TABLE ODM2Annotations.PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_PointCoverageResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.PointCoverageResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValueAnnotations_ProfileResultValues */
ALTER TABLE ODM2Annotations.ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_ProfileResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.ProfileResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Annotations */
ALTER TABLE ODM2Annotations.ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Results */
ALTER TABLE ODM2Annotations.ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureAnnotations_Annotations */
ALTER TABLE ODM2Annotations.SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureAnnotations_SamplingFeatures */
ALTER TABLE ODM2Annotations.SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValueAnnotations_SectionResultValues */
ALTER TABLE ODM2Annotations.SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_SectionResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.SectionResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValueAnnotations_SpectraResultValues */
ALTER TABLE ODM2Annotations.SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_SpectraResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.SpectraResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues */
ALTER TABLE ODM2Annotations.TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.TimeSeriesResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValueAnnotations_TrajectoryResultValues */
ALTER TABLE ODM2Annotations.TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_TrajectoryResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.TrajectoryResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValueAnnotations_TransectResultValues */
ALTER TABLE ODM2Annotations.TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_TransectResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.TransectResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Actions */
ALTER TABLE ODM2Core.ActionBy ADD CONSTRAINT fk_ActionPeople_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Affiliations */
ALTER TABLE ODM2Core.ActionBy ADD CONSTRAINT fk_ActionPeople_Affiliations
	FOREIGN KEY (AffiliationID) REFERENCES ODM2Core.Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Actions_Methods */
ALTER TABLE ODM2Core.Actions ADD CONSTRAINT fk_Actions_Methods
	FOREIGN KEY (MethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Affiliations_Organizations */
ALTER TABLE ODM2Core.Affiliations ADD CONSTRAINT fk_Affiliations_Organizations
	FOREIGN KEY (OrganizationID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Affiliations_People */
ALTER TABLE ODM2Core.Affiliations ADD CONSTRAINT fk_Affiliations_People
	FOREIGN KEY (PersonID) REFERENCES ODM2Core.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetsResults_DataSets */
ALTER TABLE ODM2Core.DataSetsResults ADD CONSTRAINT fk_DataSetsResults_DataSets
	FOREIGN KEY (DataSetID) REFERENCES ODM2Core.DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetsResults_Results */
ALTER TABLE ODM2Core.DataSetsResults ADD CONSTRAINT fk_DataSetsResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureActions_Actions */
ALTER TABLE ODM2Core.FeatureActions ADD CONSTRAINT fk_FeatureActions_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureActions_SamplingFeatures */
ALTER TABLE ODM2Core.FeatureActions ADD CONSTRAINT fk_FeatureActions_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Methods_Organizations */
ALTER TABLE ODM2Core.Methods ADD CONSTRAINT fk_Methods_Organizations
	FOREIGN KEY (OrganizationID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Organizations_Organizations */
ALTER TABLE ODM2Core.Organizations ADD CONSTRAINT fk_Organizations_Organizations
	FOREIGN KEY (ParentOrganizationID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedActions_Actions */
ALTER TABLE ODM2Core.RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedActions_Actions_AreRelated */
ALTER TABLE ODM2Core.RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions_AreRelated
	FOREIGN KEY (RelatedActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_FeatureActions */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_FeatureActions
	FOREIGN KEY (FeatureActionID) REFERENCES ODM2Core.FeatureActions (FeatureActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_ProcessingLevels */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_ProcessingLevels
	FOREIGN KEY (ProcessingLevelID) REFERENCES ODM2Core.ProcessingLevels (ProcessingLevelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_ResultTypeCV */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_ResultTypeCV
	FOREIGN KEY (ResultTypeCV) REFERENCES ODM2Results.ResultTypeCV (ResultTypeCV)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_TaxonomicClassifiers */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_TaxonomicClassifiers
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES ODM2Core.TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Units */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_Units
	FOREIGN KEY (UnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Variables */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ParentTaxon_Taxon */
ALTER TABLE ODM2Core.TaxonomicClassifiers ADD CONSTRAINT fk_ParentTaxon_Taxon
	FOREIGN KEY (ParentTaxonomicClassifierID) REFERENCES ODM2Core.TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataQuality_Units */
ALTER TABLE ODM2DataQuality.DataQuality ADD CONSTRAINT fk_DataQuality_Units
	FOREIGN KEY (DataQualityValueUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Citations */
ALTER TABLE ODM2DataQuality.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Citations
	FOREIGN KEY (CitationID) REFERENCES ODM2Provenance.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_ReferenceMaterials */
ALTER TABLE ODM2DataQuality.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_ReferenceMaterials
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ODM2DataQuality.ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Units */
ALTER TABLE ODM2DataQuality.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Units
	FOREIGN KEY (UnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Variables */
ALTER TABLE ODM2DataQuality.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterials_Organizations */
ALTER TABLE ODM2DataQuality.ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_Organizations
	FOREIGN KEY (ReferenceMaterialOrganizationID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterials_SamplingFeatures */
ALTER TABLE ODM2DataQuality.ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultNormalizationValues_ReferenceMaterialValues */
ALTER TABLE ODM2DataQuality.ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_ReferenceMaterialValues
	FOREIGN KEY (NormalizedByReferenceMaterialValueID) REFERENCES ODM2DataQuality.ReferenceMaterialValues (ReferenceMaterialValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultNormalizationValues_Results */
ALTER TABLE ODM2DataQuality.ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsDataQuality_DataQuality */
ALTER TABLE ODM2DataQuality.ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_DataQuality
	FOREIGN KEY (DataQualityID) REFERENCES ODM2DataQuality.DataQuality (DataQualityID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsDataQuality_Results */
ALTER TABLE ODM2DataQuality.ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationActions_Actions */
ALTER TABLE ODM2Equipment.CalibrationActions ADD CONSTRAINT fk_CalibrationActions_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationActions_InstrumentOutputVariables */
ALTER TABLE ODM2Equipment.CalibrationActions ADD CONSTRAINT fk_CalibrationActions_InstrumentOutputVariables
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES ODM2Equipment.InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationReferenceEquipment_CalibrationActions */
ALTER TABLE ODM2Equipment.CalibrationReferenceEquipment ADD CONSTRAINT fk_CalibrationReferenceEquipment_CalibrationActions
	FOREIGN KEY (ActionID) REFERENCES ODM2Equipment.CalibrationActions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationReferenceEquipment_Equipment */
ALTER TABLE ODM2Equipment.CalibrationReferenceEquipment ADD CONSTRAINT fk_CalibrationReferenceEquipment_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES ODM2Equipment.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationStandards_CalibrationActions */
ALTER TABLE ODM2Equipment.CalibrationStandards ADD CONSTRAINT fk_CalibrationStandards_CalibrationActions
	FOREIGN KEY (ActionID) REFERENCES ODM2Equipment.CalibrationActions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FieldCalibrationStandards_ReferenceMaterials */
ALTER TABLE ODM2Equipment.CalibrationStandards ADD CONSTRAINT fk_FieldCalibrationStandards_ReferenceMaterials
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ODM2DataQuality.ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataLoggerFiles_DataloggerProgramFiles */
ALTER TABLE ODM2Equipment.DataLoggerFiles ADD CONSTRAINT fk_DataLoggerFiles_DataloggerProgramFiles
	FOREIGN KEY (ProgramID) REFERENCES ODM2Equipment.DataloggerProgramFiles (ProgramID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_DataLoggerFiles */
ALTER TABLE ODM2Equipment.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_DataLoggerFiles
	FOREIGN KEY (DataLoggerFileID) REFERENCES ODM2Equipment.DataLoggerFiles (DataLoggerFileID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_InstrumentOutputVariables */
ALTER TABLE ODM2Equipment.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_InstrumentOutputVariables
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES ODM2Equipment.InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_RecordingUnits */
ALTER TABLE ODM2Equipment.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_RecordingUnits
	FOREIGN KEY (RecordingIntervalUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_Results */
ALTER TABLE ODM2Equipment.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerFileColumns_ScanUnits */
ALTER TABLE ODM2Equipment.DataloggerFileColumns ADD CONSTRAINT fk_DataloggerFileColumns_ScanUnits
	FOREIGN KEY (ScanIntervalUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerProgramFiles_Affiliations */
ALTER TABLE ODM2Equipment.DataloggerProgramFiles ADD CONSTRAINT fk_DataloggerProgramFiles_Affiliations
	FOREIGN KEY (AffiliationID) REFERENCES ODM2Core.Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_EquipmentModels */
ALTER TABLE ODM2Equipment.Equipment ADD CONSTRAINT fk_Equipment_EquipmentModels
	FOREIGN KEY (EquipmentModelID) REFERENCES ODM2Equipment.EquipmentModels (EquipmentModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_Organizations */
ALTER TABLE ODM2Equipment.Equipment ADD CONSTRAINT fk_Equipment_Organizations
	FOREIGN KEY (EquipmentVendorID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_People */
ALTER TABLE ODM2Equipment.Equipment ADD CONSTRAINT fk_Equipment_People
	FOREIGN KEY (EquipmentOwnerID) REFERENCES ODM2Core.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentModels_Organizations */
ALTER TABLE ODM2Equipment.EquipmentModels ADD CONSTRAINT fk_EquipmentModels_Organizations
	FOREIGN KEY (ModelManufacturerID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentActions_Actions */
ALTER TABLE ODM2Equipment.EquipmentUsed ADD CONSTRAINT fk_EquipmentActions_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentActions_Equipment */
ALTER TABLE ODM2Equipment.EquipmentUsed ADD CONSTRAINT fk_EquipmentActions_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES ODM2Equipment.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_EquipmentModels */
ALTER TABLE ODM2Equipment.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_EquipmentModels
	FOREIGN KEY (ModelID) REFERENCES ODM2Equipment.EquipmentModels (EquipmentModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Methods */
ALTER TABLE ODM2Equipment.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Methods
	FOREIGN KEY (InstrumentMethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Units */
ALTER TABLE ODM2Equipment.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Units
	FOREIGN KEY (InstrumentRawOutputUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Variables */
ALTER TABLE ODM2Equipment.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MaintenanceActions_Actions */
ALTER TABLE ODM2Equipment.MaintenanceActions ADD CONSTRAINT fk_MaintenanceActions_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedEquipment_Equipment */
ALTER TABLE ODM2Equipment.RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES ODM2Equipment.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedEquipment_Equipment_AreRelated */
ALTER TABLE ODM2Equipment.RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment_AreRelated
	FOREIGN KEY (RelatedEquipmentID) REFERENCES ODM2Equipment.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionExtensionPropertyValues_Actions */
ALTER TABLE ODM2ExtensionProperties.ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ODM2ExtensionProperties.ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ODM2ExtensionProperties.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExtensionPropertyValues_Citations */
ALTER TABLE ODM2ExtensionProperties.CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_Citations
	FOREIGN KEY (CitationID) REFERENCES ODM2Provenance.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ODM2ExtensionProperties.CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ODM2ExtensionProperties.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExtensionProperties_Units */
ALTER TABLE ODM2ExtensionProperties.ExtensionProperties ADD CONSTRAINT fk_ExtensionProperties_Units
	FOREIGN KEY (PropertyUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ODM2ExtensionProperties.MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ODM2ExtensionProperties.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_Methods */
ALTER TABLE ODM2ExtensionProperties.MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_Methods
	FOREIGN KEY (MethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ODM2ExtensionProperties.ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ODM2ExtensionProperties.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultExtensionPropertyValues_Results */
ALTER TABLE ODM2ExtensionProperties.ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ODM2ExtensionProperties.SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ODM2ExtensionProperties.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures */
ALTER TABLE ODM2ExtensionProperties.SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ODM2ExtensionProperties.VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ODM2ExtensionProperties.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_Variables */
ALTER TABLE ODM2ExtensionProperties.VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExternalIdentifiers_Citations */
ALTER TABLE ODM2ExternalIdentifiers.CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_Citations
	FOREIGN KEY (CitationID) REFERENCES ODM2Provenance.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE ODM2ExternalIdentifiers.CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_Organizations */
ALTER TABLE ODM2ExternalIdentifiers.ExternalIdentifierSystems ADD CONSTRAINT fk_ExternalIdentifierSystems_Organizations
	FOREIGN KEY (IdentifierSystemOrganizationID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE ODM2ExternalIdentifiers.MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExternalIdentifiers_Methods */
ALTER TABLE ODM2ExternalIdentifiers.MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_Methods
	FOREIGN KEY (MethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PersonExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE ODM2ExternalIdentifiers.PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PersonExternalIdentifiers_People */
ALTER TABLE ODM2ExternalIdentifiers.PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_People
	FOREIGN KEY (PersonID) REFERENCES ODM2Core.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RefMaterialExtIdentifiers_ExtIdentifierSystems */
ALTER TABLE ODM2ExternalIdentifiers.ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_ExtIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RefMaterialExtIdentifiers_RefMaterials */
ALTER TABLE ODM2ExternalIdentifiers.ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_RefMaterials
	FOREIGN KEY (ReferenceMaterialID) REFERENCES ODM2DataQuality.ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExternalIdentifiers_SamplingFeatures */
ALTER TABLE ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE ODM2ExternalIdentifiers.SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpatialReferenceExternalIdentifiers_SpatialReferences */
ALTER TABLE ODM2ExternalIdentifiers.SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TaxonomicClassifierExtIDs_ExtIDSystems */
ALTER TABLE ODM2ExternalIdentifiers.TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_ExtIDSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers */
ALTER TABLE ODM2ExternalIdentifiers.TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES ODM2Core.TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE ODM2ExternalIdentifiers.VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExternalIdentifiers_Variables */
ALTER TABLE ODM2ExternalIdentifiers.VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionDirectives_Actions */
ALTER TABLE ODM2LabAnalyses.ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionDirectives_Directives */
ALTER TABLE ODM2LabAnalyses.ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Directives
	FOREIGN KEY (DirectiveID) REFERENCES ODM2LabAnalyses.Directives (DirectiveID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenBatchPostions_FeatureActions */
ALTER TABLE ODM2LabAnalyses.SpecimenBatchPostions ADD CONSTRAINT fk_SpecimenBatchPostions_FeatureActions
	FOREIGN KEY (FeatureActionID) REFERENCES ODM2Core.FeatureActions (FeatureActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AuthorLists_Citations */
ALTER TABLE ODM2Provenance.AuthorLists ADD CONSTRAINT fk_AuthorLists_Citations
	FOREIGN KEY (CitationID) REFERENCES ODM2Provenance.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AuthorLists_People */
ALTER TABLE ODM2Provenance.AuthorLists ADD CONSTRAINT fk_AuthorLists_People
	FOREIGN KEY (PersonID) REFERENCES ODM2Core.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetCitations_Citations */
ALTER TABLE ODM2Provenance.DataSetCitations ADD CONSTRAINT fk_DataSetCitations_Citations
	FOREIGN KEY (CitationID) REFERENCES ODM2Provenance.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetCitations_DataSets */
ALTER TABLE ODM2Provenance.DataSetCitations ADD CONSTRAINT fk_DataSetCitations_DataSets
	FOREIGN KEY (DataSetID) REFERENCES ODM2Core.DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodCitations_Citations */
ALTER TABLE ODM2Provenance.MethodCitations ADD CONSTRAINT fk_MethodCitations_Citations
	FOREIGN KEY (CitationID) REFERENCES ODM2Provenance.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodCitations_Methods */
ALTER TABLE ODM2Provenance.MethodCitations ADD CONSTRAINT fk_MethodCitations_Methods
	FOREIGN KEY (MethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedAnnotations_Annotations */
ALTER TABLE ODM2Provenance.RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedAnnotations_Annotations_AreRelated */
ALTER TABLE ODM2Provenance.RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations_AreRelated
	FOREIGN KEY (RelatedAnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedCitations_Citations */
ALTER TABLE ODM2Provenance.RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations
	FOREIGN KEY (CitationID) REFERENCES ODM2Provenance.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedCitations_Citations_AreRelated */
ALTER TABLE ODM2Provenance.RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations_AreRelated
	FOREIGN KEY (RelatedCitationID) REFERENCES ODM2Provenance.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedDatasets_DataSets */
ALTER TABLE ODM2Provenance.RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets
	FOREIGN KEY (DataSetID) REFERENCES ODM2Core.DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedDatasets_DataSets_AreRelated */
ALTER TABLE ODM2Provenance.RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets_AreRelated
	FOREIGN KEY (RelatedDatasetID) REFERENCES ODM2Core.DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results */
ALTER TABLE ODM2Provenance.RelatedResults ADD CONSTRAINT fk_RelatedResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results_AreRelated */
ALTER TABLE ODM2Provenance.RelatedResults ADD CONSTRAINT fk_RelatedResults_Results_AreRelated
	FOREIGN KEY (RelatedResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultDerivationEquations_DerivationEquations */
ALTER TABLE ODM2Provenance.ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_DerivationEquations
	FOREIGN KEY (DerivationEquationID) REFERENCES ODM2Provenance.DerivationEquations (DerivationEquationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultDerivationEquations_Results */
ALTER TABLE ODM2Provenance.ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValues_CategoricalResults */
ALTER TABLE ODM2Results.CategoricalResultValues ADD CONSTRAINT fk_CategoricalResultValues_CategoricalResults
	FOREIGN KEY (ResultID) REFERENCES ODM2Results.CategoricalResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResults_Results */
ALTER TABLE ODM2Results.CategoricalResults ADD CONSTRAINT fk_CategoricalResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResults_SpatialReferences */
ALTER TABLE ODM2Results.CategoricalResults ADD CONSTRAINT fk_CategoricalResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResultValues_MeasurementResults */
ALTER TABLE ODM2Results.MeasurementResultValues ADD CONSTRAINT fk_MeasurementResultValues_MeasurementResults
	FOREIGN KEY (ResultID) REFERENCES ODM2Results.MeasurementResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_AIUnits */
ALTER TABLE ODM2Results.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_Results */
ALTER TABLE ODM2Results.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_SpatialReferences */
ALTER TABLE ODM2Results.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_XUnits */
ALTER TABLE ODM2Results.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_YUnits */
ALTER TABLE ODM2Results.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_ZUnits */
ALTER TABLE ODM2Results.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_PointCoverageResults */
ALTER TABLE ODM2Results.PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_PointCoverageResults
	FOREIGN KEY (ResultID) REFERENCES ODM2Results.PointCoverageResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_XUnits */
ALTER TABLE ODM2Results.PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_YUnits */
ALTER TABLE ODM2Results.PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_Results */
ALTER TABLE ODM2Results.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_SpatialReferences */
ALTER TABLE ODM2Results.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_XUnits */
ALTER TABLE ODM2Results.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_XUnits
	FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_YUnits */
ALTER TABLE ODM2Results.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_YUnits
	FOREIGN KEY (IntendedYSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_ZUnits */
ALTER TABLE ODM2Results.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_AIUnits */
ALTER TABLE ODM2Results.ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_DUnits */
ALTER TABLE ODM2Results.ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_DUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_ProfileResults */
ALTER TABLE ODM2Results.ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_ProfileResults
	FOREIGN KEY (ResultID) REFERENCES ODM2Results.ProfileResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_DUnits */
ALTER TABLE ODM2Results.ProfileResults ADD CONSTRAINT fk_ProfileResults_DUnits
	FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_Results */
ALTER TABLE ODM2Results.ProfileResults ADD CONSTRAINT fk_ProfileResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_SpatialReferences */
ALTER TABLE ODM2Results.ProfileResults ADD CONSTRAINT fk_ProfileResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_TUnits */
ALTER TABLE ODM2Results.ProfileResults ADD CONSTRAINT fk_ProfileResults_TUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_XUnits */
ALTER TABLE ODM2Results.ProfileResults ADD CONSTRAINT fk_ProfileResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_YUnits */
ALTER TABLE ODM2Results.ProfileResults ADD CONSTRAINT fk_ProfileResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_AIUnits */
ALTER TABLE ODM2Results.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_SectionResults */
ALTER TABLE ODM2Results.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_SectionResults
	FOREIGN KEY (ResultID) REFERENCES ODM2Results.SectionResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_XUnits */
ALTER TABLE ODM2Results.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_ZUnits */
ALTER TABLE ODM2Results.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_Results */
ALTER TABLE ODM2Results.SectionResults ADD CONSTRAINT fk_SectionResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_SpatialReferences */
ALTER TABLE ODM2Results.SectionResults ADD CONSTRAINT fk_SectionResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_TMUnits */
ALTER TABLE ODM2Results.SectionResults ADD CONSTRAINT fk_SectionResults_TMUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_Units */
ALTER TABLE ODM2Results.SectionResults ADD CONSTRAINT fk_SectionResults_Units
	FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_XUnits */
ALTER TABLE ODM2Results.SectionResults ADD CONSTRAINT fk_SectionResults_XUnits
	FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_ZUnits */
ALTER TABLE ODM2Results.SectionResults ADD CONSTRAINT fk_SectionResults_ZUnits
	FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_AIUnits */
ALTER TABLE ODM2Results.SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_SpectraResults */
ALTER TABLE ODM2Results.SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_SpectraResults
	FOREIGN KEY (ResultID) REFERENCES ODM2Results.SpectraResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_WUnits */
ALTER TABLE ODM2Results.SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_WUnits
	FOREIGN KEY (WavelengthUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_Results */
ALTER TABLE ODM2Results.SpectraResults ADD CONSTRAINT fk_SpectraResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_SpatialReferences */
ALTER TABLE ODM2Results.SpectraResults ADD CONSTRAINT fk_SpectraResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_Units */
ALTER TABLE ODM2Results.SpectraResults ADD CONSTRAINT fk_SpectraResults_Units
	FOREIGN KEY (IntendedWavelengthSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_XUnits */
ALTER TABLE ODM2Results.SpectraResults ADD CONSTRAINT fk_SpectraResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_YUnits */
ALTER TABLE ODM2Results.SpectraResults ADD CONSTRAINT fk_SpectraResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_ZUnits */
ALTER TABLE ODM2Results.SpectraResults ADD CONSTRAINT fk_SpectraResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValues_TimeSeriesResults */
ALTER TABLE ODM2Results.TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_TimeSeriesResults
	FOREIGN KEY (ResultID) REFERENCES ODM2Results.TimeSeriesResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValues_Units */
ALTER TABLE ODM2Results.TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_Units
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_Results */
ALTER TABLE ODM2Results.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_SpatialReferences */
ALTER TABLE ODM2Results.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_TUnits */
ALTER TABLE ODM2Results.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_TUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_XUnits */
ALTER TABLE ODM2Results.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_YUnits */
ALTER TABLE ODM2Results.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_ZUnits */
ALTER TABLE ODM2Results.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_AIUnits */
ALTER TABLE ODM2Results.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_TrajectoryResults */
ALTER TABLE ODM2Results.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_TrajectoryResults
	FOREIGN KEY (ResultID) REFERENCES ODM2Results.TrajectoryResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_XUnits */
ALTER TABLE ODM2Results.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_YUnits */
ALTER TABLE ODM2Results.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_ZUnits */
ALTER TABLE ODM2Results.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_Results */
ALTER TABLE ODM2Results.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_SpatialReferences */
ALTER TABLE ODM2Results.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_TSUnits */
ALTER TABLE ODM2Results.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TSUnits
	FOREIGN KEY (IntendedTrajectorySpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_TUnits */
ALTER TABLE ODM2Results.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValues_TransectResults */
ALTER TABLE ODM2Results.TransectResultValues ADD CONSTRAINT fk_TransectResultValues_TransectResults
	FOREIGN KEY (ResultID) REFERENCES ODM2Results.TransectResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_Results */
ALTER TABLE ODM2Results.TransectResults ADD CONSTRAINT fk_TransectResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_SpatialReferences */
ALTER TABLE ODM2Results.TransectResults ADD CONSTRAINT fk_TransectResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_TMUnits */
ALTER TABLE ODM2Results.TransectResults ADD CONSTRAINT fk_TransectResults_TMUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_TSUnits */
ALTER TABLE ODM2Results.TransectResults ADD CONSTRAINT fk_TransectResults_TSUnits
	FOREIGN KEY (IntendedTransectSpacingUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_Units */
ALTER TABLE ODM2Results.TransectResults ADD CONSTRAINT fk_TransectResults_Units
	FOREIGN KEY (ZLocationUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_FeaturesParent */
ALTER TABLE ODM2SamplingFeatures.RelatedFeatures ADD CONSTRAINT fk_FeatureParents_FeaturesParent
	FOREIGN KEY (RelatedFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_SamplingFeatures */
ALTER TABLE ODM2SamplingFeatures.RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_SpatialOffsets */
ALTER TABLE ODM2SamplingFeatures.RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SpatialOffsets
	FOREIGN KEY (SpatialOffsetID) REFERENCES ODM2SamplingFeatures.SpatialOffsets (SpatialOffsetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Sites_SamplingFeatures */
ALTER TABLE ODM2SamplingFeatures.Sites ADD CONSTRAINT fk_Sites_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Sites_SpatialReferences */
ALTER TABLE ODM2SamplingFeatures.Sites ADD CONSTRAINT fk_Sites_SpatialReferences
	FOREIGN KEY (LatLonDatumID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenTaxonomicClassifiers_Specimens */
ALTER TABLE ODM2SamplingFeatures.SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_Specimens
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2SamplingFeatures.Specimens (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers */
ALTER TABLE ODM2SamplingFeatures.SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES ODM2Core.TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Specimens_SamplingFeatures */
ALTER TABLE ODM2SamplingFeatures.Specimens ADD CONSTRAINT fk_Specimens_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;