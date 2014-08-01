/************ Update: Schemas ***************/

/* Add Schema: ODM2Annotations */
CREATE SCHEMA "ODM2Annotations";
COMMENT ON SCHEMA "ODM2Annotations" IS 'Annotations are used to add comments or qualifiers to entity instances in ODM2.';

/* Add Schema: ODM2CV */
CREATE SCHEMA "ODM2CV";
COMMENT ON SCHEMA "ODM2CV" IS 'Controlled vocabularies for ODM2.';

ALTER SCHEMA "schemaA" RENAME TO "ODM2Core";


COMMENT ON SCHEMA "ODM2Core" IS 'The core of ODM2.  Every ODM2 instance will implement the Core.';


/* Add Schema: ODM2DataQuality */
CREATE SCHEMA "ODM2DataQuality";

/* Add Schema: ODM2Equipment */
CREATE SCHEMA "ODM2Equipment";
COMMENT ON SCHEMA "ODM2Equipment" IS 'Entities and attributes of equipment used to make observations (e.g., sensors and instruments).';

/* Add Schema: ODM2ExtensionProperties */
CREATE SCHEMA "ODM2ExtensionProperties";
COMMENT ON SCHEMA "ODM2ExtensionProperties" IS 'A general extensibility mechanism for any entity/object/table in ODM2.';

/* Add Schema: ODM2ExternalIdentifiers */
CREATE SCHEMA "ODM2ExternalIdentifiers";

/* Add Schema: ODM2LabAnalyses */
CREATE SCHEMA "ODM2LabAnalyses";
COMMENT ON SCHEMA "ODM2LabAnalyses" IS 'Information about samples and laboratory analyses for ex-situ data.';

/* Add Schema: ODM2Provenance */
CREATE SCHEMA "ODM2Provenance";
COMMENT ON SCHEMA "ODM2Provenance" IS 'Entities and attributes for creating and storing provenance information and versions of observations in ODM2.';

/* Add Schema: ODM2Results */
CREATE SCHEMA "ODM2Results";
COMMENT ON SCHEMA "ODM2Results" IS 'The resulting values of observations in ODM2.';

/* Add Schema: ODM2SamplingFeatures */
CREATE SCHEMA "ODM2SamplingFeatures";
COMMENT ON SCHEMA "ODM2SamplingFeatures" IS 'Information about sampling features, including sites and specimens.';

/* Add Schema: ODM2Sensors */
CREATE SCHEMA "ODM2Sensors";
COMMENT ON SCHEMA "ODM2Sensors" IS 'Information about sensor deployment and management for in situ data.';



/************ Update: Tables ***************/

/******************** Add Table: "ODM2Annotations"."ActionAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."ActionAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."ActionAnnotations" ADD CONSTRAINT "pkActionAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Annotations"."ActionAnnotations"."ActionID" IS 'Foreign key of the Action being annotated.';

COMMENT ON COLUMN "ODM2Annotations"."ActionAnnotations"."AnnotationID" IS 'Foreign key of the annotation being added to the Action.';

COMMENT ON TABLE "ODM2Annotations"."ActionAnnotations" IS 'Notes for or groups of one or more Actions.';


/******************** Add Table: "ODM2Annotations"."Annotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."Annotations"
(
	"AnnotationID" INTEGER NOT NULL,
	"AnnotationTypeCV" VARCHAR(255) NOT NULL,
	"AnnotationCode" VARCHAR(50) NULL,
	"AnnotationText" VARCHAR(500) NOT NULL,
	"AnnotationDateTime" TIMESTAMP NULL,
	"AnnotationUTCOffset" INTEGER NULL,
	"AnnotationLink" VARCHAR(255) NULL,
	"AnnotatorID" INTEGER NULL,
	"CitationID" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."Annotations" ADD CONSTRAINT "pkAnnotations"
	PRIMARY KEY ("AnnotationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Annotations"."Annotations"."AnnotationID" IS 'Primary key for Annotations.';

COMMENT ON COLUMN "ODM2Annotations"."Annotations"."AnnotationTypeCV" IS 'CV for types of annotations.';

COMMENT ON COLUMN "ODM2Annotations"."Annotations"."AnnotationCode" IS 'A short text code that identifies the annotation (e.g., "A'' for "Approved data").';

COMMENT ON COLUMN "ODM2Annotations"."Annotations"."AnnotationText" IS 'Full text of the annotation.';

COMMENT ON COLUMN "ODM2Annotations"."Annotations"."AnnotationDateTime" IS 'Date and time at which the annotation was created.';

COMMENT ON COLUMN "ODM2Annotations"."Annotations"."AnnotationUTCOffset" IS 'UTCOffset for the annotation creation date/time.';

COMMENT ON COLUMN "ODM2Annotations"."Annotations"."AnnotatorID" IS 'Foregn key identifier for the person that created the annotation';

COMMENT ON TABLE "ODM2Annotations"."Annotations" IS 'Contains text annotations added to one or more records within various ODM2 tables.  Annotations can be used to record notes about a particular SamplingFeature, Action, Result, etc. or to create groups of records such as Specimens, Sites, People, etc.';


/******************** Add Table: "ODM2Annotations"."CategoricalResultValueAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."CategoricalResultValueAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ValueID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."CategoricalResultValueAnnotations" ADD CONSTRAINT "pkCategoricalResultValueAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON TABLE "ODM2Annotations"."CategoricalResultValueAnnotations" IS 'Annotations for Categorical ResultValues';


/******************** Add Table: "ODM2Annotations"."EquipmentAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."EquipmentAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"EquipmentID" INTEGER NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."EquipmentAnnotations" ADD CONSTRAINT "pkEquipmentAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON TABLE "ODM2Annotations"."EquipmentAnnotations" IS 'Bridge table linking Annotations to Equipment';


/******************** Add Table: "ODM2Annotations"."MeasurementResultValueAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."MeasurementResultValueAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ValueID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."MeasurementResultValueAnnotations" ADD CONSTRAINT "pkMeasurementResultValueAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Annotations"."MeasurementResultValueAnnotations"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Annotations"."MeasurementResultValueAnnotations"."ValueID" IS 'Foreign key of the result value being annotated';

COMMENT ON COLUMN "ODM2Annotations"."MeasurementResultValueAnnotations"."AnnotationID" IS 'Foreign key of the annotation applied to the result value';

COMMENT ON TABLE "ODM2Annotations"."MeasurementResultValueAnnotations" IS 'Annotations for Measurement ResultValues';


/******************** Add Table: "ODM2Annotations"."MethodAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."MethodAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"MethodID" INTEGER NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."MethodAnnotations" ADD CONSTRAINT "pkMethodAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Annotations"."MethodAnnotations"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Annotations"."MethodAnnotations"."MethodID" IS 'Foreign key of the method being annotated';

COMMENT ON COLUMN "ODM2Annotations"."MethodAnnotations"."AnnotationID" IS 'Foreign key of the annotation added to the method';

COMMENT ON TABLE "ODM2Annotations"."MethodAnnotations" IS 'Notes for or groups of one or more Methods.';


/******************** Add Table: "ODM2Annotations"."PointCoverageResultValueAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."PointCoverageResultValueAnnotations"
(
	"BridgeID" BIGINT NOT NULL,
	"ValueID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."PointCoverageResultValueAnnotations" ADD CONSTRAINT "pkPointCoverageResultValueAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON TABLE "ODM2Annotations"."PointCoverageResultValueAnnotations" IS 'Annotations for Point Coverage ResultValues';


/******************** Add Table: "ODM2Annotations"."ProfileResultValueAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."ProfileResultValueAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ValueID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."ProfileResultValueAnnotations" ADD CONSTRAINT "pkProfileResultValueAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON TABLE "ODM2Annotations"."ProfileResultValueAnnotations" IS 'Annotations for Profile ResultValues';


/******************** Add Table: "ODM2Annotations"."ResultAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."ResultAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL,
	"BeginDateTime" TIMESTAMP NOT NULL,
	"EndDateTime" TIMESTAMP NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."ResultAnnotations" ADD CONSTRAINT "pkResultAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Annotations"."ResultAnnotations"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Annotations"."ResultAnnotations"."ResultID" IS 'Foreign key of the result being annotated';

COMMENT ON COLUMN "ODM2Annotations"."ResultAnnotations"."AnnotationID" IS 'Foreign key of the annotation added to the result';

COMMENT ON COLUMN "ODM2Annotations"."ResultAnnotations"."BeginDateTime" IS 'Beginning date/time of the annotation';

COMMENT ON COLUMN "ODM2Annotations"."ResultAnnotations"."EndDateTime" IS 'Ending date/time of the annotation';

COMMENT ON TABLE "ODM2Annotations"."ResultAnnotations" IS 'Notes for or groups of one or more Results [sets].';


/******************** Add Table: "ODM2Annotations"."SamplingFeatureAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."SamplingFeatureAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"SamplingFeatureID" INTEGER NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."SamplingFeatureAnnotations" ADD CONSTRAINT "pkSamplingFeatureAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Annotations"."SamplingFeatureAnnotations"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Annotations"."SamplingFeatureAnnotations"."SamplingFeatureID" IS 'Foreign key of the SamplingFeature being annotated.';

COMMENT ON COLUMN "ODM2Annotations"."SamplingFeatureAnnotations"."AnnotationID" IS 'Foreign key of the Annotation applied to the SamplingFeature.';

COMMENT ON TABLE "ODM2Annotations"."SamplingFeatureAnnotations" IS 'Notes for or groups of one or more Sampling Features.';


/******************** Add Table: "ODM2Annotations"."SectionResultValueAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."SectionResultValueAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ValueID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."SectionResultValueAnnotations" ADD CONSTRAINT "pkSectionResultValueAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON TABLE "ODM2Annotations"."SectionResultValueAnnotations" IS 'Annotations for Section ResultValues';


/******************** Add Table: "ODM2Annotations"."SpectraResultValueAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."SpectraResultValueAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ValueID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."SpectraResultValueAnnotations" ADD CONSTRAINT "pkSpectraResultValueAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON TABLE "ODM2Annotations"."SpectraResultValueAnnotations" IS 'Annotations for Spectra ResultValues';


/******************** Add Table: "ODM2Annotations"."TimeSeriesResultValueAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."TimeSeriesResultValueAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ValueID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."TimeSeriesResultValueAnnotations" ADD CONSTRAINT "pkTimeSeriesResultValueAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON TABLE "ODM2Annotations"."TimeSeriesResultValueAnnotations" IS 'Annotations for Time Series ResultValues';


/******************** Add Table: "ODM2Annotations"."TrajectoryResultValueAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."TrajectoryResultValueAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ValueID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."TrajectoryResultValueAnnotations" ADD CONSTRAINT "pkTrajectoryResultValueAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON TABLE "ODM2Annotations"."TrajectoryResultValueAnnotations" IS 'Annotations for Trajectory ResultValues';


/******************** Add Table: "ODM2Annotations"."TransectResultValueAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Annotations"."TransectResultValueAnnotations"
(
	"BridgeID" INTEGER NOT NULL,
	"ValueID" BIGINT NOT NULL,
	"AnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Annotations"."TransectResultValueAnnotations" ADD CONSTRAINT "pkTransectResultValueAnnotations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON TABLE "ODM2Annotations"."TransectResultValueAnnotations" IS 'Annotations for Transect ResultValues';


/******************** Add Table: "ODM2CV"."CVTerms" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2CV"."CVTerms"
(
	"TermID" INTEGER NOT NULL,
	"Term" VARCHAR(255) NOT NULL,
	"Definition" VARCHAR(500) NULL,
	"ODMVocabulary" VARCHAR(255) NOT NULL,
	"SourceVocabulary" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2CV"."CVTerms" ADD CONSTRAINT "pkCVTerms"
	PRIMARY KEY ("TermID");

/* Add Comments */
COMMENT ON COLUMN "ODM2CV"."CVTerms"."TermID" IS 'Primary key';

COMMENT ON COLUMN "ODM2CV"."CVTerms"."Term" IS 'Controlled vocabulary term';

COMMENT ON COLUMN "ODM2CV"."CVTerms"."Definition" IS 'Definition of term';

COMMENT ON COLUMN "ODM2CV"."CVTerms"."ODMVocabulary" IS 'Name of the ODM controlled vocabulary to which the term belongs';

COMMENT ON COLUMN "ODM2CV"."CVTerms"."SourceVocabulary" IS 'Name and/or description of the source vocabulary from which the term was derived';

COMMENT ON TABLE "ODM2CV"."CVTerms" IS 'Table containing terms used in the controlled vocabularies of ODM2.';


