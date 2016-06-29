
CREATE EXTENSION if not exists postgis;
CREATE EXTENSION if not exists postgis_topology;
CREATE EXTENSION if not exists fuzzystrmatch;
CREATE EXTENSION if not exists postgis_tiger_geoCoder;

drop schema if exists ODM2 cascade;

create schema ODM2;

/***************************************************************************/
/************************* CREATE ODM2ANNOTATIONS **************************/
/***************************************************************************/

create table ODM2.ActionAnnotations (
	bridgeid serial  NOT NULL primary key,
	actionid integer  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.Annotations (
	annotationid serial  NOT NULL primary key,
	annotationtypecv varchar (255) NOT NULL,
	annotationcode varchar (50) NULL,
	annotationtext varchar (500) NOT NULL,
	annotationdatetime timestamp  NULL,
	annotationutcoffset integer  NULL,
	annotationlink varchar (255) NULL,
	annotatorid integer  NULL,
	citationid integer  NULL
);
create table ODM2.CategoricalResultValueAnnotations (
	bridgeid serial  NOT NULL primary key,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.EquipmentAnnotations (
	bridgeid serial  NOT NULL primary key,
	equipmentid integer  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.MeasurementResultValueAnnotations (
	bridgeid serial  NOT NULL primary key,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.MethodAnnotations (
	bridgeid serial  NOT NULL primary key,
	methodid integer  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.PointCoverageResultValueAnnotations (
	bridgeid bigserial  NOT NULL primary key,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.ProfileResultValueAnnotations (
	bridgeid serial  NOT NULL primary key,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.ResultAnnotations (
	bridgeid serial  NOT NULL primary key,
	resultid bigint  NOT NULL,
	annotationid integer  NOT NULL,
	begindatetime timestamp  NOT NULL,
	enddatetime timestamp  NOT NULL
);
create table ODM2.SamplingFeatureAnnotations (
	bridgeid serial  NOT NULL primary key,
	samplingfeatureid integer  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.SectionResultValueAnnotations (
	bridgeid serial  NOT NULL primary key,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.SpectraResultValueAnnotations (
	bridgeid serial  NOT NULL primary key,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.TimeSeriesResultValueAnnotations (
	bridgeid serial  NOT NULL primary key,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.TrajectoryResultValueAnnotations (
	bridgeid serial  NOT NULL primary key,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
create table ODM2.TransectResultValueAnnotations (
	bridgeid serial  NOT NULL primary key,
	valueid bigint  NOT NULL,
	annotationid integer  NOT NULL
);
/***************************************************************************/
/***************************** CREATE ODM2CORE *****************************/
/***************************************************************************/

create table ODM2.ActionBy (
	bridgeid serial  NOT NULL primary key,
	actionid integer  NOT NULL,
	affiliationid integer  NOT NULL,
	isactionlead boolean  NOT NULL,
	roledescription varchar (5000) NULL
);
create table ODM2.Actions (
	actionid serial  NOT NULL primary key,
	actiontypecv varchar (255) NOT NULL,
	methodid integer  NOT NULL,
	begindatetime timestamp  NOT NULL,
	begindatetimeutcoffset integer  NOT NULL,
	enddatetime timestamp  NULL,
	enddatetimeutcoffset integer  NULL,
	actiondescription varchar (5000) NULL,
	actionfilelink varchar (255) NULL
);
create table ODM2.Affiliations (
	affiliationid serial  NOT NULL primary key,
	personid integer  NOT NULL,
	organizationid integer  NULL,
	isprimaryorganizationcontact boolean  NULL,
	affiliationstartdate date  NOT NULL,
	affiliationenddate date  NULL,
	primaryphone varchar (50) NULL,
	primaryemail varchar (255) NOT NULL,
	primaryaddress varchar (255) NULL,
	personlink varchar (255) NULL
);
create table ODM2.Datasets (
	datasetid serial  NOT NULL primary key,
	datasetuuid uuid  NOT NULL,
	datasettypecv varchar (255) NOT NULL,
	datasetcode varchar (50) NOT NULL,
	datasettitle varchar (255) NOT NULL,
	datasetabstract  varchar (5000) NOT NULL,
	UNIQUE (DatasetCode)
);
create table ODM2.DatasetsResults (
	bridgeid serial  NOT NULL primary key,
	datasetid integer  NOT NULL,
	resultid bigint  NOT NULL
);
create table ODM2.FeatureActions (
	featureactionid serial  NOT NULL primary key,
	samplingfeatureid integer  NOT NULL,
	actionid integer  NOT NULL
);
create table ODM2.Methods (
	methodid serial  NOT NULL primary key,
	methodtypecv varchar (255) NOT NULL,
	methodcode varchar (50) NOT NULL,
	methodname varchar (255) NOT NULL,
	methoddescription varchar (5000) NULL,
	methodlink varchar (255) NULL,
	organizationid integer  NULL,
	UNIQUE (MethodCode)
);
create table ODM2.Organizations (
	organizationid serial  NOT NULL primary key,
	organizationtypecv varchar (255) NOT NULL,
	organizationcode varchar (50) NOT NULL,
	organizationname varchar (255) NOT NULL,
	organizationdescription varchar (5000) NULL,
	organizationlink varchar (255) NULL,
	parentorganizationid integer  NULL,
	UNIQUE (OrganizationCode)
);
create table ODM2.People (
	personid serial  NOT NULL primary key,
	personfirstname varchar (255) NOT NULL,
	personmiddlename varchar (255) NULL,
	personlastname varchar (255) NOT NULL
);
create table ODM2.ProcessingLevels (
	processinglevelid serial  NOT NULL primary key,
	processinglevelcode varchar (50) NOT NULL,
	definition  varchar (5000) NULL,
	explanation  varchar (5000) NULL,
	UNIQUE (ProcessingLevelCode)
);
create table ODM2.RelatedActions (
	relationid serial  NOT NULL primary key,
	actionid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedactionid integer  NOT NULL
);
create table ODM2.Results (
	resultid bigserial  NOT NULL primary key,
	resultuuid uuid  NOT NULL,
	featureactionid integer  NOT NULL,
	resulttypecv varchar (255) NOT NULL,
	variableid integer  NOT NULL,
	unitsid integer  NOT NULL,
	taxonomicclassifierid integer  NULL,
	processinglevelid integer  NOT NULL,
	resultdatetime timestamp  NULL,
	resultdatetimeutcoffset bigint  NULL,
	validdatetime timestamp  NULL,
	validdatetimeutcoffset bigint  NULL,
	statuscv varchar (255) NULL,
	sampledmediumcv varchar (255) NOT NULL,
	valuecount integer  NOT NULL
);
create table ODM2.SamplingFeatures (
	samplingfeatureid serial  NOT NULL primary key,
	samplingfeatureuuid uuid  NOT NULL,
	samplingfeaturetypecv varchar (255) NOT NULL,
	samplingfeaturecode varchar (50) NOT NULL,
	samplingfeaturename varchar (255) NULL,
	samplingfeaturedescription varchar (5000) NULL,
	samplingfeaturegeotypecv varchar (255) NULL,
	featuregeometry geometry  NULL,
	featuregeometrywkt varchar (8000) NULL,
	elevation_m double precision  NULL,
	elevationdatumcv varchar (255) NULL,
	UNIQUE (SamplingFeatureCode)
);
create table ODM2.TaxonomicClassifiers (
	taxonomicclassifierid serial  NOT NULL primary key,
	taxonomicclassifiertypecv varchar (255) NOT NULL,
	taxonomicclassifiername varchar (255) NOT NULL,
	taxonomicclassifiercommonname varchar (255) NULL,
	taxonomicclassifierdescription varchar (5000) NULL,
	parenttaxonomicclassifierid integer  NULL
);
create table ODM2.Units (
	unitsid serial  NOT NULL primary key,
	unitstypecv varchar (255) NOT NULL,
	unitsabbreviation varchar (50) NOT NULL,
	unitsname varchar (255) NOT NULL,
	unitslink varchar (255) NULL
);
create table ODM2.Variables (
	variableid serial  NOT NULL primary key,
	variabletypecv varchar (255) NOT NULL,
	variablecode varchar (50) NOT NULL,
	variablenamecv varchar (255) NOT NULL,
	variabledefinition varchar (500) NULL,
	speciationcv varchar (255) NULL,
	nodatavalue double precision  NOT NULL,
	UNIQUE (VariableCode)
);
/***************************************************************************/
/****************************** CREATE ODM2CV ******************************/
/***************************************************************************/

create table ODM2.CV_ActionType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_AggregationStatistic (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_AnnotationType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_CensorCode (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_DataQualityType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_DatasetType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_DirectiveType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_ElevationDatum (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_EquipmentType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_Medium (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_MethodType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_OrganizationType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_PropertyDataType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_QualityCode (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_RelationshipType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_ResultType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_SamplingFeatureGeoType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_SamplingFeatureType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_SiteType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_SpatialOffsetType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_Speciation (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_SpecimenType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_Status (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_TaxonomicClassifierType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_UnitsType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_VariableName (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
create table ODM2.CV_VariableType (
	term varchar (255) NOT NULL,
	name varchar (255) NOT NULL primary key,
	definition varchar (5000) NULL,
	category varchar (255) NULL,
	sourcevocabularyuri varchar (255) NULL
);
/***************************************************************************/
/************************* CREATE ODM2DATAQUALITY **************************/
/***************************************************************************/

create table ODM2.DataQuality (
	dataqualityid integer  NOT NULL primary key,
	dataqualitytypecv varchar (255) NOT NULL,
	dataqualitycode varchar (255) NOT NULL,
	dataqualityvalue double precision  NULL,
	dataqualityvalueunitsid integer  NULL,
	dataqualitydescription varchar (5000) NULL,
	dataqualitylink varchar (255) NULL,
	UNIQUE (DataQualityCode)
);
create table ODM2.ReferenceMaterials (
	referencematerialid serial  NOT NULL primary key,
	referencematerialmediumcv varchar (255) NOT NULL,
	referencematerialorganizationid integer  NOT NULL,
	referencematerialcode varchar (50) NOT NULL,
	referencemateriallotcode varchar (255) NULL,
	referencematerialpurchasedate timestamp  NULL,
	referencematerialexpirationdate timestamp  NULL,
	referencematerialcertificatelink varchar (255) NULL,
	samplingfeatureid integer  NULL,
	UNIQUE (ReferenceMaterialCode)
);
create table ODM2.ReferenceMaterialValues (
	referencematerialvalueid serial  NOT NULL primary key,
	referencematerialid integer  NOT NULL,
	referencematerialvalue double precision  NOT NULL,
	referencematerialaccuracy double precision  NULL,
	variableid integer  NOT NULL,
	unitsid integer  NOT NULL,
	citationid integer  NULL
);
create table ODM2.ResultNormalizationValues (
	resultid bigint  NOT NULL primary key,
	normalizedbyreferencematerialvalueid integer  NOT NULL
);
create table ODM2.ResultsDataQuality (
	bridgeid serial  NOT NULL primary key,
	resultid bigint  NOT NULL,
	dataqualityid integer  NOT NULL
);
/***************************************************************************/
/************************** CREATE ODM2EQUIPMENT ***************************/
/***************************************************************************/

create table ODM2.CalibrationActions (
	actionid integer  NOT NULL primary key,
	calibrationcheckvalue double precision  NULL,
	instrumentoutputvariableid integer  NOT NULL,
	calibrationequation varchar (255) NULL
);
create table ODM2.CalibrationReferenceEquipment (
	bridgeid serial  NOT NULL primary key,
	actionid integer  NOT NULL,
	equipmentid integer  NOT NULL
);
create table ODM2.CalibrationStandards (
	bridgeid serial  NOT NULL primary key,
	actionid integer  NOT NULL,
	referencematerialid integer  NOT NULL
);
create table ODM2.DataloggerFileColumns (
	dataloggerfilecolumnid serial  NOT NULL primary key,
	resultid bigint  NULL,
	dataloggerfileid integer  NOT NULL,
	instrumentoutputvariableid integer  NOT NULL,
	columnlabel varchar (50) NOT NULL,
	columndescription varchar (5000) NULL,
	measurementequation varchar (255) NULL,
	scaninterval double precision  NULL,
	scanintervalunitsid integer  NULL,
	recordinginterval double precision  NULL,
	recordingintervalunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NULL
);
create table ODM2.DataLoggerFiles (
	dataloggerfileid serial  NOT NULL primary key,
	programid integer  NOT NULL,
	dataloggerfilename varchar (255) NOT NULL,
	dataloggerfiledescription varchar (5000) NULL,
	dataloggerfilelink varchar (255) NULL
);
create table ODM2.DataloggerProgramFiles (
	programid serial  NOT NULL primary key,
	affiliationid integer  NOT NULL,
	programname varchar (255) NOT NULL,
	programdescription varchar (5000) NULL,
	programversion varchar (50) NULL,
	programfilelink varchar (255) NULL
);
create table ODM2.Equipment (
	equipmentid serial  NOT NULL primary key,
	equipmentcode varchar (50) NOT NULL,
	equipmentname varchar (255) NOT NULL,
	equipmenttypecv varchar (255) NOT NULL,
	equipmentmodelid integer  NOT NULL,
	equipmentserialnumber varchar (50) NOT NULL,
	equipmentownerid integer  NOT NULL,
	equipmentvendorid integer  NOT NULL,
	equipmentpurchasedate timestamp  NOT NULL,
	equipmentpurchaseordernumber varchar (50) NULL,
	equipmentdescription varchar (5000) NULL,
	equipmentdocumentationlink varchar (255) NULL,
	UNIQUE (EquipmentCode)
);
create table ODM2.EquipmentModels (
	equipmentmodelid serial  NOT NULL primary key,
	modelmanufacturerid integer  NOT NULL,
	modelpartnumber varchar (50) NULL,
	modelname varchar (255) NOT NULL,
	modeldescription varchar (5000) NULL,
	isinstrument boolean  NOT NULL,
	modelspecificationsfilelink varchar (255) NULL,
	modellink varchar (255) NULL
);
create table ODM2.EquipmentUsed (
	bridgeid serial  NOT NULL primary key,
	actionid integer  NOT NULL,
	equipmentid integer  NOT NULL
);
create table ODM2.InstrumentOutputVariables (
	instrumentoutputvariableid serial  NOT NULL primary key,
	modelid integer  NOT NULL,
	variableid integer  NOT NULL,
	instrumentmethodid integer  NOT NULL,
	instrumentresolution varchar (255) NULL,
	instrumentaccuracy varchar (255) NULL,
	instrumentrawoutputunitsid integer  NOT NULL
);
create table ODM2.MaintenanceActions (
	actionid integer  NOT NULL primary key,
	isfactoryservice boolean  NOT NULL,
	maintenancecode varchar (50) NULL,
	maintenancereason varchar (500) NULL
);
create table ODM2.RelatedEquipment (
	relationid serial  NOT NULL primary key,
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

create table ODM2.ActionExtensionPropertyValues (
	bridgeid serial  NOT NULL primary key,
	actionid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2.CitationExtensionPropertyValues (
	bridgeid serial  NOT NULL primary key,
	citationid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2.ExtensionProperties (
	propertyid serial  NOT NULL primary key,
	propertyname varchar (255) NOT NULL,
	propertydescription varchar (5000) NULL,
	propertydatatypecv varchar (255) NOT NULL,
	propertyunitsid integer  NULL
);
create table ODM2.MethodExtensionPropertyValues (
	bridgeid serial  NOT NULL primary key,
	methodid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2.ResultExtensionPropertyValues (
	bridgeid serial  NOT NULL primary key,
	resultid bigint  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2.SamplingFeatureExtensionPropertyValues (
	bridgeid serial  NOT NULL primary key,
	samplingfeatureid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
create table ODM2.VariableExtensionPropertyValues (
	bridgeid serial  NOT NULL primary key,
	variableid integer  NOT NULL,
	propertyid integer  NOT NULL,
	propertyvalue varchar (255) NOT NULL
);
/***************************************************************************/
/********************* CREATE ODM2EXTERNALIDENTIFIERS **********************/
/***************************************************************************/

create table ODM2.CitationExternalIdentifiers (
	bridgeid serial  NOT NULL primary key,
	citationid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	citationexternalidentifier varchar (255) NOT NULL,
	citationexternalidentifieruri varchar (255) NULL
);
create table ODM2.ExternalIdentifierSystems (
	externalidentifiersystemid serial  NOT NULL primary key,
	externalidentifiersystemname varchar (255) NOT NULL,
	identifiersystemorganizationid integer  NOT NULL,
	externalidentifiersystemdescription varchar (5000) NULL,
	externalidentifiersystemurl varchar (255) NULL
);
create table ODM2.MethodExternalIdentifiers (
	bridgeid serial  NOT NULL primary key,
	methodid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	methodexternalidentifier varchar (255) NOT NULL,
	methodexternalidentifieruri varchar (255) NULL
);
create table ODM2.PersonExternalIdentifiers (
	bridgeid serial  NOT NULL primary key,
	personid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	personexternalidentifier varchar (255) NOT NULL,
	personexternalidentifieruri varchar (255) NULL
);
create table ODM2.ReferenceMaterialExternalIdentifiers (
	bridgeid serial  NOT NULL primary key,
	referencematerialid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	referencematerialexternalidentifier varchar (255) NOT NULL,
	referencematerialexternalidentifieruri varchar (255) NULL
);
create table ODM2.SamplingFeatureExternalIdentifiers (
	bridgeid serial  NOT NULL primary key,
	samplingfeatureid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	samplingfeatureexternalidentifier varchar (255) NOT NULL,
	samplingfeatureexternalidentifieruri varchar (255) NULL
);
create table ODM2.SpatialReferenceExternalIdentifiers (
	bridgeid serial  NOT NULL primary key,
	spatialreferenceid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	spatialreferenceexternalidentifier varchar (255) NOT NULL,
	spatialreferenceexternalidentifieruri varchar (255) NULL
);
create table ODM2.TaxonomicClassifierExternalIdentifiers (
	bridgeid serial  NOT NULL primary key,
	taxonomicclassifierid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	taxonomicclassifierexternalidentifier varchar (255) NOT NULL,
	taxonomicclassifierexternalidentifieruri varchar (255) NULL
);
create table ODM2.VariableExternalIdentifiers (
	bridgeid serial  NOT NULL primary key,
	variableid integer  NOT NULL,
	externalidentifiersystemid integer  NOT NULL,
	variableexternalidentifer varchar (255) NOT NULL,
	variableexternalidentifieruri varchar (255) NULL
);
/***************************************************************************/
/************************* CREATE ODM2LABANALYSES **************************/
/***************************************************************************/

create table ODM2.ActionDirectives (
	bridgeid serial  NOT NULL primary key,
	actionid integer  NOT NULL,
	directiveid integer  NOT NULL
);
create table ODM2.Directives (
	directiveid serial  NOT NULL primary key,
	directivetypecv varchar (255) NOT NULL,
	directivedescription varchar (5000) NOT NULL
);
create table ODM2.SpecimenBatchPostions (
	featureactionid integer  NOT NULL primary key,
	batchpositionnumber integer  NOT NULL,
	batchpositionlabel varchar (255) NULL
);
/***************************************************************************/
/************************** CREATE ODM2PROVENANCE **************************/
/***************************************************************************/

create table ODM2.AuthorLists (
	bridgeid serial  NOT NULL primary key,
	citationid integer  NOT NULL,
	personid integer  NOT NULL,
	authororder integer  NOT NULL
);
create table ODM2.Citations (
	citationid serial  NOT NULL primary key,
	title varchar (255) NOT NULL,
	publisher varchar (255) NOT NULL,
	publicationyear integer  NOT NULL,
	citationlink varchar (255) NULL
);
create table ODM2.DatasetCitations (
	bridgeid serial  NOT NULL primary key,
	datasetid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	citationid integer  NOT NULL
);
create table ODM2.DerivationEquations (
	derivationequationid serial  NOT NULL primary key,
	derivationequation varchar (255) NOT NULL
);
create table ODM2.MethodCitations (
	bridgeid serial  NOT NULL primary key,
	methodid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	citationid integer  NOT NULL
);
create table ODM2.RelatedAnnotations (
	relationid serial  NOT NULL primary key,
	annotationid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedannotationid integer  NOT NULL
);
create table ODM2.RelatedCitations (
	relationid serial  NOT NULL primary key,
	citationid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedcitationid integer  NOT NULL
);
create table ODM2.RelatedDatasets (
	relationid serial  NOT NULL primary key,
	datasetid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relateddatasetid integer  NOT NULL,
	versioncode varchar (50) NULL
);
create table ODM2.RelatedResults (
	relationid serial  NOT NULL primary key,
	resultid bigint  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedresultid bigint  NOT NULL,
	versioncode varchar (50) NULL,
	relatedresultsequencenumber integer  NULL
);
create table ODM2.ResultDerivationEquations (
	resultid bigint  NOT NULL primary key,
	derivationequationid integer  NOT NULL
);
/***************************************************************************/
/*************************** CREATE ODM2RESULTS ****************************/
/***************************************************************************/

create table ODM2.CategoricalResults (
	resultid bigint  NOT NULL primary key,
	xlocation double precision  NULL,
	xlocationunitsid integer  NULL,
	ylocation double precision  NULL,
	ylocationunitsid integer  NULL,
	zlocation double precision  NULL,
	zlocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	qualitycodecv varchar (255) NOT NULL
);
create table ODM2.CategoricalResultValues (
	valueid bigserial  NOT NULL primary key,
	resultid bigint  NOT NULL,
	datavalue varchar (255) NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset)
);
create table ODM2.MeasurementResults (
	resultid bigint  NOT NULL primary key,
	xlocation double precision  NULL,
	xlocationunitsid integer  NULL,
	ylocation double precision  NULL,
	ylocationunitsid integer  NULL,
	zlocation double precision  NULL,
	zlocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL,
	aggregationstatisticcv varchar (255) NOT NULL,
	timeaggregationinterval double precision  NOT NULL,
	timeaggregationintervalunitsid integer  NOT NULL
);
create table ODM2.MeasurementResultValues (
	valueid bigserial  NOT NULL primary key,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset)
);
create table ODM2.PointCoverageResults (
	resultid bigint  NOT NULL primary key,
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
create table ODM2.PointCoverageResultValues (
	valueid bigserial  NOT NULL primary key,
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
	UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, XLocation, XLocationUnitsID, YLocation, YLocationUnitsID, CensorCodeCV, QualityCodeCV)
);
create table ODM2.ProfileResults (
	resultid bigint  NOT NULL primary key,
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
create table ODM2.ProfileResultValues (
	valueid bigserial  NOT NULL primary key,
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
	UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, ZLocation, ZAggregationInterval, ZLocationUnitsID, CensorCodeCV, QualityCodeCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);
create table ODM2.SectionResults (
	resultid bigint  NOT NULL primary key,
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
create table ODM2.SectionResultValues (
	valueid bigserial  NOT NULL primary key,
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
	UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, XLocation, XAggregationInterval, XLocationUnitsID, ZLocation, ZAggregationInterval, ZLocationUnitsID, CensorCodeCV, QualityCodeCV, AggregationStatisticCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);
create table ODM2.SpectraResults (
	resultid bigint  NOT NULL primary key,
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
create table ODM2.SpectraResultValues (
	valueid bigserial  NOT NULL primary key,
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
	UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, ExcitationWavelength, EmissionWavelength, WavelengthUnitsID, CensorCodeCV, QualityCodeCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);
create table ODM2.TimeSeriesResults (
	resultid bigint  NOT NULL primary key,
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
create table ODM2.TimeSeriesResultValues (
	valueid bigserial  NOT NULL primary key,
	resultid bigint  NOT NULL,
	datavalue double precision  NOT NULL,
	valuedatetime timestamp  NOT NULL,
	valuedatetimeutcoffset integer  NOT NULL,
	censorcodecv varchar (255) NOT NULL,
	qualitycodecv varchar (255) NOT NULL,
	timeaggregationinterval double precision  NOT NULL,
	timeaggregationintervalunitsid integer  NOT NULL,
	UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, CensorCodeCV, QualityCodeCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);
create table ODM2.TrajectoryResults (
	resultid bigint  NOT NULL primary key,
	spatialreferenceid integer  NULL,
	intendedtrajectoryspacing double precision  NULL,
	intendedtrajectoryspacingunitsid integer  NULL,
	intendedtimespacing double precision  NULL,
	intendedtimespacingunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NOT NULL
);
create table ODM2.TrajectoryResultValues (
	valueid bigserial  NOT NULL primary key,
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
	UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, XLocation, XLocationUnitsID, YLocation, YLocationUnitsID, ZLocation, ZLocationUnitsID, TrajectoryDistance, TrajectoryDistanceAggregationInterval, TrajectoryDistanceUnitsID, CensorCodeCV, QualityCodeCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);
create table ODM2.TransectResults (
	resultid bigint  NOT NULL primary key,
	zlocation double precision  NULL,
	zlocationunitsid integer  NULL,
	spatialreferenceid integer  NULL,
	intendedtransectspacing double precision  NULL,
	intendedtransectspacingunitsid integer  NULL,
	intendedtimespacing double precision  NULL,
	intendedtimespacingunitsid integer  NULL,
	aggregationstatisticcv varchar (255) NOT NULL
);
create table ODM2.TransectResultValues (
	valueid bigserial  NOT NULL primary key,
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
	UNIQUE (ResultID, DataValue, ValueDateTime, ValueDateTimeUTCOffset, XLocation, XLocationUnitsID, YLocation, YLocationUnitsID, TransectDistance, TransectDistanceAggregationInterval, TransectDistanceUnitsID, CensorCodeCV, QualityCodeCV, AggregationStatisticCV, TimeAggregationInterval, TimeAggregationIntervalUnitsID)
);
/***************************************************************************/
/*********************** CREATE ODM2SAMPLINGFEATURES ***********************/
/***************************************************************************/

create table ODM2.RelatedFeatures (
	relationid serial  NOT NULL primary key,
	samplingfeatureid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedfeatureid integer  NOT NULL,
	spatialoffsetid integer  NULL
);
create table ODM2.Sites (
	samplingfeatureid integer  NOT NULL primary key,
	sitetypecv varchar (255) NOT NULL,
	latitude double precision  NOT NULL,
	longitude double precision  NOT NULL,
	spatialreferenceid integer  NOT NULL
);
create table ODM2.SpatialOffsets (
	spatialoffsetid serial  NOT NULL primary key,
	spatialoffsettypecv varchar (255) NOT NULL,
	offset1value double precision  NOT NULL,
	offset1unitid integer  NOT NULL,
	offset2value double precision  NULL,
	offset2unitid integer  NULL,
	offset3value double precision  NULL,
	offset3unitid integer  NULL
);
create table ODM2.SpatialReferences (
	spatialreferenceid serial  NOT NULL primary key,
	srscode varchar (50) NULL,
	srsname varchar (255) NOT NULL,
	srsdescription varchar (5000) NULL,
	srslink varchar (255) NULL
);
create table ODM2.Specimens (
	samplingfeatureid integer  NOT NULL primary key,
	specimentypecv varchar (255) NOT NULL,
	specimenmediumcv varchar (255) NOT NULL,
	isfieldspecimen boolean  NOT NULL
);
create table ODM2.SpecimenTaxonomicClassifiers (
	bridgeid serial  NOT NULL primary key,
	samplingfeatureid integer  NOT NULL,
	taxonomicclassifierid integer  NOT NULL,
	citationid integer  NULL
);
/***************************************************************************/
/************************** CREATE ODM2SIMULATION **************************/
/***************************************************************************/

create table ODM2.ModelAffiliations (
	bridgeid serial  NOT NULL primary key,
	modelid integer  NOT NULL,
	affiliationid integer  NOT NULL,
	isprimary boolean  NOT NULL,
	roledescription varchar (5000) NULL
);
create table ODM2.Models (
	modelid serial  NOT NULL primary key,
	modelcode varchar (50) NOT NULL,
	modelname varchar (255) NOT NULL,
	modeldescription varchar (5000) NULL,
	version varchar (255) NULL,
	modellink varchar (255) NULL,
	UNIQUE (ModelCode)
);
create table ODM2.RelatedModels (
	relatedid serial  NOT NULL primary key,
	modelid integer  NOT NULL,
	relationshiptypecv varchar (255) NOT NULL,
	relatedmodelid integer  NOT NULL
);
create table ODM2.Simulations (
	simulationid serial  NOT NULL primary key,
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

alter table ODM2.ActionAnnotations add constraint fk_ActionAnnotations_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.ActionAnnotations add constraint fk_ActionAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.Annotations add constraint fk_Annotations_Citations
foreign key (CitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.Annotations add constraint fk_Annotations_CV_AnnotationType
foreign key (AnnotationTypeCV) References ODM2.CV_AnnotationType (Name)
on update no Action on delete cascade;

alter table ODM2.Annotations add constraint fk_Annotations_People
foreign key (AnnotatorID) References ODM2.People (PersonID)
on update no Action on delete cascade;

alter table ODM2.CategoricalResultValueAnnotations add constraint fk_CategoricalResultValueAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.CategoricalResultValueAnnotations add constraint fk_CategoricalResultValueAnnotations_CategoricalResultValues
foreign key (ValueID) References ODM2.CategoricalResultValues (ValueID)
on update no Action on delete cascade;

alter table ODM2.EquipmentAnnotations add constraint fk_EquipmentAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.EquipmentAnnotations add constraint fk_EquipmentAnnotations_Equipment
foreign key (EquipmentID) References ODM2.Equipment (EquipmentID)
on update no Action on delete cascade;

alter table ODM2.MeasurementResultValueAnnotations add constraint fk_MeasurementResultValueAnnotations_MeasurementResultValues
foreign key (ValueID) References ODM2.MeasurementResultValues (ValueID)
on update no Action on delete cascade;

alter table ODM2.MeasurementResultValueAnnotations add constraint fk_ResultValueAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.MethodAnnotations add constraint fk_MethodAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.MethodAnnotations add constraint fk_MethodAnnotations_Methods
foreign key (MethodID) References ODM2.Methods (MethodID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResultValueAnnotations add constraint fk_PointCoverageResultValueAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResultValueAnnotations add constraint fk_PointCoverageResultValueAnnotations_PointCoverageResultValues
foreign key (ValueID) References ODM2.PointCoverageResultValues (ValueID)
on update no Action on delete cascade;

alter table ODM2.ProfileResultValueAnnotations add constraint fk_ProfileResultValueAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.ProfileResultValueAnnotations add constraint fk_ProfileResultValueAnnotations_ProfileResultValues
foreign key (ValueID) References ODM2.ProfileResultValues (ValueID)
on update no Action on delete cascade;

alter table ODM2.ResultAnnotations add constraint fk_ResultAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.ResultAnnotations add constraint fk_ResultAnnotations_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.SamplingFeatureAnnotations add constraint fk_SamplingFeatureAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.SamplingFeatureAnnotations add constraint fk_SamplingFeatureAnnotations_SamplingFeatures
foreign key (SamplingFeatureID) References ODM2.SamplingFeatures (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.SectionResultValueAnnotations add constraint fk_SectionResultValueAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.SectionResultValueAnnotations add constraint fk_SectionResultValueAnnotations_SectionResultValues
foreign key (ValueID) References ODM2.SectionResultValues (ValueID)
on update no Action on delete cascade;

alter table ODM2.SpectraResultValueAnnotations add constraint fk_SpectraResultValueAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.SpectraResultValueAnnotations add constraint fk_SpectraResultValueAnnotations_SpectraResultValues
foreign key (ValueID) References ODM2.SpectraResultValues (ValueID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResultValueAnnotations add constraint fk_TimeSeriesResultValueAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResultValueAnnotations add constraint fk_TimeSeriesResultValueAnnotations_TimeSeriesResultValues
foreign key (ValueID) References ODM2.TimeSeriesResultValues (ValueID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValueAnnotations add constraint fk_TrajectoryResultValueAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValueAnnotations add constraint fk_TrajectoryResultValueAnnotations_TrajectoryResultValues
foreign key (ValueID) References ODM2.TrajectoryResultValues (ValueID)
on update no Action on delete cascade;

alter table ODM2.TransectResultValueAnnotations add constraint fk_TransectResultValueAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.TransectResultValueAnnotations add constraint fk_TransectResultValueAnnotations_TransectResultValues
foreign key (ValueID) References ODM2.TransectResultValues (ValueID)
on update no Action on delete cascade;

alter table ODM2.ActionBy add constraint fk_ActionPeople_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.ActionBy add constraint fk_ActionPeople_Affiliations
foreign key (AffiliationID) References ODM2.Affiliations (AffiliationID)
on update no Action on delete cascade;

alter table ODM2.Actions add constraint fk_Actions_CV_ActionType
foreign key (ActionTypeCV) References ODM2.CV_ActionType (Name)
on update no Action on delete cascade;

alter table ODM2.Actions add constraint fk_Actions_Methods
foreign key (MethodID) References ODM2.Methods (MethodID)
on update no Action on delete cascade;

alter table ODM2.Affiliations add constraint fk_Affiliations_Organizations
foreign key (OrganizationID) References ODM2.Organizations (OrganizationID)
on update no Action on delete cascade;

alter table ODM2.Affiliations add constraint fk_Affiliations_People
foreign key (PersonID) References ODM2.People (PersonID)
on update no Action on delete cascade;

alter table ODM2.Datasets add constraint fk_Datasets_CV_DatasetTypeCV
foreign key (DatasetTypeCV) References ODM2.CV_DatasetType (Name)
on update no Action on delete cascade;

alter table ODM2.DatasetsResults add constraint fk_DataSetsResults_DataSets
foreign key (DatasetID) References ODM2.Datasets (DatasetID)
on update no Action on delete cascade;

alter table ODM2.DatasetsResults add constraint fk_DataSetsResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.FeatureActions add constraint fk_FeatureActions_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.FeatureActions add constraint fk_FeatureActions_SamplingFeatures
foreign key (SamplingFeatureID) References ODM2.SamplingFeatures (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.Methods add constraint fk_Methods_CV_MethodType
foreign key (MethodTypeCV) References ODM2.CV_MethodType (Name)
on update no Action on delete cascade;

alter table ODM2.Methods add constraint fk_Methods_Organizations
foreign key (OrganizationID) References ODM2.Organizations (OrganizationID)
on update no Action on delete cascade;

alter table ODM2.Organizations add constraint fk_Organizations_CV_OrganizationType
foreign key (OrganizationTypeCV) References ODM2.CV_OrganizationType (Name)
on update no Action on delete cascade;

alter table ODM2.Organizations add constraint fk_Organizations_Organizations
foreign key (ParentOrganizationID) References ODM2.Organizations (OrganizationID)
on update no Action on delete cascade;

alter table ODM2.RelatedActions add constraint fk_RelatedActions_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.RelatedActions add constraint fk_RelatedActions_Actions_AreRelated
foreign key (RelatedActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.RelatedActions add constraint fk_RelatedActions_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.Results add constraint fk_Results_CV_Medium
foreign key (SampledMediumCV) References ODM2.CV_Medium (Name)
on update no Action on delete cascade;

alter table ODM2.Results add constraint fk_Results_CV_ResultType
foreign key (ResultTypeCV) References ODM2.CV_ResultType (Name)
on update no Action on delete cascade;

alter table ODM2.Results add constraint fk_Results_CV_Status
foreign key (StatusCV) References ODM2.CV_Status (Name)
on update no Action on delete cascade;

alter table ODM2.Results add constraint fk_Results_FeatureActions
foreign key (FeatureActionID) References ODM2.FeatureActions (FeatureActionID)
on update no Action on delete cascade;

alter table ODM2.Results add constraint fk_Results_ProcessingLevels
foreign key (ProcessingLevelID) References ODM2.ProcessingLevels (ProcessingLevelID)
on update no Action on delete cascade;

alter table ODM2.Results add constraint fk_Results_TaxonomicClassifiers
foreign key (TaxonomicClassifierID) References ODM2.TaxonomicClassifiers (TaxonomicClassifierID)
on update no Action on delete cascade;

alter table ODM2.Results add constraint fk_Results_Units
foreign key (UnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.Results add constraint fk_Results_Variables
foreign key (VariableID) References ODM2.Variables (VariableID)
on update no Action on delete cascade;

alter table ODM2.SamplingFeatures add constraint fk_SamplingFeatures_CV_ElevationDatum
foreign key (ElevationDatumCV) References ODM2.CV_ElevationDatum (Name)
on update no Action on delete cascade;

alter table ODM2.SamplingFeatures add constraint fk_SamplingFeatures_CV_SamplingFeatureGeoType
foreign key (SamplingFeatureGeotypeCV) References ODM2.CV_SamplingFeatureGeoType (Name)
on update no Action on delete cascade;

alter table ODM2.SamplingFeatures add constraint fk_SamplingFeatures_CV_SamplingFeatureType
foreign key (SamplingFeatureTypeCV) References ODM2.CV_SamplingFeatureType (Name)
on update no Action on delete cascade;

alter table ODM2.TaxonomicClassifiers add constraint fk_ParentTaxon_Taxon
foreign key (ParentTaxonomicClassifierID) References ODM2.TaxonomicClassifiers (TaxonomicClassifierID)
on update no Action on delete cascade;

alter table ODM2.TaxonomicClassifiers add constraint fk_TaxonomicClassifiers_CV_TaxonomicClassifierType
foreign key (TaxonomicClassifierTypeCV) References ODM2.CV_TaxonomicClassifierType (Name)
on update no Action on delete cascade;

alter table ODM2.Units add constraint fk_Units_CV_UnitsType
foreign key (UnitsTypeCV) References ODM2.CV_UnitsType (Name)
on update no Action on delete cascade;

alter table ODM2.Variables add constraint fk_Variables_CV_Speciation
foreign key (SpeciationCV) References ODM2.CV_Speciation (Name)
on update no Action on delete cascade;

alter table ODM2.Variables add constraint fk_Variables_CV_VariableName
foreign key (VariableNameCV) References ODM2.CV_VariableName (Name)
on update no Action on delete cascade;

alter table ODM2.Variables add constraint fk_Variables_CV_VariableType
foreign key (VariableTypeCV) References ODM2.CV_VariableType (Name)
on update no Action on delete cascade;

alter table ODM2.DataQuality add constraint fk_DataQuality_CV_DataQualityType
foreign key (DataQualityTypeCV) References ODM2.CV_DataQualityType (Name)
on update no Action on delete cascade;

alter table ODM2.DataQuality add constraint fk_DataQuality_Units
foreign key (DataQualityValueUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.ReferenceMaterials add constraint fk_ReferenceMaterials_CV_Medium
foreign key (ReferenceMaterialMediumCV) References ODM2.CV_Medium (Name)
on update no Action on delete cascade;

alter table ODM2.ReferenceMaterials add constraint fk_ReferenceMaterials_Organizations
foreign key (ReferenceMaterialOrganizationID) References ODM2.Organizations (OrganizationID)
on update no Action on delete cascade;

alter table ODM2.ReferenceMaterials add constraint fk_ReferenceMaterials_SamplingFeatures
foreign key (SamplingFeatureID) References ODM2.SamplingFeatures (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.ReferenceMaterialValues add constraint fk_ReferenceMaterialValues_Citations
foreign key (CitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.ReferenceMaterialValues add constraint fk_ReferenceMaterialValues_ReferenceMaterials
foreign key (ReferenceMaterialID) References ODM2.ReferenceMaterials (ReferenceMaterialID)
on update no Action on delete cascade;

alter table ODM2.ReferenceMaterialValues add constraint fk_ReferenceMaterialValues_Units
foreign key (UnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.ReferenceMaterialValues add constraint fk_ReferenceMaterialValues_Variables
foreign key (VariableID) References ODM2.Variables (VariableID)
on update no Action on delete cascade;

alter table ODM2.ResultNormalizationValues add constraint fk_ResultNormalizationValues_ReferenceMaterialValues
foreign key (NormalizedByReferenceMaterialValueID) References ODM2.ReferenceMaterialValues (ReferenceMaterialValueID)
on update no Action on delete cascade;

alter table ODM2.ResultNormalizationValues add constraint fk_ResultNormalizationValues_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.ResultsDataQuality add constraint fk_ResultsDataQuality_DataQuality
foreign key (DataQualityID) References ODM2.DataQuality (DataQualityID)
on update no Action on delete cascade;

alter table ODM2.ResultsDataQuality add constraint fk_ResultsDataQuality_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.CalibrationActions add constraint fk_CalibrationActions_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.CalibrationActions add constraint fk_CalibrationActions_InstrumentOutputVariables
foreign key (InstrumentOutputVariableID) References ODM2.InstrumentOutputVariables (InstrumentOutputVariableID)
on update no Action on delete cascade;

alter table ODM2.CalibrationReferenceEquipment add constraint fk_CalibrationReferenceEquipment_CalibrationActions
foreign key (ActionID) References ODM2.CalibrationActions (ActionID)
on update no Action on delete cascade;

alter table ODM2.CalibrationReferenceEquipment add constraint fk_CalibrationReferenceEquipment_Equipment
foreign key (EquipmentID) References ODM2.Equipment (EquipmentID)
on update no Action on delete cascade;

alter table ODM2.CalibrationStandards add constraint fk_CalibrationStandards_CalibrationActions
foreign key (ActionID) References ODM2.CalibrationActions (ActionID)
on update no Action on delete cascade;

alter table ODM2.CalibrationStandards add constraint fk_FieldCalibrationStandards_ReferenceMaterials
foreign key (ReferenceMaterialID) References ODM2.ReferenceMaterials (ReferenceMaterialID)
on update no Action on delete cascade;

alter table ODM2.DataloggerFileColumns add constraint fk_DataloggerFileColumns_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.DataloggerFileColumns add constraint fk_DataloggerFileColumns_DataLoggerFiles
foreign key (DataLoggerFileID) References ODM2.DataLoggerFiles (DataLoggerFileID)
on update no Action on delete cascade;

alter table ODM2.DataloggerFileColumns add constraint fk_DataloggerFileColumns_InstrumentOutputVariables
foreign key (InstrumentOutputVariableID) References ODM2.InstrumentOutputVariables (InstrumentOutputVariableID)
on update no Action on delete cascade;

alter table ODM2.DataloggerFileColumns add constraint fk_DataloggerFileColumns_RecordingUnits
foreign key (RecordingIntervalUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.DataloggerFileColumns add constraint fk_DataloggerFileColumns_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.DataloggerFileColumns add constraint fk_DataloggerFileColumns_ScanUnits
foreign key (ScanIntervalUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.DataLoggerFiles add constraint fk_DataLoggerFiles_DataloggerProgramFiles
foreign key (ProgramID) References ODM2.DataloggerProgramFiles (ProgramID)
on update no Action on delete cascade;

alter table ODM2.DataloggerProgramFiles add constraint fk_DataloggerProgramFiles_Affiliations
foreign key (AffiliationID) References ODM2.Affiliations (AffiliationID)
on update no Action on delete cascade;

alter table ODM2.Equipment add constraint fk_Equipment_CV_EquipmentType
foreign key (EquipmentTypeCV) References ODM2.CV_EquipmentType (Name)
on update no Action on delete cascade;

alter table ODM2.Equipment add constraint fk_Equipment_EquipmentModels
foreign key (EquipmentModelID) References ODM2.EquipmentModels (EquipmentModelID)
on update no Action on delete cascade;

alter table ODM2.Equipment add constraint fk_Equipment_Organizations
foreign key (EquipmentVendorID) References ODM2.Organizations (OrganizationID)
on update no Action on delete cascade;

alter table ODM2.Equipment add constraint fk_Equipment_People
foreign key (EquipmentOwnerID) References ODM2.People (PersonID)
on update no Action on delete cascade;

alter table ODM2.EquipmentModels add constraint fk_EquipmentModels_Organizations
foreign key (ModelManufacturerID) References ODM2.Organizations (OrganizationID)
on update no Action on delete cascade;

alter table ODM2.EquipmentUsed add constraint fk_EquipmentActions_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.EquipmentUsed add constraint fk_EquipmentActions_Equipment
foreign key (EquipmentID) References ODM2.Equipment (EquipmentID)
on update no Action on delete cascade;

alter table ODM2.InstrumentOutputVariables add constraint fk_InstrumentOutputVariables_EquipmentModels
foreign key (ModelID) References ODM2.EquipmentModels (EquipmentModelID)
on update no Action on delete cascade;

alter table ODM2.InstrumentOutputVariables add constraint fk_InstrumentOutputVariables_Methods
foreign key (InstrumentMethodID) References ODM2.Methods (MethodID)
on update no Action on delete cascade;

alter table ODM2.InstrumentOutputVariables add constraint fk_InstrumentOutputVariables_Units
foreign key (InstrumentRawOutputUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.InstrumentOutputVariables add constraint fk_InstrumentOutputVariables_Variables
foreign key (VariableID) References ODM2.Variables (VariableID)
on update no Action on delete cascade;

alter table ODM2.MaintenanceActions add constraint fk_MaintenanceActions_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.RelatedEquipment add constraint fk_RelatedEquipment_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.RelatedEquipment add constraint fk_RelatedEquipment_Equipment
foreign key (EquipmentID) References ODM2.Equipment (EquipmentID)
on update no Action on delete cascade;

alter table ODM2.RelatedEquipment add constraint fk_RelatedEquipment_Equipment_AreRelated
foreign key (RelatedEquipmentID) References ODM2.Equipment (EquipmentID)
on update no Action on delete cascade;

alter table ODM2.ActionExtensionPropertyValues add constraint fk_ActionExtensionPropertyValues_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.ActionExtensionPropertyValues add constraint fk_ActionExtensionPropertyValues_ExtensionProperties
foreign key (PropertyID) References ODM2.ExtensionProperties (PropertyID)
on update no Action on delete cascade;

alter table ODM2.CitationExtensionPropertyValues add constraint fk_CitationExtensionPropertyValues_Citations
foreign key (CitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.CitationExtensionPropertyValues add constraint fk_CitationExtensionPropertyValues_ExtensionProperties
foreign key (PropertyID) References ODM2.ExtensionProperties (PropertyID)
on update no Action on delete cascade;

alter table ODM2.ExtensionProperties add constraint fk_ExtensionProperties_CV_PropertyDataType
foreign key (PropertyDataTypeCV) References ODM2.CV_PropertyDataType (Name)
on update no Action on delete cascade;

alter table ODM2.ExtensionProperties add constraint fk_ExtensionProperties_Units
foreign key (PropertyUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.MethodExtensionPropertyValues add constraint fk_MethodExtensionPropertyValues_ExtensionProperties
foreign key (PropertyID) References ODM2.ExtensionProperties (PropertyID)
on update no Action on delete cascade;

alter table ODM2.MethodExtensionPropertyValues add constraint fk_MethodExtensionPropertyValues_Methods
foreign key (MethodID) References ODM2.Methods (MethodID)
on update no Action on delete cascade;

alter table ODM2.ResultExtensionPropertyValues add constraint fk_ResultExtensionPropertyValues_ExtensionProperties
foreign key (PropertyID) References ODM2.ExtensionProperties (PropertyID)
on update no Action on delete cascade;

alter table ODM2.ResultExtensionPropertyValues add constraint fk_ResultExtensionPropertyValues_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.SamplingFeatureExtensionPropertyValues add constraint fk_SamplingFeatureExtensionPropertyValues_ExtensionProperties
foreign key (PropertyID) References ODM2.ExtensionProperties (PropertyID)
on update no Action on delete cascade;

alter table ODM2.SamplingFeatureExtensionPropertyValues add constraint fk_SamplingFeatureExtensionPropertyValues_SamplingFeatures
foreign key (SamplingFeatureID) References ODM2.SamplingFeatures (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.VariableExtensionPropertyValues add constraint fk_VariableExtensionPropertyValues_ExtensionProperties
foreign key (PropertyID) References ODM2.ExtensionProperties (PropertyID)
on update no Action on delete cascade;

alter table ODM2.VariableExtensionPropertyValues add constraint fk_VariableExtensionPropertyValues_Variables
foreign key (VariableID) References ODM2.Variables (VariableID)
on update no Action on delete cascade;

alter table ODM2.CitationExternalIdentifiers add constraint fk_CitationExternalIdentifiers_Citations
foreign key (CitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.CitationExternalIdentifiers add constraint fk_CitationExternalIdentifiers_ExternalIdentifierSystems
foreign key (ExternalIdentifierSystemID) References ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
on update no Action on delete cascade;

alter table ODM2.ExternalIdentifierSystems add constraint fk_ExternalIdentifierSystems_Organizations
foreign key (IdentifierSystemOrganizationID) References ODM2.Organizations (OrganizationID)
on update no Action on delete cascade;

alter table ODM2.MethodExternalIdentifiers add constraint fk_MethodExternalIdentifiers_ExternalIdentifierSystems
foreign key (ExternalIdentifierSystemID) References ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
on update no Action on delete cascade;

alter table ODM2.MethodExternalIdentifiers add constraint fk_MethodExternalIdentifiers_Methods
foreign key (MethodID) References ODM2.Methods (MethodID)
on update no Action on delete cascade;

alter table ODM2.PersonExternalIdentifiers add constraint fk_PersonExternalIdentifiers_ExternalIdentifierSystems
foreign key (ExternalIdentifierSystemID) References ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
on update no Action on delete cascade;

alter table ODM2.PersonExternalIdentifiers add constraint fk_PersonExternalIdentifiers_People
foreign key (PersonID) References ODM2.People (PersonID)
on update no Action on delete cascade;

alter table ODM2.ReferenceMaterialExternalIdentifiers add constraint fk_RefMaterialExtIdentifiers_ExtIdentifierSystems
foreign key (ExternalIdentifierSystemID) References ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
on update no Action on delete cascade;

alter table ODM2.ReferenceMaterialExternalIdentifiers add constraint fk_RefMaterialExtIdentifiers_RefMaterials
foreign key (ReferenceMaterialID) References ODM2.ReferenceMaterials (ReferenceMaterialID)
on update no Action on delete cascade;

alter table ODM2.SamplingFeatureExternalIdentifiers add constraint fk_SamplingFeatureExternalIdentifiers_ExternalIdentifierSystems
foreign key (ExternalIdentifierSystemID) References ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
on update no Action on delete cascade;

alter table ODM2.SamplingFeatureExternalIdentifiers add constraint fk_SamplingFeatureExternalIdentifiers_SamplingFeatures
foreign key (SamplingFeatureID) References ODM2.SamplingFeatures (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.SpatialReferenceExternalIdentifiers add constraint fk_SpatialReferenceExternalIdentifiers_ExternalIdentifierSystems
foreign key (ExternalIdentifierSystemID) References ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
on update no Action on delete cascade;

alter table ODM2.SpatialReferenceExternalIdentifiers add constraint fk_SpatialReferenceExternalIdentifiers_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.TaxonomicClassifierExternalIdentifiers add constraint fk_TaxonomicClassifierExtIDs_ExtIDSystems
foreign key (ExternalIdentifierSystemID) References ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
on update no Action on delete cascade;

alter table ODM2.TaxonomicClassifierExternalIdentifiers add constraint fk_TaxonomicClassifierExtIDs_TaxonomicClassifiers
foreign key (TaxonomicClassifierID) References ODM2.TaxonomicClassifiers (TaxonomicClassifierID)
on update no Action on delete cascade;

alter table ODM2.VariableExternalIdentifiers add constraint fk_VariableExternalIdentifiers_ExternalIdentifierSystems
foreign key (ExternalIdentifierSystemID) References ODM2.ExternalIdentifierSystems (ExternalIdentifierSystemID)
on update no Action on delete cascade;

alter table ODM2.VariableExternalIdentifiers add constraint fk_VariableExternalIdentifiers_Variables
foreign key (VariableID) References ODM2.Variables (VariableID)
on update no Action on delete cascade;

alter table ODM2.ActionDirectives add constraint fk_ActionDirectives_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.ActionDirectives add constraint fk_ActionDirectives_Directives
foreign key (DirectiveID) References ODM2.Directives (DirectiveID)
on update no Action on delete cascade;

alter table ODM2.Directives add constraint fk_Directives_CV_DirectiveType
foreign key (DirectiveTypeCV) References ODM2.CV_DirectiveType (Name)
on update no Action on delete cascade;

alter table ODM2.SpecimenBatchPostions add constraint fk_SpecimenBatchPostions_FeatureActions
foreign key (FeatureActionID) References ODM2.FeatureActions (FeatureActionID)
on update no Action on delete cascade;

alter table ODM2.AuthorLists add constraint fk_AuthorLists_Citations
foreign key (CitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.AuthorLists add constraint fk_AuthorLists_People
foreign key (PersonID) References ODM2.People (PersonID)
on update no Action on delete cascade;

alter table ODM2.DatasetCitations add constraint fk_DataSetCitations_Citations
foreign key (CitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.DatasetCitations add constraint fk_DatasetCitations_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.DatasetCitations add constraint fk_DataSetCitations_DataSets
foreign key (DataSetID) References ODM2.Datasets (DatasetID)
on update no Action on delete cascade;

alter table ODM2.MethodCitations add constraint fk_MethodCitations_Citations
foreign key (CitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.MethodCitations add constraint fk_MethodCitations_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.MethodCitations add constraint fk_MethodCitations_Methods
foreign key (MethodID) References ODM2.Methods (MethodID)
on update no Action on delete cascade;

alter table ODM2.RelatedAnnotations add constraint fk_RelatedAnnotations_Annotations
foreign key (AnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.RelatedAnnotations add constraint fk_RelatedAnnotations_Annotations_AreRelated
foreign key (RelatedAnnotationID) References ODM2.Annotations (AnnotationID)
on update no Action on delete cascade;

alter table ODM2.RelatedAnnotations add constraint fk_RelatedAnnotations_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.RelatedCitations add constraint fk_RelatedCitations_Citations
foreign key (CitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.RelatedCitations add constraint fk_RelatedCitations_Citations_AreRelated
foreign key (RelatedCitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.RelatedCitations add constraint fk_RelatedCitations_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.RelatedDatasets add constraint fk_RelatedDatasets_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.RelatedDatasets add constraint fk_RelatedDatasets_DataSets
foreign key (DataSetID) References ODM2.Datasets (DatasetID)
on update no Action on delete cascade;

alter table ODM2.RelatedDatasets add constraint fk_RelatedDatasets_DataSets_AreRelated
foreign key (RelatedDatasetID) References ODM2.Datasets (DatasetID)
on update no Action on delete cascade;

alter table ODM2.RelatedResults add constraint fk_RelatedResults_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.RelatedResults add constraint fk_RelatedResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.RelatedResults add constraint fk_RelatedResults_Results_AreRelated
foreign key (RelatedResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.ResultDerivationEquations add constraint fk_ResultDerivationEquations_DerivationEquations
foreign key (DerivationEquationID) References ODM2.DerivationEquations (DerivationEquationID)
on update no Action on delete cascade;

alter table ODM2.ResultDerivationEquations add constraint fk_ResultDerivationEquations_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.CategoricalResults add constraint fk_CategoricalResults_CV_QualityCode
foreign key (QualityCodeCV) References ODM2.CV_QualityCode (Name)
on update no Action on delete cascade;

alter table ODM2.CategoricalResults add constraint fk_CategoricalResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.CategoricalResults add constraint fk_CategoricalResults_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.CategoricalResultValues add constraint fk_CategoricalResultValues_CategoricalResults
foreign key (ResultID) References ODM2.CategoricalResults (ResultID)
on update no Action on delete cascade;

alter table ODM2.MeasurementResults add constraint fk_MeasurementResults_AIUnits
foreign key (TimeAggregationIntervalUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.MeasurementResults add constraint fk_MeasurementResults_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.MeasurementResults add constraint fk_MeasurementResults_CV_CensorCode
foreign key (CensorCodeCV) References ODM2.CV_CensorCode (Name)
on update no Action on delete cascade;

alter table ODM2.MeasurementResults add constraint fk_MeasurementResults_CV_QualityCode
foreign key (QualityCodeCV) References ODM2.CV_QualityCode (Name)
on update no Action on delete cascade;

alter table ODM2.MeasurementResults add constraint fk_MeasurementResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.MeasurementResults add constraint fk_MeasurementResults_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.MeasurementResults add constraint fk_MeasurementResults_XUnits
foreign key (XLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.MeasurementResults add constraint fk_MeasurementResults_YUnits
foreign key (YLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.MeasurementResults add constraint fk_MeasurementResults_ZUnits
foreign key (ZLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.MeasurementResultValues add constraint fk_MeasurementResultValues_MeasurementResults
foreign key (ResultID) References ODM2.MeasurementResults (ResultID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResults add constraint fk_PointCoverageResults_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResults add constraint fk_PointCoverageResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResults add constraint fk_PointCoverageResults_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResults add constraint fk_PointCoverageResults_XUnits
foreign key (IntendedXSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResults add constraint fk_PointCoverageResults_YUnits
foreign key (IntendedYSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResults add constraint fk_PointCoverageResults_ZUnits
foreign key (ZLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResultValues add constraint fk_PointCoverageResultValues_CV_CensorCode
foreign key (CensorCodeCV) References ODM2.CV_CensorCode (Name)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResultValues add constraint fk_PointCoverageResultValues_CV_QualityCode
foreign key (QualityCodeCV) References ODM2.CV_QualityCode (Name)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResultValues add constraint fk_PointCoverageResultValues_PointCoverageResults
foreign key (ResultID) References ODM2.PointCoverageResults (ResultID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResultValues add constraint fk_PointCoverageResultValues_XUnits
foreign key (XLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.PointCoverageResultValues add constraint fk_PointCoverageResultValues_YUnits
foreign key (YLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.ProfileResults add constraint fk_ProfileResults_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.ProfileResults add constraint fk_ProfileResults_DUnits
foreign key (IntendedZSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.ProfileResults add constraint fk_ProfileResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.ProfileResults add constraint fk_ProfileResults_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.ProfileResults add constraint fk_ProfileResults_TUnits
foreign key (IntendedTimeSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.ProfileResults add constraint fk_ProfileResults_XUnits
foreign key (XLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.ProfileResults add constraint fk_ProfileResults_YUnits
foreign key (YLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.ProfileResultValues add constraint fk_ProfileResultValues_AIUnits
foreign key (TimeAggregationIntervalUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.ProfileResultValues add constraint fk_ProfileResultValues_CV_CensorCode
foreign key (CensorCodeCV) References ODM2.CV_CensorCode (Name)
on update no Action on delete cascade;

alter table ODM2.ProfileResultValues add constraint fk_ProfileResultValues_CV_QualityCode
foreign key (QualityCodeCV) References ODM2.CV_QualityCode (Name)
on update no Action on delete cascade;

alter table ODM2.ProfileResultValues add constraint fk_ProfileResultValues_DUnits
foreign key (ZLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.ProfileResultValues add constraint fk_ProfileResultValues_ProfileResults
foreign key (ResultID) References ODM2.ProfileResults (ResultID)
on update no Action on delete cascade;

alter table ODM2.SectionResults add constraint fk_SectionResults_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.SectionResults add constraint fk_SectionResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.SectionResults add constraint fk_SectionResults_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.SectionResults add constraint fk_SectionResults_TMUnits
foreign key (IntendedTimeSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SectionResults add constraint fk_SectionResults_Units
foreign key (YLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SectionResults add constraint fk_SectionResults_XUnits
foreign key (IntendedXSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SectionResults add constraint fk_SectionResults_ZUnits
foreign key (IntendedZSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SectionResultValues add constraint fk_SectionResultValues_AIUnits
foreign key (TimeAggregationIntervalUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SectionResultValues add constraint fk_SectionResultValues_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.SectionResultValues add constraint fk_SectionResultValues_CV_CensorCode
foreign key (CensorCodeCV) References ODM2.CV_CensorCode (Name)
on update no Action on delete cascade;

alter table ODM2.SectionResultValues add constraint fk_SectionResultValues_CV_QualityCode
foreign key (QualityCodeCV) References ODM2.CV_QualityCode (Name)
on update no Action on delete cascade;

alter table ODM2.SectionResultValues add constraint fk_SectionResultValues_SectionResults
foreign key (ResultID) References ODM2.SectionResults (ResultID)
on update no Action on delete cascade;

alter table ODM2.SectionResultValues add constraint fk_SectionResultValues_XUnits
foreign key (XLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SectionResultValues add constraint fk_SectionResultValues_ZUnits
foreign key (ZLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SpectraResults add constraint fk_SpectraResults_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.SpectraResults add constraint fk_SpectraResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.SpectraResults add constraint fk_SpectraResults_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.SpectraResults add constraint fk_SpectraResults_Units
foreign key (IntendedWavelengthSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SpectraResults add constraint fk_SpectraResults_XUnits
foreign key (XLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SpectraResults add constraint fk_SpectraResults_YUnits
foreign key (YLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SpectraResults add constraint fk_SpectraResults_ZUnits
foreign key (ZLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SpectraResultValues add constraint fk_SpectraResultValues_AIUnits
foreign key (TimeAggregationIntervalUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SpectraResultValues add constraint fk_SpectraResultValues_CV_CensorCode
foreign key (CensorCodeCV) References ODM2.CV_CensorCode (Name)
on update no Action on delete cascade;

alter table ODM2.SpectraResultValues add constraint fk_SpectraResultValues_CV_QualityCode
foreign key (QualityCodeCV) References ODM2.CV_QualityCode (Name)
on update no Action on delete cascade;

alter table ODM2.SpectraResultValues add constraint fk_SpectraResultValues_SpectraResults
foreign key (ResultID) References ODM2.SpectraResults (ResultID)
on update no Action on delete cascade;

alter table ODM2.SpectraResultValues add constraint fk_SpectraResultValues_WUnits
foreign key (WavelengthUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResults add constraint fk_TimeSeriesResults_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResults add constraint fk_TimeSeriesResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResults add constraint fk_TimeSeriesResults_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResults add constraint fk_TimeSeriesResults_TUnits
foreign key (IntendedTimeSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResults add constraint fk_TimeSeriesResults_XUnits
foreign key (XLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResults add constraint fk_TimeSeriesResults_YUnits
foreign key (YLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResults add constraint fk_TimeSeriesResults_ZUnits
foreign key (ZLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResultValues add constraint fk_TimeSeriesResultValues_AIUnits
foreign key (TimeAggregationIntervalUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResultValues add constraint fk_TimeSeriesResultValues_CV_CensorCode
foreign key (CensorCodeCV) References ODM2.CV_CensorCode (Name)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResultValues add constraint fk_TimeSeriesResultValues_CV_QualityCode
foreign key (QualityCodeCV) References ODM2.CV_QualityCode (Name)
on update no Action on delete cascade;

alter table ODM2.TimeSeriesResultValues add constraint fk_TimeSeriesResultValues_TimeSeriesResults
foreign key (ResultID) References ODM2.TimeSeriesResults (ResultID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResults add constraint fk_TrajectoryResults_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResults add constraint fk_TrajectoryResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResults add constraint fk_TrajectoryResults_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResults add constraint fk_TrajectoryResults_TSUnits
foreign key (IntendedTrajectorySpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResults add constraint fk_TrajectoryResults_TUnits
foreign key (IntendedTimeSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValues add constraint fk_TrajectoryResultValues_AIUnits
foreign key (TimeAggregationIntervalUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValues add constraint fk_TrajectoryResultValues_CV_CensorCode
foreign key (CensorCodeCV) References ODM2.CV_CensorCode (Name)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValues add constraint fk_TrajectoryResultValues_CV_QualityCode
foreign key (QualityCodeCV) References ODM2.CV_QualityCode (Name)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValues add constraint fk_TrajectoryResultValues_DistanceUnits
foreign key (TrajectoryDistanceUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValues add constraint fk_TrajectoryResultValues_TrajectoryResults
foreign key (ResultID) References ODM2.TrajectoryResults (ResultID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValues add constraint fk_TrajectoryResultValues_XUnits
foreign key (XLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValues add constraint fk_TrajectoryResultValues_YUnits
foreign key (YLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TrajectoryResultValues add constraint fk_TrajectoryResultValues_ZUnits
foreign key (ZLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TransectResults add constraint fk_TransectResults_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.TransectResults add constraint fk_TransectResults_Results
foreign key (ResultID) References ODM2.Results (ResultID)
on update no Action on delete cascade;

alter table ODM2.TransectResults add constraint fk_TransectResults_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.TransectResults add constraint fk_TransectResults_TMUnits
foreign key (IntendedTimeSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TransectResults add constraint fk_TransectResults_TSUnits
foreign key (IntendedTransectSpacingUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TransectResults add constraint fk_TransectResults_Units
foreign key (ZLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TransectResultValues add constraint fk_TransectResultValues_AIUnits
foreign key (TimeAggregationIntervalUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TransectResultValues add constraint fk_TransectResultValues_CV_AggregationStatistic
foreign key (AggregationStatisticCV) References ODM2.CV_AggregationStatistic (Name)
on update no Action on delete cascade;

alter table ODM2.TransectResultValues add constraint fk_TransectResultValues_CV_CensorCode
foreign key (CensorCodeCV) References ODM2.CV_CensorCode (Name)
on update no Action on delete cascade;

alter table ODM2.TransectResultValues add constraint fk_TransectResultValues_CV_QualityCode
foreign key (QualityCodeCV) References ODM2.CV_QualityCode (Name)
on update no Action on delete cascade;

alter table ODM2.TransectResultValues add constraint fk_TransectResultValues_DistanceUnits
foreign key (TransectDistanceUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TransectResultValues add constraint fk_TransectResultValues_TransectResults
foreign key (ResultID) References ODM2.TransectResults (ResultID)
on update no Action on delete cascade;

alter table ODM2.TransectResultValues add constraint fk_TransectResultValues_XUnits
foreign key (XLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.TransectResultValues add constraint fk_TransectResultValues_YUnits
foreign key (YLocationUnitsID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.RelatedFeatures add constraint fk_FeatureParents_FeaturesParent
foreign key (RelatedFeatureID) References ODM2.SamplingFeatures (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.RelatedFeatures add constraint fk_FeatureParents_SamplingFeatures
foreign key (SamplingFeatureID) References ODM2.SamplingFeatures (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.RelatedFeatures add constraint fk_FeatureParents_SpatialOffsets
foreign key (SpatialOffsetID) References ODM2.SpatialOffsets (SpatialOffsetID)
on update no Action on delete cascade;

alter table ODM2.RelatedFeatures add constraint fk_RelatedFeatures_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.Sites add constraint fk_Sites_CV_SiteType
foreign key (SiteTypeCV) References ODM2.CV_SiteType (Name)
on update no Action on delete cascade;

alter table ODM2.Sites add constraint fk_Sites_SamplingFeatures
foreign key (SamplingFeatureID) References ODM2.SamplingFeatures (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.Sites add constraint fk_Sites_SpatialReferences
foreign key (SpatialReferenceID) References ODM2.SpatialReferences (SpatialReferenceID)
on update no Action on delete cascade;

alter table ODM2.SpatialOffsets add constraint fk_SpatialOffsets_CV_SpatialOffsetType
foreign key (SpatialOffsetTypeCV) References ODM2.CV_SpatialOffsetType (Name)
on update no Action on delete cascade;

alter table ODM2.SpatialOffsets add constraint fk_SpatialOffsets_Offset1Units
foreign key (Offset1UnitID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SpatialOffsets add constraint fk_SpatialOffsets_Offset2Units
foreign key (Offset2UnitID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.SpatialOffsets add constraint fk_SpatialOffsets_Offset3Units
foreign key (Offset3UnitID) References ODM2.Units (UnitsID)
on update no Action on delete cascade;

alter table ODM2.Specimens add constraint fk_Specimens_CV_Medium
foreign key (SpecimenMediumCV) References ODM2.CV_Medium (Name)
on update no Action on delete cascade;

alter table ODM2.Specimens add constraint fk_Specimens_CV_SpecimenType
foreign key (SpecimenTypeCV) References ODM2.CV_SpecimenType (Name)
on update no Action on delete cascade;

alter table ODM2.Specimens add constraint fk_Specimens_SamplingFeatures
foreign key (SamplingFeatureID) References ODM2.SamplingFeatures (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.SpecimenTaxonomicClassifiers add constraint fk_SpecimenTaxonomicClassifiers_Citations
foreign key (CitationID) References ODM2.Citations (CitationID)
on update no Action on delete cascade;

alter table ODM2.SpecimenTaxonomicClassifiers add constraint fk_SpecimenTaxonomicClassifiers_Specimens
foreign key (SamplingFeatureID) References ODM2.Specimens (SamplingFeatureID)
on update no Action on delete cascade;

alter table ODM2.SpecimenTaxonomicClassifiers add constraint fk_SpecimenTaxonomicClassifiers_TaxonomicClassifiers
foreign key (TaxonomicClassifierID) References ODM2.TaxonomicClassifiers (TaxonomicClassifierID)
on update no Action on delete cascade;

alter table ODM2.ModelAffiliations add constraint fk_ModelAffiliations_Affiliations
foreign key (AffiliationID) References ODM2.Affiliations (AffiliationID)
on update no Action on delete cascade;

alter table ODM2.ModelAffiliations add constraint fk_ModelAffiliations_Models
foreign key (ModelID) References ODM2.Models (ModelID)
on update no Action on delete cascade;

alter table ODM2.RelatedModels add constraint fk_RelatedModels_CV_RelationshipType
foreign key (RelationshipTypeCV) References ODM2.CV_RelationshipType (Name)
on update no Action on delete cascade;

alter table ODM2.RelatedModels add constraint fk_RelatedModels_Models
foreign key (ModelID) References ODM2.Models (ModelID)
on update no Action on delete cascade;

alter table ODM2.Simulations add constraint fk_Simulations_Actions
foreign key (ActionID) References ODM2.Actions (ActionID)
on update no Action on delete cascade;

alter table ODM2.Simulations add constraint fk_Simulations_Models
foreign key (ModelID) References ODM2.Models (ModelID)
on update no Action on delete cascade;