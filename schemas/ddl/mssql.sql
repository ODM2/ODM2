USE odm2;


/************ Update: Schemas ***************/

/* Add Schema: ODM2Annotations */
CREATE SCHEMA ODM2Annotations;
EXEC sp_addextendedproperty 'MS_Description', 'Annotations are used to add comments or qualifiers to entity instances in ODM2.', 'schema', 'ODM2Annotations', 
	null, null, null, null;

/* Add Schema: ODM2CV */
CREATE SCHEMA ODM2CV;
EXEC sp_addextendedproperty 'MS_Description', 'Controlled vocabularies for ODM2.', 'schema', 'ODM2CV', 
	null, null, null, null;

/* Add Schema: ODM2Core */
CREATE SCHEMA ODM2Core;
EXEC sp_addextendedproperty 'MS_Description', 'The core of ODM2.  Every ODM2 instance will implement the Core.', 'schema', 'ODM2Core', 
	null, null, null, null;

/* Add Schema: ODM2Equipment */
CREATE SCHEMA ODM2Equipment;
EXEC sp_addextendedproperty 'MS_Description', 'Entities and attributes of equipment used to make observations (e.g., sensors and instruments).', 'schema', 'ODM2Equipment', 
	null, null, null, null;

/* Add Schema: ODM2Extension */
CREATE SCHEMA ODM2Extension;
EXEC sp_addextendedproperty 'MS_Description', 'A general extnsibility mechanism for entities in ODM2.', 'schema', 'ODM2Extension', 
	null, null, null, null;

/* Add Schema: ODM2ExternalIdentifiers */
CREATE SCHEMA ODM2ExternalIdentifiers;

/* Add Schema: ODM2Provenance */
CREATE SCHEMA ODM2Provenance;
EXEC sp_addextendedproperty 'MS_Description', 'Entities and attributes for creating and storing provenance information and versions of observations in ODM2.', 'schema', 'ODM2Provenance', 
	null, null, null, null;

/* Add Schema: ODM2Results */
CREATE SCHEMA ODM2Results;
EXEC sp_addextendedproperty 'MS_Description', 'The resulting values of observations in ODM2.', 'schema', 'ODM2Results', 
	null, null, null, null;

/* Add Schema: ODM2Samples */
CREATE SCHEMA ODM2Samples;
EXEC sp_addextendedproperty 'MS_Description', 'Information about samples and laboratory analyses for ex situ data.', 'schema', 'ODM2Samples', 
	null, null, null, null;

/* Add Schema: ODM2SamplingFeatures */
CREATE SCHEMA ODM2SamplingFeatures;
EXEC sp_addextendedproperty 'MS_Description', 'Information about sampling features, including sites and specimens.', 'schema', 'ODM2SamplingFeatures', 
	null, null, null, null;

/* Add Schema: ODM2Sensors */
CREATE SCHEMA ODM2Sensors;
EXEC sp_addextendedproperty 'MS_Description', 'Information about sensor deployment and management for in situ data.', 'schema', 'ODM2Sensors', 
	null, null, null, null;