/******************** Add Table: "ODM2Core"."ActionBy" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."ActionBy"
(
	"BridgeID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL,
	"AffiliationID" INTEGER NOT NULL,
	"IsActionLead" BOOL NOT NULL,
	"RoleDescription" VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."ActionBy" ADD CONSTRAINT "pkActionBy"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."ActionBy"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Core"."ActionBy"."ActionID" IS 'Foreign key identifier of an action.';

COMMENT ON COLUMN "ODM2Core"."ActionBy"."AffiliationID" IS 'Foreign key identifier of a person';

COMMENT ON COLUMN "ODM2Core"."ActionBy"."IsActionLead" IS 'Indicator of whether the affiliated person was the lead for the action';

COMMENT ON COLUMN "ODM2Core"."ActionBy"."RoleDescription" IS 'Foreign key identifier for a role played by a person in performing an action';

COMMENT ON TABLE "ODM2Core"."ActionBy" IS 'Affiliates people with actions and describes thier role in the action.';


/******************** Add Table: "ODM2Core"."Actions" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."Actions"
(
	"ActionID" INTEGER NOT NULL,
	"ActionTypeCV" VARCHAR(255) NOT NULL,
	"MethodID" INTEGER NOT NULL,
	"BeginDateTime" TIMESTAMP NOT NULL,
	"BeginDateTimeUTCOffset" INTEGER NOT NULL,
	"EndDateTime" TIMESTAMP NULL,
	"EndDateTimeUTCOffset" INTEGER NULL,
	"ActionDescription" VARCHAR(500) NULL,
	"ActionFileLink" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."Actions" ADD CONSTRAINT "pkActions"
	PRIMARY KEY ("ActionID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."Actions"."ActionID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2Core"."Actions"."ActionTypeCV" IS 'CV term describing the type of action (e.g., observation, sample collection, sample analysis)';

COMMENT ON COLUMN "ODM2Core"."Actions"."MethodID" IS 'Foreign key identifier for the method used to complete the action';

COMMENT ON COLUMN "ODM2Core"."Actions"."BeginDateTime" IS 'The date/time at which the action began';

COMMENT ON COLUMN "ODM2Core"."Actions"."BeginDateTimeUTCOffset" IS 'The UTCOffset for the BeginDateTime';

COMMENT ON COLUMN "ODM2Core"."Actions"."EndDateTime" IS 'The date/time at which the action ended';

COMMENT ON COLUMN "ODM2Core"."Actions"."EndDateTimeUTCOffset" IS 'The UTCOffset of for the EndDateTime';

COMMENT ON COLUMN "ODM2Core"."Actions"."ActionDescription" IS 'Text that describes the action';

COMMENT ON COLUMN "ODM2Core"."Actions"."ActionFileLink" IS 'A URL or path to a file created by or used by the Action, such as instrument output or configuration.';

COMMENT ON TABLE "ODM2Core"."Actions" IS 'Describes actions (e.g., observation, sample collection, sample analysis, field visits, field activities, etc.)';


/******************** Add Table: "ODM2Core"."Affiliations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."Affiliations"
(
	"AffiliationID" INTEGER NOT NULL,
	"PersonID" INTEGER NOT NULL,
	"OrganizationID" INTEGER NULL,
	"IsPrimaryOrganizationContact" BOOL NULL,
	"AffiliationStartDate" DATE NOT NULL,
	"AffiliationEndDate" DATE NULL,
	"PrimaryPhone" VARCHAR(50) NULL,
	"PrimaryEmail" VARCHAR(255) NOT NULL,
	"PrimaryAddress" VARCHAR(255) NULL,
	"PersonLink" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."Affiliations" ADD CONSTRAINT "pkAffiliations"
	PRIMARY KEY ("AffiliationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."Affiliations"."AffiliationID" IS 'Primay key';

COMMENT ON COLUMN "ODM2Core"."Affiliations"."PersonID" IS 'Foreign key identifer for a person';

COMMENT ON COLUMN "ODM2Core"."Affiliations"."OrganizationID" IS 'Foreigh key identifier for an organization';

COMMENT ON COLUMN "ODM2Core"."Affiliations"."IsPrimaryOrganizationContact" IS 'Boolean indication of whether the person is the organizations primary contact person';

COMMENT ON COLUMN "ODM2Core"."Affiliations"."AffiliationStartDate" IS 'The date on which the person became affiliated with the organization';

COMMENT ON COLUMN "ODM2Core"."Affiliations"."AffiliationEndDate" IS 'The date on which the person''s affiliation with the organization ended';

COMMENT ON COLUMN "ODM2Core"."Affiliations"."PrimaryPhone" IS 'The primary phone number of the person';

COMMENT ON COLUMN "ODM2Core"."Affiliations"."PrimaryEmail" IS 'The primary email address of the person';

COMMENT ON COLUMN "ODM2Core"."Affiliations"."PrimaryAddress" IS 'The primary mailing address of the person, including street, city, state, zip, and country';

COMMENT ON COLUMN "ODM2Core"."Affiliations"."PersonLink" IS 'A URL for the website for a person';

COMMENT ON TABLE "ODM2Core"."Affiliations" IS 'Describes affiliations of people with organizations.';


/******************** Add Table: "ODM2Core"."DataSets" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."DataSets"
(
	"DataSetID" INTEGER NOT NULL,
	"DataSetUUID" OID NOT NULL,
	"DataSetTypeCV" VARCHAR(255) NOT NULL,
	"DataSetCode" VARCHAR(50) NOT NULL,
	"DataSetTitle" VARCHAR(255) NOT NULL,
	"DataSetAbstract" VARCHAR(500) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."DataSets" ADD CONSTRAINT "pkDataSets"
	PRIMARY KEY ("DataSetID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."DataSets"."DataSetID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2Core"."DataSets"."DataSetTypeCV" IS 'CV term(s) describing the Topic Category';

COMMENT ON COLUMN "ODM2Core"."DataSets"."DataSetCode" IS 'A short text code identifying the dataset';

COMMENT ON COLUMN "ODM2Core"."DataSets"."DataSetTitle" IS 'A text title for the dataset';

COMMENT ON COLUMN "ODM2Core"."DataSets"."DataSetAbstract" IS 'A text abstract describing the dataset';

COMMENT ON TABLE "ODM2Core"."DataSets" IS 'Describes groupings of observation results that can be considered "datasets"';


/******************** Add Table: "ODM2Core"."DataSetsResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."DataSetsResults"
(
	"BridgeID" INTEGER NOT NULL,
	"DataSetID" INTEGER NOT NULL,
	"ResultID" BIGINT NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."DataSetsResults" ADD CONSTRAINT "pkDataSetsResults"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."DataSetsResults"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Core"."DataSetsResults"."DataSetID" IS 'Foreign key identifier of the DataSet';

COMMENT ON COLUMN "ODM2Core"."DataSetsResults"."ResultID" IS 'Foreign key identifier of the Result';

COMMENT ON TABLE "ODM2Core"."DataSetsResults" IS 'Lists the Results that are grouped into a DataSet';


/******************** Add Table: "ODM2Core"."FeatureActions" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."FeatureActions"
(
	"FeatureActionID" INTEGER NOT NULL,
	"SamplingFeatureID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."FeatureActions" ADD CONSTRAINT "pkFeatureActions"
	PRIMARY KEY ("FeatureActionID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."FeatureActions"."FeatureActionID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Core"."FeatureActions"."SamplingFeatureID" IS 'Foreign key identifier for the SamplingFeature on which or at which the Action was performed';

COMMENT ON COLUMN "ODM2Core"."FeatureActions"."ActionID" IS 'Foreign key identifier of the Action that was performed';


/******************** Add Table: "ODM2Core"."Methods" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."Methods"
(
	"MethodID" INTEGER NOT NULL,
	"MethodTypeCV" VARCHAR(255) NOT NULL,
	"MethodCode" VARCHAR(50) NOT NULL,
	"MethodName" VARCHAR(255) NOT NULL,
	"MethodDescription" VARCHAR(500) NULL,
	"MethodLink" VARCHAR(255) NULL,
	"OrganizationID" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."Methods" ADD CONSTRAINT "pkMethods"
	PRIMARY KEY ("MethodID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."Methods"."MethodID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2Core"."Methods"."MethodTypeCV" IS 'CV term describing the type of method (e.g., sample collection, laboratory analytical, field, sample prepratation, etc.)';

COMMENT ON COLUMN "ODM2Core"."Methods"."MethodCode" IS 'A text code identifiying the method (e.g., EPA 650.2)';

COMMENT ON COLUMN "ODM2Core"."Methods"."MethodName" IS 'Full text name of the method';

COMMENT ON COLUMN "ODM2Core"."Methods"."MethodDescription" IS 'Full text description of the method';

COMMENT ON COLUMN "ODM2Core"."Methods"."MethodLink" IS 'A URL to a full description of the method';

COMMENT ON COLUMN "ODM2Core"."Methods"."OrganizationID" IS 'Foreign key identifier for the Organization with which the method is affiliated';

COMMENT ON TABLE "ODM2Core"."Methods" IS 'Describes methods used to perform actions recorded in ODM (e.g., observation methods, sample analysis methods, sample preparation methods, etc.)';


/******************** Add Table: "ODM2Core"."Organizations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."Organizations"
(
	"OrganizationID" INTEGER NOT NULL,
	"OrganizationTypeCV" VARCHAR(255) NOT NULL,
	"OrganizationCode" VARCHAR(50) NOT NULL,
	"OrganizationName" VARCHAR(255) NOT NULL,
	"OrganizationDescription" VARCHAR(500) NULL,
	"OrganizationLink" VARCHAR(255) NULL,
	"ParentOrganizationID" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."Organizations" ADD CONSTRAINT "pkOrganizations"
	PRIMARY KEY ("OrganizationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."Organizations"."OrganizationID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2Core"."Organizations"."OrganizationTypeCV" IS 'CV term defining the type of organization (e.g., government agency, university, etc.)';

COMMENT ON COLUMN "ODM2Core"."Organizations"."OrganizationCode" IS 'A text code identifying the Organization (e.g., USGS)';

COMMENT ON COLUMN "ODM2Core"."Organizations"."OrganizationName" IS 'The full text name of the organization';

COMMENT ON COLUMN "ODM2Core"."Organizations"."OrganizationDescription" IS 'A text description of the organization';

COMMENT ON COLUMN "ODM2Core"."Organizations"."OrganizationLink" IS 'A URL for the organization''s website';

COMMENT ON COLUMN "ODM2Core"."Organizations"."ParentOrganizationID" IS 'Foreign key of the parent organization of the current organization';

COMMENT ON TABLE "ODM2Core"."Organizations" IS 'Describes organizations - as in research groups, companies, universities, etc.';


/******************** Add Table: "ODM2Core"."People" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."People"
(
	"PersonID" INTEGER NOT NULL,
	"PersonFirstName" VARCHAR(255) NOT NULL,
	"PersonMiddleName" VARCHAR(255) NULL,
	"PersonLastName" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."People" ADD CONSTRAINT "pkPeople"
	PRIMARY KEY ("PersonID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."People"."PersonID" IS 'Primary Key';

COMMENT ON COLUMN "ODM2Core"."People"."PersonFirstName" IS 'First name of the person';

COMMENT ON COLUMN "ODM2Core"."People"."PersonMiddleName" IS 'Middle name of the person';

COMMENT ON COLUMN "ODM2Core"."People"."PersonLastName" IS 'Last name of the person';

COMMENT ON TABLE "ODM2Core"."People" IS 'Describes people.';


/******************** Add Table: "ODM2Core"."ProcessingLevels" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."ProcessingLevels"
(
	"ProcessingLevelID" INTEGER NOT NULL,
	"ProcessingLevelCode" VARCHAR(50) NOT NULL,
	"Definition" VARCHAR(500) NULL,
	"Explanation" VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."ProcessingLevels" ADD CONSTRAINT "pkProcessingLevels"
	PRIMARY KEY ("ProcessingLevelID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."ProcessingLevels"."ProcessingLevelID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Core"."ProcessingLevels"."ProcessingLevelCode" IS 'Text code identifying the level of processing the Result has been subject to';

COMMENT ON COLUMN "ODM2Core"."ProcessingLevels"."Definition" IS 'Text defintion of the processing level';

COMMENT ON COLUMN "ODM2Core"."ProcessingLevels"."Explanation" IS 'Text explanation of the processing level';

COMMENT ON TABLE "ODM2Core"."ProcessingLevels" IS 'Describes the processing level of Results';


/******************** Add Table: "ODM2Core"."RelatedActions" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."RelatedActions"
(
	"RelationID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL,
	"RelationshipTypeCV" VARCHAR(255) NOT NULL,
	"RelatedActionID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."RelatedActions" ADD CONSTRAINT "pkRelatedActions"
	PRIMARY KEY ("RelationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."RelatedActions"."RelationID" IS 'Primary key for a relationship table (i.e. named "Related...").';

COMMENT ON COLUMN "ODM2Core"."RelatedActions"."ActionID" IS 'Foreign key identifier of the Action';

COMMENT ON COLUMN "ODM2Core"."RelatedActions"."RelationshipTypeCV" IS 'Text description of the relationship between two Actions';

COMMENT ON COLUMN "ODM2Core"."RelatedActions"."RelatedActionID" IS 'Foreign key identifier for a Action related to the Action identified by ActionID';

COMMENT ON TABLE "ODM2Core"."RelatedActions" IS 'Describes Actions that are related to one another.';


/******************** Add Table: "ODM2Core"."Results" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."Results"
(
	"ResultID" BIGINT NOT NULL,
	"ResultUUID" OID NOT NULL,
	"FeatureActionID" INTEGER NOT NULL,
	"ResultTypeCV" VARCHAR(255) NOT NULL,
	"VariableID" INTEGER NOT NULL,
	"UnitsID" INTEGER NOT NULL,
	"TaxonomicClassifierID" INTEGER NULL,
	"ProcessingLevelID" INTEGER NOT NULL,
	"ResultDateTime" TIMESTAMP NULL,
	"ResultDateTimeUTCOffset" BIGINT NULL,
	"ValidDateTime" TIMESTAMP NULL,
	"ValidDateTimeUTCOffset" BIGINT NULL,
	"StatusCV" VARCHAR(255) NULL,
	"SampledMediumCV" VARCHAR(255) NOT NULL,
	"ValueCount" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."Results" ADD CONSTRAINT "pkResults"
	PRIMARY KEY ("ResultID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."Results"."ResultID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2Core"."Results"."ResultUUID" IS 'Universally unique identifier for the Result';

COMMENT ON COLUMN "ODM2Core"."Results"."FeatureActionID" IS 'Foreign key identifier for the combinaton of SamplingFeature and Action that created the Result';

COMMENT ON COLUMN "ODM2Core"."Results"."ResultTypeCV" IS 'CV term describing the result type (e.g., time series, measurement, etc.)';

COMMENT ON COLUMN "ODM2Core"."Results"."VariableID" IS 'Foreign key identifier for the Variable of the result';

COMMENT ON COLUMN "ODM2Core"."Results"."UnitsID" IS 'Foreign key identifier for the Units of the result';

COMMENT ON COLUMN "ODM2Core"."Results"."TaxonomicClassifierID" IS 'Foreign key identifier for a TaxonomicClassifier for the variable (if one exists)';

COMMENT ON COLUMN "ODM2Core"."Results"."ProcessingLevelID" IS 'Foreign key identifier for the ProcessingLevel of the result';

COMMENT ON COLUMN "ODM2Core"."Results"."ResultDateTime" IS 'Date and time at which the result became available (could be used as analysis time for samples)';

COMMENT ON COLUMN "ODM2Core"."Results"."ResultDateTimeUTCOffset" IS 'UTDCOffset of ResultDateTime';

COMMENT ON COLUMN "ODM2Core"."Results"."ValidDateTime" IS 'Date and time for which the result is valid (e.g., for a forecast result).  Should probably be expressed as a duration';

COMMENT ON COLUMN "ODM2Core"."Results"."ValidDateTimeUTCOffset" IS 'UTCOffset of ValidDateTime';

COMMENT ON COLUMN "ODM2Core"."Results"."StatusCV" IS 'Status of the result (e.g., finished, ongoing, etc.)';

COMMENT ON COLUMN "ODM2Core"."Results"."SampledMediumCV" IS 'CV term defining the environmental medium that the result represents (e.g., air, soil, water)';

COMMENT ON COLUMN "ODM2Core"."Results"."ValueCount" IS 'Number of data values contained within the result';

COMMENT ON TABLE "ODM2Core"."Results" IS 'Describes the results of observation actions (e.g., groups of one or more numeric data values that result from an observation action)';


/******************** Add Table: "ODM2Core"."SamplingFeatures" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."SamplingFeatures"
(
	"SamplingFeatureID" INTEGER NOT NULL,
	"SamplingFeatureTypeCV" VARCHAR(255) NOT NULL,
	"SamplingFeatureCode" VARCHAR(50) NOT NULL,
	"SamplingFeatureName" VARCHAR(255) NULL,
	"SamplingFeatureDescription" VARCHAR(500) NULL,
	"SamplingFeatureGeotypeCV" VARCHAR(255) NULL,
	"FeatureGeometry" GEOMETRY NULL,
	"Elevation_m" FLOAT NULL,
	"ElevationDatumCV" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."SamplingFeatures" ADD CONSTRAINT "pkSamplingFeatures"
	PRIMARY KEY ("SamplingFeatureID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."SamplingFeatures"."SamplingFeatureID" IS 'Primary key.';

COMMENT ON COLUMN "ODM2Core"."SamplingFeatures"."SamplingFeatureTypeCV" IS 'CV term descripting the type of sampling feature.';

COMMENT ON COLUMN "ODM2Core"."SamplingFeatures"."SamplingFeatureCode" IS 'A short but meaningful text identifier for the sampling feature.';

COMMENT ON COLUMN "ODM2Core"."SamplingFeatures"."SamplingFeatureName" IS 'Sampling Feature name (free text).';

COMMENT ON COLUMN "ODM2Core"."SamplingFeatures"."SamplingFeatureDescription" IS 'Text describing the sampling feature.';

COMMENT ON COLUMN "ODM2Core"."SamplingFeatures"."SamplingFeatureGeotypeCV" IS 'Dimensionality of SamplingFeature; point2d, line2d, etc.';

COMMENT ON COLUMN "ODM2Core"."SamplingFeatures"."FeatureGeometry" IS 'The location geometry of the sampling feature on the Earth. Can be a Point, Curve (profile, trajectory, etc), Surface (flat polygons, etc) or Solid/Volume (although often limited to 2D geometries). ';

COMMENT ON COLUMN "ODM2Core"."SamplingFeatures"."Elevation_m" IS 'The elevation of the sampling feature in meters, or in the case of Specimen, the elevation from where the SamplingFeature.Specimen was collected';

COMMENT ON COLUMN "ODM2Core"."SamplingFeatures"."ElevationDatumCV" IS 'The code for the vertical geodetic datum that specifies the zero point for the Sampling Feature Elevation.';

COMMENT ON TABLE "ODM2Core"."SamplingFeatures" IS 'Describes the sampling features on which observations are made.';


/******************** Add Table: "ODM2Core"."TaxonomicClassifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."TaxonomicClassifiers"
(
	"TaxonomicClassifierID" INTEGER NOT NULL,
	"TaxonomicClassifierTypeCV" VARCHAR(255) NOT NULL,
	"TaxonomicClassifierName" VARCHAR(255) NOT NULL,
	"TaxonomicClassifierCommonName" VARCHAR(255) NULL,
	"TaxonomicClassifierDescription" VARCHAR(500) NULL,
	"ParentTaxonomicClassifierID" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."TaxonomicClassifiers" ADD CONSTRAINT "pkTaxonomicClassifiers"
	PRIMARY KEY ("TaxonomicClassifierID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."TaxonomicClassifiers"."TaxonomicClassifierID" IS 'ID';

COMMENT ON COLUMN "ODM2Core"."TaxonomicClassifiers"."TaxonomicClassifierTypeCV" IS 'Controlled Vocabulary for the type of taxonomy';

COMMENT ON COLUMN "ODM2Core"."TaxonomicClassifiers"."TaxonomicClassifierName" IS 'Taxonomic classification';

COMMENT ON COLUMN "ODM2Core"."TaxonomicClassifiers"."TaxonomicClassifierCommonName" IS 'Taxonomic classification using a common name';

COMMENT ON COLUMN "ODM2Core"."TaxonomicClassifiers"."TaxonomicClassifierDescription" IS 'Description or remarks about Taxonomic Classifier';

COMMENT ON COLUMN "ODM2Core"."TaxonomicClassifiers"."ParentTaxonomicClassifierID" IS 'ID of the Classifier that is one higher level in the taxonomic hiearchy';


/******************** Add Table: "ODM2Core"."Units" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."Units"
(
	"UnitsID" INTEGER NOT NULL,
	"UnitsTypeCV" VARCHAR(255) NOT NULL,
	"UnitsAbbreviation" VARCHAR(50) NOT NULL,
	"UnitsName" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."Units" ADD CONSTRAINT "pkUnits"
	PRIMARY KEY ("UnitsID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."Units"."UnitsID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2Core"."Units"."UnitsTypeCV" IS 'CV term that defines the unit type';

COMMENT ON COLUMN "ODM2Core"."Units"."UnitsAbbreviation" IS 'Text abbreviation for the unit';

COMMENT ON COLUMN "ODM2Core"."Units"."UnitsName" IS 'Text name for the unit';

COMMENT ON TABLE "ODM2Core"."Units" IS 'Describes units of measure for varibles and time';


/******************** Add Table: "ODM2Core"."Variables" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Core"."Variables"
(
	"VariableID" INTEGER NOT NULL,
	"VariableTypeCV" VARCHAR(255) NOT NULL,
	"VariableCode" VARCHAR(50) NOT NULL,
	"VariableNameCV" VARCHAR(255) NOT NULL,
	"VariableDefinition" VARCHAR(500) NULL,
	"SpeciationCV" VARCHAR(255) NULL,
	"NoDataValue" DOUBLE PRECISION NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Core"."Variables" ADD CONSTRAINT "pkVariables"
	PRIMARY KEY ("VariableID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Core"."Variables"."VariableID" IS 'Primary key';

COMMENT ON COLUMN "ODM2Core"."Variables"."VariableTypeCV" IS 'Controlled vocabulary for the type of variable';

COMMENT ON COLUMN "ODM2Core"."Variables"."VariableCode" IS 'Unique text code for the variable';

COMMENT ON COLUMN "ODM2Core"."Variables"."VariableNameCV" IS 'Controlled vocabulary for the name of the variable';

COMMENT ON COLUMN "ODM2Core"."Variables"."VariableDefinition" IS 'Text definition of the variable';

COMMENT ON COLUMN "ODM2Core"."Variables"."SpeciationCV" IS 'Speciation for the variable (e.g., expressed as P or as PO4)';

COMMENT ON COLUMN "ODM2Core"."Variables"."NoDataValue" IS 'A numeric value indicating no data.';

COMMENT ON TABLE "ODM2Core"."Variables" IS 'Stores information about measured properties.';


/******************** Add Table: "ODM2DataQuality"."DataQuality" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2DataQuality"."DataQuality"
(
	"DataQualityID" INTEGER NOT NULL,
	"DataQualityTypeCV" VARCHAR(255) NOT NULL,
	"DataQualityCode" VARCHAR(255) NOT NULL,
	"DataQualityValue" FLOAT NULL,
	"DataQualityValueUnitsID" INTEGER NULL,
	"DataQualityDescription" VARCHAR(500) NULL,
	"DataQualityLink" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2DataQuality"."DataQuality" ADD CONSTRAINT "pkDataQuality"
	PRIMARY KEY ("DataQualityID");

/* Add Comments */
COMMENT ON COLUMN "ODM2DataQuality"."DataQuality"."DataQualityID" IS 'Primary Key for DataQuality entity';

COMMENT ON COLUMN "ODM2DataQuality"."DataQuality"."DataQualityTypeCV" IS '	i.e. Precision_2sigma, MethodDetectionLimit, ReportingLevel, 95%ConfidenceNoFalsePositives.';

COMMENT ON COLUMN "ODM2DataQuality"."DataQuality"."DataQualityCode" IS 'Code for DataQualityType';

COMMENT ON COLUMN "ODM2DataQuality"."DataQuality"."DataQualityValue" IS 'Numeric value of the DataQuality';

COMMENT ON COLUMN "ODM2DataQuality"."DataQuality"."DataQualityValueUnitsID" IS 'Units for the DataQualityValue';

COMMENT ON COLUMN "ODM2DataQuality"."DataQuality"."DataQualityDescription" IS 'Text description of the DataQuality metadata';

COMMENT ON COLUMN "ODM2DataQuality"."DataQuality"."DataQualityLink" IS 'URL or path to a file or other resource supporting the DataQuality metadata';


/******************** Add Table: "ODM2DataQuality"."ReferenceMaterialValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2DataQuality"."ReferenceMaterialValues"
(
	"ReferenceMaterialValueID" INTEGER NOT NULL,
	"ReferenceMaterialID" INTEGER NOT NULL,
	"ReferenceMaterialValue" FLOAT NOT NULL,
	"ReferenceMaterialAccuracy" FLOAT NULL,
	"VariableID" INTEGER NOT NULL,
	"UnitsID" INTEGER NOT NULL,
	"CitationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2DataQuality"."ReferenceMaterialValues" ADD CONSTRAINT "pkReferenceMaterialValues"
	PRIMARY KEY ("ReferenceMaterialValueID");

/* Add Comments */
COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterialValues"."ReferenceMaterialValueID" IS 'The primary key for ReferenceMaterialValues';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterialValues"."ReferenceMaterialID" IS 'A foreign key to ReferenceMaterials';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterialValues"."ReferenceMaterialValue" IS 'The established property value for the ReferenceMaterial.';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterialValues"."ReferenceMaterialAccuracy" IS 'The established accuracy of the property value for the ReferenceMaterial, in the same units as the value.';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterialValues"."VariableID" IS 'The property that is quantified by the ReferenceMaterialValue';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterialValues"."UnitsID" IS 'The units for the ReferenceMaterialValue and ReferenceMaterialAccuracy';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterialValues"."CitationID" IS 'The attribution for source that established the ReferenceMaterialValue and ReferenceMaterialAccuracy';

COMMENT ON TABLE "ODM2DataQuality"."ReferenceMaterialValues" IS '"Accepted" property values for a Reference Material, which can be certified by an agency or vendor, established in the literature by the research community, or developed for "in house" use only by a laboratory.';


/******************** Add Table: "ODM2DataQuality"."ReferenceMaterials" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2DataQuality"."ReferenceMaterials"
(
	"ReferenceMaterialID" INTEGER NOT NULL,
	"ReferenceMaterialMediumCV" VARCHAR(255) NOT NULL,
	"ReferenceMaterialOrganizationID" INTEGER NOT NULL,
	"ReferenceMaterialCode" VARCHAR(50) NOT NULL,
	"ReferenceMaterialLotCode" VARCHAR(255) NULL,
	"ReferenceMaterialPurchaseDate" TIMESTAMP NULL,
	"ReferenceMaterialExpirationDate" TIMESTAMP NULL,
	"ReferenceMaterialCertificateLink" VARCHAR(255) NULL,
	"SamplingFeatureID" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2DataQuality"."ReferenceMaterials" ADD CONSTRAINT "pkReferenceMaterials"
	PRIMARY KEY ("ReferenceMaterialID");

/* Add Comments */
COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterials"."ReferenceMaterialID" IS 'The primary key to the Reference Material used to calibrate an instrument, assess a measurement method, or assign values to unknown specimens';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterials"."ReferenceMaterialMediumCV" IS 'The medium of a Reference Material, from the same CV as SpecimenMediumCV. Examples include: water, sediment, air, tissue, etc.';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterials"."ReferenceMaterialOrganizationID" IS 'A foreign key to the Organization that manufactured and established property values for the ReferenceMaterial';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterials"."ReferenceMaterialCode" IS 'A code or short name used to identify the reference material.';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterials"."ReferenceMaterialLotCode" IS 'The lot, or manufactured batch, of the reference material, that is often associated with a certified set of property values';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterials"."ReferenceMaterialPurchaseDate" IS 'The purchase date of a reference material, when applicable';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterials"."ReferenceMaterialExpirationDate" IS 'The expiration date of a reference material, when applicable';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterials"."ReferenceMaterialCertificateLink" IS 'A URL or file path to the Certificate that provides established property values for the given lot number.';

COMMENT ON COLUMN "ODM2DataQuality"."ReferenceMaterials"."SamplingFeatureID" IS 'A foreign key to SamplingFeatures.  Only required when the ReferenceMaterial is Analyzed as if it were an unknown specimen.';

COMMENT ON TABLE "ODM2DataQuality"."ReferenceMaterials" IS 'Describes materials that are used for the calibration of an instrument, the assessment of a measurement method, or for assigning values to unknown specimens.';


