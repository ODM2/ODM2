CREATE EXTENSION if not exists postgis;
CREATE EXTENSION if not exists postgis_topology;
CREATE EXTENSION if not exists fuzzystrmatch;
CREATE EXTENSION if not exists postgis_tiger_geoCoder;

drop schema if exists ODM2LabAnalyses cascade;
drop schema if exists ODM2Core cascade;
drop schema if exists ODM2ExternalIdentifiers cascade;
drop schema if exists ODM2ExtensionProperties cascade;
drop schema if exists ODM2Auth cascade;
drop schema if exists ODM2Equipment cascade;
drop schema if exists ODM2SamplingFeatures cascade;
drop schema if exists ODM2Simulation cascade;
drop schema if exists ODM2CV cascade;
drop schema if exists ODM2DataQuality cascade;
drop schema if exists ODM2Results cascade;
drop schema if exists ODM2Provenance cascade;
drop schema if exists ODM2Annotations cascade;

create schema ODM2LabAnalyses;
create schema ODM2Core;
create schema ODM2ExternalIdentifiers;
create schema ODM2ExtensionProperties;
create schema ODM2Auth;
create schema ODM2Equipment;
create schema ODM2SamplingFeatures;
create schema ODM2Simulation;
create schema ODM2CV;
create schema ODM2DataQuality;
create schema ODM2Results;
create schema ODM2Provenance;
create schema ODM2Annotations;

/***************************************************************************/
/************************* CREATE ODM2ANNOTATIONS **************************/
/***************************************************************************/

create table ODM2Annotations.ActionAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	actionid integer  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.Annotations (
	annotationid serial PRIMARY KEY  NOT NULL,
	annotationtypecv varchar (255) NOT NULL,
	annotationcode varchar (50) NULL,
	annotationtext varchar (500) NOT NULL,
	annotationdatetime timestamp  NULL,
	annotationutcoffset integer  NULL,
	annotationlink varchar (255) NULL,
	annotatorid integer  NULL,
	citationid integer  NULL
);
create table ODM2Annotations.CategoricalResultValueAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.EquipmentAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	equipmentid integer  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.MeasurementResultValueAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.MethodAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	methodid integer  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.PointCoverageResultValueAnnotations (
	bridgeid bigserial PRIMARY KEY  NOT NULL,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.ProfileResultValueAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.ResultAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	annotationid integer  NOT NULL,
	begindatetime timestamp  NOT NULL,
	enddatetime timestamp  NOT NULL
);
create table ODM2Annotations.SamplingFeatureAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	samplingfeatureid integer  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.SectionResultValueAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.SpectraResultValueAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.TimeSeriesResultValueAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.TrajectoryResultValueAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2Annotations.TransectResultValueAnnotations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
/***************************************************************************/
/***************************** CREATE ODM2AUTH *****************************/
/***************************************************************************/

create table ODM2Auth.Accounts (
	accountid serial PRIMARY KEY  NOT NULL,
	username varchar (255) NOT NULL,
	active boolean  NULL,
	issiteadmin boolean  NULL,
	accountfirstname varchar (255) NULL,
	accountmiddlename varchar (255) NULL,
	accountlastname varchar (255) NULL
);
create table ODM2Auth.OrganizationsPermissions (
	bridgeid serial PRIMARY KEY  NOT NULL,
	organizationid integer  NOT NULL,
	permissioncv varchar (255) NOT NULL,
	roleid integer  NOT NULL,
	haspermission boolean  NOT NULL
);
create table ODM2Auth.ResultsPermissions (
	bridgeid serial PRIMARY KEY NOT NULL,
	resultid integer  NOT NULL,
	permissioncv varchar (255) NOT NULL,
	roleid integer  NOT NULL,
	haspermission boolean  NOT NULL
);
create table ODM2Auth.Roles (
	roleid serial PRIMARY KEY NOT NULL,
	rolename varchar (255) NOT NULL,
	roledescription text  NULL,
	organizationid integer  NOT NULL
);
create table ODM2Auth.SamplingFeaturesPermissions (
	bridgeid serial PRIMARY KEY  NOT NULL,
	samplingfeatureid integer  NOT NULL,
	permissioncv varchar (255) NOT NULL,
	roleid integer  NOT NULL,
	haspermission boolean  NOT NULL
);
/***************************************************************************/
/***************************** CREATE ODM2CORE *****************************/
/***************************************************************************/

create table ODM2Core.ActionBy (
	bridgeid serial PRIMARY KEY  NOT NULL,
	actionid integer  NOT NULL,
	affiliationid integer  NOT NULL,
	isactionlead boolean  NOT NULL,
	roledescription varchar (5000) NULL
);
create table ODM2Core.Actions (
	actionid serial PRIMARY KEY  NOT NULL,
	actiontypecv varchar (255) NOT NULL,
	actionname varchar (255) NULL,
	actiondescription varchar (5000) NULL,
	methodid integer  NOT NULL,
	begindatetime timestamp  NOT NULL,
	begindatetimeutcoffset integer  NOT NULL,
	enddatetime timestamp  NULL,
	enddatetimeutcoffset integer  NULL,
	actionfilelink varchar (255) NULL
);
create table ODM2Core.Affiliations (
	affiliationid serial PRIMARY KEY  NOT NULL,
	personid integer  NOT NULL,
	organizationid integer  NOT NULL,
	isprimaryorganizationcontact boolean  NULL,
	affiliationstartdate date  NOT NULL,
	affiliationenddate date  NULL,
	primaryphone varchar (50) NULL,
	primaryemail varchar (255) NOT NULL,
	primaryaddress varchar (255) NULL,
	personlink varchar (255) NULL,
	roleid integer  NULL,
	accountid integer  NULL,
    UNIQUE(affiliationid)
);
create table ODM2Core.Datasets (
	datasetid serial PRIMARY KEY  NOT NULL,
	datasetuuid uuid  NOT NULL,
	datasettypecv varchar (255) NOT NULL,
	datasetcode varchar (50) NOT NULL,
	datasettitle varchar (255) NOT NULL,
	datasetabstract varchar (5000) NOT NULL,
	UNIQUE (datasetcode)
);
create table ODM2Core.DatasetsResults (
	bridgeid serial PRIMARY KEY  NOT NULL,
	datasetid integer  NOT NULL,
	resultid bigint  NOT NULL
);
create table ODM2Core.FeatureActions (
	featureactionid serial PRIMARY KEY  NOT NULL,
	samplingfeatureid integer  NOT NULL,
	actionid integer  NOT NULL,
	relatedfeaturesrelationid integer  NULL
);
create table ODM2Core.Methods (
	methodid serial PRIMARY KEY  NOT NULL,
	methodtypecv varchar (255) NOT NULL,
	methodcode varchar (50) NOT NULL,
	methodname varchar (255) NOT NULL,
	methoddescription varchar (5000) NULL,
	methodlink varchar (255) NULL,
	organizationid integer  NULL,
	UNIQUE (methodcode)
);
create table ODM2Core.Organizations (
	organizationid serial PRIMARY KEY NOT NULL,
	organizationtypecv varchar (255) NOT NULL,
	organizationcode varchar (50) NOT NULL,
	organizationname varchar (255) NOT NULL,
	organizationdescription varchar (5000) NULL,
	organizationlink varchar (255) NULL,
	parentorganizationid integer  NULL,
	UNIQUE (organizationcode)
);
create table ODM2Core.People (
	personid serial PRIMARY KEY  NOT NULL,
	personfirstname varchar (255) NOT NULL,
	personmiddlename varchar (255) NULL,
	personlastname varchar (255) NOT NULL
);
create table ODM2Core.ProcessingLevels (
	processinglevelid serial PRIMARY KEY  NOT NULL,
	processinglevelcode varchar (50) NOT NULL,
	definition varchar (5000) NULL,
	explanation varchar (5000) NULL,
	UNIQUE (processinglevelcode)
);
create table ODM2Core.RelatedActions (
	relationid serial PRIMARY KEY  NOT NULL,
	actionid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedactionid integer  NOT NULL
);
create table ODM2Core.Results (
	resultid bigserial PRIMARY KEY  NOT NULL,
	resultuuid varchar (36) NOT NULL,
	featureactionid integer  NOT NULL,
	resulttypecv varchar (255) NOT NULL,
	variableid integer  NOT NULL,
	unitsid integer  NOT NULL,
	processinglevelid integer  NOT NULL,
	resultdatetime timestamp  NULL,
	resultdatetimeutcoffset bigint  NULL,
	validdatetime timestamp  NULL,
	validdatetimeutcoffset bigint  NULL,
	statuscv varchar (255) NULL,
	valuecount integer  NOT NULL,
	nodatavalue double precision  NULL
);
create table ODM2Core.SamplingFeatures (
	samplingfeatureid serial PRIMARY KEY  NOT NULL,
	samplingfeatureuuid varchar (36) NOT NULL,
	samplingfeaturetypecv varchar (255) NOT NULL,
	samplingfeaturecode varchar (50) NOT NULL,
	samplingfeaturename varchar (255) NULL,
	samplingfeaturedescription varchar (5000) NULL,
	samplingfeaturegeotypecv varchar (255) NULL,
	featuregeometry geometry  NULL,
	featuregeometrywkt varchar (8000) NULL,
	elevation_m double precision  NULL,
	elevationdatumcv varchar (255) NULL,
	latitude double precision  NULL,
	longitude double precision  NULL,
	epsg varchar (20) NULL,
	UNIQUE (samplingfeaturecode)
);
create table ODM2Core.TaxonomicClassifiers (
	taxonomicclassifierid serial PRIMARY KEY  NOT NULL,
	taxonomicclassifierterm varchar (255) NOT NULL,
	taxonomicclassifiername varchar (255) NULL,
	taxonomicclassifieralternatename varchar (255) NULL,
	taxonomicclassifierdefinition varchar (5000) NULL,
	taxonomicclassifierdomaincv varchar (255) NULL,
	taxonomicclassifiersourceuri varchar (1000) NULL
);
create table ODM2Core.Variables (
	variableid serial PRIMARY KEY  NOT NULL,
	variableterm varchar (255) NOT NULL,
	variablename varchar (255) NOT NULL,
	variabledefinition varchar (5000) NOT NULL,
	variabledomaincv varchar (255) NULL,
	sampledmediumcv varchar (255) NULL,
	taxonomicclassifierid integer  NULL,
	speciationid integer  NULL,
	quantitykindcv varchar (255) NULL,
	variablesourceuri varchar (1000) NULL,
	UNIQUE (variablesourceuri)
);
/***************************************************************************/
/****************************** CREATE ODM2CV ******************************/
/***************************************************************************/

