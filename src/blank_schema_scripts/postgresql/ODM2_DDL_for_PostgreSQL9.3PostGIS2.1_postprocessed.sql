 /* Post-processed DDL based on DbWrench export. 2014-8-18 10pm PDT */

-- IF THIS DDL SCRIPT IS TO *CREATE* THE DATABASE ITSELF, 
-- WILL NEED TO FIRST KNOW THE DATABASE NAME AND ROLES TO BE USED. 

/* Add single base schema for all odm2 entities */
CREATE SCHEMA odm2;
COMMENT ON SCHEMA odm2 IS 'Schema holding all ODM2 (2.0) entities (tables, etc).';
/* ================================================================
   ================================================================ */

/* Generate from DbWrench: 2014-8-2 10pm PDT */
















/************ Update: Tables ***************/

/******************** Add Table: odm2.ActionAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.ActionAnnotations
(
	BridgeID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ActionAnnotations ADD CONSTRAINT pkActionAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.ActionAnnotations.ActionID IS 'Foreign key of the Action being annotated.';

COMMENT ON COLUMN odm2.ActionAnnotations.AnnotationID IS 'Foreign key of the annotation being added to the Action.';

COMMENT ON TABLE odm2.ActionAnnotations IS 'Notes for or groups of one or more Actions.';


/******************** Add Table: odm2.Annotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.Annotations
(
	AnnotationID INTEGER NOT NULL,
	AnnotationTypeCV VARCHAR(255) NOT NULL,
	AnnotationCode VARCHAR(50) NULL,
	AnnotationText VARCHAR(500) NOT NULL,
	AnnotationDateTime TIMESTAMP NULL,
	AnnotationUTCOffset INTEGER NULL,
	AnnotationLink VARCHAR(255) NULL,
	AnnotatorID INTEGER NULL,
	CitationID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Annotations ADD CONSTRAINT pkAnnotations
	PRIMARY KEY (AnnotationID);

/* Add Comments */
COMMENT ON COLUMN odm2.Annotations.AnnotationID IS 'Primary key for Annotations.';

COMMENT ON COLUMN odm2.Annotations.AnnotationTypeCV IS 'CV for types of annotations.';

COMMENT ON COLUMN odm2.Annotations.AnnotationCode IS 'A short text code that identifies the annotation (e.g., A'' for Approved data).';

COMMENT ON COLUMN odm2.Annotations.AnnotationText IS 'Full text of the annotation.';

COMMENT ON COLUMN odm2.Annotations.AnnotationDateTime IS 'Date and time at which the annotation was created.';

COMMENT ON COLUMN odm2.Annotations.AnnotationUTCOffset IS 'UTCOffset for the annotation creation date/time.';

COMMENT ON COLUMN odm2.Annotations.AnnotatorID IS 'Foregn key identifier for the person that created the annotation';

COMMENT ON TABLE odm2.Annotations IS 'Contains text annotations added to one or more records within various ODM2 tables.  Annotations can be used to record notes about a particular SamplingFeature, Action, Result, etc. or to create groups of records such as Specimens, Sites, People, etc.';


/******************** Add Table: odm2.CategoricalResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.CategoricalResultValueAnnotations
(
	BridgeID INTEGER NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.CategoricalResultValueAnnotations ADD CONSTRAINT pkCategoricalResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON TABLE odm2.CategoricalResultValueAnnotations IS 'Annotations for Categorical ResultValues';


/******************** Add Table: odm2.EquipmentAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.EquipmentAnnotations
(
	BridgeID INTEGER NOT NULL,
	EquipmentID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.EquipmentAnnotations ADD CONSTRAINT pkEquipmentAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON TABLE odm2.EquipmentAnnotations IS 'Bridge table linking Annotations to Equipment';


/******************** Add Table: odm2.MeasurementResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.MeasurementResultValueAnnotations
(
	BridgeID INTEGER NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.MeasurementResultValueAnnotations ADD CONSTRAINT pkMeasurementResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.MeasurementResultValueAnnotations.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.MeasurementResultValueAnnotations.ValueID IS 'Foreign key of the result value being annotated';

COMMENT ON COLUMN odm2.MeasurementResultValueAnnotations.AnnotationID IS 'Foreign key of the annotation applied to the result value';

COMMENT ON TABLE odm2.MeasurementResultValueAnnotations IS 'Annotations for Measurement ResultValues';


/******************** Add Table: odm2.MethodAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.MethodAnnotations
(
	BridgeID INTEGER NOT NULL,
	MethodID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.MethodAnnotations ADD CONSTRAINT pkMethodAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.MethodAnnotations.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.MethodAnnotations.MethodID IS 'Foreign key of the method being annotated';

COMMENT ON COLUMN odm2.MethodAnnotations.AnnotationID IS 'Foreign key of the annotation added to the method';

COMMENT ON TABLE odm2.MethodAnnotations IS 'Notes for or groups of one or more Methods.';


/******************** Add Table: odm2.PointCoverageResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.PointCoverageResultValueAnnotations
(
	BridgeID BIGINT NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.PointCoverageResultValueAnnotations ADD CONSTRAINT pkPointCoverageResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON TABLE odm2.PointCoverageResultValueAnnotations IS 'Annotations for Point Coverage ResultValues';


/******************** Add Table: odm2.ProfileResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.ProfileResultValueAnnotations
(
	BridgeID INTEGER NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ProfileResultValueAnnotations ADD CONSTRAINT pkProfileResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON TABLE odm2.ProfileResultValueAnnotations IS 'Annotations for Profile ResultValues';


/******************** Add Table: odm2.ResultAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.ResultAnnotations
(
	BridgeID INTEGER NOT NULL,
	ResultID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL,
	BeginDateTime TIMESTAMP NOT NULL,
	EndDateTime TIMESTAMP NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ResultAnnotations ADD CONSTRAINT pkResultAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.ResultAnnotations.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.ResultAnnotations.ResultID IS 'Foreign key of the result being annotated';

COMMENT ON COLUMN odm2.ResultAnnotations.AnnotationID IS 'Foreign key of the annotation added to the result';

COMMENT ON COLUMN odm2.ResultAnnotations.BeginDateTime IS 'Beginning date/time of the annotation';

COMMENT ON COLUMN odm2.ResultAnnotations.EndDateTime IS 'Ending date/time of the annotation';

COMMENT ON TABLE odm2.ResultAnnotations IS 'Notes for or groups of one or more Results [sets].';


/******************** Add Table: odm2.SamplingFeatureAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.SamplingFeatureAnnotations
(
	BridgeID INTEGER NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SamplingFeatureAnnotations ADD CONSTRAINT pkSamplingFeatureAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.SamplingFeatureAnnotations.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.SamplingFeatureAnnotations.SamplingFeatureID IS 'Foreign key of the SamplingFeature being annotated.';

COMMENT ON COLUMN odm2.SamplingFeatureAnnotations.AnnotationID IS 'Foreign key of the Annotation applied to the SamplingFeature.';

COMMENT ON TABLE odm2.SamplingFeatureAnnotations IS 'Notes for or groups of one or more Sampling Features.';


/******************** Add Table: odm2.SectionResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.SectionResultValueAnnotations
(
	BridgeID INTEGER NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SectionResultValueAnnotations ADD CONSTRAINT pkSectionResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON TABLE odm2.SectionResultValueAnnotations IS 'Annotations for Section ResultValues';


/******************** Add Table: odm2.SpectraResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.SpectraResultValueAnnotations
(
	BridgeID INTEGER NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SpectraResultValueAnnotations ADD CONSTRAINT pkSpectraResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON TABLE odm2.SpectraResultValueAnnotations IS 'Annotations for Spectra ResultValues';


/******************** Add Table: odm2.TimeSeriesResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.TimeSeriesResultValueAnnotations
(
	BridgeID INTEGER NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.TimeSeriesResultValueAnnotations ADD CONSTRAINT pkTimeSeriesResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON TABLE odm2.TimeSeriesResultValueAnnotations IS 'Annotations for Time Series ResultValues';


/******************** Add Table: odm2.TrajectoryResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.TrajectoryResultValueAnnotations
(
	BridgeID INTEGER NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.TrajectoryResultValueAnnotations ADD CONSTRAINT pkTrajectoryResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON TABLE odm2.TrajectoryResultValueAnnotations IS 'Annotations for Trajectory ResultValues';


/******************** Add Table: odm2.TransectResultValueAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.TransectResultValueAnnotations
(
	BridgeID INTEGER NOT NULL,
	ValueID BIGINT NOT NULL,
	AnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.TransectResultValueAnnotations ADD CONSTRAINT pkTransectResultValueAnnotations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON TABLE odm2.TransectResultValueAnnotations IS 'Annotations for Transect ResultValues';


/******************** Add Table: odm2.CVTerms ************************/