/******************** Add Table: "ODM2DataQuality"."ResultNormalizationValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2DataQuality"."ResultNormalizationValues"
(
	"ResultID" BIGINT NOT NULL,
	"NormalizedByReferenceMaterialValueID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2DataQuality"."ResultNormalizationValues" ADD CONSTRAINT "pkResultNormalizationValues"
	PRIMARY KEY ("ResultID");

/* Add Comments */
COMMENT ON COLUMN "ODM2DataQuality"."ResultNormalizationValues"."ResultID" IS 'Unique identifier';

COMMENT ON TABLE "ODM2DataQuality"."ResultNormalizationValues" IS 'Extends the Results table with a foreign key to NormalizationReferenceMaterialValues when the optional DataQuality schema is implemented.  In a database implementation, we would not implement this as a separate table from Results.';


/******************** Add Table: "ODM2DataQuality"."ResultsDataQuality" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2DataQuality"."ResultsDataQuality"
(
	"BridgeID" INTEGER NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataQualityID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2DataQuality"."ResultsDataQuality" ADD CONSTRAINT "pkResultsDataQuality"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2DataQuality"."ResultsDataQuality"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2DataQuality"."ResultsDataQuality"."ResultID" IS 'Foreign key identifier of the Result';

COMMENT ON COLUMN "ODM2DataQuality"."ResultsDataQuality"."DataQualityID" IS 'Foreign key identifier of the DataQuality entity.';


/******************** Add Table: "ODM2Equipment"."CalibratedDeploymentVariables" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Equipment"."CalibratedDeploymentVariables"
(
	"BridgeID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL,
	"DeploymentMeasuredVariableID" INTEGER NOT NULL,
	"CalibrationCheckValue" FLOAT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Equipment"."CalibratedDeploymentVariables" ADD CONSTRAINT "pkCalibratedDeploymentVariables"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Equipment"."CalibratedDeploymentVariables"."BridgeID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Equipment"."CalibratedDeploymentVariables"."ActionID" IS 'Foreign key identifier of the calibration Action';

COMMENT ON COLUMN "ODM2Equipment"."CalibratedDeploymentVariables"."DeploymentMeasuredVariableID" IS 'Foreign key identifier of the DeploymentMeasuredVariable to which the calibration was applied';

COMMENT ON COLUMN "ODM2Equipment"."CalibratedDeploymentVariables"."CalibrationCheckValue" IS 'A numeric value for the DeploymentMeasuredVariable measued using the ReferenceMaterial prior to calibration';

COMMENT ON TABLE "ODM2Equipment"."CalibratedDeploymentVariables" IS 'Information about which deployment measured variable a calibration Action is associated with';


/******************** Add Table: "ODM2Equipment"."CalibrationEquations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Equipment"."CalibrationEquations"
(
	"CalibrationEquationID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL,
	"InstrumentOutputVariableID" INTEGER NOT NULL,
	"OutputVariableEquation" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Equipment"."CalibrationEquations" ADD CONSTRAINT "pkCalibrationEquations"
	PRIMARY KEY ("CalibrationEquationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Equipment"."CalibrationEquations"."CalibrationEquationID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Equipment"."CalibrationEquations"."ActionID" IS 'Foreign key identifier of the calibration Action';

COMMENT ON COLUMN "ODM2Equipment"."CalibrationEquations"."InstrumentOutputVariableID" IS 'Foreign key identifier for the InstrumentOutputVariableID to which the calibration equation applies';

COMMENT ON COLUMN "ODM2Equipment"."CalibrationEquations"."OutputVariableEquation" IS 'Text string that encodes the calibration equation';

COMMENT ON TABLE "ODM2Equipment"."CalibrationEquations" IS 'Information about instrument calibration equations';


/******************** Add Table: "ODM2Equipment"."CalibrationStandards" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Equipment"."CalibrationStandards"
(
	"BridgeID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL,
	"ReferenceMaterialID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Equipment"."CalibrationStandards" ADD CONSTRAINT "pkCalibrationStandards"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Equipment"."CalibrationStandards"."BridgeID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Equipment"."CalibrationStandards"."ActionID" IS 'Foreign key identifier of the calibration Action';

COMMENT ON COLUMN "ODM2Equipment"."CalibrationStandards"."ReferenceMaterialID" IS 'Foreign key identifier of the ReferenceMaterial used in the calibration';

COMMENT ON TABLE "ODM2Equipment"."CalibrationStandards" IS 'Bridge table linking field calibrations to the reference materials used';


/******************** Add Table: "ODM2Equipment"."Equipment" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Equipment"."Equipment"
(
	"EquipmentID" INTEGER NOT NULL,
	"EquipmentCode" VARCHAR(50) NOT NULL,
	"EquipmentName" VARCHAR(255) NOT NULL,
	"EquipmentTypeCV" VARCHAR(255) NOT NULL,
	"EquipmentModelID" INTEGER NOT NULL,
	"EquipmentSerialNumber" VARCHAR(50) NOT NULL,
	"EquipmentOwnerID" INTEGER NOT NULL,
	"EquipmentVendorID" INTEGER NOT NULL,
	"EquipmentPurchaseDate" TIMESTAMP NOT NULL,
	"EquipmentPurchaseOrderNumber" VARCHAR(50) NULL,
	"EquipmentDescription" VARCHAR(500) NULL,
	"EquipmentDocumentationLink" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Equipment"."Equipment" ADD CONSTRAINT "pkEquipment"
	PRIMARY KEY ("EquipmentID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentCode" IS 'A text code that identifies the piece of equipment';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentName" IS 'A text name for the piece of equipment';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentTypeCV" IS 'CV term describing the equipment type (e.g., sensor, datalogger, solar panel, etc.)';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentModelID" IS 'Foreign key identifier for the model of the equipment';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentSerialNumber" IS 'Manufacturer''s serial number for the specific piece of equipment';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentOwnerID" IS 'Foreign key identifer for the person that owns the piece of equipment';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentVendorID" IS 'Foreign key identifier for the vendor organization for the piece of equipment';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentPurchaseDate" IS 'Date that the piece of equipment was purchased';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentPurchaseOrderNumber" IS 'A text string identifying the purchase order used to purchase the piece of equipment';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentDescription" IS 'Text notes about the specific piece of equipment';

COMMENT ON COLUMN "ODM2Equipment"."Equipment"."EquipmentDocumentationLink" IS 'A file name, path, or URL to a photo of the specific piece of equipment';

COMMENT ON TABLE "ODM2Equipment"."Equipment" IS 'Descriptions of specific pieces of equipment.';


/******************** Add Table: "ODM2Equipment"."EquipmentActions" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Equipment"."EquipmentActions"
(
	"BridgeID" INTEGER NOT NULL,
	"EquipmentID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Equipment"."EquipmentActions" ADD CONSTRAINT "pkEquipmentActions"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Equipment"."EquipmentActions"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Equipment"."EquipmentActions"."EquipmentID" IS 'Foreign key identifier of the Equipment entity associated with the Action';

COMMENT ON COLUMN "ODM2Equipment"."EquipmentActions"."ActionID" IS 'Foreign key identifier of the Action';


/******************** Add Table: "ODM2Equipment"."EquipmentModels" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Equipment"."EquipmentModels"
(
	"EquipmentModelID" INTEGER NOT NULL,
	"ModelManufacturerID" INTEGER NOT NULL,
	"ModelPartNumber" VARCHAR(50) NULL,
	"ModelName" VARCHAR(255) NOT NULL,
	"ModelDescription" VARCHAR(500) NULL,
	"IsInstrument" BOOL NOT NULL,
	"ModelSpecificationsFileLink" VARCHAR(255) NULL,
	"ModelLink" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Equipment"."EquipmentModels" ADD CONSTRAINT "pkEquipmentModels"
	PRIMARY KEY ("EquipmentModelID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Equipment"."EquipmentModels"."EquipmentModelID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2Equipment"."EquipmentModels"."ModelManufacturerID" IS 'Foreign key identifier of the model manufacturer';

COMMENT ON COLUMN "ODM2Equipment"."EquipmentModels"."ModelPartNumber" IS 'A part number for the equipment model';

COMMENT ON COLUMN "ODM2Equipment"."EquipmentModels"."ModelName" IS 'Text name of the equipment model';

COMMENT ON COLUMN "ODM2Equipment"."EquipmentModels"."ModelDescription" IS 'Text description of the equipment model';

COMMENT ON COLUMN "ODM2Equipment"."EquipmentModels"."IsInstrument" IS 'A boolean indication of whether the equipment is a sensor/instrument used to make observations';

COMMENT ON COLUMN "ODM2Equipment"."EquipmentModels"."ModelSpecificationsFileLink" IS 'File name, path, or URL to a specifications file for the equipment';

COMMENT ON COLUMN "ODM2Equipment"."EquipmentModels"."ModelLink" IS 'A URL to a website or file having a description of the equipment model';

COMMENT ON TABLE "ODM2Equipment"."EquipmentModels" IS 'Describes models of sensors, loggers, and related equipment used in making observations.';


/******************** Add Table: "ODM2Equipment"."InstrumentOutputVariables" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Equipment"."InstrumentOutputVariables"
(
	"InstrumentOutputVariableID" INTEGER NOT NULL,
	"ModelID" INTEGER NOT NULL,
	"VariableID" INTEGER NOT NULL,
	"InstrumentMethodID" INTEGER NOT NULL,
	"InstrumentResolution" VARCHAR(255) NULL,
	"InstrumentAccuracy" VARCHAR(255) NULL,
	"InstrumentRawOutputUnitsID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Equipment"."InstrumentOutputVariables" ADD CONSTRAINT "pkInstrumentOutputVariables"
	PRIMARY KEY ("InstrumentOutputVariableID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Equipment"."InstrumentOutputVariables"."InstrumentOutputVariableID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Equipment"."InstrumentOutputVariables"."ModelID" IS 'Foreign key identifier of the Equipment Model';

COMMENT ON COLUMN "ODM2Equipment"."InstrumentOutputVariables"."VariableID" IS 'Foreign key identifier of the Variable output by the Equipment Model';

COMMENT ON COLUMN "ODM2Equipment"."InstrumentOutputVariables"."InstrumentMethodID" IS 'Foreign key identifier of the Method used to output the Variable from the Equipment Model';

COMMENT ON COLUMN "ODM2Equipment"."InstrumentOutputVariables"."InstrumentResolution" IS 'Text description of the resolution of the output variable';

COMMENT ON COLUMN "ODM2Equipment"."InstrumentOutputVariables"."InstrumentAccuracy" IS 'Text description of the accuracy of the output variable';

COMMENT ON COLUMN "ODM2Equipment"."InstrumentOutputVariables"."InstrumentRawOutputUnitsID" IS 'Foreign key identifier of the raw output Units associated with the output variable';

COMMENT ON TABLE "ODM2Equipment"."InstrumentOutputVariables" IS 'Information about the Variables that an instrument is capable of measuring';


/******************** Add Table: "ODM2Equipment"."MaintenanceActions" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Equipment"."MaintenanceActions"
(
	"ActionID" INTEGER NOT NULL,
	"IsFactoryService" BOOL NOT NULL,
	"FactoryServiceCode" VARCHAR(50) NULL,
	"FactoryServiceReason" VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Equipment"."MaintenanceActions" ADD CONSTRAINT "pkMaintenanceActions"
	PRIMARY KEY ("ActionID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Equipment"."MaintenanceActions"."ActionID" IS 'Primary key and foreign key idenfier of the Equipment MaintenanceAction';

COMMENT ON COLUMN "ODM2Equipment"."MaintenanceActions"."IsFactoryService" IS 'Boolean indicator of whether the Action is a factory service';

COMMENT ON COLUMN "ODM2Equipment"."MaintenanceActions"."FactoryServiceCode" IS 'Text code assigned by the factory to the service performed';

COMMENT ON COLUMN "ODM2Equipment"."MaintenanceActions"."FactoryServiceReason" IS 'Text description of why the factory service Action was required';

COMMENT ON TABLE "ODM2Equipment"."MaintenanceActions" IS 'Information about maintenance Actions performed on Equipment';


/******************** Add Table: "ODM2Equipment"."RelatedEquipment" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Equipment"."RelatedEquipment"
(
	"RelationID" INTEGER NOT NULL,
	"EquipmentID" INTEGER NOT NULL,
	"RelationshipTypeCV" VARCHAR(255) NOT NULL,
	"RelatedEquipmentID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Equipment"."RelatedEquipment" ADD CONSTRAINT "pkRelatedEquipment"
	PRIMARY KEY ("RelationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Equipment"."RelatedEquipment"."RelationID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Equipment"."RelatedEquipment"."EquipmentID" IS 'Foreign key identifier for a piece of Equipment';

COMMENT ON COLUMN "ODM2Equipment"."RelatedEquipment"."RelationshipTypeCV" IS 'Text string indicating the type of relationship between two pieces of equipement';

COMMENT ON COLUMN "ODM2Equipment"."RelatedEquipment"."RelatedEquipmentID" IS 'Foreign key identifier of the related piece of equipment';

COMMENT ON TABLE "ODM2Equipment"."RelatedEquipment" IS 'Information about relationships among Equipment';


/******************** Add Table: "ODM2ExtensionProperties"."ActionExtensionPropertyValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExtensionProperties"."ActionExtensionPropertyValues"
(
	"BridgeID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL,
	"PropertyID" INTEGER NOT NULL,
	"PropertyValue" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExtensionProperties"."ActionExtensionPropertyValues" ADD CONSTRAINT "pkActionExtensionPropertyValues"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExtensionProperties"."ActionExtensionPropertyValues"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ActionExtensionPropertyValues"."ActionID" IS 'Foreign key of the Action';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ActionExtensionPropertyValues"."PropertyID" IS 'Foreign key of the extension property added to the Action';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ActionExtensionPropertyValues"."PropertyValue" IS 'Value of the extension property added to the Action';


/******************** Add Table: "ODM2ExtensionProperties"."CitationExtensionPropertyValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExtensionProperties"."CitationExtensionPropertyValues"
(
	"BridgeID" INTEGER NOT NULL,
	"CitationID" INTEGER NOT NULL,
	"PropertyID" INTEGER NOT NULL,
	"PropertyValue" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExtensionProperties"."CitationExtensionPropertyValues" ADD CONSTRAINT "pkCitationExtensionPropertyValues"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExtensionProperties"."CitationExtensionPropertyValues"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExtensionProperties"."CitationExtensionPropertyValues"."CitationID" IS 'Foreign key identifier of the Citation being extended';

COMMENT ON COLUMN "ODM2ExtensionProperties"."CitationExtensionPropertyValues"."PropertyID" IS 'Foreign key identifier for the Property being applied to the Citation';

COMMENT ON COLUMN "ODM2ExtensionProperties"."CitationExtensionPropertyValues"."PropertyValue" IS 'Value of the property being applied to the Citation';

COMMENT ON TABLE "ODM2ExtensionProperties"."CitationExtensionPropertyValues" IS 'Values for Citation Extension Properties';


/******************** Add Table: "ODM2ExtensionProperties"."ExtensionProperties" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExtensionProperties"."ExtensionProperties"
(
	"PropertyID" INTEGER NOT NULL,
	"PropertyName" VARCHAR(255) NOT NULL,
	"PropertyDescription" VARCHAR(500) NULL,
	"PropertyDataTypeCV" VARCHAR(255) NOT NULL,
	"PropertyUnitsID" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExtensionProperties"."ExtensionProperties" ADD CONSTRAINT "pkExtensionProperties"
	PRIMARY KEY ("PropertyID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExtensionProperties"."ExtensionProperties"."PropertyID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ExtensionProperties"."PropertyName" IS 'Text name of the extension property';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ExtensionProperties"."PropertyDescription" IS 'Text description of the extension property';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ExtensionProperties"."PropertyDataTypeCV" IS 'CV term specifying the data type of the property value';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ExtensionProperties"."PropertyUnitsID" IS 'Foreign key identifier for the units of the property value';

COMMENT ON TABLE "ODM2ExtensionProperties"."ExtensionProperties" IS 'Describes extension properties added to objects in an ODM database';


/******************** Add Table: "ODM2ExtensionProperties"."MethodExtensionPropertyValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExtensionProperties"."MethodExtensionPropertyValues"
(
	"BridgeID" INTEGER NOT NULL,
	"MethodID" INTEGER NOT NULL,
	"PropertyID" INTEGER NOT NULL,
	"PropertyValue" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExtensionProperties"."MethodExtensionPropertyValues" ADD CONSTRAINT "pkMethodExtensionPropertyValues"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExtensionProperties"."MethodExtensionPropertyValues"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExtensionProperties"."MethodExtensionPropertyValues"."MethodID" IS 'Foreign key identifier for the Method';

COMMENT ON COLUMN "ODM2ExtensionProperties"."MethodExtensionPropertyValues"."PropertyID" IS 'Foreign key identifier for the extension property';

COMMENT ON COLUMN "ODM2ExtensionProperties"."MethodExtensionPropertyValues"."PropertyValue" IS 'Text or numeric value of the extension property';

COMMENT ON TABLE "ODM2ExtensionProperties"."MethodExtensionPropertyValues" IS 'Links extnsion properties to a Method';


/******************** Add Table: "ODM2ExtensionProperties"."ResultExtensionPropertyValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExtensionProperties"."ResultExtensionPropertyValues"
(
	"BridgeID" INTEGER NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"PropertyID" INTEGER NOT NULL,
	"PropertyValue" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExtensionProperties"."ResultExtensionPropertyValues" ADD CONSTRAINT "pkResultExtensionPropertyValues"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExtensionProperties"."ResultExtensionPropertyValues"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ResultExtensionPropertyValues"."ResultID" IS 'Foreign key identifier for the result to which the extension property applies';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ResultExtensionPropertyValues"."PropertyID" IS 'Foreign key identifier for the extension propery';

COMMENT ON COLUMN "ODM2ExtensionProperties"."ResultExtensionPropertyValues"."PropertyValue" IS 'Text or numeric value of the extension property';

COMMENT ON TABLE "ODM2ExtensionProperties"."ResultExtensionPropertyValues" IS 'Links extension properties to a Result';


/******************** Add Table: "ODM2ExtensionProperties"."SamplingFeatureExtensionPropertyValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExtensionProperties"."SamplingFeatureExtensionPropertyValues"
(
	"BridgeID" INTEGER NOT NULL,
	"SamplingFeatureID" INTEGER NOT NULL,
	"PropertyID" INTEGER NOT NULL,
	"PropertyValue" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExtensionProperties"."SamplingFeatureExtensionPropertyValues" ADD CONSTRAINT "pkSamplingFeatureExtensionPropertyValues"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExtensionProperties"."SamplingFeatureExtensionPropertyValues"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExtensionProperties"."SamplingFeatureExtensionPropertyValues"."SamplingFeatureID" IS 'Foreign key of the SamplingFeature being extended';

COMMENT ON COLUMN "ODM2ExtensionProperties"."SamplingFeatureExtensionPropertyValues"."PropertyID" IS 'Foreign key of the extension property being added to the sampling feature ';

COMMENT ON COLUMN "ODM2ExtensionProperties"."SamplingFeatureExtensionPropertyValues"."PropertyValue" IS 'Value of the property being added to the sampling feature';


/******************** Add Table: "ODM2ExtensionProperties"."VariableExtensionPropertyValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExtensionProperties"."VariableExtensionPropertyValues"
(
	"BridgeID" INTEGER NOT NULL,
	"VariableID" INTEGER NOT NULL,
	"PropertyID" INTEGER NOT NULL,
	"PropertyValue" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExtensionProperties"."VariableExtensionPropertyValues" ADD CONSTRAINT "pkVariableExtensionPropertyValues"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExtensionProperties"."VariableExtensionPropertyValues"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExtensionProperties"."VariableExtensionPropertyValues"."VariableID" IS 'Foreign key of the variable being extended';

COMMENT ON COLUMN "ODM2ExtensionProperties"."VariableExtensionPropertyValues"."PropertyID" IS 'Foreign key of the extension property being applied to the variable';

COMMENT ON COLUMN "ODM2ExtensionProperties"."VariableExtensionPropertyValues"."PropertyValue" IS 'Text or numeric value of the extension property for the variable';


/******************** Add Table: "ODM2ExternalIdentifiers"."CitationExternalIdentifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExternalIdentifiers"."CitationExternalIdentifiers"
(
	"BridgeID" INTEGER NOT NULL,
	"CitationID" INTEGER NOT NULL,
	"ExternalIdentifierSystemID" INTEGER NOT NULL,
	"CitationExternalIdentifer" VARCHAR(255) NOT NULL,
	"CitationExternalIdentiferURI" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExternalIdentifiers"."CitationExternalIdentifiers" ADD CONSTRAINT "pkCitationExternalIdentifiers"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExternalIdentifiers"."CitationExternalIdentifiers"."CitationID" IS 'Forign key of the Citation linked to the external identifer';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."CitationExternalIdentifiers"."ExternalIdentifierSystemID" IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."CitationExternalIdentifiers"."CitationExternalIdentifer" IS 'A resolvable, globally unique ID, such as a DOI; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."CitationExternalIdentifiers"."CitationExternalIdentiferURI" IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.';


/******************** Add Table: "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExternalIdentifiers"."ExternalIdentifierSystems"
(
	"ExternalIdentifierSystemID" INTEGER NOT NULL,
	"ExternalIdentifierSystemName" VARCHAR(255) NOT NULL,
	"IdentifierSystemOrganizationID" INTEGER NOT NULL,
	"ExternalIdentifierSystemDescription" VARCHAR(500) NULL,
	"ExternalIdentifierSystemURL" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ADD CONSTRAINT "pkExternalIdentifierSystems"
	PRIMARY KEY ("ExternalIdentifierSystemID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ExternalIdentifierSystems"."ExternalIdentifierSystemID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ExternalIdentifierSystems"."ExternalIdentifierSystemName" IS 'Defines the identifier system used (i.e. IGSN, SWRC Sample Number, etc.)';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ExternalIdentifierSystems"."IdentifierSystemOrganizationID" IS 'Foreign Key identifer for the organization overseeing or affiliated with the identifier system';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ExternalIdentifierSystems"."ExternalIdentifierSystemDescription" IS 'Description of identifier system.';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ExternalIdentifierSystems"."ExternalIdentifierSystemURL" IS 'Universal Resource Locator (URL) for resolution/translation of an identifier system''s URNs (i.e. http://dx.doi.org/ is the resolver URL for doi:10.1002/2013GL057450)';

COMMENT ON TABLE "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" IS 'A single table for connecting various primary keys with points to outside systems.';


/******************** Add Table: "ODM2ExternalIdentifiers"."MethodExternalIdentifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExternalIdentifiers"."MethodExternalIdentifiers"
(
	"BridgeID" INTEGER NOT NULL,
	"MethodID" INTEGER NOT NULL,
	"ExternalIdentifierSystemID" INTEGER NOT NULL,
	"MethodExternalIdentifier" VARCHAR(255) NOT NULL,
	"MethodExternalIdentifierURI" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExternalIdentifiers"."MethodExternalIdentifiers" ADD CONSTRAINT "pkMethodExternalIdentifiers"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExternalIdentifiers"."MethodExternalIdentifiers"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."MethodExternalIdentifiers"."MethodID" IS 'Foreign Key to SamplingFeatures';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."MethodExternalIdentifiers"."ExternalIdentifierSystemID" IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."MethodExternalIdentifiers"."MethodExternalIdentifier" IS 'A resolvable, globally unique ID, such as a NEMI method number; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."MethodExternalIdentifiers"."MethodExternalIdentifierURI" IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.';


/******************** Add Table: "ODM2ExternalIdentifiers"."PersonExternalIdentifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExternalIdentifiers"."PersonExternalIdentifiers"
(
	"BridgeID" INTEGER NOT NULL,
	"PersonID" INTEGER NOT NULL,
	"ExternalIdentifierSystemID" INTEGER NOT NULL,
	"PersonExternalIdentifier" VARCHAR(255) NOT NULL,
	"PersonExternalIdenifierURI" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExternalIdentifiers"."PersonExternalIdentifiers" ADD CONSTRAINT "pkPersonExternalIdentifiers"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExternalIdentifiers"."PersonExternalIdentifiers"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."PersonExternalIdentifiers"."PersonID" IS 'Foreign Key to People table';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."PersonExternalIdentifiers"."ExternalIdentifierSystemID" IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."PersonExternalIdentifiers"."PersonExternalIdentifier" IS 'A resolvable, globally unique ID, such as an IGSN; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."PersonExternalIdentifiers"."PersonExternalIdenifierURI" IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.';

COMMENT ON TABLE "ODM2ExternalIdentifiers"."PersonExternalIdentifiers" IS 'Cross reference "linking" table to allow many to many ';


/******************** Add Table: "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers"
(
	"BridgeID" INTEGER NOT NULL,
	"ReferenceMaterialID" INTEGER NOT NULL,
	"ExternalIdentifierSystemID" INTEGER NOT NULL,
	"ReferenceMaterialExternalIdentifier" VARCHAR(255) NOT NULL,
	"ReferenceMaterialExternalIdentifierURI" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers" ADD CONSTRAINT "pkReferenceMaterialExternalIdentifiers"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers"."ReferenceMaterialID" IS 'Foreign Key to ReferenceMaterials';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers"."ExternalIdentifierSystemID" IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers"."ReferenceMaterialExternalIdentifier" IS 'A resolvable, globally unique ID, such as NBS-19; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers"."ReferenceMaterialExternalIdentifierURI" IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.';


/******************** Add Table: "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers"
(
	"BridgeID" INTEGER NOT NULL,
	"SamplingFeatureID" INTEGER NOT NULL,
	"ExternalIdentifierSystemID" INTEGER NOT NULL,
	"SamplingFeatureExternalIdentifier" VARCHAR(255) NOT NULL,
	"SamplingFeatureExternalIdentiferURI" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers" ADD CONSTRAINT "pkSamplingFeatureExternalIdentifiers"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers"."SamplingFeatureID" IS 'Foreign Key to SamplingFeatures';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers"."ExternalIdentifierSystemID" IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers"."SamplingFeatureExternalIdentifier" IS 'A resolvable, globally unique ID, such as an IGSN; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers"."SamplingFeatureExternalIdentiferURI" IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting.';


/******************** Add Table: "ODM2ExternalIdentifiers"."SpatialReferenceExternalIdentifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExternalIdentifiers"."SpatialReferenceExternalIdentifiers"
(
	"BridgeID" INTEGER NOT NULL,
	"SpatialReferenceID" INTEGER NOT NULL,
	"ExternalIdentifierSystemID" INTEGER NOT NULL,
	"SpatialReferenceExternalIdentifier" VARCHAR(255) NOT NULL,
	"SpatialReferenceExternalIdentifierURI" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExternalIdentifiers"."SpatialReferenceExternalIdentifiers" ADD CONSTRAINT "pkSpatialReferenceExternalIdentifiers"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExternalIdentifiers"."SpatialReferenceExternalIdentifiers"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';


/******************** Add Table: "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers"
(
	"BridgeID" INTEGER NOT NULL,
	"TaxonomicClassifierID" INTEGER NOT NULL,
	"ExternalIdentifierSystemID" INTEGER NOT NULL,
	"TaxonomicClassifierExternalIdentifier" VARCHAR(255) NOT NULL,
	"TaxonomicClassifierExternalIdentifierURI" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers" ADD CONSTRAINT "pkTaxonomicClassifierExternalIdentifiers"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers"."TaxonomicClassifierID" IS 'Foreign Key to TaxonomicClassifiers';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers"."ExternalIdentifierSystemID" IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers"."TaxonomicClassifierExternalIdentifier" IS 'A resolvable, globally unique ID, such as a GBIF ID; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers"."TaxonomicClassifierExternalIdentifierURI" IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.';


/******************** Add Table: "ODM2ExternalIdentifiers"."VariableExternalIdentifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2ExternalIdentifiers"."VariableExternalIdentifiers"
(
	"BridgeID" INTEGER NOT NULL,
	"VariableID" INTEGER NOT NULL,
	"ExternalIdentifierSystemID" INTEGER NOT NULL,
	"VariableExternalIdentifer" VARCHAR(255) NOT NULL,
	"VariableExternalIdentifierURI" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2ExternalIdentifiers"."VariableExternalIdentifiers" ADD CONSTRAINT "pkVariableExternalIdentifiers"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2ExternalIdentifiers"."VariableExternalIdentifiers"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."VariableExternalIdentifiers"."VariableID" IS 'Foreign Key to Variables';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."VariableExternalIdentifiers"."ExternalIdentifierSystemID" IS 'Foreign Key to ExternalIdentifierSystems';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."VariableExternalIdentifiers"."VariableExternalIdentifer" IS 'A resolvable, globally unique ID; could be a Uniform Resource Name (URN).';

COMMENT ON COLUMN "ODM2ExternalIdentifiers"."VariableExternalIdentifiers"."VariableExternalIdentifierURI" IS 'Uniform Resource Identifier (URI), preferably in the form of a persistent URL that is self-documenting and maintained by the external identifier system.';


/******************** Add Table: "ODM2LabAnalyses"."ActionDirectives" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2LabAnalyses"."ActionDirectives"
(
	"BridgeID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL,
	"DirectiveID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2LabAnalyses"."ActionDirectives" ADD CONSTRAINT "pkActionDirectives"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2LabAnalyses"."ActionDirectives"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2LabAnalyses"."ActionDirectives"."ActionID" IS 'Foreign key identifier of the Action';

COMMENT ON COLUMN "ODM2LabAnalyses"."ActionDirectives"."DirectiveID" IS 'Foreign key identifier of the Directive';


/******************** Add Table: "ODM2LabAnalyses"."Directives" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2LabAnalyses"."Directives"
(
	"DirectiveID" INTEGER NOT NULL,
	"DirectiveTypeCV" VARCHAR(255) NOT NULL,
	"DirectiveDescription" VARCHAR(500) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2LabAnalyses"."Directives" ADD CONSTRAINT "pkDirectives"
	PRIMARY KEY ("DirectiveID");

/* Add Comments */
COMMENT ON COLUMN "ODM2LabAnalyses"."Directives"."DirectiveID" IS 'Unique identifier.';