/************ Update: Tables ***************/

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
	AnnotatorID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Annotations.Annotations ADD CONSTRAINT pkAnnotations
	PRIMARY KEY (AnnotationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key.', 'schema', 'ODM2Annotations', 
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

EXEC sp_addextendedproperty 'MS_Description', 'Contains text annotations added to various objects within ODM.', 'schema', 'ODM2Annotations', 
	'table', Annotations, null, null;


/******************** Add Table: ODM2Annotations.MethodAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.MethodAnnotations
(
	MethodID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the method being annotated', 'schema', 'ODM2Annotations', 
	'table', 'MethodAnnotations', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the annotation added to the method', 'schema', 'ODM2Annotations', 
	'table', 'MethodAnnotations', 'column', 'AnnotationID';


/******************** Add Table: ODM2Annotations.ResultAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.ResultAnnotations
(
	ResultID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL,
	BeginDateTime DATETIME NOT NULL,
	EndDateTime DATETIME NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the result being annotated', 'schema', 'ODM2Annotations', 
	'table', 'ResultAnnotations', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the annotation added to the result', 'schema', 'ODM2Annotations', 
	'table', 'ResultAnnotations', 'column', 'AnnotationID';

EXEC sp_addextendedproperty 'MS_Description', 'Beginning date/time of the annotation', 'schema', 'ODM2Annotations', 
	'table', 'ResultAnnotations', 'column', 'BeginDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'Ending date/time of the annotation', 'schema', 'ODM2Annotations', 
	'table', 'ResultAnnotations', 'column', 'EndDateTime';


/******************** Add Table: ODM2Annotations.ResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.ResultValueAnnotations
(
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the result value being annotrated', 'schema', 'ODM2Annotations', 
	'table', 'ResultValueAnnotations', 'column', 'ValueID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the annotation applied to the result value', 'schema', 'ODM2Annotations', 
	'table', 'ResultValueAnnotations', 'column', 'AnnotationID';


/******************** Add Table: ODM2Annotations.VariableAnnotations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Annotations.VariableAnnotations
(
	VariableID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the variable being annotated', 'schema', 'ODM2Annotations', 
	'table', 'VariableAnnotations', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the annotation added to the variable', 'schema', 'ODM2Annotations', 
	'table', 'VariableAnnotations', 'column', 'AnnotationID';


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


/******************** Add Table: ODM2Core.ActionPeople ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.ActionPeople
(
	ActionID INTEGER NOT NULL,
	AffiliationID INTEGER NOT NULL,
	IsActionLead BIT NOT NULL,
	RoleID INTEGER NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of an action.', 'schema', 'ODM2Core', 
	'table', 'ActionPeople', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of a person', 'schema', 'ODM2Core', 
	'table', 'ActionPeople', 'column', 'AffiliationID';

EXEC sp_addextendedproperty 'MS_Description', 'Indicator of whether the affiliated person was the lead for the action', 'schema', 'ODM2Core', 
	'table', 'ActionPeople', 'column', 'IsActionLead';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a role played by a person in performing an action', 'schema', 'ODM2Core', 
	'table', 'ActionPeople', 'column', 'RoleID';

EXEC sp_addextendedproperty 'MS_Description', 'Affiliates people with actions and describes thier role in the action.', 'schema', 'ODM2Core', 
	'table', ActionPeople, null, null;


/******************** Add Table: ODM2Core.Actions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Actions
(
	ActionID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionTypeCV VARCHAR(255) NOT NULL,
	BeginDateTime DATETIME NOT NULL,
	BeginDateTimeUTCOffset INTEGER NOT NULL,
	EndDateTime DATETIME NULL,
	EndDateTimeUTCOffset INTEGER NULL,
	MethodID INTEGER NOT NULL,
	SamplingFeatureID INTEGER NULL,
	EquipmentID INTEGER NULL,
	DirectiveID INTEGER NULL,
	ActionNotes VARCHAR(500) NULL,
	ParentActionID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Actions ADD CONSTRAINT pkActions
	PRIMARY KEY (ActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the type of action (e.g., observation, sample collection, sample analysis)', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'ActionTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'The date/time at which the action began', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'BeginDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'The UTCOffset for the BeginDateTime', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'BeginDateTimeUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'The date/time at which the action ended', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'EndDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'The UTCOffset of for the EndDateTime', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'EndDateTimeUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the method used to complete the action', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the SamplingFeature on which or at which the action was completed', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for a piece of equipment that was used to complete the action', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'EquipmentID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the directive under which the action was completed', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'DirectiveID';

EXEC sp_addextendedproperty 'MS_Description', 'Text notes that accompany the action', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'ActionNotes';

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier of the action that is the parent of this action', 'schema', 'ODM2Core', 
	'table', 'Actions', 'column', 'ParentActionID';

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
	DataSetTypeCV VARCHAR(255) NOT NULL,
	DataSetCode VARCHAR(50) NOT NULL,
	DataSetTitle VARCHAR(255) NOT NULL,
	DataSetAbstract VARCHAR(500) NOT NULL,
	DataSetCitation VARCHAR(255) NOT NULL
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

EXEC sp_addextendedproperty 'MS_Description', 'Text citation for Dataset itself', 'schema', 'ODM2Core', 
	'table', 'DataSets', 'column', 'DataSetCitation';

EXEC sp_addextendedproperty 'MS_Description', 'Describes groupings of observation results that can be considered "datasets"', 'schema', 'ODM2Core', 
	'table', DataSets, null, null;


/******************** Add Table: ODM2Core.DataSetsResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.DataSetsResults
(
	DataSetID INTEGER NOT NULL,
	ResultID BIGINT NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the DataSet', 'schema', 'ODM2Core', 
	'table', 'DataSetsResults', 'column', 'DataSetID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Result', 'schema', 'ODM2Core', 
	'table', 'DataSetsResults', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Lists the Results that are grouped into a DataSet', 'schema', 'ODM2Core', 
	'table', DataSetsResults, null, null;


/******************** Add Table: ODM2Core.Directives ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Directives
(
	DirectiveID INTEGER IDENTITY (1, 1) NOT NULL,
	DirectiveDescription VARCHAR(500) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Directives ADD CONSTRAINT pkDirectives
	PRIMARY KEY (DirectiveID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier.', 'schema', 'ODM2Core', 
	'table', 'Directives', 'column', 'DirectiveID';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the directive under which the action was taken.', 'schema', 'ODM2Core', 
	'table', 'Directives', 'column', 'DirectiveDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the directive under which actions are made.  Directives can be projects, etc.', 'schema', 'ODM2Core', 
	'table', Directives, null, null;


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


/******************** Add Table: ODM2Core.QualityControlLevels ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.QualityControlLevels
(
	QualityControlLevelID INTEGER IDENTITY (1, 1) NOT NULL,
	QualityControlLevelCode VARCHAR(50) NOT NULL,
	Definition VARCHAR(500) NULL,
	Explanation VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.QualityControlLevels ADD CONSTRAINT pkQualityControlLevels
	PRIMARY KEY (QualityControlLevelID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'QualityControlLevels', 'column', 'QualityControlLevelID';

EXEC sp_addextendedproperty 'MS_Description', 'Text code identifying the quality control level', 'schema', 'ODM2Core', 
	'table', 'QualityControlLevels', 'column', 'QualityControlLevelCode';

EXEC sp_addextendedproperty 'MS_Description', 'Text defintion of the quality control level', 'schema', 'ODM2Core', 
	'table', 'QualityControlLevels', 'column', 'Definition';

EXEC sp_addextendedproperty 'MS_Description', 'Text explanation of the quality control level', 'schema', 'ODM2Core', 
	'table', 'QualityControlLevels', 'column', 'Explanation';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the quality control level of Results', 'schema', 'ODM2Core', 
	'table', QualityControlLevels, null, null;


/******************** Add Table: ODM2Core.RelatedResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.RelatedResults
(
	ResultID BIGINT NOT NULL,
	RelatedResultID BIGINT NOT NULL,
	RelationshipRole VARCHAR(255) NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of a Result', 'schema', 'ODM2Core', 
	'table', 'RelatedResults', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key idntifier for a Result that is related to the Result given in ResultID', 'schema', 'ODM2Core', 
	'table', 'RelatedResults', 'column', 'RelatedResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the relationship shared by two results', 'schema', 'ODM2Core', 
	'table', 'RelatedResults', 'column', 'RelationshipRole';

EXEC sp_addextendedproperty 'MS_Description', 'Describes Results that are related to one another', 'schema', 'ODM2Core', 
	'table', RelatedResults, null, null;


/******************** Add Table: ODM2Core.Results ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Results
(
	ResultID BIGINT IDENTITY (1, 1) NOT NULL,
	ResultTypeCV VARCHAR(255) NOT NULL,
	ActionID INTEGER NOT NULL,
	VariableID INTEGER NOT NULL,
	UnitsID INTEGER NOT NULL,
	QualityControlLevelID INTEGER NOT NULL,
	ResultDateTime DATETIME NULL,
	ResultDateTimeUTCOffset BIGINT NULL,
	ValidDateTime DATETIME NULL,
	ValidDateTimeUTCOffset BIGINT NULL,
	StatusCV VARCHAR(255) NULL,
	SampledMediumCV VARCHAR(255) NOT NULL,
	ValueCount INTEGER NOT NULL,
	IntendedObservationSpacing VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT pkResults
	PRIMARY KEY (ResultID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the result type (e.g., time series, measurement, etc.)', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ResultTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the observation action that created the result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Variable of the result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Units of the result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'UnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the QualityControlLevel of the result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'QualityControlLevelID';

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

EXEC sp_addextendedproperty 'MS_Description', 'Intended temporal spacing of the observations in the result', 'schema', 'ODM2Core', 
	'table', 'Results', 'column', 'IntendedObservationSpacing';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the results of observation actions (e.g., groups of one or more numeric data values that result from an observation action)', 'schema', 'ODM2Core', 
	'table', Results, null, null;


/******************** Add Table: ODM2Core.Roles ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Roles
(
	RoleID INTEGER IDENTITY (1, 1) NOT NULL,
	RoleDescription VARCHAR(500) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Roles ADD CONSTRAINT pkRoles
	PRIMARY KEY (RoleID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key', 'schema', 'ODM2Core', 
	'table', 'Roles', 'column', 'RoleID';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the role played by an affiliated person', 'schema', 'ODM2Core', 
	'table', 'Roles', 'column', 'RoleDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Describes roles that can be taken by people in performing actions (e.g, the person who created the observation).', 'schema', 'ODM2Core', 
	'table', Roles, null, null;


/******************** Add Table: ODM2Core.SamplingFeatures ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.SamplingFeatures
(
	SamplingFeatureID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureTypeCV VARCHAR(255) NOT NULL,
	SpatialReferenceID INTEGER NULL,
	FeatureGeometry IMAGE NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.SamplingFeatures ADD CONSTRAINT pkSamplingFeatures
	PRIMARY KEY (SamplingFeatureID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key.', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term descripting the type of sampling feature.', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'SamplingFeatureTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Spatial Reference System for the feature geometry.', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'SpatialReferenceID';

EXEC sp_addextendedproperty 'MS_Description', 'Actual geometry of the feature. Can be Point, Curve (profile, trajectory, etc), Surface (flat polygons, etc), Solid', 'schema', 'ODM2Core', 
	'table', 'SamplingFeatures', 'column', 'FeatureGeometry';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the sampling features on which observations are made.', 'schema', 'ODM2Core', 
	'table', SamplingFeatures, null, null;


/******************** Add Table: ODM2Core.Units ************************/

/* Build Table Structure */
CREATE TABLE ODM2Core.Units
(
	UnitsID INTEGER IDENTITY (1, 1) NOT NULL,
	UnitsName VARCHAR(255) NOT NULL,
	UnitsTypeCV VARCHAR(255) NOT NULL,
	UnitsAbbreviation VARCHAR(50) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Units ADD CONSTRAINT pkUnits
	PRIMARY KEY (UnitsID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Core', 
	'table', 'Units', 'column', 'UnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Text name for the unit', 'schema', 'ODM2Core', 
	'table', 'Units', 'column', 'UnitsName';

EXEC sp_addextendedproperty 'MS_Description', 'CV term that defines the unit type', 'schema', 'ODM2Core', 
	'table', 'Units', 'column', 'UnitsTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Text abbreviation for the unit', 'schema', 'ODM2Core', 
	'table', 'Units', 'column', 'UnitsAbbreviation';

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
	ValueTypeCV VARCHAR(255) NOT NULL,
	DataTypeCV VARCHAR(255) NOT NULL,
	NoDataValue FLOAT NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Core.Variables ADD CONSTRAINT pkVariables
	PRIMARY KEY (VariableID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primay key', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term defining the variable type', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Unique text code for the variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableCode';

EXEC sp_addextendedproperty 'MS_Description', 'CV term for the variable name', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableNameCV';

EXEC sp_addextendedproperty 'MS_Description', 'Text definition of the variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'VariableDefinition';

EXEC sp_addextendedproperty 'MS_Description', 'CV term defining the spciation of the variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'SpeciationCV';

EXEC sp_addextendedproperty 'MS_Description', 'CV term defining the value type for the variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'ValueTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'CV term defining the data type for the variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'DataTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'No data value for the variable', 'schema', 'ODM2Core', 
	'table', 'Variables', 'column', 'NoDataValue';


/******************** Add Table: ODM2Equipment.CalibrationAction_Standards ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.CalibrationAction_Standards
(
	CalibrationActionID INTEGER NOT NULL,
	CalibrationStandardID INTEGER NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Links calibration standards to instrument calibration actions', 'schema', 'ODM2Equipment', 
	'table', CalibrationAction_Standards, null, null;


/******************** Add Table: ODM2Equipment.CalibrationActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.CalibrationActions
(
	CalibrationActionID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	ConfigurationActionID INTEGER NOT NULL,
	CalibrationFilePath VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.CalibrationActions ADD CONSTRAINT pkCalibrationActions
	PRIMARY KEY (CalibrationActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Describes equipment calibration actions', 'schema', 'ODM2Equipment', 
	'table', CalibrationActions, null, null;


/******************** Add Table: ODM2Equipment.CalibrationEquations ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.CalibrationEquations
(
	CalibrationEquationID INTEGER NOT NULL,
	CalibrationActionID INTEGER NOT NULL,
	InstrumentOutputVariableID INTEGER NOT NULL,
	OutputVariableEquation VARCHAR(255) NOT NULL,
	OutputVariableCoefficient1 FLOAT NOT NULL,
	OutputVariableCoefficient2 FLOAT NULL,
	OutputVariableCoefficient3 FLOAT NULL,
	OutputVariableUncertainty FLOAT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.CalibrationEquations ADD CONSTRAINT pkCalibrationEquations
	PRIMARY KEY (CalibrationEquationID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Describes equations used to calibrate pieces of equipment', 'schema', 'ODM2Equipment', 
	'table', CalibrationEquations, null, null;


/******************** Add Table: ODM2Equipment.CalibrationStandardValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.CalibrationStandardValues
(
	CalibrationStandardValueID INTEGER IDENTITY (1, 1) NOT NULL,
	CalibrationStandardID INTEGER NOT NULL,
	VariableID INTEGER NOT NULL,
	CalibrationStandardValue FLOAT NOT NULL,
	UnitsID INTEGER NOT NULL,
	Source VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.CalibrationStandardValues ADD CONSTRAINT pkCalibrationStandardValues
	PRIMARY KEY (CalibrationStandardValueID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationStandardValues', 'column', 'CalibrationStandardValueID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifer for the Calibration Standard for which the Calibration Standard Value applies', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationStandardValues', 'column', 'CalibrationStandardID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Variable that describes the Calibration Standard Value', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationStandardValues', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Numeric value of the calibration standard', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationStandardValues', 'column', 'CalibrationStandardValue';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier fro the Units of the calibration standard', 'schema', 'ODM2Equipment', 
	'table', 'CalibrationStandardValues', 'column', 'UnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes calibration standard values', 'schema', 'ODM2Equipment', 
	'table', CalibrationStandardValues, null, null;


/******************** Add Table: ODM2Equipment.CalibrationStandards ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.CalibrationStandards
(
	CalibrationStandardID INTEGER IDENTITY (1, 1) NOT NULL,
	SpecimenID INTEGER NOT NULL,
	CalibrationStandardVendorID INTEGER NOT NULL,
	CalibrationStandardTypeCV VARCHAR(255) NOT NULL,
	CalibrationStandardLotCode VARCHAR(50) NULL,
	CalibrationStandardPurchaseDate DATETIME NULL,
	CalibrationStandardExpirationDate DATETIME NULL,
	CalibrationStandardCertificateLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.CalibrationStandards ADD CONSTRAINT pkCalibrationStandards
	PRIMARY KEY (CalibrationStandardID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Describes calibration standards', 'schema', 'ODM2Equipment', 
	'table', CalibrationStandards, null, null;


/******************** Add Table: ODM2Equipment.ConfigurationActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.ConfigurationActions
(
	ConfigurationActionID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	ConfigurationFilePath VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.ConfigurationActions ADD CONSTRAINT pkConfigurationActions
	PRIMARY KEY (ConfigurationActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Equipment', 
	'table', 'ConfigurationActions', 'column', 'ConfigurationActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Action that is the configuration action', 'schema', 'ODM2Equipment', 
	'table', 'ConfigurationActions', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'File path to a file containing information about the configuration', 'schema', 'ODM2Equipment', 
	'table', 'ConfigurationActions', 'column', 'ConfigurationFilePath';

EXEC sp_addextendedproperty 'MS_Description', 'Describes equipment configuration actions', 'schema', 'ODM2Equipment', 
	'table', ConfigurationActions, null, null;


/******************** Add Table: ODM2Equipment.Equipment ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.Equipment
(
	EquipmentID INTEGER IDENTITY (1, 1) NOT NULL,
	EquipmentCode VARCHAR(50) NOT NULL,
	EquipmentName VARCHAR(255) NOT NULL,
	EquipmentTypeCV VARCHAR(255) NOT NULL,
	ModelID INTEGER NOT NULL,
	EquipmentSerialNumber VARCHAR(50) NOT NULL,
	EquipmentInventoryNumber VARCHAR(50) NULL,
	EquipmentOwnerID INTEGER NOT NULL,
	EquipmentVendorID INTEGER NOT NULL,
	EquipmentPurchaseDate DATETIME NOT NULL,
	EquipmentPurchaseOrderNumber VARCHAR(50) NULL,
	EquipmentPhotoFileName VARCHAR(255) NULL,
	EquipmentNotes VARCHAR(255) NULL,
	ParentEquipmentID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.Equipment ADD CONSTRAINT pkEquipment
	PRIMARY KEY (EquipmentID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentID';

EXEC sp_addextendedproperty 'MS_Description', 'A text code that identifies the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentCode';

EXEC sp_addextendedproperty 'MS_Description', 'A text name for the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentName';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the equipment type (e.g., sensor, datalogger, solar panel, etc.)', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the model of the equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'ModelID';

EXEC sp_addextendedproperty 'MS_Description', 'Manufacturer''s serial number for the specific piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentSerialNumber';

EXEC sp_addextendedproperty 'MS_Description', 'Owner''s inventory number for the specific piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentInventoryNumber';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifer for the person that owns the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentOwnerID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the vendor organization for the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentVendorID';

EXEC sp_addextendedproperty 'MS_Description', 'Date that the piece of equipment was purchased', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentPurchaseDate';

EXEC sp_addextendedproperty 'MS_Description', 'A text string identifying the purchase order used to purchase the piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentPurchaseOrderNumber';

EXEC sp_addextendedproperty 'MS_Description', 'A file name, path, or URL to a photo of the specific piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentPhotoFileName';

EXEC sp_addextendedproperty 'MS_Description', 'Text notes about the specific piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'EquipmentNotes';

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the piece of equipment that is the parent of the current piece of equipment', 'schema', 'ODM2Equipment', 
	'table', 'Equipment', 'column', 'ParentEquipmentID';

EXEC sp_addextendedproperty 'MS_Description', 'Descriptions of specific pieces of equipment.', 'schema', 'ODM2Equipment', 
	'table', Equipment, null, null;


/******************** Add Table: ODM2Equipment.EquipmentModels ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.EquipmentModels
(
	ModelID INTEGER IDENTITY (1, 1) NOT NULL,
	ModelManufacturerID INTEGER NOT NULL,
	ModelPartNumber VARCHAR(50) NULL,
	ModelName VARCHAR(255) NOT NULL,
	ModelDescription VARCHAR(500) NULL,
	ModelNotes VARCHAR(500) NULL,
	ModelSpecificationsFile VARCHAR(255) NULL,
	ModelLink VARCHAR(255) NULL,
	IsInstrument BIT NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.EquipmentModels ADD CONSTRAINT pkEquipmentModels
	PRIMARY KEY (ModelID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the model manufacturer', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelManufacturerID';

EXEC sp_addextendedproperty 'MS_Description', 'A part number for the equipment model', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelPartNumber';

EXEC sp_addextendedproperty 'MS_Description', 'Text name of the equipment model', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelName';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the equipment model', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Text notes that go with the equipment model', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelNotes';

EXEC sp_addextendedproperty 'MS_Description', 'File name, path, or URL to a specifications file for the equipment', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelSpecificationsFile';

EXEC sp_addextendedproperty 'MS_Description', 'A URL to a website having a description of the equipment model', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'ModelLink';

EXEC sp_addextendedproperty 'MS_Description', 'A boolean indication of whether the equipment is a sensor/instrument used to make observations', 'schema', 'ODM2Equipment', 
	'table', 'EquipmentModels', 'column', 'IsInstrument';

EXEC sp_addextendedproperty 'MS_Description', 'Describes models of sensors, loggers, and related equipment used in making observations.', 'schema', 'ODM2Equipment', 
	'table', EquipmentModels, null, null;


/******************** Add Table: ODM2Equipment.InstrumentOutputVariables ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.InstrumentOutputVariables
(
	InstrumentOutputVariableID INTEGER IDENTITY (1, 1) NOT NULL,
	ConfigurationActionID INTEGER NOT NULL,
	VariableID INTEGER NOT NULL,
	UnitsID INTEGER NOT NULL,
	OutputFileColumnLabel VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.InstrumentOutputVariables ADD CONSTRAINT pkInstrumentOutputVariables
	PRIMARY KEY (InstrumentOutputVariableID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'InstrumentOutputVariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the configuration action that created the instrument output variable', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'ConfigurationActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier to the variable that is the instrument output variable', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the units of the instrument output variable', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'UnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Header label of the datalogger file output column', 'schema', 'ODM2Equipment', 
	'table', 'InstrumentOutputVariables', 'column', 'OutputFileColumnLabel';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the variables output by a sensor/instrument', 'schema', 'ODM2Equipment', 
	'table', InstrumentOutputVariables, null, null;


/******************** Add Table: ODM2Equipment.MaintenenceActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Equipment.MaintenenceActions
(
	MaintenanceActionID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	IsFactoryService BIT NOT NULL,
	FactoryServiceCode VARCHAR(50) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Equipment.MaintenenceActions ADD CONSTRAINT pkMaintenenceActions
	PRIMARY KEY (MaintenanceActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Equipment', 
	'table', 'MaintenenceActions', 'column', 'MaintenanceActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Action that is the Maintenance Action', 'schema', 'ODM2Equipment', 
	'table', 'MaintenenceActions', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'A boolean indicator of whether the maintenance action is a factory service', 'schema', 'ODM2Equipment', 
	'table', 'MaintenenceActions', 'column', 'IsFactoryService';

EXEC sp_addextendedproperty 'MS_Description', 'A text code assigned by the factory that identifies the service', 'schema', 'ODM2Equipment', 
	'table', 'MaintenenceActions', 'column', 'FactoryServiceCode';

EXEC sp_addextendedproperty 'MS_Description', 'Describes equipment maintenance actions', 'schema', 'ODM2Equipment', 
	'table', MaintenenceActions, null, null;


/******************** Add Table: ODM2Extension.ExtensionProperties ************************/

/* Build Table Structure */
CREATE TABLE ODM2Extension.ExtensionProperties
(
	PropertyID INTEGER IDENTITY (1, 1) NOT NULL,
	PropertyName VARCHAR(255) NOT NULL,
	PropertyDescription VARCHAR(500) NULL,
	PropertyDataTypeCV VARCHAR(255) NOT NULL,
	PropertyUnitsID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Extension.ExtensionProperties ADD CONSTRAINT pkExtensionProperties
	PRIMARY KEY (PropertyID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Extension', 
	'table', 'ExtensionProperties', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Text name of the extension property', 'schema', 'ODM2Extension', 
	'table', 'ExtensionProperties', 'column', 'PropertyName';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the extension property', 'schema', 'ODM2Extension', 
	'table', 'ExtensionProperties', 'column', 'PropertyDescription';

EXEC sp_addextendedproperty 'MS_Description', 'CV term specifying the data type of the property value', 'schema', 'ODM2Extension', 
	'table', 'ExtensionProperties', 'column', 'PropertyDataTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the units of the property value', 'schema', 'ODM2Extension', 
	'table', 'ExtensionProperties', 'column', 'PropertyUnitsID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes extension properties added to objects in an ODM database', 'schema', 'ODM2Extension', 
	'table', ExtensionProperties, null, null;


/******************** Add Table: ODM2Extension.MethodExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Extension.MethodExtensionPropertyValues
(
	MethodID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Method', 'schema', 'ODM2Extension', 
	'table', 'MethodExtensionPropertyValues', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the extension property', 'schema', 'ODM2Extension', 
	'table', 'MethodExtensionPropertyValues', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Text or numeric value of the extension property', 'schema', 'ODM2Extension', 
	'table', 'MethodExtensionPropertyValues', 'column', 'PropertyValue';

EXEC sp_addextendedproperty 'MS_Description', 'Links extnsion properties to a Method', 'schema', 'ODM2Extension', 
	'table', MethodExtensionPropertyValues, null, null;


/******************** Add Table: ODM2Extension.ResultsExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Extension.ResultsExtensionPropertyValues
(
	ResultID BIGINT NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the result to which the extension property applies', 'schema', 'ODM2Extension', 
	'table', 'ResultsExtensionPropertyValues', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the extension propery', 'schema', 'ODM2Extension', 
	'table', 'ResultsExtensionPropertyValues', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Text or numeric value of the extension property', 'schema', 'ODM2Extension', 
	'table', 'ResultsExtensionPropertyValues', 'column', 'PropertyValue';

EXEC sp_addextendedproperty 'MS_Description', 'Links extension properties to a Result', 'schema', 'ODM2Extension', 
	'table', ResultsExtensionPropertyValues, null, null;


/******************** Add Table: ODM2Extension.VariableExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Extension.VariableExtensionPropertyValues
(
	VariableID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the variable being extended', 'schema', 'ODM2Extension', 
	'table', 'VariableExtensionPropertyValues', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the extension property being applied to the variable', 'schema', 'ODM2Extension', 
	'table', 'VariableExtensionPropertyValues', 'column', 'PropertyID';

EXEC sp_addextendedproperty 'MS_Description', 'Text or numeric value of the extension property for the variable', 'schema', 'ODM2Extension', 
	'table', 'VariableExtensionPropertyValues', 'column', 'PropertyValue';


/******************** Add Table: ODM2ExternalIdentifiers.DataSetExternalIdentifers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.DataSetExternalIdentifers
(
	DataSetID INTEGER NOT NULL,
	ExternalIdentiferSystemID INTEGER NOT NULL,
	DataSetExternalIdentifer VARCHAR(255) NOT NULL,
	DataSetExternalIdentiferURN VARCHAR(255) NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to DataSets', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'DataSetExternalIdentifers', 'column', 'DataSetID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'DataSetExternalIdentifers', 'column', 'ExternalIdentiferSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, like DOI; could be URN', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'DataSetExternalIdentifers', 'column', 'DataSetExternalIdentifer';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Name (URN) that can be resolved by the ExternalIdentifierSysem', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'DataSetExternalIdentifers', 'column', 'DataSetExternalIdentiferURN';


/******************** Add Table: ODM2ExternalIdentifiers.ExternalIdentifierSystems ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.ExternalIdentifierSystems
(
	ExternalIdentifierSystemID INTEGER NOT NULL,
	ExternalIdentifierSystemName VARCHAR(255) NOT NULL,
	IdentifierSystemOrganizationID INTEGER NOT NULL,
	ExternalIdentifierSystemDescription VARCHAR(255) NULL,
	ExternalIdentifierSystemURNResolverURL VARCHAR(255) NULL
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
	'table', 'ExternalIdentifierSystems', 'column', 'ExternalIdentifierSystemURNResolverURL';

EXEC sp_addextendedproperty 'MS_Description', 'A single table for connecting various primary keys with points to outside systems.', 'schema', 'ODM2ExternalIdentifiers', 
	'table', ExternalIdentifierSystems, null, null;


/******************** Add Table: ODM2ExternalIdentifiers.MethodExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.MethodExternalIdentifiers
(
	MethodID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	MethodExternalIdentifier VARCHAR(255) NOT NULL,
	MethodExternalIdentifierURN VARCHAR(255) NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to SamplingFeatures', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'MethodExternalIdentifiers', 'column', 'MethodID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'MethodExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, such as a NEMI method number; could be URN', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'MethodExternalIdentifiers', 'column', 'MethodExternalIdentifier';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Name (URN) that can be resolved by the ExternalIdentifierSysem', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'MethodExternalIdentifiers', 'column', 'MethodExternalIdentifierURN';


/******************** Add Table: ODM2ExternalIdentifiers.PersonExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.PersonExternalIdentifiers
(
	PersonID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	PersonExternalIdentifier VARCHAR(255) NOT NULL,
	PersonExternalIdenifierURN VARCHAR(255) NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to People table', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'PersonExternalIdentifiers', 'column', 'PersonID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'PersonExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, such as a social security number; could be URN', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'PersonExternalIdentifiers', 'column', 'PersonExternalIdentifier';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Name (URN) is a persistent, location-independent identifier for an online resource that follows the following scheme: i.e. urn:ioos:station:wmo:41001, urn:ioos:sensor:wmo:41001:baro1, urn:igsn:specimen:stroud:14567, urn:odm2:staff:stroud:aauf23', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'PersonExternalIdentifiers', 'column', 'PersonExternalIdenifierURN';

EXEC sp_addextendedproperty 'MS_Description', 'Cross reference "linking" table to allow many to many ', 'schema', 'ODM2ExternalIdentifiers', 
	'table', PersonExternalIdentifiers, null, null;


/******************** Add Table: ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers
(
	SamplingFeatureID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	SamplingFeatureExternalIdentifier VARCHAR(255) NOT NULL,
	SamplingFeatureExternalIdentiferURN VARCHAR(255) NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to SamplingFeatures', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SamplingFeatureExternalIdentifiers', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SamplingFeatureExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID, such as an IGSN; could be URN', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SamplingFeatureExternalIdentifiers', 'column', 'SamplingFeatureExternalIdentifier';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Name (URN) that can be resolved by the ExternalIdentifierSysem', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'SamplingFeatureExternalIdentifiers', 'column', 'SamplingFeatureExternalIdentiferURN';


/******************** Add Table: ODM2ExternalIdentifiers.VariableExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE ODM2ExternalIdentifiers.VariableExternalIdentifiers
(
	VariableID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	VariableExternalIdentifer VARCHAR(255) NOT NULL,
	VariableExternalIdentifierURN VARCHAR(255) NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to Variables', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'VariableExternalIdentifiers', 'column', 'VariableID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign Key to ExternalIdentifierSystems', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'VariableExternalIdentifiers', 'column', 'ExternalIdentifierSystemID';

EXEC sp_addextendedproperty 'MS_Description', 'A resolvable, globally unique ID; could be URN', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'VariableExternalIdentifiers', 'column', 'VariableExternalIdentifer';

EXEC sp_addextendedproperty 'MS_Description', 'Uniform Resource Name (URN) that can be resolved by the ExternalIdentifierSysem', 'schema', 'ODM2ExternalIdentifiers', 
	'table', 'VariableExternalIdentifiers', 'column', 'VariableExternalIdentifierURN';


/******************** Add Table: ODM2Provenance.InputResults ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.InputResults
(
	ResultProvenanceID INTEGER NOT NULL,
	InputResultID BIGINT NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the provenance record describing the derived result', 'schema', 'ODM2Provenance', 
	'table', 'InputResults', 'column', 'ResultProvenanceID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key indentifier for the input result from which the derived result was created', 'schema', 'ODM2Provenance', 
	'table', 'InputResults', 'column', 'InputResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Defines the input results that were used to create a derived result', 'schema', 'ODM2Provenance', 
	'table', InputResults, null, null;


/******************** Add Table: ODM2Provenance.ResultProvenance ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.ResultProvenance
(
	ResultProvenanceID INTEGER IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	ProcessedDateTime DATETIME NOT NULL,
	ProcessedUTCOffset INTEGER NOT NULL,
	ProcessMethodID INTEGER NOT NULL,
	ProcessedByID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.ResultProvenance ADD CONSTRAINT pkResultProvenance
	PRIMARY KEY (ResultProvenanceID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Provenance', 
	'table', 'ResultProvenance', 'column', 'ResultProvenanceID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the derived result for wich the provenance is being tracked', 'schema', 'ODM2Provenance', 
	'table', 'ResultProvenance', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Date/time at which the provenance record was created', 'schema', 'ODM2Provenance', 
	'table', 'ResultProvenance', 'column', 'ProcessedDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'UTCOffset of ProcessedDateTime', 'schema', 'ODM2Provenance', 
	'table', 'ResultProvenance', 'column', 'ProcessedUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the method used to generate the derived result', 'schema', 'ODM2Provenance', 
	'table', 'ResultProvenance', 'column', 'ProcessMethodID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the person that created the derived dataset', 'schema', 'ODM2Provenance', 
	'table', 'ResultProvenance', 'column', 'ProcessedByID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes the provenance of a derived result', 'schema', 'ODM2Provenance', 
	'table', ResultProvenance, null, null;


/******************** Add Table: ODM2Provenance.ResultVersions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Provenance.ResultVersions
(
	ResultVersionID INTEGER IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	VersionOfResultsSetID BIGINT NOT NULL,
	VersionCode VARCHAR(50) NOT NULL,
	VersionDefinition VARCHAR(500) NULL,
	VersionExplanation VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Provenance.ResultVersions ADD CONSTRAINT pkResultVersions
	PRIMARY KEY (ResultVersionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Provenance', 
	'table', 'ResultVersions', 'column', 'ResultVersionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the result version', 'schema', 'ODM2Provenance', 
	'table', 'ResultVersions', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Result that the current Result is a version of', 'schema', 'ODM2Provenance', 
	'table', 'ResultVersions', 'column', 'VersionOfResultsSetID';

EXEC sp_addextendedproperty 'MS_Description', 'Text code identifying the version', 'schema', 'ODM2Provenance', 
	'table', 'ResultVersions', 'column', 'VersionCode';

EXEC sp_addextendedproperty 'MS_Description', 'Text definition of the version', 'schema', 'ODM2Provenance', 
	'table', 'ResultVersions', 'column', 'VersionDefinition';

EXEC sp_addextendedproperty 'MS_Description', 'A text explanation of the version', 'schema', 'ODM2Provenance', 
	'table', 'ResultVersions', 'column', 'VersionExplanation';

EXEC sp_addextendedproperty 'MS_Description', 'Describes versions of results', 'schema', 'ODM2Provenance', 
	'table', ResultVersions, null, null;


/******************** Add Table: ODM2Results.OffsetOrigins ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.OffsetOrigins
(
	OffsetOriginID INTEGER IDENTITY (1, 1) NOT NULL,
	OffsetOriginDescription VARCHAR(500) NOT NULL,
	OffsetCoordinateUnitsID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Results.OffsetOrigins ADD CONSTRAINT pkOffsetOrigins
	PRIMARY KEY (OffsetOriginID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Primary key', 'schema', 'ODM2Results', 
	'table', 'OffsetOrigins', 'column', 'OffsetOriginID';

EXEC sp_addextendedproperty 'MS_Description', 'Description of the origin of the coordinate system for the X, Y, and Z coordinates that specify the offset from the sampilng feature.', 'schema', 'ODM2Results', 
	'table', 'OffsetOrigins', 'column', 'OffsetOriginDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Units of X, Y, and Z coordinates', 'schema', 'ODM2Results', 
	'table', 'OffsetOrigins', 'column', 'OffsetCoordinateUnitsID';


/******************** Add Table: ODM2Results.ResultValues ************************/

/* Build Table Structure */
CREATE TABLE ODM2Results.ResultValues
(
	ValueID BIGINT IDENTITY (1, 1) NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime DATETIME NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	OffsetOriginID INTEGER NULL,
	ValueXLocation FLOAT NULL,
	ValueYLocation FLOAT NULL,
	ValueZLocation FLOAT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NULL,
	AggregationDuration VARCHAR(255) NOT NULL,
	InterpolationTypeCV VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Results.ResultValues ADD CONSTRAINT pkResultValues
	PRIMARY KEY (ValueID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'ValueID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Result containing the data value', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'ResultID';

EXEC sp_addextendedproperty 'MS_Description', 'Numeric data value of the result', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'DataValue';

EXEC sp_addextendedproperty 'MS_Description', 'Date/time associated with the Result value', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'ValueDateTime';

EXEC sp_addextendedproperty 'MS_Description', 'UTC offset of the date/time associated with the Result value', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'ValueDateTimeUTCOffset';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key of the offset origin', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'OffsetOriginID';

EXEC sp_addextendedproperty 'MS_Description', 'X coordinate of the value offset with respect to the offset origin', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'ValueXLocation';

EXEC sp_addextendedproperty 'MS_Description', 'Y coordinate of the value offset with respect to the offset origin', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'ValueYLocation';

EXEC sp_addextendedproperty 'MS_Description', 'Z coordinate of the value offset with respect to the offset origin', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'ValueZLocation';

EXEC sp_addextendedproperty 'MS_Description', 'CV term specifying whether the result is censored or not (e.g., below a detection limit)', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'CensorCodeCV';

EXEC sp_addextendedproperty 'MS_Description', 'CV term specifying the quality of the result value', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'QualityCodeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Description of the time support of the result value', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'AggregationDuration';

EXEC sp_addextendedproperty 'MS_Description', 'CV term describing the type of aggregation or interpolation that does done over the AggregationDuration', 'schema', 'ODM2Results', 
	'table', 'ResultValues', 'column', 'InterpolationTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Describes individual data values within a Result', 'schema', 'ODM2Results', 
	'table', ResultValues, null, null;


/******************** Add Table: ODM2Samples.AnalysisBatchActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Samples.AnalysisBatchActions
(
	AnalysisBacthActionID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	ConfigurationActionID INTEGER NOT NULL,
	CalibrationActionID INTEGER NOT NULL,
	InstrumentOutputFilePath VARCHAR(255) NULL,
	AnalysisBatchEventNotes VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Samples.AnalysisBatchActions ADD CONSTRAINT pkAnalysisBatchActions
	PRIMARY KEY (AnalysisBacthActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Describes sample analysis batch events', 'schema', 'ODM2Samples', 
	'table', AnalysisBatchActions, null, null;


/******************** Add Table: ODM2Samples.BatchSampleLines ************************/

/* Build Table Structure */
CREATE TABLE ODM2Samples.BatchSampleLines
(
	BatchSampleLineID INTEGER IDENTITY (1, 1) NOT NULL,
	AnalysisBacthActionID INTEGER NULL,
	SampleID INTEGER NOT NULL,
	AnalysisBatchActionID INTEGER NOT NULL,
	BatchLineNumber INTEGER NOT NULL,
	BatchLineLabel VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Samples.BatchSampleLines ADD CONSTRAINT pkBatchSampleLines
	PRIMARY KEY (BatchSampleLineID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Describes sample analysis batch sample lines', 'schema', 'ODM2Samples', 
	'table', BatchSampleLines, null, null;


/******************** Add Table: ODM2Samples.SamplePreparationAction ************************/

/* Build Table Structure */
CREATE TABLE ODM2Samples.SamplePreparationAction
(
	SamplePreparationActionID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Describes sample preparation events', 'schema', 'ODM2Samples', 
	'table', SamplePreparationAction, null, null;


/******************** Add Table: ODM2SamplingFeatures.FeatureParents ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.FeatureParents
(
	SamplingFeatureID INTEGER NOT NULL,
	ParentFeatureID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	SpatialOffsetID INTEGER NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Foregn key identifier of a Sampling Feature', 'schema', 'ODM2SamplingFeatures', 
	'table', 'FeatureParents', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of a Sampling Feature that is the parent of the current Sampling Feature', 'schema', 'ODM2SamplingFeatures', 
	'table', 'FeatureParents', 'column', 'ParentFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'A text description of the type of relationship among the Sampling Features', 'schema', 'ODM2SamplingFeatures', 
	'table', 'FeatureParents', 'column', 'RelationshipTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of a spatial offset from the feature parent', 'schema', 'ODM2SamplingFeatures', 
	'table', 'FeatureParents', 'column', 'SpatialOffsetID';

EXEC sp_addextendedproperty 'MS_Description', 'Describes parrent/child relationships among Sampling Features', 'schema', 'ODM2SamplingFeatures', 
	'table', FeatureParents, null, null;


/******************** Add Table: ODM2SamplingFeatures.Sites ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.Sites
(
	SiteID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	SiteCode VARCHAR(50) NOT NULL,
	SiteName VARCHAR(255) NOT NULL,
	Latitude FLOAT NOT NULL,
	Longitude FLOAT NOT NULL,
	LatLongDatumID INTEGER NOT NULL,
	Elevation_m FLOAT NULL,
	VerticalDatumCV VARCHAR(255) NULL,
	SiteTypeCV VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2SamplingFeatures.Sites ADD CONSTRAINT pkSites
	PRIMARY KEY (SiteID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'SiteID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier of the Sampling Feature that is the Site', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'A text code that identifies the site (e.g., a USGS Gage number)', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'SiteCode';

EXEC sp_addextendedproperty 'MS_Description', 'A text name for the site', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'SiteName';

EXEC sp_addextendedproperty 'MS_Description', 'Latitude of the site', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'Latitude';

EXEC sp_addextendedproperty 'MS_Description', 'Longitude of the site', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'Longitude';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Spatial Reference System that describes the latitude and longitude coordinates', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'LatLongDatumID';

EXEC sp_addextendedproperty 'MS_Description', 'The elevation of the site in meters above some vertical datum', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'Elevation_m';

EXEC sp_addextendedproperty 'MS_Description', 'A CV term describing the vertical datum to which the site elevation is referenced', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'VerticalDatumCV';

EXEC sp_addextendedproperty 'MS_Description', 'A CV term describing the site type', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Sites', 'column', 'SiteTypeCV';

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
EXEC sp_addextendedproperty 'MS_Description', 'An explicit spatial relationship between a sampling feature and it''s parent.', 'schema', 'ODM2SamplingFeatures', 
	'table', SpatialOffsets, null, null;


/******************** Add Table: ODM2SamplingFeatures.SpatialReferences ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.SpatialReferences
(
	SpatialReferenceID INTEGER IDENTITY (1, 1) NOT NULL,
	SRSID INTEGER NULL,
	SRSName VARCHAR(255) NOT NULL,
	Notes VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2SamplingFeatures.SpatialReferences ADD CONSTRAINT pkSpatialReferences
	PRIMARY KEY (SpatialReferenceID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialReferences', 'column', 'SpatialReferenceID';

EXEC sp_addextendedproperty 'MS_Description', 'SRS code for the spatial reference system', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialReferences', 'column', 'SRSID';

EXEC sp_addextendedproperty 'MS_Description', 'Text name of the spatial reference system', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialReferences', 'column', 'SRSName';

EXEC sp_addextendedproperty 'MS_Description', 'Text notes describing the spatial reference system', 'schema', 'ODM2SamplingFeatures', 
	'table', 'SpatialReferences', 'column', 'Notes';

EXEC sp_addextendedproperty 'MS_Description', 'Describes spatial reference systems used to reference the coordinates for sites', 'schema', 'ODM2SamplingFeatures', 
	'table', SpatialReferences, null, null;


/******************** Add Table: ODM2SamplingFeatures.Specimens ************************/

/* Build Table Structure */
CREATE TABLE ODM2SamplingFeatures.Specimens
(
	SpecimenID INTEGER IDENTITY (1, 1) NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	IsFieldSpecimen BIT NOT NULL,
	SpecimenTypeCV VARCHAR(255) NOT NULL,
	SpecimenMediumCV VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE ODM2SamplingFeatures.Specimens ADD CONSTRAINT pkSpecimens
	PRIMARY KEY (SpecimenID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Specimens', 'column', 'SpecimenID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Sampling Feature that is the specimen', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Specimens', 'column', 'SamplingFeatureID';

EXEC sp_addextendedproperty 'MS_Description', 'A boolean indicating whether the speciment was collected in the field', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Specimens', 'column', 'IsFieldSpecimen';

EXEC sp_addextendedproperty 'MS_Description', 'A CV term defining the type of speciment (e.g., aquatic sample, core, etc.)', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Specimens', 'column', 'SpecimenTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'A CV term defining the medium of the specimen', 'schema', 'ODM2SamplingFeatures', 
	'table', 'Specimens', 'column', 'SpecimenMediumCV';

EXEC sp_addextendedproperty 'MS_Description', 'Equivalent to O&M Sampling Feature Type "Specimen".  Describes physical samples or specimens.', 'schema', 'ODM2SamplingFeatures', 
	'table', Specimens, null, null;


/******************** Add Table: ODM2Sensors.DataLoggerFiles ************************/

/* Build Table Structure */
CREATE TABLE ODM2Sensors.DataLoggerFiles
(
	DataLoggerFileID INTEGER IDENTITY (1, 1) NOT NULL,
	DeploymentActionID INTEGER NOT NULL,
	DataLoggerOutputFilePath VARCHAR(255) NOT NULL,
	DataLoggerOutputFileDescription VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Sensors.DataLoggerFiles ADD CONSTRAINT pkDataLoggerFiles
	PRIMARY KEY (DataLoggerFileID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the datalogger file', 'schema', 'ODM2Sensors', 
	'table', 'DataLoggerFiles', 'column', 'DataLoggerFileID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the deployment action that created the datalogger file', 'schema', 'ODM2Sensors', 
	'table', 'DataLoggerFiles', 'column', 'DeploymentActionID';

EXEC sp_addextendedproperty 'MS_Description', 'File path to the datalogger file', 'schema', 'ODM2Sensors', 
	'table', 'DataLoggerFiles', 'column', 'DataLoggerOutputFilePath';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the datalogger file', 'schema', 'ODM2Sensors', 
	'table', 'DataLoggerFiles', 'column', 'DataLoggerOutputFileDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Destibes datalogger files created by a deployment action', 'schema', 'ODM2Sensors', 
	'table', DataLoggerFiles, null, null;


/******************** Add Table: ODM2Sensors.DeploymentActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Sensors.DeploymentActions
(
	DeploymentActionID INTEGER IDENTITY (1, 1) NOT NULL,
	ActionID INTEGER NOT NULL,
	DeploymentTypeCV VARCHAR(255) NOT NULL,
	DeploymentDescription VARCHAR(500) NULL,
	ConfigurationActionID INTEGER NOT NULL,
	CalibrationActionID INTEGER NOT NULL,
	SpatialOffsetID INTEGER NULL,
	DeploymentNotes VARCHAR(500) NULL,
	DeploymentSchematic VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE ODM2Sensors.DeploymentActions ADD CONSTRAINT pkDeploymentActions
	PRIMARY KEY (DeploymentActionID);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the deployment ', 'schema', 'ODM2Sensors', 
	'table', 'DeploymentActions', 'column', 'DeploymentActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifer for the Action that is the deployment', 'schema', 'ODM2Sensors', 
	'table', 'DeploymentActions', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'CV term that describes the type of the deployment', 'schema', 'ODM2Sensors', 
	'table', 'DeploymentActions', 'column', 'DeploymentTypeCV';

EXEC sp_addextendedproperty 'MS_Description', 'A text description of the deployment', 'schema', 'ODM2Sensors', 
	'table', 'DeploymentActions', 'column', 'DeploymentDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the configuration action associated with the deployment', 'schema', 'ODM2Sensors', 
	'table', 'DeploymentActions', 'column', 'ConfigurationActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the calibration action associated with the deployment', 'schema', 'ODM2Sensors', 
	'table', 'DeploymentActions', 'column', 'CalibrationActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key idenfier for the SpatialOffset of the deployment', 'schema', 'ODM2Sensors', 
	'table', 'DeploymentActions', 'column', 'SpatialOffsetID';

EXEC sp_addextendedproperty 'MS_Description', 'Text notes describing the deployment', 'schema', 'ODM2Sensors', 
	'table', 'DeploymentActions', 'column', 'DeploymentNotes';

EXEC sp_addextendedproperty 'MS_Description', 'File path of of a file containing a schematic of the deployment.', 'schema', 'ODM2Sensors', 
	'table', 'DeploymentActions', 'column', 'DeploymentSchematic';

EXEC sp_addextendedproperty 'MS_Description', 'Describes actions that are deployment events', 'schema', 'ODM2Sensors', 
	'table', DeploymentActions, null, null;


/******************** Add Table: ODM2Sensors.Photos ************************/

/* Build Table Structure */
CREATE TABLE ODM2Sensors.Photos
(
	PhotoID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	PhotoFilePath VARCHAR(255) NOT NULL,
	PhotoDescription VARCHAR(500) NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the photograph', 'schema', 'ODM2Sensors', 
	'table', 'Photos', 'column', 'PhotoID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Action with which the photo is associated', 'schema', 'ODM2Sensors', 
	'table', 'Photos', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'File name, path, or URL of the photo file', 'schema', 'ODM2Sensors', 
	'table', 'Photos', 'column', 'PhotoFilePath';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the photograph', 'schema', 'ODM2Sensors', 
	'table', 'Photos', 'column', 'PhotoDescription';

EXEC sp_addextendedproperty 'MS_Description', 'Describes photographs that were collected as part of an action (e.g., a site visit)', 'schema', 'ODM2Sensors', 
	'table', Photos, null, null;


/******************** Add Table: ODM2Sensors.SiteVisitActions ************************/

/* Build Table Structure */
CREATE TABLE ODM2Sensors.SiteVisitActions
(
	SiteVisitID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	SiteVisitEnvironmentalObservations VARCHAR(500) NOT NULL
);

/* Add Comments */
EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier', 'schema', 'ODM2Sensors', 
	'table', 'SiteVisitActions', 'column', 'SiteVisitID';

EXEC sp_addextendedproperty 'MS_Description', 'Foreign key identifier for the Action that is the Site Visit', 'schema', 'ODM2Sensors', 
	'table', 'SiteVisitActions', 'column', 'ActionID';

EXEC sp_addextendedproperty 'MS_Description', 'Text description of the environmental conditions at the site when it was visited', 'schema', 'ODM2Sensors', 
	'table', 'SiteVisitActions', 'column', 'SiteVisitEnvironmentalObservations';

EXEC sp_addextendedproperty 'MS_Description', 'Describes site visit event activities', 'schema', 'ODM2Sensors', 
	'table', SiteVisitActions, null, null;





/************ Add Foreign Keys ***************/

/* Add Foreign Key: fk_Annotations_People */
ALTER TABLE ODM2Annotations.Annotations ADD CONSTRAINT fk_Annotations_People
	FOREIGN KEY (AnnotatorID) REFERENCES ODM2Core.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Annotations */
ALTER TABLE ODM2Annotations.MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Methods */
ALTER TABLE ODM2Annotations.MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Methods
	FOREIGN KEY (MethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Annotations */
ALTER TABLE ODM2Annotations.ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Results */
ALTER TABLE ODM2Annotations.ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultValueAnnotations_Annotations */
ALTER TABLE ODM2Annotations.ResultValueAnnotations ADD CONSTRAINT fk_ResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultValueAnnotations_ResultValues */
ALTER TABLE ODM2Annotations.ResultValueAnnotations ADD CONSTRAINT fk_ResultValueAnnotations_ResultValues
	FOREIGN KEY (ValueID) REFERENCES ODM2Results.ResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableAnnotations_Annotations */
ALTER TABLE ODM2Annotations.VariableAnnotations ADD CONSTRAINT fk_VariableAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES ODM2Annotations.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableAnnotations_Variables */
ALTER TABLE ODM2Annotations.VariableAnnotations ADD CONSTRAINT fk_VariableAnnotations_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Actions */
ALTER TABLE ODM2Core.ActionPeople ADD CONSTRAINT fk_ActionPeople_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Affiliations */
ALTER TABLE ODM2Core.ActionPeople ADD CONSTRAINT fk_ActionPeople_Affiliations
	FOREIGN KEY (AffiliationID) REFERENCES ODM2Core.Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Roles */
ALTER TABLE ODM2Core.ActionPeople ADD CONSTRAINT fk_ActionPeople_Roles
	FOREIGN KEY (RoleID) REFERENCES ODM2Core.Roles (RoleID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Actions_Directives */
ALTER TABLE ODM2Core.Actions ADD CONSTRAINT fk_Actions_Directives
	FOREIGN KEY (DirectiveID) REFERENCES ODM2Core.Directives (DirectiveID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Actions_Equipment */
ALTER TABLE ODM2Core.Actions ADD CONSTRAINT fk_Actions_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES ODM2Equipment.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Actions_Methods */
ALTER TABLE ODM2Core.Actions ADD CONSTRAINT fk_Actions_Methods
	FOREIGN KEY (MethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Actions_ParentChild */
ALTER TABLE ODM2Core.Actions ADD CONSTRAINT fk_Actions_ParentChild
	FOREIGN KEY (ParentActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Actions_SamplingFeatures */
ALTER TABLE ODM2Core.Actions ADD CONSTRAINT fk_Actions_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
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

/* Add Foreign Key: fk_Methods_Organizations */
ALTER TABLE ODM2Core.Methods ADD CONSTRAINT fk_Methods_Organizations
	FOREIGN KEY (OrganizationID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Organizations_Organizations */
ALTER TABLE ODM2Core.Organizations ADD CONSTRAINT fk_Organizations_Organizations
	FOREIGN KEY (ParentOrganizationID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results */
ALTER TABLE ODM2Core.RelatedResults ADD CONSTRAINT fk_RelatedResults_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results_AreRelated */
ALTER TABLE ODM2Core.RelatedResults ADD CONSTRAINT fk_RelatedResults_Results_AreRelated
	FOREIGN KEY (RelatedResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Actions */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_QualityControlLevels */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_QualityControlLevels
	FOREIGN KEY (QualityControlLevelID) REFERENCES ODM2Core.QualityControlLevels (QualityControlLevelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Units */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_Units
	FOREIGN KEY (UnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Variables */
ALTER TABLE ODM2Core.Results ADD CONSTRAINT fk_Results_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatures_SpatialReferences */
ALTER TABLE ODM2Core.SamplingFeatures ADD CONSTRAINT fk_SamplingFeatures_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES ODM2SamplingFeatures.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationAction_Standards_CalibrationActions */
ALTER TABLE ODM2Equipment.CalibrationAction_Standards ADD CONSTRAINT fk_CalibrationAction_Standards_CalibrationActions
	FOREIGN KEY (CalibrationActionID) REFERENCES ODM2Equipment.CalibrationActions (CalibrationActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationAction_Standards_CalibrationStandards */
ALTER TABLE ODM2Equipment.CalibrationAction_Standards ADD CONSTRAINT fk_CalibrationAction_Standards_CalibrationStandards
	FOREIGN KEY (CalibrationStandardID) REFERENCES ODM2Equipment.CalibrationStandards (CalibrationStandardID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationActions_Actions */
ALTER TABLE ODM2Equipment.CalibrationActions ADD CONSTRAINT fk_CalibrationActions_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationActions_ConfigurationActions */
ALTER TABLE ODM2Equipment.CalibrationActions ADD CONSTRAINT fk_CalibrationActions_ConfigurationActions
	FOREIGN KEY (ConfigurationActionID) REFERENCES ODM2Equipment.ConfigurationActions (ConfigurationActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationEquations_CalibrationActions */
ALTER TABLE ODM2Equipment.CalibrationEquations ADD CONSTRAINT fk_CalibrationEquations_CalibrationActions
	FOREIGN KEY (CalibrationActionID) REFERENCES ODM2Equipment.CalibrationActions (CalibrationActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationEquations_InstrumentOutputVariables */
ALTER TABLE ODM2Equipment.CalibrationEquations ADD CONSTRAINT fk_CalibrationEquations_InstrumentOutputVariables
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES ODM2Equipment.InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationStandardValues_CalibrationStandards */
ALTER TABLE ODM2Equipment.CalibrationStandardValues ADD CONSTRAINT fk_CalibrationStandardValues_CalibrationStandards
	FOREIGN KEY (CalibrationStandardID) REFERENCES ODM2Equipment.CalibrationStandards (CalibrationStandardID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationStandardValues_Units */
ALTER TABLE ODM2Equipment.CalibrationStandardValues ADD CONSTRAINT fk_CalibrationStandardValues_Units
	FOREIGN KEY (UnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationStandardValues_Variables */
ALTER TABLE ODM2Equipment.CalibrationStandardValues ADD CONSTRAINT fk_CalibrationStandardValues_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationStandards_Organizations */
ALTER TABLE ODM2Equipment.CalibrationStandards ADD CONSTRAINT fk_CalibrationStandards_Organizations
	FOREIGN KEY (CalibrationStandardVendorID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationStandards_Specimen */
ALTER TABLE ODM2Equipment.CalibrationStandards ADD CONSTRAINT fk_CalibrationStandards_Specimen
	FOREIGN KEY (SpecimenID) REFERENCES ODM2SamplingFeatures.Specimens (SpecimenID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ConfigurationActions_Actions */
ALTER TABLE ODM2Equipment.ConfigurationActions ADD CONSTRAINT fk_ConfigurationActions_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_EquipmentModels */
ALTER TABLE ODM2Equipment.Equipment ADD CONSTRAINT fk_Equipment_EquipmentModels
	FOREIGN KEY (ModelID) REFERENCES ODM2Equipment.EquipmentModels (ModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_Organizations */
ALTER TABLE ODM2Equipment.Equipment ADD CONSTRAINT fk_Equipment_Organizations
	FOREIGN KEY (EquipmentVendorID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_ParentChild */
ALTER TABLE ODM2Equipment.Equipment ADD CONSTRAINT fk_Equipment_ParentChild
	FOREIGN KEY (ParentEquipmentID) REFERENCES ODM2Equipment.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_People */
ALTER TABLE ODM2Equipment.Equipment ADD CONSTRAINT fk_Equipment_People
	FOREIGN KEY (EquipmentOwnerID) REFERENCES ODM2Core.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentModels_Organizations */
ALTER TABLE ODM2Equipment.EquipmentModels ADD CONSTRAINT fk_EquipmentModels_Organizations
	FOREIGN KEY (ModelManufacturerID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_ConfigurationActions */
ALTER TABLE ODM2Equipment.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_ConfigurationActions
	FOREIGN KEY (ConfigurationActionID) REFERENCES ODM2Equipment.ConfigurationActions (ConfigurationActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Units */
ALTER TABLE ODM2Equipment.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Units
	FOREIGN KEY (UnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Variables */
ALTER TABLE ODM2Equipment.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MaintenenceActions_Actions */
ALTER TABLE ODM2Equipment.MaintenenceActions ADD CONSTRAINT fk_MaintenenceActions_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExtensionProperties_Units */
ALTER TABLE ODM2Extension.ExtensionProperties ADD CONSTRAINT fk_ExtensionProperties_Units
	FOREIGN KEY (PropertyUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ODM2Extension.MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ODM2Extension.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_Methods */
ALTER TABLE ODM2Extension.MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_Methods
	FOREIGN KEY (MethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsSetsExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ODM2Extension.ResultsExtensionPropertyValues ADD CONSTRAINT fk_ResultsSetsExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ODM2Extension.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsSetsExtensionPropertyValues_Results */
ALTER TABLE ODM2Extension.ResultsExtensionPropertyValues ADD CONSTRAINT fk_ResultsSetsExtensionPropertyValues_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_ExtensionProperties */
ALTER TABLE ODM2Extension.VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES ODM2Extension.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_Variables */
ALTER TABLE ODM2Extension.VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_Variables
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSets_ExternalIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.DataSetExternalIdentifers ADD CONSTRAINT fk_DataSets_ExternalIdentifiers
	FOREIGN KEY (DataSetID) REFERENCES ODM2Core.DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_DataSetIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.DataSetExternalIdentifers ADD CONSTRAINT fk_ExternalIdentifierSystems_DataSetIdentifiers
	FOREIGN KEY (ExternalIdentiferSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_Organizations */
ALTER TABLE ODM2ExternalIdentifiers.ExternalIdentifierSystems ADD CONSTRAINT fk_ExternalIdentifierSystems_Organizations
	FOREIGN KEY (IdentifierSystemOrganizationID) REFERENCES ODM2Core.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_MethodIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.MethodExternalIdentifiers ADD CONSTRAINT fk_ExternalIdentifierSystems_MethodIdentifiers
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Methods_ExternalIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.MethodExternalIdentifiers ADD CONSTRAINT fk_Methods_ExternalIdentifiers
	FOREIGN KEY (MethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_PersonIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.PersonExternalIdentifiers ADD CONSTRAINT fk_ExternalIdentifierSystems_PersonIdentifiers
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_People_ExternalIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.PersonExternalIdentifiers ADD CONSTRAINT fk_People_ExternalIdentifiers
	FOREIGN KEY (PersonID) REFERENCES ODM2Core.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_SamplingFeatureIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_ExternalIdentifierSystems_SamplingFeatureIdentifiers
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SampingFeatures_ExternalIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SampingFeatures_ExternalIdentifiers
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_VariableIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.VariableExternalIdentifiers ADD CONSTRAINT fk_ExternalIdentifierSystems_VariableIdentifiers
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES ODM2ExternalIdentifiers.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Variables_ExternalIdentifiers */
ALTER TABLE ODM2ExternalIdentifiers.VariableExternalIdentifiers ADD CONSTRAINT fk_Variables_ExternalIdentifiers
	FOREIGN KEY (VariableID) REFERENCES ODM2Core.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InputResults_ResultProvenance */
ALTER TABLE ODM2Provenance.InputResults ADD CONSTRAINT fk_InputResults_ResultProvenance
	FOREIGN KEY (ResultProvenanceID) REFERENCES ODM2Provenance.ResultProvenance (ResultProvenanceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InputResults_Results */
ALTER TABLE ODM2Provenance.InputResults ADD CONSTRAINT fk_InputResults_Results
	FOREIGN KEY (InputResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultProvenance_Methods */
ALTER TABLE ODM2Provenance.ResultProvenance ADD CONSTRAINT fk_ResultProvenance_Methods
	FOREIGN KEY (ProcessMethodID) REFERENCES ODM2Core.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultProvenance_Results */
ALTER TABLE ODM2Provenance.ResultProvenance ADD CONSTRAINT fk_ResultProvenance_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ObservationVersions_Observations_VersionOf */
ALTER TABLE ODM2Provenance.ResultVersions ADD CONSTRAINT fk_ObservationVersions_Observations_VersionOf
	FOREIGN KEY (VersionOfResultsSetID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultVersions_Results */
ALTER TABLE ODM2Provenance.ResultVersions ADD CONSTRAINT fk_ResultVersions_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_OffsetOrigins_Units */
ALTER TABLE ODM2Results.OffsetOrigins ADD CONSTRAINT fk_OffsetOrigins_Units
	FOREIGN KEY (OffsetCoordinateUnitsID) REFERENCES ODM2Core.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultValues_OffsetOrigins */
ALTER TABLE ODM2Results.ResultValues ADD CONSTRAINT fk_ResultValues_OffsetOrigins
	FOREIGN KEY (OffsetOriginID) REFERENCES ODM2Results.OffsetOrigins (OffsetOriginID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultValues_Results */
ALTER TABLE ODM2Results.ResultValues ADD CONSTRAINT fk_ResultValues_Results
	FOREIGN KEY (ResultID) REFERENCES ODM2Core.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AnalysisBatchActions_Actions */
ALTER TABLE ODM2Samples.AnalysisBatchActions ADD CONSTRAINT fk_AnalysisBatchActions_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AnalysisBatchEvents_CalibrationEvents */
ALTER TABLE ODM2Samples.AnalysisBatchActions ADD CONSTRAINT fk_AnalysisBatchEvents_CalibrationEvents
	FOREIGN KEY (CalibrationActionID) REFERENCES ODM2Equipment.CalibrationActions (CalibrationActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AnalysisBatchEvents_ConfigurationEvents */
ALTER TABLE ODM2Samples.AnalysisBatchActions ADD CONSTRAINT fk_AnalysisBatchEvents_ConfigurationEvents
	FOREIGN KEY (ConfigurationActionID) REFERENCES ODM2Equipment.ConfigurationActions (ConfigurationActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_BatchSampleLines_AnalysisBatchActions */
ALTER TABLE ODM2Samples.BatchSampleLines ADD CONSTRAINT fk_BatchSampleLines_AnalysisBatchActions
	FOREIGN KEY (AnalysisBacthActionID) REFERENCES ODM2Samples.AnalysisBatchActions (AnalysisBacthActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplePreparationEvent_Actions */
ALTER TABLE ODM2Samples.SamplePreparationAction ADD CONSTRAINT fk_SamplePreparationEvent_Actions
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_Features */
ALTER TABLE ODM2SamplingFeatures.FeatureParents ADD CONSTRAINT fk_FeatureParents_Features
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_FeaturesParent */
ALTER TABLE ODM2SamplingFeatures.FeatureParents ADD CONSTRAINT fk_FeatureParents_FeaturesParent
	FOREIGN KEY (ParentFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_SpatialOffsets */
ALTER TABLE ODM2SamplingFeatures.FeatureParents ADD CONSTRAINT fk_FeatureParents_SpatialOffsets
	FOREIGN KEY (SpatialOffsetID) REFERENCES ODM2SamplingFeatures.SpatialOffsets (SpatialOffsetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Sites_SamplingFeatures */
ALTER TABLE ODM2SamplingFeatures.Sites ADD CONSTRAINT fk_Sites_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Samples_Features */
ALTER TABLE ODM2SamplingFeatures.Specimens ADD CONSTRAINT fk_Samples_Features
	FOREIGN KEY (SamplingFeatureID) REFERENCES ODM2Core.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataLoggerFiles_DeploymentEvents */
ALTER TABLE ODM2Sensors.DataLoggerFiles ADD CONSTRAINT fk_DataLoggerFiles_DeploymentEvents
	FOREIGN KEY (DeploymentActionID) REFERENCES ODM2Sensors.DeploymentActions (DeploymentActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentEvents_CalibrationEvents */
ALTER TABLE ODM2Sensors.DeploymentActions ADD CONSTRAINT fk_DeploymentEvents_CalibrationEvents
	FOREIGN KEY (CalibrationActionID) REFERENCES ODM2Equipment.CalibrationActions (CalibrationActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentEvents_ConfigurationEvents */
ALTER TABLE ODM2Sensors.DeploymentActions ADD CONSTRAINT fk_DeploymentEvents_ConfigurationEvents
	FOREIGN KEY (ConfigurationActionID) REFERENCES ODM2Equipment.ConfigurationActions (ConfigurationActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentEvents_Events */
ALTER TABLE ODM2Sensors.DeploymentActions ADD CONSTRAINT fk_DeploymentEvents_Events
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Photos_Events */
ALTER TABLE ODM2Sensors.Photos ADD CONSTRAINT fk_Photos_Events
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SiteVisitEvents_Events */
ALTER TABLE ODM2Sensors.SiteVisitActions ADD CONSTRAINT fk_SiteVisitEvents_Events
	FOREIGN KEY (ActionID) REFERENCES ODM2Core.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;