/* Build Table Structure */
CREATE TABLE odm2.CVTerms
(
	TermID INTEGER NOT NULL,
	Term VARCHAR(255) NOT NULL,
	Definition VARCHAR(500) NULL,
	ODMVocabulary VARCHAR(255) NOT NULL,
	SourceVocabulary VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.CVTerms ADD CONSTRAINT pkCVTerms
	PRIMARY KEY (TermID);

/* Add Comments */
COMMENT ON COLUMN odm2.CVTerms.TermID IS 'Primary key';

COMMENT ON COLUMN odm2.CVTerms.Term IS 'Controlled vocabulary term';

COMMENT ON COLUMN odm2.CVTerms.Definition IS 'Definition of term';

COMMENT ON COLUMN odm2.CVTerms.ODMVocabulary IS 'Name of the ODM controlled vocabulary to which the term belongs';

COMMENT ON COLUMN odm2.CVTerms.SourceVocabulary IS 'Name and/or description of the source vocabulary from which the term was derived';

COMMENT ON TABLE odm2.CVTerms IS 'Table containing terms used in the controlled vocabularies of odm2.';


/******************** Add Table: odm2.ActionBy ************************/

/* Build Table Structure */
CREATE TABLE odm2.ActionBy
(
	BridgeID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	AffiliationID INTEGER NOT NULL,
	IsActionLead BOOL NOT NULL,
	RoleDescription VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ActionBy ADD CONSTRAINT pkActionBy
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.ActionBy.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.ActionBy.ActionID IS 'Foreign key identifier of an action.';

COMMENT ON COLUMN odm2.ActionBy.AffiliationID IS 'Foreign key identifier of a person';

COMMENT ON COLUMN odm2.ActionBy.IsActionLead IS 'Indicator of whether the affiliated person was the lead for the action';

COMMENT ON COLUMN odm2.ActionBy.RoleDescription IS 'Foreign key identifier for a role played by a person in performing an action';

COMMENT ON TABLE odm2.ActionBy IS 'Affiliates people with actions and describes thier role in the action.';


/******************** Add Table: odm2.Actions ************************/

/* Build Table Structure */
CREATE TABLE odm2.Actions
(
	ActionID INTEGER NOT NULL,
	ActionTypeCV VARCHAR(255) NOT NULL,
	MethodID INTEGER NOT NULL,
	BeginDateTime TIMESTAMP NOT NULL,
	BeginDateTimeUTCOffset INTEGER NOT NULL,
	EndDateTime TIMESTAMP NULL,
	EndDateTimeUTCOffset INTEGER NULL,
	ActionDescription VARCHAR(500) NULL,
	ActionFileLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Actions ADD CONSTRAINT pkActions
	PRIMARY KEY (ActionID);

/* Add Comments */
COMMENT ON COLUMN odm2.Actions.ActionID IS 'Unique identifier';

COMMENT ON COLUMN odm2.Actions.ActionTypeCV IS 'CV term describing the type of action (e.g., observation, sample collection, sample analysis)';

COMMENT ON COLUMN odm2.Actions.MethodID IS 'Foreign key identifier for the method used to complete the action';

COMMENT ON COLUMN odm2.Actions.BeginDateTime IS 'The date/time at which the action began';

COMMENT ON COLUMN odm2.Actions.BeginDateTimeUTCOffset IS 'The UTCOffset for the BeginDateTime';

COMMENT ON COLUMN odm2.Actions.EndDateTime IS 'The date/time at which the action ended';

COMMENT ON COLUMN odm2.Actions.EndDateTimeUTCOffset IS 'The UTCOffset of for the EndDateTime';

COMMENT ON COLUMN odm2.Actions.ActionDescription IS 'Text that describes the action';

COMMENT ON COLUMN odm2.Actions.ActionFileLink IS 'A URL or path to a file created by or used by the Action, such as instrument output or configuration.';

COMMENT ON TABLE odm2.Actions IS 'Describes actions (e.g., observation, sample collection, sample analysis, field visits, field activities, etc.)';


/******************** Add Table: odm2.Affiliations ************************/

/* Build Table Structure */
CREATE TABLE odm2.Affiliations
(
	AffiliationID INTEGER NOT NULL,
	PersonID INTEGER NOT NULL,
	OrganizationID INTEGER NULL,
	IsPrimaryOrganizationContact BOOL NULL,
	AffiliationStartDate DATE NOT NULL,
	AffiliationEndDate DATE NULL,
	PrimaryPhone VARCHAR(50) NULL,
	PrimaryEmail VARCHAR(255) NOT NULL,
	PrimaryAddress VARCHAR(255) NULL,
	PersonLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Affiliations ADD CONSTRAINT pkAffiliations
	PRIMARY KEY (AffiliationID);

/* Add Comments */
COMMENT ON COLUMN odm2.Affiliations.AffiliationID IS 'Primay key';

COMMENT ON COLUMN odm2.Affiliations.PersonID IS 'Foreign key identifer for a person';

COMMENT ON COLUMN odm2.Affiliations.OrganizationID IS 'Foreigh key identifier for an organization';

COMMENT ON COLUMN odm2.Affiliations.IsPrimaryOrganizationContact IS 'Boolean indication of whether the person is the organizations primary contact person';

COMMENT ON COLUMN odm2.Affiliations.AffiliationStartDate IS 'The date on which the person became affiliated with the organization';

COMMENT ON COLUMN odm2.Affiliations.AffiliationEndDate IS 'The date on which the person''s affiliation with the organization ended';

COMMENT ON COLUMN odm2.Affiliations.PrimaryPhone IS 'The primary phone number of the person';

COMMENT ON COLUMN odm2.Affiliations.PrimaryEmail IS 'The primary email address of the person';

COMMENT ON COLUMN odm2.Affiliations.PrimaryAddress IS 'The primary mailing address of the person, including street, city, state, zip, and country';

COMMENT ON COLUMN odm2.Affiliations.PersonLink IS 'A URL for the website for a person';

COMMENT ON TABLE odm2.Affiliations IS 'Describes affiliations of people with organizations.';


/******************** Add Table: odm2.DataSets ************************/

/* Build Table Structure */
CREATE TABLE odm2.DataSets
(
	DataSetID INTEGER NOT NULL,
	DataSetUUID OID NOT NULL,
	DataSetTypeCV VARCHAR(255) NOT NULL,
	DataSetCode VARCHAR(50) NOT NULL,
	DataSetTitle VARCHAR(255) NOT NULL,
	DataSetAbstract VARCHAR(500) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.DataSets ADD CONSTRAINT pkDataSets
	PRIMARY KEY (DataSetID);

/* Add Comments */
COMMENT ON COLUMN odm2.DataSets.DataSetID IS 'Unique identifier';

COMMENT ON COLUMN odm2.DataSets.DataSetTypeCV IS 'CV term(s) describing the Topic Category';

COMMENT ON COLUMN odm2.DataSets.DataSetCode IS 'A short text code identifying the dataset';

COMMENT ON COLUMN odm2.DataSets.DataSetTitle IS 'A text title for the dataset';

COMMENT ON COLUMN odm2.DataSets.DataSetAbstract IS 'A text abstract describing the dataset';

COMMENT ON TABLE odm2.DataSets IS 'Describes groupings of observation results that can be considered datasets';


/******************** Add Table: odm2.DataSetsResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.DataSetsResults
(
	BridgeID INTEGER NOT NULL,
	DataSetID INTEGER NOT NULL,
	ResultID BIGINT NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.DataSetsResults ADD CONSTRAINT pkDataSetsResults
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.DataSetsResults.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.DataSetsResults.DataSetID IS 'Foreign key identifier of the DataSet';

COMMENT ON COLUMN odm2.DataSetsResults.ResultID IS 'Foreign key identifier of the Result';

COMMENT ON TABLE odm2.DataSetsResults IS 'Lists the Results that are grouped into a DataSet';


/******************** Add Table: odm2.FeatureActions ************************/

/* Build Table Structure */
CREATE TABLE odm2.FeatureActions
(
	FeatureActionID INTEGER NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.FeatureActions ADD CONSTRAINT pkFeatureActions
	PRIMARY KEY (FeatureActionID);

/* Add Comments */
COMMENT ON COLUMN odm2.FeatureActions.FeatureActionID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.FeatureActions.SamplingFeatureID IS 'Foreign key identifier for the SamplingFeature on which or at which the Action was performed';

COMMENT ON COLUMN odm2.FeatureActions.ActionID IS 'Foreign key identifier of the Action that was performed';


/******************** Add Table: odm2.Methods ************************/

/* Build Table Structure */
CREATE TABLE odm2.Methods
(
	MethodID INTEGER NOT NULL,
	MethodTypeCV VARCHAR(255) NOT NULL,
	MethodCode VARCHAR(50) NOT NULL,
	MethodName VARCHAR(255) NOT NULL,
	MethodDescription VARCHAR(500) NULL,
	MethodLink VARCHAR(255) NULL,
	OrganizationID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Methods ADD CONSTRAINT pkMethods
	PRIMARY KEY (MethodID);

/* Add Comments */
COMMENT ON COLUMN odm2.Methods.MethodID IS 'Unique identifier';

COMMENT ON COLUMN odm2.Methods.MethodTypeCV IS 'CV term describing the type of method (e.g., sample collection, laboratory analytical, field, sample prepratation, etc.)';

COMMENT ON COLUMN odm2.Methods.MethodCode IS 'A text code identifiying the method (e.g., EPA 650.2)';

COMMENT ON COLUMN odm2.Methods.MethodName IS 'Full text name of the method';

COMMENT ON COLUMN odm2.Methods.MethodDescription IS 'Full text description of the method';

COMMENT ON COLUMN odm2.Methods.MethodLink IS 'A URL to a full description of the method';

COMMENT ON COLUMN odm2.Methods.OrganizationID IS 'Foreign key identifier for the Organization with which the method is affiliated';

COMMENT ON TABLE odm2.Methods IS 'Describes methods used to perform actions recorded in ODM (e.g., observation methods, sample analysis methods, sample preparation methods, etc.)';


/******************** Add Table: odm2.Organizations ************************/

/* Build Table Structure */
CREATE TABLE odm2.Organizations
(
	OrganizationID INTEGER NOT NULL,
	OrganizationTypeCV VARCHAR(255) NOT NULL,
	OrganizationCode VARCHAR(50) NOT NULL,
	OrganizationName VARCHAR(255) NOT NULL,
	OrganizationDescription VARCHAR(500) NULL,
	OrganizationLink VARCHAR(255) NULL,
	ParentOrganizationID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Organizations ADD CONSTRAINT pkOrganizations
	PRIMARY KEY (OrganizationID);

/* Add Comments */
COMMENT ON COLUMN odm2.Organizations.OrganizationID IS 'Unique identifier';

COMMENT ON COLUMN odm2.Organizations.OrganizationTypeCV IS 'CV term defining the type of organization (e.g., government agency, university, etc.)';

COMMENT ON COLUMN odm2.Organizations.OrganizationCode IS 'A text code identifying the Organization (e.g., USGS)';

COMMENT ON COLUMN odm2.Organizations.OrganizationName IS 'The full text name of the organization';

COMMENT ON COLUMN odm2.Organizations.OrganizationDescription IS 'A text description of the organization';

COMMENT ON COLUMN odm2.Organizations.OrganizationLink IS 'A URL for the organization''s website';

COMMENT ON COLUMN odm2.Organizations.ParentOrganizationID IS 'Foreign key of the parent organization of the current organization';

COMMENT ON TABLE odm2.Organizations IS 'Describes organizations - as in research groups, companies, universities, etc.';


/******************** Add Table: odm2.People ************************/

/* Build Table Structure */
CREATE TABLE odm2.People
(
	PersonID INTEGER NOT NULL,
	PersonFirstName VARCHAR(255) NOT NULL,
	PersonMiddleName VARCHAR(255) NULL,
	PersonLastName VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.People ADD CONSTRAINT pkPeople
	PRIMARY KEY (PersonID);

/* Add Comments */
COMMENT ON COLUMN odm2.People.PersonID IS 'Primary Key';

COMMENT ON COLUMN odm2.People.PersonFirstName IS 'First name of the person';

COMMENT ON COLUMN odm2.People.PersonMiddleName IS 'Middle name of the person';

COMMENT ON COLUMN odm2.People.PersonLastName IS 'Last name of the person';

COMMENT ON TABLE odm2.People IS 'Describes people.';


/******************** Add Table: odm2.ProcessingLevels ************************/

/* Build Table Structure */
CREATE TABLE odm2.ProcessingLevels
(
	ProcessingLevelID INTEGER NOT NULL,
	ProcessingLevelCode VARCHAR(50) NOT NULL,
	Definition VARCHAR(500) NULL,
	Explanation VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ProcessingLevels ADD CONSTRAINT pkProcessingLevels
	PRIMARY KEY (ProcessingLevelID);

/* Add Comments */
COMMENT ON COLUMN odm2.ProcessingLevels.ProcessingLevelID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.ProcessingLevels.ProcessingLevelCode IS 'Text code identifying the level of processing the Result has been subject to';

COMMENT ON COLUMN odm2.ProcessingLevels.Definition IS 'Text defintion of the processing level';

COMMENT ON COLUMN odm2.ProcessingLevels.Explanation IS 'Text explanation of the processing level';

COMMENT ON TABLE odm2.ProcessingLevels IS 'Describes the processing level of Results';


/******************** Add Table: odm2.RelatedActions ************************/

/* Build Table Structure */
CREATE TABLE odm2.RelatedActions
(
	RelationID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedActionID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.RelatedActions ADD CONSTRAINT pkRelatedActions
	PRIMARY KEY (RelationID);

/* Add Comments */
COMMENT ON COLUMN odm2.RelatedActions.RelationID IS 'Primary key for a relationship table (i.e. named Related...).';

COMMENT ON COLUMN odm2.RelatedActions.ActionID IS 'Foreign key identifier of the Action';

COMMENT ON COLUMN odm2.RelatedActions.RelationshipTypeCV IS 'Text description of the relationship between two Actions';

COMMENT ON COLUMN odm2.RelatedActions.RelatedActionID IS 'Foreign key identifier for a Action related to the Action identified by ActionID';

COMMENT ON TABLE odm2.RelatedActions IS 'Describes Actions that are related to one another.';


/******************** Add Table: odm2.Results ************************/

/* Build Table Structure */
CREATE TABLE odm2.Results
(
	ResultID BIGINT NOT NULL,
	ResultUUID OID NOT NULL,
	FeatureActionID INTEGER NOT NULL,
	ResultTypeCV VARCHAR(255) NOT NULL,
	VariableID INTEGER NOT NULL,
	UnitsID INTEGER NOT NULL,
	TaxonomicClassifierID INTEGER NULL,
	ProcessingLevelID INTEGER NOT NULL,
	ResultDateTime TIMESTAMP NULL,
	ResultDateTimeUTCOffset BIGINT NULL,
	ValidDateTime TIMESTAMP NULL,
	ValidDateTimeUTCOffset BIGINT NULL,
	StatusCV VARCHAR(255) NULL,
	SampledMediumCV VARCHAR(255) NOT NULL,
	ValueCount INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Results ADD CONSTRAINT pkResults
	PRIMARY KEY (ResultID);

/* Add Comments */
COMMENT ON COLUMN odm2.Results.ResultID IS 'Unique identifier';

COMMENT ON COLUMN odm2.Results.ResultUUID IS 'Universally unique identifier for the Result';

COMMENT ON COLUMN odm2.Results.FeatureActionID IS 'Foreign key identifier for the combinaton of SamplingFeature and Action that created the Result';

COMMENT ON COLUMN odm2.Results.ResultTypeCV IS 'CV term describing the result type (e.g., time series, measurement, etc.)';

COMMENT ON COLUMN odm2.Results.VariableID IS 'Foreign key identifier for the Variable of the result';

COMMENT ON COLUMN odm2.Results.UnitsID IS 'Foreign key identifier for the Units of the result';

COMMENT ON COLUMN odm2.Results.TaxonomicClassifierID IS 'Foreign key identifier for a TaxonomicClassifier for the variable (if one exists)';

COMMENT ON COLUMN odm2.Results.ProcessingLevelID IS 'Foreign key identifier for the ProcessingLevel of the result';

COMMENT ON COLUMN odm2.Results.ResultDateTime IS 'Date and time at which the result became available (could be used as analysis time for samples)';

COMMENT ON COLUMN odm2.Results.ResultDateTimeUTCOffset IS 'UTDCOffset of ResultDateTime';

COMMENT ON COLUMN odm2.Results.ValidDateTime IS 'Date and time for which the result is valid (e.g., for a forecast result).  Should probably be expressed as a duration';

COMMENT ON COLUMN odm2.Results.ValidDateTimeUTCOffset IS 'UTCOffset of ValidDateTime';

COMMENT ON COLUMN odm2.Results.StatusCV IS 'Status of the result (e.g., finished, ongoing, etc.)';

COMMENT ON COLUMN odm2.Results.SampledMediumCV IS 'CV term defining the environmental medium that the result represents (e.g., air, soil, water)';

COMMENT ON COLUMN odm2.Results.ValueCount IS 'Number of data values contained within the result';

COMMENT ON TABLE odm2.Results IS 'Describes the results of observation actions (e.g., groups of one or more numeric data values that result from an observation action)';


/******************** Add Table: odm2.SamplingFeatures ************************/

/* Build Table Structure */
CREATE TABLE odm2.SamplingFeatures
(
	SamplingFeatureID INTEGER NOT NULL,
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
ALTER TABLE odm2.SamplingFeatures ADD CONSTRAINT pkSamplingFeatures
	PRIMARY KEY (SamplingFeatureID);

/* Add Comments */
COMMENT ON COLUMN odm2.SamplingFeatures.SamplingFeatureID IS 'Primary key.';

COMMENT ON COLUMN odm2.SamplingFeatures.SamplingFeatureTypeCV IS 'CV term descripting the type of sampling feature.';

COMMENT ON COLUMN odm2.SamplingFeatures.SamplingFeatureCode IS 'A short but meaningful text identifier for the sampling feature.';

COMMENT ON COLUMN odm2.SamplingFeatures.SamplingFeatureName IS 'Sampling Feature name (free text).';

COMMENT ON COLUMN odm2.SamplingFeatures.SamplingFeatureDescription IS 'Text describing the sampling feature.';

COMMENT ON COLUMN odm2.SamplingFeatures.SamplingFeatureGeotypeCV IS 'Dimensionality of SamplingFeature; point2d, line2d, etc.';

COMMENT ON COLUMN odm2.SamplingFeatures.FeatureGeometry IS 'The location geometry of the sampling feature on the Earth. Can be a Point, Curve (profile, trajectory, etc), Surface (flat polygons, etc) or Solid/Volume (although often limited to 2D geometries). ';

COMMENT ON COLUMN odm2.SamplingFeatures.Elevation_m IS 'The elevation of the sampling feature in meters, or in the case of Specimen, the elevation from where the SamplingFeature.Specimen was collected';

COMMENT ON COLUMN odm2.SamplingFeatures.ElevationDatumCV IS 'The code for the vertical geodetic datum that specifies the zero point for the Sampling Feature Elevation.';

COMMENT ON TABLE odm2.SamplingFeatures IS 'Describes the sampling features on which observations are made.';


/******************** Add Table: odm2.TaxonomicClassifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.TaxonomicClassifiers
(
	TaxonomicClassifierID INTEGER NOT NULL,
	TaxonomicClassifierTypeCV VARCHAR(255) NOT NULL,
	TaxonomicClassifierName VARCHAR(255) NOT NULL,
	TaxonomicClassifierCommonName VARCHAR(255) NULL,
	TaxonomicClassifierDescription VARCHAR(500) NULL,
	ParentTaxonomicClassifierID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE odm2.TaxonomicClassifiers ADD CONSTRAINT pkTaxonomicClassifiers
	PRIMARY KEY (TaxonomicClassifierID);

/* Add Comments */
COMMENT ON COLUMN odm2.TaxonomicClassifiers.TaxonomicClassifierID IS 'ID';

COMMENT ON COLUMN odm2.TaxonomicClassifiers.TaxonomicClassifierTypeCV IS 'Controlled Vocabulary for the type of taxonomy';

COMMENT ON COLUMN odm2.TaxonomicClassifiers.TaxonomicClassifierName IS 'Taxonomic classification';

COMMENT ON COLUMN odm2.TaxonomicClassifiers.TaxonomicClassifierCommonName IS 'Taxonomic classification using a common name';

COMMENT ON COLUMN odm2.TaxonomicClassifiers.TaxonomicClassifierDescription IS 'Description or remarks about Taxonomic Classifier';

COMMENT ON COLUMN odm2.TaxonomicClassifiers.ParentTaxonomicClassifierID IS 'ID of the Classifier that is one higher level in the taxonomic hiearchy';


/******************** Add Table: odm2.Units ************************/

/* Build Table Structure */
CREATE TABLE odm2.Units
(
	UnitsID INTEGER NOT NULL,
	UnitsTypeCV VARCHAR(255) NOT NULL,
	UnitsAbbreviation VARCHAR(50) NOT NULL,
	UnitsName VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Units ADD CONSTRAINT pkUnits
	PRIMARY KEY (UnitsID);

/* Add Comments */
COMMENT ON COLUMN odm2.Units.UnitsID IS 'Unique identifier';

COMMENT ON COLUMN odm2.Units.UnitsTypeCV IS 'CV term that defines the unit type';

COMMENT ON COLUMN odm2.Units.UnitsAbbreviation IS 'Text abbreviation for the unit';

COMMENT ON COLUMN odm2.Units.UnitsName IS 'Text name for the unit';

COMMENT ON TABLE odm2.Units IS 'Describes units of measure for varibles and time';


/******************** Add Table: odm2.Variables ************************/

/* Build Table Structure */
CREATE TABLE odm2.Variables
(
	VariableID INTEGER NOT NULL,
	VariableTypeCV VARCHAR(255) NOT NULL,
	VariableCode VARCHAR(50) NOT NULL,
	VariableNameCV VARCHAR(255) NOT NULL,
	VariableDefinition VARCHAR(500) NULL,
	SpeciationCV VARCHAR(255) NULL,
	NoDataValue DOUBLE PRECISION NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Variables ADD CONSTRAINT pkVariables
	PRIMARY KEY (VariableID);

/* Add Comments */
COMMENT ON COLUMN odm2.Variables.VariableID IS 'Primary key';

COMMENT ON COLUMN odm2.Variables.VariableTypeCV IS 'Controlled vocabulary for the type of variable';

COMMENT ON COLUMN odm2.Variables.VariableCode IS 'Unique text code for the variable';

COMMENT ON COLUMN odm2.Variables.VariableNameCV IS 'Controlled vocabulary for the name of the variable';

COMMENT ON COLUMN odm2.Variables.VariableDefinition IS 'Text definition of the variable';

COMMENT ON COLUMN odm2.Variables.SpeciationCV IS 'Speciation for the variable (e.g., expressed as P or as PO4)';

COMMENT ON COLUMN odm2.Variables.NoDataValue IS 'A numeric value indicating no data.';

COMMENT ON TABLE odm2.Variables IS 'Stores information about measured properties.';


/******************** Add Table: odm2.DataQuality ************************/

/* Build Table Structure */
CREATE TABLE odm2.DataQuality
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
ALTER TABLE odm2.DataQuality ADD CONSTRAINT pkDataQuality
	PRIMARY KEY (DataQualityID);

/* Add Comments */
COMMENT ON COLUMN odm2.DataQuality.DataQualityID IS 'Primary Key for DataQuality entity';

COMMENT ON COLUMN odm2.DataQuality.DataQualityTypeCV IS '	i.e. Precision_2sigma, MethodDetectionLimit, ReportingLevel, 95%ConfidenceNoFalsePositives.';

COMMENT ON COLUMN odm2.DataQuality.DataQualityCode IS 'Code for DataQualityType';

COMMENT ON COLUMN odm2.DataQuality.DataQualityValue IS 'Numeric value of the DataQuality';

COMMENT ON COLUMN odm2.DataQuality.DataQualityValueUnitsID IS 'Units for the DataQualityValue';

COMMENT ON COLUMN odm2.DataQuality.DataQualityDescription IS 'Text description of the DataQuality metadata';

COMMENT ON COLUMN odm2.DataQuality.DataQualityLink IS 'URL or path to a file or other resource supporting the DataQuality metadata';


/******************** Add Table: odm2.ReferenceMaterialValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.ReferenceMaterialValues
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
ALTER TABLE odm2.ReferenceMaterialValues ADD CONSTRAINT pkReferenceMaterialValues
	PRIMARY KEY (ReferenceMaterialValueID);

/* Add Comments */
COMMENT ON COLUMN odm2.ReferenceMaterialValues.ReferenceMaterialValueID IS 'The primary key for ReferenceMaterialValues';

COMMENT ON COLUMN odm2.ReferenceMaterialValues.ReferenceMaterialID IS 'A foreign key to ReferenceMaterials';

COMMENT ON COLUMN odm2.ReferenceMaterialValues.ReferenceMaterialValue IS 'The established property value for the ReferenceMaterial.';

COMMENT ON COLUMN odm2.ReferenceMaterialValues.ReferenceMaterialAccuracy IS 'The established accuracy of the property value for the ReferenceMaterial, in the same units as the value.';

COMMENT ON COLUMN odm2.ReferenceMaterialValues.VariableID IS 'The property that is quantified by the ReferenceMaterialValue';

COMMENT ON COLUMN odm2.ReferenceMaterialValues.UnitsID IS 'The units for the ReferenceMaterialValue and ReferenceMaterialAccuracy';

COMMENT ON COLUMN odm2.ReferenceMaterialValues.CitationID IS 'The attribution for source that established the ReferenceMaterialValue and ReferenceMaterialAccuracy';

COMMENT ON TABLE odm2.ReferenceMaterialValues IS 'Accepted property values for a Reference Material, which can be certified by an agency or vendor, established in the literature by the research community, or developed for in house use only by a laboratory.';


/******************** Add Table: odm2.ReferenceMaterials ************************/

/* Build Table Structure */
CREATE TABLE odm2.ReferenceMaterials
(
	ReferenceMaterialID INTEGER NOT NULL,
	ReferenceMaterialMediumCV VARCHAR(255) NOT NULL,
	ReferenceMaterialOrganizationID INTEGER NOT NULL,
	ReferenceMaterialCode VARCHAR(50) NOT NULL,
	ReferenceMaterialLotCode VARCHAR(255) NULL,
	ReferenceMaterialPurchaseDate TIMESTAMP NULL,
	ReferenceMaterialExpirationDate TIMESTAMP NULL,
	ReferenceMaterialCertificateLink VARCHAR(255) NULL,
	SamplingFeatureID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ReferenceMaterials ADD CONSTRAINT pkReferenceMaterials
	PRIMARY KEY (ReferenceMaterialID);

/* Add Comments */
COMMENT ON COLUMN odm2.ReferenceMaterials.ReferenceMaterialID IS 'The primary key to the Reference Material used to calibrate an instrument, assess a measurement method, or assign values to unknown specimens';

COMMENT ON COLUMN odm2.ReferenceMaterials.ReferenceMaterialMediumCV IS 'The medium of a Reference Material, from the same CV as SpecimenMediumCV. Examples include: water, sediment, air, tissue, etc.';

COMMENT ON COLUMN odm2.ReferenceMaterials.ReferenceMaterialOrganizationID IS 'A foreign key to the Organization that manufactured and established property values for the ReferenceMaterial';

COMMENT ON COLUMN odm2.ReferenceMaterials.ReferenceMaterialCode IS 'A code or short name used to identify the reference material.';

COMMENT ON COLUMN odm2.ReferenceMaterials.ReferenceMaterialLotCode IS 'The lot, or manufactured batch, of the reference material, that is often associated with a certified set of property values';

COMMENT ON COLUMN odm2.ReferenceMaterials.ReferenceMaterialPurchaseDate IS 'The purchase date of a reference material, when applicable';

COMMENT ON COLUMN odm2.ReferenceMaterials.ReferenceMaterialExpirationDate IS 'The expiration date of a reference material, when applicable';

COMMENT ON COLUMN odm2.ReferenceMaterials.ReferenceMaterialCertificateLink IS 'A URL or file path to the Certificate that provides established property values for the given lot number.';

COMMENT ON COLUMN odm2.ReferenceMaterials.SamplingFeatureID IS 'A foreign key to SamplingFeatures.  Only required when the ReferenceMaterial is Analyzed as if it were an unknown specimen.';

COMMENT ON TABLE odm2.ReferenceMaterials IS 'Describes materials that are used for the calibration of an instrument, the assessment of a measurement method, or for assigning values to unknown specimens.';


/******************** Add Table: odm2.ResultNormalizationValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.ResultNormalizationValues
(
	ResultID BIGINT NOT NULL,
	NormalizedByReferenceMaterialValueID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ResultNormalizationValues ADD CONSTRAINT pkResultNormalizationValues
	PRIMARY KEY (ResultID);

/* Add Comments */
COMMENT ON COLUMN odm2.ResultNormalizationValues.ResultID IS 'Unique identifier';



/******************** Add Table: odm2.ResultsDataQuality ************************/

/* Build Table Structure */
CREATE TABLE odm2.ResultsDataQuality
(
	BridgeID INTEGER NOT NULL,
	ResultID BIGINT NOT NULL,
	DataQualityID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ResultsDataQuality ADD CONSTRAINT pkResultsDataQuality
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.ResultsDataQuality.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.ResultsDataQuality.ResultID IS 'Foreign key identifier of the Result';

COMMENT ON COLUMN odm2.ResultsDataQuality.DataQualityID IS 'Foreign key identifier of the DataQuality entity.';


/******************** Add Table: odm2.CalibratedDeploymentVariables ************************/

/* Build Table Structure */
CREATE TABLE odm2.CalibratedDeploymentVariables
(
	BridgeID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	DeploymentMeasuredVariableID INTEGER NOT NULL,
	CalibrationCheckValue FLOAT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.CalibratedDeploymentVariables ADD CONSTRAINT pkCalibratedDeploymentVariables
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.CalibratedDeploymentVariables.BridgeID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.CalibratedDeploymentVariables.ActionID IS 'Foreign key identifier of the calibration Action';

COMMENT ON COLUMN odm2.CalibratedDeploymentVariables.DeploymentMeasuredVariableID IS 'Foreign key identifier of the DeploymentMeasuredVariable to which the calibration was applied';

COMMENT ON COLUMN odm2.CalibratedDeploymentVariables.CalibrationCheckValue IS 'A numeric value for the DeploymentMeasuredVariable measued using the ReferenceMaterial prior to calibration';

COMMENT ON TABLE odm2.CalibratedDeploymentVariables IS 'Information about which deployment measured variable a calibration Action is associated with';


/******************** Add Table: odm2.CalibrationEquations ************************/

/* Build Table Structure */
CREATE TABLE odm2.CalibrationEquations
(
	CalibrationEquationID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	InstrumentOutputVariableID INTEGER NOT NULL,
	OutputVariableEquation VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.CalibrationEquations ADD CONSTRAINT pkCalibrationEquations
	PRIMARY KEY (CalibrationEquationID);

/* Add Comments */
COMMENT ON COLUMN odm2.CalibrationEquations.CalibrationEquationID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.CalibrationEquations.ActionID IS 'Foreign key identifier of the calibration Action';

COMMENT ON COLUMN odm2.CalibrationEquations.InstrumentOutputVariableID IS 'Foreign key identifier for the InstrumentOutputVariableID to which the calibration equation applies';

COMMENT ON COLUMN odm2.CalibrationEquations.OutputVariableEquation IS 'Text string that encodes the calibration equation';

COMMENT ON TABLE odm2.CalibrationEquations IS 'Information about instrument calibration equations';


/******************** Add Table: odm2.CalibrationStandards ************************/

/* Build Table Structure */
CREATE TABLE odm2.CalibrationStandards
(
	BridgeID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	ReferenceMaterialID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.CalibrationStandards ADD CONSTRAINT pkCalibrationStandards
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.CalibrationStandards.BridgeID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.CalibrationStandards.ActionID IS 'Foreign key identifier of the calibration Action';

COMMENT ON COLUMN odm2.CalibrationStandards.ReferenceMaterialID IS 'Foreign key identifier of the ReferenceMaterial used in the calibration';

COMMENT ON TABLE odm2.CalibrationStandards IS 'Bridge table linking field calibrations to the reference materials used';


/******************** Add Table: odm2.Equipment ************************/

/* Build Table Structure */
CREATE TABLE odm2.Equipment
(
	EquipmentID INTEGER NOT NULL,
	EquipmentCode VARCHAR(50) NOT NULL,
	EquipmentName VARCHAR(255) NOT NULL,
	EquipmentTypeCV VARCHAR(255) NOT NULL,
	EquipmentModelID INTEGER NOT NULL,
	EquipmentSerialNumber VARCHAR(50) NOT NULL,
	EquipmentOwnerID INTEGER NOT NULL,
	EquipmentVendorID INTEGER NOT NULL,
	EquipmentPurchaseDate TIMESTAMP NOT NULL,
	EquipmentPurchaseOrderNumber VARCHAR(50) NULL,
	EquipmentDescription VARCHAR(500) NULL,
	EquipmentDocumentationLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Equipment ADD CONSTRAINT pkEquipment
	PRIMARY KEY (EquipmentID);

/* Add Comments */
COMMENT ON COLUMN odm2.Equipment.EquipmentID IS 'Unique identifier';

COMMENT ON COLUMN odm2.Equipment.EquipmentCode IS 'A text code that identifies the piece of equipment';

COMMENT ON COLUMN odm2.Equipment.EquipmentName IS 'A text name for the piece of equipment';

COMMENT ON COLUMN odm2.Equipment.EquipmentTypeCV IS 'CV term describing the equipment type (e.g., sensor, datalogger, solar panel, etc.)';

COMMENT ON COLUMN odm2.Equipment.EquipmentModelID IS 'Foreign key identifier for the model of the equipment';

COMMENT ON COLUMN odm2.Equipment.EquipmentSerialNumber IS 'Manufacturer''s serial number for the specific piece of equipment';

COMMENT ON COLUMN odm2.Equipment.EquipmentOwnerID IS 'Foreign key identifer for the person that owns the piece of equipment';

COMMENT ON COLUMN odm2.Equipment.EquipmentVendorID IS 'Foreign key identifier for the vendor organization for the piece of equipment';

COMMENT ON COLUMN odm2.Equipment.EquipmentPurchaseDate IS 'Date that the piece of equipment was purchased';

COMMENT ON COLUMN odm2.Equipment.EquipmentPurchaseOrderNumber IS 'A text string identifying the purchase order used to purchase the piece of equipment';

COMMENT ON COLUMN odm2.Equipment.EquipmentDescription IS 'Text notes about the specific piece of equipment';

COMMENT ON COLUMN odm2.Equipment.EquipmentDocumentationLink IS 'A file name, path, or URL to a photo of the specific piece of equipment';

COMMENT ON TABLE odm2.Equipment IS 'Descriptions of specific pieces of equipment.';


/******************** Add Table: odm2.EquipmentActions ************************/

/* Build Table Structure */
CREATE TABLE odm2.EquipmentActions
(
	BridgeID INTEGER NOT NULL,
	EquipmentID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.EquipmentActions ADD CONSTRAINT pkEquipmentActions
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.EquipmentActions.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.EquipmentActions.EquipmentID IS 'Foreign key identifier of the Equipment entity associated with the Action';

COMMENT ON COLUMN odm2.EquipmentActions.ActionID IS 'Foreign key identifier of the Action';


/******************** Add Table: odm2.EquipmentModels ************************/

/* Build Table Structure */
CREATE TABLE odm2.EquipmentModels
(
	EquipmentModelID INTEGER NOT NULL,
	ModelManufacturerID INTEGER NOT NULL,
	ModelPartNumber VARCHAR(50) NULL,
	ModelName VARCHAR(255) NOT NULL,
	ModelDescription VARCHAR(500) NULL,
	IsInstrument BOOL NOT NULL,
	ModelSpecificationsFileLink VARCHAR(255) NULL,
	ModelLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.EquipmentModels ADD CONSTRAINT pkEquipmentModels
	PRIMARY KEY (EquipmentModelID);

/* Add Comments */
COMMENT ON COLUMN odm2.EquipmentModels.EquipmentModelID IS 'Unique identifier';

COMMENT ON COLUMN odm2.EquipmentModels.ModelManufacturerID IS 'Foreign key identifier of the model manufacturer';

COMMENT ON COLUMN odm2.EquipmentModels.ModelPartNumber IS 'A part number for the equipment model';

COMMENT ON COLUMN odm2.EquipmentModels.ModelName IS 'Text name of the equipment model';

COMMENT ON COLUMN odm2.EquipmentModels.ModelDescription IS 'Text description of the equipment model';

COMMENT ON COLUMN odm2.EquipmentModels.IsInstrument IS 'A boolean indication of whether the equipment is a sensor/instrument used to make observations';

COMMENT ON COLUMN odm2.EquipmentModels.ModelSpecificationsFileLink IS 'File name, path, or URL to a specifications file for the equipment';

COMMENT ON COLUMN odm2.EquipmentModels.ModelLink IS 'A URL to a website or file having a description of the equipment model';

COMMENT ON TABLE odm2.EquipmentModels IS 'Describes models of sensors, loggers, and related equipment used in making observations.';


/******************** Add Table: odm2.InstrumentOutputVariables ************************/

/* Build Table Structure */
CREATE TABLE odm2.InstrumentOutputVariables
(
	InstrumentOutputVariableID INTEGER NOT NULL,
	ModelID INTEGER NOT NULL,
	VariableID INTEGER NOT NULL,
	InstrumentMethodID INTEGER NOT NULL,
	InstrumentResolution VARCHAR(255) NULL,
	InstrumentAccuracy VARCHAR(255) NULL,
	InstrumentRawOutputUnitsID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.InstrumentOutputVariables ADD CONSTRAINT pkInstrumentOutputVariables
	PRIMARY KEY (InstrumentOutputVariableID);

/* Add Comments */
COMMENT ON COLUMN odm2.InstrumentOutputVariables.InstrumentOutputVariableID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.InstrumentOutputVariables.ModelID IS 'Foreign key identifier of the Equipment Model';

COMMENT ON COLUMN odm2.InstrumentOutputVariables.VariableID IS 'Foreign key identifier of the Variable output by the Equipment Model';

COMMENT ON COLUMN odm2.InstrumentOutputVariables.InstrumentMethodID IS 'Foreign key identifier of the Method used to output the Variable from the Equipment Model';

COMMENT ON COLUMN odm2.InstrumentOutputVariables.InstrumentResolution IS 'Text description of the resolution of the output variable';

COMMENT ON COLUMN odm2.InstrumentOutputVariables.InstrumentAccuracy IS 'Text description of the accuracy of the output variable';

COMMENT ON COLUMN odm2.InstrumentOutputVariables.InstrumentRawOutputUnitsID IS 'Foreign key identifier of the raw output Units associated with the output variable';

COMMENT ON TABLE odm2.InstrumentOutputVariables IS 'Information about the Variables that an instrument is capable of measuring';


/******************** Add Table: odm2.MaintenanceActions ************************/

/* Build Table Structure */
CREATE TABLE odm2.MaintenanceActions
(
	ActionID INTEGER NOT NULL,
	IsFactoryService BOOL NOT NULL,
	FactoryServiceCode VARCHAR(50) NULL,
	FactoryServiceReason VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.MaintenanceActions ADD CONSTRAINT pkMaintenanceActions
	PRIMARY KEY (ActionID);

/* Add Comments */
COMMENT ON COLUMN odm2.MaintenanceActions.ActionID IS 'Primary key and foreign key idenfier of the Equipment MaintenanceAction';

COMMENT ON COLUMN odm2.MaintenanceActions.IsFactoryService IS 'Boolean indicator of whether the Action is a factory service';

COMMENT ON COLUMN odm2.MaintenanceActions.FactoryServiceCode IS 'Text code assigned by the factory to the service performed';

COMMENT ON COLUMN odm2.MaintenanceActions.FactoryServiceReason IS 'Text description of why the factory service Action was required';

COMMENT ON TABLE odm2.MaintenanceActions IS 'Information about maintenance Actions performed on Equipment';


/******************** Add Table: odm2.RelatedEquipment ************************/

/* Build Table Structure */
CREATE TABLE odm2.RelatedEquipment
(
	RelationID INTEGER NOT NULL,
	EquipmentID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedEquipmentID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.RelatedEquipment ADD CONSTRAINT pkRelatedEquipment
	PRIMARY KEY (RelationID);

/* Add Comments */
COMMENT ON COLUMN odm2.RelatedEquipment.RelationID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.RelatedEquipment.EquipmentID IS 'Foreign key identifier for a piece of Equipment';

COMMENT ON COLUMN odm2.RelatedEquipment.RelationshipTypeCV IS 'Text string indicating the type of relationship between two pieces of equipement';

COMMENT ON COLUMN odm2.RelatedEquipment.RelatedEquipmentID IS 'Foreign key identifier of the related piece of equipment';

COMMENT ON TABLE odm2.RelatedEquipment IS 'Information about relationships among Equipment';


/******************** Add Table: odm2.ActionExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.ActionExtensionPropertyValues
(
	BridgeID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ActionExtensionPropertyValues ADD CONSTRAINT pkActionExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.ActionExtensionPropertyValues.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.ActionExtensionPropertyValues.ActionID IS 'Foreign key of the Action';

COMMENT ON COLUMN odm2.ActionExtensionPropertyValues.PropertyID IS 'Foreign key of the extension property added to the Action';

COMMENT ON COLUMN odm2.ActionExtensionPropertyValues.PropertyValue IS 'Value of the extension property added to the Action';


/******************** Add Table: odm2.CitationExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.CitationExtensionPropertyValues
(
	BridgeID INTEGER NOT NULL,
	CitationID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.CitationExtensionPropertyValues ADD CONSTRAINT pkCitationExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.CitationExtensionPropertyValues.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.CitationExtensionPropertyValues.CitationID IS 'Foreign key identifier of the Citation being extended';

COMMENT ON COLUMN odm2.CitationExtensionPropertyValues.PropertyID IS 'Foreign key identifier for the Property being applied to the Citation';

COMMENT ON COLUMN odm2.CitationExtensionPropertyValues.PropertyValue IS 'Value of the property being applied to the Citation';

COMMENT ON TABLE odm2.CitationExtensionPropertyValues IS 'Values for Citation Extension Properties';


/******************** Add Table: odm2.ExtensionProperties ************************/

/* Build Table Structure */
CREATE TABLE odm2.ExtensionProperties
(
	PropertyID INTEGER NOT NULL,
	PropertyName VARCHAR(255) NOT NULL,
	PropertyDescription VARCHAR(500) NULL,
	PropertyDataTypeCV VARCHAR(255) NOT NULL,
	PropertyUnitsID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ExtensionProperties ADD CONSTRAINT pkExtensionProperties
	PRIMARY KEY (PropertyID);

/* Add Comments */
COMMENT ON COLUMN odm2.ExtensionProperties.PropertyID IS 'Unique identifier';

COMMENT ON COLUMN odm2.ExtensionProperties.PropertyName IS 'Text name of the extension property';

COMMENT ON COLUMN odm2.ExtensionProperties.PropertyDescription IS 'Text description of the extension property';

COMMENT ON COLUMN odm2.ExtensionProperties.PropertyDataTypeCV IS 'CV term specifying the data type of the property value';

COMMENT ON COLUMN odm2.ExtensionProperties.PropertyUnitsID IS 'Foreign key identifier for the units of the property value';

COMMENT ON TABLE odm2.ExtensionProperties IS 'Describes extension properties added to objects in an ODM database';


/******************** Add Table: odm2.MethodExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.MethodExtensionPropertyValues
(
	BridgeID INTEGER NOT NULL,
	MethodID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.MethodExtensionPropertyValues ADD CONSTRAINT pkMethodExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.MethodExtensionPropertyValues.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.MethodExtensionPropertyValues.MethodID IS 'Foreign key identifier for the Method';

COMMENT ON COLUMN odm2.MethodExtensionPropertyValues.PropertyID IS 'Foreign key identifier for the extension property';

COMMENT ON COLUMN odm2.MethodExtensionPropertyValues.PropertyValue IS 'Text or numeric value of the extension property';

COMMENT ON TABLE odm2.MethodExtensionPropertyValues IS 'Links extnsion properties to a Method';


/******************** Add Table: odm2.ResultExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.ResultExtensionPropertyValues
(
	BridgeID INTEGER NOT NULL,
	ResultID BIGINT NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ResultExtensionPropertyValues ADD CONSTRAINT pkResultExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.ResultExtensionPropertyValues.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.ResultExtensionPropertyValues.ResultID IS 'Foreign key identifier for the result to which the extension property applies';

COMMENT ON COLUMN odm2.ResultExtensionPropertyValues.PropertyID IS 'Foreign key identifier for the extension propery';

COMMENT ON COLUMN odm2.ResultExtensionPropertyValues.PropertyValue IS 'Text or numeric value of the extension property';

COMMENT ON TABLE odm2.ResultExtensionPropertyValues IS 'Links extension properties to a Result';


/******************** Add Table: odm2.SamplingFeatureExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.SamplingFeatureExtensionPropertyValues
(
	BridgeID INTEGER NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SamplingFeatureExtensionPropertyValues ADD CONSTRAINT pkSamplingFeatureExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.SamplingFeatureExtensionPropertyValues.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.SamplingFeatureExtensionPropertyValues.SamplingFeatureID IS 'Foreign key of the SamplingFeature being extended';

COMMENT ON COLUMN odm2.SamplingFeatureExtensionPropertyValues.PropertyID IS 'Foreign key of the extension property being added to the sampling feature ';

COMMENT ON COLUMN odm2.SamplingFeatureExtensionPropertyValues.PropertyValue IS 'Value of the property being added to the sampling feature';


/******************** Add Table: odm2.VariableExtensionPropertyValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.VariableExtensionPropertyValues
(
	BridgeID INTEGER NOT NULL,
	VariableID INTEGER NOT NULL,
	PropertyID INTEGER NOT NULL,
	PropertyValue VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.VariableExtensionPropertyValues ADD CONSTRAINT pkVariableExtensionPropertyValues
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.VariableExtensionPropertyValues.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.VariableExtensionPropertyValues.VariableID IS 'Foreign key of the variable being extended';

COMMENT ON COLUMN odm2.VariableExtensionPropertyValues.PropertyID IS 'Foreign key of the extension property being applied to the variable';

COMMENT ON COLUMN odm2.VariableExtensionPropertyValues.PropertyValue IS 'Text or numeric value of the extension property for the variable';


/******************** Add Table: odm2.CitationExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.CitationExternalIdentifiers
(
	BridgeID INTEGER NOT NULL,
	CitationID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	CitationExternalIdentifer VARCHAR(255) NOT NULL,
	CitationExternalIdentiferURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.CitationExternalIdentifiers ADD CONSTRAINT pkCitationExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.CitationExternalIdentifiers.CitationID IS 'Forign key of the Citation linked to the external identifer';

COMMENT ON COLUMN odm2.CitationExternalIdentifiers.ExternalIdentifierSystemID IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN odm2.CitationExternalIdentifiers.CitationExternalIdentifer IS 'A resolvable, globally unique ID, such as a DOI; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN odm2.CitationExternalIdentifiers.CitationExternalIdentiferURI IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.';


/******************** Add Table: odm2.ExternalIdentifierSystems ************************/

/* Build Table Structure */
CREATE TABLE odm2.ExternalIdentifierSystems
(
	ExternalIdentifierSystemID INTEGER NOT NULL,
	ExternalIdentifierSystemName VARCHAR(255) NOT NULL,
	IdentifierSystemOrganizationID INTEGER NOT NULL,
	ExternalIdentifierSystemDescription VARCHAR(500) NULL,
	ExternalIdentifierSystemURL VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ExternalIdentifierSystems ADD CONSTRAINT pkExternalIdentifierSystems
	PRIMARY KEY (ExternalIdentifierSystemID);

/* Add Comments */
COMMENT ON COLUMN odm2.ExternalIdentifierSystems.ExternalIdentifierSystemID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.ExternalIdentifierSystems.ExternalIdentifierSystemName IS 'Defines the identifier system used (i.e. IGSN, SWRC Sample Number, etc.)';

COMMENT ON COLUMN odm2.ExternalIdentifierSystems.IdentifierSystemOrganizationID IS 'Foreign Key identifer for the organization overseeing or affiliated with the identifier system';

COMMENT ON COLUMN odm2.ExternalIdentifierSystems.ExternalIdentifierSystemDescription IS 'Description of identifier system.';

COMMENT ON COLUMN odm2.ExternalIdentifierSystems.ExternalIdentifierSystemURL IS 'Universal Resource Locator (URL) for resolution/translation of an identifier system''s URNs (i.e. http://dx.doi.org/ is the resolver URL for doi:10.1002/2013GL057450)';

COMMENT ON TABLE odm2.ExternalIdentifierSystems IS 'A single table for connecting various primary keys with points to outside systems.';


/******************** Add Table: odm2.MethodExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.MethodExternalIdentifiers
(
	BridgeID INTEGER NOT NULL,
	MethodID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	MethodExternalIdentifier VARCHAR(255) NOT NULL,
	MethodExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.MethodExternalIdentifiers ADD CONSTRAINT pkMethodExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.MethodExternalIdentifiers.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.MethodExternalIdentifiers.MethodID IS 'Foreign Key to SamplingFeatures';

COMMENT ON COLUMN odm2.MethodExternalIdentifiers.ExternalIdentifierSystemID IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN odm2.MethodExternalIdentifiers.MethodExternalIdentifier IS 'A resolvable, globally unique ID, such as a NEMI method number; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN odm2.MethodExternalIdentifiers.MethodExternalIdentifierURI IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.';


/******************** Add Table: odm2.PersonExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.PersonExternalIdentifiers
(
	BridgeID INTEGER NOT NULL,
	PersonID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	PersonExternalIdentifier VARCHAR(255) NOT NULL,
	PersonExternalIdenifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.PersonExternalIdentifiers ADD CONSTRAINT pkPersonExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.PersonExternalIdentifiers.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.PersonExternalIdentifiers.PersonID IS 'Foreign Key to People table';

COMMENT ON COLUMN odm2.PersonExternalIdentifiers.ExternalIdentifierSystemID IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN odm2.PersonExternalIdentifiers.PersonExternalIdentifier IS 'A resolvable, globally unique ID, such as an IGSN; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN odm2.PersonExternalIdentifiers.PersonExternalIdenifierURI IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.';

COMMENT ON TABLE odm2.PersonExternalIdentifiers IS 'Cross reference linking table to allow many to many ';


/******************** Add Table: odm2.ReferenceMaterialExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.ReferenceMaterialExternalIdentifiers
(
	BridgeID INTEGER NOT NULL,
	ReferenceMaterialID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	ReferenceMaterialExternalIdentifier VARCHAR(255) NOT NULL,
	ReferenceMaterialExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ReferenceMaterialExternalIdentifiers ADD CONSTRAINT pkReferenceMaterialExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.ReferenceMaterialExternalIdentifiers.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.ReferenceMaterialExternalIdentifiers.ReferenceMaterialID IS 'Foreign Key to ReferenceMaterials';

COMMENT ON COLUMN odm2.ReferenceMaterialExternalIdentifiers.ExternalIdentifierSystemID IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN odm2.ReferenceMaterialExternalIdentifiers.ReferenceMaterialExternalIdentifier IS 'A resolvable, globally unique ID, such as NBS-19; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN odm2.ReferenceMaterialExternalIdentifiers.ReferenceMaterialExternalIdentifierURI IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.';


/******************** Add Table: odm2.SamplingFeatureExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.SamplingFeatureExternalIdentifiers
(
	BridgeID INTEGER NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	SamplingFeatureExternalIdentifier VARCHAR(255) NOT NULL,
	SamplingFeatureExternalIdentiferURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SamplingFeatureExternalIdentifiers ADD CONSTRAINT pkSamplingFeatureExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.SamplingFeatureExternalIdentifiers.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.SamplingFeatureExternalIdentifiers.SamplingFeatureID IS 'Foreign Key to SamplingFeatures';

COMMENT ON COLUMN odm2.SamplingFeatureExternalIdentifiers.ExternalIdentifierSystemID IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN odm2.SamplingFeatureExternalIdentifiers.SamplingFeatureExternalIdentifier IS 'A resolvable, globally unique ID, such as an IGSN; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN odm2.SamplingFeatureExternalIdentifiers.SamplingFeatureExternalIdentiferURI IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.';


/******************** Add Table: odm2.SpatialReferenceExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.SpatialReferenceExternalIdentifiers
(
	BridgeID INTEGER NOT NULL,
	SpatialReferenceID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	SpatialReferenceExternalIdentifier VARCHAR(255) NOT NULL,
	SpatialReferenceExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SpatialReferenceExternalIdentifiers ADD CONSTRAINT pkSpatialReferenceExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.SpatialReferenceExternalIdentifiers.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';


/******************** Add Table: odm2.TaxonomicClassifierExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.TaxonomicClassifierExternalIdentifiers
(
	BridgeID INTEGER NOT NULL,
	TaxonomicClassifierID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	TaxonomicClassifierExternalIdentifier VARCHAR(255) NOT NULL,
	TaxonomicClassifierExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT pkTaxonomicClassifierExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.TaxonomicClassifierExternalIdentifiers.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.TaxonomicClassifierExternalIdentifiers.TaxonomicClassifierID IS 'Foreign Key to TaxonomicClassifiers';

COMMENT ON COLUMN odm2.TaxonomicClassifierExternalIdentifiers.ExternalIdentifierSystemID IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN odm2.TaxonomicClassifierExternalIdentifiers.TaxonomicClassifierExternalIdentifier IS 'A resolvable, globally unique ID, such as a GBIF ID; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN odm2.TaxonomicClassifierExternalIdentifiers.TaxonomicClassifierExternalIdentifierURI IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.';


/******************** Add Table: odm2.VariableExternalIdentifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.VariableExternalIdentifiers
(
	BridgeID INTEGER NOT NULL,
	VariableID INTEGER NOT NULL,
	ExternalIdentifierSystemID INTEGER NOT NULL,
	VariableExternalIdentifer VARCHAR(255) NOT NULL,
	VariableExternalIdentifierURI VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.VariableExternalIdentifiers ADD CONSTRAINT pkVariableExternalIdentifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.VariableExternalIdentifiers.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.VariableExternalIdentifiers.VariableID IS 'Foreign Key to Variables';

COMMENT ON COLUMN odm2.VariableExternalIdentifiers.ExternalIdentifierSystemID IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN odm2.VariableExternalIdentifiers.VariableExternalIdentifer IS 'A resolvable, globally unique ID; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN odm2.VariableExternalIdentifiers.VariableExternalIdentifierURI IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.';


/******************** Add Table: odm2.ActionDirectives ************************/

/* Build Table Structure */
CREATE TABLE odm2.ActionDirectives
(
	BridgeID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	DirectiveID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ActionDirectives ADD CONSTRAINT pkActionDirectives
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.ActionDirectives.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.ActionDirectives.ActionID IS 'Foreign key identifier of the Action';

COMMENT ON COLUMN odm2.ActionDirectives.DirectiveID IS 'Foreign key identifier of the Directive';


/******************** Add Table: odm2.Directives ************************/

/* Build Table Structure */
CREATE TABLE odm2.Directives
(
	DirectiveID INTEGER NOT NULL,
	DirectiveTypeCV VARCHAR(255) NOT NULL,
	DirectiveDescription VARCHAR(500) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Directives ADD CONSTRAINT pkDirectives
	PRIMARY KEY (DirectiveID);

/* Add Comments */
COMMENT ON COLUMN odm2.Directives.DirectiveID IS 'Unique identifier.';

COMMENT ON COLUMN odm2.Directives.DirectiveTypeCV IS 'Directive type, such as project, intended analyte/analysis for a Specimen, etc.';

COMMENT ON COLUMN odm2.Directives.DirectiveDescription IS 'Text description of the directive or purpose under which the action was taken.';

COMMENT ON TABLE odm2.Directives IS 'Describes the directive or purpose under which actions are made.  Directives can be projects, intended analyses for a specimen, etc.';


/******************** Add Table: odm2.SpecimenBatchPostions ************************/

/* Build Table Structure */
CREATE TABLE odm2.SpecimenBatchPostions
(
	FeatureActionID INTEGER NOT NULL,
	BatchPositionNumber INTEGER NOT NULL,
	BatchPositionLabel VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SpecimenBatchPostions ADD CONSTRAINT pkSpecimenBatchPostions
	PRIMARY KEY (FeatureActionID);

/* Add Comments */
COMMENT ON COLUMN odm2.SpecimenBatchPostions.FeatureActionID IS 'Foriegn key identifer for the Specimen Preparation or Analysis Batch';

COMMENT ON COLUMN odm2.SpecimenBatchPostions.BatchPositionNumber IS 'The position or line number of a specimen within a PreparationBatchAction or an InstrumentAnalysisAction.';

COMMENT ON COLUMN odm2.SpecimenBatchPostions.BatchPositionLabel IS 'The label text for a specimen within a PreparationBatchAction or an InstrumentAnalysisAction.';



/******************** Add Table: odm2.AuthorLists ************************/

/* Build Table Structure */
CREATE TABLE odm2.AuthorLists
(
	BridgeID INTEGER NOT NULL,
	CitationID INTEGER NOT NULL,
	PersonID INTEGER NOT NULL,
	AuthorOrder INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.AuthorLists ADD CONSTRAINT pkAuthorLists
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.AuthorLists.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.AuthorLists.CitationID IS 'Foreign key identifier for a Citation';

COMMENT ON COLUMN odm2.AuthorLists.PersonID IS 'Foreign key identifier for a Person that is an author of the Citation';

COMMENT ON COLUMN odm2.AuthorLists.AuthorOrder IS 'Integer order of the authors of the Citation starting with 1 for first author';

COMMENT ON TABLE odm2.AuthorLists IS 'Relationship between Citations and their Authors';


/******************** Add Table: odm2.Citations ************************/

/* Build Table Structure */
CREATE TABLE odm2.Citations
(
	CitationID INTEGER NOT NULL,
	Title VARCHAR(255) NOT NULL,
	Publisher VARCHAR(255) NOT NULL,
	PublicationYear INTEGER NOT NULL,
	CitationLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Citations ADD CONSTRAINT pkCitations
	PRIMARY KEY (CitationID);

/* Add Comments */
COMMENT ON COLUMN odm2.Citations.CitationID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.Citations.Title IS 'Text title of the Citation';

COMMENT ON COLUMN odm2.Citations.Publisher IS 'Text publisher of the Citation';

COMMENT ON COLUMN odm2.Citations.PublicationYear IS 'Integer publication year (4 digits) of the Citation';

COMMENT ON COLUMN odm2.Citations.CitationLink IS 'Text link to the Citation (i.e. URL or path).';

COMMENT ON TABLE odm2.Citations IS 'Information about Citations';


/******************** Add Table: odm2.DataSetCitations ************************/

/* Build Table Structure */
CREATE TABLE odm2.DataSetCitations
(
	BridgeID INTEGER NOT NULL,
	DataSetID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	CitationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.DataSetCitations ADD CONSTRAINT pkDataSetCitations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.DataSetCitations.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.DataSetCitations.DataSetID IS 'Foreign key identifier for a DataSet';

COMMENT ON COLUMN odm2.DataSetCitations.RelationshipTypeCV IS 'CV term describing the relationship between the DataSet and the Citation (e.g., cites or isCitedBy), largely conforming to CV used by DataCite.org.';

COMMENT ON COLUMN odm2.DataSetCitations.CitationID IS 'Foreign key identifier for a Citation that is associated with the DataSet identified by DataSetID';

COMMENT ON TABLE odm2.DataSetCitations IS 'Relationship between DataSets and Citations';


/******************** Add Table: odm2.DerivationEquations ************************/

/* Build Table Structure */
CREATE TABLE odm2.DerivationEquations
(
	DerivationEquationID INTEGER NOT NULL,
	DerivationEquation VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.DerivationEquations ADD CONSTRAINT pkDerivationEquations
	PRIMARY KEY (DerivationEquationID);

/* Add Comments */
COMMENT ON COLUMN odm2.DerivationEquations.DerivationEquationID IS 'Primary key for DerivationEquations, which include calibration equations, normalizations, etc. on one or more RelatedResults to produce a DerivedResult.';

COMMENT ON COLUMN odm2.DerivationEquations.DerivationEquation IS 'Text of the equation used to derive a Result from one or more RelatedResults, where y is the DerivedResult and x1, x2, ..., xn are the RelatedResults specified in order by RelatedResultSequenceID.';

COMMENT ON TABLE odm2.DerivationEquations IS 'DerivationEquations include calibration equations, normalizations, etc. on one or more RelatedResults to produce a DerivedResult.';


/******************** Add Table: odm2.MethodCitations ************************/

/* Build Table Structure */
CREATE TABLE odm2.MethodCitations
(
	BridgeID INTEGER NOT NULL,
	MethodID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	CitationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.MethodCitations ADD CONSTRAINT pkMethodCitations
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.MethodCitations.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.MethodCitations.MethodID IS 'Foreign key identifier for a Method';

COMMENT ON COLUMN odm2.MethodCitations.RelationshipTypeCV IS 'CV term describing the relationship between the Methods and the Citation (e.g., References or isDocumentedBy), largely conforming to CV used by DataCite.org.';

COMMENT ON COLUMN odm2.MethodCitations.CitationID IS 'Foreign key identifier for a Citation that is associated with the Method identified by MethodID';


/******************** Add Table: odm2.RelatedAnnotations ************************/

/* Build Table Structure */
CREATE TABLE odm2.RelatedAnnotations
(
	RelationID INTEGER NOT NULL,
	AnnotationID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedAnnotationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.RelatedAnnotations ADD CONSTRAINT pkRelatedAnnotations
	PRIMARY KEY (RelationID);

/* Add Comments */
COMMENT ON TABLE odm2.RelatedAnnotations IS 'Stores information about relationships among Annotations';


/******************** Add Table: odm2.RelatedCitations ************************/

/* Build Table Structure */
CREATE TABLE odm2.RelatedCitations
(
	RelationID INTEGER NOT NULL,
	CitationID INTEGER NOT NULL,
	RelationshipTypeCV INTEGER NOT NULL,
	RelatedCitationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.RelatedCitations ADD CONSTRAINT pkRelatedCitations
	PRIMARY KEY (RelationID);

/* Add Comments */
COMMENT ON COLUMN odm2.RelatedCitations.RelationID IS 'Primary key for a relationship table (i.e. named Related...).';

COMMENT ON COLUMN odm2.RelatedCitations.CitationID IS 'Foreign key identifier for a Citation';

COMMENT ON COLUMN odm2.RelatedCitations.RelationshipTypeCV IS 'CV term describing the relationship between Citations (e.g., IsSupplementTo or IsPartOf), largely conforming to CV used by DataCite.org.';

COMMENT ON COLUMN odm2.RelatedCitations.RelatedCitationID IS 'Foreign key identifier for a Citation that is related to the Citation identified by CitationID';

COMMENT ON TABLE odm2.RelatedCitations IS 'Information about relationships among citations';


/******************** Add Table: odm2.RelatedDatasets ************************/

/* Build Table Structure */
CREATE TABLE odm2.RelatedDatasets
(
	RelationID INTEGER NOT NULL,
	DataSetID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedDatasetID INTEGER NOT NULL,
	VersionCode VARCHAR(50) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.RelatedDatasets ADD CONSTRAINT pkRelatedDatasets
	PRIMARY KEY (RelationID);

/* Add Comments */
COMMENT ON COLUMN odm2.RelatedDatasets.RelationID IS 'Primary key for a relationship table (i.e. named Related...).';

COMMENT ON COLUMN odm2.RelatedDatasets.DataSetID IS 'Foreign key identifier for a DataSet';

COMMENT ON COLUMN odm2.RelatedDatasets.RelationshipTypeCV IS 'CV term describing the relationship between DataSets (e.g., IsNewVersionOf or Continues), largely conforming to CV used by DataCite.org.';

COMMENT ON COLUMN odm2.RelatedDatasets.RelatedDatasetID IS 'Foreign key identifier for a DataSet related to the DataSet identified by DataSetID';

COMMENT ON COLUMN odm2.RelatedDatasets.VersionCode IS 'Text version number/code that can be specified if the DataSet is an explicit version of another DataSet and where the RelationshipTypeCV = isNewVersionOf.';

COMMENT ON TABLE odm2.RelatedDatasets IS 'Information about relationships among DataSets';


/******************** Add Table: odm2.RelatedResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.RelatedResults
(
	RelationID INTEGER NOT NULL,
	ResultID BIGINT NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedResultID BIGINT NOT NULL,
	VersionCode VARCHAR(50) NULL,
	RelatedResultSequenceNumber INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE odm2.RelatedResults ADD CONSTRAINT pkRelatedResults
	PRIMARY KEY (RelationID);

/* Add Comments */
COMMENT ON COLUMN odm2.RelatedResults.RelationID IS 'Primary key for a relationship table (i.e. named Related...).';

COMMENT ON COLUMN odm2.RelatedResults.ResultID IS 'Foreign key identifier for a Result';

COMMENT ON COLUMN odm2.RelatedResults.RelationshipTypeCV IS 'Text description of the relationship between the Results from a controlled vocabulary (e.g., isDerivedFrom)';

COMMENT ON COLUMN odm2.RelatedResults.RelatedResultID IS 'Foreign key identifier for a Result that is related to the Result identified by ResultID';

COMMENT ON COLUMN odm2.RelatedResults.VersionCode IS 'Text version number/code that can be specified if the Result is an explicit version of another Result and where the RelationshipTypeCV = isNewVersionOf.';

COMMENT ON COLUMN odm2.RelatedResults.RelatedResultSequenceNumber IS 'Integer sequence number indicating the order in which a RelatedResults appears in a DerivationEquation (i.e. 1 for x1, 2 for x2...) and where a Result isDerivedFrom one or more  RelatedResults.';

COMMENT ON TABLE odm2.RelatedResults IS 'Information about relationships among Results';


/******************** Add Table: odm2.ResultDerivationEquations ************************/

/* Build Table Structure */
CREATE TABLE odm2.ResultDerivationEquations
(
	ResultID BIGINT NOT NULL,
	DerivationEquationID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.ResultDerivationEquations ADD CONSTRAINT pkResultDerivationEquations
	PRIMARY KEY (ResultID);

/* Add Comments */
COMMENT ON COLUMN odm2.ResultDerivationEquations.ResultID IS 'Foreign key identifier for a Result that was derived using the Equation specified by DerivationEquationID';

COMMENT ON COLUMN odm2.ResultDerivationEquations.DerivationEquationID IS 'Foreign key identifier for the DerivationEquation used to derive the Result identified by ResultID';

COMMENT ON TABLE odm2.ResultDerivationEquations IS 'Relationship between Results and Equations used to derive them';


/******************** Add Table: odm2.CategoricalResultValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.CategoricalResultValues
(
	ValueID BIGINT NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue VARCHAR(255) NOT NULL,
	ValueDateTime TIMESTAMP NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.CategoricalResultValues ADD CONSTRAINT pkCategoricalResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: odm2.CategoricalResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.CategoricalResults
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
ALTER TABLE odm2.CategoricalResults ADD CONSTRAINT pkCategoricalResults
	PRIMARY KEY (ResultID);


/******************** Add Table: odm2.MeasurementResultValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.MeasurementResultValues
(
	ValueID BIGINT NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime TIMESTAMP NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.MeasurementResultValues ADD CONSTRAINT pkMeasurementResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: odm2.MeasurementResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.MeasurementResults
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
ALTER TABLE odm2.MeasurementResults ADD CONSTRAINT pkMeasurementResults
	PRIMARY KEY (ResultID);


/******************** Add Table: odm2.PointCoverageResultValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.PointCoverageResultValues
(
	ValueID BIGINT NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue BIGINT NOT NULL,
	ValueDateTime TIMESTAMP NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	XLocation FLOAT NOT NULL,
	XLocationUnitsID INTEGER NOT NULL,
	YLocation FLOAT NOT NULL,
	YLocationUnitsID INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.PointCoverageResultValues ADD CONSTRAINT pkPointCoverageResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: odm2.PointCoverageResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.PointCoverageResults
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
ALTER TABLE odm2.PointCoverageResults ADD CONSTRAINT pkPointCoverageResults
	PRIMARY KEY (ResultID);


/******************** Add Table: odm2.ProfileResultValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.ProfileResultValues
(
	ValueID BIGINT NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime TIMESTAMP NOT NULL,
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
ALTER TABLE odm2.ProfileResultValues ADD CONSTRAINT pkProfileResultValues
	PRIMARY KEY (ValueID);

/* Add Comments */
COMMENT ON TABLE odm2.ProfileResultValues IS 'Numeric values of Depth Profile Results.';


/******************** Add Table: odm2.ProfileResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.ProfileResults
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
ALTER TABLE odm2.ProfileResults ADD CONSTRAINT pkProfileResults
	PRIMARY KEY (ResultID);

/* Add Comments */
COMMENT ON TABLE odm2.ProfileResults IS 'Information about Profile Results';


/******************** Add Table: odm2.ResultTypeCV ************************/

/* Build Table Structure */
CREATE TABLE odm2.ResultTypeCV
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
ALTER TABLE odm2.ResultTypeCV ADD CONSTRAINT pkResultTypeCV
	PRIMARY KEY (ResultTypeCV);


/******************** Add Table: odm2.SectionResultValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.SectionResultValues
(
	ValueID BIGINT NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue DOUBLE PRECISION NOT NULL,
	ValueDateTime BIGINT NOT NULL,
	ValueDateTimeUTCOffset BIGINT NOT NULL,
	XLocation DOUBLE PRECISION NOT NULL,
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
ALTER TABLE odm2.SectionResultValues ADD CONSTRAINT pkSectionResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: odm2.SectionResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.SectionResults
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
ALTER TABLE odm2.SectionResults ADD CONSTRAINT pkSectionResults
	PRIMARY KEY (ResultID);


/******************** Add Table: odm2.SpectraResultValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.SpectraResultValues
(
	ValueID BIGINT NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime TIMESTAMP NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	ExcitationWavelength FLOAT NOT NULL,
	EmissionWavelength FLOAT NOT NULL,
	WavelengthUnitsID INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval DOUBLE PRECISION NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SpectraResultValues ADD CONSTRAINT pkSpectraResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: odm2.SpectraResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.SpectraResults
(
	ResultID BIGINT NOT NULL,
	XLocation FLOAT NULL,
	XLocationUnitsID INTEGER NULL,
	YLocation FLOAT NULL,
	YLocationUnitsID INTEGER NULL,
	ZLocation FLOAT NULL,
	ZLocationUnitsID INTEGER NULL,
	SpatialReferenceID INTEGER NULL,
	IntendedWavelengthSpacing DOUBLE PRECISION NULL,
	IntendedWavelengthSpacingUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SpectraResults ADD CONSTRAINT pkSpectraResults
	PRIMARY KEY (ResultID);


/******************** Add Table: odm2.TimeSeriesResultValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.TimeSeriesResultValues
(
	ValueID BIGINT NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime TIMESTAMP NOT NULL,
	ValueDateTimeUTCOffset INTEGER NOT NULL,
	CensorCodeCV VARCHAR(255) NOT NULL,
	QualityCodeCV VARCHAR(255) NOT NULL,
	TimeAggregationInterval FLOAT NOT NULL,
	TimeAggregationIntervalUnitsID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.TimeSeriesResultValues ADD CONSTRAINT pkTimeSeriesResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: odm2.TimeSeriesResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.TimeSeriesResults
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
ALTER TABLE odm2.TimeSeriesResults ADD CONSTRAINT pkTimeSeriesResults
	PRIMARY KEY (ResultID);


/******************** Add Table: odm2.TrajectoryResultValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.TrajectoryResultValues
(
	ValueID BIGINT NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime TIMESTAMP NOT NULL,
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
ALTER TABLE odm2.TrajectoryResultValues ADD CONSTRAINT pkTrajectoryResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: odm2.TrajectoryResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.TrajectoryResults
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
ALTER TABLE odm2.TrajectoryResults ADD CONSTRAINT pkTrajectoryResults
	PRIMARY KEY (ResultID);


/******************** Add Table: odm2.TransectResultValues ************************/

/* Build Table Structure */
CREATE TABLE odm2.TransectResultValues
(
	ValueID BIGINT NOT NULL,
	ResultID BIGINT NOT NULL,
	DataValue FLOAT NOT NULL,
	ValueDateTime TIMESTAMP NOT NULL,
	ValueDateTimeUTCOffset TIMESTAMP NOT NULL,
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
ALTER TABLE odm2.TransectResultValues ADD CONSTRAINT pkTransectResultValues
	PRIMARY KEY (ValueID);


/******************** Add Table: odm2.TransectResults ************************/

/* Build Table Structure */
CREATE TABLE odm2.TransectResults
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
ALTER TABLE odm2.TransectResults ADD CONSTRAINT pkTransectResults
	PRIMARY KEY (ResultID);


/******************** Add Table: odm2.RelatedFeatures ************************/

/* Build Table Structure */
CREATE TABLE odm2.RelatedFeatures
(
	RelationID INTEGER NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	RelationshipTypeCV VARCHAR(255) NOT NULL,
	RelatedFeatureID INTEGER NOT NULL,
	SpatialOffsetID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE odm2.RelatedFeatures ADD CONSTRAINT pkRelatedFeatures
	PRIMARY KEY (RelationID);

/* Add Comments */
COMMENT ON COLUMN odm2.RelatedFeatures.RelationID IS 'Primary key for a relationship table (i.e. named Related...).';

COMMENT ON COLUMN odm2.RelatedFeatures.SamplingFeatureID IS 'Foregn key identifier of a Sampling Feature';

COMMENT ON COLUMN odm2.RelatedFeatures.RelationshipTypeCV IS 'CV term describing the relationship between SamplingFeatures (e.g., IsChildOf, IsFractionOf or IsCompositeOf).';

COMMENT ON COLUMN odm2.RelatedFeatures.RelatedFeatureID IS 'Foreign key identifier of a Sampling Feature that is the parent of the current Sampling Feature';

COMMENT ON COLUMN odm2.RelatedFeatures.SpatialOffsetID IS 'Foreign key identifier of a spatial offset from the feature parent';

COMMENT ON TABLE odm2.RelatedFeatures IS 'Describes parrent/child relationships among Sampling Features';


/******************** Add Table: odm2.Sites ************************/

/* Build Table Structure */
CREATE TABLE odm2.Sites
(
	SamplingFeatureID INTEGER NOT NULL,
	SiteTypeCV VARCHAR(255) NOT NULL,
	Latitude FLOAT NOT NULL,
	Longitude FLOAT NOT NULL,
	LatLonDatumID INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Sites ADD CONSTRAINT pkSites
	PRIMARY KEY (SamplingFeatureID);

/* Add Comments */
COMMENT ON COLUMN odm2.Sites.SamplingFeatureID IS 'Foreign key identifier of the Sampling Feature that is the Site';

COMMENT ON COLUMN odm2.Sites.SiteTypeCV IS 'A CV term describing the site type';

COMMENT ON COLUMN odm2.Sites.Latitude IS 'Latitude of the site';

COMMENT ON COLUMN odm2.Sites.Longitude IS 'Longitude of the site';

COMMENT ON COLUMN odm2.Sites.LatLonDatumID IS 'Foreign key identifier for the Spatial Reference System that describes the latitude and longitude coordinates';

COMMENT ON TABLE odm2.Sites IS 'Describes sampling features that are point sites';


/******************** Add Table: odm2.SpatialOffsets ************************/

/* Build Table Structure */
CREATE TABLE odm2.SpatialOffsets
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
ALTER TABLE odm2.SpatialOffsets ADD CONSTRAINT pkSpatialOffsets
	PRIMARY KEY (SpatialOffsetID);

/* Add Comments */
COMMENT ON COLUMN odm2.SpatialOffsets.SpatialOffsetID IS 'Primary Key of SpatialOffset';

COMMENT ON COLUMN odm2.SpatialOffsets.SpatialOffsetTypeCV IS 'Type of SpatialOffset, such as Depth, DepthInterval, HorizaontalRadial';

COMMENT ON COLUMN odm2.SpatialOffsets.Offset1Value IS 'Numerical value for 1st SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN odm2.SpatialOffsets.Offset1UnitID IS 'Units for 1st SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN odm2.SpatialOffsets.Offset2Value IS 'Numerical value for 2nd SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN odm2.SpatialOffsets.Offset2UnitID IS 'Units for 2nd SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN odm2.SpatialOffsets.Offset3Value IS 'Numerical value for 3rd SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN odm2.SpatialOffsets.Offset3UnitID IS 'Units for 3rd SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON TABLE odm2.SpatialOffsets IS 'An explicit spatial relationship between a sampling feature relative to it''s parent.';


/******************** Add Table: odm2.SpatialReferences ************************/

/* Build Table Structure */
CREATE TABLE odm2.SpatialReferences
(
	SpatialReferenceID INTEGER NOT NULL,
	SRSCode VARCHAR(50) NULL,
	SRSName VARCHAR(255) NOT NULL,
	SRSDescription VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SpatialReferences ADD CONSTRAINT pkSpatialReferences
	PRIMARY KEY (SpatialReferenceID);

/* Add Comments */
COMMENT ON COLUMN odm2.SpatialReferences.SpatialReferenceID IS 'Unique identifier';

COMMENT ON COLUMN odm2.SpatialReferences.SRSCode IS 'SRS code for the spatial reference system';

COMMENT ON COLUMN odm2.SpatialReferences.SRSName IS 'Text name of the spatial reference system';

COMMENT ON COLUMN odm2.SpatialReferences.SRSDescription IS 'Text notes describing the spatial reference system';

COMMENT ON TABLE odm2.SpatialReferences IS 'Describes spatial reference systems used to reference the coordinates for sites';


/******************** Add Table: odm2.SpecimenTaxonomicClassifiers ************************/

/* Build Table Structure */
CREATE TABLE odm2.SpecimenTaxonomicClassifiers
(
	BridgeID INTEGER NOT NULL,
	SamplingFeatureID INTEGER NOT NULL,
	TaxonomicClassifierID INTEGER NOT NULL,
	CitationID INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE odm2.SpecimenTaxonomicClassifiers ADD CONSTRAINT pkSpecimenTaxonomicClassifiers
	PRIMARY KEY (BridgeID);

/* Add Comments */
COMMENT ON COLUMN odm2.SpecimenTaxonomicClassifiers.BridgeID IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN odm2.SpecimenTaxonomicClassifiers.SamplingFeatureID IS 'Foreign key to SamplingFeatures.Specimens.';

COMMENT ON COLUMN odm2.SpecimenTaxonomicClassifiers.TaxonomicClassifierID IS 'Foreign key to TaxonomicClassifiers.';

COMMENT ON COLUMN odm2.SpecimenTaxonomicClassifiers.CitationID IS 'Foreign key to the attribution, or Citation, for the classification.';

COMMENT ON TABLE odm2.SpecimenTaxonomicClassifiers IS 'This cross-reference table allows Taxonomic Classification of Specimens as an annotation, rather than as a Result.';


/******************** Add Table: odm2.Specimens ************************/

/* Build Table Structure */
CREATE TABLE odm2.Specimens
(
	SamplingFeatureID INTEGER NOT NULL,
	SpecimenTypeCV VARCHAR(255) NOT NULL,
	SpecimenMediumCV VARCHAR(255) NOT NULL,
	IsFieldSpecimen BOOL NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.Specimens ADD CONSTRAINT pkSpecimens
	PRIMARY KEY (SamplingFeatureID);

/* Add Comments */
COMMENT ON COLUMN odm2.Specimens.SamplingFeatureID IS 'Foreign key identifier for the Sampling Feature that is the specimen';

COMMENT ON COLUMN odm2.Specimens.SpecimenTypeCV IS 'A CV term defining the type of specimen (e.g., aquatic sample, core, etc.)';

COMMENT ON COLUMN odm2.Specimens.SpecimenMediumCV IS 'A CV term defining the medium of the specimen (i.e. water, sediment, etc.)';

COMMENT ON COLUMN odm2.Specimens.IsFieldSpecimen IS 'A boolean indicating whether the specimen was collected in the field';

COMMENT ON TABLE odm2.Specimens IS 'Equivalent to O&M Sampling Feature Type Specimen.  Describes physical samples or specimens.';


/******************** Add Table: odm2.DataLoggerFiles ************************/

/* Build Table Structure */
CREATE TABLE odm2.DataLoggerFiles
(
	DataLoggerFileID INTEGER NOT NULL,
	ProgramID INTEGER NOT NULL,
	DataLoggerFileName VARCHAR(255) NOT NULL,
	DataLoggerFileDescription VARCHAR(500) NULL,
	DataLoggerFileLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.DataLoggerFiles ADD CONSTRAINT pkDataLoggerFiles
	PRIMARY KEY (DataLoggerFileID);

/* Add Comments */
COMMENT ON COLUMN odm2.DataLoggerFiles.DataLoggerFileID IS 'Unique identifier for the datalogger file';

COMMENT ON COLUMN odm2.DataLoggerFiles.ProgramID IS 'Foreign key identifier of the datalogger program that created the file';

COMMENT ON COLUMN odm2.DataLoggerFiles.DataLoggerFileName IS 'Text name of the datalogger file';

COMMENT ON COLUMN odm2.DataLoggerFiles.DataLoggerFileDescription IS 'Text description of the datalogger file';

COMMENT ON COLUMN odm2.DataLoggerFiles.DataLoggerFileLink IS 'File path to the datalogger file';

COMMENT ON TABLE odm2.DataLoggerFiles IS 'Destibes datalogger files created by a deployment action';


/******************** Add Table: odm2.DataloggerProgramFiles ************************/

/* Build Table Structure */
CREATE TABLE odm2.DataloggerProgramFiles
(
	ProgramID INTEGER NOT NULL,
	AffiliationID INTEGER NOT NULL,
	ProgramName VARCHAR(255) NOT NULL,
	ProgramDescription VARCHAR(500) NULL,
	ProgramVersion VARCHAR(50) NULL,
	ProgramFileLink VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.DataloggerProgramFiles ADD CONSTRAINT pkDataloggerProgramFiles
	PRIMARY KEY (ProgramID);

/* Add Comments */
COMMENT ON COLUMN odm2.DataloggerProgramFiles.ProgramID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.DataloggerProgramFiles.AffiliationID IS 'Foreign key identifier of the person that created the program';

COMMENT ON COLUMN odm2.DataloggerProgramFiles.ProgramName IS 'Text name of the datalogger program file';

COMMENT ON COLUMN odm2.DataloggerProgramFiles.ProgramDescription IS 'Text description of the datalogger program file';

COMMENT ON COLUMN odm2.DataloggerProgramFiles.ProgramVersion IS 'Text description of the version of the datalogger program file';

COMMENT ON COLUMN odm2.DataloggerProgramFiles.ProgramFileLink IS 'URL or file path to the datalogger program file';

COMMENT ON TABLE odm2.DataloggerProgramFiles IS 'Information about datalogger program files';


/******************** Add Table: odm2.DeploymentActions ************************/

/* Build Table Structure */
CREATE TABLE odm2.DeploymentActions
(
	ActionID INTEGER NOT NULL,
	DeploymentTypeCV VARCHAR(255) NOT NULL,
	CurrentlyDeployed BOOL NOT NULL
);

/* Add Primary Key */
ALTER TABLE odm2.DeploymentActions ADD CONSTRAINT pkDeploymentActions
	PRIMARY KEY (ActionID);

/* Add Comments */
COMMENT ON COLUMN odm2.DeploymentActions.ActionID IS 'Foreign key identifer for the Action that is the deployment';

COMMENT ON COLUMN odm2.DeploymentActions.DeploymentTypeCV IS 'CV term that describes the type of the deployment';

COMMENT ON COLUMN odm2.DeploymentActions.CurrentlyDeployed IS 'A boolean indicating whether a piece of equipment is currently deployed';

COMMENT ON TABLE odm2.DeploymentActions IS 'Describes actions that are deployment events';


/******************** Add Table: odm2.DeploymentMeasuredVariables ************************/

/* Build Table Structure */
CREATE TABLE odm2.DeploymentMeasuredVariables
(
	DeploymentMeasuredVariableID INTEGER NOT NULL,
	ActionID INTEGER NOT NULL,
	InstrumentOutputVariableID INTEGER NOT NULL,
	DataloggerFileID INTEGER NOT NULL,
	ColumnLabel VARCHAR(50) NULL,
	ColumnDescription VARCHAR(500) NULL,
	MeasurementEquation VARCHAR(255) NULL,
	ScanInterval FLOAT NULL,
	ScanIntervalUnitsID INTEGER NULL,
	RecordingInterval FLOAT NULL,
	RecordingIntervalUnitsID INTEGER NULL,
	AggregationStatisticCV VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE odm2.DeploymentMeasuredVariables ADD CONSTRAINT pkDeploymentMeasuredVariables
	PRIMARY KEY (DeploymentMeasuredVariableID);

/* Add Comments */
COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.DeploymentMeasuredVariableID IS 'Primary key identifier';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.ActionID IS 'Foreign key identifier of the Deployment Action associated with the DeploymentMeasuredVariable';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.InstrumentOutputVariableID IS 'Foreign key identifier of the InstrumentOutputVariable that is the DeploymentMeasuredVariable';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.DataloggerFileID IS 'Foreign key identifier of the DataloggerFile from in which the DeploymentMeasuredVariable is recorded';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.ColumnLabel IS 'Text label of the column within the DataloggerFile that is the DeploymentMeasuredVariable';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.ColumnDescription IS 'Text description of hte column within the DataloggerFile that is the DeploymentMeasuredVariable';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.MeasurementEquation IS 'Text string that gives the equation (if any) associated with the DeploymentMeasuredVariable';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.ScanInterval IS 'Numeric value of the scan interval';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.ScanIntervalUnitsID IS 'Foreign key identifier of the units of the scan interval';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.RecordingInterval IS 'Numeric value of the recording interval';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.RecordingIntervalUnitsID IS 'Foreign key identifier of the units for the recording interval';

COMMENT ON COLUMN odm2.DeploymentMeasuredVariables.AggregationStatisticCV IS 'Text aggregation statistic of the recorded value - chosen from a CV';

COMMENT ON TABLE odm2.DeploymentMeasuredVariables IS 'Inoformation about the variables measured by a deployment';





/************ Add Foreign Keys ***************/

/* Add Foreign Key: fk_ActionAnnotations_Actions */
ALTER TABLE odm2.ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionAnnotations_Annotations */
ALTER TABLE odm2.ActionAnnotations ADD CONSTRAINT fk_ActionAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Annotations_Citations */
ALTER TABLE odm2.Annotations ADD CONSTRAINT fk_Annotations_Citations
	FOREIGN KEY (CitationID) REFERENCES odm2.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Annotations_People */
ALTER TABLE odm2.Annotations ADD CONSTRAINT fk_Annotations_People
	FOREIGN KEY (AnnotatorID) REFERENCES odm2.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValueAnnotations_Annotations */
ALTER TABLE odm2.CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValueAnnotations_CategoricalResultValues */
ALTER TABLE odm2.CategoricalResultValueAnnotations ADD CONSTRAINT fk_CategoricalResultValueAnnotations_CategoricalResultValues
	FOREIGN KEY (ValueID) REFERENCES odm2.CategoricalResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentAnnotations_Annotations */
ALTER TABLE odm2.EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentAnnotations_Equipment */
ALTER TABLE odm2.EquipmentAnnotations ADD CONSTRAINT fk_EquipmentAnnotations_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES odm2.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResultValueAnnotations_MeasurementResultValues */
ALTER TABLE odm2.MeasurementResultValueAnnotations ADD CONSTRAINT fk_MeasurementResultValueAnnotations_MeasurementResultValues
	FOREIGN KEY (ValueID) REFERENCES odm2.MeasurementResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultValueAnnotations_Annotations */
ALTER TABLE odm2.MeasurementResultValueAnnotations ADD CONSTRAINT fk_ResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Annotations */
ALTER TABLE odm2.MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Methods */
ALTER TABLE odm2.MethodAnnotations ADD CONSTRAINT fk_MethodAnnotations_Methods
	FOREIGN KEY (MethodID) REFERENCES odm2.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValueAnnotations_Annotations */
ALTER TABLE odm2.PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValueAnnotations_PointCoverageResultValues */
ALTER TABLE odm2.PointCoverageResultValueAnnotations ADD CONSTRAINT fk_PointCoverageResultValueAnnotations_PointCoverageResultValues
	FOREIGN KEY (ValueID) REFERENCES odm2.PointCoverageResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValueAnnotations_Annotations */
ALTER TABLE odm2.ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValueAnnotations_ProfileResultValues */
ALTER TABLE odm2.ProfileResultValueAnnotations ADD CONSTRAINT fk_ProfileResultValueAnnotations_ProfileResultValues
	FOREIGN KEY (ValueID) REFERENCES odm2.ProfileResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Annotations */
ALTER TABLE odm2.ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Results */
ALTER TABLE odm2.ResultAnnotations ADD CONSTRAINT fk_ResultAnnotations_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureAnnotations_Annotations */
ALTER TABLE odm2.SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureAnnotations_SamplingFeatures */
ALTER TABLE odm2.SamplingFeatureAnnotations ADD CONSTRAINT fk_SamplingFeatureAnnotations_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES odm2.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValueAnnotations_Annotations */
ALTER TABLE odm2.SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValueAnnotations_SectionResultValues */
ALTER TABLE odm2.SectionResultValueAnnotations ADD CONSTRAINT fk_SectionResultValueAnnotations_SectionResultValues
	FOREIGN KEY (ValueID) REFERENCES odm2.SectionResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValueAnnotations_Annotations */
ALTER TABLE odm2.SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValueAnnotations_SpectraResultValues */
ALTER TABLE odm2.SpectraResultValueAnnotations ADD CONSTRAINT fk_SpectraResultValueAnnotations_SpectraResultValues
	FOREIGN KEY (ValueID) REFERENCES odm2.SpectraResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValueAnnotations_Annotations */
ALTER TABLE odm2.TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues */
ALTER TABLE odm2.TimeSeriesResultValueAnnotations ADD CONSTRAINT fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues
	FOREIGN KEY (ValueID) REFERENCES odm2.TimeSeriesResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValueAnnotations_Annotations */
ALTER TABLE odm2.TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValueAnnotations_TrajectoryResultValues */
ALTER TABLE odm2.TrajectoryResultValueAnnotations ADD CONSTRAINT fk_TrajectoryResultValueAnnotations_TrajectoryResultValues
	FOREIGN KEY (ValueID) REFERENCES odm2.TrajectoryResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValueAnnotations_Annotations */
ALTER TABLE odm2.TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValueAnnotations_TransectResultValues */
ALTER TABLE odm2.TransectResultValueAnnotations ADD CONSTRAINT fk_TransectResultValueAnnotations_TransectResultValues
	FOREIGN KEY (ValueID) REFERENCES odm2.TransectResultValues (ValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Actions */
ALTER TABLE odm2.ActionBy ADD CONSTRAINT fk_ActionPeople_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Affiliations */
ALTER TABLE odm2.ActionBy ADD CONSTRAINT fk_ActionPeople_Affiliations
	FOREIGN KEY (AffiliationID) REFERENCES odm2.Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Actions_Methods */
ALTER TABLE odm2.Actions ADD CONSTRAINT fk_Actions_Methods
	FOREIGN KEY (MethodID) REFERENCES odm2.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Affiliations_Organizations */
ALTER TABLE odm2.Affiliations ADD CONSTRAINT fk_Affiliations_Organizations
	FOREIGN KEY (OrganizationID) REFERENCES odm2.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Affiliations_People */
ALTER TABLE odm2.Affiliations ADD CONSTRAINT fk_Affiliations_People
	FOREIGN KEY (PersonID) REFERENCES odm2.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetsResults_DataSets */
ALTER TABLE odm2.DataSetsResults ADD CONSTRAINT fk_DataSetsResults_DataSets
	FOREIGN KEY (DataSetID) REFERENCES odm2.DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetsResults_Results */
ALTER TABLE odm2.DataSetsResults ADD CONSTRAINT fk_DataSetsResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureActions_Actions */
ALTER TABLE odm2.FeatureActions ADD CONSTRAINT fk_FeatureActions_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureActions_SamplingFeatures */
ALTER TABLE odm2.FeatureActions ADD CONSTRAINT fk_FeatureActions_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES odm2.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Methods_Organizations */
ALTER TABLE odm2.Methods ADD CONSTRAINT fk_Methods_Organizations
	FOREIGN KEY (OrganizationID) REFERENCES odm2.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Organizations_Organizations */
ALTER TABLE odm2.Organizations ADD CONSTRAINT fk_Organizations_Organizations
	FOREIGN KEY (ParentOrganizationID) REFERENCES odm2.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedActions_Actions */
ALTER TABLE odm2.RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedActions_Actions_AreRelated */
ALTER TABLE odm2.RelatedActions ADD CONSTRAINT fk_RelatedActions_Actions_AreRelated
	FOREIGN KEY (RelatedActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_FeatureActions */
ALTER TABLE odm2.Results ADD CONSTRAINT fk_Results_FeatureActions
	FOREIGN KEY (FeatureActionID) REFERENCES odm2.FeatureActions (FeatureActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_ProcessingLevels */
ALTER TABLE odm2.Results ADD CONSTRAINT fk_Results_ProcessingLevels
	FOREIGN KEY (ProcessingLevelID) REFERENCES odm2.ProcessingLevels (ProcessingLevelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_ResultTypeCV */
ALTER TABLE odm2.Results ADD CONSTRAINT fk_Results_ResultTypeCV
	FOREIGN KEY (ResultTypeCV) REFERENCES odm2.ResultTypeCV (ResultTypeCV)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_TaxonomicClassifiers */
ALTER TABLE odm2.Results ADD CONSTRAINT fk_Results_TaxonomicClassifiers
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES odm2.TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Units */
ALTER TABLE odm2.Results ADD CONSTRAINT fk_Results_Units
	FOREIGN KEY (UnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Variables */
ALTER TABLE odm2.Results ADD CONSTRAINT fk_Results_Variables
	FOREIGN KEY (VariableID) REFERENCES odm2.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ParentTaxon_Taxon */
ALTER TABLE odm2.TaxonomicClassifiers ADD CONSTRAINT fk_ParentTaxon_Taxon
	FOREIGN KEY (ParentTaxonomicClassifierID) REFERENCES odm2.TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataQuality_Units */
ALTER TABLE odm2.DataQuality ADD CONSTRAINT fk_DataQuality_Units
	FOREIGN KEY (DataQualityValueUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Citations */
ALTER TABLE odm2.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Citations
	FOREIGN KEY (CitationID) REFERENCES odm2.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_ReferenceMaterials */
ALTER TABLE odm2.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_ReferenceMaterials
	FOREIGN KEY (ReferenceMaterialID) REFERENCES odm2.ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Units */
ALTER TABLE odm2.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Units
	FOREIGN KEY (UnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Variables */
ALTER TABLE odm2.ReferenceMaterialValues ADD CONSTRAINT fk_ReferenceMaterialValues_Variables
	FOREIGN KEY (VariableID) REFERENCES odm2.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterials_Organizations */
ALTER TABLE odm2.ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_Organizations
	FOREIGN KEY (ReferenceMaterialOrganizationID) REFERENCES odm2.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterials_SamplingFeatures */
ALTER TABLE odm2.ReferenceMaterials ADD CONSTRAINT fk_ReferenceMaterials_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES odm2.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultNormalizationValues_ReferenceMaterialValues */
ALTER TABLE odm2.ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_ReferenceMaterialValues
	FOREIGN KEY (NormalizedByReferenceMaterialValueID) REFERENCES odm2.ReferenceMaterialValues (ReferenceMaterialValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultNormalizationValues_Results */
ALTER TABLE odm2.ResultNormalizationValues ADD CONSTRAINT fk_ResultNormalizationValues_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsDataQuality_DataQuality */
ALTER TABLE odm2.ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_DataQuality
	FOREIGN KEY (DataQualityID) REFERENCES odm2.DataQuality (DataQualityID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsDataQuality_Results */
ALTER TABLE odm2.ResultsDataQuality ADD CONSTRAINT fk_ResultsDataQuality_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibratedDeploymentVariables_Actions */
ALTER TABLE odm2.CalibratedDeploymentVariables ADD CONSTRAINT fk_CalibratedDeploymentVariables_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibratedDeploymentVariables_DeploymentMeasuredVariables */
ALTER TABLE odm2.CalibratedDeploymentVariables ADD CONSTRAINT fk_CalibratedDeploymentVariables_DeploymentMeasuredVariables
	FOREIGN KEY (DeploymentMeasuredVariableID) REFERENCES odm2.DeploymentMeasuredVariables (DeploymentMeasuredVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationEquations_Actions */
ALTER TABLE odm2.CalibrationEquations ADD CONSTRAINT fk_CalibrationEquations_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationEquations_InstrumentOutputVariables */
ALTER TABLE odm2.CalibrationEquations ADD CONSTRAINT fk_CalibrationEquations_InstrumentOutputVariables
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES odm2.InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FieldCalibrationStandards_Actions */
ALTER TABLE odm2.CalibrationStandards ADD CONSTRAINT fk_FieldCalibrationStandards_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FieldCalibrationStandards_ReferenceMaterials */
ALTER TABLE odm2.CalibrationStandards ADD CONSTRAINT fk_FieldCalibrationStandards_ReferenceMaterials
	FOREIGN KEY (ReferenceMaterialID) REFERENCES odm2.ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_EquipmentModels */
ALTER TABLE odm2.Equipment ADD CONSTRAINT fk_Equipment_EquipmentModels
	FOREIGN KEY (EquipmentModelID) REFERENCES odm2.EquipmentModels (EquipmentModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_Organizations */
ALTER TABLE odm2.Equipment ADD CONSTRAINT fk_Equipment_Organizations
	FOREIGN KEY (EquipmentVendorID) REFERENCES odm2.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_People */
ALTER TABLE odm2.Equipment ADD CONSTRAINT fk_Equipment_People
	FOREIGN KEY (EquipmentOwnerID) REFERENCES odm2.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentActions_Actions */
ALTER TABLE odm2.EquipmentActions ADD CONSTRAINT fk_EquipmentActions_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentActions_Equipment */
ALTER TABLE odm2.EquipmentActions ADD CONSTRAINT fk_EquipmentActions_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES odm2.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentModels_Organizations */
ALTER TABLE odm2.EquipmentModels ADD CONSTRAINT fk_EquipmentModels_Organizations
	FOREIGN KEY (ModelManufacturerID) REFERENCES odm2.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_EquipmentModels */
ALTER TABLE odm2.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_EquipmentModels
	FOREIGN KEY (ModelID) REFERENCES odm2.EquipmentModels (EquipmentModelID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Methods */
ALTER TABLE odm2.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Methods
	FOREIGN KEY (InstrumentMethodID) REFERENCES odm2.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Units */
ALTER TABLE odm2.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Units
	FOREIGN KEY (InstrumentRawOutputUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Variables */
ALTER TABLE odm2.InstrumentOutputVariables ADD CONSTRAINT fk_InstrumentOutputVariables_Variables
	FOREIGN KEY (VariableID) REFERENCES odm2.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MaintenanceActions_Actions */
ALTER TABLE odm2.MaintenanceActions ADD CONSTRAINT fk_MaintenanceActions_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedEquipment_Equipment */
ALTER TABLE odm2.RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment
	FOREIGN KEY (EquipmentID) REFERENCES odm2.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedEquipment_Equipment_AreRelated */
ALTER TABLE odm2.RelatedEquipment ADD CONSTRAINT fk_RelatedEquipment_Equipment_AreRelated
	FOREIGN KEY (RelatedEquipmentID) REFERENCES odm2.Equipment (EquipmentID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionExtensionPropertyValues_Actions */
ALTER TABLE odm2.ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionExtensionPropertyValues_ExtensionProperties */
ALTER TABLE odm2.ActionExtensionPropertyValues ADD CONSTRAINT fk_ActionExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES odm2.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExtensionPropertyValues_Citations */
ALTER TABLE odm2.CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_Citations
	FOREIGN KEY (CitationID) REFERENCES odm2.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExtensionPropertyValues_ExtensionProperties */
ALTER TABLE odm2.CitationExtensionPropertyValues ADD CONSTRAINT fk_CitationExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES odm2.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExtensionProperties_Units */
ALTER TABLE odm2.ExtensionProperties ADD CONSTRAINT fk_ExtensionProperties_Units
	FOREIGN KEY (PropertyUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_ExtensionProperties */
ALTER TABLE odm2.MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES odm2.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_Methods */
ALTER TABLE odm2.MethodExtensionPropertyValues ADD CONSTRAINT fk_MethodExtensionPropertyValues_Methods
	FOREIGN KEY (MethodID) REFERENCES odm2.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultExtensionPropertyValues_ExtensionProperties */
ALTER TABLE odm2.ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES odm2.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultExtensionPropertyValues_Results */
ALTER TABLE odm2.ResultExtensionPropertyValues ADD CONSTRAINT fk_ResultExtensionPropertyValues_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties */
ALTER TABLE odm2.SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES odm2.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures */
ALTER TABLE odm2.SamplingFeatureExtensionPropertyValues ADD CONSTRAINT fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES odm2.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_ExtensionProperties */
ALTER TABLE odm2.VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_ExtensionProperties
	FOREIGN KEY (PropertyID) REFERENCES odm2.ExtensionProperties (PropertyID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_Variables */
ALTER TABLE odm2.VariableExtensionPropertyValues ADD CONSTRAINT fk_VariableExtensionPropertyValues_Variables
	FOREIGN KEY (VariableID) REFERENCES odm2.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExternalIdentifiers_Citations */
ALTER TABLE odm2.CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_Citations
	FOREIGN KEY (CitationID) REFERENCES odm2.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE odm2.CitationExternalIdentifiers ADD CONSTRAINT fk_CitationExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES odm2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_Organizations */
ALTER TABLE odm2.ExternalIdentifierSystems ADD CONSTRAINT fk_ExternalIdentifierSystems_Organizations
	FOREIGN KEY (IdentifierSystemOrganizationID) REFERENCES odm2.Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE odm2.MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES odm2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExternalIdentifiers_Methods */
ALTER TABLE odm2.MethodExternalIdentifiers ADD CONSTRAINT fk_MethodExternalIdentifiers_Methods
	FOREIGN KEY (MethodID) REFERENCES odm2.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PersonExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE odm2.PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES odm2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PersonExternalIdentifiers_People */
ALTER TABLE odm2.PersonExternalIdentifiers ADD CONSTRAINT fk_PersonExternalIdentifiers_People
	FOREIGN KEY (PersonID) REFERENCES odm2.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RefMaterialExtIdentifiers_ExtIdentifierSystems */
ALTER TABLE odm2.ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_ExtIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES odm2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RefMaterialExtIdentifiers_RefMaterials */
ALTER TABLE odm2.ReferenceMaterialExternalIdentifiers ADD CONSTRAINT fk_RefMaterialExtIdentifiers_RefMaterials
	FOREIGN KEY (ReferenceMaterialID) REFERENCES odm2.ReferenceMaterials (ReferenceMaterialID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE odm2.SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES odm2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExternalIdentifiers_SamplingFeatures */
ALTER TABLE odm2.SamplingFeatureExternalIdentifiers ADD CONSTRAINT fk_SamplingFeatureExternalIdentifiers_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES odm2.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE odm2.SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES odm2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpatialReferenceExternalIdentifiers_SpatialReferences */
ALTER TABLE odm2.SpatialReferenceExternalIdentifiers ADD CONSTRAINT fk_SpatialReferenceExternalIdentifiers_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TaxonomicClassifierExtIDs_ExtIDSystems */
ALTER TABLE odm2.TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_ExtIDSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES odm2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers */
ALTER TABLE odm2.TaxonomicClassifierExternalIdentifiers ADD CONSTRAINT fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES odm2.TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE odm2.VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_ExternalIdentifierSystems
	FOREIGN KEY (ExternalIdentifierSystemID) REFERENCES odm2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExternalIdentifiers_Variables */
ALTER TABLE odm2.VariableExternalIdentifiers ADD CONSTRAINT fk_VariableExternalIdentifiers_Variables
	FOREIGN KEY (VariableID) REFERENCES odm2.Variables (VariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionDirectives_Actions */
ALTER TABLE odm2.ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionDirectives_Directives */
ALTER TABLE odm2.ActionDirectives ADD CONSTRAINT fk_ActionDirectives_Directives
	FOREIGN KEY (DirectiveID) REFERENCES odm2.Directives (DirectiveID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenBatchPostions_FeatureActions */
ALTER TABLE odm2.SpecimenBatchPostions ADD CONSTRAINT fk_SpecimenBatchPostions_FeatureActions
	FOREIGN KEY (FeatureActionID) REFERENCES odm2.FeatureActions (FeatureActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AuthorLists_Citations */
ALTER TABLE odm2.AuthorLists ADD CONSTRAINT fk_AuthorLists_Citations
	FOREIGN KEY (CitationID) REFERENCES odm2.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AuthorLists_People */
ALTER TABLE odm2.AuthorLists ADD CONSTRAINT fk_AuthorLists_People
	FOREIGN KEY (PersonID) REFERENCES odm2.People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetCitations_Citations */
ALTER TABLE odm2.DataSetCitations ADD CONSTRAINT fk_DataSetCitations_Citations
	FOREIGN KEY (CitationID) REFERENCES odm2.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetCitations_DataSets */
ALTER TABLE odm2.DataSetCitations ADD CONSTRAINT fk_DataSetCitations_DataSets
	FOREIGN KEY (DataSetID) REFERENCES odm2.DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodCitations_Citations */
ALTER TABLE odm2.MethodCitations ADD CONSTRAINT fk_MethodCitations_Citations
	FOREIGN KEY (CitationID) REFERENCES odm2.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodCitations_Methods */
ALTER TABLE odm2.MethodCitations ADD CONSTRAINT fk_MethodCitations_Methods
	FOREIGN KEY (MethodID) REFERENCES odm2.Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedAnnotations_Annotations */
ALTER TABLE odm2.RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations
	FOREIGN KEY (AnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedAnnotations_Annotations_AreRelated */
ALTER TABLE odm2.RelatedAnnotations ADD CONSTRAINT fk_RelatedAnnotations_Annotations_AreRelated
	FOREIGN KEY (RelatedAnnotationID) REFERENCES odm2.Annotations (AnnotationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedCitations_Citations */
ALTER TABLE odm2.RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations
	FOREIGN KEY (CitationID) REFERENCES odm2.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedCitations_Citations_AreRelated */
ALTER TABLE odm2.RelatedCitations ADD CONSTRAINT fk_RelatedCitations_Citations_AreRelated
	FOREIGN KEY (RelatedCitationID) REFERENCES odm2.Citations (CitationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedDatasets_DataSets */
ALTER TABLE odm2.RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets
	FOREIGN KEY (DataSetID) REFERENCES odm2.DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedDatasets_DataSets_AreRelated */
ALTER TABLE odm2.RelatedDatasets ADD CONSTRAINT fk_RelatedDatasets_DataSets_AreRelated
	FOREIGN KEY (RelatedDatasetID) REFERENCES odm2.DataSets (DataSetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results */
ALTER TABLE odm2.RelatedResults ADD CONSTRAINT fk_RelatedResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results_AreRelated */
ALTER TABLE odm2.RelatedResults ADD CONSTRAINT fk_RelatedResults_Results_AreRelated
	FOREIGN KEY (RelatedResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultDerivationEquations_DerivationEquations */
ALTER TABLE odm2.ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_DerivationEquations
	FOREIGN KEY (DerivationEquationID) REFERENCES odm2.DerivationEquations (DerivationEquationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultDerivationEquations_Results */
ALTER TABLE odm2.ResultDerivationEquations ADD CONSTRAINT fk_ResultDerivationEquations_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValues_CategoricalResults */
ALTER TABLE odm2.CategoricalResultValues ADD CONSTRAINT fk_CategoricalResultValues_CategoricalResults
	FOREIGN KEY (ResultID) REFERENCES odm2.CategoricalResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResults_Results */
ALTER TABLE odm2.CategoricalResults ADD CONSTRAINT fk_CategoricalResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResults_SpatialReferences */
ALTER TABLE odm2.CategoricalResults ADD CONSTRAINT fk_CategoricalResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResultValues_MeasurementResults */
ALTER TABLE odm2.MeasurementResultValues ADD CONSTRAINT fk_MeasurementResultValues_MeasurementResults
	FOREIGN KEY (ResultID) REFERENCES odm2.MeasurementResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_AIUnits */
ALTER TABLE odm2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_Results */
ALTER TABLE odm2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_SpatialReferences */
ALTER TABLE odm2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_XUnits */
ALTER TABLE odm2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_YUnits */
ALTER TABLE odm2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_ZUnits */
ALTER TABLE odm2.MeasurementResults ADD CONSTRAINT fk_MeasurementResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_PointCoverageResults */
ALTER TABLE odm2.PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_PointCoverageResults
	FOREIGN KEY (ResultID) REFERENCES odm2.PointCoverageResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_XUnits */
ALTER TABLE odm2.PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_YUnits */
ALTER TABLE odm2.PointCoverageResultValues ADD CONSTRAINT fk_PointCoverageResultValues_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_Results */
ALTER TABLE odm2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_SpatialReferences */
ALTER TABLE odm2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_XUnits */
ALTER TABLE odm2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_XUnits
	FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_YUnits */
ALTER TABLE odm2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_YUnits
	FOREIGN KEY (IntendedYSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_ZUnits */
ALTER TABLE odm2.PointCoverageResults ADD CONSTRAINT fk_PointCoverageResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_AIUnits */
ALTER TABLE odm2.ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_DUnits */
ALTER TABLE odm2.ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_DUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_ProfileResults */
ALTER TABLE odm2.ProfileResultValues ADD CONSTRAINT fk_ProfileResultValues_ProfileResults
	FOREIGN KEY (ResultID) REFERENCES odm2.ProfileResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_DUnits */
ALTER TABLE odm2.ProfileResults ADD CONSTRAINT fk_ProfileResults_DUnits
	FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_Results */
ALTER TABLE odm2.ProfileResults ADD CONSTRAINT fk_ProfileResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_SpatialReferences */
ALTER TABLE odm2.ProfileResults ADD CONSTRAINT fk_ProfileResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_TUnits */
ALTER TABLE odm2.ProfileResults ADD CONSTRAINT fk_ProfileResults_TUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_XUnits */
ALTER TABLE odm2.ProfileResults ADD CONSTRAINT fk_ProfileResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_YUnits */
ALTER TABLE odm2.ProfileResults ADD CONSTRAINT fk_ProfileResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_AIUnits */
ALTER TABLE odm2.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_SectionResults */
ALTER TABLE odm2.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_SectionResults
	FOREIGN KEY (ResultID) REFERENCES odm2.SectionResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_XUnits */
ALTER TABLE odm2.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_ZUnits */
ALTER TABLE odm2.SectionResultValues ADD CONSTRAINT fk_SectionResultValues_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_Results */
ALTER TABLE odm2.SectionResults ADD CONSTRAINT fk_SectionResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_SpatialReferences */
ALTER TABLE odm2.SectionResults ADD CONSTRAINT fk_SectionResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_TMUnits */
ALTER TABLE odm2.SectionResults ADD CONSTRAINT fk_SectionResults_TMUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_Units */
ALTER TABLE odm2.SectionResults ADD CONSTRAINT fk_SectionResults_Units
	FOREIGN KEY (YLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_XUnits */
ALTER TABLE odm2.SectionResults ADD CONSTRAINT fk_SectionResults_XUnits
	FOREIGN KEY (IntendedXSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_ZUnits */
ALTER TABLE odm2.SectionResults ADD CONSTRAINT fk_SectionResults_ZUnits
	FOREIGN KEY (IntendedZSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_AIUnits */
ALTER TABLE odm2.SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_SpectraResults */
ALTER TABLE odm2.SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_SpectraResults
	FOREIGN KEY (ResultID) REFERENCES odm2.SpectraResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_WUnits */
ALTER TABLE odm2.SpectraResultValues ADD CONSTRAINT fk_SpectraResultValues_WUnits
	FOREIGN KEY (WavelengthUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_Results */
ALTER TABLE odm2.SpectraResults ADD CONSTRAINT fk_SpectraResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_SpatialReferences */
ALTER TABLE odm2.SpectraResults ADD CONSTRAINT fk_SpectraResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_Units */
ALTER TABLE odm2.SpectraResults ADD CONSTRAINT fk_SpectraResults_Units
	FOREIGN KEY (IntendedWavelengthSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_XUnits */
ALTER TABLE odm2.SpectraResults ADD CONSTRAINT fk_SpectraResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_YUnits */
ALTER TABLE odm2.SpectraResults ADD CONSTRAINT fk_SpectraResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_ZUnits */
ALTER TABLE odm2.SpectraResults ADD CONSTRAINT fk_SpectraResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValues_TimeSeriesResults */
ALTER TABLE odm2.TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_TimeSeriesResults
	FOREIGN KEY (ResultID) REFERENCES odm2.TimeSeriesResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValues_Units */
ALTER TABLE odm2.TimeSeriesResultValues ADD CONSTRAINT fk_TimeSeriesResultValues_Units
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_Results */
ALTER TABLE odm2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_SpatialReferences */
ALTER TABLE odm2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_TUnits */
ALTER TABLE odm2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_TUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_XUnits */
ALTER TABLE odm2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_YUnits */
ALTER TABLE odm2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_ZUnits */
ALTER TABLE odm2.TimeSeriesResults ADD CONSTRAINT fk_TimeSeriesResults_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_AIUnits */
ALTER TABLE odm2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_AIUnits
	FOREIGN KEY (TimeAggregationIntervalUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_TrajectoryResults */
ALTER TABLE odm2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_TrajectoryResults
	FOREIGN KEY (ResultID) REFERENCES odm2.TrajectoryResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_XUnits */
ALTER TABLE odm2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_XUnits
	FOREIGN KEY (XLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_YUnits */
ALTER TABLE odm2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_YUnits
	FOREIGN KEY (YLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_ZUnits */
ALTER TABLE odm2.TrajectoryResultValues ADD CONSTRAINT fk_TrajectoryResultValues_ZUnits
	FOREIGN KEY (ZLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_Results */
ALTER TABLE odm2.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_SpatialReferences */
ALTER TABLE odm2.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_TSUnits */
ALTER TABLE odm2.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TSUnits
	FOREIGN KEY (IntendedTrajectorySpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_TUnits */
ALTER TABLE odm2.TrajectoryResults ADD CONSTRAINT fk_TrajectoryResults_TUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValues_TransectResults */
ALTER TABLE odm2.TransectResultValues ADD CONSTRAINT fk_TransectResultValues_TransectResults
	FOREIGN KEY (ResultID) REFERENCES odm2.TransectResults (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_Results */
ALTER TABLE odm2.TransectResults ADD CONSTRAINT fk_TransectResults_Results
	FOREIGN KEY (ResultID) REFERENCES odm2.Results (ResultID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_SpatialReferences */
ALTER TABLE odm2.TransectResults ADD CONSTRAINT fk_TransectResults_SpatialReferences
	FOREIGN KEY (SpatialReferenceID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_TMUnits */
ALTER TABLE odm2.TransectResults ADD CONSTRAINT fk_TransectResults_TMUnits
	FOREIGN KEY (IntendedTimeSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_TSUnits */
ALTER TABLE odm2.TransectResults ADD CONSTRAINT fk_TransectResults_TSUnits
	FOREIGN KEY (IntendedTransectSpacingUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_Units */
ALTER TABLE odm2.TransectResults ADD CONSTRAINT fk_TransectResults_Units
	FOREIGN KEY (ZLocationUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_FeaturesParent */
ALTER TABLE odm2.RelatedFeatures ADD CONSTRAINT fk_FeatureParents_FeaturesParent
	FOREIGN KEY (RelatedFeatureID) REFERENCES odm2.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_SamplingFeatures */
ALTER TABLE odm2.RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES odm2.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_SpatialOffsets */
ALTER TABLE odm2.RelatedFeatures ADD CONSTRAINT fk_FeatureParents_SpatialOffsets
	FOREIGN KEY (SpatialOffsetID) REFERENCES odm2.SpatialOffsets (SpatialOffsetID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Sites_SamplingFeatures */
ALTER TABLE odm2.Sites ADD CONSTRAINT fk_Sites_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES odm2.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Sites_SpatialReferences */
ALTER TABLE odm2.Sites ADD CONSTRAINT fk_Sites_SpatialReferences
	FOREIGN KEY (LatLonDatumID) REFERENCES odm2.SpatialReferences (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenTaxonomicClassifiers_Specimens */
ALTER TABLE odm2.SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_Specimens
	FOREIGN KEY (SamplingFeatureID) REFERENCES odm2.Specimens (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers */
ALTER TABLE odm2.SpecimenTaxonomicClassifiers ADD CONSTRAINT fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers
	FOREIGN KEY (TaxonomicClassifierID) REFERENCES odm2.TaxonomicClassifiers (TaxonomicClassifierID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Specimens_SamplingFeatures */
ALTER TABLE odm2.Specimens ADD CONSTRAINT fk_Specimens_SamplingFeatures
	FOREIGN KEY (SamplingFeatureID) REFERENCES odm2.SamplingFeatures (SamplingFeatureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataLoggerFiles_DataloggerProgramFiles */
ALTER TABLE odm2.DataLoggerFiles ADD CONSTRAINT fk_DataLoggerFiles_DataloggerProgramFiles
	FOREIGN KEY (ProgramID) REFERENCES odm2.DataloggerProgramFiles (ProgramID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerProgramFiles_Affiliations */
ALTER TABLE odm2.DataloggerProgramFiles ADD CONSTRAINT fk_DataloggerProgramFiles_Affiliations
	FOREIGN KEY (AffiliationID) REFERENCES odm2.Affiliations (AffiliationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentActions_Actions */
ALTER TABLE odm2.DeploymentActions ADD CONSTRAINT fk_DeploymentActions_Actions
	FOREIGN KEY (ActionID) REFERENCES odm2.Actions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_DataLoggerFiles */
ALTER TABLE odm2.DeploymentMeasuredVariables ADD CONSTRAINT fk_DeploymentMeasuredVariables_DataLoggerFiles
	FOREIGN KEY (DataloggerFileID) REFERENCES odm2.DataLoggerFiles (DataLoggerFileID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_DeploymentActions */
ALTER TABLE odm2.DeploymentMeasuredVariables ADD CONSTRAINT fk_DeploymentMeasuredVariables_DeploymentActions
	FOREIGN KEY (ActionID) REFERENCES odm2.DeploymentActions (ActionID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_InstrumentOutputVariables */
ALTER TABLE odm2.DeploymentMeasuredVariables ADD CONSTRAINT fk_DeploymentMeasuredVariables_InstrumentOutputVariables
	FOREIGN KEY (InstrumentOutputVariableID) REFERENCES odm2.InstrumentOutputVariables (InstrumentOutputVariableID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_RI_Units */
ALTER TABLE odm2.DeploymentMeasuredVariables ADD CONSTRAINT fk_DeploymentMeasuredVariables_RI_Units
	FOREIGN KEY (RecordingIntervalUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_SI_Units */
ALTER TABLE odm2.DeploymentMeasuredVariables ADD CONSTRAINT fk_DeploymentMeasuredVariables_SI_Units
	FOREIGN KEY (ScanIntervalUnitsID) REFERENCES odm2.Units (UnitsID)
	ON UPDATE NO ACTION ON DELETE NO ACTION;
/* ================================================================
   ================================================================ */

/* ** Set up samplingfeatures.featuregeometry as a heterogeneous, 2D PostGIS geom field. */
ALTER TABLE odm2.samplingfeatures ALTER COLUMN featuregeometry TYPE geometry;
ALTER TABLE odm2.samplingfeatures ADD CONSTRAINT 
  enforce_dims_featuregeometry CHECK (st_ndims(featuregeometry) = 2);
CREATE INDEX idx_samplingfeature_featuregeom ON odm2.samplingfeatures USING gist (featuregeometry);
-- Populate and tweak geometry_columns
SELECT Populate_Geometry_Columns();
-- But it assigned a POINT type to  odm2.samplingfeatures. Need instead to use the generic
-- 'geometries', to accept any type (point, line, polygon, and collections thereof [multi-polygon, etc])
UPDATE public.geometry_columns SET type = 'GEOMETRY' WHERE f_table_schema = 'odm2' AND f_table_name = 'samplingfeatures';