COMMENT ON COLUMN "ODM2LabAnalyses"."Directives"."DirectiveTypeCV" IS 'Directive type, such as project, intended analyte/analysis for a Specimen, etc.';

COMMENT ON COLUMN "ODM2LabAnalyses"."Directives"."DirectiveDescription" IS 'Text description of the directive or purpose under which the action was taken.';

COMMENT ON TABLE "ODM2LabAnalyses"."Directives" IS 'Describes the directive or purpose under which actions are made.  Directives can be projects, intended analyses for a specimen, etc.';


/******************** Add Table: "ODM2LabAnalyses"."SpecimenBatchPostions" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2LabAnalyses"."SpecimenBatchPostions"
(
	"FeatureActionID" INTEGER NOT NULL,
	"BatchPositionNumber" INTEGER NOT NULL,
	"BatchPositionLabel" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2LabAnalyses"."SpecimenBatchPostions" ADD CONSTRAINT "pkSpecimenBatchPostions"
	PRIMARY KEY ("FeatureActionID");

/* Add Comments */
COMMENT ON COLUMN "ODM2LabAnalyses"."SpecimenBatchPostions"."FeatureActionID" IS 'Foriegn key identifer for the Specimen Preparation or Analysis Batch';

COMMENT ON COLUMN "ODM2LabAnalyses"."SpecimenBatchPostions"."BatchPositionNumber" IS 'The position or line number of a specimen within a PreparationBatchAction or an InstrumentAnalysisAction.';

COMMENT ON COLUMN "ODM2LabAnalyses"."SpecimenBatchPostions"."BatchPositionLabel" IS 'The label text for a specimen within a PreparationBatchAction or an InstrumentAnalysisAction.';

COMMENT ON TABLE "ODM2LabAnalyses"."SpecimenBatchPostions" IS 'Extends the FeatureActions table with a foreign key when the optional LabAnalyses schema is implemented.  In a database implementation, we would not implement this as a separate table from FeatureActions, but rather just add the additional field(s).';


/******************** Add Table: "ODM2Provenance"."AuthorLists" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."AuthorLists"
(
	"BridgeID" INTEGER NOT NULL,
	"CitationID" INTEGER NOT NULL,
	"PersonID" INTEGER NOT NULL,
	"AuthorOrder" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."AuthorLists" ADD CONSTRAINT "pkAuthorLists"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Provenance"."AuthorLists"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Provenance"."AuthorLists"."CitationID" IS 'Foreign key identifier for a Citation';

COMMENT ON COLUMN "ODM2Provenance"."AuthorLists"."PersonID" IS 'Foreign key identifier for a Person that is an author of the Citation';

COMMENT ON COLUMN "ODM2Provenance"."AuthorLists"."AuthorOrder" IS 'Integer order of the authors of the Citation starting with 1 for first author';

COMMENT ON TABLE "ODM2Provenance"."AuthorLists" IS 'Relationship between Citations and their Authors';


/******************** Add Table: "ODM2Provenance"."Citations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."Citations"
(
	"CitationID" INTEGER NOT NULL,
	"Title" VARCHAR(255) NOT NULL,
	"Publisher" VARCHAR(255) NOT NULL,
	"PublicationYear" INTEGER NOT NULL,
	"CitationLink" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."Citations" ADD CONSTRAINT "pkCitations"
	PRIMARY KEY ("CitationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Provenance"."Citations"."CitationID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Provenance"."Citations"."Title" IS 'Text title of the Citation';

COMMENT ON COLUMN "ODM2Provenance"."Citations"."Publisher" IS 'Text publisher of the Citation';

COMMENT ON COLUMN "ODM2Provenance"."Citations"."PublicationYear" IS 'Integer publication year (4 digits) of the Citation';

COMMENT ON COLUMN "ODM2Provenance"."Citations"."CitationLink" IS 'Text link to the Citation (i.e. URL or path).';

COMMENT ON TABLE "ODM2Provenance"."Citations" IS 'Information about Citations';


/******************** Add Table: "ODM2Provenance"."DataSetCitations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."DataSetCitations"
(
	"BridgeID" INTEGER NOT NULL,
	"DataSetID" INTEGER NOT NULL,
	"RelationshipTypeCV" VARCHAR(255) NOT NULL,
	"CitationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."DataSetCitations" ADD CONSTRAINT "pkDataSetCitations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Provenance"."DataSetCitations"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Provenance"."DataSetCitations"."DataSetID" IS 'Foreign key identifier for a DataSet';

COMMENT ON COLUMN "ODM2Provenance"."DataSetCitations"."RelationshipTypeCV" IS 'CV term describing the relationship between the DataSet and the Citation (e.g., "cites" or "isCitedBy"), largely conforming to CV used by DataCite.org.';

COMMENT ON COLUMN "ODM2Provenance"."DataSetCitations"."CitationID" IS 'Foreign key identifier for a Citation that is associated with the DataSet identified by DataSetID';

COMMENT ON TABLE "ODM2Provenance"."DataSetCitations" IS 'Relationship between DataSets and Citations';


/******************** Add Table: "ODM2Provenance"."DerivationEquations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."DerivationEquations"
(
	"DerivationEquationID" INTEGER NOT NULL,
	"DerivationEquation" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."DerivationEquations" ADD CONSTRAINT "pkDerivationEquations"
	PRIMARY KEY ("DerivationEquationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Provenance"."DerivationEquations"."DerivationEquationID" IS 'Primary key for DerivationEquations, which include calibration equations, normalizations, etc. on one or more RelatedResults to produce a DerivedResult.';

COMMENT ON COLUMN "ODM2Provenance"."DerivationEquations"."DerivationEquation" IS 'Text of the equation used to derive a Result from one or more RelatedResults, where y is the DerivedResult and x1, x2, ..., xn are the RelatedResults specified in order by RelatedResultSequenceID.';

COMMENT ON TABLE "ODM2Provenance"."DerivationEquations" IS 'DerivationEquations include calibration equations, normalizations, etc. on one or more RelatedResults to produce a DerivedResult.';


/******************** Add Table: "ODM2Provenance"."MethodCitations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."MethodCitations"
(
	"BridgeID" INTEGER NOT NULL,
	"MethodID" INTEGER NOT NULL,
	"RelationshipTypeCV" VARCHAR(255) NOT NULL,
	"CitationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."MethodCitations" ADD CONSTRAINT "pkMethodCitations"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Provenance"."MethodCitations"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2Provenance"."MethodCitations"."MethodID" IS 'Foreign key identifier for a Method';

COMMENT ON COLUMN "ODM2Provenance"."MethodCitations"."RelationshipTypeCV" IS 'CV term describing the relationship between the Methods and the Citation (e.g., "References" or "isDocumentedBy"), largely conforming to CV used by DataCite.org.';

COMMENT ON COLUMN "ODM2Provenance"."MethodCitations"."CitationID" IS 'Foreign key identifier for a Citation that is associated with the Method identified by MethodID';


/******************** Add Table: "ODM2Provenance"."RelatedAnnotations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."RelatedAnnotations"
(
	"RelationID" INTEGER NOT NULL,
	"AnnotationID" INTEGER NOT NULL,
	"RelationshipTypeCV" VARCHAR(255) NOT NULL,
	"RelatedAnnotationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."RelatedAnnotations" ADD CONSTRAINT "pkRelatedAnnotations"
	PRIMARY KEY ("RelationID");

/* Add Comments */
COMMENT ON TABLE "ODM2Provenance"."RelatedAnnotations" IS 'Stores information about relationships among Annotations';