create table ODM2CV.CV_ActionType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_AggregationStatistic (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_AnnotationType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_CensorCode (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_DataQualityType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_DatasetType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_DirectiveType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_ElevationDatum (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_EquipmentType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_FeaturesOfInterestType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_LBNLICPMSMapper (
	lbnlterm varchar (255) PRIMARY KEY NOT NULL,
	variableterm varchar (255) NOT NULL
);
create table ODM2CV.CV_Medium (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_MethodType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_OrganizationType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_Permission (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NULL,
	definition text  NULL
);
create table ODM2CV.CV_PropertyDataType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_QualityCode (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_QuantityKind (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	provenance varchar (255) NULL,
	provenanceuri varchar (1000) NULL,
	note varchar (1000) NULL,
	defaultunit varchar (255) NULL,
	defaultunitabbreviation varchar (255) NULL,
	dimensionsymbol varchar (255) NULL,
	dimensionunitless integer  NOT NULL,
	dimensionlength integer  NOT NULL,
	dimensionmass integer  NOT NULL,
	dimensiontime integer  NOT NULL,
	dimensioncurrent integer  NOT NULL,
	dimensiontemperature integer  NOT NULL,
	dimensionamount integer  NOT NULL,
	dimensionlight integer  NOT NULL
);
create table ODM2CV.CV_RelationshipType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_ResultType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_SamplingFeatureGeoType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_SamplingFeatureType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_SpatialOffsetType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_SpecimenCollection (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_SpecimenType (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_Status (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_TaxonomicClassifierDomain (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2CV.CV_Units (
	unitsid integer PRIMARY KEY NOT NULL,
	term varchar (255) NOT NULL,
	unitsname varchar (255) NOT NULL,
	quantitykindcv varchar (255) NOT NULL,
	unitsabbreviation varchar (255) NULL,
	unitslink varchar (1000) NULL,
	conversionmultiplier double precision  NOT NULL,
	conversionoffset double precision  NOT NULL,
	definition varchar (5000) NULL
);
create table ODM2CV.CV_VariableDomain (
	term varchar (255) PRIMARY KEY NOT NULL,
	name varchar (255) NOT NULL,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
/***************************************************************************/
/************************* CREATE ODM2DATAQUALITY **************************/
/***************************************************************************/

create table ODM2DataQuality.DataQuality (
	dataqualityid integer PRIMARY KEY NOT NULL,
	dataqualitytypecv varchar (255) NOT NULL,
	dataqualitycode varchar (255) NOT NULL,
	dataqualityvalue double precision  NULL,
	dataqualityvalueunitsid integer  NULL,
	dataqualitydescription varchar (5000) NULL,
	dataqualitylink varchar (255) NULL
);
create table ODM2DataQuality.ReferenceMaterials (
	referencematerialid serial PRIMARY KEY  NOT NULL,
	referencematerialmediumcv varchar (255) NOT NULL,
	referencematerialorganizationid integer  NOT NULL,
	referencematerialcode varchar (50) NOT NULL,
	referencemateriallotcode varchar (255) NULL,
	referencematerialpurchasedate timestamp  NULL,
	referencematerialexpirationdate timestamp  NULL,
	referencematerialcertificatelink varchar (255) NULL,
	samplingfeatureid integer  NULL,
	UNIQUE (referencematerialcode)
);
create table ODM2DataQuality.ReferenceMaterialValues (
	referencematerialvalueid serial PRIMARY KEY  NOT NULL,
	referencematerialid integer  NOT NULL,
	referencematerialvalue double precision  NOT NULL,
	referencematerialaccuracy double precision  NULL,
	variableid integer  NOT NULL,
	unitsid integer  NOT NULL,
	citationid integer  NULL
);
create table ODM2DataQuality.ResultNormalizationValues (
	resultid bigint  NOT NULL,
	normalizedbyreferencematerialvalueid integer  NOT NULL
);
create table ODM2DataQuality.ResultsDataQuality (
	bridgeid serial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	dataqualityid integer  NOT NULL
);
/***************************************************************************/
/************************** CREATE ODM2EQUIPMENT ***************************/
/***************************************************************************/

create table ODM2Equipment.CalibrationActions (
	actionid serial PRIMARY KEY NOT NULL,
	calibrationcheckvalue double precision  NULL,
	instrumentoutputvariableid integer  NOT NULL,
	calibrationequation varchar (255) NULL
);
create table ODM2Equipment.CalibrationReferenceEquipment (
	bridgeid serial PRIMARY KEY  NOT NULL,
	actionid integer  NOT NULL,
	equipmentid integer  NOT NULL
);
create table ODM2Equipment.CalibrationStandards (
	bridgeid serial PRIMARY KEY  NOT NULL,
	actionid integer  NOT NULL,
	referencematerialid integer  NOT NULL
);
create table ODM2Equipment.DataloggerFileColumns (
	dataloggerfilecolumnid serial PRIMARY KEY  NOT NULL,
	resultid bigint  NULL,
	dataloggerfileid integer  NOT NULL,
	instrumentoutputquantitykindid integer  NOT NULL,
	columnlabel varchar (50) NOT NULL,
	columndescription varchar (5000) NULL,
	measurementequation varchar (255) NULL,
	scaninterval double precision  NULL,
	scanintervalunitsid integer  NULL,
	recordinginterval double precision  NULL,
	recordingintervalunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NULL
);
create table ODM2Equipment.DataLoggerFiles (
	dataloggerfileid serial PRIMARY KEY  NOT NULL,
	programid integer  NOT NULL,
	dataloggerfilename varchar (255) NOT NULL,
	dataloggerfiledescription varchar (5000) NULL,
	dataloggerfilelink varchar (255) NULL
);
create table ODM2Equipment.DataloggerProgramFiles (
	programid serial PRIMARY KEY  NOT NULL,
	affiliationid integer  NOT NULL,
	programname varchar (255) NOT NULL,
	programdescription varchar (5000) NULL,
	programversion varchar (50) NULL,
	programfilelink varchar (255) NULL
);
create table ODM2Equipment.Equipment (
	equipmentid serial PRIMARY KEY  NOT NULL,
	equipmentcode varchar (50) NOT NULL,
	equipmentname varchar (255) NOT NULL,
	equipmentmodelid integer  NOT NULL,
	equipmentserialnumber varchar (50) NULL,
	equipmentownerid integer  NOT NULL,
	equipmentvendorid integer  NULL,
	equipmentpurchasedate timestamp  NULL,
	equipmentpurchaseordernumber varchar (50) NULL,
	equipmentdescription varchar (5000) NULL,
	equipmentdocumentationlink varchar (255) NULL,
	UNIQUE (equipmentcode)
);
create table ODM2Equipment.EquipmentModels (
	equipmentmodelid serial PRIMARY KEY  NOT NULL,
	modelmanufacturerid integer  NOT NULL,
	modelpartnumber varchar (50) NULL,
	modelname varchar (255) NOT NULL,
	equipmenttypecv varchar (255) NOT NULL,
	modeldescription varchar (5000) NULL,
	isinstrument boolean  NOT NULL,
	modelspecificationsfilelink varchar (255) NULL,
	modeldescriptionurl varchar (255) NULL,
	isretired boolean  NULL
);
create table ODM2Equipment.EquipmentUsed (
	bridgeid serial PRIMARY KEY  NOT NULL,
	actionid integer  NOT NULL,
	equipmentid integer  NOT NULL
);
create table ODM2Equipment.InstrumentOutputQuantityKind (
	instrumentoutputquantitykindid serial PRIMARY KEY  NOT NULL,
	equipmentmodelid integer  NOT NULL,
	quantitykind varchar (255) NOT NULL,
	instrumentresolution varchar (255) NULL,
	instrumentaccuracy varchar (255) NULL,
	instrumentrawoutputunitsid integer  NOT NULL,
	instrumentstandardoutputvariable integer  NULL,
	instrumentmethodid integer  NULL
);
create table ODM2Equipment.MaintenanceActions (
	actionid integer  NOT NULL,
	isfactoryservice boolean  NOT NULL,
	maintenancecode varchar (50) NULL,
	maintenancereason varchar (500) NULL
);
create table ODM2Equipment.RelatedEquipment (
	relationid serial PRIMARY KEY  NOT NULL,
	equipmentid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedequipmentid integer  NOT NULL,
	relationshipstartdatetime timestamp  NOT NULL,
	relationshipstartdatetimeutcoffset integer  NOT NULL,
	relationshipenddatetime timestamp  NULL,
	relationshipenddatetimeutcoffset integer  NULL
);
/***************************************************************************/
/********************* CREATE ODM2EXTENSIONPROPERTIES **********************/
/***************************************************************************/

create table ODM2ExtensionProperties.ActionExtensionPropertyValues (
	bridgeid serial PRIMARY KEY  NOT NULL,
	actionid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2ExtensionProperties.CitationExtensionPropertyValues (
	bridgeid serial PRIMARY KEY  NOT NULL,
	citationid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2ExtensionProperties.ExtensionProperties (
	propertyid serial PRIMARY KEY  NOT NULL,
	propertyname varchar (255) NOT NULL,
	propertydescription varchar (5000) NULL,
	propertydatatypecv varchar (255) NOT NULL,
	propertyunitsid integer  NULL
);
create table ODM2ExtensionProperties.MethodExtensionPropertyValues (
	bridgeid serial PRIMARY KEY  NOT NULL,
	methodid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2ExtensionProperties.ResultExtensionPropertyValues (
	bridgeid serial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2ExtensionProperties.SamplingFeatureExtensionPropertyValues (
	bridgeid serial PRIMARY KEY  NOT NULL,
	samplingfeatureid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2ExtensionProperties.VariableExtensionPropertyValues (
	bridgeid serial PRIMARY KEY  NOT NULL,
	variableid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
/***************************************************************************/
/********************* CREATE ODM2EXTERNALIDENTIFIERS **********************/
/***************************************************************************/

create table ODM2ExternalIdentifiers.CitationExternalIdentifiers (
	bridgeid serial PRIMARY KEY  NOT NULL,
	citationid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	citationexternalidentifier varchar (255) NOT NULL,
	citationexternalidentifieruri varchar (255) NULL
);
create table ODM2ExternalIdentifiers.ExternalIdentifierSystems (
	externalidentifiersystemid serial PRIMARY KEY  NOT NULL,
	externalidentifiersystemname varchar (255) NOT NULL,
	identifiersystemorganizationid integer  NOT NULL,
	externalidentifiersystemdescription varchar (5000) NULL,
	externalidentifiersystemurl varchar (255) NULL
);
create table ODM2ExternalIdentifiers.MethodExternalIdentifiers (
	bridgeid serial PRIMARY KEY  NOT NULL,
	methodid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	methodexternalidentifier varchar (255) NOT NULL,
	methodexternalidentifieruri varchar (255) NULL
);
create table ODM2ExternalIdentifiers.PersonExternalIdentifiers (
	bridgeid serial PRIMARY KEY  NOT NULL,
	personid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	personexternalidentifier varchar (255) NOT NULL,
	personexternalidentifieruri varchar (255) NULL
);
create table ODM2ExternalIdentifiers.ReferenceMaterialExternalIdentifiers (
	bridgeid serial PRIMARY KEY  NOT NULL,
	referencematerialid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	referencematerialexternalidentifier varchar (255) NOT NULL,
	referencematerialexternalidentifieruri varchar (255) NULL
);
create table ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers (
	bridgeid serial PRIMARY KEY  NOT NULL,
	samplingfeatureid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	samplingfeatureexternalidentifier varchar (255) NOT NULL,
	samplingfeatureexternalidentifieruri varchar (255) NULL
);
create table ODM2ExternalIdentifiers.SpatialReferenceExternalIdentifiers (
	bridgeid serial PRIMARY KEY  NOT NULL,
	spatialreferenceid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	spatialreferenceexternalidentifier varchar (255) NOT NULL,
	spatialreferenceexternalidentifieruri varchar (255) NULL
);
create table ODM2ExternalIdentifiers.TaxonomicClassifierExternalIdentifiers (
	bridgeid serial PRIMARY KEY  NOT NULL,
	taxonomicclassifierid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	taxonomicclassifierexternalidentifier varchar (255) NOT NULL,
	taxonomicclassifierexternalidentifieruri varchar (255) NULL
);
create table ODM2ExternalIdentifiers.VariableExternalIdentifiers (
	bridgeid serial PRIMARY KEY  NOT NULL,
	variableid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	variableexternalidentifier varchar (255) NOT NULL,
	variableexternalidentifieruri varchar (255) NULL
);
/***************************************************************************/
/************************* CREATE ODM2LABANALYSES **************************/
/***************************************************************************/

create table ODM2LabAnalyses.ActionDirectives (
	bridgeid serial PRIMARY KEY  NOT NULL,
	actionid integer  NOT NULL,
	directiveid integer  NOT NULL
);
create table ODM2LabAnalyses.Directives (
	directiveid serial PRIMARY KEY  NOT NULL,
	directivetypecv varchar (255) NOT NULL,
	directivedescription varchar (5000) NOT NULL
);
create table ODM2LabAnalyses.SpecimenBatchPositions (
	featureactionid integer  NOT NULL,
	batchpositionnumber integer  NOT NULL,
	batchpositionlabel varchar (255) NULL
);
/***************************************************************************/
/************************** CREATE ODM2PROVENANCE **************************/
/***************************************************************************/

create table ODM2Provenance.AuthorLists (
	bridgeid serial PRIMARY KEY  NOT NULL,
	citationid integer  NOT NULL,
	personid integer  NOT NULL,
	authororder integer  NOT NULL
);
create table ODM2Provenance.Citations (
	citationid serial PRIMARY KEY  NOT NULL,
	title varchar (255) NOT NULL,
	publisher varchar (255) NOT NULL,
	publicationyear integer  NOT NULL,
	citationlink varchar (255) NULL
);
create table ODM2Provenance.DatasetCitations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	datasetid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	citationid integer  NOT NULL
);
create table ODM2Provenance.DerivationEquations (
	derivationequationid serial PRIMARY KEY  NOT NULL,
	derivationequation varchar (255) NOT NULL
);
create table ODM2Provenance.MethodCitations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	methodid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	citationid integer  NOT NULL
);
create table ODM2Provenance.OrganizationsSamplingFeatures (
	organizationsamplingfeatureid serial PRIMARY KEY  NOT NULL,
	organizationid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	samplingfeatureid integer  NOT NULL
);
create table ODM2Provenance.RelatedAnnotations (
	relationid serial PRIMARY KEY  NOT NULL,
	annotationid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedannotationid integer  NOT NULL
);
create table ODM2Provenance.RelatedCitations (
	relationid serial PRIMARY KEY  NOT NULL,
	citationid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedcitationid integer  NOT NULL
);
create table ODM2Provenance.RelatedDatasets (
	relationid serial PRIMARY KEY  NOT NULL,
	datasetid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relateddatasetid integer  NOT NULL,
	versioncode varchar (50) NULL
);
create table ODM2Provenance.RelatedResults (
	relationid serial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedresultid bigint  NOT NULL,
	versioncode varchar (50) NULL,
	relatedresultsequencenumber integer  NULL
);
create table ODM2Provenance.ResultDerivationEquations (
	resultid bigint  NOT NULL,
	derivationequationid integer  NOT NULL
);
/***************************************************************************/
/*************************** CREATE ODM2RESULTS ****************************/
/***************************************************************************/

create table ODM2Results.CategoricalResults (
	resultid bigint PRIMARY KEY NOT NULL,
	xlocation double precision  NULL,
	xlocationunitsid integer  NULL,
	ylocation double precision  NULL,
	ylocationunitsid integer  NULL,
	zlocation double precision  NULL,
	zlocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	qualitycodecv varchar (255) NOT NULL
);
create table ODM2Results.CategoricalResultValues (
	valueid bigserial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	datavalue varchar (255) NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	UNIQUE (resultid, datavalue, valuedatetime, valuedatetimeutcoffset)
);
create table ODM2Results.MeasurementResults (
	resultid bigint PRIMARY KEY NOT NULL,
	xlocation double precision  NULL,
	xlocationunitsid integer  NULL,
	ylocation double precision  NULL,
	ylocationunitsid integer  NULL,
	zlocation double precision  NULL,
	zlocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	timeaggregationinterval double precision  NULL,
	timeaggregationintervalunitsid integer  NULL
);
create table ODM2Results.MeasurementResultValues (
	valueid bigserial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	aggregationstatisticcv varchar (255) NOT NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL
);
create table ODM2Results.PointCoverageResults (
	resultid bigint PRIMARY KEY NOT NULL,
	zlocation double precision  NULL,
	zlocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	intendedxspacing double precision  NULL,
	intendedxspacingunitsid integer  NULL,
	intendedyspacing double precision  NULL,
	intendedyspacingunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NOT NULL,
	timeaggregationinterval double precision  NOT NULL,
	timeaggregationintervalunitsid integer  NOT NULL
);
create table ODM2Results.PointCoverageResultValues (
	valueid bigserial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	xlocation double precision  NOT NULL,
	xlocationunitsid integer  NOT NULL,
	ylocation double precision  NOT NULL,
	ylocationunitsid integer  NOT NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL,
	UNIQUE (resultid, datavalue, valuedatetime, valuedatetimeutcoffset, xlocation, xlocationunitsid, ylocation, ylocationunitsid, censorcodecv, qualitycodecv)
);
create table ODM2Results.ProfileResults (
	resultid bigint PRIMARY KEY NOT NULL,
	xlocation double precision  NULL,
	xlocationunitsid integer  NULL,
	ylocation double precision  NULL,
	ylocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	intendedzspacing double precision  NULL,
	intendedzspacingunitsid integer  NULL,
	intendedtimespacing double precision  NULL,
	intendedtimespacingunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NOT NULL
);
create table ODM2Results.ProfileResultValues (
	valueid bigserial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	zlocation double precision  NOT NULL,
	zaggregationinterval double precision  NOT NULL,
	zlocationunitsid integer  NOT NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL,
	timeaggregationinterval double precision  NOT NULL,
	timeaggregationintervalunitsid integer  NOT NULL,
	UNIQUE (resultid, datavalue, valuedatetime, valuedatetimeutcoffset, zlocation, zaggregationinterval, zlocationunitsid, censorcodecv, qualitycodecv, timeaggregationinterval, timeaggregationintervalunitsid)
);
create table ODM2Results.SectionResults (
	resultid bigint PRIMARY KEY NOT NULL,
	ylocation double precision  NULL,
	ylocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	intendedxspacing double precision  NULL,
	intendedxspacingunitsid integer  NULL,
	intendedzspacing double precision  NULL,
	intendedzspacingunitsid integer  NULL,
	intendedtimespacing double precision  NULL,
	intendedtimespacingunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NOT NULL
);
create table ODM2Results.SectionResultValues (
	valueid bigserial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	xlocation double precision  NOT NULL,
	xaggregationinterval double precision  NOT NULL,
	xlocationunitsid integer  NOT NULL,
	zlocation bigint  NOT NULL,
	zaggregationinterval double precision  NOT NULL,
	zlocationunitsid integer  NOT NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL,
	aggregationstatisticcv varchar (255) NOT NULL,
	timeaggregationinterval double precision  NOT NULL,
	timeaggregationintervalunitsid integer  NOT NULL,
	UNIQUE (resultid, datavalue, valuedatetime, valuedatetimeutcoffset, xlocation, xaggregationinterval, xlocationunitsid, zlocation, zaggregationinterval, zlocationunitsid, censorcodecv, qualitycodecv, aggregationstatisticcv, timeaggregationinterval, timeaggregationintervalunitsid)
);
create table ODM2Results.SpectraResults (
	resultid bigint PRIMARY KEY NOT NULL,
	xlocation double precision  NULL,
	xlocationunitsid integer  NULL,
	ylocation double precision  NULL,
	ylocationunitsid integer  NULL,
	zlocation double precision  NULL,
	zlocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	intendedwavelengthspacing double precision  NULL,
	intendedwavelengthspacingunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NOT NULL
);
create table ODM2Results.SpectraResultValues (
	valueid bigserial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	excitationwavelength double precision  NOT NULL,
	emissionwavelength double precision  NOT NULL,
	wavelengthunitsid integer  NOT NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL,
	timeaggregationinterval double precision  NOT NULL,
	timeaggregationintervalunitsid integer  NOT NULL,
	UNIQUE (resultid, datavalue, valuedatetime, valuedatetimeutcoffset, excitationwavelength, emissionwavelength, wavelengthunitsid, censorcodecv, qualitycodecv, timeaggregationinterval, timeaggregationintervalunitsid)
);
create table ODM2Results.TimeSeriesResults (
	resultid bigint PRIMARY KEY NOT NULL,
	xlocation double precision  NULL,
	xlocationunitsid integer  NULL,
	ylocation double precision  NULL,
	ylocationunitsid integer  NULL,
	zlocation double precision  NULL,
	zlocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	intendedtimespacing double precision  NULL,
	intendedtimespacingunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NOT NULL
);
create table ODM2Results.TimeSeriesResultValues (
	valueid bigserial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL,
	timeaggregationinterval double precision  NOT NULL,
	timeaggregationintervalunitsid integer  NOT NULL,
	UNIQUE (resultid, datavalue, valuedatetime, valuedatetimeutcoffset, censorcodecv, qualitycodecv, timeaggregationinterval, timeaggregationintervalunitsid)
);
create table ODM2Results.TrajectoryResults (
	resultid bigint PRIMARY KEY NOT NULL,
	spatialreferenceid integer  NULL,
	intendedtrajectoryspacing double precision  NULL,
	intendedtrajectoryspacingunitsid integer  NULL,
	intendedtimespacing double precision  NULL,
	intendedtimespacingunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NOT NULL
);
create table ODM2Results.TrajectoryResultValues (
	valueid bigserial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	xlocation double precision  NOT NULL,
	xlocationunitsid integer  NOT NULL,
	ylocation double precision  NOT NULL,
	ylocationunitsid integer  NOT NULL,
	zlocation double precision  NOT NULL,
	zlocationunitsid integer  NOT NULL,
	trajectorydistance double precision  NOT NULL,
	trajectorydistanceaggregationinterval double precision  NOT NULL,
	trajectorydistanceunitsid integer  NOT NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL,
	timeaggregationinterval double precision  NOT NULL,
	timeaggregationintervalunitsid integer  NOT NULL,
	UNIQUE (resultid, datavalue, valuedatetime, valuedatetimeutcoffset, xlocation, xlocationunitsid, ylocation, ylocationunitsid, zlocation, zlocationunitsid, trajectorydistance, trajectorydistanceaggregationinterval, trajectorydistanceunitsid, censorcodecv, qualitycodecv, timeaggregationinterval)
);
create table ODM2Results.TransectResults (
	resultid bigint PRIMARY KEY  NOT NULL,
	zlocation double precision  NULL,
	zlocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	intendedtransectspacing double precision  NULL,
	intendedtransectspacingunitsid integer  NULL,
	intendedtimespacing double precision  NULL,
	intendedtimespacingunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NOT NULL
);
create table ODM2Results.TransectResultValues (
	valueid bigserial PRIMARY KEY  NOT NULL,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	xlocation double precision  NOT NULL,
	xlocationunitsid integer  NOT NULL,
	ylocation double precision  NOT NULL,
	ylocationunitsid integer  NOT NULL,
	transectdistance double precision  NOT NULL,
	transectdistanceaggregationinterval double precision  NOT NULL,
	transectdistanceunitsid integer  NOT NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL,
	aggregationstatisticcv varchar (255) NOT NULL,
	timeaggregationinterval double precision  NOT NULL,
	timeaggregationintervalunitsid integer  NOT NULL,
	UNIQUE (resultid, datavalue, valuedatetime, valuedatetimeutcoffset, xlocation, xlocationunitsid, ylocation, ylocationunitsid, transectdistance, transectdistanceaggregationinterval, transectdistanceunitsid, censorcodecv, qualitycodecv, aggregationstatisticcv, timeaggregationinterval, timeaggregationintervalunitsid)
);
/***************************************************************************/
/*********************** CREATE ODM2SAMPLINGFEATURES ***********************/
/***************************************************************************/

create table ODM2SamplingFeatures.FeaturesOfInterest (
	featuresofinterestid serial PRIMARY KEY  NOT NULL,
	featuresofinteresttypecv varchar (255) NOT NULL,
	featuresofinterestname varchar (255) NOT NULL,
	featuresofinterestdescription varchar (5000) NULL
);
create table ODM2SamplingFeatures.RelatedFeatures (
	relationid serial PRIMARY KEY  NOT NULL,
	samplingfeatureid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedfeatureid integer  NOT NULL,
	spatialoffsetid integer  NULL
);
create table ODM2SamplingFeatures.SampledFeatures (
	relationid integer  NOT NULL,
	samplingfeatureid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	featureofinterestid integer  NOT NULL
);
create table ODM2SamplingFeatures.SpatialOffsets (
	spatialoffsetid serial PRIMARY KEY  NOT NULL,
	spatialoffsettypecv varchar (255) NOT NULL,
	offset1value double precision  NOT NULL,
	offset1unitid integer  NOT NULL,
	offset2value double precision  NULL,
	offset2unitid integer  NULL,
	offset3value double precision  NULL,
	offset3unitid integer  NULL
);
create table ODM2SamplingFeatures.SpatialReferences (
	spatialreferenceid serial PRIMARY KEY  NOT NULL,
	srscode varchar (50) NULL,
	srsname varchar (255) NOT NULL,
	srsdescription varchar (5000) NULL,
	srslink varchar (255) NULL
);
create table ODM2SamplingFeatures.SpecimenCollection (
	specimencollectionid serial PRIMARY KEY  NOT NULL,
	specimencollectioncv varchar (255) NOT NULL,
	specimencollectionfile varchar (255) NULL,
	specimencollectionname varchar (255) NULL,
	specimencollectionnote varchar (5000) NULL,
	parentspecimencollectionid integer  NULL
);
create table ODM2SamplingFeatures.Specimens (
	samplingfeatureid integer PRIMARY KEY NOT NULL,
	specimentypecv varchar (255) NOT NULL,
	specimenmediumcv varchar (255) NOT NULL,
	isfieldspecimen boolean  NOT NULL,
	specimencollectionid integer  NULL
);
create table ODM2SamplingFeatures.SpecimenTaxonomicClassifiers (
	bridgeid serial PRIMARY KEY  NOT NULL,
	samplingfeatureid integer  NOT NULL,
	taxonomicclassifierid integer  NOT NULL,
	citationid integer  NULL
);
/***************************************************************************/
/************************** CREATE ODM2SIMULATION **************************/
/***************************************************************************/

create table ODM2Simulation.ModelAffiliations (
	bridgeid serial PRIMARY KEY  NOT NULL,
	modelid integer  NOT NULL,
	affiliationid integer  NOT NULL,
	isprimary boolean  NOT NULL,
	roledescription varchar (5000) NULL
);
create table ODM2Simulation.Models (
	modelid serial PRIMARY KEY  NOT NULL,
	modelcode varchar (50) NOT NULL,
	modelname varchar (255) NOT NULL,
	modeldescription varchar (5000) NULL,
	version varchar (255) NULL,
	modellink varchar (255) NULL,
	UNIQUE (modelcode)
);
create table ODM2Simulation.RelatedModels (
	relatedid serial PRIMARY KEY  NOT NULL,
	modelid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedmodelid integer  NOT NULL
);
create table ODM2Simulation.Simulations (
	simulationid serial PRIMARY KEY  NOT NULL,
	actionid integer  NOT NULL,
	simulationname varchar (255) NOT NULL,
	simulationdescription varchar (5000) NULL,
	simulationstartdatetime timestamp  NOT NULL,
	simulationstartdatetimeutcoffset integer  NOT NULL,
	simulationenddatetime timestamp  NOT NULL,
	simulationenddatetimeutcoffset integer  NOT NULL,
	timestepvalue double precision  NOT NULL,
	timestepunitsid integer  NOT NULL,
	inputdatasetid integer  NULL,
	modelid integer  NOT NULL
);

alter table ODM2Annotations.ActionAnnotations add constraint fk_ActionAnnotations_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2Annotations.ActionAnnotations add constraint fk_ActionAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.Annotations add constraint fk_Annotations_Citations
foreign key (citationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2Annotations.Annotations add constraint fk_Annotations_CV_AnnotationType
foreign key (annotationtypecv) References ODM2CV.CV_AnnotationType (term)
on update no Action on delete cascade;

alter table ODM2Annotations.Annotations add constraint fk_Annotations_People
foreign key (annotatorid) References ODM2Core.People (personid)
on update no Action on delete cascade;

alter table ODM2Annotations.CategoricalResultValueAnnotations add constraint fk_CategoricalResultValueAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.CategoricalResultValueAnnotations add constraint fk_CategoricalResultValueAnnotations_CategoricalResultValues
foreign key (valueid) References ODM2Results.CategoricalResultValues (valueid)
on update no Action on delete cascade;

alter table ODM2Annotations.EquipmentAnnotations add constraint fk_EquipmentAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.EquipmentAnnotations add constraint fk_EquipmentAnnotations_Equipment
foreign key (equipmentid) References ODM2Equipment.Equipment (equipmentid)
on update no Action on delete cascade;

alter table ODM2Annotations.MeasurementResultValueAnnotations add constraint fk_MeasurementResultValueAnnotations_MeasurementResultValues
foreign key (valueid) References ODM2Results.MeasurementResultValues (valueid)
on update no Action on delete cascade;

alter table ODM2Annotations.MeasurementResultValueAnnotations add constraint fk_ResultValueAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.MethodAnnotations add constraint fk_MethodAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.MethodAnnotations add constraint fk_MethodAnnotations_Methods
foreign key (methodid) References ODM2Core.Methods (methodid)
on update no Action on delete cascade;

alter table ODM2Annotations.PointCoverageResultValueAnnotations add constraint fk_PointCoverageResultValueAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.PointCoverageResultValueAnnotations add constraint fk_PointCoverageResultValueAnnotations_PointCoverageResultValues
foreign key (valueid) References ODM2Results.PointCoverageResultValues (valueid)
on update no Action on delete cascade;

alter table ODM2Annotations.ProfileResultValueAnnotations add constraint fk_ProfileResultValueAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.ProfileResultValueAnnotations add constraint fk_ProfileResultValueAnnotations_ProfileResultValues
foreign key (valueid) References ODM2Results.ProfileResultValues (valueid)
on update no Action on delete cascade;

alter table ODM2Annotations.ResultAnnotations add constraint fk_ResultAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.ResultAnnotations add constraint fk_ResultAnnotations_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Annotations.SamplingFeatureAnnotations add constraint fk_SamplingFeatureAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.SamplingFeatureAnnotations add constraint fk_SamplingFeatureAnnotations_SamplingFeatures
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2Annotations.SectionResultValueAnnotations add constraint fk_SectionResultValueAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.SectionResultValueAnnotations add constraint fk_SectionResultValueAnnotations_SectionResultValues
foreign key (valueid) References ODM2Results.SectionResultValues (valueid)
on update no Action on delete cascade;

alter table ODM2Annotations.SpectraResultValueAnnotations add constraint fk_SpectraResultValueAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.SpectraResultValueAnnotations add constraint fk_SpectraResultValueAnnotations_SpectraResultValues
foreign key (valueid) References ODM2Results.SpectraResultValues (valueid)
on update no Action on delete cascade;

alter table ODM2Annotations.TimeSeriesResultValueAnnotations add constraint fk_TimeSeriesResultValueAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.TimeSeriesResultValueAnnotations add constraint fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues
foreign key (valueid) References ODM2Results.TimeSeriesResultValues (valueid)
on update no Action on delete cascade;

alter table ODM2Annotations.TrajectoryResultValueAnnotations add constraint fk_TrajectoryResultValueAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.TrajectoryResultValueAnnotations add constraint fk_TrajectoryResultValueAnnotations_TrajectoryResultValues
foreign key (valueid) References ODM2Results.TrajectoryResultValues (valueid)
on update no Action on delete cascade;

alter table ODM2Annotations.TransectResultValueAnnotations add constraint fk_TransectResultValueAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Annotations.TransectResultValueAnnotations add constraint fk_TransectResultValueAnnotations_TransectResultValues
foreign key (valueid) References ODM2Results.TransectResultValues (valueid)
on update no Action on delete cascade;

alter table ODM2Auth.OrganizationsPermissions add constraint fk_CV_Permission_OrganizationsPermissions
foreign key (permissioncv) References ODM2CV.CV_Permission (term)
on update no Action on delete cascade;

alter table ODM2Auth.OrganizationsPermissions add constraint fk_Organizations_OrganizationPermissions
foreign key (organizationid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2Auth.OrganizationsPermissions add constraint fk_Roles_OrganizationRoles
foreign key (roleid) References ODM2Auth.Roles (roleid)
on update no Action on delete cascade;

alter table ODM2Auth.ResultsPermissions add constraint fk_CV_Permission_ResultPermissions
foreign key (permissioncv) References ODM2CV.CV_Permission (term)
on update no Action on delete cascade;

alter table ODM2Auth.ResultsPermissions add constraint fk_Result_ResultPermissions
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Auth.ResultsPermissions add constraint fk_Roles_ResultPermissions
foreign key (roleid) References ODM2Auth.Roles (roleid)
on update no Action on delete cascade;

alter table ODM2Auth.Roles add constraint fk_Organizations_Roles
foreign key (organizationid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2Auth.SamplingFeaturesPermissions add constraint fk_CV_Permission_OrganizationsPermissions
foreign key (permissioncv) References ODM2CV.CV_Permission (term)
on update no Action on delete cascade;

alter table ODM2Auth.SamplingFeaturesPermissions add constraint fk_Roles_SamplingFeaturePermissions
foreign key (roleid) References ODM2Auth.Roles (roleid)
on update no Action on delete cascade;

alter table ODM2Auth.SamplingFeaturesPermissions add constraint fk_SamplingFeatures_SamplingFeaturesPermissions
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2Core.ActionBy add constraint fk_ActionPeople_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2Core.ActionBy add constraint fk_ActionPeople_Affiliations
foreign key (affiliationid) References ODM2Core.Affiliations (affiliationid)
on update no Action on delete cascade;

alter table ODM2Core.Actions add constraint fk_Actions_CV_ActionType
foreign key (actiontypecv) References ODM2CV.CV_ActionType (term)
on update no Action on delete cascade;

alter table ODM2Core.Actions add constraint fk_Actions_Methods
foreign key (methodid) References ODM2Core.Methods (methodid)
on update no Action on delete cascade;

alter table ODM2Core.Affiliations add constraint fk_Affiliations_Accounts
foreign key (accountid) References ODM2Auth.Accounts (accountid)
on update no Action on delete cascade;

alter table ODM2Core.Affiliations add constraint fk_Affiliations_Roles
foreign key (roleid) References ODM2Auth.Roles (roleid)
on update no Action on delete cascade;

alter table ODM2Core.Affiliations add constraint fk_Affiliations_Organizations
foreign key (organizationid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2Core.Affiliations add constraint fk_Affiliations_People
foreign key (personid) References ODM2Core.People (personid)
on update no Action on delete cascade;

alter table ODM2Core.Datasets add constraint fk_Datasets_CV_DatasetTypeCV
foreign key (datasettypecv) References ODM2CV.CV_DatasetType (term)
on update no Action on delete cascade;

alter table ODM2Core.DatasetsResults add constraint fk_DataSetsResults_DataSets
foreign key (datasetid) References ODM2Core.Datasets (datasetid)
on update no Action on delete cascade;

alter table ODM2Core.DatasetsResults add constraint fk_DataSetsResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Core.FeatureActions add constraint fk_FeatureActions_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2Core.FeatureActions add constraint fk_FeatureActions_RelatedFeatures
foreign key (relatedfeaturesrelationid) References ODM2SamplingFeatures.RelatedFeatures (relationid)
on update no Action on delete cascade;

alter table ODM2Core.FeatureActions add constraint fk_FeatureActions_SamplingFeatures
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2Core.Methods add constraint fk_Methods_CV_MethodType
foreign key (methodtypecv) References ODM2CV.CV_MethodType (term)
on update no Action on delete cascade;

alter table ODM2Core.Methods add constraint fk_Methods_Organizations
foreign key (organizationid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2Core.Organizations add constraint fk_Organizations_CV_OrganizationType
foreign key (organizationtypecv) References ODM2CV.CV_OrganizationType (term)
on update no Action on delete cascade;

alter table ODM2Core.Organizations add constraint fk_Organizations_Organizations
foreign key (parentorganizationid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2Core.RelatedActions add constraint fk_RelatedActions_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2Core.RelatedActions add constraint fk_RelatedActions_Actions_AreRelated
foreign key (relatedactionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2Core.RelatedActions add constraint fk_RelatedActions_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2Core.Results add constraint fk_Results_CV_ResultType
foreign key (resulttypecv) References ODM2CV.CV_ResultType (term)
on update no Action on delete cascade;

alter table ODM2Core.Results add constraint fk_Results_CV_Status
foreign key (statuscv) References ODM2CV.CV_Status (term)
on update no Action on delete cascade;

alter table ODM2Core.Results add constraint fk_Results_FeatureActions
foreign key (featureactionid) References ODM2Core.FeatureActions (featureactionid)
on update no Action on delete cascade;

alter table ODM2Core.Results add constraint fk_Results_ProcessingLevels
foreign key (processinglevelid) References ODM2Core.ProcessingLevels (processinglevelid)
on update no Action on delete cascade;

alter table ODM2Core.Results add constraint fk_Results_Units
foreign key (unitsid) References ODM2CV.CV_Units (unitsid)
on update no Action on delete cascade;

alter table ODM2Core.Results add constraint fk_Results_Variables
foreign key (variableid) References ODM2Core.Variables (variableid)
on update no Action on delete cascade;

alter table ODM2Core.SamplingFeatures add constraint fk_SamplingFeatures_CV_ElevationDatum
foreign key (elevationdatumcv) References ODM2CV.CV_ElevationDatum (term)
on update no Action on delete cascade;

alter table ODM2Core.SamplingFeatures add constraint fk_SamplingFeatures_CV_SamplingFeatureGeoType
foreign key (samplingfeaturegeotypecv) References ODM2CV.CV_SamplingFeatureGeoType (term)
on update no Action on delete cascade;

alter table ODM2Core.SamplingFeatures add constraint fk_SamplingFeatures_CV_SamplingFeatureType
foreign key (samplingfeaturetypecv) References ODM2CV.CV_SamplingFeatureType (term)
on update no Action on delete cascade;

alter table ODM2Core.TaxonomicClassifiers add constraint fk_TaxonomicClassifiers_CV_TaxonomicClassifierDomain
foreign key (taxonomicclassifierdomaincv) References ODM2CV.CV_TaxonomicClassifierDomain (term)
on update no Action on delete cascade;

alter table ODM2Core.Variables add constraint fk_Variables_CV_Medium
foreign key (sampledmediumcv) References ODM2CV.CV_Medium (term)
on update no Action on delete cascade;

alter table ODM2Core.Variables add constraint fk_Variables_CV_QuantityKind
foreign key (quantitykindcv) References ODM2CV.CV_QuantityKind (term)
on update no Action on delete cascade;

alter table ODM2Core.Variables add constraint fk_Variables_CV_VariableDomain
foreign key (variabledomaincv) References ODM2CV.CV_VariableDomain (term)
on update no Action on delete cascade;

alter table ODM2Core.Variables add constraint fk_Variables_speciationid_TaxonomicClassifiers
foreign key (speciationid) References ODM2Core.TaxonomicClassifiers (taxonomicclassifierid)
on update no Action on delete cascade;

alter table ODM2Core.Variables add constraint fk_Variables_TaxonomicClassifiers
foreign key (taxonomicclassifierid) References ODM2Core.TaxonomicClassifiers (taxonomicclassifierid)
on update no Action on delete cascade;

alter table ODM2CV.CV_Units add constraint fk_Units_CV_QuantityKind
foreign key (quantitykindcv) References ODM2CV.CV_QuantityKind (term)
on update no Action on delete cascade;

alter table ODM2DataQuality.DataQuality add constraint fk_DataQuality_CV_DataQualityType
foreign key (dataqualitytypecv) References ODM2CV.CV_DataQualityType (term)
on update no Action on delete cascade;

alter table ODM2DataQuality.ReferenceMaterials add constraint fk_ReferenceMaterials_CV_Medium
foreign key (referencematerialmediumcv) References ODM2CV.CV_Medium (term)
on update no Action on delete cascade;

alter table ODM2DataQuality.ReferenceMaterials add constraint fk_ReferenceMaterials_Organizations
foreign key (referencematerialorganizationid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2DataQuality.ReferenceMaterials add constraint fk_ReferenceMaterials_SamplingFeatures
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2DataQuality.ReferenceMaterialValues add constraint fk_ReferenceMaterialValues_Citations
foreign key (citationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2DataQuality.ReferenceMaterialValues add constraint fk_ReferenceMaterialValues_ReferenceMaterials
foreign key (referencematerialid) References ODM2DataQuality.ReferenceMaterials (referencematerialid)
on update no Action on delete cascade;

alter table ODM2DataQuality.ReferenceMaterialValues add constraint fk_ReferenceMaterialValues_Variables
foreign key (variableid) References ODM2Core.Variables (variableid)
on update no Action on delete cascade;

alter table ODM2DataQuality.ResultNormalizationValues add constraint fk_ResultNormalizationValues_ReferenceMaterialValues
foreign key (normalizedbyreferencematerialvalueid) References ODM2DataQuality.ReferenceMaterialValues (referencematerialvalueid)
on update no Action on delete cascade;

alter table ODM2DataQuality.ResultNormalizationValues add constraint fk_ResultNormalizationValues_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2DataQuality.ResultsDataQuality add constraint fk_ResultsDataQuality_DataQuality
foreign key (dataqualityid) References ODM2DataQuality.DataQuality (dataqualityid)
on update no Action on delete cascade;

alter table ODM2DataQuality.ResultsDataQuality add constraint fk_ResultsDataQuality_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Equipment.CalibrationActions add constraint fk_CalibrationActions_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2Equipment.CalibrationActions add constraint fk_CalibrationActions_InstrumentOutputVariables
foreign key (instrumentoutputvariableid) References ODM2Equipment.InstrumentOutputQuantityKind (instrumentoutputquantitykindid)
on update no Action on delete cascade;

alter table ODM2Equipment.CalibrationReferenceEquipment add constraint fk_CalibrationReferenceEquipment_CalibrationActions
foreign key (actionid) References ODM2Equipment.CalibrationActions (actionid)
on update no Action on delete cascade;

alter table ODM2Equipment.CalibrationReferenceEquipment add constraint fk_CalibrationReferenceEquipment_Equipment
foreign key (equipmentid) References ODM2Equipment.Equipment (equipmentid)
on update no Action on delete cascade;

alter table ODM2Equipment.CalibrationStandards add constraint fk_CalibrationStandards_CalibrationActions
foreign key (actionid) References ODM2Equipment.CalibrationActions (actionid)
on update no Action on delete cascade;

alter table ODM2Equipment.CalibrationStandards add constraint fk_FieldCalibrationStandards_ReferenceMaterials
foreign key (referencematerialid) References ODM2DataQuality.ReferenceMaterials (referencematerialid)
on update no Action on delete cascade;

alter table ODM2Equipment.DataloggerFileColumns add constraint fk_DataloggerFileColumns_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Equipment.DataloggerFileColumns add constraint fk_DataloggerFileColumns_DataLoggerFiles
foreign key (dataloggerfileid) References ODM2Equipment.DataLoggerFiles (dataloggerfileid)
on update no Action on delete cascade;

alter table ODM2Equipment.DataloggerFileColumns add constraint fk_DataloggerFileColumns_InstrumentOutputQuantityKind
foreign key (instrumentoutputquantitykindid) References ODM2Equipment.InstrumentOutputQuantityKind (instrumentoutputquantitykindid)
on update no Action on delete cascade;

alter table ODM2Equipment.DataloggerFileColumns add constraint fk_DataloggerFileColumns_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Equipment.DataLoggerFiles add constraint fk_DataLoggerFiles_DataloggerProgramFiles
foreign key (programid) References ODM2Equipment.DataloggerProgramFiles (programid)
on update no Action on delete cascade;

alter table ODM2Equipment.DataloggerProgramFiles add constraint fk_DataloggerProgramFiles_Affiliations
foreign key (affiliationid) References ODM2Core.Affiliations (affiliationid)
on update no Action on delete cascade;

alter table ODM2Equipment.Equipment add constraint fk_Equipment_EquipmentModels
foreign key (equipmentmodelid) References ODM2Equipment.EquipmentModels (equipmentmodelid)
on update no Action on delete cascade;

alter table ODM2Equipment.Equipment add constraint fk_Equipment_Organizations
foreign key (equipmentvendorid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2Equipment.Equipment add constraint fk_Equipment_People
foreign key (equipmentownerid) References ODM2Core.People (personid)
on update no Action on delete cascade;

alter table ODM2Equipment.EquipmentModels add constraint fk_EquipmentModels_CV_EquipmentType
foreign key (equipmenttypecv) References ODM2CV.CV_EquipmentType (term)
on update no Action on delete cascade;

alter table ODM2Equipment.EquipmentModels add constraint fk_EquipmentModels_Organizations
foreign key (modelmanufacturerid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2Equipment.EquipmentUsed add constraint fk_EquipmentActions_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2Equipment.EquipmentUsed add constraint fk_EquipmentActions_Equipment
foreign key (equipmentid) References ODM2Equipment.Equipment (equipmentid)
on update no Action on delete cascade;

alter table ODM2Equipment.InstrumentOutputQuantityKind add constraint fk_InstrumentOutputQuantityKind_Methods
foreign key (instrumentmethodid) References ODM2Core.Methods (methodid)
on update no Action on delete cascade;

alter table ODM2Equipment.InstrumentOutputQuantityKind add constraint fk_InstrumentOutputQuantityKind_Variables
foreign key (instrumentstandardoutputvariable) References ODM2Core.Variables (variableid)
on update no Action on delete cascade;

alter table ODM2Equipment.InstrumentOutputQuantityKind add constraint fk_InstrumentOutputVariables_CV_QuantityKind
foreign key (quantitykind) References ODM2CV.CV_QuantityKind (term)
on update no Action on delete cascade;

alter table ODM2Equipment.InstrumentOutputQuantityKind add constraint fk_InstrumentOutputVariables_CV_Units
foreign key (instrumentrawoutputunitsid) References ODM2CV.CV_Units (unitsid)
on update no Action on delete cascade;

alter table ODM2Equipment.InstrumentOutputQuantityKind add constraint fk_InstrumentOutputVariables_EquipmentModels
foreign key (equipmentmodelid) References ODM2Equipment.EquipmentModels (equipmentmodelid)
on update no Action on delete cascade;

alter table ODM2Equipment.MaintenanceActions add constraint fk_MaintenanceActions_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2Equipment.RelatedEquipment add constraint fk_RelatedEquipment_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2Equipment.RelatedEquipment add constraint fk_RelatedEquipment_Equipment
foreign key (equipmentid) References ODM2Equipment.Equipment (equipmentid)
on update no Action on delete cascade;

alter table ODM2Equipment.RelatedEquipment add constraint fk_RelatedEquipment_Equipment_AreRelated
foreign key (relatedequipmentid) References ODM2Equipment.Equipment (equipmentid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.ActionExtensionPropertyValues add constraint fk_ActionExtensionPropertyValues_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.ActionExtensionPropertyValues add constraint fk_ActionExtensionPropertyValues_ExtensionProperties
foreign key (propertyid) References ODM2ExtensionProperties.ExtensionProperties (propertyid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.CitationExtensionPropertyValues add constraint fk_CitationExtensionPropertyValues_Citations
foreign key (citationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.CitationExtensionPropertyValues add constraint fk_CitationExtensionPropertyValues_ExtensionProperties
foreign key (propertyid) References ODM2ExtensionProperties.ExtensionProperties (propertyid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.ExtensionProperties add constraint fk_ExtensionProperties_CV_PropertyDataType
foreign key (propertydatatypecv) References ODM2CV.CV_PropertyDataType (term)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.MethodExtensionPropertyValues add constraint fk_MethodExtensionPropertyValues_ExtensionProperties
foreign key (propertyid) References ODM2ExtensionProperties.ExtensionProperties (propertyid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.MethodExtensionPropertyValues add constraint fk_MethodExtensionPropertyValues_Methods
foreign key (methodid) References ODM2Core.Methods (methodid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.ResultExtensionPropertyValues add constraint fk_ResultExtensionPropertyValues_ExtensionProperties
foreign key (propertyid) References ODM2ExtensionProperties.ExtensionProperties (propertyid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.ResultExtensionPropertyValues add constraint fk_ResultExtensionPropertyValues_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.SamplingFeatureExtensionPropertyValues add constraint fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties
foreign key (propertyid) References ODM2ExtensionProperties.ExtensionProperties (propertyid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.SamplingFeatureExtensionPropertyValues add constraint fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.VariableExtensionPropertyValues add constraint fk_VariableExtensionPropertyValues_ExtensionProperties
foreign key (propertyid) References ODM2ExtensionProperties.ExtensionProperties (propertyid)
on update no Action on delete cascade;

alter table ODM2ExtensionProperties.VariableExtensionPropertyValues add constraint fk_VariableExtensionPropertyValues_Variables
foreign key (variableid) References ODM2Core.Variables (variableid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.CitationExternalIdentifiers add constraint fk_CitationExternalIdentifiers_Citations
foreign key (citationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.CitationExternalIdentifiers add constraint fk_CitationExternalIdentifiers_ExternalIdentifierSystems
foreign key (externalidentifiersystemid) References ODM2ExternalIdentifiers.ExternalIdentifierSystems (externalidentifiersystemid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.ExternalIdentifierSystems add constraint fk_ExternalIdentifierSystems_Organizations
foreign key (identifiersystemorganizationid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.MethodExternalIdentifiers add constraint fk_MethodExternalIdentifiers_ExternalIdentifierSystems
foreign key (externalidentifiersystemid) References ODM2ExternalIdentifiers.ExternalIdentifierSystems (externalidentifiersystemid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.MethodExternalIdentifiers add constraint fk_MethodExternalIdentifiers_Methods
foreign key (methodid) References ODM2Core.Methods (methodid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.PersonExternalIdentifiers add constraint fk_PersonExternalIdentifiers_ExternalIdentifierSystems
foreign key (externalidentifiersystemid) References ODM2ExternalIdentifiers.ExternalIdentifierSystems (externalidentifiersystemid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.PersonExternalIdentifiers add constraint fk_PersonExternalIdentifiers_People
foreign key (personid) References ODM2Core.People (personid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.ReferenceMaterialExternalIdentifiers add constraint fk_RefMaterialExtIdentifiers_ExtIdentifierSystems
foreign key (externalidentifiersystemid) References ODM2ExternalIdentifiers.ExternalIdentifierSystems (externalidentifiersystemid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.ReferenceMaterialExternalIdentifiers add constraint fk_RefMaterialExtIdentifiers_RefMaterials
foreign key (referencematerialid) References ODM2DataQuality.ReferenceMaterials (referencematerialid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers add constraint fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems
foreign key (externalidentifiersystemid) References ODM2ExternalIdentifiers.ExternalIdentifierSystems (externalidentifiersystemid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.SamplingFeatureExternalIdentifiers add constraint fk_SamplingFeatureExternalIdentifiers_SamplingFeatures
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.SpatialReferenceExternalIdentifiers add constraint fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems
foreign key (externalidentifiersystemid) References ODM2ExternalIdentifiers.ExternalIdentifierSystems (externalidentifiersystemid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.SpatialReferenceExternalIdentifiers add constraint fk_SpatialReferenceExternalIdentifiers_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.TaxonomicClassifierExternalIdentifiers add constraint fk_TaxonomicClassifierExtIDs_ExtIDSystems
foreign key (externalidentifiersystemid) References ODM2ExternalIdentifiers.ExternalIdentifierSystems (externalidentifiersystemid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.TaxonomicClassifierExternalIdentifiers add constraint fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers
foreign key (taxonomicclassifierid) References ODM2Core.TaxonomicClassifiers (taxonomicclassifierid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.VariableExternalIdentifiers add constraint fk_VariableExternalIdentifiers_ExternalIdentifierSystems
foreign key (externalidentifiersystemid) References ODM2ExternalIdentifiers.ExternalIdentifierSystems (externalidentifiersystemid)
on update no Action on delete cascade;

alter table ODM2ExternalIdentifiers.VariableExternalIdentifiers add constraint fk_VariableExternalIdentifiers_Variables
foreign key (variableid) References ODM2Core.Variables (variableid)
on update no Action on delete cascade;

alter table ODM2LabAnalyses.ActionDirectives add constraint fk_ActionDirectives_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2LabAnalyses.ActionDirectives add constraint fk_ActionDirectives_Directives
foreign key (directiveid) References ODM2LabAnalyses.Directives (directiveid)
on update no Action on delete cascade;

alter table ODM2LabAnalyses.Directives add constraint fk_Directives_CV_DirectiveType
foreign key (directivetypecv) References ODM2CV.CV_DirectiveType (term)
on update no Action on delete cascade;

alter table ODM2LabAnalyses.SpecimenBatchPositions add constraint fk_SpecimenBatchPostions_FeatureActions
foreign key (featureactionid) References ODM2Core.FeatureActions (featureactionid)
on update no Action on delete cascade;

alter table ODM2Provenance.AuthorLists add constraint fk_AuthorLists_Citations
foreign key (citationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2Provenance.AuthorLists add constraint fk_AuthorLists_People
foreign key (personid) References ODM2Core.People (personid)
on update no Action on delete cascade;

alter table ODM2Provenance.DatasetCitations add constraint fk_DataSetCitations_Citations
foreign key (citationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2Provenance.DatasetCitations add constraint fk_DatasetCitations_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2Provenance.DatasetCitations add constraint fk_DataSetCitations_DataSets
foreign key (datasetid) References ODM2Core.Datasets (datasetid)
on update no Action on delete cascade;

alter table ODM2Provenance.MethodCitations add constraint fk_MethodCitations_Citations
foreign key (citationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2Provenance.MethodCitations add constraint fk_MethodCitations_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2Provenance.MethodCitations add constraint fk_MethodCitations_Methods
foreign key (methodid) References ODM2Core.Methods (methodid)
on update no Action on delete cascade;

alter table ODM2Provenance.OrganizationsSamplingFeatures add constraint fk_CV_ResultType_OrganizationSamplingFeatures
foreign key (relationshiptypecv) References ODM2CV.CV_ResultType (term)
on update no Action on delete cascade;

alter table ODM2Provenance.OrganizationsSamplingFeatures add constraint fk_OrganizationsSamplingFeatures_Organizations
foreign key (organizationid) References ODM2Core.Organizations (organizationid)
on update no Action on delete cascade;

alter table ODM2Provenance.OrganizationsSamplingFeatures add constraint fk_SamplingFeatures_OrganizationSamplingFeatures
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedAnnotations add constraint fk_RelatedAnnotations_Annotations
foreign key (annotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedAnnotations add constraint fk_RelatedAnnotations_Annotations_AreRelated
foreign key (relatedannotationid) References ODM2Annotations.Annotations (annotationid)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedAnnotations add constraint fk_RelatedAnnotations_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedCitations add constraint fk_RelatedCitations_Citations
foreign key (citationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedCitations add constraint fk_RelatedCitations_Citations_AreRelated
foreign key (relatedcitationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedCitations add constraint fk_RelatedCitations_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedDatasets add constraint fk_RelatedDatasets_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedDatasets add constraint fk_RelatedDatasets_DataSets
foreign key (datasetid) References ODM2Core.Datasets (datasetid)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedDatasets add constraint fk_RelatedDatasets_DataSets_AreRelated
foreign key (relateddatasetid) References ODM2Core.Datasets (datasetid)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedResults add constraint fk_RelatedResults_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedResults add constraint fk_RelatedResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Provenance.RelatedResults add constraint fk_RelatedResults_Results_AreRelated
foreign key (relatedresultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Provenance.ResultDerivationEquations add constraint fk_ResultDerivationEquations_DerivationEquations
foreign key (derivationequationid) References ODM2Provenance.DerivationEquations (derivationequationid)
on update no Action on delete cascade;

alter table ODM2Provenance.ResultDerivationEquations add constraint fk_ResultDerivationEquations_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.CategoricalResults add constraint fk_CategoricalResults_CV_QualityCode
foreign key (qualitycodecv) References ODM2CV.CV_QualityCode (term)
on update no Action on delete cascade;

alter table ODM2Results.CategoricalResults add constraint fk_CategoricalResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.CategoricalResults add constraint fk_CategoricalResults_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2Results.CategoricalResultValues add constraint fk_CategoricalResultValues_CategoricalResults
foreign key (resultid) References ODM2Results.CategoricalResults (resultid)
on update no Action on delete cascade;

alter table ODM2Results.MeasurementResults add constraint fk_MeasurementResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.MeasurementResults add constraint fk_MeasurementResults_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2Results.MeasurementResultValues add constraint fk_MeasurementResultValues_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.MeasurementResultValues add constraint fk_MeasurementResultValues_CV_CensorCode
foreign key (censorcodecv) References ODM2CV.CV_CensorCode (term)
on update no Action on delete cascade;

alter table ODM2Results.MeasurementResultValues add constraint fk_MeasurementResultValues_CV_QualityCode
foreign key (qualitycodecv) References ODM2CV.CV_QualityCode (term)
on update no Action on delete cascade;

alter table ODM2Results.MeasurementResultValues add constraint fk_MeasurementResultValues_MeasurementResults
foreign key (resultid) References ODM2Results.MeasurementResults (resultid)
on update no Action on delete cascade;

alter table ODM2Results.PointCoverageResults add constraint fk_PointCoverageResults_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.PointCoverageResults add constraint fk_PointCoverageResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.PointCoverageResults add constraint fk_PointCoverageResults_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2Results.PointCoverageResultValues add constraint fk_PointCoverageResultValues_CV_CensorCode
foreign key (censorcodecv) References ODM2CV.CV_CensorCode (term)
on update no Action on delete cascade;

alter table ODM2Results.PointCoverageResultValues add constraint fk_PointCoverageResultValues_CV_QualityCode
foreign key (qualitycodecv) References ODM2CV.CV_QualityCode (term)
on update no Action on delete cascade;

alter table ODM2Results.PointCoverageResultValues add constraint fk_PointCoverageResultValues_PointCoverageResults
foreign key (resultid) References ODM2Results.PointCoverageResults (resultid)
on update no Action on delete cascade;

alter table ODM2Results.ProfileResults add constraint fk_ProfileResults_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.ProfileResults add constraint fk_ProfileResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.ProfileResults add constraint fk_ProfileResults_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2Results.ProfileResultValues add constraint fk_ProfileResultValues_CV_CensorCode
foreign key (censorcodecv) References ODM2CV.CV_CensorCode (term)
on update no Action on delete cascade;

alter table ODM2Results.ProfileResultValues add constraint fk_ProfileResultValues_CV_QualityCode
foreign key (qualitycodecv) References ODM2CV.CV_QualityCode (term)
on update no Action on delete cascade;

alter table ODM2Results.ProfileResultValues add constraint fk_ProfileResultValues_ProfileResults
foreign key (resultid) References ODM2Results.ProfileResults (resultid)
on update no Action on delete cascade;

alter table ODM2Results.SectionResults add constraint fk_SectionResults_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.SectionResults add constraint fk_SectionResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.SectionResults add constraint fk_SectionResults_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2Results.SectionResultValues add constraint fk_SectionResultValues_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.SectionResultValues add constraint fk_SectionResultValues_CV_CensorCode
foreign key (censorcodecv) References ODM2CV.CV_CensorCode (term)
on update no Action on delete cascade;

alter table ODM2Results.SectionResultValues add constraint fk_SectionResultValues_CV_QualityCode
foreign key (qualitycodecv) References ODM2CV.CV_QualityCode (term)
on update no Action on delete cascade;

alter table ODM2Results.SectionResultValues add constraint fk_SectionResultValues_SectionResults
foreign key (resultid) References ODM2Results.SectionResults (resultid)
on update no Action on delete cascade;

alter table ODM2Results.SpectraResults add constraint fk_SpectraResults_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.SpectraResults add constraint fk_SpectraResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.SpectraResults add constraint fk_SpectraResults_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2Results.SpectraResultValues add constraint fk_SpectraResultValues_CV_CensorCode
foreign key (censorcodecv) References ODM2CV.CV_CensorCode (term)
on update no Action on delete cascade;

alter table ODM2Results.SpectraResultValues add constraint fk_SpectraResultValues_CV_QualityCode
foreign key (qualitycodecv) References ODM2CV.CV_QualityCode (term)
on update no Action on delete cascade;

alter table ODM2Results.SpectraResultValues add constraint fk_SpectraResultValues_SpectraResults
foreign key (resultid) References ODM2Results.SpectraResults (resultid)
on update no Action on delete cascade;

alter table ODM2Results.TimeSeriesResults add constraint fk_TimeSeriesResults_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.TimeSeriesResults add constraint fk_TimeSeriesResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.TimeSeriesResults add constraint fk_TimeSeriesResults_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2Results.TimeSeriesResultValues add constraint fk_TimeSeriesResultValues_CV_CensorCode
foreign key (censorcodecv) References ODM2CV.CV_CensorCode (term)
on update no Action on delete cascade;

alter table ODM2Results.TimeSeriesResultValues add constraint fk_TimeSeriesResultValues_CV_QualityCode
foreign key (qualitycodecv) References ODM2CV.CV_QualityCode (term)
on update no Action on delete cascade;

alter table ODM2Results.TimeSeriesResultValues add constraint fk_TimeSeriesResultValues_TimeSeriesResults
foreign key (resultid) References ODM2Results.TimeSeriesResults (resultid)
on update no Action on delete cascade;

alter table ODM2Results.TrajectoryResults add constraint fk_TrajectoryResults_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.TrajectoryResults add constraint fk_TrajectoryResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.TrajectoryResults add constraint fk_TrajectoryResults_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2Results.TrajectoryResultValues add constraint fk_TrajectoryResultValues_CV_CensorCode
foreign key (censorcodecv) References ODM2CV.CV_CensorCode (term)
on update no Action on delete cascade;

alter table ODM2Results.TrajectoryResultValues add constraint fk_TrajectoryResultValues_CV_QualityCode
foreign key (qualitycodecv) References ODM2CV.CV_QualityCode (term)
on update no Action on delete cascade;

alter table ODM2Results.TrajectoryResultValues add constraint fk_TrajectoryResultValues_TrajectoryResults
foreign key (resultid) References ODM2Results.TrajectoryResults (resultid)
on update no Action on delete cascade;

alter table ODM2Results.TransectResults add constraint fk_TransectResults_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.TransectResults add constraint fk_TransectResults_Results
foreign key (resultid) References ODM2Core.Results (resultid)
on update no Action on delete cascade;

alter table ODM2Results.TransectResults add constraint fk_TransectResults_SpatialReferences
foreign key (spatialreferenceid) References ODM2SamplingFeatures.SpatialReferences (spatialreferenceid)
on update no Action on delete cascade;

alter table ODM2Results.TransectResultValues add constraint fk_TransectResultValues_CV_AggregationStatistic
foreign key (aggregationstatisticcv) References ODM2CV.CV_AggregationStatistic (term)
on update no Action on delete cascade;

alter table ODM2Results.TransectResultValues add constraint fk_TransectResultValues_CV_CensorCode
foreign key (censorcodecv) References ODM2CV.CV_CensorCode (term)
on update no Action on delete cascade;

alter table ODM2Results.TransectResultValues add constraint fk_TransectResultValues_CV_QualityCode
foreign key (qualitycodecv) References ODM2CV.CV_QualityCode (term)
on update no Action on delete cascade;

alter table ODM2Results.TransectResultValues add constraint fk_TransectResultValues_TransectResults
foreign key (resultid) References ODM2Results.TransectResults (resultid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.FeaturesOfInterest add constraint fk_featuresofinterest_cv_featureofinteresttype
foreign key (featuresofinteresttypecv) References ODM2CV.CV_FeaturesOfInterestType (term)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.RelatedFeatures add constraint fk_FeatureParents_FeaturesParent
foreign key (relatedfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.RelatedFeatures add constraint fk_FeatureParents_SamplingFeatures
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.RelatedFeatures add constraint fk_FeatureParents_SpatialOffsets
foreign key (spatialoffsetid) References ODM2SamplingFeatures.SpatialOffsets (spatialoffsetid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.RelatedFeatures add constraint fk_RelatedFeatures_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.SampledFeatures add constraint fk_SampledFeatures_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.SampledFeatures add constraint fk_SampledFeatures_FeatureOfInterest
foreign key (featureofinterestid) References ODM2SamplingFeatures.FeaturesOfInterest (featuresofinterestid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.SampledFeatures add constraint fk_SampledFeatures_SamplingFeatures
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.SpatialOffsets add constraint fk_SpatialOffsets_CV_SpatialOffsetType
foreign key (spatialoffsettypecv) References ODM2CV.CV_SpatialOffsetType (term)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.SpecimenCollection add constraint fk_SpecimenCollection_SpecimenCollection
foreign key (parentspecimencollectionid) References ODM2SamplingFeatures.SpecimenCollection (specimencollectionid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.Specimens add constraint fk_Specimens_CV_Medium
foreign key (specimenmediumcv) References ODM2CV.CV_Medium (term)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.Specimens add constraint fk_Specimens_CV_SpecimenType
foreign key (specimentypecv) References ODM2CV.CV_SpecimenType (term)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.Specimens add constraint fk_Specimens_SamplingFeatures
foreign key (samplingfeatureid) References ODM2Core.SamplingFeatures (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.Specimens add constraint fk_Specimens_SpecimenCollection
foreign key (specimencollectionid) References ODM2SamplingFeatures.SpecimenCollection (specimencollectionid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.SpecimenTaxonomicClassifiers add constraint fk_SpecimenTaxonomicClassifiers_Citations
foreign key (citationid) References ODM2Provenance.Citations (citationid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.SpecimenTaxonomicClassifiers add constraint fk_SpecimenTaxonomicClassifiers_Specimens
foreign key (samplingfeatureid) References ODM2SamplingFeatures.Specimens (samplingfeatureid)
on update no Action on delete cascade;

alter table ODM2SamplingFeatures.SpecimenTaxonomicClassifiers add constraint fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers
foreign key (taxonomicclassifierid) References ODM2Core.TaxonomicClassifiers (taxonomicclassifierid)
on update no Action on delete cascade;

alter table ODM2Simulation.ModelAffiliations add constraint fk_ModelAffiliations_Affiliations
foreign key (affiliationid) References ODM2Core.Affiliations (affiliationid)
on update no Action on delete cascade;

alter table ODM2Simulation.ModelAffiliations add constraint fk_ModelAffiliations_Models
foreign key (modelid) References ODM2Simulation.Models (modelid)
on update no Action on delete cascade;

alter table ODM2Simulation.RelatedModels add constraint fk_RelatedModels_CV_RelationshipType
foreign key (relationshiptypecv) References ODM2CV.CV_RelationshipType (term)
on update no Action on delete cascade;

alter table ODM2Simulation.RelatedModels add constraint fk_RelatedModels_Models
foreign key (modelid) References ODM2Simulation.Models (modelid)
on update no Action on delete cascade;

alter table ODM2Simulation.Simulations add constraint fk_Simulations_Actions
foreign key (actionid) References ODM2Core.Actions (actionid)
on update no Action on delete cascade;

alter table ODM2Simulation.Simulations add constraint fk_Simulations_Models
foreign key (modelid) References ODM2Simulation.Models (modelid)
on update no Action on delete cascade;