/******************** Add Table: "ODM2Provenance"."RelatedCitations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."RelatedCitations"
(
	"RelationID" INTEGER NOT NULL,
	"CitationID" INTEGER NOT NULL,
	"RelationshipTypeCV" INTEGER NOT NULL,
	"RelatedCitationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."RelatedCitations" ADD CONSTRAINT "pkRelatedCitations"
	PRIMARY KEY ("RelationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Provenance"."RelatedCitations"."RelationID" IS 'Primary key for a relationship table (i.e. named "Related...").';

COMMENT ON COLUMN "ODM2Provenance"."RelatedCitations"."CitationID" IS 'Foreign key identifier for a Citation';

COMMENT ON COLUMN "ODM2Provenance"."RelatedCitations"."RelationshipTypeCV" IS 'CV term describing the relationship between Citations (e.g., "IsSupplementTo" or "IsPartOf"), largely conforming to CV used by DataCite.org.';

COMMENT ON COLUMN "ODM2Provenance"."RelatedCitations"."RelatedCitationID" IS 'Foreign key identifier for a Citation that is related to the Citation identified by CitationID';

COMMENT ON TABLE "ODM2Provenance"."RelatedCitations" IS 'Information about relationships among citations';


/******************** Add Table: "ODM2Provenance"."RelatedDatasets" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."RelatedDatasets"
(
	"RelationID" INTEGER NOT NULL,
	"DataSetID" INTEGER NOT NULL,
	"RelationshipTypeCV" VARCHAR(255) NOT NULL,
	"RelatedDatasetID" INTEGER NOT NULL,
	"VersionCode" VARCHAR(50) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."RelatedDatasets" ADD CONSTRAINT "pkRelatedDatasets"
	PRIMARY KEY ("RelationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Provenance"."RelatedDatasets"."RelationID" IS 'Primary key for a relationship table (i.e. named "Related...").';

COMMENT ON COLUMN "ODM2Provenance"."RelatedDatasets"."DataSetID" IS 'Foreign key identifier for a DataSet';

COMMENT ON COLUMN "ODM2Provenance"."RelatedDatasets"."RelationshipTypeCV" IS 'CV term describing the relationship between DataSets (e.g., "IsNewVersionOf" or "Continues"), largely conforming to CV used by DataCite.org.';

COMMENT ON COLUMN "ODM2Provenance"."RelatedDatasets"."RelatedDatasetID" IS 'Foreign key identifier for a DataSet related to the DataSet identified by DataSetID';

COMMENT ON COLUMN "ODM2Provenance"."RelatedDatasets"."VersionCode" IS 'Text version number/code that can be specified if the DataSet is an explicit version of another DataSet and where the RelationshipTypeCV = "isNewVersionOf".';

COMMENT ON TABLE "ODM2Provenance"."RelatedDatasets" IS 'Information about relationships among DataSets';


/******************** Add Table: "ODM2Provenance"."RelatedResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."RelatedResults"
(
	"RelationID" INTEGER NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"RelationshipTypeCV" VARCHAR(255) NOT NULL,
	"RelatedResultID" BIGINT NOT NULL,
	"VersionCode" VARCHAR(50) NULL,
	"RelatedResultSequenceNumber" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."RelatedResults" ADD CONSTRAINT "pkRelatedResults"
	PRIMARY KEY ("RelationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Provenance"."RelatedResults"."RelationID" IS 'Primary key for a relationship table (i.e. named "Related...").';

COMMENT ON COLUMN "ODM2Provenance"."RelatedResults"."ResultID" IS 'Foreign key identifier for a Result';

COMMENT ON COLUMN "ODM2Provenance"."RelatedResults"."RelationshipTypeCV" IS 'Text description of the relationship between the Results from a controlled vocabulary (e.g., "isDerivedFrom")';

COMMENT ON COLUMN "ODM2Provenance"."RelatedResults"."RelatedResultID" IS 'Foreign key identifier for a Result that is related to the Result identified by ResultID';

COMMENT ON COLUMN "ODM2Provenance"."RelatedResults"."VersionCode" IS 'Text version number/code that can be specified if the Result is an explicit version of another Result and where the RelationshipTypeCV = "isNewVersionOf".';

COMMENT ON COLUMN "ODM2Provenance"."RelatedResults"."RelatedResultSequenceNumber" IS 'Integer sequence number indicating the order in which a RelatedResults appears in a DerivationEquation (i.e. 1 for x1, 2 for x2...) and where a Result "isDerivedFrom" one or more  RelatedResults.';

COMMENT ON TABLE "ODM2Provenance"."RelatedResults" IS 'Information about relationships among Results';


/******************** Add Table: "ODM2Provenance"."ResultDerivationEquations" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Provenance"."ResultDerivationEquations"
(
	"ResultID" BIGINT NOT NULL,
	"DerivationEquationID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Provenance"."ResultDerivationEquations" ADD CONSTRAINT "pkResultDerivationEquations"
	PRIMARY KEY ("ResultID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Provenance"."ResultDerivationEquations"."ResultID" IS 'Foreign key identifier for a Result that was derived using the Equation specified by DerivationEquationID';

COMMENT ON COLUMN "ODM2Provenance"."ResultDerivationEquations"."DerivationEquationID" IS 'Foreign key identifier for the DerivationEquation used to derive the Result identified by ResultID';

COMMENT ON TABLE "ODM2Provenance"."ResultDerivationEquations" IS 'Relationship between Results and Equations used to derive them';


/******************** Add Table: "ODM2Results"."CategoricalResultValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."CategoricalResultValues"
(
	"ValueID" BIGINT NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataValue" VARCHAR(255) NOT NULL,
	"ValueDateTime" TIMESTAMP NOT NULL,
	"ValueDateTimeUTCOffset" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."CategoricalResultValues" ADD CONSTRAINT "pkCategoricalResultValues"
	PRIMARY KEY ("ValueID");


/******************** Add Table: "ODM2Results"."CategoricalResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."CategoricalResults"
(
	"ResultID" BIGINT NOT NULL,
	"XLocation" FLOAT NULL,
	"XLocationUnitsID" INTEGER NULL,
	"YLocation" FLOAT NULL,
	"YLocationUnitsID" INTEGER NULL,
	"ZLocation" FLOAT NULL,
	"ZLocationUnitsID" INTEGER NULL,
	"SpatialReferenceID" INTEGER NULL,
	"QualityCodeCV" BIGINT NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."CategoricalResults" ADD CONSTRAINT "pkCategoricalResults"
	PRIMARY KEY ("ResultID");


/******************** Add Table: "ODM2Results"."MeasurementResultValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."MeasurementResultValues"
(
	"ValueID" BIGINT NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataValue" FLOAT NOT NULL,
	"ValueDateTime" TIMESTAMP NOT NULL,
	"ValueDateTimeUTCOffset" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."MeasurementResultValues" ADD CONSTRAINT "pkMeasurementResultValues"
	PRIMARY KEY ("ValueID");


/******************** Add Table: "ODM2Results"."MeasurementResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."MeasurementResults"
(
	"ResultID" BIGINT NOT NULL,
	"XLocation" FLOAT NULL,
	"XLocationUnitsID" INTEGER NULL,
	"YLocation" FLOAT NULL,
	"YLocationUnitsID" INTEGER NULL,
	"ZLocation" FLOAT NULL,
	"ZLocationUnitsID" INTEGER NULL,
	"SpatialReferenceID" INTEGER NULL,
	"CensorCodeCV" VARCHAR(255) NOT NULL,
	"QualityCodeCV" VARCHAR(255) NOT NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL,
	"TimeAggregationInterval" FLOAT NOT NULL,
	"TimeAggregationIntervalUnitsID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."MeasurementResults" ADD CONSTRAINT "pkMeasurementResults"
	PRIMARY KEY ("ResultID");


/******************** Add Table: "ODM2Results"."PointCoverageResultValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."PointCoverageResultValues"
(
	"ValueID" BIGINT NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataValue" BIGINT NOT NULL,
	"ValueDateTime" TIMESTAMP NOT NULL,
	"ValueDateTimeUTCOffset" INTEGER NOT NULL,
	"XLocation" FLOAT NOT NULL,
	"XLocationUnitsID" INTEGER NOT NULL,
	"YLocation" FLOAT NOT NULL,
	"YLocationUnitsID" INTEGER NOT NULL,
	"CensorCodeCV" VARCHAR(255) NOT NULL,
	"QualityCodeCV" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."PointCoverageResultValues" ADD CONSTRAINT "pkPointCoverageResultValues"
	PRIMARY KEY ("ValueID");


/******************** Add Table: "ODM2Results"."PointCoverageResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."PointCoverageResults"
(
	"ResultID" BIGINT NOT NULL,
	"ZLocation" FLOAT NULL,
	"ZLocationUnitsID" INTEGER NULL,
	"SpatialReferenceID" INTEGER NULL,
	"IntendedXSpacing" FLOAT NULL,
	"IntendedXSpacingUnitsID" INTEGER NULL,
	"IntendedYSpacing" FLOAT NULL,
	"IntendedYSpacingUnitsID" INTEGER NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL,
	"TimeAggregationInterval" FLOAT NOT NULL,
	"TimeAggregationIntervalUnitsID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."PointCoverageResults" ADD CONSTRAINT "pkPointCoverageResults"
	PRIMARY KEY ("ResultID");


/******************** Add Table: "ODM2Results"."ProfileResultValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."ProfileResultValues"
(
	"ValueID" BIGINT NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataValue" FLOAT NOT NULL,
	"ValueDateTime" TIMESTAMP NOT NULL,
	"ValueDateTimeUTCOffset" INTEGER NOT NULL,
	"ZLocation" FLOAT NOT NULL,
	"ZAggregationInterval" FLOAT NOT NULL,
	"ZLocationUnitsID" INTEGER NOT NULL,
	"CensorCodeCV" VARCHAR(255) NOT NULL,
	"QualityCodeCV" VARCHAR(255) NOT NULL,
	"TimeAggregationInterval" FLOAT NOT NULL,
	"TimeAggregationIntervalUnitsID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."ProfileResultValues" ADD CONSTRAINT "pkProfileResultValues"
	PRIMARY KEY ("ValueID");

/* Add Comments */
COMMENT ON TABLE "ODM2Results"."ProfileResultValues" IS 'Numeric values of Depth Profile Results.';


/******************** Add Table: "ODM2Results"."ProfileResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."ProfileResults"
(
	"ResultID" BIGINT NOT NULL,
	"XLocation" FLOAT NULL,
	"XLocationUnitsID" INTEGER NULL,
	"YLocation" FLOAT NULL,
	"YLocationUnitsID" INTEGER NULL,
	"SpatialReferenceID" INTEGER NULL,
	"IntendedZSpacing" FLOAT NULL,
	"IntendedZSpacingUnitsID" INTEGER NULL,
	"IntendedTimeSpacing" FLOAT NULL,
	"IntendedTimeSpacingUnitsID" INTEGER NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."ProfileResults" ADD CONSTRAINT "pkProfileResults"
	PRIMARY KEY ("ResultID");

/* Add Comments */
COMMENT ON TABLE "ODM2Results"."ProfileResults" IS 'Information about Profile Results';


/******************** Add Table: "ODM2Results"."ResultTypeCV" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."ResultTypeCV"
(
	"ResultTypeCV" VARCHAR(255) NOT NULL,
	"ResultTypeCategory" VARCHAR(255) NOT NULL,
	"DataType" VARCHAR(255) NOT NULL,
	"ResultTypeDefinition" VARCHAR(500) NOT NULL,
	"FixedDimensions" VARCHAR(255) NOT NULL,
	"VaryingDimensions" VARCHAR(255) NOT NULL,
	"SpaceMeasurementFramework" VARCHAR(255) NOT NULL,
	"TimeMeasurementFramework" VARCHAR(255) NOT NULL,
	"VariableMeasurementFramework" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."ResultTypeCV" ADD CONSTRAINT "pkResultTypeCV"
	PRIMARY KEY ("ResultTypeCV");


/******************** Add Table: "ODM2Results"."SectionResultValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."SectionResultValues"
(
	"ValueID" BIGINT NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataValue" DOUBLE PRECISION NOT NULL,
	"ValueDateTime" BIGINT NOT NULL,
	"ValueDateTimeUTCOffset" BIGINT NOT NULL,
	"XLocation" DOUBLE PRECISION NOT NULL,
	"XAggregationInterval" FLOAT NOT NULL,
	"XLocationUnitsID" INTEGER NOT NULL,
	"ZLocation" BIGINT NOT NULL,
	"ZAggregationInterval" FLOAT NOT NULL,
	"ZLocationUnitsID" INTEGER NOT NULL,
	"CensorCodeCV" VARCHAR(255) NOT NULL,
	"QualityCodeCV" VARCHAR(255) NOT NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL,
	"TimeAggregationInterval" FLOAT NOT NULL,
	"TimeAggregationIntervalUnitsID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."SectionResultValues" ADD CONSTRAINT "pkSectionResultValues"
	PRIMARY KEY ("ValueID");


/******************** Add Table: "ODM2Results"."SectionResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."SectionResults"
(
	"ResultID" BIGINT NOT NULL,
	"YLocation" FLOAT NULL,
	"YLocationUnitsID" INTEGER NULL,
	"SpatialReferenceID" INTEGER NULL,
	"IntendedXSpacing" FLOAT NULL,
	"IntendedXSpacingUnitsID" INTEGER NULL,
	"IntendedZSpacing" FLOAT NULL,
	"IntendedZSpacingUnitsID" INTEGER NULL,
	"IntendedTimeSpacing" FLOAT NULL,
	"IntendedTimeSpacingUnitsID" INTEGER NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."SectionResults" ADD CONSTRAINT "pkSectionResults"
	PRIMARY KEY ("ResultID");


/******************** Add Table: "ODM2Results"."SpectraResultValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."SpectraResultValues"
(
	"ValueID" BIGINT NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataValue" FLOAT NOT NULL,
	"ValueDateTime" TIMESTAMP NOT NULL,
	"ValueDateTimeUTCOffset" INTEGER NOT NULL,
	"ExcitationWavelength" FLOAT NOT NULL,
	"EmissionWavelength" FLOAT NOT NULL,
	"WavelengthUnitsID" INTEGER NOT NULL,
	"CensorCodeCV" VARCHAR(255) NOT NULL,
	"QualityCodeCV" VARCHAR(255) NOT NULL,
	"TimeAggregationInterval" DOUBLE PRECISION NOT NULL,
	"TimeAggregationIntervalUnitsID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."SpectraResultValues" ADD CONSTRAINT "pkSpectraResultValues"
	PRIMARY KEY ("ValueID");


/******************** Add Table: "ODM2Results"."SpectraResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."SpectraResults"
(
	"ResultID" BIGINT NOT NULL,
	"XLocation" FLOAT NULL,
	"XLocationUnitsID" INTEGER NULL,
	"YLocation" FLOAT NULL,
	"YLocationUnitsID" INTEGER NULL,
	"ZLocation" FLOAT NULL,
	"ZLocationUnitsID" INTEGER NULL,
	"SpatialReferenceID" INTEGER NULL,
	"IntendedWavelengthSpacing" DOUBLE PRECISION NULL,
	"IntendedWavelengthSpacingUnitsID" INTEGER NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."SpectraResults" ADD CONSTRAINT "pkSpectraResults"
	PRIMARY KEY ("ResultID");


/******************** Add Table: "ODM2Results"."TimeSeriesResultValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."TimeSeriesResultValues"
(
	"ValueID" BIGINT NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataValue" FLOAT NOT NULL,
	"ValueDateTime" TIMESTAMP NOT NULL,
	"ValueDateTimeUTCOffset" INTEGER NOT NULL,
	"CensorCodeCV" VARCHAR(255) NOT NULL,
	"QualityCodeCV" VARCHAR(255) NOT NULL,
	"TimeAggregationInterval" FLOAT NOT NULL,
	"TimeAggregationIntervalUnitsID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."TimeSeriesResultValues" ADD CONSTRAINT "pkTimeSeriesResultValues"
	PRIMARY KEY ("ValueID");


/******************** Add Table: "ODM2Results"."TimeSeriesResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."TimeSeriesResults"
(
	"ResultID" BIGINT NOT NULL,
	"XLocation" FLOAT NULL,
	"XLocationUnitsID" INTEGER NULL,
	"YLocation" FLOAT NULL,
	"YLocationUnitsID" INTEGER NULL,
	"ZLocation" FLOAT NULL,
	"ZLocationUnitsID" INTEGER NULL,
	"SpatialReferenceID" INTEGER NULL,
	"IntendedTimeSpacing" FLOAT NULL,
	"IntendedTimeSpacingUnitsID" INTEGER NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."TimeSeriesResults" ADD CONSTRAINT "pkTimeSeriesResults"
	PRIMARY KEY ("ResultID");


/******************** Add Table: "ODM2Results"."TrajectoryResultValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."TrajectoryResultValues"
(
	"ValueID" BIGINT NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataValue" FLOAT NOT NULL,
	"ValueDateTime" TIMESTAMP NOT NULL,
	"ValueDateTimeUTCOffset" INTEGER NOT NULL,
	"XLocation" FLOAT NOT NULL,
	"XLocationUnitsID" INTEGER NOT NULL,
	"YLocation" FLOAT NOT NULL,
	"YLocationUnitsID" INTEGER NOT NULL,
	"ZLocation" FLOAT NOT NULL,
	"ZLocationUnitsID" INTEGER NOT NULL,
	"TrajectoryDistance" FLOAT NOT NULL,
	"TrajectoryDistanceAggregationInterval" FLOAT NOT NULL,
	"TrajectoryDistanceUnitsID" INTEGER NOT NULL,
	"CensorCode" VARCHAR(255) NOT NULL,
	"QualityCodeCV" VARCHAR(255) NOT NULL,
	"TimeAggregationInterval" FLOAT NOT NULL,
	"TimeAggregationIntervalUnitsID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."TrajectoryResultValues" ADD CONSTRAINT "pkTrajectoryResultValues"
	PRIMARY KEY ("ValueID");


/******************** Add Table: "ODM2Results"."TrajectoryResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."TrajectoryResults"
(
	"ResultID" BIGINT NOT NULL,
	"SpatialReferenceID" INTEGER NULL,
	"IntendedTrajectorySpacing" FLOAT NULL,
	"IntendedTrajectorySpacingUnitsID" INTEGER NULL,
	"IntendedTimeSpacing" FLOAT NULL,
	"IntendedTimeSpacingUnitsID" INTEGER NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."TrajectoryResults" ADD CONSTRAINT "pkTrajectoryResults"
	PRIMARY KEY ("ResultID");


/******************** Add Table: "ODM2Results"."TransectResultValues" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."TransectResultValues"
(
	"ValueID" BIGINT NOT NULL,
	"ResultID" BIGINT NOT NULL,
	"DataValue" FLOAT NOT NULL,
	"ValueDateTime" TIMESTAMP NOT NULL,
	"ValueDateTimeUTCOffset" TIMESTAMP NOT NULL,
	"XLocation" FLOAT NOT NULL,
	"XLocationUnitsID" INTEGER NOT NULL,
	"YLocation" FLOAT NOT NULL,
	"YLocationUnitsID" INTEGER NOT NULL,
	"TransectDistance" FLOAT NOT NULL,
	"TransectDistanceAggregationInterval" FLOAT NOT NULL,
	"TransectDistanceUnitsID" INTEGER NOT NULL,
	"CensorCodeCV" VARCHAR(255) NOT NULL,
	"QualityCodeCV" VARCHAR(255) NOT NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL,
	"TimeAggregationInterval" FLOAT NOT NULL,
	"TimeAggregationIntervalUnitsID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."TransectResultValues" ADD CONSTRAINT "pkTransectResultValues"
	PRIMARY KEY ("ValueID");


/******************** Add Table: "ODM2Results"."TransectResults" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Results"."TransectResults"
(
	"ResultID" BIGINT NOT NULL,
	"ZLocation" FLOAT NULL,
	"ZLocationUnitsID" INTEGER NULL,
	"SpatialReferenceID" INTEGER NULL,
	"IntendedTransectSpacing" FLOAT NULL,
	"IntendedTransectSpacingUnitsID" INTEGER NULL,
	"IntendedTimeSpacing" FLOAT NULL,
	"IntendedTimeSpacingUnitsID" INTEGER NULL,
	"AggregationStatisticCV" VARCHAR(255) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Results"."TransectResults" ADD CONSTRAINT "pkTransectResults"
	PRIMARY KEY ("ResultID");


/******************** Add Table: "ODM2SamplingFeatures"."RelatedFeatures" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2SamplingFeatures"."RelatedFeatures"
(
	"RelationID" INTEGER NOT NULL,
	"SamplingFeatureID" INTEGER NOT NULL,
	"RelationshipTypeCV" VARCHAR(255) NOT NULL,
	"RelatedFeatureID" INTEGER NOT NULL,
	"SpatialOffsetID" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2SamplingFeatures"."RelatedFeatures" ADD CONSTRAINT "pkRelatedFeatures"
	PRIMARY KEY ("RelationID");

/* Add Comments */
COMMENT ON COLUMN "ODM2SamplingFeatures"."RelatedFeatures"."RelationID" IS 'Primary key for a relationship table (i.e. named "Related...").';

COMMENT ON COLUMN "ODM2SamplingFeatures"."RelatedFeatures"."SamplingFeatureID" IS 'Foregn key identifier of a Sampling Feature';

COMMENT ON COLUMN "ODM2SamplingFeatures"."RelatedFeatures"."RelationshipTypeCV" IS 'CV term describing the relationship between SamplingFeatures (e.g., "IsChildOf", "IsFractionOf" or "IsCompositeOf").';

COMMENT ON COLUMN "ODM2SamplingFeatures"."RelatedFeatures"."RelatedFeatureID" IS 'Foreign key identifier of a Sampling Feature that is the parent of the current Sampling Feature';

COMMENT ON COLUMN "ODM2SamplingFeatures"."RelatedFeatures"."SpatialOffsetID" IS 'Foreign key identifier of a spatial offset from the feature parent';

COMMENT ON TABLE "ODM2SamplingFeatures"."RelatedFeatures" IS 'Describes parrent/child relationships among Sampling Features';


/******************** Add Table: "ODM2SamplingFeatures"."Sites" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2SamplingFeatures"."Sites"
(
	"SamplingFeatureID" INTEGER NOT NULL,
	"SiteTypeCV" VARCHAR(255) NOT NULL,
	"Latitude" FLOAT NOT NULL,
	"Longitude" FLOAT NOT NULL,
	"LatLonDatumID" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2SamplingFeatures"."Sites" ADD CONSTRAINT "pkSites"
	PRIMARY KEY ("SamplingFeatureID");

/* Add Comments */
COMMENT ON COLUMN "ODM2SamplingFeatures"."Sites"."SamplingFeatureID" IS 'Foreign key identifier of the Sampling Feature that is the Site';

COMMENT ON COLUMN "ODM2SamplingFeatures"."Sites"."SiteTypeCV" IS 'A CV term describing the site type';

COMMENT ON COLUMN "ODM2SamplingFeatures"."Sites"."Latitude" IS 'Latitude of the site';

COMMENT ON COLUMN "ODM2SamplingFeatures"."Sites"."Longitude" IS 'Longitude of the site';

COMMENT ON COLUMN "ODM2SamplingFeatures"."Sites"."LatLonDatumID" IS 'Foreign key identifier for the Spatial Reference System that describes the latitude and longitude coordinates';

COMMENT ON TABLE "ODM2SamplingFeatures"."Sites" IS 'Describes sampling features that are point sites';


/******************** Add Table: "ODM2SamplingFeatures"."SpatialOffsets" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2SamplingFeatures"."SpatialOffsets"
(
	"SpatialOffsetID" INTEGER NOT NULL,
	"SpatialOffsetTypeCV" VARCHAR(255) NOT NULL,
	"Offset1Value" FLOAT NOT NULL,
	"Offset1UnitID" INTEGER NOT NULL,
	"Offset2Value" FLOAT NULL,
	"Offset2UnitID" INTEGER NULL,
	"Offset3Value" FLOAT NULL,
	"Offset3UnitID" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2SamplingFeatures"."SpatialOffsets" ADD CONSTRAINT "pkSpatialOffsets"
	PRIMARY KEY ("SpatialOffsetID");

/* Add Comments */
COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialOffsets"."SpatialOffsetID" IS 'Primary Key of SpatialOffset';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialOffsets"."SpatialOffsetTypeCV" IS 'Type of SpatialOffset, such as Depth, DepthInterval, HorizaontalRadial';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialOffsets"."Offset1Value" IS 'Numerical value for 1st SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialOffsets"."Offset1UnitID" IS 'Units for 1st SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialOffsets"."Offset2Value" IS 'Numerical value for 2nd SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialOffsets"."Offset2UnitID" IS 'Units for 2nd SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialOffsets"."Offset3Value" IS 'Numerical value for 3rd SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialOffsets"."Offset3UnitID" IS 'Units for 3rd SpatialOffset, which is defined by SpatialOffsetType';

COMMENT ON TABLE "ODM2SamplingFeatures"."SpatialOffsets" IS 'An explicit spatial relationship between a sampling feature relative to it''s parent.';


/******************** Add Table: "ODM2SamplingFeatures"."SpatialReferences" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2SamplingFeatures"."SpatialReferences"
(
	"SpatialReferenceID" INTEGER NOT NULL,
	"SRSCode" VARCHAR(50) NULL,
	"SRSName" VARCHAR(255) NOT NULL,
	"SRSDescription" VARCHAR(500) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2SamplingFeatures"."SpatialReferences" ADD CONSTRAINT "pkSpatialReferences"
	PRIMARY KEY ("SpatialReferenceID");

/* Add Comments */
COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialReferences"."SpatialReferenceID" IS 'Unique identifier';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialReferences"."SRSCode" IS 'SRS code for the spatial reference system';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialReferences"."SRSName" IS 'Text name of the spatial reference system';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpatialReferences"."SRSDescription" IS 'Text notes describing the spatial reference system';

COMMENT ON TABLE "ODM2SamplingFeatures"."SpatialReferences" IS 'Describes spatial reference systems used to reference the coordinates for sites';


/******************** Add Table: "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers"
(
	"BridgeID" INTEGER NOT NULL,
	"SamplingFeatureID" INTEGER NOT NULL,
	"TaxonomicClassifierID" INTEGER NOT NULL,
	"CitationID" INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers" ADD CONSTRAINT "pkSpecimenTaxonomicClassifiers"
	PRIMARY KEY ("BridgeID");

/* Add Comments */
COMMENT ON COLUMN "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers"."BridgeID" IS 'Primary key for a bridge table, enabling many-to-many joins.';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers"."SamplingFeatureID" IS 'Foreign key to SamplingFeatures.Specimens.';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers"."TaxonomicClassifierID" IS 'Foreign key to TaxonomicClassifiers.';

COMMENT ON COLUMN "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers"."CitationID" IS 'Foreign key to the attribution, or Citation, for the classification.';

COMMENT ON TABLE "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers" IS 'This cross-reference table allows Taxonomic Classification of Specimens as an annotation, rather than as a Result.';


/******************** Add Table: "ODM2SamplingFeatures"."Specimens" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2SamplingFeatures"."Specimens"
(
	"SamplingFeatureID" INTEGER NOT NULL,
	"SpecimenTypeCV" VARCHAR(255) NOT NULL,
	"SpecimenMediumCV" VARCHAR(255) NOT NULL,
	"IsFieldSpecimen" BOOL NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2SamplingFeatures"."Specimens" ADD CONSTRAINT "pkSpecimens"
	PRIMARY KEY ("SamplingFeatureID");

/* Add Comments */
COMMENT ON COLUMN "ODM2SamplingFeatures"."Specimens"."SamplingFeatureID" IS 'Foreign key identifier for the Sampling Feature that is the specimen';

COMMENT ON COLUMN "ODM2SamplingFeatures"."Specimens"."SpecimenTypeCV" IS 'A CV term defining the type of specimen (e.g., aquatic sample, core, etc.)';

COMMENT ON COLUMN "ODM2SamplingFeatures"."Specimens"."SpecimenMediumCV" IS 'A CV term defining the medium of the specimen (i.e. water, sediment, etc.)';

COMMENT ON COLUMN "ODM2SamplingFeatures"."Specimens"."IsFieldSpecimen" IS 'A boolean indicating whether the specimen was collected in the field';

COMMENT ON TABLE "ODM2SamplingFeatures"."Specimens" IS 'Equivalent to O&M Sampling Feature Type "Specimen".  Describes physical samples or specimens.';


/******************** Add Table: "ODM2Sensors"."DataLoggerFiles" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Sensors"."DataLoggerFiles"
(
	"DataLoggerFileID" INTEGER NOT NULL,
	"ProgramID" INTEGER NOT NULL,
	"DataLoggerFileName" VARCHAR(255) NOT NULL,
	"DataLoggerFileDescription" VARCHAR(500) NULL,
	"DataLoggerFileLink" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Sensors"."DataLoggerFiles" ADD CONSTRAINT "pkDataLoggerFiles"
	PRIMARY KEY ("DataLoggerFileID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Sensors"."DataLoggerFiles"."DataLoggerFileID" IS 'Unique identifier for the datalogger file';

COMMENT ON COLUMN "ODM2Sensors"."DataLoggerFiles"."ProgramID" IS 'Foreign key identifier of the datalogger program that created the file';

COMMENT ON COLUMN "ODM2Sensors"."DataLoggerFiles"."DataLoggerFileName" IS 'Text name of the datalogger file';

COMMENT ON COLUMN "ODM2Sensors"."DataLoggerFiles"."DataLoggerFileDescription" IS 'Text description of the datalogger file';

COMMENT ON COLUMN "ODM2Sensors"."DataLoggerFiles"."DataLoggerFileLink" IS 'File path to the datalogger file';

COMMENT ON TABLE "ODM2Sensors"."DataLoggerFiles" IS 'Destibes datalogger files created by a deployment action';


/******************** Add Table: "ODM2Sensors"."DataloggerProgramFiles" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Sensors"."DataloggerProgramFiles"
(
	"ProgramID" INTEGER NOT NULL,
	"AffiliationID" INTEGER NOT NULL,
	"ProgramName" VARCHAR(255) NOT NULL,
	"ProgramDescription" VARCHAR(500) NULL,
	"ProgramVersion" VARCHAR(50) NULL,
	"ProgramFileLink" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Sensors"."DataloggerProgramFiles" ADD CONSTRAINT "pkDataloggerProgramFiles"
	PRIMARY KEY ("ProgramID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Sensors"."DataloggerProgramFiles"."ProgramID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Sensors"."DataloggerProgramFiles"."AffiliationID" IS 'Foreign key identifier of the person that created the program';

COMMENT ON COLUMN "ODM2Sensors"."DataloggerProgramFiles"."ProgramName" IS 'Text name of the datalogger program file';

COMMENT ON COLUMN "ODM2Sensors"."DataloggerProgramFiles"."ProgramDescription" IS 'Text description of the datalogger program file';

COMMENT ON COLUMN "ODM2Sensors"."DataloggerProgramFiles"."ProgramVersion" IS 'Text description of the version of the datalogger program file';

COMMENT ON COLUMN "ODM2Sensors"."DataloggerProgramFiles"."ProgramFileLink" IS 'URL or file path to the datalogger program file';

COMMENT ON TABLE "ODM2Sensors"."DataloggerProgramFiles" IS 'Information about datalogger program files';


/******************** Add Table: "ODM2Sensors"."DeploymentActions" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Sensors"."DeploymentActions"
(
	"ActionID" INTEGER NOT NULL,
	"DeploymentTypeCV" VARCHAR(255) NOT NULL,
	"CurrentlyDeployed" BOOL NOT NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Sensors"."DeploymentActions" ADD CONSTRAINT "pkDeploymentActions"
	PRIMARY KEY ("ActionID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Sensors"."DeploymentActions"."ActionID" IS 'Foreign key identifer for the Action that is the deployment';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentActions"."DeploymentTypeCV" IS 'CV term that describes the type of the deployment';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentActions"."CurrentlyDeployed" IS 'A boolean indicating whether a piece of equipment is currently deployed';

COMMENT ON TABLE "ODM2Sensors"."DeploymentActions" IS 'Describes actions that are deployment events';


/******************** Add Table: "ODM2Sensors"."DeploymentMeasuredVariables" ************************/

/* Build Table Structure */
CREATE TABLE "ODM2Sensors"."DeploymentMeasuredVariables"
(
	"DeploymentMeasuredVariableID" INTEGER NOT NULL,
	"ActionID" INTEGER NOT NULL,
	"InstrumentOutputVariableID" INTEGER NOT NULL,
	"DataloggerFileID" INTEGER NOT NULL,
	"ColumnLabel" VARCHAR(50) NULL,
	"ColumnDescription" VARCHAR(500) NULL,
	"MeasurementEquation" VARCHAR(255) NULL,
	"ScanInterval" FLOAT NULL,
	"ScanIntervalUnitsID" INTEGER NULL,
	"RecordingInterval" FLOAT NULL,
	"RecordingIntervalUnitsID" INTEGER NULL,
	"AggregationStatisticCV" VARCHAR(255) NULL
);

/* Add Primary Key */
ALTER TABLE "ODM2Sensors"."DeploymentMeasuredVariables" ADD CONSTRAINT "pkDeploymentMeasuredVariables"
	PRIMARY KEY ("DeploymentMeasuredVariableID");

/* Add Comments */
COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."DeploymentMeasuredVariableID" IS 'Primary key identifier';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."ActionID" IS 'Foreign key identifier of the Deployment Action associated with the DeploymentMeasuredVariable';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."InstrumentOutputVariableID" IS 'Foreign key identifier of the InstrumentOutputVariable that is the DeploymentMeasuredVariable';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."DataloggerFileID" IS 'Foreign key identifier of the DataloggerFile from in which the DeploymentMeasuredVariable is recorded';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."ColumnLabel" IS 'Text label of the column within the DataloggerFile that is the DeploymentMeasuredVariable';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."ColumnDescription" IS 'Text description of hte column within the DataloggerFile that is the DeploymentMeasuredVariable';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."MeasurementEquation" IS 'Text string that gives the equation (if any) associated with the DeploymentMeasuredVariable';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."ScanInterval" IS 'Numeric value of the scan interval';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."ScanIntervalUnitsID" IS 'Foreign key identifier of the units of the scan interval';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."RecordingInterval" IS 'Numeric value of the recording interval';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."RecordingIntervalUnitsID" IS 'Foreign key identifier of the units for the recording interval';

COMMENT ON COLUMN "ODM2Sensors"."DeploymentMeasuredVariables"."AggregationStatisticCV" IS 'Text aggregation statistic of the recorded value - chosen from a CV';

COMMENT ON TABLE "ODM2Sensors"."DeploymentMeasuredVariables" IS 'Inoformation about the variables measured by a deployment';





/************ Add Foreign Keys ***************/

/* Add Foreign Key: fk_ActionAnnotations_Actions */
ALTER TABLE "ODM2Annotations"."ActionAnnotations" ADD CONSTRAINT "fk_ActionAnnotations_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."ActionAnnotations" ADD CONSTRAINT "fk_ActionAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Annotations_Citations */
ALTER TABLE "ODM2Annotations"."Annotations" ADD CONSTRAINT "fk_Annotations_Citations"
	FOREIGN KEY ("CitationID") REFERENCES "ODM2Provenance"."Citations" ("CitationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Annotations_People */
ALTER TABLE "ODM2Annotations"."Annotations" ADD CONSTRAINT "fk_Annotations_People"
	FOREIGN KEY ("AnnotatorID") REFERENCES "ODM2Core"."People" ("PersonID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValueAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."CategoricalResultValueAnnotations" ADD CONSTRAINT "fk_CategoricalResultValueAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValueAnnotations_CategoricalResultValues */
ALTER TABLE "ODM2Annotations"."CategoricalResultValueAnnotations" ADD CONSTRAINT "fk_CategoricalResultValueAnnotations_CategoricalResultValues"
	FOREIGN KEY ("ValueID") REFERENCES "ODM2Results"."CategoricalResultValues" ("ValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."EquipmentAnnotations" ADD CONSTRAINT "fk_EquipmentAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentAnnotations_Equipment */
ALTER TABLE "ODM2Annotations"."EquipmentAnnotations" ADD CONSTRAINT "fk_EquipmentAnnotations_Equipment"
	FOREIGN KEY ("EquipmentID") REFERENCES "ODM2Equipment"."Equipment" ("EquipmentID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResultValueAnnotations_MeasurementResultValues */
ALTER TABLE "ODM2Annotations"."MeasurementResultValueAnnotations" ADD CONSTRAINT "fk_MeasurementResultValueAnnotations_MeasurementResultValues"
	FOREIGN KEY ("ValueID") REFERENCES "ODM2Results"."MeasurementResultValues" ("ValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultValueAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."MeasurementResultValueAnnotations" ADD CONSTRAINT "fk_ResultValueAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."MethodAnnotations" ADD CONSTRAINT "fk_MethodAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodAnnotations_Methods */
ALTER TABLE "ODM2Annotations"."MethodAnnotations" ADD CONSTRAINT "fk_MethodAnnotations_Methods"
	FOREIGN KEY ("MethodID") REFERENCES "ODM2Core"."Methods" ("MethodID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValueAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."PointCoverageResultValueAnnotations" ADD CONSTRAINT "fk_PointCoverageResultValueAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValueAnnotations_PointCoverageResultValues */
ALTER TABLE "ODM2Annotations"."PointCoverageResultValueAnnotations" ADD CONSTRAINT "fk_PointCoverageResultValueAnnotations_PointCoverageResultValues"
	FOREIGN KEY ("ValueID") REFERENCES "ODM2Results"."PointCoverageResultValues" ("ValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValueAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."ProfileResultValueAnnotations" ADD CONSTRAINT "fk_ProfileResultValueAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValueAnnotations_ProfileResultValues */
ALTER TABLE "ODM2Annotations"."ProfileResultValueAnnotations" ADD CONSTRAINT "fk_ProfileResultValueAnnotations_ProfileResultValues"
	FOREIGN KEY ("ValueID") REFERENCES "ODM2Results"."ProfileResultValues" ("ValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."ResultAnnotations" ADD CONSTRAINT "fk_ResultAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultAnnotations_Results */
ALTER TABLE "ODM2Annotations"."ResultAnnotations" ADD CONSTRAINT "fk_ResultAnnotations_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."SamplingFeatureAnnotations" ADD CONSTRAINT "fk_SamplingFeatureAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureAnnotations_SamplingFeatures */
ALTER TABLE "ODM2Annotations"."SamplingFeatureAnnotations" ADD CONSTRAINT "fk_SamplingFeatureAnnotations_SamplingFeatures"
	FOREIGN KEY ("SamplingFeatureID") REFERENCES "ODM2Core"."SamplingFeatures" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValueAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."SectionResultValueAnnotations" ADD CONSTRAINT "fk_SectionResultValueAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValueAnnotations_SectionResultValues */
ALTER TABLE "ODM2Annotations"."SectionResultValueAnnotations" ADD CONSTRAINT "fk_SectionResultValueAnnotations_SectionResultValues"
	FOREIGN KEY ("ValueID") REFERENCES "ODM2Results"."SectionResultValues" ("ValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValueAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."SpectraResultValueAnnotations" ADD CONSTRAINT "fk_SpectraResultValueAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValueAnnotations_SpectraResultValues */
ALTER TABLE "ODM2Annotations"."SpectraResultValueAnnotations" ADD CONSTRAINT "fk_SpectraResultValueAnnotations_SpectraResultValues"
	FOREIGN KEY ("ValueID") REFERENCES "ODM2Results"."SpectraResultValues" ("ValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValueAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."TimeSeriesResultValueAnnotations" ADD CONSTRAINT "fk_TimeSeriesResultValueAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues */
ALTER TABLE "ODM2Annotations"."TimeSeriesResultValueAnnotations" ADD CONSTRAINT "fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues"
	FOREIGN KEY ("ValueID") REFERENCES "ODM2Results"."TimeSeriesResultValues" ("ValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValueAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."TrajectoryResultValueAnnotations" ADD CONSTRAINT "fk_TrajectoryResultValueAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValueAnnotations_TrajectoryResultValues */
ALTER TABLE "ODM2Annotations"."TrajectoryResultValueAnnotations" ADD CONSTRAINT "fk_TrajectoryResultValueAnnotations_TrajectoryResultValues"
	FOREIGN KEY ("ValueID") REFERENCES "ODM2Results"."TrajectoryResultValues" ("ValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValueAnnotations_Annotations */
ALTER TABLE "ODM2Annotations"."TransectResultValueAnnotations" ADD CONSTRAINT "fk_TransectResultValueAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValueAnnotations_TransectResultValues */
ALTER TABLE "ODM2Annotations"."TransectResultValueAnnotations" ADD CONSTRAINT "fk_TransectResultValueAnnotations_TransectResultValues"
	FOREIGN KEY ("ValueID") REFERENCES "ODM2Results"."TransectResultValues" ("ValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Actions */
ALTER TABLE "ODM2Core"."ActionBy" ADD CONSTRAINT "fk_ActionPeople_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionPeople_Affiliations */
ALTER TABLE "ODM2Core"."ActionBy" ADD CONSTRAINT "fk_ActionPeople_Affiliations"
	FOREIGN KEY ("AffiliationID") REFERENCES "ODM2Core"."Affiliations" ("AffiliationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Actions_Methods */
ALTER TABLE "ODM2Core"."Actions" ADD CONSTRAINT "fk_Actions_Methods"
	FOREIGN KEY ("MethodID") REFERENCES "ODM2Core"."Methods" ("MethodID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Affiliations_Organizations */
ALTER TABLE "ODM2Core"."Affiliations" ADD CONSTRAINT "fk_Affiliations_Organizations"
	FOREIGN KEY ("OrganizationID") REFERENCES "ODM2Core"."Organizations" ("OrganizationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Affiliations_People */
ALTER TABLE "ODM2Core"."Affiliations" ADD CONSTRAINT "fk_Affiliations_People"
	FOREIGN KEY ("PersonID") REFERENCES "ODM2Core"."People" ("PersonID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetsResults_DataSets */
ALTER TABLE "ODM2Core"."DataSetsResults" ADD CONSTRAINT "fk_DataSetsResults_DataSets"
	FOREIGN KEY ("DataSetID") REFERENCES "ODM2Core"."DataSets" ("DataSetID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetsResults_Results */
ALTER TABLE "ODM2Core"."DataSetsResults" ADD CONSTRAINT "fk_DataSetsResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureActions_Actions */
ALTER TABLE "ODM2Core"."FeatureActions" ADD CONSTRAINT "fk_FeatureActions_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureActions_SamplingFeatures */
ALTER TABLE "ODM2Core"."FeatureActions" ADD CONSTRAINT "fk_FeatureActions_SamplingFeatures"
	FOREIGN KEY ("SamplingFeatureID") REFERENCES "ODM2Core"."SamplingFeatures" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Methods_Organizations */
ALTER TABLE "ODM2Core"."Methods" ADD CONSTRAINT "fk_Methods_Organizations"
	FOREIGN KEY ("OrganizationID") REFERENCES "ODM2Core"."Organizations" ("OrganizationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Organizations_Organizations */
ALTER TABLE "ODM2Core"."Organizations" ADD CONSTRAINT "fk_Organizations_Organizations"
	FOREIGN KEY ("ParentOrganizationID") REFERENCES "ODM2Core"."Organizations" ("OrganizationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedActions_Actions */
ALTER TABLE "ODM2Core"."RelatedActions" ADD CONSTRAINT "fk_RelatedActions_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedActions_Actions_AreRelated */
ALTER TABLE "ODM2Core"."RelatedActions" ADD CONSTRAINT "fk_RelatedActions_Actions_AreRelated"
	FOREIGN KEY ("RelatedActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_FeatureActions */
ALTER TABLE "ODM2Core"."Results" ADD CONSTRAINT "fk_Results_FeatureActions"
	FOREIGN KEY ("FeatureActionID") REFERENCES "ODM2Core"."FeatureActions" ("FeatureActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_ProcessingLevels */
ALTER TABLE "ODM2Core"."Results" ADD CONSTRAINT "fk_Results_ProcessingLevels"
	FOREIGN KEY ("ProcessingLevelID") REFERENCES "ODM2Core"."ProcessingLevels" ("ProcessingLevelID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_ResultTypeCV */
ALTER TABLE "ODM2Core"."Results" ADD CONSTRAINT "fk_Results_ResultTypeCV"
	FOREIGN KEY ("ResultTypeCV") REFERENCES "ODM2Results"."ResultTypeCV" ("ResultTypeCV")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_TaxonomicClassifiers */
ALTER TABLE "ODM2Core"."Results" ADD CONSTRAINT "fk_Results_TaxonomicClassifiers"
	FOREIGN KEY ("TaxonomicClassifierID") REFERENCES "ODM2Core"."TaxonomicClassifiers" ("TaxonomicClassifierID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Units */
ALTER TABLE "ODM2Core"."Results" ADD CONSTRAINT "fk_Results_Units"
	FOREIGN KEY ("UnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Results_Variables */
ALTER TABLE "ODM2Core"."Results" ADD CONSTRAINT "fk_Results_Variables"
	FOREIGN KEY ("VariableID") REFERENCES "ODM2Core"."Variables" ("VariableID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ParentTaxon_Taxon */
ALTER TABLE "ODM2Core"."TaxonomicClassifiers" ADD CONSTRAINT "fk_ParentTaxon_Taxon"
	FOREIGN KEY ("ParentTaxonomicClassifierID") REFERENCES "ODM2Core"."TaxonomicClassifiers" ("TaxonomicClassifierID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataQuality_Units */
ALTER TABLE "ODM2DataQuality"."DataQuality" ADD CONSTRAINT "fk_DataQuality_Units"
	FOREIGN KEY ("DataQualityValueUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Citations */
ALTER TABLE "ODM2DataQuality"."ReferenceMaterialValues" ADD CONSTRAINT "fk_ReferenceMaterialValues_Citations"
	FOREIGN KEY ("CitationID") REFERENCES "ODM2Provenance"."Citations" ("CitationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_ReferenceMaterials */
ALTER TABLE "ODM2DataQuality"."ReferenceMaterialValues" ADD CONSTRAINT "fk_ReferenceMaterialValues_ReferenceMaterials"
	FOREIGN KEY ("ReferenceMaterialID") REFERENCES "ODM2DataQuality"."ReferenceMaterials" ("ReferenceMaterialID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Units */
ALTER TABLE "ODM2DataQuality"."ReferenceMaterialValues" ADD CONSTRAINT "fk_ReferenceMaterialValues_Units"
	FOREIGN KEY ("UnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterialValues_Variables */
ALTER TABLE "ODM2DataQuality"."ReferenceMaterialValues" ADD CONSTRAINT "fk_ReferenceMaterialValues_Variables"
	FOREIGN KEY ("VariableID") REFERENCES "ODM2Core"."Variables" ("VariableID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterials_Organizations */
ALTER TABLE "ODM2DataQuality"."ReferenceMaterials" ADD CONSTRAINT "fk_ReferenceMaterials_Organizations"
	FOREIGN KEY ("ReferenceMaterialOrganizationID") REFERENCES "ODM2Core"."Organizations" ("OrganizationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ReferenceMaterials_SamplingFeatures */
ALTER TABLE "ODM2DataQuality"."ReferenceMaterials" ADD CONSTRAINT "fk_ReferenceMaterials_SamplingFeatures"
	FOREIGN KEY ("SamplingFeatureID") REFERENCES "ODM2Core"."SamplingFeatures" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultNormalizationValues_ReferenceMaterialValues */
ALTER TABLE "ODM2DataQuality"."ResultNormalizationValues" ADD CONSTRAINT "fk_ResultNormalizationValues_ReferenceMaterialValues"
	FOREIGN KEY ("NormalizedByReferenceMaterialValueID") REFERENCES "ODM2DataQuality"."ReferenceMaterialValues" ("ReferenceMaterialValueID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultNormalizationValues_Results */
ALTER TABLE "ODM2DataQuality"."ResultNormalizationValues" ADD CONSTRAINT "fk_ResultNormalizationValues_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsDataQuality_DataQuality */
ALTER TABLE "ODM2DataQuality"."ResultsDataQuality" ADD CONSTRAINT "fk_ResultsDataQuality_DataQuality"
	FOREIGN KEY ("DataQualityID") REFERENCES "ODM2DataQuality"."DataQuality" ("DataQualityID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultsDataQuality_Results */
ALTER TABLE "ODM2DataQuality"."ResultsDataQuality" ADD CONSTRAINT "fk_ResultsDataQuality_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibratedDeploymentVariables_Actions */
ALTER TABLE "ODM2Equipment"."CalibratedDeploymentVariables" ADD CONSTRAINT "fk_CalibratedDeploymentVariables_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibratedDeploymentVariables_DeploymentMeasuredVariables */
ALTER TABLE "ODM2Equipment"."CalibratedDeploymentVariables" ADD CONSTRAINT "fk_CalibratedDeploymentVariables_DeploymentMeasuredVariables"
	FOREIGN KEY ("DeploymentMeasuredVariableID") REFERENCES "ODM2Sensors"."DeploymentMeasuredVariables" ("DeploymentMeasuredVariableID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationEquations_Actions */
ALTER TABLE "ODM2Equipment"."CalibrationEquations" ADD CONSTRAINT "fk_CalibrationEquations_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CalibrationEquations_InstrumentOutputVariables */
ALTER TABLE "ODM2Equipment"."CalibrationEquations" ADD CONSTRAINT "fk_CalibrationEquations_InstrumentOutputVariables"
	FOREIGN KEY ("InstrumentOutputVariableID") REFERENCES "ODM2Equipment"."InstrumentOutputVariables" ("InstrumentOutputVariableID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FieldCalibrationStandards_Actions */
ALTER TABLE "ODM2Equipment"."CalibrationStandards" ADD CONSTRAINT "fk_FieldCalibrationStandards_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FieldCalibrationStandards_ReferenceMaterials */
ALTER TABLE "ODM2Equipment"."CalibrationStandards" ADD CONSTRAINT "fk_FieldCalibrationStandards_ReferenceMaterials"
	FOREIGN KEY ("ReferenceMaterialID") REFERENCES "ODM2DataQuality"."ReferenceMaterials" ("ReferenceMaterialID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_EquipmentModels */
ALTER TABLE "ODM2Equipment"."Equipment" ADD CONSTRAINT "fk_Equipment_EquipmentModels"
	FOREIGN KEY ("EquipmentModelID") REFERENCES "ODM2Equipment"."EquipmentModels" ("EquipmentModelID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_Organizations */
ALTER TABLE "ODM2Equipment"."Equipment" ADD CONSTRAINT "fk_Equipment_Organizations"
	FOREIGN KEY ("EquipmentVendorID") REFERENCES "ODM2Core"."Organizations" ("OrganizationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Equipment_People */
ALTER TABLE "ODM2Equipment"."Equipment" ADD CONSTRAINT "fk_Equipment_People"
	FOREIGN KEY ("EquipmentOwnerID") REFERENCES "ODM2Core"."People" ("PersonID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentActions_Actions */
ALTER TABLE "ODM2Equipment"."EquipmentActions" ADD CONSTRAINT "fk_EquipmentActions_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentActions_Equipment */
ALTER TABLE "ODM2Equipment"."EquipmentActions" ADD CONSTRAINT "fk_EquipmentActions_Equipment"
	FOREIGN KEY ("EquipmentID") REFERENCES "ODM2Equipment"."Equipment" ("EquipmentID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_EquipmentModels_Organizations */
ALTER TABLE "ODM2Equipment"."EquipmentModels" ADD CONSTRAINT "fk_EquipmentModels_Organizations"
	FOREIGN KEY ("ModelManufacturerID") REFERENCES "ODM2Core"."Organizations" ("OrganizationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_EquipmentModels */
ALTER TABLE "ODM2Equipment"."InstrumentOutputVariables" ADD CONSTRAINT "fk_InstrumentOutputVariables_EquipmentModels"
	FOREIGN KEY ("ModelID") REFERENCES "ODM2Equipment"."EquipmentModels" ("EquipmentModelID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Methods */
ALTER TABLE "ODM2Equipment"."InstrumentOutputVariables" ADD CONSTRAINT "fk_InstrumentOutputVariables_Methods"
	FOREIGN KEY ("InstrumentMethodID") REFERENCES "ODM2Core"."Methods" ("MethodID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Units */
ALTER TABLE "ODM2Equipment"."InstrumentOutputVariables" ADD CONSTRAINT "fk_InstrumentOutputVariables_Units"
	FOREIGN KEY ("InstrumentRawOutputUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_InstrumentOutputVariables_Variables */
ALTER TABLE "ODM2Equipment"."InstrumentOutputVariables" ADD CONSTRAINT "fk_InstrumentOutputVariables_Variables"
	FOREIGN KEY ("VariableID") REFERENCES "ODM2Core"."Variables" ("VariableID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MaintenanceActions_Actions */
ALTER TABLE "ODM2Equipment"."MaintenanceActions" ADD CONSTRAINT "fk_MaintenanceActions_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedEquipment_Equipment */
ALTER TABLE "ODM2Equipment"."RelatedEquipment" ADD CONSTRAINT "fk_RelatedEquipment_Equipment"
	FOREIGN KEY ("EquipmentID") REFERENCES "ODM2Equipment"."Equipment" ("EquipmentID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedEquipment_Equipment_AreRelated */
ALTER TABLE "ODM2Equipment"."RelatedEquipment" ADD CONSTRAINT "fk_RelatedEquipment_Equipment_AreRelated"
	FOREIGN KEY ("RelatedEquipmentID") REFERENCES "ODM2Equipment"."Equipment" ("EquipmentID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionExtensionPropertyValues_Actions */
ALTER TABLE "ODM2ExtensionProperties"."ActionExtensionPropertyValues" ADD CONSTRAINT "fk_ActionExtensionPropertyValues_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionExtensionPropertyValues_ExtensionProperties */
ALTER TABLE "ODM2ExtensionProperties"."ActionExtensionPropertyValues" ADD CONSTRAINT "fk_ActionExtensionPropertyValues_ExtensionProperties"
	FOREIGN KEY ("PropertyID") REFERENCES "ODM2ExtensionProperties"."ExtensionProperties" ("PropertyID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExtensionPropertyValues_Citations */
ALTER TABLE "ODM2ExtensionProperties"."CitationExtensionPropertyValues" ADD CONSTRAINT "fk_CitationExtensionPropertyValues_Citations"
	FOREIGN KEY ("CitationID") REFERENCES "ODM2Provenance"."Citations" ("CitationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExtensionPropertyValues_ExtensionProperties */
ALTER TABLE "ODM2ExtensionProperties"."CitationExtensionPropertyValues" ADD CONSTRAINT "fk_CitationExtensionPropertyValues_ExtensionProperties"
	FOREIGN KEY ("PropertyID") REFERENCES "ODM2ExtensionProperties"."ExtensionProperties" ("PropertyID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExtensionProperties_Units */
ALTER TABLE "ODM2ExtensionProperties"."ExtensionProperties" ADD CONSTRAINT "fk_ExtensionProperties_Units"
	FOREIGN KEY ("PropertyUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_ExtensionProperties */
ALTER TABLE "ODM2ExtensionProperties"."MethodExtensionPropertyValues" ADD CONSTRAINT "fk_MethodExtensionPropertyValues_ExtensionProperties"
	FOREIGN KEY ("PropertyID") REFERENCES "ODM2ExtensionProperties"."ExtensionProperties" ("PropertyID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExtensionPropertyValues_Methods */
ALTER TABLE "ODM2ExtensionProperties"."MethodExtensionPropertyValues" ADD CONSTRAINT "fk_MethodExtensionPropertyValues_Methods"
	FOREIGN KEY ("MethodID") REFERENCES "ODM2Core"."Methods" ("MethodID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultExtensionPropertyValues_ExtensionProperties */
ALTER TABLE "ODM2ExtensionProperties"."ResultExtensionPropertyValues" ADD CONSTRAINT "fk_ResultExtensionPropertyValues_ExtensionProperties"
	FOREIGN KEY ("PropertyID") REFERENCES "ODM2ExtensionProperties"."ExtensionProperties" ("PropertyID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultExtensionPropertyValues_Results */
ALTER TABLE "ODM2ExtensionProperties"."ResultExtensionPropertyValues" ADD CONSTRAINT "fk_ResultExtensionPropertyValues_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties */
ALTER TABLE "ODM2ExtensionProperties"."SamplingFeatureExtensionPropertyValues" ADD CONSTRAINT "fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties"
	FOREIGN KEY ("PropertyID") REFERENCES "ODM2ExtensionProperties"."ExtensionProperties" ("PropertyID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures */
ALTER TABLE "ODM2ExtensionProperties"."SamplingFeatureExtensionPropertyValues" ADD CONSTRAINT "fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures"
	FOREIGN KEY ("SamplingFeatureID") REFERENCES "ODM2Core"."SamplingFeatures" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_ExtensionProperties */
ALTER TABLE "ODM2ExtensionProperties"."VariableExtensionPropertyValues" ADD CONSTRAINT "fk_VariableExtensionPropertyValues_ExtensionProperties"
	FOREIGN KEY ("PropertyID") REFERENCES "ODM2ExtensionProperties"."ExtensionProperties" ("PropertyID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExtensionPropertyValues_Variables */
ALTER TABLE "ODM2ExtensionProperties"."VariableExtensionPropertyValues" ADD CONSTRAINT "fk_VariableExtensionPropertyValues_Variables"
	FOREIGN KEY ("VariableID") REFERENCES "ODM2Core"."Variables" ("VariableID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExternalIdentifiers_Citations */
ALTER TABLE "ODM2ExternalIdentifiers"."CitationExternalIdentifiers" ADD CONSTRAINT "fk_CitationExternalIdentifiers_Citations"
	FOREIGN KEY ("CitationID") REFERENCES "ODM2Provenance"."Citations" ("CitationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CitationExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE "ODM2ExternalIdentifiers"."CitationExternalIdentifiers" ADD CONSTRAINT "fk_CitationExternalIdentifiers_ExternalIdentifierSystems"
	FOREIGN KEY ("ExternalIdentifierSystemID") REFERENCES "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ("ExternalIdentifierSystemID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ExternalIdentifierSystems_Organizations */
ALTER TABLE "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ADD CONSTRAINT "fk_ExternalIdentifierSystems_Organizations"
	FOREIGN KEY ("IdentifierSystemOrganizationID") REFERENCES "ODM2Core"."Organizations" ("OrganizationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE "ODM2ExternalIdentifiers"."MethodExternalIdentifiers" ADD CONSTRAINT "fk_MethodExternalIdentifiers_ExternalIdentifierSystems"
	FOREIGN KEY ("ExternalIdentifierSystemID") REFERENCES "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ("ExternalIdentifierSystemID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodExternalIdentifiers_Methods */
ALTER TABLE "ODM2ExternalIdentifiers"."MethodExternalIdentifiers" ADD CONSTRAINT "fk_MethodExternalIdentifiers_Methods"
	FOREIGN KEY ("MethodID") REFERENCES "ODM2Core"."Methods" ("MethodID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PersonExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE "ODM2ExternalIdentifiers"."PersonExternalIdentifiers" ADD CONSTRAINT "fk_PersonExternalIdentifiers_ExternalIdentifierSystems"
	FOREIGN KEY ("ExternalIdentifierSystemID") REFERENCES "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ("ExternalIdentifierSystemID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PersonExternalIdentifiers_People */
ALTER TABLE "ODM2ExternalIdentifiers"."PersonExternalIdentifiers" ADD CONSTRAINT "fk_PersonExternalIdentifiers_People"
	FOREIGN KEY ("PersonID") REFERENCES "ODM2Core"."People" ("PersonID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RefMaterialExtIdentifiers_ExtIdentifierSystems */
ALTER TABLE "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers" ADD CONSTRAINT "fk_RefMaterialExtIdentifiers_ExtIdentifierSystems"
	FOREIGN KEY ("ExternalIdentifierSystemID") REFERENCES "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ("ExternalIdentifierSystemID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RefMaterialExtIdentifiers_RefMaterials */
ALTER TABLE "ODM2ExternalIdentifiers"."ReferenceMaterialExternalIdentifiers" ADD CONSTRAINT "fk_RefMaterialExtIdentifiers_RefMaterials"
	FOREIGN KEY ("ReferenceMaterialID") REFERENCES "ODM2DataQuality"."ReferenceMaterials" ("ReferenceMaterialID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers" ADD CONSTRAINT "fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems"
	FOREIGN KEY ("ExternalIdentifierSystemID") REFERENCES "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ("ExternalIdentifierSystemID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SamplingFeatureExternalIdentifiers_SamplingFeatures */
ALTER TABLE "ODM2ExternalIdentifiers"."SamplingFeatureExternalIdentifiers" ADD CONSTRAINT "fk_SamplingFeatureExternalIdentifiers_SamplingFeatures"
	FOREIGN KEY ("SamplingFeatureID") REFERENCES "ODM2Core"."SamplingFeatures" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE "ODM2ExternalIdentifiers"."SpatialReferenceExternalIdentifiers" ADD CONSTRAINT "fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems"
	FOREIGN KEY ("ExternalIdentifierSystemID") REFERENCES "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ("ExternalIdentifierSystemID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpatialReferenceExternalIdentifiers_SpatialReferences */
ALTER TABLE "ODM2ExternalIdentifiers"."SpatialReferenceExternalIdentifiers" ADD CONSTRAINT "fk_SpatialReferenceExternalIdentifiers_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TaxonomicClassifierExtIDs_ExtIDSystems */
ALTER TABLE "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers" ADD CONSTRAINT "fk_TaxonomicClassifierExtIDs_ExtIDSystems"
	FOREIGN KEY ("ExternalIdentifierSystemID") REFERENCES "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ("ExternalIdentifierSystemID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers */
ALTER TABLE "ODM2ExternalIdentifiers"."TaxonomicClassifierExternalIdentifiers" ADD CONSTRAINT "fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers"
	FOREIGN KEY ("TaxonomicClassifierID") REFERENCES "ODM2Core"."TaxonomicClassifiers" ("TaxonomicClassifierID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExternalIdentifiers_ExternalIdentifierSystems */
ALTER TABLE "ODM2ExternalIdentifiers"."VariableExternalIdentifiers" ADD CONSTRAINT "fk_VariableExternalIdentifiers_ExternalIdentifierSystems"
	FOREIGN KEY ("ExternalIdentifierSystemID") REFERENCES "ODM2ExternalIdentifiers"."ExternalIdentifierSystems" ("ExternalIdentifierSystemID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_VariableExternalIdentifiers_Variables */
ALTER TABLE "ODM2ExternalIdentifiers"."VariableExternalIdentifiers" ADD CONSTRAINT "fk_VariableExternalIdentifiers_Variables"
	FOREIGN KEY ("VariableID") REFERENCES "ODM2Core"."Variables" ("VariableID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionDirectives_Actions */
ALTER TABLE "ODM2LabAnalyses"."ActionDirectives" ADD CONSTRAINT "fk_ActionDirectives_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ActionDirectives_Directives */
ALTER TABLE "ODM2LabAnalyses"."ActionDirectives" ADD CONSTRAINT "fk_ActionDirectives_Directives"
	FOREIGN KEY ("DirectiveID") REFERENCES "ODM2LabAnalyses"."Directives" ("DirectiveID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenBatchPostions_FeatureActions */
ALTER TABLE "ODM2LabAnalyses"."SpecimenBatchPostions" ADD CONSTRAINT "fk_SpecimenBatchPostions_FeatureActions"
	FOREIGN KEY ("FeatureActionID") REFERENCES "ODM2Core"."FeatureActions" ("FeatureActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AuthorLists_Citations */
ALTER TABLE "ODM2Provenance"."AuthorLists" ADD CONSTRAINT "fk_AuthorLists_Citations"
	FOREIGN KEY ("CitationID") REFERENCES "ODM2Provenance"."Citations" ("CitationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_AuthorLists_People */
ALTER TABLE "ODM2Provenance"."AuthorLists" ADD CONSTRAINT "fk_AuthorLists_People"
	FOREIGN KEY ("PersonID") REFERENCES "ODM2Core"."People" ("PersonID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetCitations_Citations */
ALTER TABLE "ODM2Provenance"."DataSetCitations" ADD CONSTRAINT "fk_DataSetCitations_Citations"
	FOREIGN KEY ("CitationID") REFERENCES "ODM2Provenance"."Citations" ("CitationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataSetCitations_DataSets */
ALTER TABLE "ODM2Provenance"."DataSetCitations" ADD CONSTRAINT "fk_DataSetCitations_DataSets"
	FOREIGN KEY ("DataSetID") REFERENCES "ODM2Core"."DataSets" ("DataSetID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodCitations_Citations */
ALTER TABLE "ODM2Provenance"."MethodCitations" ADD CONSTRAINT "fk_MethodCitations_Citations"
	FOREIGN KEY ("CitationID") REFERENCES "ODM2Provenance"."Citations" ("CitationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MethodCitations_Methods */
ALTER TABLE "ODM2Provenance"."MethodCitations" ADD CONSTRAINT "fk_MethodCitations_Methods"
	FOREIGN KEY ("MethodID") REFERENCES "ODM2Core"."Methods" ("MethodID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedAnnotations_Annotations */
ALTER TABLE "ODM2Provenance"."RelatedAnnotations" ADD CONSTRAINT "fk_RelatedAnnotations_Annotations"
	FOREIGN KEY ("AnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedAnnotations_Annotations_AreRelated */
ALTER TABLE "ODM2Provenance"."RelatedAnnotations" ADD CONSTRAINT "fk_RelatedAnnotations_Annotations_AreRelated"
	FOREIGN KEY ("RelatedAnnotationID") REFERENCES "ODM2Annotations"."Annotations" ("AnnotationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedCitations_Citations */
ALTER TABLE "ODM2Provenance"."RelatedCitations" ADD CONSTRAINT "fk_RelatedCitations_Citations"
	FOREIGN KEY ("CitationID") REFERENCES "ODM2Provenance"."Citations" ("CitationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedCitations_Citations_AreRelated */
ALTER TABLE "ODM2Provenance"."RelatedCitations" ADD CONSTRAINT "fk_RelatedCitations_Citations_AreRelated"
	FOREIGN KEY ("RelatedCitationID") REFERENCES "ODM2Provenance"."Citations" ("CitationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedDatasets_DataSets */
ALTER TABLE "ODM2Provenance"."RelatedDatasets" ADD CONSTRAINT "fk_RelatedDatasets_DataSets"
	FOREIGN KEY ("DataSetID") REFERENCES "ODM2Core"."DataSets" ("DataSetID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedDatasets_DataSets_AreRelated */
ALTER TABLE "ODM2Provenance"."RelatedDatasets" ADD CONSTRAINT "fk_RelatedDatasets_DataSets_AreRelated"
	FOREIGN KEY ("RelatedDatasetID") REFERENCES "ODM2Core"."DataSets" ("DataSetID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results */
ALTER TABLE "ODM2Provenance"."RelatedResults" ADD CONSTRAINT "fk_RelatedResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_RelatedResults_Results_AreRelated */
ALTER TABLE "ODM2Provenance"."RelatedResults" ADD CONSTRAINT "fk_RelatedResults_Results_AreRelated"
	FOREIGN KEY ("RelatedResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultDerivationEquations_DerivationEquations */
ALTER TABLE "ODM2Provenance"."ResultDerivationEquations" ADD CONSTRAINT "fk_ResultDerivationEquations_DerivationEquations"
	FOREIGN KEY ("DerivationEquationID") REFERENCES "ODM2Provenance"."DerivationEquations" ("DerivationEquationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ResultDerivationEquations_Results */
ALTER TABLE "ODM2Provenance"."ResultDerivationEquations" ADD CONSTRAINT "fk_ResultDerivationEquations_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResultValues_CategoricalResults */
ALTER TABLE "ODM2Results"."CategoricalResultValues" ADD CONSTRAINT "fk_CategoricalResultValues_CategoricalResults"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Results"."CategoricalResults" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResults_Results */
ALTER TABLE "ODM2Results"."CategoricalResults" ADD CONSTRAINT "fk_CategoricalResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_CategoricalResults_SpatialReferences */
ALTER TABLE "ODM2Results"."CategoricalResults" ADD CONSTRAINT "fk_CategoricalResults_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResultValues_MeasurementResults */
ALTER TABLE "ODM2Results"."MeasurementResultValues" ADD CONSTRAINT "fk_MeasurementResultValues_MeasurementResults"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Results"."MeasurementResults" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_AIUnits */
ALTER TABLE "ODM2Results"."MeasurementResults" ADD CONSTRAINT "fk_MeasurementResults_AIUnits"
	FOREIGN KEY ("TimeAggregationIntervalUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_Results */
ALTER TABLE "ODM2Results"."MeasurementResults" ADD CONSTRAINT "fk_MeasurementResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_SpatialReferences */
ALTER TABLE "ODM2Results"."MeasurementResults" ADD CONSTRAINT "fk_MeasurementResults_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_XUnits */
ALTER TABLE "ODM2Results"."MeasurementResults" ADD CONSTRAINT "fk_MeasurementResults_XUnits"
	FOREIGN KEY ("XLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_YUnits */
ALTER TABLE "ODM2Results"."MeasurementResults" ADD CONSTRAINT "fk_MeasurementResults_YUnits"
	FOREIGN KEY ("YLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_MeasurementResults_ZUnits */
ALTER TABLE "ODM2Results"."MeasurementResults" ADD CONSTRAINT "fk_MeasurementResults_ZUnits"
	FOREIGN KEY ("ZLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_PointCoverageResults */
ALTER TABLE "ODM2Results"."PointCoverageResultValues" ADD CONSTRAINT "fk_PointCoverageResultValues_PointCoverageResults"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Results"."PointCoverageResults" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_XUnits */
ALTER TABLE "ODM2Results"."PointCoverageResultValues" ADD CONSTRAINT "fk_PointCoverageResultValues_XUnits"
	FOREIGN KEY ("XLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResultValues_YUnits */
ALTER TABLE "ODM2Results"."PointCoverageResultValues" ADD CONSTRAINT "fk_PointCoverageResultValues_YUnits"
	FOREIGN KEY ("YLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_Results */
ALTER TABLE "ODM2Results"."PointCoverageResults" ADD CONSTRAINT "fk_PointCoverageResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_SpatialReferences */
ALTER TABLE "ODM2Results"."PointCoverageResults" ADD CONSTRAINT "fk_PointCoverageResults_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_XUnits */
ALTER TABLE "ODM2Results"."PointCoverageResults" ADD CONSTRAINT "fk_PointCoverageResults_XUnits"
	FOREIGN KEY ("IntendedXSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_YUnits */
ALTER TABLE "ODM2Results"."PointCoverageResults" ADD CONSTRAINT "fk_PointCoverageResults_YUnits"
	FOREIGN KEY ("IntendedYSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_PointCoverageResults_ZUnits */
ALTER TABLE "ODM2Results"."PointCoverageResults" ADD CONSTRAINT "fk_PointCoverageResults_ZUnits"
	FOREIGN KEY ("ZLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_AIUnits */
ALTER TABLE "ODM2Results"."ProfileResultValues" ADD CONSTRAINT "fk_ProfileResultValues_AIUnits"
	FOREIGN KEY ("TimeAggregationIntervalUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_DUnits */
ALTER TABLE "ODM2Results"."ProfileResultValues" ADD CONSTRAINT "fk_ProfileResultValues_DUnits"
	FOREIGN KEY ("ZLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResultValues_ProfileResults */
ALTER TABLE "ODM2Results"."ProfileResultValues" ADD CONSTRAINT "fk_ProfileResultValues_ProfileResults"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Results"."ProfileResults" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_DUnits */
ALTER TABLE "ODM2Results"."ProfileResults" ADD CONSTRAINT "fk_ProfileResults_DUnits"
	FOREIGN KEY ("IntendedZSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_Results */
ALTER TABLE "ODM2Results"."ProfileResults" ADD CONSTRAINT "fk_ProfileResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_SpatialReferences */
ALTER TABLE "ODM2Results"."ProfileResults" ADD CONSTRAINT "fk_ProfileResults_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_TUnits */
ALTER TABLE "ODM2Results"."ProfileResults" ADD CONSTRAINT "fk_ProfileResults_TUnits"
	FOREIGN KEY ("IntendedTimeSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_XUnits */
ALTER TABLE "ODM2Results"."ProfileResults" ADD CONSTRAINT "fk_ProfileResults_XUnits"
	FOREIGN KEY ("XLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_ProfileResults_YUnits */
ALTER TABLE "ODM2Results"."ProfileResults" ADD CONSTRAINT "fk_ProfileResults_YUnits"
	FOREIGN KEY ("YLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_AIUnits */
ALTER TABLE "ODM2Results"."SectionResultValues" ADD CONSTRAINT "fk_SectionResultValues_AIUnits"
	FOREIGN KEY ("TimeAggregationIntervalUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_SectionResults */
ALTER TABLE "ODM2Results"."SectionResultValues" ADD CONSTRAINT "fk_SectionResultValues_SectionResults"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Results"."SectionResults" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_XUnits */
ALTER TABLE "ODM2Results"."SectionResultValues" ADD CONSTRAINT "fk_SectionResultValues_XUnits"
	FOREIGN KEY ("XLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResultValues_ZUnits */
ALTER TABLE "ODM2Results"."SectionResultValues" ADD CONSTRAINT "fk_SectionResultValues_ZUnits"
	FOREIGN KEY ("ZLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_Results */
ALTER TABLE "ODM2Results"."SectionResults" ADD CONSTRAINT "fk_SectionResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_SpatialReferences */
ALTER TABLE "ODM2Results"."SectionResults" ADD CONSTRAINT "fk_SectionResults_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_TMUnits */
ALTER TABLE "ODM2Results"."SectionResults" ADD CONSTRAINT "fk_SectionResults_TMUnits"
	FOREIGN KEY ("IntendedTimeSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_Units */
ALTER TABLE "ODM2Results"."SectionResults" ADD CONSTRAINT "fk_SectionResults_Units"
	FOREIGN KEY ("YLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_XUnits */
ALTER TABLE "ODM2Results"."SectionResults" ADD CONSTRAINT "fk_SectionResults_XUnits"
	FOREIGN KEY ("IntendedXSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SectionResults_ZUnits */
ALTER TABLE "ODM2Results"."SectionResults" ADD CONSTRAINT "fk_SectionResults_ZUnits"
	FOREIGN KEY ("IntendedZSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_AIUnits */
ALTER TABLE "ODM2Results"."SpectraResultValues" ADD CONSTRAINT "fk_SpectraResultValues_AIUnits"
	FOREIGN KEY ("TimeAggregationIntervalUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_SpectraResults */
ALTER TABLE "ODM2Results"."SpectraResultValues" ADD CONSTRAINT "fk_SpectraResultValues_SpectraResults"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Results"."SpectraResults" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResultValues_WUnits */
ALTER TABLE "ODM2Results"."SpectraResultValues" ADD CONSTRAINT "fk_SpectraResultValues_WUnits"
	FOREIGN KEY ("WavelengthUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_Results */
ALTER TABLE "ODM2Results"."SpectraResults" ADD CONSTRAINT "fk_SpectraResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_SpatialReferences */
ALTER TABLE "ODM2Results"."SpectraResults" ADD CONSTRAINT "fk_SpectraResults_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_Units */
ALTER TABLE "ODM2Results"."SpectraResults" ADD CONSTRAINT "fk_SpectraResults_Units"
	FOREIGN KEY ("IntendedWavelengthSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_XUnits */
ALTER TABLE "ODM2Results"."SpectraResults" ADD CONSTRAINT "fk_SpectraResults_XUnits"
	FOREIGN KEY ("XLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_YUnits */
ALTER TABLE "ODM2Results"."SpectraResults" ADD CONSTRAINT "fk_SpectraResults_YUnits"
	FOREIGN KEY ("YLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpectraResults_ZUnits */
ALTER TABLE "ODM2Results"."SpectraResults" ADD CONSTRAINT "fk_SpectraResults_ZUnits"
	FOREIGN KEY ("ZLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValues_TimeSeriesResults */
ALTER TABLE "ODM2Results"."TimeSeriesResultValues" ADD CONSTRAINT "fk_TimeSeriesResultValues_TimeSeriesResults"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Results"."TimeSeriesResults" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResultValues_Units */
ALTER TABLE "ODM2Results"."TimeSeriesResultValues" ADD CONSTRAINT "fk_TimeSeriesResultValues_Units"
	FOREIGN KEY ("TimeAggregationIntervalUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_Results */
ALTER TABLE "ODM2Results"."TimeSeriesResults" ADD CONSTRAINT "fk_TimeSeriesResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_SpatialReferences */
ALTER TABLE "ODM2Results"."TimeSeriesResults" ADD CONSTRAINT "fk_TimeSeriesResults_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_TUnits */
ALTER TABLE "ODM2Results"."TimeSeriesResults" ADD CONSTRAINT "fk_TimeSeriesResults_TUnits"
	FOREIGN KEY ("IntendedTimeSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_XUnits */
ALTER TABLE "ODM2Results"."TimeSeriesResults" ADD CONSTRAINT "fk_TimeSeriesResults_XUnits"
	FOREIGN KEY ("XLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_YUnits */
ALTER TABLE "ODM2Results"."TimeSeriesResults" ADD CONSTRAINT "fk_TimeSeriesResults_YUnits"
	FOREIGN KEY ("YLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TimeSeriesResults_ZUnits */
ALTER TABLE "ODM2Results"."TimeSeriesResults" ADD CONSTRAINT "fk_TimeSeriesResults_ZUnits"
	FOREIGN KEY ("ZLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_AIUnits */
ALTER TABLE "ODM2Results"."TrajectoryResultValues" ADD CONSTRAINT "fk_TrajectoryResultValues_AIUnits"
	FOREIGN KEY ("TimeAggregationIntervalUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_TrajectoryResults */
ALTER TABLE "ODM2Results"."TrajectoryResultValues" ADD CONSTRAINT "fk_TrajectoryResultValues_TrajectoryResults"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Results"."TrajectoryResults" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_XUnits */
ALTER TABLE "ODM2Results"."TrajectoryResultValues" ADD CONSTRAINT "fk_TrajectoryResultValues_XUnits"
	FOREIGN KEY ("XLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_YUnits */
ALTER TABLE "ODM2Results"."TrajectoryResultValues" ADD CONSTRAINT "fk_TrajectoryResultValues_YUnits"
	FOREIGN KEY ("YLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResultValues_ZUnits */
ALTER TABLE "ODM2Results"."TrajectoryResultValues" ADD CONSTRAINT "fk_TrajectoryResultValues_ZUnits"
	FOREIGN KEY ("ZLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_Results */
ALTER TABLE "ODM2Results"."TrajectoryResults" ADD CONSTRAINT "fk_TrajectoryResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_SpatialReferences */
ALTER TABLE "ODM2Results"."TrajectoryResults" ADD CONSTRAINT "fk_TrajectoryResults_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_TSUnits */
ALTER TABLE "ODM2Results"."TrajectoryResults" ADD CONSTRAINT "fk_TrajectoryResults_TSUnits"
	FOREIGN KEY ("IntendedTrajectorySpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TrajectoryResults_TUnits */
ALTER TABLE "ODM2Results"."TrajectoryResults" ADD CONSTRAINT "fk_TrajectoryResults_TUnits"
	FOREIGN KEY ("IntendedTimeSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResultValues_TransectResults */
ALTER TABLE "ODM2Results"."TransectResultValues" ADD CONSTRAINT "fk_TransectResultValues_TransectResults"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Results"."TransectResults" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_Results */
ALTER TABLE "ODM2Results"."TransectResults" ADD CONSTRAINT "fk_TransectResults_Results"
	FOREIGN KEY ("ResultID") REFERENCES "ODM2Core"."Results" ("ResultID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_SpatialReferences */
ALTER TABLE "ODM2Results"."TransectResults" ADD CONSTRAINT "fk_TransectResults_SpatialReferences"
	FOREIGN KEY ("SpatialReferenceID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_TMUnits */
ALTER TABLE "ODM2Results"."TransectResults" ADD CONSTRAINT "fk_TransectResults_TMUnits"
	FOREIGN KEY ("IntendedTimeSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_TSUnits */
ALTER TABLE "ODM2Results"."TransectResults" ADD CONSTRAINT "fk_TransectResults_TSUnits"
	FOREIGN KEY ("IntendedTransectSpacingUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_TransectResults_Units */
ALTER TABLE "ODM2Results"."TransectResults" ADD CONSTRAINT "fk_TransectResults_Units"
	FOREIGN KEY ("ZLocationUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_FeaturesParent */
ALTER TABLE "ODM2SamplingFeatures"."RelatedFeatures" ADD CONSTRAINT "fk_FeatureParents_FeaturesParent"
	FOREIGN KEY ("RelatedFeatureID") REFERENCES "ODM2Core"."SamplingFeatures" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_SamplingFeatures */
ALTER TABLE "ODM2SamplingFeatures"."RelatedFeatures" ADD CONSTRAINT "fk_FeatureParents_SamplingFeatures"
	FOREIGN KEY ("SamplingFeatureID") REFERENCES "ODM2Core"."SamplingFeatures" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_FeatureParents_SpatialOffsets */
ALTER TABLE "ODM2SamplingFeatures"."RelatedFeatures" ADD CONSTRAINT "fk_FeatureParents_SpatialOffsets"
	FOREIGN KEY ("SpatialOffsetID") REFERENCES "ODM2SamplingFeatures"."SpatialOffsets" ("SpatialOffsetID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Sites_SamplingFeatures */
ALTER TABLE "ODM2SamplingFeatures"."Sites" ADD CONSTRAINT "fk_Sites_SamplingFeatures"
	FOREIGN KEY ("SamplingFeatureID") REFERENCES "ODM2Core"."SamplingFeatures" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Sites_SpatialReferences */
ALTER TABLE "ODM2SamplingFeatures"."Sites" ADD CONSTRAINT "fk_Sites_SpatialReferences"
	FOREIGN KEY ("LatLonDatumID") REFERENCES "ODM2SamplingFeatures"."SpatialReferences" ("SpatialReferenceID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenTaxonomicClassifiers_Specimens */
ALTER TABLE "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers" ADD CONSTRAINT "fk_SpecimenTaxonomicClassifiers_Specimens"
	FOREIGN KEY ("SamplingFeatureID") REFERENCES "ODM2SamplingFeatures"."Specimens" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers */
ALTER TABLE "ODM2SamplingFeatures"."SpecimenTaxonomicClassifiers" ADD CONSTRAINT "fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers"
	FOREIGN KEY ("TaxonomicClassifierID") REFERENCES "ODM2Core"."TaxonomicClassifiers" ("TaxonomicClassifierID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Specimens_SamplingFeatures */
ALTER TABLE "ODM2SamplingFeatures"."Specimens" ADD CONSTRAINT "fk_Specimens_SamplingFeatures"
	FOREIGN KEY ("SamplingFeatureID") REFERENCES "ODM2Core"."SamplingFeatures" ("SamplingFeatureID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataLoggerFiles_DataloggerProgramFiles */
ALTER TABLE "ODM2Sensors"."DataLoggerFiles" ADD CONSTRAINT "fk_DataLoggerFiles_DataloggerProgramFiles"
	FOREIGN KEY ("ProgramID") REFERENCES "ODM2Sensors"."DataloggerProgramFiles" ("ProgramID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DataloggerProgramFiles_Affiliations */
ALTER TABLE "ODM2Sensors"."DataloggerProgramFiles" ADD CONSTRAINT "fk_DataloggerProgramFiles_Affiliations"
	FOREIGN KEY ("AffiliationID") REFERENCES "ODM2Core"."Affiliations" ("AffiliationID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentActions_Actions */
ALTER TABLE "ODM2Sensors"."DeploymentActions" ADD CONSTRAINT "fk_DeploymentActions_Actions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Core"."Actions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_DataLoggerFiles */
ALTER TABLE "ODM2Sensors"."DeploymentMeasuredVariables" ADD CONSTRAINT "fk_DeploymentMeasuredVariables_DataLoggerFiles"
	FOREIGN KEY ("DataloggerFileID") REFERENCES "ODM2Sensors"."DataLoggerFiles" ("DataLoggerFileID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_DeploymentActions */
ALTER TABLE "ODM2Sensors"."DeploymentMeasuredVariables" ADD CONSTRAINT "fk_DeploymentMeasuredVariables_DeploymentActions"
	FOREIGN KEY ("ActionID") REFERENCES "ODM2Sensors"."DeploymentActions" ("ActionID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_InstrumentOutputVariables */
ALTER TABLE "ODM2Sensors"."DeploymentMeasuredVariables" ADD CONSTRAINT "fk_DeploymentMeasuredVariables_InstrumentOutputVariables"
	FOREIGN KEY ("InstrumentOutputVariableID") REFERENCES "ODM2Equipment"."InstrumentOutputVariables" ("InstrumentOutputVariableID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_RI_Units */
ALTER TABLE "ODM2Sensors"."DeploymentMeasuredVariables" ADD CONSTRAINT "fk_DeploymentMeasuredVariables_RI_Units"
	FOREIGN KEY ("RecordingIntervalUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_DeploymentMeasuredVariables_SI_Units */
ALTER TABLE "ODM2Sensors"."DeploymentMeasuredVariables" ADD CONSTRAINT "fk_DeploymentMeasuredVariables_SI_Units"
	FOREIGN KEY ("ScanIntervalUnitsID") REFERENCES "ODM2Core"."Units" ("UnitsID")
	ON UPDATE NO ACTION ON DELETE NO ACTION;