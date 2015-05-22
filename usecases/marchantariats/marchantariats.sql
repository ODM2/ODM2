--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-22 09:38:32 PDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 4954 (class 1262 OID 21975)
-- Name: marchantariats; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE marchantariats WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


\connect marchantariats

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 4955 (class 1262 OID 21975)
-- Dependencies: 4954
-- Name: marchantariats; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE marchantariats IS 'ODM2-based database for river biogeochemistry data collections. | 5/10/2015: Retained amz_riverbgc schema but rebuilt odm2 schema(s) with latest, common DDL. | Updated 2/8/2015. First created 8/3/2014.';


--
-- TOC entry 8 (class 2615 OID 69986)
-- Name: odm2; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA odm2;


--
-- TOC entry 432 (class 3079 OID 11787)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 432
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 434 (class 3079 OID 16390)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 434
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- TOC entry 433 (class 3079 OID 24039)
-- Name: postgres_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgres_fdw WITH SCHEMA public;


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 433
-- Name: EXTENSION postgres_fdw; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgres_fdw IS 'foreign-data wrapper for remote PostgreSQL servers';


--
-- TOC entry 3576 (class 1417 OID 24049)
-- Name: amazonriverbgc; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER amazonriverbgc FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'amazonriverbgc',
    host 'localhost',
    port '5432'
);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 3576
-- Name: USER MAPPING public SERVER amazonriverbgc; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR public SERVER amazonriverbgc OPTIONS (
    password '>Xen1aDBAP>',
    "user" 'xeniadba'
);


SET search_path = odm2, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 211 (class 1259 OID 69989)
-- Name: actionannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE actionannotations (
    bridgeid integer NOT NULL,
    actionid integer NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 69987)
-- Name: actionannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE actionannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 210
-- Name: actionannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE actionannotations_bridgeid_seq OWNED BY actionannotations.bridgeid;


--
-- TOC entry 241 (class 1259 OID 70112)
-- Name: actionby; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE actionby (
    bridgeid integer NOT NULL,
    actionid integer NOT NULL,
    affiliationid integer NOT NULL,
    isactionlead boolean NOT NULL,
    roledescription character varying(500)
);


--
-- TOC entry 240 (class 1259 OID 70110)
-- Name: actionby_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE actionby_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 240
-- Name: actionby_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE actionby_bridgeid_seq OWNED BY actionby.bridgeid;


--
-- TOC entry 360 (class 1259 OID 70808)
-- Name: actiondirectives; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE actiondirectives (
    bridgeid integer NOT NULL,
    actionid integer NOT NULL,
    directiveid integer NOT NULL
);


--
-- TOC entry 359 (class 1259 OID 70806)
-- Name: actiondirectives_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE actiondirectives_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 359
-- Name: actiondirectives_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE actiondirectives_bridgeid_seq OWNED BY actiondirectives.bridgeid;


--
-- TOC entry 329 (class 1259 OID 70653)
-- Name: actionextensionpropertyvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE actionextensionpropertyvalues (
    bridgeid integer NOT NULL,
    actionid integer NOT NULL,
    propertyid integer NOT NULL,
    propertyvalue character varying(255) NOT NULL
);


--
-- TOC entry 328 (class 1259 OID 70651)
-- Name: actionextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE actionextensionpropertyvalues_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 328
-- Name: actionextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE actionextensionpropertyvalues_bridgeid_seq OWNED BY actionextensionpropertyvalues.bridgeid;


--
-- TOC entry 243 (class 1259 OID 70123)
-- Name: actions; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE actions (
    actionid integer NOT NULL,
    actiontypecv character varying(255) NOT NULL,
    methodid integer NOT NULL,
    begindatetime timestamp without time zone NOT NULL,
    begindatetimeutcoffset integer NOT NULL,
    enddatetime timestamp without time zone,
    enddatetimeutcoffset integer,
    actiondescription character varying(500),
    actionfilelink character varying(255)
);


--
-- TOC entry 242 (class 1259 OID 70121)
-- Name: actions_actionid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE actions_actionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 242
-- Name: actions_actionid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE actions_actionid_seq OWNED BY actions.actionid;


--
-- TOC entry 245 (class 1259 OID 70134)
-- Name: affiliations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE affiliations (
    affiliationid integer NOT NULL,
    personid integer NOT NULL,
    organizationid integer,
    isprimaryorganizationcontact boolean,
    affiliationstartdate date NOT NULL,
    affiliationenddate date,
    primaryphone character varying(50),
    primaryemail character varying(255) NOT NULL,
    primaryaddress character varying(255),
    personlink character varying(255)
);


--
-- TOC entry 244 (class 1259 OID 70132)
-- Name: affiliations_affiliationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE affiliations_affiliationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 244
-- Name: affiliations_affiliationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE affiliations_affiliationid_seq OWNED BY affiliations.affiliationid;


--
-- TOC entry 213 (class 1259 OID 69997)
-- Name: annotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE annotations (
    annotationid integer NOT NULL,
    annotationtypecv character varying(255) NOT NULL,
    annotationcode character varying(50),
    annotationtext character varying(500) NOT NULL,
    annotationdatetime timestamp without time zone,
    annotationutcoffset integer,
    annotationlink character varying(255),
    annotatorid integer,
    citationid integer
);


--
-- TOC entry 212 (class 1259 OID 69995)
-- Name: annotations_annotationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE annotations_annotationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 212
-- Name: annotations_annotationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE annotations_annotationid_seq OWNED BY annotations.annotationid;


--
-- TOC entry 365 (class 1259 OID 70832)
-- Name: authorlists; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE authorlists (
    bridgeid integer NOT NULL,
    citationid integer NOT NULL,
    personid integer NOT NULL,
    authororder integer NOT NULL
);


--
-- TOC entry 364 (class 1259 OID 70830)
-- Name: authorlists_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE authorlists_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 364
-- Name: authorlists_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE authorlists_bridgeid_seq OWNED BY authorlists.bridgeid;


--
-- TOC entry 306 (class 1259 OID 70540)
-- Name: calibrationactions; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE calibrationactions (
    actionid integer NOT NULL,
    calibrationcheckvalue double precision,
    instrumentoutputvariableid integer NOT NULL,
    calibrationequation character varying(255)
);


--
-- TOC entry 308 (class 1259 OID 70547)
-- Name: calibrationreferenceequipment; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE calibrationreferenceequipment (
    bridgeid integer NOT NULL,
    actionid integer NOT NULL,
    equipmentid integer NOT NULL
);


--
-- TOC entry 307 (class 1259 OID 70545)
-- Name: calibrationreferenceequipment_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE calibrationreferenceequipment_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 307
-- Name: calibrationreferenceequipment_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE calibrationreferenceequipment_bridgeid_seq OWNED BY calibrationreferenceequipment.bridgeid;


--
-- TOC entry 310 (class 1259 OID 70555)
-- Name: calibrationstandards; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE calibrationstandards (
    bridgeid integer NOT NULL,
    actionid integer NOT NULL,
    referencematerialid integer NOT NULL
);


--
-- TOC entry 309 (class 1259 OID 70553)
-- Name: calibrationstandards_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE calibrationstandards_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 309
-- Name: calibrationstandards_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE calibrationstandards_bridgeid_seq OWNED BY calibrationstandards.bridgeid;


--
-- TOC entry 383 (class 1259 OID 70910)
-- Name: categoricalresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE categoricalresults (
    resultid bigint NOT NULL,
    xlocation double precision,
    xlocationunitsid integer,
    ylocation double precision,
    ylocationunitsid integer,
    zlocation double precision,
    zlocationunitsid integer,
    spatialreferenceid integer,
    qualitycodecv character varying(255) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 70008)
-- Name: categoricalresultvalueannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE categoricalresultvalueannotations (
    bridgeid integer NOT NULL,
    valueid bigint NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 70006)
-- Name: categoricalresultvalueannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE categoricalresultvalueannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 214
-- Name: categoricalresultvalueannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE categoricalresultvalueannotations_bridgeid_seq OWNED BY categoricalresultvalueannotations.bridgeid;


--
-- TOC entry 385 (class 1259 OID 70917)
-- Name: categoricalresultvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE categoricalresultvalues (
    valueid bigint NOT NULL,
    resultid bigint NOT NULL,
    datavalue character varying(255) NOT NULL,
    valuedatetime timestamp without time zone NOT NULL,
    valuedatetimeutcoffset integer NOT NULL
);


--
-- TOC entry 384 (class 1259 OID 70915)
-- Name: categoricalresultvalues_valueid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE categoricalresultvalues_valueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 384
-- Name: categoricalresultvalues_valueid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE categoricalresultvalues_valueid_seq OWNED BY categoricalresultvalues.valueid;


--
-- TOC entry 331 (class 1259 OID 70661)
-- Name: citationextensionpropertyvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE citationextensionpropertyvalues (
    bridgeid integer NOT NULL,
    citationid integer NOT NULL,
    propertyid integer NOT NULL,
    propertyvalue character varying(255) NOT NULL
);


--
-- TOC entry 330 (class 1259 OID 70659)
-- Name: citationextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE citationextensionpropertyvalues_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 330
-- Name: citationextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE citationextensionpropertyvalues_bridgeid_seq OWNED BY citationextensionpropertyvalues.bridgeid;


--
-- TOC entry 343 (class 1259 OID 70712)
-- Name: citationexternalidentifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE citationexternalidentifiers (
    bridgeid integer NOT NULL,
    citationid integer NOT NULL,
    externalidentifiersystemid integer NOT NULL,
    citationexternalidentifer character varying(255) NOT NULL,
    citationexternalidentiferuri character varying(255)
);


--
-- TOC entry 342 (class 1259 OID 70710)
-- Name: citationexternalidentifiers_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE citationexternalidentifiers_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 342
-- Name: citationexternalidentifiers_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE citationexternalidentifiers_bridgeid_seq OWNED BY citationexternalidentifiers.bridgeid;


--
-- TOC entry 367 (class 1259 OID 70840)
-- Name: citations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE citations (
    citationid integer NOT NULL,
    title character varying(255) NOT NULL,
    publisher character varying(255) NOT NULL,
    publicationyear integer NOT NULL,
    citationlink character varying(255)
);


--
-- TOC entry 366 (class 1259 OID 70838)
-- Name: citations_citationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE citations_citationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 366
-- Name: citations_citationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE citations_citationid_seq OWNED BY citations.citationid;


--
-- TOC entry 271 (class 1259 OID 70274)
-- Name: cv_actiontype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_actiontype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 272 (class 1259 OID 70282)
-- Name: cv_aggregationstatistic; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_aggregationstatistic (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 273 (class 1259 OID 70290)
-- Name: cv_annotationtype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_annotationtype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 274 (class 1259 OID 70298)
-- Name: cv_censorcode; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_censorcode (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 275 (class 1259 OID 70306)
-- Name: cv_dataqualitytype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_dataqualitytype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 276 (class 1259 OID 70314)
-- Name: cv_datasettypecv; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_datasettypecv (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 277 (class 1259 OID 70322)
-- Name: cv_directivetype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_directivetype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 278 (class 1259 OID 70330)
-- Name: cv_elevationdatum; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_elevationdatum (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 279 (class 1259 OID 70338)
-- Name: cv_equipmenttype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_equipmenttype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 280 (class 1259 OID 70346)
-- Name: cv_methodtype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_methodtype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 281 (class 1259 OID 70354)
-- Name: cv_organizationtype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_organizationtype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 282 (class 1259 OID 70362)
-- Name: cv_propertydatatype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_propertydatatype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 283 (class 1259 OID 70370)
-- Name: cv_qualitycode; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_qualitycode (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 284 (class 1259 OID 70378)
-- Name: cv_referencematerialmedium; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_referencematerialmedium (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 285 (class 1259 OID 70386)
-- Name: cv_relationshiptype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_relationshiptype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 286 (class 1259 OID 70394)
-- Name: cv_resulttype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_resulttype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 287 (class 1259 OID 70402)
-- Name: cv_sampledmedium; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_sampledmedium (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 288 (class 1259 OID 70410)
-- Name: cv_samplingfeaturegeotype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_samplingfeaturegeotype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 289 (class 1259 OID 70418)
-- Name: cv_samplingfeaturetype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_samplingfeaturetype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 290 (class 1259 OID 70426)
-- Name: cv_sitetype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_sitetype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 291 (class 1259 OID 70434)
-- Name: cv_spatialoffsettype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_spatialoffsettype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 292 (class 1259 OID 70442)
-- Name: cv_speciation; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_speciation (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 293 (class 1259 OID 70450)
-- Name: cv_specimenmedium; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_specimenmedium (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 294 (class 1259 OID 70458)
-- Name: cv_specimentype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_specimentype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 295 (class 1259 OID 70466)
-- Name: cv_status; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_status (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 296 (class 1259 OID 70474)
-- Name: cv_taxonomicclassifiertype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_taxonomicclassifiertype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 297 (class 1259 OID 70482)
-- Name: cv_unitstype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_unitstype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 298 (class 1259 OID 70490)
-- Name: cv_variablename; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_variablename (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 299 (class 1259 OID 70498)
-- Name: cv_variabletype; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE cv_variabletype (
    term character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    definition character varying(1000),
    category character varying(255),
    sourcevocabularyuri character varying(255)
);


--
-- TOC entry 312 (class 1259 OID 70563)
-- Name: dataloggerfilecolumns; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE dataloggerfilecolumns (
    dataloggerfilecolumnid integer NOT NULL,
    resultid bigint,
    dataloggerfileid integer NOT NULL,
    instrumentoutputvariableid integer NOT NULL,
    columnlabel character varying(50) NOT NULL,
    columndescription character varying(500),
    measurementequation character varying(255),
    scaninterval double precision,
    scanintervalunitsid integer,
    recordinginterval double precision,
    recordingintervalunitsid integer,
    aggregationstatisticcv character varying(255)
);


--
-- TOC entry 311 (class 1259 OID 70561)
-- Name: dataloggerfilecolumns_dataloggerfilecolumnid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE dataloggerfilecolumns_dataloggerfilecolumnid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 311
-- Name: dataloggerfilecolumns_dataloggerfilecolumnid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE dataloggerfilecolumns_dataloggerfilecolumnid_seq OWNED BY dataloggerfilecolumns.dataloggerfilecolumnid;


--
-- TOC entry 314 (class 1259 OID 70574)
-- Name: dataloggerfiles; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE dataloggerfiles (
    dataloggerfileid integer NOT NULL,
    programid integer NOT NULL,
    dataloggerfilename character varying(255) NOT NULL,
    dataloggerfiledescription character varying(500),
    dataloggerfilelink character varying(255)
);


--
-- TOC entry 313 (class 1259 OID 70572)
-- Name: dataloggerfiles_dataloggerfileid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE dataloggerfiles_dataloggerfileid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 313
-- Name: dataloggerfiles_dataloggerfileid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE dataloggerfiles_dataloggerfileid_seq OWNED BY dataloggerfiles.dataloggerfileid;


--
-- TOC entry 316 (class 1259 OID 70585)
-- Name: dataloggerprogramfiles; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE dataloggerprogramfiles (
    programid integer NOT NULL,
    affiliationid integer NOT NULL,
    programname character varying(255) NOT NULL,
    programdescription character varying(500),
    programversion character varying(50),
    programfilelink character varying(255)
);


--
-- TOC entry 315 (class 1259 OID 70583)
-- Name: dataloggerprogramfiles_programid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE dataloggerprogramfiles_programid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 315
-- Name: dataloggerprogramfiles_programid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE dataloggerprogramfiles_programid_seq OWNED BY dataloggerprogramfiles.programid;


--
-- TOC entry 300 (class 1259 OID 70506)
-- Name: dataquality; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE dataquality (
    dataqualityid integer NOT NULL,
    dataqualitytypecv character varying(255) NOT NULL,
    dataqualitycode character varying(255) NOT NULL,
    dataqualityvalue double precision,
    dataqualityvalueunitsid integer,
    dataqualitydescription character varying(500),
    dataqualitylink character varying(255)
);


--
-- TOC entry 369 (class 1259 OID 70851)
-- Name: datasetcitations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE datasetcitations (
    bridgeid integer NOT NULL,
    datasetid integer NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    citationid integer NOT NULL
);


--
-- TOC entry 368 (class 1259 OID 70849)
-- Name: datasetcitations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE datasetcitations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 368
-- Name: datasetcitations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE datasetcitations_bridgeid_seq OWNED BY datasetcitations.bridgeid;


--
-- TOC entry 247 (class 1259 OID 70145)
-- Name: datasets; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE datasets (
    datasetid integer NOT NULL,
    datasetuuid uuid NOT NULL,
    datasettypecv character varying(255) NOT NULL,
    datasetcode character varying(50) NOT NULL,
    datasettitle character varying(255) NOT NULL,
    datasetabstract character varying(500) NOT NULL
);


--
-- TOC entry 246 (class 1259 OID 70143)
-- Name: datasets_datasetid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE datasets_datasetid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 246
-- Name: datasets_datasetid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE datasets_datasetid_seq OWNED BY datasets.datasetid;


--
-- TOC entry 249 (class 1259 OID 70156)
-- Name: datasetsresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE datasetsresults (
    bridgeid integer NOT NULL,
    datasetid integer NOT NULL,
    resultid bigint NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 70154)
-- Name: datasetsresults_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE datasetsresults_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 248
-- Name: datasetsresults_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE datasetsresults_bridgeid_seq OWNED BY datasetsresults.bridgeid;


--
-- TOC entry 371 (class 1259 OID 70859)
-- Name: derivationequations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE derivationequations (
    derivationequationid integer NOT NULL,
    derivationequation character varying(255) NOT NULL
);


--
-- TOC entry 370 (class 1259 OID 70857)
-- Name: derivationequations_derivationequationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE derivationequations_derivationequationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 370
-- Name: derivationequations_derivationequationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE derivationequations_derivationequationid_seq OWNED BY derivationequations.derivationequationid;


--
-- TOC entry 362 (class 1259 OID 70816)
-- Name: directives; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE directives (
    directiveid integer NOT NULL,
    directivetypecv character varying(255) NOT NULL,
    directivedescription character varying(500) NOT NULL
);


--
-- TOC entry 361 (class 1259 OID 70814)
-- Name: directives_directiveid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE directives_directiveid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 361
-- Name: directives_directiveid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE directives_directiveid_seq OWNED BY directives.directiveid;


--
-- TOC entry 318 (class 1259 OID 70596)
-- Name: equipment; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE equipment (
    equipmentid integer NOT NULL,
    equipmentcode character varying(50) NOT NULL,
    equipmentname character varying(255) NOT NULL,
    equipmenttypecv character varying(255) NOT NULL,
    equipmentmodelid integer NOT NULL,
    equipmentserialnumber character varying(50) NOT NULL,
    equipmentownerid integer NOT NULL,
    equipmentvendorid integer NOT NULL,
    equipmentpurchasedate timestamp without time zone NOT NULL,
    equipmentpurchaseordernumber character varying(50),
    equipmentdescription character varying(500),
    equipmentdocumentationlink character varying(255)
);


--
-- TOC entry 317 (class 1259 OID 70594)
-- Name: equipment_equipmentid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE equipment_equipmentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 317
-- Name: equipment_equipmentid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE equipment_equipmentid_seq OWNED BY equipment.equipmentid;


--
-- TOC entry 217 (class 1259 OID 70016)
-- Name: equipmentannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE equipmentannotations (
    bridgeid integer NOT NULL,
    equipmentid integer NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 70014)
-- Name: equipmentannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE equipmentannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 216
-- Name: equipmentannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE equipmentannotations_bridgeid_seq OWNED BY equipmentannotations.bridgeid;


--
-- TOC entry 320 (class 1259 OID 70607)
-- Name: equipmentmodels; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE equipmentmodels (
    equipmentmodelid integer NOT NULL,
    modelmanufacturerid integer NOT NULL,
    modelpartnumber character varying(50),
    modelname character varying(255) NOT NULL,
    modeldescription character varying(500),
    isinstrument boolean NOT NULL,
    modelspecificationsfilelink character varying(255),
    modellink character varying(255)
);


--
-- TOC entry 319 (class 1259 OID 70605)
-- Name: equipmentmodels_equipmentmodelid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE equipmentmodels_equipmentmodelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 319
-- Name: equipmentmodels_equipmentmodelid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE equipmentmodels_equipmentmodelid_seq OWNED BY equipmentmodels.equipmentmodelid;


--
-- TOC entry 322 (class 1259 OID 70618)
-- Name: equipmentused; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE equipmentused (
    bridgeid integer NOT NULL,
    actionid integer NOT NULL,
    equipmentid integer NOT NULL
);


--
-- TOC entry 321 (class 1259 OID 70616)
-- Name: equipmentused_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE equipmentused_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 321
-- Name: equipmentused_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE equipmentused_bridgeid_seq OWNED BY equipmentused.bridgeid;


--
-- TOC entry 333 (class 1259 OID 70669)
-- Name: extensionproperties; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE extensionproperties (
    propertyid integer NOT NULL,
    propertyname character varying(255) NOT NULL,
    propertydescription character varying(500),
    propertydatatypecv character varying(255) NOT NULL,
    propertyunitsid integer
);


--
-- TOC entry 332 (class 1259 OID 70667)
-- Name: extensionproperties_propertyid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE extensionproperties_propertyid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 332
-- Name: extensionproperties_propertyid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE extensionproperties_propertyid_seq OWNED BY extensionproperties.propertyid;


--
-- TOC entry 344 (class 1259 OID 70721)
-- Name: externalidentifiersystems; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE externalidentifiersystems (
    externalidentifiersystemid integer NOT NULL,
    externalidentifiersystemname character varying(255) NOT NULL,
    identifiersystemorganizationid integer NOT NULL,
    externalidentifiersystemdescription character varying(500),
    externalidentifiersystemurl character varying(255)
);


--
-- TOC entry 251 (class 1259 OID 70164)
-- Name: featureactions; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE featureactions (
    featureactionid integer NOT NULL,
    samplingfeatureid integer NOT NULL,
    actionid integer NOT NULL
);


--
-- TOC entry 250 (class 1259 OID 70162)
-- Name: featureactions_featureactionid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE featureactions_featureactionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 250
-- Name: featureactions_featureactionid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE featureactions_featureactionid_seq OWNED BY featureactions.featureactionid;


--
-- TOC entry 324 (class 1259 OID 70626)
-- Name: instrumentoutputvariables; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE instrumentoutputvariables (
    instrumentoutputvariableid integer NOT NULL,
    modelid integer NOT NULL,
    variableid integer NOT NULL,
    instrumentmethodid integer NOT NULL,
    instrumentresolution character varying(255),
    instrumentaccuracy character varying(255),
    instrumentrawoutputunitsid integer NOT NULL
);


--
-- TOC entry 323 (class 1259 OID 70624)
-- Name: instrumentoutputvariables_instrumentoutputvariableid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE instrumentoutputvariables_instrumentoutputvariableid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 323
-- Name: instrumentoutputvariables_instrumentoutputvariableid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE instrumentoutputvariables_instrumentoutputvariableid_seq OWNED BY instrumentoutputvariables.instrumentoutputvariableid;


--
-- TOC entry 325 (class 1259 OID 70635)
-- Name: maintenanceactions; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE maintenanceactions (
    actionid integer NOT NULL,
    isfactoryservice boolean NOT NULL,
    maintenancecode character varying(50),
    maintenancereason character varying(500)
);


--
-- TOC entry 265 (class 1259 OID 70235)
-- Name: samplingfeatures; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE samplingfeatures (
    samplingfeatureid integer NOT NULL,
    samplingfeatureuuid uuid NOT NULL,
    samplingfeaturetypecv character varying(255) NOT NULL,
    samplingfeaturecode character varying(50) NOT NULL,
    samplingfeaturename character varying(255),
    samplingfeaturedescription character varying(500),
    samplingfeaturegeotypecv character varying(255),
    featuregeometry public.geometry,
    elevation_m double precision,
    elevationdatumcv character varying(255),
    CONSTRAINT enforce_dims_featuregeometry CHECK ((public.st_ndims(featuregeometry) = 2))
);


--
-- TOC entry 431 (class 1259 OID 77406)
-- Name: mappings_results_coarse_particulates; Type: VIEW; Schema: odm2; Owner: -
--

CREATE VIEW mappings_results_coarse_particulates AS
 SELECT fa.featureactionid,
    fa.samplingfeatureid,
    fa.actionid,
    arvuom.odm2_variableid AS variableid,
    arvuom.odm2_unitsid AS unitsid,
    act.begindatetime AS resultdatetime,
    act.begindatetimeutcoffset AS resultdatetimeutcoffset,
    arbgcfr.sampleid AS arbgcfr_sampleid,
    arbgcfr.variable AS arbgcfr_variable,
    arbgcfr.units AS arbgcfr_units,
    arbgcfr.value AS arbgcfr_value
   FROM ((((actions act
     JOIN ( SELECT samplingfeatures.samplingfeatureid,
            samplingfeatures.samplingfeatureuuid,
            samplingfeatures.samplingfeaturetypecv,
            samplingfeatures.samplingfeaturecode,
            samplingfeatures.samplingfeaturename,
            samplingfeatures.samplingfeaturedescription,
            samplingfeatures.samplingfeaturegeotypecv,
            samplingfeatures.featuregeometry,
            samplingfeatures.elevation_m,
            samplingfeatures.elevationdatumcv,
            ((regexp_matches((samplingfeatures.samplingfeaturecode)::text, 'smp(\d+)_cp'::text))[1])::integer AS sampleid
           FROM samplingfeatures
          WHERE (((samplingfeatures.samplingfeaturetypecv)::text = 'Specimen'::text) AND ((samplingfeatures.samplingfeaturecode)::text ~~ '%_cp'::text))) sfspec ON ((act.actionid = sfspec.sampleid)))
     JOIN featureactions fa ON (((act.actionid = fa.actionid) AND (sfspec.samplingfeatureid = fa.samplingfeatureid))))
     JOIN amz_riverbgc.coarse_particulates arbgcfr ON ((act.actionid = arbgcfr.sampleid)))
     JOIN amz_riverbgc.variable_units_odm2mapping arvuom ON ((arbgcfr.variable = (arvuom.variable)::text)))
  ORDER BY act.begindatetime, fa.actionid, arbgcfr.variable;


--
-- TOC entry 429 (class 1259 OID 75253)
-- Name: mappings_results_fine_particulates; Type: VIEW; Schema: odm2; Owner: -
--

CREATE VIEW mappings_results_fine_particulates AS
 SELECT fa.featureactionid,
    fa.samplingfeatureid,
    fa.actionid,
    arvuom.odm2_variableid AS variableid,
    arvuom.odm2_unitsid AS unitsid,
    act.begindatetime AS resultdatetime,
    act.begindatetimeutcoffset AS resultdatetimeutcoffset,
    arbgcfr.sampleid AS arbgcfr_sampleid,
    arbgcfr.variable AS arbgcfr_variable,
    arbgcfr.units AS arbgcfr_units,
    arbgcfr.value AS arbgcfr_value
   FROM ((((actions act
     JOIN ( SELECT samplingfeatures.samplingfeatureid,
            samplingfeatures.samplingfeatureuuid,
            samplingfeatures.samplingfeaturetypecv,
            samplingfeatures.samplingfeaturecode,
            samplingfeatures.samplingfeaturename,
            samplingfeatures.samplingfeaturedescription,
            samplingfeatures.samplingfeaturegeotypecv,
            samplingfeatures.featuregeometry,
            samplingfeatures.elevation_m,
            samplingfeatures.elevationdatumcv,
            ((regexp_matches((samplingfeatures.samplingfeaturecode)::text, 'smp(\d+)_fp'::text))[1])::integer AS sampleid
           FROM samplingfeatures
          WHERE (((samplingfeatures.samplingfeaturetypecv)::text = 'Specimen'::text) AND ((samplingfeatures.samplingfeaturecode)::text ~~ '%_fp'::text))) sfspec ON ((act.actionid = sfspec.sampleid)))
     JOIN featureactions fa ON (((act.actionid = fa.actionid) AND (sfspec.samplingfeatureid = fa.samplingfeatureid))))
     JOIN amz_riverbgc.fine_particulates arbgcfr ON ((act.actionid = arbgcfr.sampleid)))
     JOIN amz_riverbgc.variable_units_odm2mapping arvuom ON ((arbgcfr.variable = (arvuom.variable)::text)))
  ORDER BY act.begindatetime, fa.actionid, arbgcfr.variable;


--
-- TOC entry 386 (class 1259 OID 70923)
-- Name: measurementresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE measurementresults (
    resultid bigint NOT NULL,
    xlocation double precision,
    xlocationunitsid integer,
    ylocation double precision,
    ylocationunitsid integer,
    zlocation double precision,
    zlocationunitsid integer,
    spatialreferenceid integer,
    censorcodecv character varying(255) NOT NULL,
    qualitycodecv character varying(255) NOT NULL,
    aggregationstatisticcv character varying(255) NOT NULL,
    timeaggregationinterval double precision NOT NULL,
    timeaggregationintervalunitsid integer NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 70024)
-- Name: measurementresultvalueannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE measurementresultvalueannotations (
    bridgeid integer NOT NULL,
    valueid bigint NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 70022)
-- Name: measurementresultvalueannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE measurementresultvalueannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 218
-- Name: measurementresultvalueannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE measurementresultvalueannotations_bridgeid_seq OWNED BY measurementresultvalueannotations.bridgeid;


--
-- TOC entry 388 (class 1259 OID 70933)
-- Name: measurementresultvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE measurementresultvalues (
    valueid bigint NOT NULL,
    resultid bigint NOT NULL,
    datavalue double precision NOT NULL,
    valuedatetime timestamp without time zone NOT NULL,
    valuedatetimeutcoffset integer NOT NULL
);


--
-- TOC entry 387 (class 1259 OID 70931)
-- Name: measurementresultvalues_valueid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE measurementresultvalues_valueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 387
-- Name: measurementresultvalues_valueid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE measurementresultvalues_valueid_seq OWNED BY measurementresultvalues.valueid;


--
-- TOC entry 221 (class 1259 OID 70032)
-- Name: methodannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE methodannotations (
    bridgeid integer NOT NULL,
    methodid integer NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 70030)
-- Name: methodannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE methodannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 220
-- Name: methodannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE methodannotations_bridgeid_seq OWNED BY methodannotations.bridgeid;


--
-- TOC entry 373 (class 1259 OID 70867)
-- Name: methodcitations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE methodcitations (
    bridgeid integer NOT NULL,
    methodid integer NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    citationid integer NOT NULL
);


--
-- TOC entry 372 (class 1259 OID 70865)
-- Name: methodcitations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE methodcitations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 372
-- Name: methodcitations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE methodcitations_bridgeid_seq OWNED BY methodcitations.bridgeid;


--
-- TOC entry 335 (class 1259 OID 70680)
-- Name: methodextensionpropertyvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE methodextensionpropertyvalues (
    bridgeid integer NOT NULL,
    methodid integer NOT NULL,
    propertyid integer NOT NULL,
    propertyvalue character varying(255) NOT NULL
);


--
-- TOC entry 334 (class 1259 OID 70678)
-- Name: methodextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE methodextensionpropertyvalues_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 334
-- Name: methodextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE methodextensionpropertyvalues_bridgeid_seq OWNED BY methodextensionpropertyvalues.bridgeid;


--
-- TOC entry 346 (class 1259 OID 70731)
-- Name: methodexternalidentifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE methodexternalidentifiers (
    bridgeid integer NOT NULL,
    methodid integer NOT NULL,
    externalidentifiersystemid integer NOT NULL,
    methodexternalidentifier character varying(255) NOT NULL,
    methodexternalidentifieruri character varying(255)
);


--
-- TOC entry 345 (class 1259 OID 70729)
-- Name: methodexternalidentifiers_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE methodexternalidentifiers_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 345
-- Name: methodexternalidentifiers_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE methodexternalidentifiers_bridgeid_seq OWNED BY methodexternalidentifiers.bridgeid;


--
-- TOC entry 253 (class 1259 OID 70172)
-- Name: methods; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE methods (
    methodid integer NOT NULL,
    methodtypecv character varying(255) NOT NULL,
    methodcode character varying(50) NOT NULL,
    methodname character varying(255) NOT NULL,
    methoddescription character varying(500),
    methodlink character varying(255),
    organizationid integer
);


--
-- TOC entry 252 (class 1259 OID 70170)
-- Name: methods_methodid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE methods_methodid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 252
-- Name: methods_methodid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE methods_methodid_seq OWNED BY methods.methodid;


--
-- TOC entry 420 (class 1259 OID 71098)
-- Name: modelaffiliations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE modelaffiliations (
    bridgeid integer NOT NULL,
    modelid integer NOT NULL,
    affiliationid integer NOT NULL,
    isprimary boolean NOT NULL,
    roledescription character varying(500)
);


--
-- TOC entry 419 (class 1259 OID 71096)
-- Name: modelaffiliations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE modelaffiliations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 419
-- Name: modelaffiliations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE modelaffiliations_bridgeid_seq OWNED BY modelaffiliations.bridgeid;


--
-- TOC entry 422 (class 1259 OID 71109)
-- Name: models; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE models (
    modelid integer NOT NULL,
    modelcode character varying(50) NOT NULL,
    modelname character varying(255) NOT NULL,
    modeldescription character varying(500),
    version character varying(255),
    modellink character varying(255)
);


--
-- TOC entry 421 (class 1259 OID 71107)
-- Name: models_modelid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE models_modelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 421
-- Name: models_modelid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE models_modelid_seq OWNED BY models.modelid;


--
-- TOC entry 255 (class 1259 OID 70183)
-- Name: organizations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE organizations (
    organizationid integer NOT NULL,
    organizationtypecv character varying(255) NOT NULL,
    organizationcode character varying(50) NOT NULL,
    organizationname character varying(255) NOT NULL,
    organizationdescription character varying(500),
    organizationlink character varying(255),
    parentorganizationid integer
);


--
-- TOC entry 254 (class 1259 OID 70181)
-- Name: organizations_organizationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE organizations_organizationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 254
-- Name: organizations_organizationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE organizations_organizationid_seq OWNED BY organizations.organizationid;


--
-- TOC entry 257 (class 1259 OID 70194)
-- Name: people; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE people (
    personid integer NOT NULL,
    personfirstname character varying(255) NOT NULL,
    personmiddlename character varying(255),
    personlastname character varying(255) NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 70192)
-- Name: people_personid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE people_personid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 256
-- Name: people_personid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE people_personid_seq OWNED BY people.personid;


--
-- TOC entry 348 (class 1259 OID 70742)
-- Name: personexternalidentifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE personexternalidentifiers (
    bridgeid integer NOT NULL,
    personid integer NOT NULL,
    externalidentifiersystemid integer NOT NULL,
    personexternalidentifier character varying(255) NOT NULL,
    personexternalidentifieruri character varying(255)
);


--
-- TOC entry 347 (class 1259 OID 70740)
-- Name: personexternalidentifiers_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE personexternalidentifiers_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 347
-- Name: personexternalidentifiers_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE personexternalidentifiers_bridgeid_seq OWNED BY personexternalidentifiers.bridgeid;


--
-- TOC entry 389 (class 1259 OID 70939)
-- Name: pointcoverageresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE pointcoverageresults (
    resultid bigint NOT NULL,
    zlocation double precision,
    zlocationunitsid integer,
    spatialreferenceid integer,
    intendedxspacing double precision,
    intendedxspacingunitsid integer,
    intendedyspacing double precision,
    intendedyspacingunitsid integer,
    aggregationstatisticcv character varying(255) NOT NULL,
    timeaggregationinterval double precision NOT NULL,
    timeaggregationintervalunitsid integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 70040)
-- Name: pointcoverageresultvalueannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE pointcoverageresultvalueannotations (
    bridgeid bigint NOT NULL,
    valueid bigint NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 70038)
-- Name: pointcoverageresultvalueannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE pointcoverageresultvalueannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 222
-- Name: pointcoverageresultvalueannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE pointcoverageresultvalueannotations_bridgeid_seq OWNED BY pointcoverageresultvalueannotations.bridgeid;


--
-- TOC entry 391 (class 1259 OID 70946)
-- Name: pointcoverageresultvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE pointcoverageresultvalues (
    valueid bigint NOT NULL,
    resultid bigint NOT NULL,
    datavalue bigint NOT NULL,
    valuedatetime timestamp without time zone NOT NULL,
    valuedatetimeutcoffset integer NOT NULL,
    xlocation double precision NOT NULL,
    xlocationunitsid integer NOT NULL,
    ylocation double precision NOT NULL,
    ylocationunitsid integer NOT NULL,
    censorcodecv character varying(255) NOT NULL,
    qualitycodecv character varying(255) NOT NULL
);


--
-- TOC entry 390 (class 1259 OID 70944)
-- Name: pointcoverageresultvalues_valueid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE pointcoverageresultvalues_valueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 390
-- Name: pointcoverageresultvalues_valueid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE pointcoverageresultvalues_valueid_seq OWNED BY pointcoverageresultvalues.valueid;


--
-- TOC entry 259 (class 1259 OID 70205)
-- Name: processinglevels; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE processinglevels (
    processinglevelid integer NOT NULL,
    processinglevelcode character varying(50) NOT NULL,
    definition character varying(500),
    explanation character varying(500)
);


--
-- TOC entry 258 (class 1259 OID 70203)
-- Name: processinglevels_processinglevelid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE processinglevels_processinglevelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 258
-- Name: processinglevels_processinglevelid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE processinglevels_processinglevelid_seq OWNED BY processinglevels.processinglevelid;


--
-- TOC entry 392 (class 1259 OID 70955)
-- Name: profileresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE profileresults (
    resultid bigint NOT NULL,
    xlocation double precision,
    xlocationunitsid integer,
    ylocation double precision,
    ylocationunitsid integer,
    spatialreferenceid integer,
    intendedzspacing double precision,
    intendedzspacingunitsid integer,
    intendedtimespacing double precision,
    intendedtimespacingunitsid integer,
    aggregationstatisticcv character varying(255) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 70048)
-- Name: profileresultvalueannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE profileresultvalueannotations (
    bridgeid integer NOT NULL,
    valueid bigint NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 70046)
-- Name: profileresultvalueannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE profileresultvalueannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 224
-- Name: profileresultvalueannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE profileresultvalueannotations_bridgeid_seq OWNED BY profileresultvalueannotations.bridgeid;


--
-- TOC entry 394 (class 1259 OID 70962)
-- Name: profileresultvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE profileresultvalues (
    valueid bigint NOT NULL,
    resultid bigint NOT NULL,
    datavalue double precision NOT NULL,
    valuedatetime timestamp without time zone NOT NULL,
    valuedatetimeutcoffset integer NOT NULL,
    zlocation double precision NOT NULL,
    zaggregationinterval double precision NOT NULL,
    zlocationunitsid integer NOT NULL,
    censorcodecv character varying(255) NOT NULL,
    qualitycodecv character varying(255) NOT NULL,
    timeaggregationinterval double precision NOT NULL,
    timeaggregationintervalunitsid integer NOT NULL
);


--
-- TOC entry 393 (class 1259 OID 70960)
-- Name: profileresultvalues_valueid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE profileresultvalues_valueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 393
-- Name: profileresultvalues_valueid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE profileresultvalues_valueid_seq OWNED BY profileresultvalues.valueid;


--
-- TOC entry 350 (class 1259 OID 70753)
-- Name: referencematerialexternalidentifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE referencematerialexternalidentifiers (
    bridgeid integer NOT NULL,
    referencematerialid integer NOT NULL,
    externalidentifiersystemid integer NOT NULL,
    referencematerialexternalidentifier character varying(255) NOT NULL,
    referencematerialexternalidentifieruri character varying(255)
);


--
-- TOC entry 349 (class 1259 OID 70751)
-- Name: referencematerialexternalidentifiers_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE referencematerialexternalidentifiers_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 349
-- Name: referencematerialexternalidentifiers_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE referencematerialexternalidentifiers_bridgeid_seq OWNED BY referencematerialexternalidentifiers.bridgeid;


--
-- TOC entry 301 (class 1259 OID 70514)
-- Name: referencematerials; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE referencematerials (
    referencematerialid integer NOT NULL,
    referencematerialmediumcv character varying(255) NOT NULL,
    referencematerialorganizationid integer NOT NULL,
    referencematerialcode character varying(50) NOT NULL,
    referencemateriallotcode character varying(255),
    referencematerialpurchasedate timestamp without time zone,
    referencematerialexpirationdate timestamp without time zone,
    referencematerialcertificatelink character varying(255),
    samplingfeatureid integer
);


--
-- TOC entry 302 (class 1259 OID 70522)
-- Name: referencematerialvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE referencematerialvalues (
    referencematerialvalueid integer NOT NULL,
    referencematerialid integer NOT NULL,
    referencematerialvalue double precision NOT NULL,
    referencematerialaccuracy double precision,
    variableid integer NOT NULL,
    unitsid integer NOT NULL,
    citationid integer NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 70216)
-- Name: relatedactions; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE relatedactions (
    relationid integer NOT NULL,
    actionid integer NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    relatedactionid integer NOT NULL
);


--
-- TOC entry 260 (class 1259 OID 70214)
-- Name: relatedactions_relationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE relatedactions_relationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 260
-- Name: relatedactions_relationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE relatedactions_relationid_seq OWNED BY relatedactions.relationid;


--
-- TOC entry 375 (class 1259 OID 70875)
-- Name: relatedannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE relatedannotations (
    relationid integer NOT NULL,
    annotationid integer NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    relatedannotationid integer NOT NULL
);


--
-- TOC entry 374 (class 1259 OID 70873)
-- Name: relatedannotations_relationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE relatedannotations_relationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 374
-- Name: relatedannotations_relationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE relatedannotations_relationid_seq OWNED BY relatedannotations.relationid;


--
-- TOC entry 377 (class 1259 OID 70883)
-- Name: relatedcitations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE relatedcitations (
    relationid integer NOT NULL,
    citationid integer NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    relatedcitationid integer NOT NULL
);


--
-- TOC entry 376 (class 1259 OID 70881)
-- Name: relatedcitations_relationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE relatedcitations_relationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 376
-- Name: relatedcitations_relationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE relatedcitations_relationid_seq OWNED BY relatedcitations.relationid;


--
-- TOC entry 379 (class 1259 OID 70891)
-- Name: relateddatasets; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE relateddatasets (
    relationid integer NOT NULL,
    datasetid integer NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    relateddatasetid integer NOT NULL,
    versioncode character varying(50)
);


--
-- TOC entry 378 (class 1259 OID 70889)
-- Name: relateddatasets_relationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE relateddatasets_relationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 378
-- Name: relateddatasets_relationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE relateddatasets_relationid_seq OWNED BY relateddatasets.relationid;


--
-- TOC entry 327 (class 1259 OID 70645)
-- Name: relatedequipment; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE relatedequipment (
    relationid integer NOT NULL,
    equipmentid integer NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    relatedequipmentid integer NOT NULL,
    relationshipstartdatetime timestamp without time zone NOT NULL,
    relationshipstartdatetimeutcoffset integer NOT NULL,
    relationshipenddatetime timestamp without time zone,
    relationshipenddatetimeutcoffset integer
);


--
-- TOC entry 326 (class 1259 OID 70643)
-- Name: relatedequipment_relationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE relatedequipment_relationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 326
-- Name: relatedequipment_relationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE relatedequipment_relationid_seq OWNED BY relatedequipment.relationid;


--
-- TOC entry 411 (class 1259 OID 71053)
-- Name: relatedfeatures; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE relatedfeatures (
    relationid integer NOT NULL,
    samplingfeatureid integer NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    relatedfeatureid integer NOT NULL,
    spatialoffsetid integer
);


--
-- TOC entry 410 (class 1259 OID 71051)
-- Name: relatedfeatures_relationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE relatedfeatures_relationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 410
-- Name: relatedfeatures_relationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE relatedfeatures_relationid_seq OWNED BY relatedfeatures.relationid;


--
-- TOC entry 424 (class 1259 OID 71120)
-- Name: relatedmodels; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE relatedmodels (
    relatedid integer NOT NULL,
    modelid integer NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    relatedmodelid integer NOT NULL
);


--
-- TOC entry 423 (class 1259 OID 71118)
-- Name: relatedmodels_relatedid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE relatedmodels_relatedid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 423
-- Name: relatedmodels_relatedid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE relatedmodels_relatedid_seq OWNED BY relatedmodels.relatedid;


--
-- TOC entry 381 (class 1259 OID 70899)
-- Name: relatedresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE relatedresults (
    relationid integer NOT NULL,
    resultid bigint NOT NULL,
    relationshiptypecv character varying(255) NOT NULL,
    relatedresultid bigint NOT NULL,
    versioncode character varying(50),
    relatedresultsequencenumber integer
);


--
-- TOC entry 380 (class 1259 OID 70897)
-- Name: relatedresults_relationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE relatedresults_relationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 380
-- Name: relatedresults_relationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE relatedresults_relationid_seq OWNED BY relatedresults.relationid;


--
-- TOC entry 227 (class 1259 OID 70056)
-- Name: resultannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE resultannotations (
    bridgeid integer NOT NULL,
    resultid bigint NOT NULL,
    annotationid integer NOT NULL,
    begindatetime timestamp without time zone NOT NULL,
    enddatetime timestamp without time zone NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 70054)
-- Name: resultannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE resultannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 226
-- Name: resultannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE resultannotations_bridgeid_seq OWNED BY resultannotations.bridgeid;


--
-- TOC entry 382 (class 1259 OID 70905)
-- Name: resultderivationequations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE resultderivationequations (
    resultid bigint NOT NULL,
    derivationequationid integer NOT NULL
);


--
-- TOC entry 337 (class 1259 OID 70688)
-- Name: resultextensionpropertyvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE resultextensionpropertyvalues (
    bridgeid integer NOT NULL,
    resultid bigint NOT NULL,
    propertyid integer NOT NULL,
    propertyvalue character varying(255) NOT NULL
);


--
-- TOC entry 336 (class 1259 OID 70686)
-- Name: resultextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE resultextensionpropertyvalues_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 336
-- Name: resultextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE resultextensionpropertyvalues_bridgeid_seq OWNED BY resultextensionpropertyvalues.bridgeid;


--
-- TOC entry 303 (class 1259 OID 70527)
-- Name: resultnormalizationvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE resultnormalizationvalues (
    resultid bigint NOT NULL,
    normalizedbyreferencematerialvalueid integer NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 70224)
-- Name: results; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE results (
    resultid bigint NOT NULL,
    resultuuid uuid NOT NULL,
    featureactionid integer NOT NULL,
    resulttypecv character varying(255) NOT NULL,
    variableid integer NOT NULL,
    unitsid integer NOT NULL,
    taxonomicclassifierid integer,
    processinglevelid integer NOT NULL,
    resultdatetime timestamp without time zone,
    resultdatetimeutcoffset bigint,
    validdatetime timestamp without time zone,
    validdatetimeutcoffset bigint,
    statuscv character varying(255),
    sampledmediumcv character varying(255) NOT NULL,
    valuecount integer NOT NULL
);


--
-- TOC entry 262 (class 1259 OID 70222)
-- Name: results_resultid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE results_resultid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 262
-- Name: results_resultid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE results_resultid_seq OWNED BY results.resultid;


--
-- TOC entry 305 (class 1259 OID 70534)
-- Name: resultsdataquality; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE resultsdataquality (
    bridgeid integer NOT NULL,
    resultid bigint NOT NULL,
    dataqualityid integer NOT NULL
);


--
-- TOC entry 304 (class 1259 OID 70532)
-- Name: resultsdataquality_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE resultsdataquality_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 304
-- Name: resultsdataquality_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE resultsdataquality_bridgeid_seq OWNED BY resultsdataquality.bridgeid;


--
-- TOC entry 229 (class 1259 OID 70064)
-- Name: samplingfeatureannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE samplingfeatureannotations (
    bridgeid integer NOT NULL,
    samplingfeatureid integer NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 70062)
-- Name: samplingfeatureannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE samplingfeatureannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 228
-- Name: samplingfeatureannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE samplingfeatureannotations_bridgeid_seq OWNED BY samplingfeatureannotations.bridgeid;


--
-- TOC entry 339 (class 1259 OID 70696)
-- Name: samplingfeatureextensionpropertyvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE samplingfeatureextensionpropertyvalues (
    bridgeid integer NOT NULL,
    samplingfeatureid integer NOT NULL,
    propertyid integer NOT NULL,
    propertyvalue character varying(255) NOT NULL
);


--
-- TOC entry 338 (class 1259 OID 70694)
-- Name: samplingfeatureextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE samplingfeatureextensionpropertyvalues_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 338
-- Name: samplingfeatureextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE samplingfeatureextensionpropertyvalues_bridgeid_seq OWNED BY samplingfeatureextensionpropertyvalues.bridgeid;


--
-- TOC entry 352 (class 1259 OID 70764)
-- Name: samplingfeatureexternalidentifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE samplingfeatureexternalidentifiers (
    bridgeid integer NOT NULL,
    samplingfeatureid integer NOT NULL,
    externalidentifiersystemid integer NOT NULL,
    samplingfeatureexternalidentifier character varying(255) NOT NULL,
    samplingfeatureexternalidentifieruri character varying(255)
);


--
-- TOC entry 351 (class 1259 OID 70762)
-- Name: samplingfeatureexternalidentifiers_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE samplingfeatureexternalidentifiers_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 351
-- Name: samplingfeatureexternalidentifiers_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE samplingfeatureexternalidentifiers_bridgeid_seq OWNED BY samplingfeatureexternalidentifiers.bridgeid;


--
-- TOC entry 264 (class 1259 OID 70233)
-- Name: samplingfeatures_samplingfeatureid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE samplingfeatures_samplingfeatureid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 264
-- Name: samplingfeatures_samplingfeatureid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE samplingfeatures_samplingfeatureid_seq OWNED BY samplingfeatures.samplingfeatureid;


--
-- TOC entry 395 (class 1259 OID 70971)
-- Name: sectionresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE sectionresults (
    resultid bigint NOT NULL,
    ylocation double precision,
    ylocationunitsid integer,
    spatialreferenceid integer,
    intendedxspacing double precision,
    intendedxspacingunitsid integer,
    intendedzspacing double precision,
    intendedzspacingunitsid integer,
    intendedtimespacing double precision,
    intendedtimespacingunitsid integer,
    aggregationstatisticcv character varying(255) NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 70072)
-- Name: sectionresultvalueannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE sectionresultvalueannotations (
    bridgeid integer NOT NULL,
    valueid bigint NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 70070)
-- Name: sectionresultvalueannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE sectionresultvalueannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 230
-- Name: sectionresultvalueannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE sectionresultvalueannotations_bridgeid_seq OWNED BY sectionresultvalueannotations.bridgeid;


--
-- TOC entry 397 (class 1259 OID 70978)
-- Name: sectionresultvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE sectionresultvalues (
    valueid bigint NOT NULL,
    resultid bigint NOT NULL,
    datavalue double precision NOT NULL,
    valuedatetime bigint NOT NULL,
    valuedatetimeutcoffset bigint NOT NULL,
    xlocation double precision NOT NULL,
    xaggregationinterval double precision NOT NULL,
    xlocationunitsid integer NOT NULL,
    zlocation bigint NOT NULL,
    zaggregationinterval double precision NOT NULL,
    zlocationunitsid integer NOT NULL,
    censorcodecv character varying(255) NOT NULL,
    qualitycodecv character varying(255) NOT NULL,
    aggregationstatisticcv character varying(255) NOT NULL,
    timeaggregationinterval double precision NOT NULL,
    timeaggregationintervalunitsid integer NOT NULL
);


--
-- TOC entry 396 (class 1259 OID 70976)
-- Name: sectionresultvalues_valueid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE sectionresultvalues_valueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 396
-- Name: sectionresultvalues_valueid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE sectionresultvalues_valueid_seq OWNED BY sectionresultvalues.valueid;


--
-- TOC entry 426 (class 1259 OID 71128)
-- Name: simulations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE simulations (
    simulationid integer NOT NULL,
    actionid integer NOT NULL,
    simulationname character varying(255) NOT NULL,
    simulationdescription character varying(500),
    simulationstartdatetime timestamp without time zone NOT NULL,
    simulationstartdatetimeutcoffset integer NOT NULL,
    simulationenddatetime timestamp without time zone NOT NULL,
    simulationenddatetimeutcoffset integer NOT NULL,
    timestepvalue double precision NOT NULL,
    timestepunitsid integer NOT NULL,
    inputdatasetid integer,
    modelid integer NOT NULL
);


--
-- TOC entry 425 (class 1259 OID 71126)
-- Name: simulations_simulationid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE simulations_simulationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 425
-- Name: simulations_simulationid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE simulations_simulationid_seq OWNED BY simulations.simulationid;


--
-- TOC entry 412 (class 1259 OID 71059)
-- Name: sites; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE sites (
    samplingfeatureid integer NOT NULL,
    sitetypecv character varying(255) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    spatialreferenceid integer NOT NULL
);


--
-- TOC entry 413 (class 1259 OID 71064)
-- Name: spatialoffsets; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE spatialoffsets (
    spatialoffsetid integer NOT NULL,
    spatialoffsettypecv character varying(255) NOT NULL,
    offset1value double precision NOT NULL,
    offset1unitid integer NOT NULL,
    offset2value double precision,
    offset2unitid integer,
    offset3value double precision,
    offset3unitid integer
);


--
-- TOC entry 354 (class 1259 OID 70775)
-- Name: spatialreferenceexternalidentifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE spatialreferenceexternalidentifiers (
    bridgeid integer NOT NULL,
    spatialreferenceid integer NOT NULL,
    externalidentifiersystemid integer NOT NULL,
    spatialreferenceexternalidentifier character varying(255) NOT NULL,
    spatialreferenceexternalidentifieruri character varying(255)
);


--
-- TOC entry 353 (class 1259 OID 70773)
-- Name: spatialreferenceexternalidentifiers_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE spatialreferenceexternalidentifiers_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 353
-- Name: spatialreferenceexternalidentifiers_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE spatialreferenceexternalidentifiers_bridgeid_seq OWNED BY spatialreferenceexternalidentifiers.bridgeid;


--
-- TOC entry 415 (class 1259 OID 71071)
-- Name: spatialreferences; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE spatialreferences (
    spatialreferenceid integer NOT NULL,
    srscode character varying(50),
    srsname character varying(255) NOT NULL,
    srsdescription character varying(500),
    srslink character varying(255)
);


--
-- TOC entry 414 (class 1259 OID 71069)
-- Name: spatialreferences_spatialreferenceid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE spatialreferences_spatialreferenceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 414
-- Name: spatialreferences_spatialreferenceid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE spatialreferences_spatialreferenceid_seq OWNED BY spatialreferences.spatialreferenceid;


--
-- TOC entry 363 (class 1259 OID 70825)
-- Name: specimenbatchpostions; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE specimenbatchpostions (
    featureactionid integer NOT NULL,
    batchpositionnumber integer NOT NULL,
    batchpositionlabel character varying(255)
);


--
-- TOC entry 416 (class 1259 OID 71080)
-- Name: specimens; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE specimens (
    samplingfeatureid integer NOT NULL,
    specimentypecv character varying(255) NOT NULL,
    specimenmediumcv character varying(255) NOT NULL,
    isfieldspecimen boolean NOT NULL
);


--
-- TOC entry 418 (class 1259 OID 71090)
-- Name: specimentaxonomicclassifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE specimentaxonomicclassifiers (
    bridgeid integer NOT NULL,
    samplingfeatureid integer NOT NULL,
    taxonomicclassifierid integer NOT NULL,
    citationid integer
);


--
-- TOC entry 417 (class 1259 OID 71088)
-- Name: specimentaxonomicclassifiers_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE specimentaxonomicclassifiers_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 417
-- Name: specimentaxonomicclassifiers_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE specimentaxonomicclassifiers_bridgeid_seq OWNED BY specimentaxonomicclassifiers.bridgeid;


--
-- TOC entry 398 (class 1259 OID 70987)
-- Name: spectraresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE spectraresults (
    resultid bigint NOT NULL,
    xlocation double precision,
    xlocationunitsid integer,
    ylocation double precision,
    ylocationunitsid integer,
    zlocation double precision,
    zlocationunitsid integer,
    spatialreferenceid integer,
    intendedwavelengthspacing double precision,
    intendedwavelengthspacingunitsid integer,
    aggregationstatisticcv character varying(255) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 70080)
-- Name: spectraresultvalueannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE spectraresultvalueannotations (
    bridgeid integer NOT NULL,
    valueid bigint NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 70078)
-- Name: spectraresultvalueannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE spectraresultvalueannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 232
-- Name: spectraresultvalueannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE spectraresultvalueannotations_bridgeid_seq OWNED BY spectraresultvalueannotations.bridgeid;


--
-- TOC entry 400 (class 1259 OID 70994)
-- Name: spectraresultvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE spectraresultvalues (
    valueid bigint NOT NULL,
    resultid bigint NOT NULL,
    datavalue double precision NOT NULL,
    valuedatetime timestamp without time zone NOT NULL,
    valuedatetimeutcoffset integer NOT NULL,
    excitationwavelength double precision NOT NULL,
    emissionwavelength double precision NOT NULL,
    wavelengthunitsid integer NOT NULL,
    censorcodecv character varying(255) NOT NULL,
    qualitycodecv character varying(255) NOT NULL,
    timeaggregationinterval double precision NOT NULL,
    timeaggregationintervalunitsid integer NOT NULL
);


--
-- TOC entry 399 (class 1259 OID 70992)
-- Name: spectraresultvalues_valueid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE spectraresultvalues_valueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 399
-- Name: spectraresultvalues_valueid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE spectraresultvalues_valueid_seq OWNED BY spectraresultvalues.valueid;


--
-- TOC entry 356 (class 1259 OID 70786)
-- Name: taxonomicclassifierexternalidentifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE taxonomicclassifierexternalidentifiers (
    bridgeid integer NOT NULL,
    taxonomicclassifierid integer NOT NULL,
    externalidentifiersystemid integer NOT NULL,
    taxonomicclassifierexternalidentifier character varying(255) NOT NULL,
    taxonomicclassifierexternalidentifieruri character varying(255)
);


--
-- TOC entry 355 (class 1259 OID 70784)
-- Name: taxonomicclassifierexternalidentifiers_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE taxonomicclassifierexternalidentifiers_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 355
-- Name: taxonomicclassifierexternalidentifiers_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE taxonomicclassifierexternalidentifiers_bridgeid_seq OWNED BY taxonomicclassifierexternalidentifiers.bridgeid;


--
-- TOC entry 266 (class 1259 OID 70244)
-- Name: taxonomicclassifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE taxonomicclassifiers (
    taxonomicclassifierid integer NOT NULL,
    taxonomicclassifiertypecv character varying(255) NOT NULL,
    taxonomicclassifiername character varying(255) NOT NULL,
    taxonomicclassifiercommonname character varying(255),
    taxonomicclassifierdescription character varying(500),
    parenttaxonomicclassifierid integer
);


--
-- TOC entry 401 (class 1259 OID 71003)
-- Name: timeseriesresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE timeseriesresults (
    resultid bigint NOT NULL,
    xlocation double precision,
    xlocationunitsid integer,
    ylocation double precision,
    ylocationunitsid integer,
    zlocation double precision,
    zlocationunitsid integer,
    spatialreferenceid integer,
    intendedtimespacing double precision,
    intendedtimespacingunitsid integer,
    aggregationstatisticcv character varying(255) NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 70088)
-- Name: timeseriesresultvalueannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE timeseriesresultvalueannotations (
    bridgeid integer NOT NULL,
    valueid bigint NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 70086)
-- Name: timeseriesresultvalueannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE timeseriesresultvalueannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 234
-- Name: timeseriesresultvalueannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE timeseriesresultvalueannotations_bridgeid_seq OWNED BY timeseriesresultvalueannotations.bridgeid;


--
-- TOC entry 403 (class 1259 OID 71010)
-- Name: timeseriesresultvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE timeseriesresultvalues (
    valueid bigint NOT NULL,
    resultid bigint NOT NULL,
    datavalue double precision NOT NULL,
    valuedatetime timestamp without time zone NOT NULL,
    valuedatetimeutcoffset integer NOT NULL,
    censorcodecv character varying(255) NOT NULL,
    qualitycodecv character varying(255) NOT NULL,
    timeaggregationinterval double precision NOT NULL,
    timeaggregationintervalunitsid integer NOT NULL
);


--
-- TOC entry 402 (class 1259 OID 71008)
-- Name: timeseriesresultvalues_valueid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE timeseriesresultvalues_valueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 402
-- Name: timeseriesresultvalues_valueid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE timeseriesresultvalues_valueid_seq OWNED BY timeseriesresultvalues.valueid;


--
-- TOC entry 404 (class 1259 OID 71019)
-- Name: trajectoryresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE trajectoryresults (
    resultid bigint NOT NULL,
    spatialreferenceid integer,
    intendedtrajectoryspacing double precision,
    intendedtrajectoryspacingunitsid integer,
    intendedtimespacing double precision,
    intendedtimespacingunitsid integer,
    aggregationstatisticcv character varying(255) NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 70096)
-- Name: trajectoryresultvalueannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE trajectoryresultvalueannotations (
    bridgeid integer NOT NULL,
    valueid bigint NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 70094)
-- Name: trajectoryresultvalueannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE trajectoryresultvalueannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 236
-- Name: trajectoryresultvalueannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE trajectoryresultvalueannotations_bridgeid_seq OWNED BY trajectoryresultvalueannotations.bridgeid;


--
-- TOC entry 406 (class 1259 OID 71026)
-- Name: trajectoryresultvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE trajectoryresultvalues (
    valueid bigint NOT NULL,
    resultid bigint NOT NULL,
    datavalue double precision NOT NULL,
    valuedatetime timestamp without time zone NOT NULL,
    valuedatetimeutcoffset integer NOT NULL,
    xlocation double precision NOT NULL,
    xlocationunitsid integer NOT NULL,
    ylocation double precision NOT NULL,
    ylocationunitsid integer NOT NULL,
    zlocation double precision NOT NULL,
    zlocationunitsid integer NOT NULL,
    trajectorydistance double precision NOT NULL,
    trajectorydistanceaggregationinterval double precision NOT NULL,
    trajectorydistanceunitsid integer NOT NULL,
    censorcodecv character varying(255) NOT NULL,
    qualitycodecv character varying(255) NOT NULL,
    timeaggregationinterval double precision NOT NULL,
    timeaggregationintervalunitsid integer NOT NULL
);


--
-- TOC entry 405 (class 1259 OID 71024)
-- Name: trajectoryresultvalues_valueid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE trajectoryresultvalues_valueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 405
-- Name: trajectoryresultvalues_valueid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE trajectoryresultvalues_valueid_seq OWNED BY trajectoryresultvalues.valueid;


--
-- TOC entry 407 (class 1259 OID 71035)
-- Name: transectresults; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE transectresults (
    resultid bigint NOT NULL,
    zlocation double precision,
    zlocationunitsid integer,
    spatialreferenceid integer,
    intendedtransectspacing double precision,
    intendedtransectspacingunitsid integer,
    intendedtimespacing double precision,
    intendedtimespacingunitsid integer,
    aggregationstatisticcv character varying(255) NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 70104)
-- Name: transectresultvalueannotations; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE transectresultvalueannotations (
    bridgeid integer NOT NULL,
    valueid bigint NOT NULL,
    annotationid integer NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 70102)
-- Name: transectresultvalueannotations_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE transectresultvalueannotations_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 238
-- Name: transectresultvalueannotations_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE transectresultvalueannotations_bridgeid_seq OWNED BY transectresultvalueannotations.bridgeid;


--
-- TOC entry 409 (class 1259 OID 71042)
-- Name: transectresultvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE transectresultvalues (
    valueid bigint NOT NULL,
    resultid bigint NOT NULL,
    datavalue double precision NOT NULL,
    valuedatetime timestamp without time zone NOT NULL,
    valuedatetimeutcoffset timestamp without time zone NOT NULL,
    xlocation double precision NOT NULL,
    xlocationunitsid integer NOT NULL,
    ylocation double precision NOT NULL,
    ylocationunitsid integer NOT NULL,
    transectdistance double precision NOT NULL,
    transectdistanceaggregationinterval double precision NOT NULL,
    transectdistanceunitsid integer NOT NULL,
    censorcodecv character varying(255) NOT NULL,
    qualitycodecv character varying(255) NOT NULL,
    aggregationstatisticcv character varying(255) NOT NULL,
    timeaggregationinterval double precision NOT NULL,
    timeaggregationintervalunitsid integer NOT NULL
);


--
-- TOC entry 408 (class 1259 OID 71040)
-- Name: transectresultvalues_valueid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE transectresultvalues_valueid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 408
-- Name: transectresultvalues_valueid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE transectresultvalues_valueid_seq OWNED BY transectresultvalues.valueid;


--
-- TOC entry 268 (class 1259 OID 70254)
-- Name: units; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE units (
    unitsid integer NOT NULL,
    unitstypecv character varying(255) NOT NULL,
    unitsabbreviation character varying(50) NOT NULL,
    unitsname character varying(255) NOT NULL,
    unitslink character varying(255)
);


--
-- TOC entry 267 (class 1259 OID 70252)
-- Name: units_unitsid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE units_unitsid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 267
-- Name: units_unitsid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE units_unitsid_seq OWNED BY units.unitsid;


--
-- TOC entry 341 (class 1259 OID 70704)
-- Name: variableextensionpropertyvalues; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE variableextensionpropertyvalues (
    bridgeid integer NOT NULL,
    variableid integer NOT NULL,
    propertyid integer NOT NULL,
    propertyvalue character varying(255) NOT NULL
);


--
-- TOC entry 340 (class 1259 OID 70702)
-- Name: variableextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE variableextensionpropertyvalues_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 340
-- Name: variableextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE variableextensionpropertyvalues_bridgeid_seq OWNED BY variableextensionpropertyvalues.bridgeid;


--
-- TOC entry 358 (class 1259 OID 70797)
-- Name: variableexternalidentifiers; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE variableexternalidentifiers (
    bridgeid integer NOT NULL,
    variableid integer NOT NULL,
    externalidentifiersystemid integer NOT NULL,
    variableexternalidentifer character varying(255) NOT NULL,
    variableexternalidentifieruri character varying(255)
);


--
-- TOC entry 357 (class 1259 OID 70795)
-- Name: variableexternalidentifiers_bridgeid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE variableexternalidentifiers_bridgeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 357
-- Name: variableexternalidentifiers_bridgeid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE variableexternalidentifiers_bridgeid_seq OWNED BY variableexternalidentifiers.bridgeid;


--
-- TOC entry 270 (class 1259 OID 70265)
-- Name: variables; Type: TABLE; Schema: odm2; Owner: -; Tablespace: 
--

CREATE TABLE variables (
    variableid integer NOT NULL,
    variabletypecv character varying(255) NOT NULL,
    variablecode character varying(50) NOT NULL,
    variablenamecv character varying(255) NOT NULL,
    variabledefinition character varying(500),
    speciationcv character varying(255),
    nodatavalue double precision NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 70263)
-- Name: variables_variableid_seq; Type: SEQUENCE; Schema: odm2; Owner: -
--

CREATE SEQUENCE variables_variableid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 269
-- Name: variables_variableid_seq; Type: SEQUENCE OWNED BY; Schema: odm2; Owner: -
--

ALTER SEQUENCE variables_variableid_seq OWNED BY variables.variableid;


--
-- TOC entry 3973 (class 2604 OID 69992)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actionannotations ALTER COLUMN bridgeid SET DEFAULT nextval('actionannotations_bridgeid_seq'::regclass);


--
-- TOC entry 3988 (class 2604 OID 70115)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actionby ALTER COLUMN bridgeid SET DEFAULT nextval('actionby_bridgeid_seq'::regclass);


--
-- TOC entry 4030 (class 2604 OID 70811)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actiondirectives ALTER COLUMN bridgeid SET DEFAULT nextval('actiondirectives_bridgeid_seq'::regclass);


--
-- TOC entry 4015 (class 2604 OID 70656)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actionextensionpropertyvalues ALTER COLUMN bridgeid SET DEFAULT nextval('actionextensionpropertyvalues_bridgeid_seq'::regclass);


--
-- TOC entry 3989 (class 2604 OID 70126)
-- Name: actionid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actions ALTER COLUMN actionid SET DEFAULT nextval('actions_actionid_seq'::regclass);


--
-- TOC entry 3990 (class 2604 OID 70137)
-- Name: affiliationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY affiliations ALTER COLUMN affiliationid SET DEFAULT nextval('affiliations_affiliationid_seq'::regclass);


--
-- TOC entry 3974 (class 2604 OID 70000)
-- Name: annotationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY annotations ALTER COLUMN annotationid SET DEFAULT nextval('annotations_annotationid_seq'::regclass);


--
-- TOC entry 4032 (class 2604 OID 70835)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY authorlists ALTER COLUMN bridgeid SET DEFAULT nextval('authorlists_bridgeid_seq'::regclass);


--
-- TOC entry 4005 (class 2604 OID 70550)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY calibrationreferenceequipment ALTER COLUMN bridgeid SET DEFAULT nextval('calibrationreferenceequipment_bridgeid_seq'::regclass);


--
-- TOC entry 4006 (class 2604 OID 70558)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY calibrationstandards ALTER COLUMN bridgeid SET DEFAULT nextval('calibrationstandards_bridgeid_seq'::regclass);


--
-- TOC entry 3975 (class 2604 OID 70011)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY categoricalresultvalueannotations ALTER COLUMN bridgeid SET DEFAULT nextval('categoricalresultvalueannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4041 (class 2604 OID 70920)
-- Name: valueid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY categoricalresultvalues ALTER COLUMN valueid SET DEFAULT nextval('categoricalresultvalues_valueid_seq'::regclass);


--
-- TOC entry 4016 (class 2604 OID 70664)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY citationextensionpropertyvalues ALTER COLUMN bridgeid SET DEFAULT nextval('citationextensionpropertyvalues_bridgeid_seq'::regclass);


--
-- TOC entry 4022 (class 2604 OID 70715)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY citationexternalidentifiers ALTER COLUMN bridgeid SET DEFAULT nextval('citationexternalidentifiers_bridgeid_seq'::regclass);


--
-- TOC entry 4033 (class 2604 OID 70843)
-- Name: citationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY citations ALTER COLUMN citationid SET DEFAULT nextval('citations_citationid_seq'::regclass);


--
-- TOC entry 4007 (class 2604 OID 70566)
-- Name: dataloggerfilecolumnid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerfilecolumns ALTER COLUMN dataloggerfilecolumnid SET DEFAULT nextval('dataloggerfilecolumns_dataloggerfilecolumnid_seq'::regclass);


--
-- TOC entry 4008 (class 2604 OID 70577)
-- Name: dataloggerfileid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerfiles ALTER COLUMN dataloggerfileid SET DEFAULT nextval('dataloggerfiles_dataloggerfileid_seq'::regclass);


--
-- TOC entry 4009 (class 2604 OID 70588)
-- Name: programid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerprogramfiles ALTER COLUMN programid SET DEFAULT nextval('dataloggerprogramfiles_programid_seq'::regclass);


--
-- TOC entry 4034 (class 2604 OID 70854)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY datasetcitations ALTER COLUMN bridgeid SET DEFAULT nextval('datasetcitations_bridgeid_seq'::regclass);


--
-- TOC entry 3991 (class 2604 OID 70148)
-- Name: datasetid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY datasets ALTER COLUMN datasetid SET DEFAULT nextval('datasets_datasetid_seq'::regclass);


--
-- TOC entry 3992 (class 2604 OID 70159)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY datasetsresults ALTER COLUMN bridgeid SET DEFAULT nextval('datasetsresults_bridgeid_seq'::regclass);


--
-- TOC entry 4035 (class 2604 OID 70862)
-- Name: derivationequationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY derivationequations ALTER COLUMN derivationequationid SET DEFAULT nextval('derivationequations_derivationequationid_seq'::regclass);


--
-- TOC entry 4031 (class 2604 OID 70819)
-- Name: directiveid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY directives ALTER COLUMN directiveid SET DEFAULT nextval('directives_directiveid_seq'::regclass);


--
-- TOC entry 4010 (class 2604 OID 70599)
-- Name: equipmentid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipment ALTER COLUMN equipmentid SET DEFAULT nextval('equipment_equipmentid_seq'::regclass);


--
-- TOC entry 3976 (class 2604 OID 70019)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipmentannotations ALTER COLUMN bridgeid SET DEFAULT nextval('equipmentannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4011 (class 2604 OID 70610)
-- Name: equipmentmodelid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipmentmodels ALTER COLUMN equipmentmodelid SET DEFAULT nextval('equipmentmodels_equipmentmodelid_seq'::regclass);


--
-- TOC entry 4012 (class 2604 OID 70621)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipmentused ALTER COLUMN bridgeid SET DEFAULT nextval('equipmentused_bridgeid_seq'::regclass);


--
-- TOC entry 4017 (class 2604 OID 70672)
-- Name: propertyid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY extensionproperties ALTER COLUMN propertyid SET DEFAULT nextval('extensionproperties_propertyid_seq'::regclass);


--
-- TOC entry 3993 (class 2604 OID 70167)
-- Name: featureactionid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY featureactions ALTER COLUMN featureactionid SET DEFAULT nextval('featureactions_featureactionid_seq'::regclass);


--
-- TOC entry 4013 (class 2604 OID 70629)
-- Name: instrumentoutputvariableid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY instrumentoutputvariables ALTER COLUMN instrumentoutputvariableid SET DEFAULT nextval('instrumentoutputvariables_instrumentoutputvariableid_seq'::regclass);


--
-- TOC entry 3977 (class 2604 OID 70027)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresultvalueannotations ALTER COLUMN bridgeid SET DEFAULT nextval('measurementresultvalueannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4042 (class 2604 OID 70936)
-- Name: valueid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresultvalues ALTER COLUMN valueid SET DEFAULT nextval('measurementresultvalues_valueid_seq'::regclass);


--
-- TOC entry 3978 (class 2604 OID 70035)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodannotations ALTER COLUMN bridgeid SET DEFAULT nextval('methodannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4036 (class 2604 OID 70870)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodcitations ALTER COLUMN bridgeid SET DEFAULT nextval('methodcitations_bridgeid_seq'::regclass);


--
-- TOC entry 4018 (class 2604 OID 70683)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodextensionpropertyvalues ALTER COLUMN bridgeid SET DEFAULT nextval('methodextensionpropertyvalues_bridgeid_seq'::regclass);


--
-- TOC entry 4023 (class 2604 OID 70734)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodexternalidentifiers ALTER COLUMN bridgeid SET DEFAULT nextval('methodexternalidentifiers_bridgeid_seq'::regclass);


--
-- TOC entry 3994 (class 2604 OID 70175)
-- Name: methodid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methods ALTER COLUMN methodid SET DEFAULT nextval('methods_methodid_seq'::regclass);


--
-- TOC entry 4053 (class 2604 OID 71101)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY modelaffiliations ALTER COLUMN bridgeid SET DEFAULT nextval('modelaffiliations_bridgeid_seq'::regclass);


--
-- TOC entry 4054 (class 2604 OID 71112)
-- Name: modelid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY models ALTER COLUMN modelid SET DEFAULT nextval('models_modelid_seq'::regclass);


--
-- TOC entry 3995 (class 2604 OID 70186)
-- Name: organizationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN organizationid SET DEFAULT nextval('organizations_organizationid_seq'::regclass);


--
-- TOC entry 3996 (class 2604 OID 70197)
-- Name: personid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY people ALTER COLUMN personid SET DEFAULT nextval('people_personid_seq'::regclass);


--
-- TOC entry 4024 (class 2604 OID 70745)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY personexternalidentifiers ALTER COLUMN bridgeid SET DEFAULT nextval('personexternalidentifiers_bridgeid_seq'::regclass);


--
-- TOC entry 3979 (class 2604 OID 70043)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresultvalueannotations ALTER COLUMN bridgeid SET DEFAULT nextval('pointcoverageresultvalueannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4043 (class 2604 OID 70949)
-- Name: valueid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresultvalues ALTER COLUMN valueid SET DEFAULT nextval('pointcoverageresultvalues_valueid_seq'::regclass);


--
-- TOC entry 3997 (class 2604 OID 70208)
-- Name: processinglevelid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY processinglevels ALTER COLUMN processinglevelid SET DEFAULT nextval('processinglevels_processinglevelid_seq'::regclass);


--
-- TOC entry 3980 (class 2604 OID 70051)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresultvalueannotations ALTER COLUMN bridgeid SET DEFAULT nextval('profileresultvalueannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4044 (class 2604 OID 70965)
-- Name: valueid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresultvalues ALTER COLUMN valueid SET DEFAULT nextval('profileresultvalues_valueid_seq'::regclass);


--
-- TOC entry 4025 (class 2604 OID 70756)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerialexternalidentifiers ALTER COLUMN bridgeid SET DEFAULT nextval('referencematerialexternalidentifiers_bridgeid_seq'::regclass);


--
-- TOC entry 3998 (class 2604 OID 70219)
-- Name: relationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedactions ALTER COLUMN relationid SET DEFAULT nextval('relatedactions_relationid_seq'::regclass);


--
-- TOC entry 4037 (class 2604 OID 70878)
-- Name: relationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedannotations ALTER COLUMN relationid SET DEFAULT nextval('relatedannotations_relationid_seq'::regclass);


--
-- TOC entry 4038 (class 2604 OID 70886)
-- Name: relationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedcitations ALTER COLUMN relationid SET DEFAULT nextval('relatedcitations_relationid_seq'::regclass);


--
-- TOC entry 4039 (class 2604 OID 70894)
-- Name: relationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relateddatasets ALTER COLUMN relationid SET DEFAULT nextval('relateddatasets_relationid_seq'::regclass);


--
-- TOC entry 4014 (class 2604 OID 70648)
-- Name: relationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedequipment ALTER COLUMN relationid SET DEFAULT nextval('relatedequipment_relationid_seq'::regclass);


--
-- TOC entry 4050 (class 2604 OID 71056)
-- Name: relationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedfeatures ALTER COLUMN relationid SET DEFAULT nextval('relatedfeatures_relationid_seq'::regclass);


--
-- TOC entry 4055 (class 2604 OID 71123)
-- Name: relatedid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedmodels ALTER COLUMN relatedid SET DEFAULT nextval('relatedmodels_relatedid_seq'::regclass);


--
-- TOC entry 4040 (class 2604 OID 70902)
-- Name: relationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedresults ALTER COLUMN relationid SET DEFAULT nextval('relatedresults_relationid_seq'::regclass);


--
-- TOC entry 3981 (class 2604 OID 70059)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultannotations ALTER COLUMN bridgeid SET DEFAULT nextval('resultannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4019 (class 2604 OID 70691)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultextensionpropertyvalues ALTER COLUMN bridgeid SET DEFAULT nextval('resultextensionpropertyvalues_bridgeid_seq'::regclass);


--
-- TOC entry 3999 (class 2604 OID 70227)
-- Name: resultid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY results ALTER COLUMN resultid SET DEFAULT nextval('results_resultid_seq'::regclass);


--
-- TOC entry 4004 (class 2604 OID 70537)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultsdataquality ALTER COLUMN bridgeid SET DEFAULT nextval('resultsdataquality_bridgeid_seq'::regclass);


--
-- TOC entry 3982 (class 2604 OID 70067)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatureannotations ALTER COLUMN bridgeid SET DEFAULT nextval('samplingfeatureannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4020 (class 2604 OID 70699)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatureextensionpropertyvalues ALTER COLUMN bridgeid SET DEFAULT nextval('samplingfeatureextensionpropertyvalues_bridgeid_seq'::regclass);


--
-- TOC entry 4026 (class 2604 OID 70767)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatureexternalidentifiers ALTER COLUMN bridgeid SET DEFAULT nextval('samplingfeatureexternalidentifiers_bridgeid_seq'::regclass);


--
-- TOC entry 4000 (class 2604 OID 70238)
-- Name: samplingfeatureid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatures ALTER COLUMN samplingfeatureid SET DEFAULT nextval('samplingfeatures_samplingfeatureid_seq'::regclass);


--
-- TOC entry 3983 (class 2604 OID 70075)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalueannotations ALTER COLUMN bridgeid SET DEFAULT nextval('sectionresultvalueannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4045 (class 2604 OID 70981)
-- Name: valueid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalues ALTER COLUMN valueid SET DEFAULT nextval('sectionresultvalues_valueid_seq'::regclass);


--
-- TOC entry 4056 (class 2604 OID 71131)
-- Name: simulationid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY simulations ALTER COLUMN simulationid SET DEFAULT nextval('simulations_simulationid_seq'::regclass);


--
-- TOC entry 4027 (class 2604 OID 70778)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spatialreferenceexternalidentifiers ALTER COLUMN bridgeid SET DEFAULT nextval('spatialreferenceexternalidentifiers_bridgeid_seq'::regclass);


--
-- TOC entry 4051 (class 2604 OID 71074)
-- Name: spatialreferenceid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spatialreferences ALTER COLUMN spatialreferenceid SET DEFAULT nextval('spatialreferences_spatialreferenceid_seq'::regclass);


--
-- TOC entry 4052 (class 2604 OID 71093)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY specimentaxonomicclassifiers ALTER COLUMN bridgeid SET DEFAULT nextval('specimentaxonomicclassifiers_bridgeid_seq'::regclass);


--
-- TOC entry 3984 (class 2604 OID 70083)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresultvalueannotations ALTER COLUMN bridgeid SET DEFAULT nextval('spectraresultvalueannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4046 (class 2604 OID 70997)
-- Name: valueid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresultvalues ALTER COLUMN valueid SET DEFAULT nextval('spectraresultvalues_valueid_seq'::regclass);


--
-- TOC entry 4028 (class 2604 OID 70789)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY taxonomicclassifierexternalidentifiers ALTER COLUMN bridgeid SET DEFAULT nextval('taxonomicclassifierexternalidentifiers_bridgeid_seq'::regclass);


--
-- TOC entry 3985 (class 2604 OID 70091)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresultvalueannotations ALTER COLUMN bridgeid SET DEFAULT nextval('timeseriesresultvalueannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4047 (class 2604 OID 71013)
-- Name: valueid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresultvalues ALTER COLUMN valueid SET DEFAULT nextval('timeseriesresultvalues_valueid_seq'::regclass);


--
-- TOC entry 3986 (class 2604 OID 70099)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalueannotations ALTER COLUMN bridgeid SET DEFAULT nextval('trajectoryresultvalueannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4048 (class 2604 OID 71029)
-- Name: valueid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalues ALTER COLUMN valueid SET DEFAULT nextval('trajectoryresultvalues_valueid_seq'::regclass);


--
-- TOC entry 3987 (class 2604 OID 70107)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalueannotations ALTER COLUMN bridgeid SET DEFAULT nextval('transectresultvalueannotations_bridgeid_seq'::regclass);


--
-- TOC entry 4049 (class 2604 OID 71045)
-- Name: valueid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalues ALTER COLUMN valueid SET DEFAULT nextval('transectresultvalues_valueid_seq'::regclass);


--
-- TOC entry 4002 (class 2604 OID 70257)
-- Name: unitsid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY units ALTER COLUMN unitsid SET DEFAULT nextval('units_unitsid_seq'::regclass);


--
-- TOC entry 4021 (class 2604 OID 70707)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variableextensionpropertyvalues ALTER COLUMN bridgeid SET DEFAULT nextval('variableextensionpropertyvalues_bridgeid_seq'::regclass);


--
-- TOC entry 4029 (class 2604 OID 70800)
-- Name: bridgeid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variableexternalidentifiers ALTER COLUMN bridgeid SET DEFAULT nextval('variableexternalidentifiers_bridgeid_seq'::regclass);


--
-- TOC entry 4003 (class 2604 OID 70268)
-- Name: variableid; Type: DEFAULT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variables ALTER COLUMN variableid SET DEFAULT nextval('variables_variableid_seq'::regclass);


--
-- TOC entry 4734 (class 0 OID 69989)
-- Dependencies: 211
-- Data for Name: actionannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY actionannotations (bridgeid, actionid, annotationid) FROM stdin;
\.


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 210
-- Name: actionannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('actionannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4764 (class 0 OID 70112)
-- Dependencies: 241
-- Data for Name: actionby; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY actionby (bridgeid, actionid, affiliationid, isactionlead, roledescription) FROM stdin;
1	1	1	f	Loaded data into ODM2 database
\.


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 240
-- Name: actionby_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('actionby_bridgeid_seq', 1, true);


--
-- TOC entry 4883 (class 0 OID 70808)
-- Dependencies: 360
-- Data for Name: actiondirectives; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY actiondirectives (bridgeid, actionid, directiveid) FROM stdin;
\.


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 359
-- Name: actiondirectives_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('actiondirectives_bridgeid_seq', 1, false);


--
-- TOC entry 4852 (class 0 OID 70653)
-- Dependencies: 329
-- Data for Name: actionextensionpropertyvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY actionextensionpropertyvalues (bridgeid, actionid, propertyid, propertyvalue) FROM stdin;
\.


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 328
-- Name: actionextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('actionextensionpropertyvalues_bridgeid_seq', 1, false);


--
-- TOC entry 4766 (class 0 OID 70123)
-- Dependencies: 243
-- Data for Name: actions; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY actions (actionid, actiontypecv, methodid, begindatetime, begindatetimeutcoffset, enddatetime, enddatetimeutcoffset, actiondescription, actionfilelink) FROM stdin;
1	Generic non-observation	1	1983-01-17 00:00:00	-5	1993-08-24 00:00:00	-5	Marchantaria Time Series CAMREX sub-project	\N
336	Observation	2	1983-01-17 00:00:00	-5	1983-01-17 00:00:00	-5	Sample ID 336 - Marchantaria Time Series site visit, measurements and specimen collection	\N
337	Observation	2	1983-01-27 00:00:00	-5	1983-01-27 00:00:00	-5	Sample ID 337 - Marchantaria Time Series site visit, measurements and specimen collection	\N
338	Observation	2	1983-02-08 00:00:00	-5	1983-02-08 00:00:00	-5	Sample ID 338 - Marchantaria Time Series site visit, measurements and specimen collection	\N
339	Observation	2	1983-02-21 00:00:00	-5	1983-02-21 00:00:00	-5	Sample ID 339 - Marchantaria Time Series site visit, measurements and specimen collection	\N
340	Observation	2	1983-03-03 00:00:00	-5	1983-03-03 00:00:00	-5	Sample ID 340 - Marchantaria Time Series site visit, measurements and specimen collection	\N
341	Observation	2	1983-06-07 00:00:00	-5	1983-06-07 00:00:00	-5	Sample ID 341 - Marchantaria Time Series site visit, measurements and specimen collection	\N
342	Observation	2	1983-07-21 00:00:00	-5	1983-07-21 00:00:00	-5	Sample ID 342 - Marchantaria Time Series site visit, measurements and specimen collection	\N
343	Observation	2	1983-08-11 00:00:00	-5	1983-08-11 00:00:00	-5	Sample ID 343 - Marchantaria Time Series site visit, measurements and specimen collection	\N
344	Observation	2	1983-09-10 00:00:00	-5	1983-09-10 00:00:00	-5	Sample ID 344 - Marchantaria Time Series site visit, measurements and specimen collection	\N
345	Observation	2	1983-09-20 00:00:00	-5	1983-09-20 00:00:00	-5	Sample ID 345 - Marchantaria Time Series site visit, measurements and specimen collection	\N
346	Observation	2	1983-09-30 00:00:00	-5	1983-09-30 00:00:00	-5	Sample ID 346 - Marchantaria Time Series site visit, measurements and specimen collection	\N
347	Observation	2	1983-12-16 00:00:00	-5	1983-12-16 00:00:00	-5	Sample ID 347 - Marchantaria Time Series site visit, measurements and specimen collection	\N
348	Observation	2	1984-01-03 00:00:00	-5	1984-01-03 00:00:00	-5	Sample ID 348 - Marchantaria Time Series site visit, measurements and specimen collection	\N
349	Observation	2	1984-01-19 00:00:00	-5	1984-01-19 00:00:00	-5	Sample ID 349 - Marchantaria Time Series site visit, measurements and specimen collection	\N
350	Observation	2	1984-03-20 00:00:00	-5	1984-03-20 00:00:00	-5	Sample ID 350 - Marchantaria Time Series site visit, measurements and specimen collection	\N
351	Observation	2	1984-04-05 00:00:00	-5	1984-04-05 00:00:00	-5	Sample ID 351 - Marchantaria Time Series site visit, measurements and specimen collection	\N
352	Observation	2	1984-09-13 00:00:00	-5	1984-09-13 00:00:00	-5	Sample ID 352 - Marchantaria Time Series site visit, measurements and specimen collection	\N
353	Observation	2	1984-09-27 00:00:00	-5	1984-09-27 00:00:00	-5	Sample ID 353 - Marchantaria Time Series site visit, measurements and specimen collection	\N
354	Observation	2	1984-10-10 00:00:00	-5	1984-10-10 00:00:00	-5	Sample ID 354 - Marchantaria Time Series site visit, measurements and specimen collection	\N
355	Observation	2	1984-10-25 00:00:00	-5	1984-10-25 00:00:00	-5	Sample ID 355 - Marchantaria Time Series site visit, measurements and specimen collection	\N
356	Observation	2	1984-11-07 00:00:00	-5	1984-11-07 00:00:00	-5	Sample ID 356 - Marchantaria Time Series site visit, measurements and specimen collection	\N
357	Observation	2	1984-11-23 00:00:00	-5	1984-11-23 00:00:00	-5	Sample ID 357 - Marchantaria Time Series site visit, measurements and specimen collection	\N
358	Observation	2	1984-12-05 00:00:00	-5	1984-12-05 00:00:00	-5	Sample ID 358 - Marchantaria Time Series site visit, measurements and specimen collection	\N
359	Observation	2	1984-12-18 00:00:00	-5	1984-12-18 00:00:00	-5	Sample ID 359 - Marchantaria Time Series site visit, measurements and specimen collection	\N
360	Observation	2	1985-02-13 00:00:00	-5	1985-02-13 00:00:00	-5	Sample ID 360 - Marchantaria Time Series site visit, measurements and specimen collection	\N
361	Observation	2	1985-03-06 00:00:00	-5	1985-03-06 00:00:00	-5	Sample ID 361 - Marchantaria Time Series site visit, measurements and specimen collection	\N
362	Observation	2	1985-03-20 00:00:00	-5	1985-03-20 00:00:00	-5	Sample ID 362 - Marchantaria Time Series site visit, measurements and specimen collection	\N
363	Observation	2	1985-04-03 00:00:00	-5	1985-04-03 00:00:00	-5	Sample ID 363 - Marchantaria Time Series site visit, measurements and specimen collection	\N
364	Observation	2	1985-04-17 00:00:00	-5	1985-04-17 00:00:00	-5	Sample ID 364 - Marchantaria Time Series site visit, measurements and specimen collection	\N
365	Observation	2	1985-05-02 00:00:00	-5	1985-05-02 00:00:00	-5	Sample ID 365 - Marchantaria Time Series site visit, measurements and specimen collection	\N
366	Observation	2	1985-05-15 00:00:00	-5	1985-05-15 00:00:00	-5	Sample ID 366 - Marchantaria Time Series site visit, measurements and specimen collection	\N
367	Observation	2	1985-05-29 00:00:00	-5	1985-05-29 00:00:00	-5	Sample ID 367 - Marchantaria Time Series site visit, measurements and specimen collection	\N
368	Observation	2	1985-06-12 00:00:00	-5	1985-06-12 00:00:00	-5	Sample ID 368 - Marchantaria Time Series site visit, measurements and specimen collection	\N
369	Observation	2	1985-06-26 00:00:00	-5	1985-06-26 00:00:00	-5	Sample ID 369 - Marchantaria Time Series site visit, measurements and specimen collection	\N
370	Observation	2	1985-07-10 00:00:00	-5	1985-07-10 00:00:00	-5	Sample ID 370 - Marchantaria Time Series site visit, measurements and specimen collection	\N
371	Observation	2	1985-07-21 00:00:00	-5	1985-07-21 00:00:00	-5	Sample ID 371 - Marchantaria Time Series site visit, measurements and specimen collection	\N
372	Observation	2	1985-10-10 00:00:00	-5	1985-10-10 00:00:00	-5	Sample ID 372 - Marchantaria Time Series site visit, measurements and specimen collection	\N
373	Observation	2	1985-10-30 00:00:00	-5	1985-10-30 00:00:00	-5	Sample ID 373 - Marchantaria Time Series site visit, measurements and specimen collection	\N
374	Observation	2	1985-11-13 00:00:00	-5	1985-11-13 00:00:00	-5	Sample ID 374 - Marchantaria Time Series site visit, measurements and specimen collection	\N
375	Observation	2	1985-11-27 00:00:00	-5	1985-11-27 00:00:00	-5	Sample ID 375 - Marchantaria Time Series site visit, measurements and specimen collection	\N
376	Observation	2	1985-12-12 00:00:00	-5	1985-12-12 00:00:00	-5	Sample ID 376 - Marchantaria Time Series site visit, measurements and specimen collection	\N
377	Observation	2	1985-12-26 00:00:00	-5	1985-12-26 00:00:00	-5	Sample ID 377 - Marchantaria Time Series site visit, measurements and specimen collection	\N
378	Observation	2	1986-01-10 00:00:00	-5	1986-01-10 00:00:00	-5	Sample ID 378 - Marchantaria Time Series site visit, measurements and specimen collection	\N
379	Observation	2	1986-01-30 00:00:00	-5	1986-01-30 00:00:00	-5	Sample ID 379 - Marchantaria Time Series site visit, measurements and specimen collection	\N
380	Observation	2	1986-02-14 00:00:00	-5	1986-02-14 00:00:00	-5	Sample ID 380 - Marchantaria Time Series site visit, measurements and specimen collection	\N
381	Observation	2	1986-03-04 00:00:00	-5	1986-03-04 00:00:00	-5	Sample ID 381 - Marchantaria Time Series site visit, measurements and specimen collection	\N
382	Observation	2	1986-03-21 00:00:00	-5	1986-03-21 00:00:00	-5	Sample ID 382 - Marchantaria Time Series site visit, measurements and specimen collection	\N
383	Observation	2	1986-04-12 00:00:00	-5	1986-04-12 00:00:00	-5	Sample ID 383 - Marchantaria Time Series site visit, measurements and specimen collection	\N
384	Observation	2	1986-04-28 00:00:00	-5	1986-04-28 00:00:00	-5	Sample ID 384 - Marchantaria Time Series site visit, measurements and specimen collection	\N
385	Observation	2	1986-05-21 00:00:00	-5	1986-05-21 00:00:00	-5	Sample ID 385 - Marchantaria Time Series site visit, measurements and specimen collection	\N
386	Observation	2	1986-06-17 00:00:00	-5	1986-06-17 00:00:00	-5	Sample ID 386 - Marchantaria Time Series site visit, measurements and specimen collection	\N
387	Observation	2	1986-07-02 00:00:00	-5	1986-07-02 00:00:00	-5	Sample ID 387 - Marchantaria Time Series site visit, measurements and specimen collection	\N
388	Observation	2	1986-08-20 00:00:00	-5	1986-08-20 00:00:00	-5	Sample ID 388 - Marchantaria Time Series site visit, measurements and specimen collection	\N
389	Observation	2	1986-09-12 00:00:00	-5	1986-09-12 00:00:00	-5	Sample ID 389 - Marchantaria Time Series site visit, measurements and specimen collection	\N
390	Observation	2	1986-10-21 00:00:00	-5	1986-10-21 00:00:00	-5	Sample ID 390 - Marchantaria Time Series site visit, measurements and specimen collection	\N
391	Observation	2	1986-11-05 00:00:00	-5	1986-11-05 00:00:00	-5	Sample ID 391 - Marchantaria Time Series site visit, measurements and specimen collection	\N
392	Observation	2	1986-11-19 00:00:00	-5	1986-11-19 00:00:00	-5	Sample ID 392 - Marchantaria Time Series site visit, measurements and specimen collection	\N
411	Observation	2	1987-06-05 00:00:00	-5	1987-06-05 00:00:00	-5	Sample ID 411 - Marchantaria Time Series site visit, measurements and specimen collection	\N
412	Observation	2	1987-06-28 00:00:00	-5	1987-06-28 00:00:00	-5	Sample ID 412 - Marchantaria Time Series site visit, measurements and specimen collection	\N
393	Observation	2	1987-08-25 00:00:00	-5	1987-08-25 00:00:00	-5	Sample ID 393 - Marchantaria Time Series site visit, measurements and specimen collection	\N
394	Observation	2	1987-09-30 00:00:00	-5	1987-09-30 00:00:00	-5	Sample ID 394 - Marchantaria Time Series site visit, measurements and specimen collection	\N
395	Observation	2	1987-12-07 00:00:00	-5	1987-12-07 00:00:00	-5	Sample ID 395 - Marchantaria Time Series site visit, measurements and specimen collection	\N
396	Observation	2	1988-01-08 00:00:00	-5	1988-01-08 00:00:00	-5	Sample ID 396 - Marchantaria Time Series site visit, measurements and specimen collection	\N
397	Observation	2	1988-02-05 00:00:00	-5	1988-02-05 00:00:00	-5	Sample ID 397 - Marchantaria Time Series site visit, measurements and specimen collection	\N
398	Observation	2	1988-04-21 00:00:00	-5	1988-04-21 00:00:00	-5	Sample ID 398 - Marchantaria Time Series site visit, measurements and specimen collection	\N
399	Observation	2	1988-05-20 00:00:00	-5	1988-05-20 00:00:00	-5	Sample ID 399 - Marchantaria Time Series site visit, measurements and specimen collection	\N
400	Observation	2	1988-06-29 00:00:00	-5	1988-06-29 00:00:00	-5	Sample ID 400 - Marchantaria Time Series site visit, measurements and specimen collection	\N
401	Observation	2	1988-07-18 00:00:00	-5	1988-07-18 00:00:00	-5	Sample ID 401 - Marchantaria Time Series site visit, measurements and specimen collection	\N
402	Observation	2	1988-08-28 00:00:00	-5	1988-08-28 00:00:00	-5	Sample ID 402 - Marchantaria Time Series site visit, measurements and specimen collection	\N
403	Observation	2	1988-09-23 00:00:00	-5	1988-09-23 00:00:00	-5	Sample ID 403 - Marchantaria Time Series site visit, measurements and specimen collection	\N
404	Observation	2	1989-02-01 00:00:00	-5	1989-02-01 00:00:00	-5	Sample ID 404 - Marchantaria Time Series site visit, measurements and specimen collection	\N
405	Observation	2	1989-03-12 00:00:00	-5	1989-03-12 00:00:00	-5	Sample ID 405 - Marchantaria Time Series site visit, measurements and specimen collection	\N
406	Observation	2	1989-07-11 00:00:00	-5	1989-07-11 00:00:00	-5	Sample ID 406 - Marchantaria Time Series site visit, measurements and specimen collection	\N
407	Observation	2	1989-08-10 00:00:00	-5	1989-08-10 00:00:00	-5	Sample ID 407 - Marchantaria Time Series site visit, measurements and specimen collection	\N
408	Observation	2	1989-10-17 00:00:00	-5	1989-10-17 00:00:00	-5	Sample ID 408 - Marchantaria Time Series site visit, measurements and specimen collection	\N
409	Observation	2	1989-11-19 00:00:00	-5	1989-11-19 00:00:00	-5	Sample ID 409 - Marchantaria Time Series site visit, measurements and specimen collection	\N
410	Observation	2	1989-12-12 00:00:00	-5	1989-12-12 00:00:00	-5	Sample ID 410 - Marchantaria Time Series site visit, measurements and specimen collection	\N
413	Observation	2	1990-03-13 00:00:00	-5	1990-03-13 00:00:00	-5	Sample ID 413 - Marchantaria Time Series site visit, measurements and specimen collection	\N
414	Observation	2	1990-05-02 00:00:00	-5	1990-05-02 00:00:00	-5	Sample ID 414 - Marchantaria Time Series site visit, measurements and specimen collection	\N
415	Observation	2	1990-06-11 00:00:00	-5	1990-06-11 00:00:00	-5	Sample ID 415 - Marchantaria Time Series site visit, measurements and specimen collection	\N
416	Observation	2	1990-09-14 00:00:00	-5	1990-09-14 00:00:00	-5	Sample ID 416 - Marchantaria Time Series site visit, measurements and specimen collection	\N
417	Observation	2	1990-10-17 00:00:00	-5	1990-10-17 00:00:00	-5	Sample ID 417 - Marchantaria Time Series site visit, measurements and specimen collection	\N
418	Observation	2	1990-12-01 00:00:00	-5	1990-12-01 00:00:00	-5	Sample ID 418 - Marchantaria Time Series site visit, measurements and specimen collection	\N
419	Observation	2	1991-01-15 00:00:00	-5	1991-01-15 00:00:00	-5	Sample ID 419 - Marchantaria Time Series site visit, measurements and specimen collection	\N
420	Observation	2	1991-02-08 00:00:00	-5	1991-02-08 00:00:00	-5	Sample ID 420 - Marchantaria Time Series site visit, measurements and specimen collection	\N
421	Observation	2	1991-03-25 00:00:00	-5	1991-03-25 00:00:00	-5	Sample ID 421 - Marchantaria Time Series site visit, measurements and specimen collection	\N
422	Observation	2	1991-06-28 00:00:00	-5	1991-06-28 00:00:00	-5	Sample ID 422 - Marchantaria Time Series site visit, measurements and specimen collection	\N
423	Observation	2	1991-08-01 00:00:00	-5	1991-08-01 00:00:00	-5	Sample ID 423 - Marchantaria Time Series site visit, measurements and specimen collection	\N
424	Observation	2	1991-10-05 00:00:00	-5	1991-10-05 00:00:00	-5	Sample ID 424 - Marchantaria Time Series site visit, measurements and specimen collection	\N
425	Observation	2	1991-10-29 00:00:00	-5	1991-10-29 00:00:00	-5	Sample ID 425 - Marchantaria Time Series site visit, measurements and specimen collection	\N
426	Observation	2	1991-12-06 00:00:00	-5	1991-12-06 00:00:00	-5	Sample ID 426 - Marchantaria Time Series site visit, measurements and specimen collection	\N
427	Observation	2	1992-01-18 00:00:00	-5	1992-01-18 00:00:00	-5	Sample ID 427 - Marchantaria Time Series site visit, measurements and specimen collection	\N
428	Observation	2	1992-02-22 00:00:00	-5	1992-02-22 00:00:00	-5	Sample ID 428 - Marchantaria Time Series site visit, measurements and specimen collection	\N
429	Observation	2	1992-03-24 00:00:00	-5	1992-03-24 00:00:00	-5	Sample ID 429 - Marchantaria Time Series site visit, measurements and specimen collection	\N
430	Observation	2	1992-04-24 00:00:00	-5	1992-04-24 00:00:00	-5	Sample ID 430 - Marchantaria Time Series site visit, measurements and specimen collection	\N
431	Observation	2	1992-05-14 00:00:00	-5	1992-05-14 00:00:00	-5	Sample ID 431 - Marchantaria Time Series site visit, measurements and specimen collection	\N
432	Observation	2	1992-06-16 00:00:00	-5	1992-06-16 00:00:00	-5	Sample ID 432 - Marchantaria Time Series site visit, measurements and specimen collection	\N
433	Observation	2	1993-03-24 00:00:00	-5	1993-03-24 00:00:00	-5	Sample ID 433 - Marchantaria Time Series site visit, measurements and specimen collection	\N
434	Observation	2	1993-04-17 00:00:00	-5	1993-04-17 00:00:00	-5	Sample ID 434 - Marchantaria Time Series site visit, measurements and specimen collection	\N
435	Observation	2	1993-06-20 00:00:00	-5	1993-06-20 00:00:00	-5	Sample ID 435 - Marchantaria Time Series site visit, measurements and specimen collection	\N
436	Observation	2	1993-08-24 00:00:00	-5	1993-08-24 00:00:00	-5	Sample ID 436 - Marchantaria Time Series site visit, measurements and specimen collection	\N
\.


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 242
-- Name: actions_actionid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('actions_actionid_seq', 1, false);


--
-- TOC entry 4768 (class 0 OID 70134)
-- Dependencies: 245
-- Data for Name: affiliations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY affiliations (affiliationid, personid, organizationid, isprimaryorganizationcontact, affiliationstartdate, affiliationenddate, primaryphone, primaryemail, primaryaddress, personlink) FROM stdin;
1	1	1	f	1993-03-01	\N	\N	emiliom@uw.edu	\N	http://staff.washington.edu/emiliom/
\.


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 244
-- Name: affiliations_affiliationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('affiliations_affiliationid_seq', 1, false);


--
-- TOC entry 4736 (class 0 OID 69997)
-- Dependencies: 213
-- Data for Name: annotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY annotations (annotationid, annotationtypecv, annotationcode, annotationtext, annotationdatetime, annotationutcoffset, annotationlink, annotatorid, citationid) FROM stdin;
\.


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 212
-- Name: annotations_annotationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('annotations_annotationid_seq', 1, false);


--
-- TOC entry 4888 (class 0 OID 70832)
-- Dependencies: 365
-- Data for Name: authorlists; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY authorlists (bridgeid, citationid, personid, authororder) FROM stdin;
1	1	2	1
2	1	3	2
3	1	4	3
4	1	5	4
\.


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 364
-- Name: authorlists_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('authorlists_bridgeid_seq', 4, true);


--
-- TOC entry 4829 (class 0 OID 70540)
-- Dependencies: 306
-- Data for Name: calibrationactions; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY calibrationactions (actionid, calibrationcheckvalue, instrumentoutputvariableid, calibrationequation) FROM stdin;
\.


--
-- TOC entry 4831 (class 0 OID 70547)
-- Dependencies: 308
-- Data for Name: calibrationreferenceequipment; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY calibrationreferenceequipment (bridgeid, actionid, equipmentid) FROM stdin;
\.


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 307
-- Name: calibrationreferenceequipment_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('calibrationreferenceequipment_bridgeid_seq', 1, false);


--
-- TOC entry 4833 (class 0 OID 70555)
-- Dependencies: 310
-- Data for Name: calibrationstandards; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY calibrationstandards (bridgeid, actionid, referencematerialid) FROM stdin;
\.


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 309
-- Name: calibrationstandards_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('calibrationstandards_bridgeid_seq', 1, false);


--
-- TOC entry 4906 (class 0 OID 70910)
-- Dependencies: 383
-- Data for Name: categoricalresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY categoricalresults (resultid, xlocation, xlocationunitsid, ylocation, ylocationunitsid, zlocation, zlocationunitsid, spatialreferenceid, qualitycodecv) FROM stdin;
\.


--
-- TOC entry 4738 (class 0 OID 70008)
-- Dependencies: 215
-- Data for Name: categoricalresultvalueannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY categoricalresultvalueannotations (bridgeid, valueid, annotationid) FROM stdin;
\.


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 214
-- Name: categoricalresultvalueannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('categoricalresultvalueannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4908 (class 0 OID 70917)
-- Dependencies: 385
-- Data for Name: categoricalresultvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY categoricalresultvalues (valueid, resultid, datavalue, valuedatetime, valuedatetimeutcoffset) FROM stdin;
\.


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 384
-- Name: categoricalresultvalues_valueid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('categoricalresultvalues_valueid_seq', 1, false);


--
-- TOC entry 4854 (class 0 OID 70661)
-- Dependencies: 331
-- Data for Name: citationextensionpropertyvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY citationextensionpropertyvalues (bridgeid, citationid, propertyid, propertyvalue) FROM stdin;
\.


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 330
-- Name: citationextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('citationextensionpropertyvalues_bridgeid_seq', 1, false);


--
-- TOC entry 4866 (class 0 OID 70712)
-- Dependencies: 343
-- Data for Name: citationexternalidentifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY citationexternalidentifiers (bridgeid, citationid, externalidentifiersystemid, citationexternalidentifer, citationexternalidentiferuri) FROM stdin;
1	1	1	10.1029/95GB01145	http://dx.doi.org/10.1029/95GB01145
\.


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 342
-- Name: citationexternalidentifiers_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('citationexternalidentifiers_bridgeid_seq', 1, true);


--
-- TOC entry 4890 (class 0 OID 70840)
-- Dependencies: 367
-- Data for Name: citations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY citations (citationid, title, publisher, publicationyear, citationlink) FROM stdin;
1	Seasonal variation in chemical distributions in the Amazon (Solimoes) River: A multiyear time series	Global Biogeochemical Cycles	1995	http://dx.doi.org/10.1029/95GB01145
\.


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 366
-- Name: citations_citationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('citations_citationid_seq', 1, true);


--
-- TOC entry 4794 (class 0 OID 70274)
-- Dependencies: 271
-- Data for Name: cv_actiontype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_actiontype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
estimation	Estimation	The act of creating results by estimation or professional judgement.	Observation	http://vocabulary.odm2.org/actiontype/estimation
dataRetrieval	Data retrieval	The act of retrieving data from a datalogger deployed at a monitoring site.	Equipment	http://vocabulary.odm2.org/actiontype/dataRetrieval
derivation	Derivation	The act of creating results by deriving them from other results.	Observation	http://vocabulary.odm2.org/actiontype/derivation
instrumentRetrieval	Instrument retrieval	The act of recovering an in situ instrument (which made observations) from a sampling feature. This action ends an instrument deployment action.	Equipment	http://vocabulary.odm2.org/actiontype/instrumentRetrieval
cruise	Cruise	A specialized form of an expedition action that involves an ocean-going vessel. Cruise actions are typically parents to other related Actions.	FieldActivity	http://vocabulary.odm2.org/actiontype/cruise
equipmentProgramming	Equipment programming	The act of creating or modifying the data collection program running on a datalogger or other equipment deployed at a monitoring site.	Equipment	http://vocabulary.odm2.org/actiontype/equipmentProgramming
siteVisit	Site visit	A field visit action in which a single site is visited for one or more other possible actions (i.e., specimen collection, equipment maintenance, etc.).  Site visit actions are typically parents to other related actions.	FieldActivity	http://vocabulary.odm2.org/actiontype/siteVisit
simulation	Simulation	The act of calculating results through the use of a simulation model.	Observation	http://vocabulary.odm2.org/actiontype/simulation
specimenAnalysis	Specimen analysis	The analysis of a specimen ex situ using an instrument, typically in a laboratory, for the purpose of measuring properties of that specimen.	Observation	http://vocabulary.odm2.org/actiontype/specimenAnalysis
specimenPreservation	Specimen preservation	The act of preserving a specimen collected in the field to produce a sample suitable for analysis using a particular analytical procedure.	SamplingFeature	http://vocabulary.odm2.org/actiontype/specimenPreservation
equipmentMaintenance	Equipment maintenance	The act of performing regular or periodic upkeep or servicing of field or laboratory equipment. Maintenance may be performed in the field, in a laboratory, or at a factory maintenance center.	Equipment	http://vocabulary.odm2.org/actiontype/equipmentMaintenance
equipmentRetrieval	Equipment retrieval	The act of recovering a piece of equipment that made no observations from a deployment at a sampling feature or other location. For instruments, the more specific term Instrument retrieval should be used.	Equipment	http://vocabulary.odm2.org/actiontype/equipmentRetrieval
genericNonObservation	Generic non-observation	A generic, non-specific action type that does not produce a result.	Other	http://vocabulary.odm2.org/actiontype/genericNonObservation
specimenPreparation	Specimen preparation	The processing of a specimen collected in the field to produce a sample suitable for analysis using a particular analytical procedure.	SamplingFeature	http://vocabulary.odm2.org/actiontype/specimenPreparation
specimenCollection	Specimen collection	The collection of a specimen in the field.	SamplingFeature	http://vocabulary.odm2.org/actiontype/specimenCollection
instrumentCalibration	Instrument calibration	The act of calibrating an instrument either in the field or in a laboratory. The instrument may be an in situ field sensor or a laboratory instrument.  An instrument is the subclass of equipment that is capable of making an observation to produce a result.	Equipment	http://vocabulary.odm2.org/actiontype/instrumentCalibration
expedition	Expedition	A field visit action in which many sites are visited over a continguous period of time, often involving serveral investigators, and typically having a specific purpose.  Expedition actions are typically parents to other related Actions.	FieldActivity	http://vocabulary.odm2.org/actiontype/expedition
fieldActivity	Field activity	A generic, non-specific action type performed in the field at or on a sampling feature.	FieldActivity	http://vocabulary.odm2.org/actiontype/fieldActivity
instrumentDeployment	Instrument deployment	The act of deploying an in situ instrument or sensor that creates an observation result.  This term is a specific form of the Observation actions category of actions, which is the only category of actions that can produce observation results.	Observation	http://vocabulary.odm2.org/actiontype/instrumentDeployment
specimenFractionation	Specimen fractionation	The process of separating a specimen into multiple different fractions or size classes.	SamplingFeature	http://vocabulary.odm2.org/actiontype/specimenFractionation
observation	Observation	The general act of making an observation. This term should be used when a Result is generated but the more specific terms of Instrument deployment or Specimen analysis are not applicable.	Observation	http://vocabulary.odm2.org/actiontype/observation
submersibleLaunch	Submersible launch	The act of deploying a submersible from a vessel or ship.	FieldActivity	http://vocabulary.odm2.org/actiontype/submersibleLaunch
equipmentDeployment	Equipment deployment	The act of placing equipment that will not make observations at or within a sampling feature. Actions involving the deployment of instruments should use the more specific term Instrument deployment.	Equipment	http://vocabulary.odm2.org/actiontype/equipmentDeployment
\.


--
-- TOC entry 4795 (class 0 OID 70282)
-- Dependencies: 272
-- Data for Name: cv_aggregationstatistic; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_aggregationstatistic (term, name, definition, category, sourcevocabularyuri) FROM stdin;
continuous	Continuous	A quantity specified at a particular instant in time measured with sufficient frequency (small spacing) to be interpreted as a continuous record of the phenomenon.	\N	http://vocabulary.odm2.org/aggregationstatistic/continuous
cumulative	Cumulative	The values represent the cumulative value of a variable measured or calculated up to a given instant of time, such as cumulative volume of flow or cumulative precipitation.	\N	http://vocabulary.odm2.org/aggregationstatistic/cumulative
average	Average	The values represent the average over a time interval, such as daily mean discharge or daily mean temperature.	\N	http://vocabulary.odm2.org/aggregationstatistic/average
constantOverInterval	Constant over interval	The values are quantities that can be interpreted as constant for all time, or over the time interval to a subsequent measurement of the same variable at the same site.	\N	http://vocabulary.odm2.org/aggregationstatistic/constantOverInterval
standardDeviation	Standard deviation	The values represent the standard deviation of a set of observations made over a time interval. Standard deviation computed using the unbiased formula SQRT(SUM((Xi-mean)^2)/(n-1)) are preferred. The specific formula used to compute variance can be noted in the methods description.	\N	http://vocabulary.odm2.org/aggregationstatistic/standardDeviation
bestEasySystematicEstimator	Best easy systematic estimator	Best Easy Systematic Estimator BES = (Q1 +2Q2 +Q3)/4. Q1, Q2, and Q3 are first, second, and third quartiles. See Woodcock, F. and Engel, C., 2005: Operational Consensus Forecasts.Weather and Forecasting, 20, 101-111. (http://www.bom.gov.au/nmoc/bulletins/60/article_by_Woodcock_in_Weather_and_Forecasting.pdf) and Wonnacott, T. H., and R. J. Wonnacott, 1972: Introductory Statistics. Wiley, 510 pp.	\N	http://vocabulary.odm2.org/aggregationstatistic/bestEasySystematicEstimator
unknown	Unknown	The aggregation statistic is unknown.	\N	http://vocabulary.odm2.org/aggregationstatistic/unknown
categorical	Categorical	The values are categorical rather than continuous valued quantities.	\N	http://vocabulary.odm2.org/aggregationstatistic/categorical
sporadic	Sporadic	The phenomenon is sampled at a particular instant in time but with a frequency that is too coarse for interpreting the record as continuous. This would be the case when the spacing is significantly larger than the support and the time scale of fluctuation of the phenomenon, such as for example infrequent water quality samples.	\N	http://vocabulary.odm2.org/aggregationstatistic/sporadic
maximum	Maximum	The values are the maximum values occurring at some time during a time interval, such as annual maximum discharge or a daily maximum air temperature.	\N	http://vocabulary.odm2.org/aggregationstatistic/maximum
mode	Mode	The values are the most frequent values occurring at some time during a time interval, such as annual most frequent wind direction.	\N	http://vocabulary.odm2.org/aggregationstatistic/mode
minimum	Minimum	The values are the minimum values occurring at some time during a time interval, such as 7-day low flow for a year or the daily minimum temperature.	\N	http://vocabulary.odm2.org/aggregationstatistic/minimum
variance	Variance	The values represent the variance of a set of observations made over a time interval. Variance computed using the unbiased formula SUM((Xi-mean)^2)/(n-1) are preferred. The specific formula used to compute variance can be noted in the methods description.	\N	http://vocabulary.odm2.org/aggregationstatistic/variance
incremental	Incremental	The values represent the incremental value of a variable over a time interval, such as the incremental volume of flow or incremental precipitation.	\N	http://vocabulary.odm2.org/aggregationstatistic/incremental
median	Median	The values represent the median over a time interval, such as daily median discharge or daily median temperature.	\N	http://vocabulary.odm2.org/aggregationstatistic/median
\.


--
-- TOC entry 4796 (class 0 OID 70290)
-- Dependencies: 273
-- Data for Name: cv_annotationtype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_annotationtype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
siteGroup	Site group	A group of sites such as a transect, station, observatory, monitoring collection, etc.	Group	http://vocabulary.odm2.org/annotationtype/siteGroup
categoricalResultValueAnnotation	Categorical result value annotation	An annotation or data qualifying comment applied to a data value from a categorical Result	Annotation	http://vocabulary.odm2.org/annotationtype/categoricalResultValueAnnotation
timeSeriesResultValueAnnotation	Time series result value annotation	An annotation or data qualifying comment applied to a data value from a time series Result	Annotation	http://vocabulary.odm2.org/annotationtype/timeSeriesResultValueAnnotation
equipmentAnnotation	Equipment annotation	An annotation or qualifying comment about a piece of Equipment	Annotation	http://vocabulary.odm2.org/annotationtype/equipmentAnnotation
methodAnnotation	Method annotation	An annotation or qualifiying comment about a Method	Annotation	http://vocabulary.odm2.org/annotationtype/methodAnnotation
profileResultValueAnnotation	Profile result value annotation	An annotation or data qualifying comment applied to a data value from a profile Result	Annotation	http://vocabulary.odm2.org/annotationtype/profileResultValueAnnotation
organizationAnnotation	Organization annotation	An annotation or qualifiying comment about an Organization	Annotation	http://vocabulary.odm2.org/annotationtype/organizationAnnotation
pointCoverageResultValueAnnotation	Point coverage result value annotation	An annotation or data qualifying comment applied to a data value from a point coverage Result	Annotation	http://vocabulary.odm2.org/annotationtype/pointCoverageResultValueAnnotation
trajectoryResultValueAnnotation	Trajectory result value annotation	An annotation or data qualifying comment applied to a data value from a trajectory Result	Annotation	http://vocabulary.odm2.org/annotationtype/trajectoryResultValueAnnotation
resultAnnotation	Result annotation	An annotation or qualifying comment about a Result	Annotation	http://vocabulary.odm2.org/annotationtype/resultAnnotation
sectionResultValueAnnotation	Section result value annotation	An annotation or data qualifying comment applied to a data value from a section Result	Annotation	http://vocabulary.odm2.org/annotationtype/sectionResultValueAnnotation
personAnnotation	Person annotation	An annotation or qualifying comment about a Person	Annotation	http://vocabulary.odm2.org/annotationtype/personAnnotation
valueGroup	Value group	A group of data values such as those from a profile, analysis, spectra, publication table, dataset, incident reports, etc.	Group	http://vocabulary.odm2.org/annotationtype/valueGroup
spectraResultValueAnnotation	Spectra result value annotation	An annotation or data qualifying comment applied to a data value from a spectra Result	Annotation	http://vocabulary.odm2.org/annotationtype/spectraResultValueAnnotation
specimenGroup	Specimen group	A group of specimens such as an analysis batch, profile, experiment, etc.	Group	http://vocabulary.odm2.org/annotationtype/specimenGroup
actionGroup	Action group	A group of actions such as those that are part of a cruise, expedition, experiment, project, etc.	Group	http://vocabulary.odm2.org/annotationtype/actionGroup
personGroup	Person group	A group of people such as a research team, project team, etc.	Group	http://vocabulary.odm2.org/annotationtype/personGroup
measurementResultValueAnnotation	Measurement result value annotation	An annotation or data qualifying comment applied to a data value from a measurement Result	Annotation	http://vocabulary.odm2.org/annotationtype/measurementResultValueAnnotation
dataSetAnnotation	Dataset annotation	An annotation or qualifying comment about a DataSet	Annotation	http://vocabulary.odm2.org/annotationtype/dataSetAnnotation
actionAnnotation	Action annotation	An annotation or qualifying comment about an Action	Annotation	http://vocabulary.odm2.org/annotationtype/actionAnnotation
siteAnnotation	Site annotation	An annotation or qualifying comment about a Site	Annotation	http://vocabulary.odm2.org/annotationtype/siteAnnotation
specimenAnnotation	Specimen annotation	An annotation or qualifying comment about a Specimen	Annotation	http://vocabulary.odm2.org/annotationtype/specimenAnnotation
transectResultValueAnnotation	Transect result value annotation	An annotation or data qualifying comment applied to a data value from a transect Result	Annotation	http://vocabulary.odm2.org/annotationtype/transectResultValueAnnotation
variableAnnotation	Variable annotation	An annotation or qualifying comment about a Variable	Annotation	http://vocabulary.odm2.org/annotationtype/variableAnnotation
samplingFeatureAnnotation	Sampling feature annotation	An annotation or qualifiying comment about a SamplingFeature	Annotation	http://vocabulary.odm2.org/annotationtype/samplingFeatureAnnotation
\.


--
-- TOC entry 4797 (class 0 OID 70298)
-- Dependencies: 274
-- Data for Name: cv_censorcode; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_censorcode (term, name, definition, category, sourcevocabularyuri) FROM stdin;
lessThan	Less than	The value is known to be less than the recorded value.	\N	http://vocabulary.odm2.org/censorcode/lessThan
notCensored	Not censored	The reported value is not censored.	\N	http://vocabulary.odm2.org/censorcode/notCensored
presentButNotQuantified	Present but not quantified	The anlayte is known to be present, but was not quantified. The recorded value represents the level below which the analyte can no longer be quantified.	\N	http://vocabulary.odm2.org/censorcode/presentButNotQuantified
nonDetect	Non-detect	The value was reported as a non-detect. The recorded value represents the level at which the anlalyte can be detected.	\N	http://vocabulary.odm2.org/censorcode/nonDetect
greaterThan	Greater than	The value is known to be greater than the recorded value.	\N	http://vocabulary.odm2.org/censorcode/greaterThan
\.


--
-- TOC entry 4798 (class 0 OID 70306)
-- Dependencies: 275
-- Data for Name: cv_dataqualitytype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_dataqualitytype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
\.


--
-- TOC entry 4799 (class 0 OID 70314)
-- Dependencies: 276
-- Data for Name: cv_datasettypecv; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_datasettypecv (term, name, definition, category, sourcevocabularyuri) FROM stdin;
specimenTimeSeries	Specimen time series	A dataset that contains multiple measurement Results derived from Specimens. This corresponds to the YAML Observations Data Archive (YODA) specimen time series profile.	\N	http://vocabulary.odm2.org/datasettype/specimenTimeSeries
singleTimeSeries	Single time series	A Dataset that contains a single time series Result. This corresponds to the YAML Observations Data Archive (YODA) singe time series profile.	\N	http://vocabulary.odm2.org/datasettype/singleTimeSeries
multiTimeSeries	Multi-time series	A Dataset that contains multiple time series Results. This corresponds to the YAML Observations Data Archive (YODA) multi-time series profile.	\N	http://vocabulary.odm2.org/datasettype/multiTimeSeries
multiVariableSpecimenMeasurements	Multi-variable specimen measurements	A dataset that contains multiple measurement Results derived from Specimens. This corresponds to the YAML Observations Data Archive (YODA) specimen time series profile.	\N	http://vocabulary.odm2.org/datasettype/multiVariableSpecimenMeasurements
other	Other	A set of Results that has been grouped into a Dataset because they are logically related. The group does not conform to any particular profile.	\N	http://vocabulary.odm2.org/datasettype/other
\.


--
-- TOC entry 4800 (class 0 OID 70322)
-- Dependencies: 277
-- Data for Name: cv_directivetype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_directivetype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
monitoringProgram	Monitoring program	Environmental monitoring that is conducted according to a formal plan that may reflect the overall objectives of an organization, references specific strategies that help deliver the objectives and details of specific projects or tasks, and that contains a listing of what is being monitored, how that monitoring is taking place, and the time-scale over which monitoring should take place.	\N	http://vocabulary.odm2.org/directivetype/monitoringProgram
project	Project	A collaborative enterprise, involving research or design, the is carefully planned to achieve a particular aim.	\N	http://vocabulary.odm2.org/directivetype/project
fieldCampaign	Field campaign	A sampling event conducted in the field during which instruments may be deployed and during which samples may be collected. Field campaigns typically have a focus such as characterizing a particular environment, quantifying a particular phenomenon, answering a particular research question, etc. and may last for hours, days, weeks, months, or even longer.	\N	http://vocabulary.odm2.org/directivetype/fieldCampaign
\.


--
-- TOC entry 4801 (class 0 OID 70330)
-- Dependencies: 278
-- Data for Name: cv_elevationdatum; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_elevationdatum (term, name, definition, category, sourcevocabularyuri) FROM stdin;
NGVD29	NGVD29	National Geodetic Vertical Datum of 1929	\N	http://vocabulary.odm2.org/elevationdatum/NGVD29
MSL	MSL	Mean Sea Level	\N	http://vocabulary.odm2.org/elevationdatum/MSL
NAVD88	NAVD88	North American Vertical Datum of 1988	\N	http://vocabulary.odm2.org/elevationdatum/NAVD88
Unknown	Unknown	The vertical datum is unknown	\N	http://vocabulary.odm2.org/elevationdatum/Unknown
\.


--
-- TOC entry 4802 (class 0 OID 70338)
-- Dependencies: 279
-- Data for Name: cv_equipmenttype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_equipmenttype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
pressureTransducer	Pressure transducer	A sensor that measures pressure, typically of gases or liquids.	Sensor	http://vocabulary.odm2.org/equipmenttype/pressureTransducer
chargeRegulator	Charge regulator	An electroinic device that limits the rate at which electric current is added to or drawn from electric batteries.	Power component	http://vocabulary.odm2.org/equipmenttype/chargeRegulator
fluorometer	Fluorometer	A device used to measure paramters of flouroescence, including its intensity and wavelength distribution of emission spectrum after excitation by a certain spectrum of light.	Sensor	http://vocabulary.odm2.org/equipmenttype/fluorometer
turbidimeter	Turbidimeter	A water quality sensor that monitors light reflected off the particles suspended in water.	Sensor	http://vocabulary.odm2.org/equipmenttype/turbidimeter
enclosure	Enclosure	A cabinet or box within which electrical or electronic equipment are mounted to protect them from the environment.	Platform	http://vocabulary.odm2.org/equipmenttype/enclosure
laboratoryInstrument	Laboratory instrument	Any type of equipment, apparatus or device designed, constructed and refined to use well proven physical principles, relationships or technology to facilitate or enable the pursuit, acquisition, transduction and storage of repeatable, verifiable data, usually consisting of sets numerical measurements made upon otherwise unknown, unproven quantities, properties, phenomena, materials, forces or etc.	Instrument	http://vocabulary.odm2.org/equipmenttype/laboratoryInstrument
measurementTower	Measurement tower	A free standing tower that supports measuring instruments or sensors.	Observation platform	http://vocabulary.odm2.org/equipmenttype/measurementTower
stormBox	Storm box	An enclosure used to protect electronic equipment used for stormwater sampling.	Platform	http://vocabulary.odm2.org/equipmenttype/stormBox
levelStaff	Level staff	A graduate wooden, fiberglass, or aluminum rod used to determine differences in elevation.	Instrument	http://vocabulary.odm2.org/equipmenttype/levelStaff
antenna	Antenna	An electrical device that converts electric power into radio waves and vice versa.	Communications component	http://vocabulary.odm2.org/equipmenttype/antenna
cable	Cable	Two or more wires running side by side and bonded, twisted, or braided together to form a single assembly.	Peripheral component	http://vocabulary.odm2.org/equipmenttype/cable
mast	Mast	A pole that supports sensors, instruments, or measurement peripherals.	Observation platform	http://vocabulary.odm2.org/equipmenttype/mast
sensor	Sensor	A device that detects events or changes in quantities and provides a corresponding output, generally as an electrical or optical signal.	Sensor	http://vocabulary.odm2.org/equipmenttype/sensor
totalStation	Total station	An electronic and optical instrument used in modern surveying and building construction.  A total station is an electronic theodoloite integrated with an electronic distance meter to read slope distances from the instrument to a particular point.	Instrument	http://vocabulary.odm2.org/equipmenttype/totalStation
battery	Battery	A device consisting of one or more electrochemical cells that convert stored chemical energy into electrical energy.	Power component	http://vocabulary.odm2.org/equipmenttype/battery
tripod	Tripod	A portable, three-legged frame used as a platform for supporting the weight and maintaining the stability of some other object. Typically used as a data collection platform to which sensors are attached.	Observation platform	http://vocabulary.odm2.org/equipmenttype/tripod
waterQualitySonde	Water quality sonde	A water quality monitoring instrument having multiple attached sensors.	Sensor	http://vocabulary.odm2.org/equipmenttype/waterQualitySonde
automaticLevel	Automatic level	A survey level that makes use of a compensator that ensures the line of sight remains horizontal once the operator has roughly leveled the instrument.	Instrument	http://vocabulary.odm2.org/equipmenttype/automaticLevel
solarPanel	Solar panel	A photovoltaic module that is electrically connected and mounted on a supporting structure.  Used to generate and supply electricity.	Power component	http://vocabulary.odm2.org/equipmenttype/solarPanel
powerSupply	Power supply	An electronic device that supplies electric energy to an electrical load. The primary function of a power supply is to convert one form of electrical energy to another (e.g., solar to chemical).	Power component	http://vocabulary.odm2.org/equipmenttype/powerSupply
radio	Radio	A device that transfers information via electromagnetic signals through the atmosphere or free space.	Communications component	http://vocabulary.odm2.org/equipmenttype/radio
globalPositioningSystemReceiver	Global positioning system receiver	A device that accurately calculates geographical location by receiving information from Global Positioning System satellites.	Sensor	http://vocabulary.odm2.org/equipmenttype/globalPositioningSystemReceiver
sampler	Sampler	A device used to collect specimens for later ex situ analysis.	Sampling device	http://vocabulary.odm2.org/equipmenttype/sampler
datalogger	Datalogger	An electronic device that records data over time or in relation to location either with a built in instrument or sensor or via external instruments and sensors.	Datalogger	http://vocabulary.odm2.org/equipmenttype/datalogger
\.


--
-- TOC entry 4803 (class 0 OID 70346)
-- Dependencies: 280
-- Data for Name: cv_methodtype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_methodtype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
submersibleLaunch	Submersible launch	A method for launching a submersible from a vessel or ship.	FieldActivity	http://vocabulary.odm2.org/methodtype/submersibleLaunch
equipmentDeployment	Equipment deployment	A method for deploying a piece of equipment that will not make observations at a sampling feature.	Observation	http://vocabulary.odm2.org/methodtype/equipmentDeployment
instrumentCalibration	Instrument calibration	A method for calibrating an instrument either in the field or in the laboratory. 	Equipment	http://vocabulary.odm2.org/methodtype/instrumentCalibration
expedition	Expedition	A method for performing an expedition action.	FieldActivity	http://vocabulary.odm2.org/methodtype/expedition
derivation	Derivation	A method for creating results by deriving them from other results.	Observation	http://vocabulary.odm2.org/methodtype/derivation
specimenFractionation	Specimen fractionation	A method for separating a specimen into multiple different fractions or size classes.	SamplingFeature	http://vocabulary.odm2.org/methodtype/specimenFractionation
instrumentRetrieval	Instrument retrieval	A method for retrieving or recovering an instrument that has been deployed at a smpling feature.	Equipment	http://vocabulary.odm2.org/methodtype/instrumentRetrieval
simulation	Simulation	A method for creating results by running a simulation model.	Observation	http://vocabulary.odm2.org/methodtype/simulation
siteVisit	Site visit	A method for performing a site visit action.	FieldActivity	http://vocabulary.odm2.org/methodtype/siteVisit
specimenPreservation	Specimen preservation	A method for preserving a specimen either in the field or in a laboratory prior to ex situ analysis.	SamplingFeature	http://vocabulary.odm2.org/methodtype/specimenPreservation
genericNonObservation	Generic non-observation	A method for completing a non-specific action that does not produce a result.	Other	http://vocabulary.odm2.org/methodtype/genericNonObservation
unknown	Unknown	The method type is unknown.	Other	http://vocabulary.odm2.org/methodtype/unknown
observation	Observation	A method for creating observation results. This term should be used when a Result is generated but the more specific terms of Instrument deployment or Specimen analysis are not applicable.	Observation	http://vocabulary.odm2.org/methodtype/observation
fieldActivity	Field activity	A method for performing an activity in the field at or on a sampling feature.	FieldActivity	http://vocabulary.odm2.org/methodtype/fieldActivity
cruise	Cruise	A method for performing a cruise action.	FieldActivity	http://vocabulary.odm2.org/methodtype/cruise
equipmentProgramming	Equipment programming	A method for creating or modifying the data collection program running on a datalogger or other equipment deployed at a monitoring site. 	\N	http://vocabulary.odm2.org/methodtype/equipmentProgramming
instrumentDeployment	Instrument deployment	A method for deploying an instrument to make observations at a sampling feature.	Observation	http://vocabulary.odm2.org/methodtype/instrumentDeployment
dataRetrieval	Data retrieval	A method for retrieving data from a datalogger deployed at a monitoring site.	Equipment	http://vocabulary.odm2.org/methodtype/dataRetrieval
specimenCollection	Specimen collection	A method for collecting a specimen for ex situ analysis.	SamplingFeature	http://vocabulary.odm2.org/methodtype/specimenCollection
specimenAnalysis	Specimen analysis	A method for ex situ analysis of a specimen using an instrument, typically in a laboratory, for the purpose of measuring properties of a specimen.	Observation	http://vocabulary.odm2.org/methodtype/specimenAnalysis
equipmentMaintenance	Equipment maintenance	A method for performing periodic upkeep or servicing of field or laboratory equipment. Maintenance may be performed in the field, in a laboratory, or at a factory maintenance center.	Equipment	http://vocabulary.odm2.org/methodtype/equipmentMaintenance
estimation	Estimation	A method for creating results by estimation or professional judgement.	Observation	http://vocabulary.odm2.org/methodtype/estimation
specimenPreparation	Specimen preparation	A method for processing a specimen collected in the field to produce a sample suitable for analysis using a particular analytical procedure.	SamplingFeature	http://vocabulary.odm2.org/methodtype/specimenPreparation
equipmentRetrieval	Equipment retrieval	A method for retrieving equipment from a sampling feature at which or on which it was deployed.	Equipment	http://vocabulary.odm2.org/methodtype/equipmentRetrieval
\.


--
-- TOC entry 4804 (class 0 OID 70354)
-- Dependencies: 281
-- Data for Name: cv_organizationtype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_organizationtype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
center	Center	A place where some function or activity occurs.	\N	http://vocabulary.odm2.org/organizationtype/center
library	Library	An institution that holds books and or other forms of stored information for use by the public or other experts.	\N	http://vocabulary.odm2.org/organizationtype/library
analyticalLaboratory	Analytical laboratory	A laboratory within which ex situ analysis of of environmental samples is performed.	\N	http://vocabulary.odm2.org/organizationtype/analyticalLaboratory
researchOrganization	Research organization	A group of cooperating researchers.	\N	http://vocabulary.odm2.org/organizationtype/researchOrganization
college	College	An institution of higher education.	\N	http://vocabulary.odm2.org/organizationtype/college
museum	Museum	A building or institution dedicated to the acquisition, conservation, study, exhibition, and educational interpretation of objects having scientific, historical, cultural, or artistic value.	\N	http://vocabulary.odm2.org/organizationtype/museum
institute	Institute	An organization founded to promote a cause.	\N	http://vocabulary.odm2.org/organizationtype/institute
publisher	Publisher	An organization that publishes data.	\N	http://vocabulary.odm2.org/organizationtype/publisher
university	University	An institution of higher education.	\N	http://vocabulary.odm2.org/organizationtype/university
governmentAgency	Government agency	A department or other administrative unit of a government.	\N	http://vocabulary.odm2.org/organizationtype/governmentAgency
company	Company	An business entity that provides services.	\N	http://vocabulary.odm2.org/organizationtype/company
studentOrganization	Student organization	A group of students who associate for a particular purpose. 	\N	http://vocabulary.odm2.org/organizationtype/studentOrganization
consortium	Consortium	An association of individuals or organizations for the purpose of engaging in a joint venture.	\N	http://vocabulary.odm2.org/organizationtype/consortium
manufacturer	Manufacturer	A person or company that makes a product.	\N	http://vocabulary.odm2.org/organizationtype/manufacturer
laboratory	Laboratory	A room, building, or institution equipped for scientific research, experimentation, or analysis.	\N	http://vocabulary.odm2.org/organizationtype/laboratory
association	Association	A group of persons associated for a common purpose.	\N	http://vocabulary.odm2.org/organizationtype/association
school	School	An educational institution providing primary or secondary education.	\N	http://vocabulary.odm2.org/organizationtype/school
program	Program	A set of structured activities.	\N	http://vocabulary.odm2.org/organizationtype/program
foundation	Foundation	An institution or organization supported by a donation or legacy appropriation.	\N	http://vocabulary.odm2.org/organizationtype/foundation
department	Department	A subdivision or unit within a university, institution, or agency.	\N	http://vocabulary.odm2.org/organizationtype/department
fundingOrganization	Funding organization	An organization that funds research or creative works.	\N	http://vocabulary.odm2.org/organizationtype/fundingOrganization
researchInstitute	Research institute	An organization founded to conduct research.	\N	http://vocabulary.odm2.org/organizationtype/researchInstitute
vendor	Vendor	A person or company that sells a product.	\N	http://vocabulary.odm2.org/organizationtype/vendor
division	Division	A section of a large company, agency, or organization.	\N	http://vocabulary.odm2.org/organizationtype/division
unknown	Unknown	The organization type is unknown.	\N	http://vocabulary.odm2.org/organizationtype/unknown
researchAgency	Research agency	A department or other administrative unit of a government with the express purpose of conducting research.	\N	http://vocabulary.odm2.org/organizationtype/researchAgency
\.


--
-- TOC entry 4805 (class 0 OID 70362)
-- Dependencies: 282
-- Data for Name: cv_propertydatatype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_propertydatatype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
integer	Integer	An integer data type can hold a whole number, but no fraction. Integers may be either signed (allowing negative values) or unsigned (nonnegative values only). 	\N	http://vocabulary.odm2.org/propertydatatype/integer
string	String	An array of characters including letters, digits, punctuation marks, symbols, etc.	\N	http://vocabulary.odm2.org/propertydatatype/string
boolean	Boolean	A boolean type is typically a logical type that can be either "true" or "false".	\N	http://vocabulary.odm2.org/propertydatatype/boolean
floatingPointNumber	Floading point number	A floating-point number represents a limited-precision rational number that may have a fractional part. 	\N	http://vocabulary.odm2.org/propertydatatype/floatingPointNumber
\.


--
-- TOC entry 4806 (class 0 OID 70370)
-- Dependencies: 283
-- Data for Name: cv_qualitycode; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_qualitycode (term, name, definition, category, sourcevocabularyuri) FROM stdin;
bad	Bad	A quality assessment has been made and enough of the data quality objectives have not been met that the observation has been assessed to be of bad quality.	\N	http://vocabulary.odm2.org/qualitycode/bad
none	None	No data quality assessment has been made.	\N	http://vocabulary.odm2.org/qualitycode/none
unknown	Unknown	The quality of the observation is unknown.	\N	http://vocabulary.odm2.org/qualitycode/unknown
good	Good	A quality assessment has been made and all data quality objectives have been met.	\N	http://vocabulary.odm2.org/qualitycode/good
marginal	Marginal	A quality assessment has been made and one or more data quality objectives has not been met. The observation may be suspect and has been assessed to be of marginal quality.	\N	http://vocabulary.odm2.org/qualitycode/marginal
\.


--
-- TOC entry 4807 (class 0 OID 70378)
-- Dependencies: 284
-- Data for Name: cv_referencematerialmedium; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_referencematerialmedium (term, name, definition, category, sourcevocabularyuri) FROM stdin;
other	Other	Other.	\N	http://vocabulary.odm2.org/referencematerialmedium/other
particulate	Particulate	Reference material consisting of particulates suspended in a paticulate-fluid mixture. Examples include particulates in water or air.	\N	http://vocabulary.odm2.org/referencematerialmedium/particulate
ice	Ice	Reference material consisting of frozen water.	\N	http://vocabulary.odm2.org/referencematerialmedium/ice
liquidAqueous	Liquid aqueous	Reference material consisting of liquid water.	\N	http://vocabulary.odm2.org/referencematerialmedium/liquidAqueous
liquidOrganic	Liquid organic	Reference material consisting of an organic liquid.	\N	http://vocabulary.odm2.org/referencematerialmedium/liquidOrganic
gas	Gas	Reference material consisting of a gas.	\N	http://vocabulary.odm2.org/referencematerialmedium/gas
rock	Rock	Reference material consisting of a naturally occuring solid aggregate of one or more minerals.	\N	http://vocabulary.odm2.org/referencematerialmedium/rock
unknown	Unknown	The reference material medium is unknown.	\N	http://vocabulary.odm2.org/referencematerialmedium/unknown
snow	Snow	Reference material consisting of snow.	\N	http://vocabulary.odm2.org/referencematerialmedium/snow
notApplicable	Not applicable	There is no applicable reference material medium.	\N	http://vocabulary.odm2.org/referencematerialmedium/notApplicable
soil	Soil	Reference material consisting of a specimen collected from soil or sensor emplaced to measure properties of soil. Soil includes the mixture of minerals, organic matter, gasses, liquids, and organisms that make up the upper layer of earth in which plants grow. 	\N	http://vocabulary.odm2.org/referencematerialmedium/soil
mineral	Mineral	Reference material consisting of a mineral.	\N	http://vocabulary.odm2.org/referencematerialmedium/mineral
tissue	Tissue	Reference material consisting of a living organism's tissue.	\N	http://vocabulary.odm2.org/referencematerialmedium/tissue
sediment	Sediment	Reference material consisting of a specimen collected from material broken down by processes of weathering and erosion and subsequently transported by the action of wind, water, or ice, and/or by the force of gravity acting on the particles. Sensors may also be emplaced to measure sediment properties.	\N	http://vocabulary.odm2.org/referencematerialmedium/sediment
organism	Organism	Reference material consisting of a species at organism level.	\N	http://vocabulary.odm2.org/referencematerialmedium/organism
\.


--
-- TOC entry 4808 (class 0 OID 70386)
-- Dependencies: 285
-- Data for Name: cv_relationshiptype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_relationshiptype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
isChildOf	Is child of	Used to indicate that one entity is an immediate child of another entity. For example, this term can be used to express the fact that an instrument deployment Action is the child of a site visit Action.	\N	http://vocabulary.odm2.org/relationshiptype/isChildOf
cites	Cites	Use to indicate a relation to the work that the resource is citing/quoting.	\N	http://vocabulary.odm2.org/relationshiptype/cites
compiles	Compiles	Use to indicate the resource is used for creating another resource or dataset.	\N	http://vocabulary.odm2.org/relationshiptype/compiles
continues	Continues	Use to indicate the resource is a continuation of the work referenced by the related identifier.	\N	http://vocabulary.odm2.org/relationshiptype/continues
documents	Documents	Use to indicate the relation to the work which is documentation.	\N	http://vocabulary.odm2.org/relationshiptype/documents
hasPart	Has part	Use to indicate the resource is a container of another resource.	\N	http://vocabulary.odm2.org/relationshiptype/hasPart
isAttachedTo	Is attached to	Used to indicate that one entity is attached to another. For example this term can be used to express the fact that a piece of equipment is attached to a related piece of equipment.	\N	http://vocabulary.odm2.org/relationshiptype/isAttachedTo
isCitationFor	Is citation for	Used to indicate the relationship between a Citation and the entity for which it is the Citation.	\N	http://vocabulary.odm2.org/relationshiptype/isCitationFor
isCitedBy	Is cited by	Use to indicate the relation to a work that cites/quotes this data.	\N	http://vocabulary.odm2.org/relationshiptype/isCitedBy
isCompiledBy	Is compiled by	Use to indicate the resource or data is compiled/created by using another resource or dataset.	\N	http://vocabulary.odm2.org/relationshiptype/isCompiledBy
isContinuedBy	Is continued by	Use to indicate the resource is continued by the work referenced by the related identifier.	\N	http://vocabulary.odm2.org/relationshiptype/isContinuedBy
isDerivedFrom	Is derived from	Used to indicate the relation to the works from which the resource was derived.	\N	http://vocabulary.odm2.org/relationshiptype/isDerivedFrom
isDocumentedBy	Is documented by	Use to indicate the work is documentation about/explaining the resource referenced by the related identifier.	\N	http://vocabulary.odm2.org/relationshiptype/isDocumentedBy
isIdenticalTo	Is identical to	Used to indicate the relation to a work that is identical to the resource.	\N	http://vocabulary.odm2.org/relationshiptype/isIdenticalTo
isNewVersionOf	Is new version of	Use to indicate the resource is a new edition of an old resource, where the new edition has been modified or updated.	\N	http://vocabulary.odm2.org/relationshiptype/isNewVersionOf
isOriginalFormOf	Is original form of	Use to indicate the relation to the works which are variant or different forms of the resource.	\N	http://vocabulary.odm2.org/relationshiptype/isOriginalFormOf
isPartOf	Is part of	Use to indicate the resource is a portion of another resource.	\N	http://vocabulary.odm2.org/relationshiptype/isPartOf
isPreviousVersionOf	Is previous version of	Use to indicate the resource is a previous edition of a newer resource.	\N	http://vocabulary.odm2.org/relationshiptype/isPreviousVersionOf
isReferencedBy	Is referenced by	Use to indicate the resource is used as a source of information by another resource.	\N	http://vocabulary.odm2.org/relationshiptype/isReferencedBy
isRelatedTo	Is related to	Used to indicate that one entity has a complex relationship with another entity that is not a simple, hierarchical parent-child relationship. For example, this term can be used to express the fact that an instrument cleaning Action is related to an instrument deployment action even though it may be performed as part of a separate site visit.	\N	http://vocabulary.odm2.org/relationshiptype/isRelatedTo
isReviewedBy	Is reviewed by	Used to indicate that the work is reviewed by another resource.	\N	http://vocabulary.odm2.org/relationshiptype/isReviewedBy
isSourceOf	Is source of	Used to indicate the relation to the works that were the source of the resource.	\N	http://vocabulary.odm2.org/relationshiptype/isSourceOf
isSupplementedBy	Is supplemented by	Use to indicate the relation to the work(s) which are supplements of the resource.	\N	http://vocabulary.odm2.org/relationshiptype/isSupplementedBy
isSupplementTo	Is supplement to	Use to indicate the relation to the work to which the resource is a supplement.	\N	http://vocabulary.odm2.org/relationshiptype/isSupplementTo
isVariantFormOf	Is variant form of	Use to indicate the resource is a variant or different form of another resource, e.g. calculated or calibrated form or different packaging.	\N	http://vocabulary.odm2.org/relationshiptype/isVariantFormOf
references	References	Use to indicate the relation to the work which is used as a source of information of the resource.	\N	http://vocabulary.odm2.org/relationshiptype/references
Reviews	Reviews	Used to indicate that the work reviews another resource.	\N	http://vocabulary.odm2.org/relationshiptype/Reviews
wasCollectedAt	Was collected at	Used to indicate that one entity was collected at the location of another entity. For example, thirs term can be used to express the fact that a specimen SamplingFeature was collected at a site SamplingFeature.	\N	http://vocabulary.odm2.org/relationshiptype/wasCollectedAt
\.


--
-- TOC entry 4809 (class 0 OID 70394)
-- Dependencies: 286
-- Data for Name: cv_resulttype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_resulttype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
categoryObservation	Category observation	A single ResultValue for a single Variable, measured on or at a single SamplingFeature, using a single Method.	Measurement	http://vocabulary.odm2.org/resulttype/categoryObservation
transectCoverage	Transect coverage	A series of ResultValues for a single Variable, measured on or at a single SamplingFeature, using a single Method, with specific Units, having a specific ProcessingLevel, but measured over multiple locations along a transect having varying location dimensions (e.g.,  X and/or Y, where X and Y are horizontal coordintes). ValueDateTime may be fixed or controlled.	Coverage	http://vocabulary.odm2.org/resulttype/transectCoverage
countObservation	Count observation	A single ResultValue for a single Variable, counted on or at a single SamplingFeature, using a single Method, and having a specific ProcessingLevel.	Measurement	http://vocabulary.odm2.org/resulttype/countObservation
measurement	Measurement	A single ResultValue for a single Variable, measured on or at a SamplingFeature, using a single Method, with specific Units, and having a specific ProcessingLevel.	Measurement	http://vocabulary.odm2.org/resulttype/measurement
timeSeriesCoverage	Time series coverage	A series of ResultValues for a single Variable, measured on or at a single SamplingFeature of fixed location, using a single Method, with specific Units, having a specific ProcessingLevel, but measured over time.	Coverage	http://vocabulary.odm2.org/resulttype/timeSeriesCoverage
temporalObservation	Temporal observation	A single ResultValue for a single Variable, measured on or at a SamplingFeature, using a single Method, with specific Units, and having a specific ProcessingLevel.	Measurement	http://vocabulary.odm2.org/resulttype/temporalObservation
pointCoverage	Point coverage	A series of ResultValues for a single Variable, measured on or at a single SamplingFeature, using a single Method, with specific Units, having a specific ProcessingLevel, with a fixed ValueDateTime, but measured over varying X,Y locations, where X and Y are horizontal coordinates.	Coverage	http://vocabulary.odm2.org/resulttype/pointCoverage
spectraCoverage	Spectra coverage	A series of ResultValues for a single Variable, measured on or at a single SamplingFeature, using a single Method, with specific Units, having a specific ProcessingLevel, but measured over multiple wavelengths of light. ValueDateTime may be fixed or controlled.	Coverage	http://vocabulary.odm2.org/resulttype/spectraCoverage
truthObservation	Truth observation	A single ResultValue for a single Variable, measured on or at a single SamplingFeature, using a single Method.	Measurement	http://vocabulary.odm2.org/resulttype/truthObservation
sectionCoverage	Section coverage	A series of ResultValues for a single Variable, measured on or at a single SamplingFeature, using a single Method, with specific Units, having a specific ProcessingLevel, but measured over varying X (horizontal) and Z (depth) coordinates. ValueDateTime may be fixed or controlled.	Coverage	http://vocabulary.odm2.org/resulttype/sectionCoverage
profileCoverage	Profile coverage	A series of ResultValues for a single Variable, measured on or at a single SamplingFeature, using a single Method, with specific Units, having a specific ProcessingLevel, but measured over multiple locations along a depth profile with only one varying location dimension (e.g., Z, where Z is depth). ValueDateTime may be fixed or controlled.	Coverage	http://vocabulary.odm2.org/resulttype/profileCoverage
trajectoryCoverage	Trajectory coverage	A series of ResultValues for a single Variable, measured on a single SamplingFeature, using a single Method, with specific Units, having a specific ProcessingLevel, but measured over varying X,Y, Z, and D locations, where X and Y are horizontal coordinates, Z is a vertical coordinate, and D is the distance along the trajectory. ValueDateTime may be fixed (DTS Temperature) or controlled (glider).	Coverage	http://vocabulary.odm2.org/resulttype/trajectoryCoverage
\.


--
-- TOC entry 4810 (class 0 OID 70402)
-- Dependencies: 287
-- Data for Name: cv_sampledmedium; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_sampledmedium (term, name, definition, category, sourcevocabularyuri) FROM stdin;
gas	Gas	Gas phase specimen or sensor emplaced to measure properties of a gas.	\N	http://vocabulary.odm2.org/sampledmedium/gas
liquidAqueous	Liquid aqueous	Specimen collected as liquid water or sensor emplaced to measure properties of water in sampled environment.	\N	http://vocabulary.odm2.org/sampledmedium/liquidAqueous
particulate	Particulate	Specimen collected from particulates suspended in a paticulate-fluid mixture. Examples include particulates in water or air.	\N	http://vocabulary.odm2.org/sampledmedium/particulate
soil	Soil	Specimen collected from soil or sensor emplaced to measure properties of soil. Soil includes the mixture of minerals, organic matter, gasses, liquids, and organisms that make up the upper layer of earth in which plants grow. 	\N	http://vocabulary.odm2.org/sampledmedium/soil
mineral	Mineral	Specimen collected as a mineral.	\N	http://vocabulary.odm2.org/sampledmedium/mineral
ice	Ice	Sample collected as frozen water or sensor emplaced to measure properties of ice.	\N	http://vocabulary.odm2.org/sampledmedium/ice
unknown	Unknown	The sampled medium is unknown.	\N	http://vocabulary.odm2.org/sampledmedium/unknown
tissue	Tissue	Sample of a living organism's tissue or sensor emplaced to measure property of tissue.	\N	http://vocabulary.odm2.org/sampledmedium/tissue
rock	Rock	Specimen collected from a naturally occuring solid aggregate of one or more minerals.	\N	http://vocabulary.odm2.org/sampledmedium/rock
sediment	Sediment	Specimen collected from material broken down by processes of weathering and erosion and subsequently transported by the action of wind, water, or ice, and/or by the force of gravity acting on the particles. Sensors may also be emplaced to measure sediment properties.	\N	http://vocabulary.odm2.org/sampledmedium/sediment
notApplicable	Not applicable	There is no applicable sampled medium.	\N	http://vocabulary.odm2.org/sampledmedium/notApplicable
liquidOrganic	Liquid organic	Specimen collected as an organic liquid.	\N	http://vocabulary.odm2.org/sampledmedium/liquidOrganic
snow	Snow	Observation in, of or sample taken from snow.	\N	http://vocabulary.odm2.org/sampledmedium/snow
organism	Organism	Data collected about a species at organism level.	\N	http://vocabulary.odm2.org/sampledmedium/organism
other	Other	Other.	\N	http://vocabulary.odm2.org/sampledmedium/other
\.


--
-- TOC entry 4811 (class 0 OID 70410)
-- Dependencies: 288
-- Data for Name: cv_samplingfeaturegeotype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_samplingfeaturegeotype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
lineString	Line string	A subclass of a Curve using linear interpolation between points. A Curve is a 1-dimensional geometric object usually stored as a sequence of Points. Represented in 2D coordinates by FeatureGeometry.	2D	http://vocabulary.odm2.org/samplingfeaturegeotype/lineString
point	Point	Topological 0-dimensional geometric primitive representing a position. Represented in 2D coordinates by FeatureGeometry.	2D	http://vocabulary.odm2.org/samplingfeaturegeotype/point
multiPolygon	Multi polygon	A collection of individual polygons, used as a single feature. Represented in 2D coordinates by FeatureGeometry.	2D	http://vocabulary.odm2.org/samplingfeaturegeotype/multiPolygon
multiPoint	Multi point	A collection of individual points, used as a single feature. Represented in 2D coordinates by FeatureGeometry.	2D	http://vocabulary.odm2.org/samplingfeaturegeotype/multiPoint
volume	Volume	A three dimensional space enclosed by some closed boundary.	3D	http://vocabulary.odm2.org/samplingfeaturegeotype/volume
polygon	Polygon	A planar Surface defined by 1 exterior boundary and 0 or more interior boundaries. Each interior boundary defines a hole in the Polygon. Polygons are topologically closed. Polygons are a subclass of Surface that is planar. A Surface is a 2-dimensonal geometric object. Represented in 2D coordinates by FeatureGeometry.	2D	http://vocabulary.odm2.org/samplingfeaturegeotype/polygon
notApplicable	Not applicable	The sampling feature has no applicable geospatial feature type	Non-spatial	http://vocabulary.odm2.org/samplingfeaturegeotype/notApplicable
multiLineString	Multi line string	A collection of individual lines, used as a single feature. Represented in 2D coordinates by FeatureGeometry.	2D	http://vocabulary.odm2.org/samplingfeaturegeotype/multiLineString
\.


--
-- TOC entry 4812 (class 0 OID 70418)
-- Dependencies: 289
-- Data for Name: cv_samplingfeaturetype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_samplingfeaturetype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
trajectory	Trajectory	The path that a moving object follows through space as a function of time. A trajectory can be described by the geometry of the path or as the position of the object over time. 	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/trajectory
excavation	Excavation	An artificially constructed cavity in the earth that is deeper than the soil, larger than a well bore, and substantially open to the atmosphere. The diameter of an excavation is typically similar or larger than the depth. Excavations include building-foundation diggings, roadway cuts, and surface mines.	SamplingSolid	http://vocabulary.odm2.org/samplingfeaturetype/excavation
observationWell	Observation well	A hole or shaft constructed in the earth intended to be used to locate, sample, or develop groundwater, oil, gas, or some other subsurface material. The diameter of a well is typically much smaller than the depth. Wells are also used to artificially recharge groundwater or to pressurize oil and gas production zones. Specific kinds of wells should be specified in the SamplingFeature description. For example, underground waste-disposal wells should be classified as waste injection wells.	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/observationWell
interval	Interval	A discrete segment along a longer path in which an observation or specimen is collected over the distance between the upper and lower bounds of the interval. A Depth Interval is a sub-type of Interval.	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/interval
specimen	Specimen	A physical sample (object or entity) obtained for observations, typically performed ex situ, often in a laboratory.  	Specimen	http://vocabulary.odm2.org/samplingfeaturetype/specimen
fieldArea	Field area	A location at which field experiments or observations of ambient conditions are conducted. A field area may contain many sites and has a geographical footprint that can be represented by a polygon.	SamplingSurface	http://vocabulary.odm2.org/samplingfeaturetype/fieldArea
depthInterval	Depth interval	A discrete segment along a longer vertical path, such as a borehole, soil profile or other depth profile, in which an observation or specimen is collected over the distance between the upper and lower depth limits of the interval. A Depth Interval is a sub-type of Interval.	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/depthInterval
quadrat	Quadrat	A small plot used to isolate a standard unit of area for study of the distribution of an item over a large area.	SamplingSurface	http://vocabulary.odm2.org/samplingfeaturetype/quadrat
weatherStation	Weather station	A facility, either on land or sea, with instruments and equipment for measuring atmospheric conditions to provide information for weather forecasts and to study weather and climate.	SamplingPoint	http://vocabulary.odm2.org/samplingfeaturetype/weatherStation
crossSection	Cross section	The intersection of a body in three-dimensional space with a plane.  Represented as a polygon. 	SamplingSurface	http://vocabulary.odm2.org/samplingfeaturetype/crossSection
shipsTrack	Ships track	A path along which a ship or vessel travels while measuring a phenomena of study.  Represented as a line connecting the ship's consecutive positions on the surface of the earth.	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/shipsTrack
scene	Scene	A two-dimensional visual extent within a physical environment.	SamplingSurface	http://vocabulary.odm2.org/samplingfeaturetype/scene
flightline	Flightline	A path along which an aircraft travels while measuring a phenomena of study.	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/flightline
CTD	CTD	A CTD (Conductivity, Temperature, and Depth) cast is a water column depth profile collected over a specific and relatively short date-time range, that can be considered as a parent specimen.	Specimen	http://vocabulary.odm2.org/samplingfeaturetype/CTD
borehole	Borehole	A narrow shaft bored into the ground, either vertically or horizontally. A borehole includes the hole cavity and walls surrounding that cavity.  	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/borehole
waterQualityStation	Water quality station	A location used to monitor and test the quality of terrestrial bodies of water. Water quality stations may be locations at which physical water samples are collected for ex situ analysis.  Water qulaity stations may also have instruments and equipment for continuous, in situ measurement of water quality variables. 	SamplingPoint	http://vocabulary.odm2.org/samplingfeaturetype/waterQualityStation
traverse	Traverse	A field control network consisting of survey stations placed along a line or path of travel.	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/traverse
streamGage	Stream gage	A location used to monitor and test terrestrial bodies of water. Hydrometric measurements of water level, surface elevation ("stage") and/or volumetric discharge (flow) are generally taken, and observations of biota and water quality may also be made. 	SamplingPoint	http://vocabulary.odm2.org/samplingfeaturetype/streamGage
soilPitSection	Soil pit section	Two-dimensional vertical face of a soil pit that is described and sampled.	SamplingSurface	http://vocabulary.odm2.org/samplingfeaturetype/soilPitSection
profile	Profile	A one-dimensional grid at fixed (x, y, t) coordinates within a four-dimensional (x, y, z, t) coordinate reference system. The grid axis is aligned with the coordinate reference system z-axis. Typically used to characterize or measure phenomena as a function of depth.	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/profile
transect	Transect	A path along which ocurrences of a phenomena of study are counted or measured.	SamplingCurve	http://vocabulary.odm2.org/samplingfeaturetype/transect
site	Site	A facility or location at which observations have been collected. A site may have instruments or equipment installed and may contain multiple other sampling features (e.g., a stream gage, weather station, observation well, etc.). Additionally, many specimen sampling features may be collected at a site. Sites are also often referred to as stations. A site is represented as a point, but it may have a geographical footprint that is not a point. The site coordinates serve as a reference for the site and offsets may be specified from this reference location.	SamplingPoint	http://vocabulary.odm2.org/samplingfeaturetype/site
\.


--
-- TOC entry 4813 (class 0 OID 70426)
-- Dependencies: 290
-- Data for Name: cv_sitetype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_sitetype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
unsaturatedZone	Unsaturated zone	A site equipped to measure conditions in the subsurface deeper than a soil hole, but above the water table or other zone of saturation.	Groundwater Sites	http://vocabulary.odm2.org/sitetype/unsaturatedZone
outcrop	Outcrop	The part of a rock formation that appears at the surface of the surrounding land.	Land Sites	http://vocabulary.odm2.org/sitetype/outcrop
unknown	Unknown	Site type is unknown.	Unknown	http://vocabulary.odm2.org/sitetype/unknown
tunnelShaftMine	Tunnel, shaft, or mine	A constructed subsurface open space large enough to accommodate a human that is not substantially open to the atmosphere and is not a well. The excavation may have been for minerals, transportation, or other purposes. See also: Excavation.	Groundwater Sites	http://vocabulary.odm2.org/sitetype/tunnelShaftMine
networkInfrastructure	Network infrastructure	A site that is primarily associated with monitoring or telemetry network infrastructure. For example a radio repeater or remote radio base station.	infrastructure	http://vocabulary.odm2.org/sitetype/networkInfrastructure
coastal	Coastal	An oceanic site that is located off-shore beyond the tidal mixing zone (estuary) but close enough to the shore that the investigator considers the presence of the coast to be important. Coastal sites typically are within three nautical miles of the shore.	Surface Water Sites	http://vocabulary.odm2.org/sitetype/coastal
wastewaterLandApplication	Wastewater land application	A site where the disposal of waste water on land occurs. Use "waste-injection well" for underground waste-disposal sites.	Land Sites	http://vocabulary.odm2.org/sitetype/wastewaterLandApplication
shore	Shore	The land along the edge of the sea, a lake, or a wide river where the investigator considers the proximity of the water body to be important. Land adjacent to a reservoir, lake, impoundment, or oceanic site type is considered part of the shore when it includes a beach or bank between the high and low water marks.	Land Sites	http://vocabulary.odm2.org/sitetype/shore
estuary	Estuary	A coastal inlet of the sea or ocean; esp. the mouth of a river, where tide water normally mixes with stream water (modified, Webster). Salinity in estuaries typically ranges from 1 to 25 Practical Salinity Units (psu), as compared oceanic values around 35-psu. See also: tidal stream and coastal.	Surface Water Sites	http://vocabulary.odm2.org/sitetype/estuary
stormSewer	Storm sewer	An underground conduit created to convey storm drainage into a stream channel or reservoir. If the sewer also conveys liquid waste products, then the "combined sewer" secondary site type should be used.	Water Infrastructure Sites	http://vocabulary.odm2.org/sitetype/stormSewer
stream	Stream	A body of running water moving under gravity flow in a defined channel. The channel may be entirely natural, or altered by engineering practices through straightening, dredging, and (or) lining. An entirely artificial channel should be qualified with the "canal" or "ditch" secondary site type.	Surface Water Sites	http://vocabulary.odm2.org/sitetype/stream
land	Land	A location on the surface of the earth that is not normally saturated with water. Land sites are appropriate for sampling vegetation, overland flow of water, or measuring land-surface properties such as temperature. (See also: Wetland).	Land Sites	http://vocabulary.odm2.org/sitetype/land
thermoelectricPlant	Thermoelectric plant	A facility that uses water in the generation of electricity from heat. Typically turbine generators are driven by steam. The heat may be caused by various means, including combustion, nuclear reactions, and geothermal processes.	Facility Sites	http://vocabulary.odm2.org/sitetype/thermoelectricPlant
wetland	Wetland	Land where saturation with water is the dominant factor determining the nature of soil development and the types of plant and animal communities living in the soil and on its surface (Cowardin, December 1979). Wetlands are found from the tundra to the tropics and on every continent except Antarctica. Wetlands are areas that are inundated or saturated by surface or groundwater at a frequency and duration sufficient to support, and that under normal circumstances do support, a prevalence of vegetation typically adapted for life in saturated soil conditions. Wetlands generally include swamps, marshes, bogs and similar areas. Wetlands may be forested or unforested, and naturally or artificially created.	Surface Water Sites	http://vocabulary.odm2.org/sitetype/wetland
pavement	Pavement	A surface site where the land surface is covered by a relatively impermeable material, such as concrete or asphalt. Pavement sites are typically part of transportation infrastructure, such as roadways, parking lots, or runways.	Land Sites	http://vocabulary.odm2.org/sitetype/pavement
cistern	Cistern	An artificial, non-pressurized reservoir filled by gravity flow and used for water storage. The reservoir may be located above, at, or below ground level. The water may be supplied from diversion of precipitation, surface, or groundwater sources.	Water Infrastructure Sites	http://vocabulary.odm2.org/sitetype/cistern
aggregateSurfaceWaterUse	Aggregate surface-water-use	An Aggregate Surface-Water Diversion/Return site represents an aggregate of specific sites where surface water is diverted or returned which is defined by a geographic area or some other common characteristic. An aggregate surface-water site type is used when it is not possible or practical to describe the specific sites as diversions, outfalls, or land application sites, or when water-use information is only available for the aggregate. 	Aggregated Use Sites	http://vocabulary.odm2.org/sitetype/aggregateSurfaceWaterUse
lakeReservoirImpoundment	Lake, Reservoir, Impoundment	An inland body of standing fresh or saline water that is generally too deep to permit submerged aquatic vegetation to take root across the entire body (cf: wetland). This site type includes an expanded part of a river, a reservoir behind a dam, and a natural or excavated depression containing a water body without surface-water inlet and/or outlet.	Surface Water Sites	http://vocabulary.odm2.org/sitetype/lakeReservoirImpoundment
playa	Playa	A dried-up, vegetation-free, flat-floored area composed of thin, evenly stratified sheets of fine clay, silt or sand, and represents the bottom part of a shallow, completely closed or undrained desert lake basin in which water accumulates and is quickly evaporated, usually leaving deposits of soluble salts.	Land Sites	http://vocabulary.odm2.org/sitetype/playa
volcanicVent	Volcanic vent	Vent from which volcanic gases escape to the atmosphere. Also known as fumarole.	Geologic Sites	http://vocabulary.odm2.org/sitetype/volcanicVent
wastewaterSewer	Wastewater sewer	An underground conduit created to convey liquid and semisolid domestic, commercial, or industrial waste into a treatment plant, stream, reservoir, or disposal site. If the sewer also conveys storm water, then the "combined sewer" secondary site type should be used.	Water Infrastructure Sites	http://vocabulary.odm2.org/sitetype/wastewaterSewer
sinkhole	Sinkhole	A crater formed when the roof of a cavern collapses; usually found in limestone areas. Surface water and precipitation that enters a sinkhole usually evaporates or infiltrates into the ground, rather than draining into a stream.	Land Sites	http://vocabulary.odm2.org/sitetype/sinkhole
tidalStream	Tidal stream	A stream reach where the flow is influenced by the tide, but where the water chemistry is not normally influenced. A site where ocean water typically mixes with stream water should be coded as an estuary.	Surface Water Sites	http://vocabulary.odm2.org/sitetype/tidalStream
facility	Facility	A non-ambient location where environmental measurements are expected to be strongly influenced by current or previous activities of humans. *Sites identified with a "facility" primary site type must be further classified with one of the applicable secondary site types.	Facility Sites	http://vocabulary.odm2.org/sitetype/facility
hydroelectricPlant	Hydroelectric plant	A facility that generates electric power by converting potential energy of water into kinetic energy. Typically, turbine generators are turned by falling water.	Facility Sites	http://vocabulary.odm2.org/sitetype/hydroelectricPlant
animalWasteLagoon	Animal waste lagoon	A facility for storage and/or biological treatment of wastes from livestock operations. Animal-waste lagoons are earthen structures ranging from pits to large ponds, and contain manure which has been diluted with building washwater, rainfall, and surface runoff. In treatment lagoons, the waste becomes partially liquefied and stabilized by bacterial action before the waste is disposed of on the land and the water is discharged or re-used.	Facility Sites	http://vocabulary.odm2.org/sitetype/animalWasteLagoon
spring	Spring	A location at which the water table intersects the land surface, resulting in a natural flow of groundwater to the surface. Springs may be perennial, intermittent, or ephemeral.	Spring Sites	http://vocabulary.odm2.org/sitetype/spring
waterUseEstablishment	Water-use establishment	A place-of-use (a water using facility that is associated with a specific geographical point location, such as a business or industrial user) that cannot be specified with any other facility secondary type. Water-use place-of-use sites are establishments such as a factory, mill, store, warehouse, farm, ranch, or bank. See also: Aggregate water-use-establishment.	Facility Sites	http://vocabulary.odm2.org/sitetype/waterUseEstablishment
groundwaterDrain	Groundwater drain	An underground pipe or tunnel through which groundwater is artificially diverted to surface water for the purpose of reducing erosion or lowering the water table. A drain is typically open to the atmosphere at the lowest elevation, in contrast to a well which is open at the highest point.	Groundwater Sites	http://vocabulary.odm2.org/sitetype/groundwaterDrain
waterDistributionSystem	Water-distribution system	A site located somewhere on a networked infrastructure that distributes treated or untreated water to multiple domestic, industrial, institutional, and (or) commercial users. May be owned by a municipality or community, a water district, or a private concern.	Water Infrastructure Sites	http://vocabulary.odm2.org/sitetype/waterDistributionSystem
golfCourse	Golf course	A place-of-use, either public or private, where the game of golf is played. A golf course typically uses water for irrigation purposes. Should not be used if the site is a specific hydrologic feature or facility; but can be used especially for the water-use sites.	Facility Sites	http://vocabulary.odm2.org/sitetype/golfCourse
diversion	Diversion	A site where water is withdrawn or diverted from a surface-water body (e.g. the point where the upstream end of a canal intersects a stream, or point where water is withdrawn from a reservoir). Includes sites where water is pumped for use elsewhere.	Surface Water Sites	http://vocabulary.odm2.org/sitetype/diversion
outfall	Outfall	A site where water or wastewater is returned to a surface-water body, e.g. the point where wastewater is returned to a stream. Typically, the discharge end of an effluent pipe.	Facility Sites	http://vocabulary.odm2.org/sitetype/outfall
laboratoryOrSamplePreparationArea	Laboratory or sample-preparation area	A site where some types of quality-control samples are collected, and where equipment and supplies for environmental sampling are prepared. Equipment blank samples are commonly collected at this site type, as are samples of locally produced deionized water. This site type is typically used when the data are either not associated with a unique environmental data-collection site, or where blank water supplies are designated by Center offices with unique station IDs.	Facility Sites	http://vocabulary.odm2.org/sitetype/laboratoryOrSamplePreparationArea
glacier	Glacier	Body of land ice that consists of recrystallized snow accumulated on the surface of the ground and moves slowly downslope (WSP-1541A) over a period of years or centuries. Since glacial sites move, the lat-long precision for these sites is usually coarse.	Glacier Sites	http://vocabulary.odm2.org/sitetype/glacier
aggregateWaterUseEstablishment	Aggregate water-use establishment	An Aggregate Water-Use Establishment represents an aggregate class of water-using establishments or individuals that are associated with a specific geographic location and water-use category, such as all the industrial users located within a county or all self-supplied domestic users in a county. An aggregate water-use establishment site type is used when specific information needed to create sites for the individual facilities or users is not available or when it is not desirable to store the site-specific information in the database. 	Aggregated Use Sites	http://vocabulary.odm2.org/sitetype/aggregateWaterUseEstablishment
waterSupplyTreatmentPlant	Water-supply treatment plant	A facility where water is treated prior to use for consumption or other purpose.	Facility Sites	http://vocabulary.odm2.org/sitetype/waterSupplyTreatmentPlant
composite	Composite	A Composite site represents an aggregation of specific sites defined by a geographic location at which multiple sampling features have been installed. For example, a composite site might consist of a location on a stream where a streamflow gage, weather station, and shallow groundwater well have been installed.	Composite Sites	http://vocabulary.odm2.org/sitetype/composite
septicSystem	Septic system	A site within or in close proximity to a subsurface sewage disposal system that generally consists of: (1) a septic tank where settling of solid material occurs, (2) a distribution system that transfers fluid from the tank to (3) a leaching system that disperses the effluent into the ground.	Water Infrastructure Sites	http://vocabulary.odm2.org/sitetype/septicSystem
combinedSewer	Combined sewer	An underground conduit created to convey storm drainage and waste products into a wastewater-treatment plant, stream, reservoir, or disposal site.	Water Infrastructure Sites	http://vocabulary.odm2.org/sitetype/combinedSewer
ocean	Ocean	Site in the open ocean, gulf, or sea. (See also: Coastal, Estuary, and Tidal stream).	Surface Water Sites	http://vocabulary.odm2.org/sitetype/ocean
cave	Cave	A natural open space within a rock formation large enough to accommodate a human. A cave may have an opening to the outside, is always underground, and sometimes submerged. Caves commonly occur by the dissolution of soluble rocks, generally limestone, but may also be created within the voids of large-rock aggregations, in openings along seismic faults, and in lava formations.	Groundwater Sites	http://vocabulary.odm2.org/sitetype/cave
fieldPastureOrchardOrNursery	Field, Pasture, Orchard, or Nursery	A water-using facility characterized by an area where plants are grown for transplanting, for use as stocks for budding and grafting, or for sale. Irrigation water may or may not be applied.	Facility Sites	http://vocabulary.odm2.org/sitetype/fieldPastureOrchardOrNursery
subsurface	Subsurface	A location below the land surface, but not a well, soil hole, or excavation.	Groundwater Sites	http://vocabulary.odm2.org/sitetype/subsurface
canal	Canal	An artificial watercourse designed for navigation, drainage, or irrigation by connecting two or more bodies of water; it is larger than a ditch.	Surface Water Sites	http://vocabulary.odm2.org/sitetype/canal
landfill	Landfill	A typically dry location on the surface of the land where primarily solid waste products are currently, or previously have been, aggregated and sometimes covered with a veneer of soil. See also: Wastewater disposal and waste-injection well.	Facility Sites	http://vocabulary.odm2.org/sitetype/landfill
wastewaterTreatmentPlant	Wastewater-treatment plant	A facility where wastewater is treated to reduce concentrations of dissolved and (or) suspended materials prior to discharge or reuse.	Facility Sites	http://vocabulary.odm2.org/sitetype/wastewaterTreatmentPlant
atmosphere	Atmosphere	A site established primarily to measure meteorological properties or atmospheric deposition.	Atmospheric Sites	http://vocabulary.odm2.org/sitetype/atmosphere
ditch	Ditch	An excavation artificially dug in the ground, either lined or unlined, for conveying water for drainage or irrigation; it is smaller than a canal.	Surface Water Sites	http://vocabulary.odm2.org/sitetype/ditch
soilHole	Soil hole	A small excavation into soil at the top few meters of earth surface. Soil generally includes some organic matter derived from plants. Soil holes are created to measure soil composition and properties. Sometimes electronic probes are inserted into soil holes to measure physical properties, and (or) the extracted soil is analyzed.	Land Sites	http://vocabulary.odm2.org/sitetype/soilHole
aggregateGroundwaterUse	Aggregate groundwater use	An Aggregate Groundwater Withdrawal/Return site represents an aggregate of specific sites where groundwater is withdrawn or returned which is defined by a geographic area or some other common characteristic. An aggregate groundwater site type is used when it is not possible or practical to describe the specific sites as springs or as any type of well including 'multiple wells', or when water-use information is only available for the aggregate. 	Aggregated Use Sites	http://vocabulary.odm2.org/sitetype/aggregateGroundwaterUse
\.


--
-- TOC entry 4814 (class 0 OID 70434)
-- Dependencies: 291
-- Data for Name: cv_spatialoffsettype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_spatialoffsettype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
depth	Depth	Depth below the earth or water surface. Values are expressed as negative numbers and become more negative in the downward direction.	1D	http://vocabulary.odm2.org/spatialoffsettype/depth
cartesianOffset	Cartesian offset	Offset expressed using cartesian coordinates where X is distance along axis aligned with true north, Y is distace aligned with true east, and Z is distance aligned straight up. Depths are expressed a negative numbers. The origin of the coordinate system is typically defined in the site description. 	3D	http://vocabulary.odm2.org/spatialoffsettype/cartesianOffset
heightDirectional	Height, directional	Height above the earth or water surface along a non-vertical line. The first coordinate is the angle of the ray from north expressed in degrees. The second coordinate is the angle of the ray from horizontal expressed in positive degrees. The distance along the ray is expressed as a positive number that increases with distance along the ray. 	3D	http://vocabulary.odm2.org/spatialoffsettype/heightDirectional
depthInterval	Depth interval	Depth interval below the earth or water surface. The mininum depth value is expressed first and then maximum depth value. Values are expresssed as negative numbers and become more negative in the downward direction.	2D	http://vocabulary.odm2.org/spatialoffsettype/depthInterval
heightInterval	Height interval	Height interval above the earth or water surface. The minimum height value is expressed first and then the maximum height value. Values increase in the upward direction.	2D	http://vocabulary.odm2.org/spatialoffsettype/heightInterval
radialHorizontalOffsetWithHeight	Radial horizontal offset with height	Offset expressed as a distance along a ray that originates from a central point with a third coordinate that indicates the height above the earth or water surface. The angle of the ray is expressed as the first offset coordinate in degrees. The distance along the ray is expressed as the second offset coordinate. The height above the earth or water surface is expressed as the third coordinate.	3D	http://vocabulary.odm2.org/spatialoffsettype/radialHorizontalOffsetWithHeight
radialHorizontalOffsetWithDepth	Radial horizontal offset with depth	Offset expressed as a distance along a ray that originates from a central point with a third coordinate that indicates the depth below the earth or water surface. The angle of the ray is expressed as the first offset coordinate in degrees. The distance along the ray is expressed as the second offset coordinate. The depth below the earth or water surface is expressed as the third coordinate.	3D	http://vocabulary.odm2.org/spatialoffsettype/radialHorizontalOffsetWithDepth
longitudinalInterval	Longitudinal interval	Interval along a horizontal or longitudinal ray. The first coordinate is the angle from north expressed in degrees of the longitudinal array. The second coordinate is the minimum distance along the ray at which the longitudinal interval begins. The third coordinate is the maximium distance along the ray at which the longitudinal interval ends.	3D	http://vocabulary.odm2.org/spatialoffsettype/longitudinalInterval
radialHorizontalOffset	Radial horizontal offset	Offset expressed as a distance along a ray that originates from a central point. The angle of the ray is expressed as the first offset coordinate in degrees. The distance along the ray is expressed as the second offset coordinate.	2D	http://vocabulary.odm2.org/spatialoffsettype/radialHorizontalOffset
height	Height	Height above the earth or water surface. Values are positive and increase in the upward direction.	1D	http://vocabulary.odm2.org/spatialoffsettype/height
depthDirectional	Depth, directional	Depth below the earth or water surface along a non-vertical line. The first coordinate is the angle of the ray from north expressed in degrees. The second coordinate is the angle of the ray from horizontal expressed in negative degrees. The distance along the ray is expressed as a positive number that increases with distance along the ray. 	3D	http://vocabulary.odm2.org/spatialoffsettype/depthDirectional
\.


--
-- TOC entry 4815 (class 0 OID 70442)
-- Dependencies: 292
-- Data for Name: cv_speciation; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_speciation (term, name, definition, category, sourcevocabularyuri) FROM stdin;
P	P	Expressed as phosphorus	\N	http://vocabulary.odm2.org/speciation/P
C16H34	C16H34	Expressed as C16 n-alkane	\N	http://vocabulary.odm2.org/speciation/C16H34
C4Cl6	C4Cl6	Expressed as hexchlorobutadiene	\N	http://vocabulary.odm2.org/speciation/C4Cl6
C15H12	C15H12	Expressed as C15H12, e.g., methylphenanthrene, Methylanthracene	\N	http://vocabulary.odm2.org/speciation/C15H12
CO2	CO2	Expressed as carbon dioxide	\N	http://vocabulary.odm2.org/speciation/CO2
CH4	CH4	Expressed as methane	\N	http://vocabulary.odm2.org/speciation/CH4
Si	Si	Expressed as silicon	\N	http://vocabulary.odm2.org/speciation/Si
pH	pH	Expressed as pH	\N	http://vocabulary.odm2.org/speciation/pH
C2H5Cl	C2H5Cl	Expressed as chloroethane	\N	http://vocabulary.odm2.org/speciation/C2H5Cl
C12H9N	C12H9N	Expressed as carbazole	\N	http://vocabulary.odm2.org/speciation/C12H9N
deltaN15	delta N15	Expressed as nitrogen-15	\N	http://vocabulary.odm2.org/speciation/deltaN15
C18H38	C18H38	Expressed as C18 n-alkane	\N	http://vocabulary.odm2.org/speciation/C18H38
C2Cl4	C2Cl4	Expressed as tetrachloroethylene	\N	http://vocabulary.odm2.org/speciation/C2Cl4
C12H10	C12H10	Expressed as C12H10, e.g., acenaphthene, biphenyl	\N	http://vocabulary.odm2.org/speciation/C12H10
C20H42	C20H42	Expressed as C20 n-alkane	\N	http://vocabulary.odm2.org/speciation/C20H42
C27H56	C27H56	Expressed as C27 n-alkane	\N	http://vocabulary.odm2.org/speciation/C27H56
unknown	Unknown	Speciation is unknown	\N	http://vocabulary.odm2.org/speciation/unknown
SO4	SO4	Expressed as Sulfate	\N	http://vocabulary.odm2.org/speciation/SO4
Ba	Ba	Expressed as barium	\N	http://vocabulary.odm2.org/speciation/Ba
C6H5NO2	C6H5NO2	Expressed as nitrobenzene	\N	http://vocabulary.odm2.org/speciation/C6H5NO2
CHCl3	CHCl3	Expressed as chloroform	\N	http://vocabulary.odm2.org/speciation/CHCl3
HCO3	HCO3	Expressed as hydrogen carbonate	\N	http://vocabulary.odm2.org/speciation/HCO3
C6HCl5O	C6HCl5O	Expressed as pentachlorophenol	\N	http://vocabulary.odm2.org/speciation/C6HCl5O
CH3Hg	CH3Hg	Expressed at methylmercury	\N	http://vocabulary.odm2.org/speciation/CH3Hg
C12H14O4	C12H14O4	Expressed as diethyl phthalate	\N	http://vocabulary.odm2.org/speciation/C12H14O4
Sb	Sb	Expressed as antimony	\N	http://vocabulary.odm2.org/speciation/Sb
C12H8S	C12H8S	Expressed as dibenzothiophene	\N	http://vocabulary.odm2.org/speciation/C12H8S
C20H12	C20H12	Expressed as C20H12, e.g., benzo(b)fluoranthene, benzo(e)pyrene, perylene	\N	http://vocabulary.odm2.org/speciation/C20H12
C2H3Cl3	C2H3Cl3	Expressed as trichloroethane	\N	http://vocabulary.odm2.org/speciation/C2H3Cl3
Cl	Cl	Expressed as chlorine	\N	http://vocabulary.odm2.org/speciation/Cl
C18H18	C18H18	Expressed as retene	\N	http://vocabulary.odm2.org/speciation/C18H18
C2H6	C2H6	Expressed as ethane	\N	http://vocabulary.odm2.org/speciation/C2H6
deltaO18	delta O18	Expressed as oxygen-18	\N	http://vocabulary.odm2.org/speciation/deltaO18
C13H10S	C13H10S	Expressed as methyldibenzothiophene	\N	http://vocabulary.odm2.org/speciation/C13H10S
CN-	CN-	Expressed as cyanide	\N	http://vocabulary.odm2.org/speciation/CN-
CHBr3	CHBr3	Expressed as bromoform	\N	http://vocabulary.odm2.org/speciation/CHBr3
C2Cl6	C2Cl6	Expressed as hexachloroethane	\N	http://vocabulary.odm2.org/speciation/C2Cl6
C17H12	C17H12	Expressed as C17H12, e.g., benzo(a)fluorene, methylfluoranthene, methylpyrene	\N	http://vocabulary.odm2.org/speciation/C17H12
C6H5OH	C6H5OH	Expressed as phenol	\N	http://vocabulary.odm2.org/speciation/C6H5OH
C31H64	C31H64	Expressed as C31 n-alkane	\N	http://vocabulary.odm2.org/speciation/C31H64
C10H7C2H5	C10H7C2H5	Expressed as ethylnaphthalene	\N	http://vocabulary.odm2.org/speciation/C10H7C2H5
C12H8	C12H8	Expressed as acenaphthylene	\N	http://vocabulary.odm2.org/speciation/C12H8
S	S	Expressed as Sulfur	\N	http://vocabulary.odm2.org/speciation/S
C19H40	C19H40	Expressed as C19 n-alkane	\N	http://vocabulary.odm2.org/speciation/C19H40
NO2	NO2	Expressed as nitrite	\N	http://vocabulary.odm2.org/speciation/NO2
C10H10O4	C10H10O4	Expressed as dimethyl terephthalate	\N	http://vocabulary.odm2.org/speciation/C10H10O4
C6H3Cl3	C6H3Cl3	Expressed as trichlorobenzene	\N	http://vocabulary.odm2.org/speciation/C6H3Cl3
C6H4_CH3_2	C6H4(CH3)2	Expressed as xylenes	\N	http://vocabulary.odm2.org/speciation/C6H4_CH3_2
C6H5Cl	C6H5Cl	Expressed as chlorobenzene	\N	http://vocabulary.odm2.org/speciation/C6H5Cl
CHBr2Cl	CHBr2Cl	Expressed as dibromochloromethane	\N	http://vocabulary.odm2.org/speciation/CHBr2Cl
C10H4_CH3_4	C10H4(CH3)4	Expressed as tetramethylnaphthalene	\N	http://vocabulary.odm2.org/speciation/C10H4_CH3_4
Ni	Ni	Expressed as nickel	\N	http://vocabulary.odm2.org/speciation/Ni
C14H10	C14H10	Expressed as phenanthrene	\N	http://vocabulary.odm2.org/speciation/C14H10
O2	O2	Expressed as oxygen (O2)	\N	http://vocabulary.odm2.org/speciation/O2
C17H36	C17H36	Expressed as C17 n-alkane	\N	http://vocabulary.odm2.org/speciation/C17H36
CO3	CO3	Expressed as carbonate	\N	http://vocabulary.odm2.org/speciation/CO3
C22H14	C22H14	Expressed as Dibenz(a,h)anthracene	\N	http://vocabulary.odm2.org/speciation/C22H14
C8H10	C8H10	Expressed as ethylbenzene	\N	http://vocabulary.odm2.org/speciation/C8H10
Ca	Ca	Expressed as calcium	\N	http://vocabulary.odm2.org/speciation/Ca
Na	Na	Expressed as sodium	\N	http://vocabulary.odm2.org/speciation/Na
C6H4Cl2	C6H4Cl2	Expressed as dichlorobenzene	\N	http://vocabulary.odm2.org/speciation/C6H4Cl2
CaCO3	CaCO3	Expressed as calcium carbonate	\N	http://vocabulary.odm2.org/speciation/CaCO3
Zr	Zr	Expressed as zirconium	\N	http://vocabulary.odm2.org/speciation/Zr
C7H6N2O4	C7H6N2O4	Expressed as dinitrotoluene	\N	http://vocabulary.odm2.org/speciation/C7H6N2O4
As	As	Expressed as arsenic	\N	http://vocabulary.odm2.org/speciation/As
C8H8	C8H8	Expressed as styrene	\N	http://vocabulary.odm2.org/speciation/C8H8
Tl	Tl	Expressed as thallium	\N	http://vocabulary.odm2.org/speciation/Tl
C7H8	C7H8	Expressed as Toluene	\N	http://vocabulary.odm2.org/speciation/C7H8
C12H8O	C12H8O	Expressed as dibenzofuran	\N	http://vocabulary.odm2.org/speciation/C12H8O
C14H12	C14H12	Expressed as methylfluorene	\N	http://vocabulary.odm2.org/speciation/C14H12
C10H6_CH3_2	C10H6(CH3)2	Expressed as dimethylnaphthalene	\N	http://vocabulary.odm2.org/speciation/C10H6_CH3_2
C5Cl6	C5Cl6	Expressed as hexachlorocyclopentadiene	\N	http://vocabulary.odm2.org/speciation/C5Cl6
C25H52	C25H52	Expressed as C25 n-alkane	\N	http://vocabulary.odm2.org/speciation/C25H52
Ag	Ag	Expressed as silver	\N	http://vocabulary.odm2.org/speciation/Ag
CHBrCl2	CHBrCl2	Expressed as bromodichloromethane	\N	http://vocabulary.odm2.org/speciation/CHBrCl2
CH3Br	CH3Br	Expressed as bromomethane	\N	http://vocabulary.odm2.org/speciation/CH3Br
Mn	Mn	Expressed as manganese	\N	http://vocabulary.odm2.org/speciation/Mn
K	K	Expressed as potassium	\N	http://vocabulary.odm2.org/speciation/K
C16H10	C16H10	Expressed as C16H10, e.g., fluoranthene, pyrene	\N	http://vocabulary.odm2.org/speciation/C16H10
C21H44	C21H44	Expressed as C21 n-alkane	\N	http://vocabulary.odm2.org/speciation/C21H44
EC	EC	Expressed as electrical conductivity	\N	http://vocabulary.odm2.org/speciation/EC
NO3	NO3	Expressed as nitrate	\N	http://vocabulary.odm2.org/speciation/NO3
PO4	PO4	Expressed as phosphate	\N	http://vocabulary.odm2.org/speciation/PO4
C6H6	C6H6	Expressed as benzene	\N	http://vocabulary.odm2.org/speciation/C6H6
C2H6O2	C2H6O2	Expressed as Ethylene glycol	\N	http://vocabulary.odm2.org/speciation/C2H6O2
Mo	Mo	Expressed as molybdenum	\N	http://vocabulary.odm2.org/speciation/Mo
Br	Br	Expressed as bromine	\N	http://vocabulary.odm2.org/speciation/Br
Re	Re	Expressed as rhenium	\N	http://vocabulary.odm2.org/speciation/Re
C2H4Cl2	C2H4Cl2	Expressed as dichloroethane	\N	http://vocabulary.odm2.org/speciation/C2H4Cl2
C2H2Cl4	C2H2Cl4	Expressed as tetrachloroethane	\N	http://vocabulary.odm2.org/speciation/C2H2Cl4
C23H48	C23H48	Expressed as C23 n-alkane	\N	http://vocabulary.odm2.org/speciation/C23H48
Hg	Hg	Expressed as mercury	\N	http://vocabulary.odm2.org/speciation/Hg
C26H54	C26H54	Expressed as C26 n-alkane	\N	http://vocabulary.odm2.org/speciation/C26H54
Be	Be	Expressed as beryllium	\N	http://vocabulary.odm2.org/speciation/Be
CH2Cl2	CH2Cl2	Expressed as dichloromethane	\N	http://vocabulary.odm2.org/speciation/CH2Cl2
C6Cl6	C6Cl6	Expressed as hexachlorobenzene	\N	http://vocabulary.odm2.org/speciation/C6Cl6
H2O	H2O	Expressed as water	\N	http://vocabulary.odm2.org/speciation/H2O
TA	TA	Expressed as total alkalinity	\N	http://vocabulary.odm2.org/speciation/TA
C2H3Cl	C2H3Cl	Expressed as vinyl chloride	\N	http://vocabulary.odm2.org/speciation/C2H3Cl
C4H8Cl2O	C4H8Cl2O	Expressed as bis(chloroethyl) ether	\N	http://vocabulary.odm2.org/speciation/C4H8Cl2O
C18H12	C18H12	Expressed as C18H12, e.g., benz(a)anthracene, chrysene, triphenylene	\N	http://vocabulary.odm2.org/speciation/C18H12
C19H20O4	C19H20O4	Expressed as benzyl butyl pththalate	\N	http://vocabulary.odm2.org/speciation/C19H20O4
delta2H	delta 2H	Expressed as deuterium	\N	http://vocabulary.odm2.org/speciation/delta2H
NH4	NH4	Expressed as ammonium	\N	http://vocabulary.odm2.org/speciation/NH4
B	B	Expressed as boron	\N	http://vocabulary.odm2.org/speciation/B
C	C	Expressed as carbon	\N	http://vocabulary.odm2.org/speciation/C
Al	Al	Expressed as aluminium	\N	http://vocabulary.odm2.org/speciation/Al
C10H5_CH3_3	C10H5(CH3)3	Expressed as trimethylnaphthalene	\N	http://vocabulary.odm2.org/speciation/C10H5_CH3_3
C10H7CH3	C10H7CH3	Expressed as methylnaphthalene	\N	http://vocabulary.odm2.org/speciation/C10H7CH3
C6H4N2O5	C6H4N2O5	Expressed as dinitrophenol	\N	http://vocabulary.odm2.org/speciation/C6H4N2O5
C16H14	C16H14	Expressed as dimethylphenanthrene	\N	http://vocabulary.odm2.org/speciation/C16H14
CH3Cl	CH3Cl	Expressed as chloromethane	\N	http://vocabulary.odm2.org/speciation/CH3Cl
C29H60	C29H60	Expressed as C29 n-alkane	\N	http://vocabulary.odm2.org/speciation/C29H60
Ra	Ra	Expressed as Radium. Also known as "radium equivalent." The radium equivalent concept allows a single index or number to describe the gamma output from different mixtures of uranium (i.e., radium), thorium, and 40K in a material.	\N	http://vocabulary.odm2.org/speciation/Ra
Th	Th	Expressed as thorium	\N	http://vocabulary.odm2.org/speciation/Th
Se	Se	Expressed as selenium	\N	http://vocabulary.odm2.org/speciation/Se
Co	Co	Expressed as cobalt	\N	http://vocabulary.odm2.org/speciation/Co
Cd	Cd	Expressed as cadmium	\N	http://vocabulary.odm2.org/speciation/Cd
C15H32	C15H32	Expressed as C15 n-alkane	\N	http://vocabulary.odm2.org/speciation/C15H32
C9H14O	C9H14O	Expressed as isophorone	\N	http://vocabulary.odm2.org/speciation/C9H14O
C2HCl3	C2HCl3	Expressed as trichloroethylene	\N	http://vocabulary.odm2.org/speciation/C2HCl3
C28H58	C28H58	Expressed as C28 n-alkane	\N	http://vocabulary.odm2.org/speciation/C28H58
Cu	Cu	Expressed as copper	\N	http://vocabulary.odm2.org/speciation/Cu
Sr	Sr	Expressed as strontium	\N	http://vocabulary.odm2.org/speciation/Sr
SiO2	SiO2	Expressed as silicate	\N	http://vocabulary.odm2.org/speciation/SiO2
C19H14	C19H14	Expressed as methylchrysene	\N	http://vocabulary.odm2.org/speciation/C19H14
C13H10	C13H10	Expressed as fluorene	\N	http://vocabulary.odm2.org/speciation/C13H10
Sn	Sn	Expressed as tin	\N	http://vocabulary.odm2.org/speciation/Sn
V	V	Expressed as vanadium	\N	http://vocabulary.odm2.org/speciation/V
C4H8O	C4H8O	Expressed as butanone	\N	http://vocabulary.odm2.org/speciation/C4H8O
U	U	Expressed as uranium	\N	http://vocabulary.odm2.org/speciation/U
Cr	Cr	Expressed as chromium	\N	http://vocabulary.odm2.org/speciation/Cr
Mg	Mg	Expressed as magnesium	\N	http://vocabulary.odm2.org/speciation/Mg
Fe	Fe	Expressed as iron	\N	http://vocabulary.odm2.org/speciation/Fe
Zn	Zn	Expressed as zinc	\N	http://vocabulary.odm2.org/speciation/Zn
C22H46	C22H46	Expressed as C22 n-alkane	\N	http://vocabulary.odm2.org/speciation/C22H46
C3H6O	C3H6O	Expressed as acetone	\N	http://vocabulary.odm2.org/speciation/C3H6O
Pb	Pb	Expressed as lead	\N	http://vocabulary.odm2.org/speciation/Pb
C10H8	C10H8	Expressed as naphthalene	\N	http://vocabulary.odm2.org/speciation/C10H8
N	N	Expressed as nitrogen	\N	http://vocabulary.odm2.org/speciation/N
C24H50	C24H50	Expressed as C24 n-alkane	\N	http://vocabulary.odm2.org/speciation/C24H50
C6H5NH2	C6H5NH2	Expressed as aniline	\N	http://vocabulary.odm2.org/speciation/C6H5NH2
Ti	Ti	Expressed as titanium	\N	http://vocabulary.odm2.org/speciation/Ti
F	F	Expressed as fluorine	\N	http://vocabulary.odm2.org/speciation/F
notApplicable	Not Applicable	Speciation is not applicable	\N	http://vocabulary.odm2.org/speciation/notApplicable
\.


--
-- TOC entry 4816 (class 0 OID 70450)
-- Dependencies: 293
-- Data for Name: cv_specimenmedium; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_specimenmedium (term, name, definition, category, sourcevocabularyuri) FROM stdin;
unknown	Unknown	The specimen medium is unknown.	\N	http://vocabulary.odm2.org/specimenmedium/unknown
soil	Soil	Specimen collected from soil. Soil includes the mixture of minerals, organic matter, gasses, liquids, and organisms that make up the upper layer of earth in which plants grow. 	\N	http://vocabulary.odm2.org/specimenmedium/soil
notApplicable	Not applicable	There is no applicable specimen medium.	\N	http://vocabulary.odm2.org/specimenmedium/notApplicable
sediment	Sediment	Specimen collected from material broken down by processes of weathering and erosion and subsequently transported by the action of wind, water, or ice, and/or by the force of gravity acting on the particles.	\N	http://vocabulary.odm2.org/specimenmedium/sediment
ice	Ice	Sample collected as frozen water.	\N	http://vocabulary.odm2.org/specimenmedium/ice
liquidAqueous	Liquid aqueous	Specimen collected as liquid water.	\N	http://vocabulary.odm2.org/specimenmedium/liquidAqueous
gas	Gas	Gas phase specimen.	\N	http://vocabulary.odm2.org/specimenmedium/gas
rock	Rock	Specimen collected from a naturally occuring solid aggregate of one or more minerals.	\N	http://vocabulary.odm2.org/specimenmedium/rock
organism	Organism	Specimen of an entire organism.	\N	http://vocabulary.odm2.org/specimenmedium/organism
other	Other	Other.	\N	http://vocabulary.odm2.org/specimenmedium/other
particulate	Particulate	Specimen collected from particulates suspended in a paticulate-fluid mixture. Examples include particulates in water or air.	\N	http://vocabulary.odm2.org/specimenmedium/particulate
liquidOrganic	Liquid organic	Specimen collected as an organic liquid.	\N	http://vocabulary.odm2.org/specimenmedium/liquidOrganic
snow	Snow	Sample collected from snow.	\N	http://vocabulary.odm2.org/specimenmedium/snow
mineral	Mineral	Specimen collected as a mineral.	\N	http://vocabulary.odm2.org/specimenmedium/mineral
tissue	Tissue	Sample of a living organism's tissue.	\N	http://vocabulary.odm2.org/specimenmedium/tissue
\.


--
-- TOC entry 4817 (class 0 OID 70458)
-- Dependencies: 294
-- Data for Name: cv_specimentype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_specimentype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
forestFloorDigestion	Forest floor digestion	Sample that consists of a digestion of forest floor material	\N	http://vocabulary.odm2.org/specimentype/forestFloorDigestion
standardReferenceSpecimen	Standard reference specimen	Standard reference specimen	\N	http://vocabulary.odm2.org/specimentype/standardReferenceSpecimen
automated	Automated	Sample collected using an automated sampler.	\N	http://vocabulary.odm2.org/specimentype/automated
core	Core	Long cylindrical cores	\N	http://vocabulary.odm2.org/specimentype/core
coreSub-Piece	Core sub-piece	Unambiguously mated portion of a larger piece noted for curatorial management of the material.	\N	http://vocabulary.odm2.org/specimentype/coreSub-Piece
cuttings	Cuttings	Loose, coarse, unconsolidated material suspended in drilling fluid.	\N	http://vocabulary.odm2.org/specimentype/cuttings
coreHalfRound	Core half round	Half-cylindrical products of along-axis split of a whole round	\N	http://vocabulary.odm2.org/specimentype/coreHalfRound
coreQuarterRound	Core quarter round	Quarter-cylindrical products of along-axis split of a half round.	\N	http://vocabulary.odm2.org/specimentype/coreQuarterRound
precipitationBulk	Precipitation bulk	Sample from bulk precipitation	\N	http://vocabulary.odm2.org/specimentype/precipitationBulk
thinSection	Thin section	Thin section	\N	http://vocabulary.odm2.org/specimentype/thinSection
grab	Grab	A sample (sometimes mechanically collected) from a deposit or area, not intended to be representative of the deposit or area.	\N	http://vocabulary.odm2.org/specimentype/grab
foliageDigestion	Foliage digestion	Sample that consists of a digestion of plant foliage	\N	http://vocabulary.odm2.org/specimentype/foliageDigestion
rockPowder	Rock powder	A sample created from pulverizing a rock to powder.	\N	http://vocabulary.odm2.org/specimentype/rockPowder
corePiece	Core piece	Material occurring between unambiguous [as curated] breaks in recovery.	\N	http://vocabulary.odm2.org/specimentype/corePiece
coreWholeRound	Core whole round	Cylindrical segments of core or core section material.	\N	http://vocabulary.odm2.org/specimentype/coreWholeRound
dredge	Dredge	A group of rocks collected by dragging a dredge along the seafloor.	\N	http://vocabulary.odm2.org/specimentype/dredge
individualSample	Individual sample	A sample that is an individual unit, including rock hand samples, a biological specimen, or a bottle of fluid.	\N	http://vocabulary.odm2.org/specimentype/individualSample
litterFallDigestion	Litter fall digestion	Sample that consists of a digestion of litter fall	\N	http://vocabulary.odm2.org/specimentype/litterFallDigestion
coreSectionHalf	Core section half	Half-cylindrical products of along-axis split of a section or its component fragments through a selected diameter.	\N	http://vocabulary.odm2.org/specimentype/coreSectionHalf
coreSection	Core section	Arbitrarily cut segments of a "core"	\N	http://vocabulary.odm2.org/specimentype/coreSection
petriDishDryDeposition	Petri dish (dry deposition)	Sample from dry deposition in a petri dish	\N	http://vocabulary.odm2.org/specimentype/petriDishDryDeposition
theSpecimenTypeIsUnknown	The specimen type is unknown	The specimen type is unknown	\N	http://vocabulary.odm2.org/specimentype/theSpecimenTypeIsUnknown
terrestrialSection	Terrestrial section	A sample of a section of the near-surface Earth, generally in the critical zone.	\N	http://vocabulary.odm2.org/specimentype/terrestrialSection
orientedCore	Oriented core	Core that can be positioned on the surface in the same way that it was arranged in the borehole before extraction.	\N	http://vocabulary.odm2.org/specimentype/orientedCore
other	Other	Sample does not fit any of the existing type designations. It is expected that further detailed description of the particular sample be provided.	\N	http://vocabulary.odm2.org/specimentype/other
foliageLeaching	Foliage leaching	Sample that consists of leachate from foliage	\N	http://vocabulary.odm2.org/specimentype/foliageLeaching
\.


--
-- TOC entry 4818 (class 0 OID 70466)
-- Dependencies: 295
-- Data for Name: cv_status; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_status (term, name, definition, category, sourcevocabularyuri) FROM stdin;
planned	Planned	Data collection is planned. Resulting data values do not yet exist, but will eventually.	\N	http://vocabulary.odm2.org/status/planned
complete	Complete	Data collection is complete. No new data values will be added.	\N	http://vocabulary.odm2.org/status/complete
ongoing	Ongoing	Data collection is ongoing.  New data values will be added periodically.	\N	http://vocabulary.odm2.org/status/ongoing
\.


--
-- TOC entry 4819 (class 0 OID 70474)
-- Dependencies: 296
-- Data for Name: cv_taxonomicclassifiertype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_taxonomicclassifiertype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
soilHorizon	Soil horizon	A taxonomy containing terms describing soil horizons.	Soil	http://vocabulary.odm2.org/taxonomicclassifiertype/soilHorizon
chemistry	Chemistry	A taxonomy containing terms associated with chemistry, chemical analysis or processes.	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/chemistry
hydrology	Hydrology	A taxonomy containing terms associated with hydrologic variables or processes.	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/hydrology
climate	Climate	A taxonomy containing terms associated with the climate, weather, or atmospheric processes.	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/climate
geology	Geology	A taxonomy containing terms associated with geology or geological processes.	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/geology
biology	Biology	A taxonomy containing terms associated with biological organisms.	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/biology
instrumentation	Instrumentation	A taxonomy containing terms associated with instrumentation and instrument properties such as battery voltages, data logger temperatures, often useful for diagnosis.	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/instrumentation
soilTexture	Soil texture	A taxonomy containing terms describing soil texture.	Soil	http://vocabulary.odm2.org/taxonomicclassifiertype/soilTexture
soil	Soil	A taxonomy containing terms associated with soil variables or processes	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/soil
rock	Rock	A taxonomy containing terms describing rocks.	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/rock
waterQuality	Water quality	A taxonomy containing terms associated with water quality variables or processes.	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/waterQuality
lithology	Lithology	A taxonomy containing terms associated with lithology.	\N	http://vocabulary.odm2.org/taxonomicclassifiertype/lithology
soilStructure	Soil structure	A taxonomy containing terms describing soil structure.	Soil	http://vocabulary.odm2.org/taxonomicclassifiertype/soilStructure
soilColor	Soil color	A taxonomy containing terms describing soil color.	Soil	http://vocabulary.odm2.org/taxonomicclassifiertype/soilColor
\.


--
-- TOC entry 4820 (class 0 OID 70482)
-- Dependencies: 297
-- Data for Name: cv_unitstype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_unitstype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
arealDensity	Areal density	Areal density	\N	emilio
chargeConcentration	Charge concentration	Charge concentration	\N	emilio
Dimensionless	Dimensionless	Dimensionless	\N	emilio
electricalConductivity	Electrical conductivity	Electrical conductivity	\N	emilio
massConcentration	Mass concentration	Mass concentration	\N	emilio
massFraction	Mass fraction	Mass fraction	\N	emilio
molarConcentration	Molar concentration	Molar concentration	\N	emilio
specificSurfaceArea	Specific surface area	Specific surface area	\N	emilio
temperature	Temperature	Temperature	\N	emilio
molarFraction	Molar fraction	Molar fraction	\N	emilio
time	Time	Time	\N	emilio
\.


--
-- TOC entry 4821 (class 0 OID 70490)
-- Dependencies: 298
-- Data for Name: cv_variablename; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_variablename (term, name, definition, category, sourcevocabularyuri) FROM stdin;
hydrogenSulfide	Hydrogen sulfide	Hydrogen sulfide (H2S)	\N	http://vocabulary.odm2.org/variablename/hydrogenSulfide
1_4_5_Trimethylnaphthalene	1,4,5-Trimethylnaphthalene	1,4,5-Trimethylnaphthalene (C10H5(CH3)3), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_4_5_Trimethylnaphthalene
BOD20	BOD20	20-day Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD20
copperDistributionCoefficient	Copper, distribution coefficient	Ratio of concentrations of copper in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/copperDistributionCoefficient
biphenyl	Biphenyl	Biphenyl ((C6H5)2), a polycyclic aromatic hydrocarbon (PAH), also known as diphenyl or phenylbenzene or 1,1'-biphenyl or lemonene	\N	http://vocabulary.odm2.org/variablename/biphenyl
tableOverrunErrorCount	Table overrun error count	A counter which counts the number of datalogger table overrun errors	\N	http://vocabulary.odm2.org/variablename/tableOverrunErrorCount
n_Alkane_C32	n-alkane, C32	C32 alkane, normal (i.e. straight-chain) isomer, common name: n-Dotriacontane, formula : C32H66, Synonym: dicetyl	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C32
radiationTotalOutgoing	Radiation, total outgoing	Total amount of outgoing radiation from all frequencies	\N	http://vocabulary.odm2.org/variablename/radiationTotalOutgoing
hexachlorobenzene	Hexachlorobenzene	Hexachlorobenzene (C6Cl6)	\N	http://vocabulary.odm2.org/variablename/hexachlorobenzene
nitrogenTotal	Nitrogen, total	Total Nitrogen (NO3+NO2+NH4+NH3+Organic)	\N	http://vocabulary.odm2.org/variablename/nitrogenTotal
suaedaMaritimaCoverage	Suaeda maritima coverage	Areal coverage of the plant Suaeda maritima	\N	http://vocabulary.odm2.org/variablename/suaedaMaritimaCoverage
BOD7Carbonaceous	BOD7, carbonaceous	7-day Carbonaceous Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD7Carbonaceous
benzo_k_fluoranthene	Benzo(k)fluoranthene	Benzo(k)fluoranthene (C20H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/benzo_k_fluoranthene
bromideTotal	Bromide, total	Total Bromide (Br-)	\N	http://vocabulary.odm2.org/variablename/bromideTotal
TDRWaveformRelativeLength	TDR waveform relative length	Time domain reflextometry, apparent length divided by probe length. Square root of dielectric	\N	http://vocabulary.odm2.org/variablename/TDRWaveformRelativeLength
retene	Retene	Retene (C18H18), a polycyclic aromatic hydrocarbon (PAH), also known as methyl isopropyl phenanthrene or 1-methyl-7-isopropyl phenanthrene	\N	http://vocabulary.odm2.org/variablename/retene
temperatureSensor	Temperature, sensor	Temperature, raw data from sensor	\N	http://vocabulary.odm2.org/variablename/temperatureSensor
dieldrin	Dieldrin	Dieldrin (C12H8Cl6O)	\N	http://vocabulary.odm2.org/variablename/dieldrin
oxygenDissolvedTransducerSignal	Oxygen, dissolved, transducer signal	Dissolved oxygen, raw data from sensor	\N	http://vocabulary.odm2.org/variablename/oxygenDissolvedTransducerSignal
cadmiumTotal	Cadmium, total	Total Cadmium (Cd). For chemical terms, "total" indciates an unfiltered sample.	\N	http://vocabulary.odm2.org/variablename/cadmiumTotal
coliformFecal	Coliform, fecal	Fecal Coliform	\N	http://vocabulary.odm2.org/variablename/coliformFecal
chlorophyll_a_Allomer	Chlorophyll a allomer	The phytoplankton pigment Chlorophyll a allomer	\N	http://vocabulary.odm2.org/variablename/chlorophyll_a_Allomer
fluoride	Fluoride	Fluoride (F-)	\N	http://vocabulary.odm2.org/variablename/fluoride
1_2_3_Trimethylbenzene	1,2,3-Trimethylbenzene	1,2,3-Trimethylbenzene (C9H12)	\N	http://vocabulary.odm2.org/variablename/1_2_3_Trimethylbenzene
copperParticulate	Copper, particulate	Particulate copper (Cu) in suspension	\N	http://vocabulary.odm2.org/variablename/copperParticulate
ethane	Ethane	Ethane	\N	http://vocabulary.odm2.org/variablename/ethane
phenanthrene	Phenanthrene	Phenanthrene (C14H10), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/phenanthrene
1_1_Dichloroethane	1,1-Dichloroethane	1,1-Dichloroethane (C2H4Cl2)	\N	http://vocabulary.odm2.org/variablename/1_1_Dichloroethane
triphenylene	Triphenylene	Triphenylene (C18H12)	\N	http://vocabulary.odm2.org/variablename/triphenylene
benzoicAcid	Benzoic acid	Benzoic acid (C7H6O2)	\N	http://vocabulary.odm2.org/variablename/benzoicAcid
2_6_Dichlorophenol	2,6-Dichlorophenol	2,6-Dichlorophenol (C6H4Cl2O)	\N	http://vocabulary.odm2.org/variablename/2_6_Dichlorophenol
chromiumTotal	Chromium, total	Total chromium (Cr). Total indicates was measured on a whole water (unfiltered) sample.	\N	http://vocabulary.odm2.org/variablename/chromiumTotal
uranium_234	Uranium-234	An isotope of uranium in the uranium-238 decay series	\N	http://vocabulary.odm2.org/variablename/uranium_234
ethylTert_ButylEther	Ethyl tert-Butyl Ether	Ethyl tert-Butyl Ether (C6H14O)	\N	http://vocabulary.odm2.org/variablename/ethylTert_ButylEther
cytochromeP450Family1SubfamilyAPolypeptide1DeltaCycleThreshold	Cytochrome P450, family 1, subfamily A, polypeptide 1, delta cycle threshold	Delta cycle threshold for Cytochrome P450, family 1, subfamily A, polypeptide 1 (cyp1a1). Cycle threshold is the PCR cycle number at which the fluorescent signal of the gene being amplified crosses the set threshold. Delta cycle threshold for cyp1a1 is the difference between the cycle threshold (Ct) of cyp1a1 gene expression and the cycle threshold (Ct) for the gene expression of the reference gene (e.g., beta-actin).	\N	http://vocabulary.odm2.org/variablename/cytochromeP450Family1SubfamilyAPolypeptide1DeltaCycleThreshold
fluorine	Fluorine	Fluorine (F2)	\N	http://vocabulary.odm2.org/variablename/fluorine
trans_1_3_Dichloropropene	trans-1,3-Dichloropropene	trans-1,3-Dichloropropene (C3H4Cl2)	\N	http://vocabulary.odm2.org/variablename/trans_1_3_Dichloropropene
cadmiumDistributionCoefficient	Cadmium, distribution coefficient	Ratio of concentrations of cadmium in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/cadmiumDistributionCoefficient
BOD5Carbonaceous	BOD5, carbonaceous	5-day Carbonaceous Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD5Carbonaceous
potassiumTotal	Potassium, total	Total Potassium (K)	\N	http://vocabulary.odm2.org/variablename/potassiumTotal
thalliumParticulate	Thallium, particulate	Particulate thallium (Tl) in suspension	\N	http://vocabulary.odm2.org/variablename/thalliumParticulate
chlorophyll_b	Chlorophyll b	Chlorophyll b	\N	http://vocabulary.odm2.org/variablename/chlorophyll_b
n_AlkaneLongChain	n-alkane, long-chain	long-chain alkanes, normal (i.e. straight chain) isomer (isomer range of alkanes measured should be specified)	\N	http://vocabulary.odm2.org/variablename/n_AlkaneLongChain
radiationTotalIncoming	Radiation, total incoming	Total amount of incoming radiation from all frequencies	\N	http://vocabulary.odm2.org/variablename/radiationTotalIncoming
calciumTotal	Calcium, total	Total Calcium (Ca)	\N	http://vocabulary.odm2.org/variablename/calciumTotal
waterUseRecreation	Water Use, Recreation	Recreational water use, for example golf courses.	\N	http://vocabulary.odm2.org/variablename/waterUseRecreation
bariumDistributionCoefficient	Barium, distribution coefficient	Ratio of concentrations of barium in two phases in equilibrium with each other. Phases must be specified	\N	http://vocabulary.odm2.org/variablename/bariumDistributionCoefficient
limoniumNashiiCoverage	Limonium nashii Coverage	Areal coverage of the plant Limonium nashii	\N	http://vocabulary.odm2.org/variablename/limoniumNashiiCoverage
bulkDensity	Bulk density	The mass of many particles of the material divided by the total volume they occupy. The total volume includes particle volume, inter-particle void volume and internal pore volume.	\N	http://vocabulary.odm2.org/variablename/bulkDensity
sulfateTotal	Sulfate, total	Total Sulfate (SO4)	\N	http://vocabulary.odm2.org/variablename/sulfateTotal
thorium_228	Thorium-228	An isotope of thorium in the thorium-232 decay series	\N	http://vocabulary.odm2.org/variablename/thorium_228
2_4_6_Trichlorophenol	2,4,6-Trichlorophenol	2,4,6-Trichlorophenol (TCP) (C6H2Cl3OH)	\N	http://vocabulary.odm2.org/variablename/2_4_6_Trichlorophenol
latitude	Latitude	Latitude as a variable measurement or observation (Spatial reference to be designated in methods).  This is distinct from the latitude of a site which is a site attribute.	\N	http://vocabulary.odm2.org/variablename/latitude
sedimentRetainedOnSieve	Sediment, retained on sieve	The amount of sediment retained on a sieve in a gradation test	\N	http://vocabulary.odm2.org/variablename/sedimentRetainedOnSieve
absorbance	Absorbance	The amount of radiation absorbed by a material	\N	http://vocabulary.odm2.org/variablename/absorbance
distichlisSpicataCoverage	Distichlis spicata Coverage	Areal coverage of the plant Distichlis spicata	\N	http://vocabulary.odm2.org/variablename/distichlisSpicataCoverage
1_2_4_5_Tetrachlorobenzene	1,2,4,5-tetrachlorobenzene	1,2,4,5-tetrachlorobenzene (C6H2Cl4)	\N	http://vocabulary.odm2.org/variablename/1_2_4_5_Tetrachlorobenzene
slope	Slope	Ratio between two variables in a linear relationship.	\N	http://vocabulary.odm2.org/variablename/slope
batteryVoltage	Battery voltage	The battery voltage of a datalogger or sensing system, often recorded as an indicator of data reliability	\N	http://vocabulary.odm2.org/variablename/batteryVoltage
chlorophyll_a	Chlorophyll a	Chlorophyll a	\N	http://vocabulary.odm2.org/variablename/chlorophyll_a
1_2_4_Trimethylbenzene	1,2,4-Trimethylbenzene	1,2,4-Trimethylbenzene	\N	http://vocabulary.odm2.org/variablename/1_2_4_Trimethylbenzene
fluoranthene	Fluoranthene	Fluoranthene (C16H10), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/fluoranthene
windChill	Wind chill	The effect of wind on the temperature felt on human skin.	\N	http://vocabulary.odm2.org/variablename/windChill
leadDistributionCoefficient	Lead, distribution coefficient	Ratio of concentrations of lead in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/leadDistributionCoefficient
acetone	Acetone	Acetone (C3H6O)	\N	http://vocabulary.odm2.org/variablename/acetone
carbon_14	Carbon-14	A radioactive isotope of carbon which undergoes beta decay	\N	http://vocabulary.odm2.org/variablename/carbon_14
ethoxyresorufin_O_DeethylaseActivity	Ethoxyresorufin O-deethylase, activity	Ethoxyresorufin O-deethylase (EROD) activity	\N	http://vocabulary.odm2.org/variablename/ethoxyresorufin_O_DeethylaseActivity
19_Hexanoyloxyfucoxanthin	19-Hexanoyloxyfucoxanthin	The phytoplankton pigment 19-Hexanoyloxyfucoxanthin	\N	http://vocabulary.odm2.org/variablename/19_Hexanoyloxyfucoxanthin
cesiumDissolved	Cesium, dissolved	Dissolved Cesium (Cs)	\N	http://vocabulary.odm2.org/variablename/cesiumDissolved
carbonParticulateOrganic	Carbon, particulate organic	Particulate organic carbon in suspension	\N	http://vocabulary.odm2.org/variablename/carbonParticulateOrganic
leadDissolved	Lead, dissolved	Dissolved Lead (Pb). For chemical terms, dissolved indicates a filtered sample	\N	http://vocabulary.odm2.org/variablename/leadDissolved
chlorophyll_c1_And_c2	Chlorophyll c1 and c2	Chlorophyll c1 and c2	\N	http://vocabulary.odm2.org/variablename/chlorophyll_c1_And_c2
benz_a_anthracene	Benz(a)anthracene	Benz(a)anthracene (C18H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/benz_a_anthracene
intercept	Intercept	The point at which one of the variables in a function equals 0.	\N	http://vocabulary.odm2.org/variablename/intercept
antimonyDistributionCoefficient	Antimony, distribution coefficient	Ratio of concentrations of antimony in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/antimonyDistributionCoefficient
diadinoxanthin	Diadinoxanthin	The phytoplankton pigment Diadinoxanthin	\N	http://vocabulary.odm2.org/variablename/diadinoxanthin
momentumFlux	Momentum flux	Momentum flux	\N	http://vocabulary.odm2.org/variablename/momentumFlux
n_Alkane_C16	n-alkane, C16	C16 alkane, normal (i.e. straight-chain) isomer, common name: n-Hexadecane, formula: C16H34. Synonym: cetane	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C16
2_3_6_Trimethylnaphthalene	2,3,6-Trimethylnaphthalene	2,3,6-Trimethylnaphthalene (C10H5(CH3)3), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/2_3_6_Trimethylnaphthalene
silverDissolved	Silver, dissolved	Dissolved silver (Ag). For chemical terms, dissolved indicates a filtered sample.	\N	http://vocabulary.odm2.org/variablename/silverDissolved
n_Alkane_C31	n-alkane, C31	C31 alkane,normal (i.e. straight-chain) isomer, common name: n-Hentriacontane, formula : C31H64, Synonym: untriacontane	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C31
delta_13COfCO2	delta-13C of CO2	Isotope 13C of carbon dioxide	\N	http://vocabulary.odm2.org/variablename/delta_13COfCO2
methylfluoranthene	Methylfluoranthene	Methylfluoranthene (C17H12)	\N	http://vocabulary.odm2.org/variablename/methylfluoranthene
benzylAlcohol	Benzyl alcohol	Benzyl alcohol (C7H8O)	\N	http://vocabulary.odm2.org/variablename/benzylAlcohol
phosphorusOrthophosphate	Phosphorus, orthophosphate	Orthophosphate Phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusOrthophosphate
delta_13COfCH4	delta-13C of CH4	Isotope 13C of methane	\N	http://vocabulary.odm2.org/variablename/delta_13COfCH4
salicorniaVirginicaCoverage	Salicornia virginica coverage	Areal coverage of the plant Salicornia virginica	\N	http://vocabulary.odm2.org/variablename/salicorniaVirginicaCoverage
BOD20Carbonaceous	BOD20, carbonaceous	20-day Carbonaceous Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD20Carbonaceous
radiationNet	Radiation, net	Net Radiation	\N	http://vocabulary.odm2.org/variablename/radiationNet
methaneDissolved	Methane, dissolved	Dissolved Methane (CH4)	\N	http://vocabulary.odm2.org/variablename/methaneDissolved
chromium_VI	Chromium (VI)	Hexavalent Chromium	\N	http://vocabulary.odm2.org/variablename/chromium_VI
tetrachloroethene	Tetrachloroethene	Tetrachloroethene (C2Cl4)	\N	http://vocabulary.odm2.org/variablename/tetrachloroethene
2_Methylanthracene	2-Methylanthracene	2-Methylanthracene (C15H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/2_Methylanthracene
ethyne	Ethyne	Ethyne (C2H2)	\N	http://vocabulary.odm2.org/variablename/ethyne
volumetricWaterContent	Volumetric water content	Volume of liquid water relative to bulk volume. Used for example to quantify soil moisture	\N	http://vocabulary.odm2.org/variablename/volumetricWaterContent
carbonate	Carbonate	Carbonate ion (CO3-2) concentration	\N	http://vocabulary.odm2.org/variablename/carbonate
zeaxanthin	Zeaxanthin	The phytoplankton pigment Zeaxanthin	\N	http://vocabulary.odm2.org/variablename/zeaxanthin
benzo_g_h_i_perylene	Benzo(g,h,i)perylene	Benzo(g,h,i)perylene (C22H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/benzo_g_h_i_perylene
propane	Propane	Propane	\N	http://vocabulary.odm2.org/variablename/propane
liverMass	Liver, mass	Mass of the sample of liver tissue used for analyses	\N	http://vocabulary.odm2.org/variablename/liverMass
lightAttenuationCoefficient	Light attenuation coefficient	Light attenuation coefficient	\N	http://vocabulary.odm2.org/variablename/lightAttenuationCoefficient
triethyleneGlycol	Triethylene glycol	Triethylene glycol (C6H14O4)	\N	http://vocabulary.odm2.org/variablename/triethyleneGlycol
2_Butanone_MEK	2-Butanone (MEK)	2-Butanone (MEK) (C4H8O)	\N	http://vocabulary.odm2.org/variablename/2_Butanone_MEK
4_Methyldibenzothiophene	4-Methyldibenzothiophene	4-Methyldibenzothiophene (C13H10S), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/4_Methyldibenzothiophene
cobalt_60	Cobalt-60	A synthetic radioactive isotope of cobalt with a half-life of 5.27 years.	\N	http://vocabulary.odm2.org/variablename/cobalt_60
ethanol	Ethanol	Ethanol (C2H6O)	\N	http://vocabulary.odm2.org/variablename/ethanol
bromodichloromethane	Bromodichloromethane	Bromodichloromethane (CHBrCl2)	\N	http://vocabulary.odm2.org/variablename/bromodichloromethane
hardnessCalcium	Hardness, Calcium	Hardness of calcium	\N	http://vocabulary.odm2.org/variablename/hardnessCalcium
aceticAcid	Acetic Acid	Acetic Acid (C2H4O2)	\N	http://vocabulary.odm2.org/variablename/aceticAcid
zirconDissolved	Zircon, dissolved	Dissolved Zircon (Zr)	\N	http://vocabulary.odm2.org/variablename/zirconDissolved
1_8_Dimethylnaphthalene	1,8-Dimethylnaphthalene	1,8-Dimethylnaphthalene (C10H6(CH3)2), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_8_Dimethylnaphthalene
aroclor_1260	Aroclor-1260	Aroclor-1260 (C12H3Cl7), a PCB mixture	\N	http://vocabulary.odm2.org/variablename/aroclor_1260
acetate	Acetate	Acetate	\N	http://vocabulary.odm2.org/variablename/acetate
2_Chloronaphthalene	2-Chloronaphthalene	2-Chloronaphthalene (C10H7Cl)	\N	http://vocabulary.odm2.org/variablename/2_Chloronaphthalene
solidsVolatileSuspended	Solids, volatile suspended	Volatile Suspended Solids	\N	http://vocabulary.odm2.org/variablename/solidsVolatileSuspended
hexachloroethane	Hexachloroethane	Hexachloroethane (C2Cl6)	\N	http://vocabulary.odm2.org/variablename/hexachloroethane
snowDepth	Snow depth	Snow depth	\N	http://vocabulary.odm2.org/variablename/snowDepth
delta_18OOfH2O	delta-18O of H2O	Isotope 18O of water	\N	http://vocabulary.odm2.org/variablename/delta_18OOfH2O
temperature	Temperature	Temperature	\N	http://vocabulary.odm2.org/variablename/temperature
nitrogen_NH3	Nitrogen, NH3	Free Ammonia (NH3)	\N	http://vocabulary.odm2.org/variablename/nitrogen_NH3
wellFlowRate	Well flow rate	Flow rate from well while pumping	\N	http://vocabulary.odm2.org/variablename/wellFlowRate
bulkElectricalConductivity	Bulk electrical conductivity	Bulk electrical conductivity of a medium measured using a sensor such as time domain reflectometry (TDR), as a raw sensor response in the measurement of a quantity like soil moisture.	\N	http://vocabulary.odm2.org/variablename/bulkElectricalConductivity
thorium	Thorium	Thorium (Th)	\N	http://vocabulary.odm2.org/variablename/thorium
longitude	Longitude	Longitude as a variable measurement or observation (Spatial reference to be designated in methods). This is distinct from the longitude of a site which is a site attribute.	\N	http://vocabulary.odm2.org/variablename/longitude
radiationTotalShortwave	Radiation, total shortwave	Total Shortwave Radiation	\N	http://vocabulary.odm2.org/variablename/radiationTotalShortwave
vanadiumParticulate	Vanadium, particulate	Particulate vanadium (V) in suspension	\N	http://vocabulary.odm2.org/variablename/vanadiumParticulate
BOD1	BOD1	1-day Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD1
windStress	Wind stress	Drag or trangential force per unit area exerted on a surface by the adjacent layer of moving air	\N	http://vocabulary.odm2.org/variablename/windStress
titanium	Titanium	Titanium (Ti)	\N	http://vocabulary.odm2.org/variablename/titanium
heliumDissolved	Helium, dissolved	Dissolved Helium (He)	\N	http://vocabulary.odm2.org/variablename/heliumDissolved
1_3_Dichlorobenzene	1,3-Dichlorobenzene	1,3-Dichlorobenzene (C6H4Cl2)	\N	http://vocabulary.odm2.org/variablename/1_3_Dichlorobenzene
relativeHumidity	Relative humidity	Relative humidity	\N	http://vocabulary.odm2.org/variablename/relativeHumidity
bromomethane_MethylBromide	Bromomethane (Methyl bromide)	Bromomethane (Methyl bromide) (CH3Br)	\N	http://vocabulary.odm2.org/variablename/bromomethane_MethylBromide
wellheadPressure	Wellhead pressure	The pressure exerted by the fluid at the wellhead or casinghead after the well has been shut off for a period of time, typically 24 hours	\N	http://vocabulary.odm2.org/variablename/wellheadPressure
carbonSuspendedInorganic	Carbon, suspended inorganic	Suspended Inorganic Carbon	\N	http://vocabulary.odm2.org/variablename/carbonSuspendedInorganic
transpiration	Transpiration	Transpiration	\N	http://vocabulary.odm2.org/variablename/transpiration
radon_222	Radon-222	An isotope of radon	\N	http://vocabulary.odm2.org/variablename/radon_222
endrinKetone	Endrin Ketone	Endrin Ketone (C12H9Cl5O)	\N	http://vocabulary.odm2.org/variablename/endrinKetone
dibenz_a_h_anthracene	Dibenz(a,h)anthracene	Dibenz(a,h)anthracene (C22H14), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/dibenz_a_h_anthracene
phosphorusDissolvedOrganic	Phosphorus, dissolved organic	Dissolved organic phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusDissolvedOrganic
acidityExchange	Acidity, exchange	The total amount of the Cation Exchange Capacity (CEC) of a soil that is due to H+ and Al3+ ions. It is a proportion of the total acidity and it is dependent on the type of soil and the percentage of the CEC that is composed of exchangeable bases (Ca2+, Mg2+, K+).	\N	http://vocabulary.odm2.org/variablename/acidityExchange
bodyLength	Body length	Length of the body of an organism	\N	http://vocabulary.odm2.org/variablename/bodyLength
chlorophyll_a_UncorrectedForPheophytin	Chlorophyll a, uncorrected for pheophytin	Chlorophyll a uncorrected for pheophytin	\N	http://vocabulary.odm2.org/variablename/chlorophyll_a_UncorrectedForPheophytin
methylchrysene	Methylchrysene	Methylchrysene (C19H14)	\N	http://vocabulary.odm2.org/variablename/methylchrysene
visibility	Visibility	Visibility	\N	http://vocabulary.odm2.org/variablename/visibility
1_2_Dichloropropane	1,2-Dichloropropane	1,2-Dichloropropane (C3H6Cl2)	\N	http://vocabulary.odm2.org/variablename/1_2_Dichloropropane
benzo_e_pyrene	Benzo(e)pyrene	Benzo(e)pyrene (C20H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/benzo_e_pyrene
2_4_Dichlorophenol	2,4-Dichlorophenol	2,4-Dichlorophenol (C6H4Cl2O)	\N	http://vocabulary.odm2.org/variablename/2_4_Dichlorophenol
chromium_VI_Dissolved	Chromium (VI), dissolved	Dissolved Hexavalent Chromium	\N	http://vocabulary.odm2.org/variablename/chromium_VI_Dissolved
tideStage	Tide stage	Tidal stage	\N	http://vocabulary.odm2.org/variablename/tideStage
n_Alkane_C23	n-alkane, C23	C23 alkane, normal (i.e. straight-chain) isomer, common name: n-Tricosane, formula : C23H48	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C23
cadmiumParticulate	Cadmium, particulate	Particulate cadmium (Cd) in suspension	\N	http://vocabulary.odm2.org/variablename/cadmiumParticulate
density	Density	Density	\N	http://vocabulary.odm2.org/variablename/density
instrumentStatusCode	Instrument status code	Code value recorded by instrument indicating some information regarding the status of the instrument	\N	http://vocabulary.odm2.org/variablename/instrumentStatusCode
gageHeight	Gage height	Water level with regard to an arbitrary gage datum (also see Water depth for comparison)	\N	http://vocabulary.odm2.org/variablename/gageHeight
oilAndGrease	Oil and grease	Oil and grease	\N	http://vocabulary.odm2.org/variablename/oilAndGrease
area	Area	Area of a measurement location	\N	http://vocabulary.odm2.org/variablename/area
carbonDioxideFlux	Carbon dioxide flux	Carbon dioxide (CO2) flux	\N	http://vocabulary.odm2.org/variablename/carbonDioxideFlux
2_Butoxyethanol	2-Butoxyethanol	2-Butoxyethanol (CH3(CH2)2CH2OCH2OH)	\N	http://vocabulary.odm2.org/variablename/2_Butoxyethanol
asteridaeCoverage	Asteridae coverage	Areal coverage of the plant Asteridae	\N	http://vocabulary.odm2.org/variablename/asteridaeCoverage
dataShuttleAttached	Data shuttle attached	A categorical variable marking the attachment of a coupler or data shuttle to a logger. This is used for quality control.	\N	http://vocabulary.odm2.org/variablename/dataShuttleAttached
endosulfanSulfate	Endosulfan Sulfate	Endosulfan Sulfate (C9H6Cl6O4S)	\N	http://vocabulary.odm2.org/variablename/endosulfanSulfate
benzene	Benzene	Benzene (C6H6)	\N	http://vocabulary.odm2.org/variablename/benzene
chlorobenzene	Chlorobenzene	Chlorobenzene (C6H5Cl)	\N	http://vocabulary.odm2.org/variablename/chlorobenzene
n_Alkane_C30	n-alkane, C30	C30 alkane, normal (i.e. straight-chain) isomer, common name: n-Triacontane, formula : C30H62	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C30
phosphorusTotal	Phosphorus, total	Total Phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusTotal
zincDissolved	Zinc, dissolved	Dissolved Zinc (Zn)	\N	http://vocabulary.odm2.org/variablename/zincDissolved
ureaFlux	Urea flux	Urea ((NH2)2CO) flux	\N	http://vocabulary.odm2.org/variablename/ureaFlux
BOD3Carbonaceous	BOD3, carbonaceous	3-day Carbonaceous Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD3Carbonaceous
silica	Silica	Silica (SiO2)	\N	http://vocabulary.odm2.org/variablename/silica
terpineol	Terpineol	Terpineol (C10H18O)	\N	http://vocabulary.odm2.org/variablename/terpineol
lithiumTotal	Lithium, total	Total Lithium (Li). For chemical terms, total indicates an unfiltered sample.	\N	http://vocabulary.odm2.org/variablename/lithiumTotal
tertAmylMethylEther	Tert-Amyl Methyl Ether	Tert-Amyl Methyl Ether (C6H14O)	\N	http://vocabulary.odm2.org/variablename/tertAmylMethylEther
tetracene	Tetracene	Tetracene (C18H12), a polycyclic aromatic hydrocarbon (PAH), also known as naphthacene or benz[b]anthracene	\N	http://vocabulary.odm2.org/variablename/tetracene
aldrin	Aldrin	Aldrin (C12H8Cl6)	\N	http://vocabulary.odm2.org/variablename/aldrin
solidsFixedSuspended	Solids, fixed suspended	Fixed Suspended Solids	\N	http://vocabulary.odm2.org/variablename/solidsFixedSuspended
odor	Odor	Odor	\N	http://vocabulary.odm2.org/variablename/odor
hardnessTotal	Hardness, total	Total hardness	\N	http://vocabulary.odm2.org/variablename/hardnessTotal
n_Alkane_C15	n-alkane, C15	C15 alkane, normal (i.e. straight-chain) isomer, common name: n-Pentadecane, formula : C15H32	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C15
naphthalene	Naphthalene	Naphthalene (C10H8)	\N	http://vocabulary.odm2.org/variablename/naphthalene
bis_2_Chloroethyl_Ether	bis(2-Chloroethyl)ether	bis(2-Chloroethyl)ether (C4H8Cl2O)	\N	http://vocabulary.odm2.org/variablename/bis_2_Chloroethyl_Ether
discharge	Discharge	Discharge	\N	http://vocabulary.odm2.org/variablename/discharge
arsenicTotal	Arsenic, total	Total arsenic (As). Total indicates was measured on a whole water sample.	\N	http://vocabulary.odm2.org/variablename/arsenicTotal
chlorophyll_a_b_c	Chlorophyll (a+b+c)	Chlorophyll (a+b+c)	\N	http://vocabulary.odm2.org/variablename/chlorophyll_a_b_c
carbonDisulfide	Carbon disulfide	Carbon disulfide (CS2)	\N	http://vocabulary.odm2.org/variablename/carbonDisulfide
canthaxanthin	Canthaxanthin	The phytoplankton pigment Canthaxanthin	\N	http://vocabulary.odm2.org/variablename/canthaxanthin
acenaphthene	Acenaphthene	Acenaphthene (C12H10)	\N	http://vocabulary.odm2.org/variablename/acenaphthene
methyleneChloride_Dichloromethane	Methylene chloride (Dichloromethane)	Methylene chloride (Dichloromethane) (CH2Cl2)	\N	http://vocabulary.odm2.org/variablename/methyleneChloride_Dichloromethane
1_Methylnaphthalene	1-Methylnaphthalene	1-Methylnaphthalene (C10H7CH3), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_Methylnaphthalene
phosphorusParticulate	Phosphorus, particulate	Particulate phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusParticulate
containerNumber	Container number	The identifying number for a water sampler container.	\N	http://vocabulary.odm2.org/variablename/containerNumber
2_3_4_6_Tetrachlorophenol	2,3,4,6-Tetrachlorophenol	2,3,4,6-Tetrachlorophenol (C6H2Cl4O)	\N	http://vocabulary.odm2.org/variablename/2_3_4_6_Tetrachlorophenol
1_3_5_Trimethylbenzene	1,3,5-Trimethylbenzene	1,3,5-Trimethylbenzene (C6H3(CH3)3)	\N	http://vocabulary.odm2.org/variablename/1_3_5_Trimethylbenzene
mercuryTotal	Mercury, total	Total Mercury (Hg). For chemical terms, total represents an unfiltered sample.	\N	http://vocabulary.odm2.org/variablename/mercuryTotal
bicarbonate	Bicarbonate	Bicarbonate (HCO3-)	\N	http://vocabulary.odm2.org/variablename/bicarbonate
abundance	Abundance	The relative representation of a species in a particular ecosystem. If this generic term is used, the publisher should specify/qualify the species, class, etc. being measured in the method, qualifier, or other appropriate field.	\N	http://vocabulary.odm2.org/variablename/abundance
heptachlorEpoxide	Heptachlor epoxide	Heptachlor epoxide (C10H5Cl7O)	\N	http://vocabulary.odm2.org/variablename/heptachlorEpoxide
nickelTotal	Nickel, total	Total Nickel (Ni). "Total" indicates was measured on a whole water (unfiltered) sample.	\N	http://vocabulary.odm2.org/variablename/nickelTotal
4_4_Methylenebis_N_N_Dimethylaniline	4,4-Methylenebis(N,N-dimethylaniline)	4,4'-Methylenebis(N,N-dimethylaniline) (C17H22N2)	\N	http://vocabulary.odm2.org/variablename/4_4_Methylenebis_N_N_Dimethylaniline
COD	COD	Chemical oxygen demand	\N	http://vocabulary.odm2.org/variablename/COD
hostConnected	Host connected	A categorical variable marking the attachment of a host computer to a logger. This is used for quality control.	\N	http://vocabulary.odm2.org/variablename/hostConnected
carbonSuspendedTotal	Carbon, suspended total	Suspended Total (Organic+Inorganic) Carbon	\N	http://vocabulary.odm2.org/variablename/carbonSuspendedTotal
waterLevel	Water level	Water level relative to datum. The datum may be local or global such as NGVD 1929 and should be specified in the method description for associated data values.	\N	http://vocabulary.odm2.org/variablename/waterLevel
e_coli	E-coli	Escherichia coli	\N	http://vocabulary.odm2.org/variablename/e_coli
netHeatFlux	Net heat flux	Outgoing rate of heat energy transfer minus the incoming rate of heat energy transfer through a given area	\N	http://vocabulary.odm2.org/variablename/netHeatFlux
chloroform	Chloroform	Chloroform (CHCl3), a haloform	\N	http://vocabulary.odm2.org/variablename/chloroform
cis_1_3_Dichloropropene	cis-1,3-Dichloropropene	cis-1,3-Dichloropropene (C3H4Cl2)	\N	http://vocabulary.odm2.org/variablename/cis_1_3_Dichloropropene
propanoicAcid	Propanoic acid	Propanoic acid (C3H6O2)	\N	http://vocabulary.odm2.org/variablename/propanoicAcid
magnesiumDissolved	Magnesium, dissolved	Dissolved Magnesium (Mg)	\N	http://vocabulary.odm2.org/variablename/magnesiumDissolved
1_2_Dibromo_3_Chloropropane	1,2-Dibromo-3-chloropropane	1,2-Dibromo-3-chloropropane (C3H5Br2Cl)	\N	http://vocabulary.odm2.org/variablename/1_2_Dibromo_3_Chloropropane
noVegetationCoverage	No vegetation coverage	Areal coverage of no vegetation	\N	http://vocabulary.odm2.org/variablename/noVegetationCoverage
sodiumTotal	Sodium, total	Total Sodium (Na)	\N	http://vocabulary.odm2.org/variablename/sodiumTotal
solidsTotal	Solids, total	Total Solids	\N	http://vocabulary.odm2.org/variablename/solidsTotal
chloride	Chloride	Chloride (Cl-)	\N	http://vocabulary.odm2.org/variablename/chloride
carbonToNitrogenMolarRatio	Carbon to nitrogen molar ratio	Carbon to nitrogen (C:N) molar ratio	\N	http://vocabulary.odm2.org/variablename/carbonToNitrogenMolarRatio
N_Nitrosodiphenylamine	N-Nitrosodiphenylamine	N-Nitrosodiphenylamine (C12H10N2O)	\N	http://vocabulary.odm2.org/variablename/N_Nitrosodiphenylamine
sodiumAdsorptionRatio	Sodium adsorption ratio	Sodium adsorption ratio	\N	http://vocabulary.odm2.org/variablename/sodiumAdsorptionRatio
nitrogenDissolvedNitrite_NO2_Nitrate_NO3	Nitrogen, dissolved nitrite (NO2) + nitrate (NO3)	Dissolved nitrite (NO2) + nitrate (NO3) nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenDissolvedNitrite_NO2_Nitrate_NO3
evapotranspiration	Evapotranspiration	Evapotranspiration	\N	http://vocabulary.odm2.org/variablename/evapotranspiration
calciumDissolved	Calcium, dissolved	Dissolved Calcium (Ca)	\N	http://vocabulary.odm2.org/variablename/calciumDissolved
1_Chloronaphthalene	1-Chloronaphthalene	1-Chloronaphthalene (C10H7Cl)	\N	http://vocabulary.odm2.org/variablename/1_Chloronaphthalene
counter	Counter	The total number of events within the measurement period	\N	http://vocabulary.odm2.org/variablename/counter
groundwaterDepth	Groundwater Depth	Groundwater depth is the distance between the water surface and the ground surface at a specific location specified by the site location and offset.	\N	http://vocabulary.odm2.org/variablename/groundwaterDepth
1_Methylphenanthrene	1-Methylphenanthrene	1-Methylphenanthrene (C15H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_Methylphenanthrene
parameter	Parameter	Parameter related to a hydrologic process. An example usage would be for a starge-discharge relation parameter.	\N	http://vocabulary.odm2.org/variablename/parameter
grossAlphaRadionuclides	Gross alpha radionuclides	Gross Alpha Radionuclides	\N	http://vocabulary.odm2.org/variablename/grossAlphaRadionuclides
isophorone	Isophorone	Isophorone (C9H14O)	\N	http://vocabulary.odm2.org/variablename/isophorone
coliformTotal	Coliform, total	Total Coliform	\N	http://vocabulary.odm2.org/variablename/coliformTotal
chloromethane	Chloromethane	Chloromethane (CH3Cl)	\N	http://vocabulary.odm2.org/variablename/chloromethane
1_3_Dinitrobenzene	1,3-Dinitrobenzene	1,3-Dinitrobenzene (C6H4N2O4)	\N	http://vocabulary.odm2.org/variablename/1_3_Dinitrobenzene
cuscutaSppCoverage	Cuscuta spp. coverage	Areal coverage of the plant Cuscuta spp.	\N	http://vocabulary.odm2.org/variablename/cuscutaSppCoverage
1_Methyldibenzothiophene	1-Methyldibenzothiophene	1-Methyldibenzothiophene (C13H10S)	\N	http://vocabulary.odm2.org/variablename/1_Methyldibenzothiophene
radiationNetPAR	Radiation, net PAR	Net Photosynthetically-Active Radiation	\N	http://vocabulary.odm2.org/variablename/radiationNetPAR
alkalinityHydroxide	Alkalinity, hydroxide	Hydroxide Alkalinity	\N	http://vocabulary.odm2.org/variablename/alkalinityHydroxide
evapotranspirationPotential	Evapotranspiration, potential	The amount of water that could be evaporated and transpired if there was sufficient water available.	\N	http://vocabulary.odm2.org/variablename/evapotranspirationPotential
BODu	BODu	Ultimate Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BODu
pyrene	Pyrene	Pyrene (C16H10), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/pyrene
seleniumDissolved	Selenium, dissolved	Dissolved selenium (Se). For chemical terms, dissolved indicates a filtered sample.	\N	http://vocabulary.odm2.org/variablename/seleniumDissolved
1_4_Dimethylnaphthalene	1,4-Dimethylnaphthalene	1,4-Dimethylnaphthalene (C10H6(CH3)2), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_4_Dimethylnaphthalene
hexane	Hexane	Hexane	\N	http://vocabulary.odm2.org/variablename/hexane
shannonDiversityIndex	Shannon diversity index	A diversity index that is based on the number of taxa, and the proportion of individuals in each taxa relative to the entire community, evaluated as entropy. Also known as Shannon-Weaver diversity index, the Shannon-Wiener index, the Shannon index and the Shannon entropy.	\N	http://vocabulary.odm2.org/variablename/shannonDiversityIndex
alkalinityTotal	Alkalinity, total	Total Alkalinity	\N	http://vocabulary.odm2.org/variablename/alkalinityTotal
1_3_Dimethylnaphthalene	1,3-Dimethylnaphthalene	1,3-Dimethylnaphthalene (C10H6(CH3)2), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_3_Dimethylnaphthalene
hardnessNonCarbonate	Hardness, non-carbonate	Non-carbonate hardness	\N	http://vocabulary.odm2.org/variablename/hardnessNonCarbonate
BODuCarbonaceous	BODu, carbonaceous	Carbonaceous Ultimate Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BODuCarbonaceous
potassiumDissolved	Potassium, dissolved	Dissolved Potassium (K)	\N	http://vocabulary.odm2.org/variablename/potassiumDissolved
nitrogenNitrite_NO2	Nitrogen, nitrite (NO2)	Nitrite (NO2) Nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenNitrite_NO2
shannonEvennessIndex	Shannon evenness index	A dimensionless diversity index, calculated as a ratio of the Shannon diversity index over its maximum. Also known as the Shannon Weaver evenness index	\N	http://vocabulary.odm2.org/variablename/shannonEvennessIndex
temperatureDewPoint	Temperature, dew point	Dew point temperature	\N	http://vocabulary.odm2.org/variablename/temperatureDewPoint
DNADamageOliveDailMoment	DNA damage, olive tail moment	In a single cell gel electrophoresis assay (comet assay), olive tail moment is the product of the percentage of DNA in the tail and the distance between the intesity centroids of the head and tail along the x-axis (Olive, et al., 1990)	\N	http://vocabulary.odm2.org/variablename/DNADamageOliveDailMoment
boronDissolved	Boron, dissolved	dissolved boron	\N	http://vocabulary.odm2.org/variablename/boronDissolved
ammoniumFlux	Ammonium flux	Ammonium (NH4) flux	\N	http://vocabulary.odm2.org/variablename/ammoniumFlux
carbonDioxideTransducerSignal	Carbon dioxide, transducer signal	Carbon dioxide (CO2), raw data from sensor	\N	http://vocabulary.odm2.org/variablename/carbonDioxideTransducerSignal
cis_1_2_Dichloroethene	cis-1,2-Dichloroethene	cis-1,2-Dichloroethene (C2H2Cl2)	\N	http://vocabulary.odm2.org/variablename/cis_1_2_Dichloroethene
4_Methylphenol	4-Methylphenol	4-Methylphenol (C7H8O)	\N	http://vocabulary.odm2.org/variablename/4_Methylphenol
waterDepthAveraged	Water depth, averaged	Water depth averaged over a channel cross-section or water body.  Averaging method to be specified in methods.	\N	http://vocabulary.odm2.org/variablename/waterDepthAveraged
THWIndex	THW Index	The THW Index uses temperature, humidity, and wind speed to calculate an apparent temperature.	\N	http://vocabulary.odm2.org/variablename/THWIndex
sodiumDissolved	Sodium, dissolved	Dissolved Sodium (Na)	\N	http://vocabulary.odm2.org/variablename/sodiumDissolved
nitrogenOrganicKjeldahl	Nitrogen, organic kjeldahl	Organic Kjeldahl (organic nitrogen + ammonia (NH3) + ammonium (NH4)) nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenOrganicKjeldahl
pH	pH	pH is the measure of the acidity or alkalinity of a solution. pH is formally a measure of the activity of dissolved hydrogen ions (H+). Solutions in which the concentration of H+ exceeds that of OH- have a pH value lower than 7.0 and are known as acids.	\N	http://vocabulary.odm2.org/variablename/pH
1_2_Dimethylnaphthalene	1,2-Dimethylnaphthalene	1,2-Dimethylnaphthalene (C10H6(CH3)2), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_2_Dimethylnaphthalene
9_cis_Neoxanthin	9 cis-Neoxanthin	The phytoplankton pigment  9 cis-Neoxanthin	\N	http://vocabulary.odm2.org/variablename/9_cis_Neoxanthin
biomassTotal	Biomass, total	Total biomass	\N	http://vocabulary.odm2.org/variablename/biomassTotal
methylpyrene	Methylpyrene	Methylpyrene (C17H12)	\N	http://vocabulary.odm2.org/variablename/methylpyrene
delta_13COfC4H10	delta-13C of C4H10	Isotope 13C of butane	\N	http://vocabulary.odm2.org/variablename/delta_13COfC4H10
2_Methyldibenzothiophene	2-Methyldibenzothiophene	2-Methyldibenzothiophene (C13H10S), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/2_Methyldibenzothiophene
fluorene	Fluorene	Fluorene (C13H10), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/fluorene
chlorine	Chlorine	Chlorine (Cl2)	\N	http://vocabulary.odm2.org/variablename/chlorine
mercuryDissolved	Mercury, dissolved	Dissolved Mercury (Hg). For chemical terms, dissolved indicates a filtered sample.	\N	http://vocabulary.odm2.org/variablename/mercuryDissolved
salinity	Salinity	Salinity	\N	http://vocabulary.odm2.org/variablename/salinity
nitrogenDissolved_Free_Ionized_Ammonia_NH3_NH4	Nitrogen, dissolved (free+ionized) Ammonia (NH3) + (NH4)	Dissolved (free+ionized) Ammonia	\N	http://vocabulary.odm2.org/variablename/nitrogenDissolved_Free_Ionized_Ammonia_NH3_NH4
flashMemoryErrorCount	Flash memory error count	A counter which counts the number of  datalogger flash memory errors	\N	http://vocabulary.odm2.org/variablename/flashMemoryErrorCount
solidsVolatileDissolved	Solids, volatile dissolved	Volatile Dissolved Solids	\N	http://vocabulary.odm2.org/variablename/solidsVolatileDissolved
N_Nitrosodi_n_Propylamine	N-Nitrosodi-n-propylamine	N-Nitrosodi-n-propylamine (C6H14N2O)	\N	http://vocabulary.odm2.org/variablename/N_Nitrosodi_n_Propylamine
ivaFrutescenscoverage	Iva frutescens coverage	Areal coverage of the plant Iva frutescens	\N	http://vocabulary.odm2.org/variablename/ivaFrutescenscoverage
2_2_DichlorovinylDimethylPhosphate	2,2-dichlorovinyl dimethyl phosphate	2,2-dichlorovinyl dimethyl phosphate (C4H7Cl2O4P)	\N	http://vocabulary.odm2.org/variablename/2_2_DichlorovinylDimethylPhosphate
glutathione_S_TransferaseActivity	Glutathione S-transferase, activity	Glutathione S-transferase (GST) activity	\N	http://vocabulary.odm2.org/variablename/glutathione_S_TransferaseActivity
squalene	Squalene	Squalene (C30H50)	\N	http://vocabulary.odm2.org/variablename/squalene
superoxideDismutaseDeltaCycleThreshold	Superoxide dismutase, delta cycle threshold	Delta cycle threshold for superoxide dismutase (sod). Cycle threshold is the PCR cycle number at which the fluorescent signal of the gene being amplified crosses the set threshold. Delta cycle threshold for sod is the difference between the cycle threshold (Ct) of sod gene expression and the cycle threshold (Ct) for the gene expression of the reference gene (e.g., beta-actin).	\N	http://vocabulary.odm2.org/variablename/superoxideDismutaseDeltaCycleThreshold
carbonTotalInorganic	Carbon, total inorganic	Total (Dissolved+Particulate) Inorganic Carbon	\N	http://vocabulary.odm2.org/variablename/carbonTotalInorganic
acidNeutralizingCapacity	Acid neutralizing capacity	Acid neutralizing capacity	\N	http://vocabulary.odm2.org/variablename/acidNeutralizingCapacity
1_4_Dichlorobenzene	1,4-Dichlorobenzene	1,4-Dichlorobenzene (C6H4Cl2)	\N	http://vocabulary.odm2.org/variablename/1_4_Dichlorobenzene
iodideDissolved	Iodide, dissolved	Dissolved Iodide (I-)	\N	http://vocabulary.odm2.org/variablename/iodideDissolved
endrinAldehyde	Endrin aldehyde	Endrin aldehyde (C12H8Cl6O)	\N	http://vocabulary.odm2.org/variablename/endrinAldehyde
2_Chlorophenol	2-Chlorophenol	2-Chlorophenol (C6H5ClO)	\N	http://vocabulary.odm2.org/variablename/2_Chlorophenol
n_AlkaneShortChain	n-alkane, short-chain	short-chain alkanes, normal (i.e. straight chain) isomer (isomer range of alkanes measured should be specified)	\N	http://vocabulary.odm2.org/variablename/n_AlkaneShortChain
n_Alkane_C20	n-alkane, C20	C20 alkane, normal (i.e. straight-chain) isomer, common name: n-Icosane, formula : C20H42. Synonyms: didecyl, eicosane.	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C20
timeElapsed	Time, elapsed	Time elapsed since an event occurred	\N	http://vocabulary.odm2.org/variablename/timeElapsed
sedimentSuspended	Sediment, suspended	Suspended Sediment	\N	http://vocabulary.odm2.org/variablename/sedimentSuspended
oxygen	Oxygen	Oxygen	\N	http://vocabulary.odm2.org/variablename/oxygen
biogenicSilica	Biogenic silica	Hydrated silica (SiO2 nH20)	\N	http://vocabulary.odm2.org/variablename/biogenicSilica
oxygenDissolved	Oxygen, dissolved	Dissolved oxygen	\N	http://vocabulary.odm2.org/variablename/oxygenDissolved
1_2_Dichloroethane	1,2-Dichloroethane	1,2-Dichloroethane (C2H4Cl2)	\N	http://vocabulary.odm2.org/variablename/1_2_Dichloroethane
TSI	TSI	Carlson Trophic State Index is a measurement of eutrophication based on Secchi depth	\N	http://vocabulary.odm2.org/variablename/TSI
radiationOutgoingPAR	Radiation, outgoing PAR	Outgoing Photosynthetically-Active Radiation	\N	http://vocabulary.odm2.org/variablename/radiationOutgoingPAR
DNADamagePercentTailDNA	DNA damage, percent tail DNA	In a single cell gel electrophoresis assay (comet assay), percent tail DNA is the ratio of fluorescent intensity of the tail over the total fluorescent intensity of the head (nuclear core) and tail multiplied by 100.	\N	http://vocabulary.odm2.org/variablename/DNADamagePercentTailDNA
dataShuttleDetached	Data shuttle detached	A categorical variable marking the detatchment of a coupler or data shuttle to a logger. This is used for quality control.	\N	http://vocabulary.odm2.org/variablename/dataShuttleDetached
biomass	Biomass	Mass of living biological organisms in a given area or ecosystem at a given time. If this generic term is used, the publisher should specify/qualify the species, class, etc. being measured in the method, qualifier, or other appropriate field.	\N	http://vocabulary.odm2.org/variablename/biomass
globalRadiation	Global Radiation	Solar radiation, direct and diffuse, received from a solid angle of 2p steradians on a horizontal surface. Source: World Meteorological Organization, Meteoterm	\N	http://vocabulary.odm2.org/variablename/globalRadiation
waterColumnEquivalentHeightBarometric	Water column equivalent height, barometric	Barometric pressure expressed as an equivalent height of water over the sensor.	\N	http://vocabulary.odm2.org/variablename/waterColumnEquivalentHeightBarometric
position	Position	Position of an element that interacts with water such as reservoir gates	\N	http://vocabulary.odm2.org/variablename/position
chloroethene	Chloroethene	Chloroethene (C2H3Cl)	\N	http://vocabulary.odm2.org/variablename/chloroethene
nitrobenzene	Nitrobenzene	Nitrobenzene (C6H5NO2)	\N	http://vocabulary.odm2.org/variablename/nitrobenzene
n_Alkane_C22	n-alkane, C22	C22 alkane, normal (i.e. straight-chain) isomer, common name: n-Docosane, formula : C22H46	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C22
berylliumTotal	Beryllium, total	Total Beryllium (Be). For chemical terms, "total" indicates an unfiltered sample.	\N	http://vocabulary.odm2.org/variablename/berylliumTotal
BOD20Nitrogenous	BOD20, nitrogenous	20-day Nitrogenous Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD20Nitrogenous
chromiumDissolved	Chromium, dissolved	Dissolved Chromium	\N	http://vocabulary.odm2.org/variablename/chromiumDissolved
2_Methylphenol	2-Methylphenol	2-Methylphenol (C7H8O)	\N	http://vocabulary.odm2.org/variablename/2_Methylphenol
n_Alkane_C29	n-alkane, C29	C29 alkane, normal (i.e. straight-chain) isomer, common name: n-Nonacosane, formula : C29H60	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C29
BOD6Carbonaceous	BOD6, carbonaceous	6-day Carbonaceous Biological Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD6Carbonaceous
acidityCO2Acidity	Acidity, CO2 acidity	CO2 acidity	\N	http://vocabulary.odm2.org/variablename/acidityCO2Acidity
nitrogenDissolvedInorganic	Nitrogen, dissolved inorganic	Dissolved inorganic nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenDissolvedInorganic
BOD5Nitrogenous	BOD5, nitrogenous	5-day Nitrogenous Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD5Nitrogenous
ironFerrous	Iron, ferrous	Ferrous Iron (Fe+2)	\N	http://vocabulary.odm2.org/variablename/ironFerrous
ethaneDissolved	Ethane, dissolved	Dissolved Ethane (C2H6)	\N	http://vocabulary.odm2.org/variablename/ethaneDissolved
1_2_Diphenylhydrazine	1,2-Diphenylhydrazine	1,2-Diphenylhydrazine (C12H12N2)	\N	http://vocabulary.odm2.org/variablename/1_2_Diphenylhydrazine
toluene	Toluene	Toluene (C6H5CH3)	\N	http://vocabulary.odm2.org/variablename/toluene
radiationIncoming	Radiation, incoming	Incoming radiation	\N	http://vocabulary.odm2.org/variablename/radiationIncoming
chloroethane	Chloroethane	Chloroethane (C2H5Cl)	\N	http://vocabulary.odm2.org/variablename/chloroethane
2_4_Dimethylphenol	2,4-Dimethylphenol	2,4-Dimethylphenol (C8H10O)	\N	http://vocabulary.odm2.org/variablename/2_4_Dimethylphenol
phosphorusPhosphate_PO4	Phosphorus, phosphate (PO4)	Phosphate phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusPhosphate_PO4
methyleneBlueActiveSubstances	Methylene blue active substances	Methylene Blue Active Substances (MBAS)	\N	http://vocabulary.odm2.org/variablename/methyleneBlueActiveSubstances
parathion_Ethyl	Parathion-ethyl	Parathion-ethyl (C10H14NO5PS)	\N	http://vocabulary.odm2.org/variablename/parathion_Ethyl
helium	Helium	Helium	\N	http://vocabulary.odm2.org/variablename/helium
1_1_Dichloroethene	1,1-Dichloroethene	1,1-Dichloroethene (C2H2Cl2)	\N	http://vocabulary.odm2.org/variablename/1_1_Dichloroethene
voltage	Voltage	Voltage or Electrical Potential	\N	http://vocabulary.odm2.org/variablename/voltage
windGustSpeed	Wind gust speed	Speed of gusts of wind	\N	http://vocabulary.odm2.org/variablename/windGustSpeed
1_1_1_Trichloroethane	1,1,1-Trichloroethane	1,1,1-Trichloroethane (C2H3Cl3)	\N	http://vocabulary.odm2.org/variablename/1_1_1_Trichloroethane
seleniumParticulate	Selenium, particulate	Particulate selenium (Se) in suspension	\N	http://vocabulary.odm2.org/variablename/seleniumParticulate
cobaltDissolved	Cobalt, dissolved	Dissolved Cobalt (Co)	\N	http://vocabulary.odm2.org/variablename/cobaltDissolved
weatherConditions	Weather conditions	Weather conditions	\N	http://vocabulary.odm2.org/variablename/weatherConditions
radiationIncomingShortwave	Radiation, incoming shortwave	Incoming Shortwave Radiation	\N	http://vocabulary.odm2.org/variablename/radiationIncomingShortwave
dibromochloromethane	Dibromochloromethane	Dibromochloromethane (CHBr2Cl)	\N	http://vocabulary.odm2.org/variablename/dibromochloromethane
thalliumDissolved	Thallium, dissolved	Dissolved thallium (Tl). "dissolved" indicates measurement was made on a filtered sample.	\N	http://vocabulary.odm2.org/variablename/thalliumDissolved
alkalinityCarbonatePlusBicarbonate	Alkalinity, carbonate plus bicarbonate	Alkalinity, carbonate plus bicarbonate	\N	http://vocabulary.odm2.org/variablename/alkalinityCarbonatePlusBicarbonate
diisopropylEther	Diisopropyl Ether	Diisopropyl Ether (C6H14O)	\N	http://vocabulary.odm2.org/variablename/diisopropylEther
precipitation	Precipitation	Precipitation such as rainfall. Should not be confused with settling.	\N	http://vocabulary.odm2.org/variablename/precipitation
lyciumCarolinianumCoverage	Lycium carolinianum Coverage	Areal coverage of the plant Lycium carolinianum	\N	http://vocabulary.odm2.org/variablename/lyciumCarolinianumCoverage
2_Hexanone	2-Hexanone	2-Hexanone (C6H12O)	\N	http://vocabulary.odm2.org/variablename/2_Hexanone
bis_2_Ethylhexyl_Phthalate	Bis-(2-ethylhexyl) phthalate	Bis-(2-ethylhexyl) phthalate (C6H4(C8H17COO)2)	\N	http://vocabulary.odm2.org/variablename/bis_2_Ethylhexyl_Phthalate
carbaryl	Carbaryl	Carbaryl (C12H11NO2)	\N	http://vocabulary.odm2.org/variablename/carbaryl
2_4_Dinitrophenol	2,4-Dinitrophenol	2,4-Dinitrophenol (C6H4N2O5)	\N	http://vocabulary.odm2.org/variablename/2_4_Dinitrophenol
1_Methylanthracene	1-Methylanthracene	1-Methylanthracene (C15H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_Methylanthracene
streptococciFecal	Streptococci, fecal	Fecal Streptococci	\N	http://vocabulary.odm2.org/variablename/streptococciFecal
indeno_1_2_3_cd_Pyrene	Indeno(1,2,3-cd)pyrene	Indeno(1,2,3-cd)pyrene (C22H12)	\N	http://vocabulary.odm2.org/variablename/indeno_1_2_3_cd_Pyrene
waterFlux	Water flux	Water Flux	\N	http://vocabulary.odm2.org/variablename/waterFlux
phorate	Phorate	Phorate (C7H17O2PS3)	\N	http://vocabulary.odm2.org/variablename/phorate
cesiumTotal	Cesium, total	Total Cesium (Cs)	\N	http://vocabulary.odm2.org/variablename/cesiumTotal
carbon_13StableIsotopeRatioDelta	Carbon-13, stable isotope ratio delta	Difference in the 13C:12C ratio between the sample and standard (del C 13)	\N	http://vocabulary.odm2.org/variablename/carbon_13StableIsotopeRatioDelta
ironDissolved	Iron, dissolved	Dissolved Iron (Fe)	\N	http://vocabulary.odm2.org/variablename/ironDissolved
aroclor_1242	Aroclor-1242	Aroclor-1242 (C12H6Cl4), a PCB mixture	\N	http://vocabulary.odm2.org/variablename/aroclor_1242
chromiumParticulate	Chromium, particulate	Particulate chromium (Cr) in suspension	\N	http://vocabulary.odm2.org/variablename/chromiumParticulate
nitrogenDissolvedNitrite_NO2	Nitrogen, dissolved nitrite (NO2)	Dissolved nitrite (NO2) nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenDissolvedNitrite_NO2
nitrogenDissolvedKjeldahl	Nitrogen, dissolved Kjeldahl	Dissolved Kjeldahl (organic nitrogen + ammonia (NH3) + ammonium (NH4))nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenDissolvedKjeldahl
nitrousOxide	Nitrous oxide	Nitrous oxide (N2O)	\N	http://vocabulary.odm2.org/variablename/nitrousOxide
radiationIncomingUV_B	Radiation, incoming UV-B	Incoming Ultraviolet B Radiation	\N	http://vocabulary.odm2.org/variablename/radiationIncomingUV_B
arsenicParticulate	Arsenic, particulate	Particulate arsenic (As) in suspension	\N	http://vocabulary.odm2.org/variablename/arsenicParticulate
2_3_Dimethylnaphthalene	2,3-Dimethylnaphthalene	2,3-Dimethylnaphthalene (C10H6(CH3)2), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/2_3_Dimethylnaphthalene
signalToNoiseRatio	Signal-to-noise ratio	Signal-to-noise ratio (often abbreviated SNR or S/N) is defined as the ratio of a signal power to the noise power corrupting the signal. The higher the ratio, the less obtrusive the background noise is.	\N	http://vocabulary.odm2.org/variablename/signalToNoiseRatio
di_n_Butylphthalate	Di-n-butylphthalate	Di-n-butylphthalate (C16H22O4)	\N	http://vocabulary.odm2.org/variablename/di_n_Butylphthalate
4_Nitroaniline	4-Nitroaniline	4-Nitroaniline (C6H6N2O2)	\N	http://vocabulary.odm2.org/variablename/4_Nitroaniline
n_Alkane_C18	n-alkane, C18	C18 alkane, normal (i.e. straight-chain) isomer, common name: n-Octadecane, formula : C18H38	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C18
radiationOutgoingShortwave	Radiation, outgoing shortwave	Outgoing Shortwave Radiation	\N	http://vocabulary.odm2.org/variablename/radiationOutgoingShortwave
antimonyTotal	Antimony, total	Total antimony (Sb). "Total" indicates was measured on a whole water (unfiltered) sample.	\N	http://vocabulary.odm2.org/variablename/antimonyTotal
pheophytin	Pheophytin	Pheophytin (Chlorophyll which has lost the central Mg ion) is a degradation product of Chlorophyll	\N	http://vocabulary.odm2.org/variablename/pheophytin
strontiumTotal	Strontium, total	Total Strontium (Sr)	\N	http://vocabulary.odm2.org/variablename/strontiumTotal
argonDissolved	Argon, dissolved	Dissolved Argon	\N	http://vocabulary.odm2.org/variablename/argonDissolved
boreholeLogMaterialClassification	Borehole log material classification	Classification of material encountered by a driller at various depths during the drilling of a well and recorded in the borehole log.	\N	http://vocabulary.odm2.org/variablename/boreholeLogMaterialClassification
bromine	Bromine	Bromine (Br2)	\N	http://vocabulary.odm2.org/variablename/bromine
acidityMineralAcidity	Acidity, mineral acidity	Mineral Acidity	\N	http://vocabulary.odm2.org/variablename/acidityMineralAcidity
thoriumDissolved	Thorium, dissolved	Dissolved thorium. For chemical terms, dissolved indicates a filtered sample.	\N	http://vocabulary.odm2.org/variablename/thoriumDissolved
formicAcid	Formic acid	Formic acid (CH2O2)	\N	http://vocabulary.odm2.org/variablename/formicAcid
albedo	Albedo	The ratio of reflected to incident light.	\N	http://vocabulary.odm2.org/variablename/albedo
butyricAcid	Butyric Acid	Butyric Acid (C4H8O2)	\N	http://vocabulary.odm2.org/variablename/butyricAcid
electricCurrent	Electric Current	A flow of electric charge	\N	http://vocabulary.odm2.org/variablename/electricCurrent
N_Nitrosomethylethylamine	N-Nitrosomethylethylamine	N-Nitrosomethylethylamine (C3H8N2O)	\N	http://vocabulary.odm2.org/variablename/N_Nitrosomethylethylamine
4_4_DDT	4,4-DDT	Dichlorodiphenyltrichloroethane (C14H9Cl5)	\N	http://vocabulary.odm2.org/variablename/4_4_DDT
nitrogenTotalOrganic	Nitrogen, total organic	Total (dissolved + particulate) organic nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenTotalOrganic
chlorineDissolved	Chlorine, dissolved	Dissolved Chlorine (Cl2)	\N	http://vocabulary.odm2.org/variablename/chlorineDissolved
phosphorusTotalDissolved	Phosphorus, total dissolved	Total dissolved phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusTotalDissolved
bifenthrin	Bifenthrin	Bifenthrin (C23H22ClF3O2)	\N	http://vocabulary.odm2.org/variablename/bifenthrin
orientation	Orientation	Azimuth orientation of sensor platform	\N	http://vocabulary.odm2.org/variablename/orientation
heightAboveSeaFloor	height, above sea floor	Vertical distance from the sea floor to a point.	\N	http://vocabulary.odm2.org/variablename/heightAboveSeaFloor
carbonTetrachloride	Carbon tetrachloride	Carbon tetrachloride (CCl4)	\N	http://vocabulary.odm2.org/variablename/carbonTetrachloride
rainfallRate	Rainfall rate	A measure of the intensity of rainfall, calculated as the depth of water to fall over a given time period if the intensity were to remain constant over that time interval (in/hr, mm/hr, etc)	\N	http://vocabulary.odm2.org/variablename/rainfallRate
pentachlorobenzene	Pentachlorobenzene	Pentachlorobenzene (C6HCl5)	\N	http://vocabulary.odm2.org/variablename/pentachlorobenzene
nitrogenNitrite_NO2_Nitrate_NO3	Nitrogen, nitrite (NO2) + nitrate (NO3)	Nitrite (NO2) + Nitrate (NO3) Nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenNitrite_NO2_Nitrate_NO3
zincTotal	Zinc, total	Total zinc (Zn)."Total" indicates was measured on a whole water (unfiltered) sample.	\N	http://vocabulary.odm2.org/variablename/zincTotal
electricalConductivity	Electrical conductivity	Electrical conductivity	\N	http://vocabulary.odm2.org/variablename/electricalConductivity
copperTotal	Copper, total	Total copper (Cu). "Total" indicates was measured on a whole water (unfiltered) sample.	\N	http://vocabulary.odm2.org/variablename/copperTotal
1_5_Dimethylnaphthalene	1,5-Dimethylnaphthalene	1,5-Dimethylnaphthalene (C10H6(CH3)2), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_5_Dimethylnaphthalene
chromiumDistributionCoefficient	Chromium, distribution coefficient	Ratio of concentrations of chromium in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/chromiumDistributionCoefficient
respirationEcosystem	Respiration, ecosystem	Gross carbon dioxide production by all organisms in an ecosystem. Ecosystem respiration is the sum of all respiration occurring by the living organisms in a specific ecosystem.	\N	http://vocabulary.odm2.org/variablename/respirationEcosystem
radiationIncomingPAR	Radiation, incoming PAR	Incoming Photosynthetically-Active Radiation	\N	http://vocabulary.odm2.org/variablename/radiationIncomingPAR
leadParticulate	Lead, particulate	Particulate lead (Pb) in suspension	\N	http://vocabulary.odm2.org/variablename/leadParticulate
leadTotal	Lead, total	Total Lead (Pb). For chemical terms, total indicates an unfiltered sample.	\N	http://vocabulary.odm2.org/variablename/leadTotal
silicate	Silicate	Silicate. Chemical compound containing silicon, oxygen, and one or more metals, e.g., aluminum, barium, beryllium, calcium, iron, magnesium, manganese, potassium, sodium, or zirconium.	\N	http://vocabulary.odm2.org/variablename/silicate
cytosolicProtein	Cytosolic protein	The total protein concentration within the cytosolic fraction of cells. The cytosol refers to the intracellular fluid or cytoplasmic matrix of a eukaryotic cell.	\N	http://vocabulary.odm2.org/variablename/cytosolicProtein
dimethylPhthalate	Dimethyl Phthalate	Dimethyl Phthalate (C10H10O4)	\N	http://vocabulary.odm2.org/variablename/dimethylPhthalate
nitrogenDissolvedOrganic	Nitrogen, dissolved organic	Dissolved Organic Nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenDissolvedOrganic
n_Alkane_C27	n-alkane, C27	C27 alkane, normal (i.e. straight-chain) isomer, common name: n-Heptacosane, formula : C27H56	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C27
methylfluorene	Methylfluorene	Methylfluorene (C14H12)	\N	http://vocabulary.odm2.org/variablename/methylfluorene
BOD4Carbonaceous	BOD4, carbonaceous	4-day Carbonaceous Biological Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD4Carbonaceous
hexachlorocyclopentadiene	Hexachlorocyclopentadiene	Hexachlorocyclopentadiene (C5Cl6)	\N	http://vocabulary.odm2.org/variablename/hexachlorocyclopentadiene
2_4_5_Trichlorophenol	2,4,5-Trichlorophenol	2,4,5-Trichlorophenol (C6H3Cl3O)	\N	http://vocabulary.odm2.org/variablename/2_4_5_Trichlorophenol
LSI	LSI	Langelier Saturation Index is an indicator of the degree of saturation of water with respect to calcium carbonate	\N	http://vocabulary.odm2.org/variablename/LSI
1_2_Dinitrobenzene	1,2-Dinitrobenzene	1,2-Dinitrobenzene (C6H4N2O4)	\N	http://vocabulary.odm2.org/variablename/1_2_Dinitrobenzene
n_AlkaneTotal	n-alkane, total	Total alkane, normal (i.e. straight chain) isomer (isomer range of alkanes measured should be specified)	\N	http://vocabulary.odm2.org/variablename/n_AlkaneTotal
d_Limonene	d-Limonene	d-Limonene (C10H16)	\N	http://vocabulary.odm2.org/variablename/d_Limonene
temperatureTransducerSignal	Temperature, transducer signal	Temperature, raw data from sensor	\N	http://vocabulary.odm2.org/variablename/temperatureTransducerSignal
adamantane	Adamantane	Adamantane (C10H16)	\N	http://vocabulary.odm2.org/variablename/adamantane
coloredDissolvedOrganicMatter	Colored dissolved organic matter	The concentration of colored dissolved organic matter (humic substances)	\N	http://vocabulary.odm2.org/variablename/coloredDissolvedOrganicMatter
uraniumDissolved	Uranium, dissolved	Dissolved Uranium. For chemical terms, dissolved indicates a filtered sample.	\N	http://vocabulary.odm2.org/variablename/uraniumDissolved
3_6_Dimethylphenanthrene	3,6-Dimethylphenanthrene	3,6-Dimethylphenanthrene (C16H14), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/3_6_Dimethylphenanthrene
n_Alkane_C25	n-alkane, C25	C25 alkane, normal (i.e. straight-chain) isomer, common name: n-Pentacosane, formula : C25H52	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C25
radiationNetLongwave	Radiation, net longwave	Net Longwave Radiation	\N	http://vocabulary.odm2.org/variablename/radiationNetLongwave
arsenicDistributionCoefficient	Arsenic, distribution coefficient	Ratio of concentrations of arsenic in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/arsenicDistributionCoefficient
primaryProductivity	Primary productivity	Primary Productivity	\N	http://vocabulary.odm2.org/variablename/primaryProductivity
aluminumTotal	Aluminum, total	Aluminum (Al). Total indicates was measured on a whole water sample.	\N	http://vocabulary.odm2.org/variablename/aluminumTotal
chlorophyll_a_CorrectedForPheophytin	Chlorophyll a, corrected for pheophytin	Chlorphyll a corrected for pheophytin	\N	http://vocabulary.odm2.org/variablename/chlorophyll_a_CorrectedForPheophytin
waterColumnEquivalentHeightAbsolute	Water column equivalent height, absolute	The absolute pressure (combined water + barometric) on a sensor expressed as the height of an equivalent column of water.	\N	http://vocabulary.odm2.org/variablename/waterColumnEquivalentHeightAbsolute
benzo_a_pyrene	Benzo(a)pyrene	Benzo(a)pyrene (C20H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/benzo_a_pyrene
tetramethylnaphthalene	Tetramethylnaphthalene	Tetramethylnaphthalene (C10H4(CH3)4), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/tetramethylnaphthalene
sequenceNumber	Sequence number	A counter of events in a sequence	\N	http://vocabulary.odm2.org/variablename/sequenceNumber
polycyclicAromaticHydrocarbonParent	Polycyclic aromatic hydrocarbon, parent	Unsubstituted (i.e., non-alkylated) polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/polycyclicAromaticHydrocarbonParent
mevinphos	Mevinphos	Mevinphos (C7H13O6P)	\N	http://vocabulary.odm2.org/variablename/mevinphos
di_n_OctylPhthalate	Di-n-octyl phthalate	Di-n-octyl phthalate (C24H38O4)	\N	http://vocabulary.odm2.org/variablename/di_n_OctylPhthalate
timeStamp	Time Stamp	The time at which a sensor produces output	\N	http://vocabulary.odm2.org/variablename/timeStamp
silicon	Silicon	Silicon (Si)	\N	http://vocabulary.odm2.org/variablename/silicon
aluminumDissolved	Aluminum, dissolved	Dissolved Aluminum (Al)	\N	http://vocabulary.odm2.org/variablename/aluminumDissolved
tinDissolved	Tin, dissolved	Dissolved tin (Sn). "Dissolved " indicates a the measurement was made on a filtered sample.	\N	http://vocabulary.odm2.org/variablename/tinDissolved
nitrogenNitrate_NO3	Nitrogen, nitrate (NO3)	Nitrate (NO3) Nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenNitrate_NO3
spartinaAlternifloraCoverage	Spartina alterniflora coverage	Areal coverage of the plant Spartina alterniflora	\N	http://vocabulary.odm2.org/variablename/spartinaAlternifloraCoverage
endosulfan_I_Alpha	Endosulfan I (alpha)	Endosulfan I (alpha) (C9H6Cl6O3S)	\N	http://vocabulary.odm2.org/variablename/endosulfan_I_Alpha
1_2_Dichlorobenzene	1,2-Dichlorobenzene	1,2-Dichlorobenzene (C6H4Cl2)	\N	http://vocabulary.odm2.org/variablename/1_2_Dichlorobenzene
1_Ethylnaphthalene	1-Ethylnaphthalene	1-Ethylnaphthalene (C10H7C2H5), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_Ethylnaphthalene
temperatureInitial	Temperature, initial	initial temperature before heating	\N	http://vocabulary.odm2.org/variablename/temperatureInitial
streamflow	Streamflow	The volume of water flowing past a fixed point.  Equivalent to discharge	\N	http://vocabulary.odm2.org/variablename/streamflow
dibenzofuran	Dibenzofuran	Dibenzofuran (C12H8O)	\N	http://vocabulary.odm2.org/variablename/dibenzofuran
aniline	Aniline	Aniline (C6H7N)	\N	http://vocabulary.odm2.org/variablename/aniline
molybdenumTotal	Molybdenum, total	total Molybdenum (Mo). For chemical terms, total represents an unfiltered sample.	\N	http://vocabulary.odm2.org/variablename/molybdenumTotal
hardnessCarbonate	Hardness, carbonate	Carbonate hardness also known as temporary hardness	\N	http://vocabulary.odm2.org/variablename/hardnessCarbonate
magnesiumTotal	Magnesium, total	Total Magnesium (Mg)	\N	http://vocabulary.odm2.org/variablename/magnesiumTotal
bromideDissolved	Bromide, dissolved	Dissolved Bromide (Br-)	\N	http://vocabulary.odm2.org/variablename/bromideDissolved
bariumDissolved	Barium, dissolved	Dissolved Barium (Ba)	\N	http://vocabulary.odm2.org/variablename/bariumDissolved
tritium_3H_DeltaTOfH2O	Tritium (3H), Delta T of H2O	Isotope 3H of water	\N	http://vocabulary.odm2.org/variablename/tritium_3H_DeltaTOfH2O
suaedaLinearisCoverage	Suaeda linearis coverage	Areal coverage of the plant Suaeda linearis	\N	http://vocabulary.odm2.org/variablename/suaedaLinearisCoverage
anthracene	Anthracene	Anthracene (C14H10), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/anthracene
nitrogenNH3_NH4	Nitrogen, NH3 + NH4	Total (free+ionized) Ammonia	\N	http://vocabulary.odm2.org/variablename/nitrogenNH3_NH4
electricPower	Electric Power	Electric Power	\N	http://vocabulary.odm2.org/variablename/electricPower
arsenicDissolved	Arsenic, dissolved	Dissolved Arsenic. For chemical terms, dissolved represents a filtered sample.	\N	http://vocabulary.odm2.org/variablename/arsenicDissolved
glutaraldehyde	Glutaraldehyde	Glutaraldehyde (C5H8O2)	\N	http://vocabulary.odm2.org/variablename/glutaraldehyde
indicator	Indicator	Binary status to indicate the status of an instrument or other piece of equipment.	\N	http://vocabulary.odm2.org/variablename/indicator
superoxideDismutaseActivity	Superoxide dismutase, activity	Superoxide dismutase (SOD) activity	\N	http://vocabulary.odm2.org/variablename/superoxideDismutaseActivity
cryptophytes	Cryptophytes	The chlorophyll a concentration contributed by cryptophytes	\N	http://vocabulary.odm2.org/variablename/cryptophytes
sulfurDissolved	Sulfur, dissolved	Dissolved Sulfur (S)	\N	http://vocabulary.odm2.org/variablename/sulfurDissolved
leafWetness	Leaf wetness	The effect of moisture settling on the surface of a leaf as a result of either condensation or rainfall.	\N	http://vocabulary.odm2.org/variablename/leafWetness
benzo_b_fluoranthene	Benzo(b)fluoranthene	Benzo(b)fluoranthene (C20H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/benzo_b_fluoranthene
sodiumFractionOfCations	Sodium, fraction of cations	Sodium, fraction of cations	\N	http://vocabulary.odm2.org/variablename/sodiumFractionOfCations
benthos	Benthos	Benthic species	\N	http://vocabulary.odm2.org/variablename/benthos
cobaltTotal	Cobalt, total	Total Cobalt (Co)	\N	http://vocabulary.odm2.org/variablename/cobaltTotal
radium_228	Radium-228	An isotope of radium in the thorium-232 decay series	\N	http://vocabulary.odm2.org/variablename/radium_228
permittivity	Permittivity	Permittivity is a physical quantity that describes how an electric field affects, and is affected by a dielectric medium, and is determined by the ability of a material to polarize in response to the field, and thereby reduce the total electric field inside the material. Thus, permittivity relates to a material's ability to transmit (or "permit") an electric field.	\N	http://vocabulary.odm2.org/variablename/permittivity
vaporPressureDeficit	Vapor pressure deficit	The difference between the actual water vapor pressure and the saturation of water vapor pressure at a particular temperature.	\N	http://vocabulary.odm2.org/variablename/vaporPressureDeficit
zincDistributionCoefficient	Zinc, distribution coefficient	Ratio of concentrations of zinc in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/zincDistributionCoefficient
biomassPhytoplankton	Biomass, phytoplankton	Total mass of phytoplankton, per unit area or volume	\N	http://vocabulary.odm2.org/variablename/biomassPhytoplankton
pyridine	Pyridine	Pyridine (C5H5N)	\N	http://vocabulary.odm2.org/variablename/pyridine
silverTotal	Silver, total	Total Silver (Ag). For chemical terms, total represents an unfiltered sample.	\N	http://vocabulary.odm2.org/variablename/silverTotal
respirationNet	Respiration, net	Net respiration	\N	http://vocabulary.odm2.org/variablename/respirationNet
fishDetections	Fish detections	The number of fish identified by the detection equipment	\N	http://vocabulary.odm2.org/variablename/fishDetections
nitrogen_15	Nitrogen-15	15 Nitrogen, Delta Nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogen_15
tinTotal	Tin, total	Total tin (Sn)."Total" indicates was measured on a whole water (unfiltered) sample.	\N	http://vocabulary.odm2.org/variablename/tinTotal
pressureGauge	Pressure, gauge	Pressure relative to the local atmospheric or ambient pressure	\N	http://vocabulary.odm2.org/variablename/pressureGauge
temperatureChange	Temperature change	temperature change	\N	http://vocabulary.odm2.org/variablename/temperatureChange
batisMaritimaCoverage	Batis maritima Coverage	Areal coverage of the plant Batis maritima	\N	http://vocabulary.odm2.org/variablename/batisMaritimaCoverage
chrysene	Chrysene	Chrysene (C18H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/chrysene
transientSpeciesCoverage	Transient species coverage	Areal coverage of transient species	\N	http://vocabulary.odm2.org/variablename/transientSpeciesCoverage
secchiDepth	Secchi depth	Secchi depth	\N	http://vocabulary.odm2.org/variablename/secchiDepth
manganeseParticulate	Manganese, particulate	Particulate manganese (Mn) in suspension	\N	http://vocabulary.odm2.org/variablename/manganeseParticulate
isopentane	Isopentane	Isopentane	\N	http://vocabulary.odm2.org/variablename/isopentane
ethylbenzene	Ethylbenzene	Ethylbenzene (C8H10)	\N	http://vocabulary.odm2.org/variablename/ethylbenzene
methoxychlor	Methoxychlor	Methoxychlor (C16H15Cl3O2)	\N	http://vocabulary.odm2.org/variablename/methoxychlor
2_Nitrophenol	2-Nitrophenol	2-Nitrophenol (C6H5NO3)	\N	http://vocabulary.odm2.org/variablename/2_Nitrophenol
benzo_b_fluorene	Benzo(b)fluorene	Benzo(b)fluorene (C17H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/benzo_b_fluorene
barometricPressure	Barometric pressure	Barometric pressure	\N	http://vocabulary.odm2.org/variablename/barometricPressure
n_Alkane_C17	n-alkane, C17	C17 alkane, normal (i.e. straight-chain) isomer, common name: n-Heptadecane, formula : C17H36	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C17
malathion	Malathion	Butanedioic acid, [(dimethoxyphosphinothioyl)thio]-, diethyl ester (C10H19O6PS2)	\N	http://vocabulary.odm2.org/variablename/malathion
bariumParticulate	Barium, particulate	Particulate barium (Ba) in suspension	\N	http://vocabulary.odm2.org/variablename/bariumParticulate
volume	Volume	Volume. To quantify discharge or hydrograph volume or some other volume measurement.	\N	http://vocabulary.odm2.org/variablename/volume
nitrogenTotalDissolved	Nitrogen, total dissolved	Total dissolved nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenTotalDissolved
silicicAcidFlux	Silicic acid flux	Silicate acid (H4SiO4) flux	\N	http://vocabulary.odm2.org/variablename/silicicAcidFlux
waterUseDomesticWells	Water Use, Domestic wells	Water pumped by domestic wells; residents and landowners not using public supply. Nonagriculture wells.	\N	http://vocabulary.odm2.org/variablename/waterUseDomesticWells
siliconDissolved	Silicon, dissolved	Dissolved Silicon (Si)	\N	http://vocabulary.odm2.org/variablename/siliconDissolved
electricEnergy	Electric Energy	Electric Energy	\N	http://vocabulary.odm2.org/variablename/electricEnergy
windRun	Wind Run	The length of flow of air past a point over a time interval. Windspeed times the interval of time.	\N	http://vocabulary.odm2.org/variablename/windRun
lacticAcid	Lactic Acid	Lactic Acid (C3H6O3)	\N	http://vocabulary.odm2.org/variablename/lacticAcid
radiationOutgoingLongwave	Radiation, outgoing longwave	Outgoing Longwave Radiation	\N	http://vocabulary.odm2.org/variablename/radiationOutgoingLongwave
oxygen_18	Oxygen-18	18 O, Delta O	\N	http://vocabulary.odm2.org/variablename/oxygen_18
sulfurPyritic	Sulfur, pyritic	Pyritic Sulfur	\N	http://vocabulary.odm2.org/variablename/sulfurPyritic
isobutane	Isobutane	Isobutane	\N	http://vocabulary.odm2.org/variablename/isobutane
phosphorusParticulateOrganic	Phosphorus, particulate organic	Particulate organic phosphorus in suspension	\N	http://vocabulary.odm2.org/variablename/phosphorusParticulateOrganic
thalliumTotal	Thallium, total	Total thallium (Tl). "Total" indicates was measured on a whole water (unfiltered) sample.	\N	http://vocabulary.odm2.org/variablename/thalliumTotal
chlorideDissolved	Chloride, dissolved	Dissolved Chloride (Cl-)	\N	http://vocabulary.odm2.org/variablename/chlorideDissolved
offset	Offset	Constant to be added as an offset to a variable of interest.	\N	http://vocabulary.odm2.org/variablename/offset
nickelParticulate	Nickel, particulate	Particulate nickel (Ni) in suspension	\N	http://vocabulary.odm2.org/variablename/nickelParticulate
wrackCoverage	Wrack coverage	Areal coverage of dead vegetation	\N	http://vocabulary.odm2.org/variablename/wrackCoverage
sunshineDuration	Sunshine duration	Sunshine duration	\N	http://vocabulary.odm2.org/variablename/sunshineDuration
1_1_2_Trichloroethane	1,1,2-Trichloroethane	1,1,2-Trichloroethane (C2H3Cl3)	\N	http://vocabulary.odm2.org/variablename/1_1_2_Trichloroethane
cesium_137	Cesium-137	A radioactive isotope of cesium which is formed as a fission product by nuclear fission of uranium or plutonium.	\N	http://vocabulary.odm2.org/variablename/cesium_137
windGustDirection	Wind gust direction	Direction of gusts of wind	\N	http://vocabulary.odm2.org/variablename/windGustDirection
endosulfan_II_Beta	Endosulfan II (beta)	Endosulfan II (beta) (C9H6Cl6O3S)	\N	http://vocabulary.odm2.org/variablename/endosulfan_II_Beta
phosphorusOrganic	Phosphorus, organic	Organic Phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusOrganic
bromineDissolved	Bromine, dissolved	Dissolved Bromine (Br2)	\N	http://vocabulary.odm2.org/variablename/bromineDissolved
cyanide	Cyanide	Cyanide (CN)	\N	http://vocabulary.odm2.org/variablename/cyanide
percentFullScale	Percent full scale	The percent of full scale for an instrument	\N	http://vocabulary.odm2.org/variablename/percentFullScale
carbonDioxideDissolved	Carbon Dioxide, dissolved	Dissolved Carbon dioxide (CO2)	\N	http://vocabulary.odm2.org/variablename/carbonDioxideDissolved
uranium	Uranium	Uranium (U)	\N	http://vocabulary.odm2.org/variablename/uranium
phosphorusOrthophosphateTotal	Phosphorus, orthophosphate total	Total orthophosphate phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusOrthophosphateTotal
1_4_6_Trimethylnaphthalene	1,4,6-Trimethylnaphthalene	1,4,6-Trimethylnaphthalene (C10H5(CH3)3), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_4_6_Trimethylnaphthalene
titaniumDissolved	Titanium, dissolved	Dissolved Titanium	\N	http://vocabulary.odm2.org/variablename/titaniumDissolved
acidityHot	Acidity, hot	Hot Acidity	\N	http://vocabulary.odm2.org/variablename/acidityHot
acetophenone	Acetophenone	Acetophenone (C6H5C(O)CH3)	\N	http://vocabulary.odm2.org/variablename/acetophenone
tertiaryButylAlcohol	Tertiary Butyl Alcohol	Tertiary Butyl Alcohol (C4H10O)	\N	http://vocabulary.odm2.org/variablename/tertiaryButylAlcohol
aroclor_1254	Aroclor-1254	Aroclor-1254 (C12H5Cl5), a PCB mixture	\N	http://vocabulary.odm2.org/variablename/aroclor_1254
fluorideDissolved	Fluoride, dissolved	Dissolved Fluoride (F-)	\N	http://vocabulary.odm2.org/variablename/fluorideDissolved
enterococci	Enterococci	Enterococcal bacteria	\N	http://vocabulary.odm2.org/variablename/enterococci
2_Methylnaphthalene	2-Methylnaphthalene	2-Methylnaphthalene (C10H7CH3), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/2_Methylnaphthalene
4_Chloroaniline	4-Chloroaniline	4-Chloroaniline (C6H6ClN)	\N	http://vocabulary.odm2.org/variablename/4_Chloroaniline
peridinin	Peridinin	The phytoplankton pigment Peridinin	\N	http://vocabulary.odm2.org/variablename/peridinin
nickelDistributionCoefficient	Nickel, distribution coefficient	Ratio of concentrations of nickel in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/nickelDistributionCoefficient
spartinaSpartineaCoverage	Spartina spartinea coverage	Areal coverage of the plant Spartina spartinea	\N	http://vocabulary.odm2.org/variablename/spartinaSpartineaCoverage
threshold	Threshold	A level above or below which an action is performed.	\N	http://vocabulary.odm2.org/variablename/threshold
1_2_4_Trichlorobenzene	1,2,4-Trichlorobenzene	1,2,4-Trichlorobenzene (C6H3Cl3)	\N	http://vocabulary.odm2.org/variablename/1_2_4_Trichlorobenzene
bis_2_Chloroethoxy_Methane	Bis(2-chloroethoxy)methane	Bis(2-chloroethoxy)methane (C5H10Cl2O2)	\N	http://vocabulary.odm2.org/variablename/bis_2_Chloroethoxy_Methane
delta_13COfDIC	delta-13C of DIC	Isotope 13C of dissolved inorganic carbon (DIC)	\N	http://vocabulary.odm2.org/variablename/delta_13COfDIC
color	Color	Color in quantified in color units	\N	http://vocabulary.odm2.org/variablename/color
propyleneGlycol	Propylene glycol	Propylene glycol (C3H8O2)	\N	http://vocabulary.odm2.org/variablename/propyleneGlycol
1_NaphthalenolMethylcarbamate	1-Naphthalenol methylcarbamate	1-Naphthalenol methylcarbamate (C12H11NO2)	\N	http://vocabulary.odm2.org/variablename/1_NaphthalenolMethylcarbamate
strontiumDissolved	Strontium, dissolved	Dissolved Strontium (Sr)	\N	http://vocabulary.odm2.org/variablename/strontiumDissolved
pentane	Pentane	Pentane	\N	http://vocabulary.odm2.org/variablename/pentane
loggerStopped	Logger stopped	A categorical variable indicating that a logger was told to stop recording data. This is used for quality control.	\N	http://vocabulary.odm2.org/variablename/loggerStopped
radiationIncomingUV_A	Radiation, incoming UV-A	Incoming Ultraviolet A Radiation	\N	http://vocabulary.odm2.org/variablename/radiationIncomingUV_A
carbonTotal	Carbon, total	Total (Dissolved+Particulate) Carbon	\N	http://vocabulary.odm2.org/variablename/carbonTotal
carbonToNitrogenMassRatio	Carbon to nitrogen mass ratio	Carbon to nitrogen (C:N) mass ratio	\N	http://vocabulary.odm2.org/variablename/carbonToNitrogenMassRatio
waterVaporConcentration	Water vapor concentration	Water vapor concentration	\N	http://vocabulary.odm2.org/variablename/waterVaporConcentration
ironSulfide	Iron sulfide	Iron sulfide (FeS2)	\N	http://vocabulary.odm2.org/variablename/ironSulfide
nitrogenOrganic	Nitrogen, organic	Organic Nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenOrganic
batteryTemperature	Battery temperature	The battery temperature of a datalogger or sensing system	\N	http://vocabulary.odm2.org/variablename/batteryTemperature
primaryProductivityGross	Primary productivity, gross	Rate at which an ecosystem accumulates energy by fixation of sunlight, including that consumed by the ecosystem.	\N	http://vocabulary.odm2.org/variablename/primaryProductivityGross
oxygenUptake	Oxygen uptake	Consumption of oxygen by biological and/or chemical processes	\N	http://vocabulary.odm2.org/variablename/oxygenUptake
1_6_7_Trimethylnaphthalene	1,6,7-Trimethylnaphthalene	1,6,7-Trimethylnaphthalene (C10H5(CH3)3), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_6_7_Trimethylnaphthalene
alkalinityCarbonate	Alkalinity, carbonate	Carbonate Alkalinity	\N	http://vocabulary.odm2.org/variablename/alkalinityCarbonate
fluorineDissolved	Fluorine, dissolved	Dissolved Fluorine (F2)	\N	http://vocabulary.odm2.org/variablename/fluorineDissolved
trans_1_2_Dichloroethene	trans-1,2-Dichloroethene	trans-1,2-Dichloroethene (C2H2Cl2)	\N	http://vocabulary.odm2.org/variablename/trans_1_2_Dichloroethene
reservoirStorage	Reservoir storage	Reservoir water volume	\N	http://vocabulary.odm2.org/variablename/reservoirStorage
diallate_CisOrTrans	Diallate (cis or trans)	Diallate (cis or trans) (C10H17Cl2NOS)	\N	http://vocabulary.odm2.org/variablename/diallate_CisOrTrans
2_4_Dinitrotoluene	2,4-Dinitrotoluene	2,4-Dinitrotoluene (C7H6N2O4)	\N	http://vocabulary.odm2.org/variablename/2_4_Dinitrotoluene
9_10_Dimethylanthracene	9,10-Dimethylanthracene	9,10-Dimethylanthracene (C16H14), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/9_10_Dimethylanthracene
methanol	Methanol	Methanol (CH3OH)	\N	http://vocabulary.odm2.org/variablename/methanol
sodiumPlusPotassium	Sodium plus potassium	Sodium plus potassium	\N	http://vocabulary.odm2.org/variablename/sodiumPlusPotassium
ironFerric	Iron, ferric	Ferric Iron (Fe+3)	\N	http://vocabulary.odm2.org/variablename/ironFerric
perylene	Perylene	Perylene (C20H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/perylene
diethyleneGlycol	Diethylene glycol	Diethylene glycol (C4H10O3)	\N	http://vocabulary.odm2.org/variablename/diethyleneGlycol
nitrogenTotalNitrite	Nitrogen, total nitrite	Total nitrite (NO2)	\N	http://vocabulary.odm2.org/variablename/nitrogenTotalNitrite
N_Nitrosodiethylamine	N-Nitrosodiethylamine	N-Nitrosodiethylamine (C4H10N2O)	\N	http://vocabulary.odm2.org/variablename/N_Nitrosodiethylamine
diethylPhthalate	Diethyl phthalate	Diethyl phthalate (C12H14O4)	\N	http://vocabulary.odm2.org/variablename/diethylPhthalate
methylmercury	Methylmercury	Methylmercury (CH3Hg)	\N	http://vocabulary.odm2.org/variablename/methylmercury
sigma_t	Sigma-t	Density of seawater calculated with in situ salinity and temperature, but pressure equal to zero, rather than the in situ pressure, and 1000 kg/m^3 is subtracted. Defined as (S,T)-1000 kg m-3, where (S,T) is the density of a sample of seawater at temperature T and salinity S, measured in kg m-3, at standard atmospheric pressure.	\N	http://vocabulary.odm2.org/variablename/sigma_t
urea	Urea	Urea ((NH2)2CO)	\N	http://vocabulary.odm2.org/variablename/urea
thorium_230	Thorium-230	An isotope of thorium in the thorium-232 decay series	\N	http://vocabulary.odm2.org/variablename/thorium_230
carbonSuspendedOrganic	Carbon, suspended organic	DEPRECATED -- The use of this term is discouraged in favor of the use of the synonymous term "Carbon, particulate organic".	\N	http://vocabulary.odm2.org/variablename/carbonSuspendedOrganic
cadmiumDissolved	Cadmium, dissolved	Dissolved Cadmium. For chemical terms, "dissolved" indicates a filtered sample.	\N	http://vocabulary.odm2.org/variablename/cadmiumDissolved
blue_GreenAlgae_Cyanobacteria_Phycocyanin	Blue-green algae (cyanobacteria), phycocyanin	Blue-green algae (cyanobacteria) with phycocyanin pigments	\N	http://vocabulary.odm2.org/variablename/blue_GreenAlgae_Cyanobacteria_Phycocyanin
waterUseAgriculture	Water Use, Agriculture	Water pumped for Agriculture	\N	http://vocabulary.odm2.org/variablename/waterUseAgriculture
distance	Distance	Distance measured from a sensor to a target object such as the surface of a water body or snow surface.	\N	http://vocabulary.odm2.org/variablename/distance
cyclohexane	Cyclohexane	Cyclohexane (C6H6Cl6)	\N	http://vocabulary.odm2.org/variablename/cyclohexane
manganeseTotal	Manganese, total	Total manganese (Mn). "Total" indicates was measured on a whole water (unfiltered) sample.	\N	http://vocabulary.odm2.org/variablename/manganeseTotal
sulfideDissolved	Sulfide, dissolved	Dissolved Sulfide	\N	http://vocabulary.odm2.org/variablename/sulfideDissolved
sulfur	Sulfur	Sulfur (S)	\N	http://vocabulary.odm2.org/variablename/sulfur
monanthochloeLittoralisCoverage	Monanthochloe littoralis Coverage	Areal coverage of the plant Monanthochloe littoralis	\N	http://vocabulary.odm2.org/variablename/monanthochloeLittoralisCoverage
3_Nitroaniline	3-Nitroaniline	3-Nitroaniline (C6H6N2O2)	\N	http://vocabulary.odm2.org/variablename/3_Nitroaniline
4_Chloro_3_Methylphenol	4-Chloro-3-methylphenol	4-Chloro-3-methylphenol (C7H7ClO)	\N	http://vocabulary.odm2.org/variablename/4_Chloro_3_Methylphenol
2_Methylphenanthrene	2-Methylphenanthrene	2-Methylphenanthrene (C15H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/2_Methylphenanthrene
2_6_Dinitrotoluene	2,6-Dinitrotoluene	2,6-Dinitrotoluene (C7H6N2O4)	\N	http://vocabulary.odm2.org/variablename/2_6_Dinitrotoluene
piperonylButoxide	Piperonyl Butoxide	Piperonyl Butoxide (C19H30O5)	\N	http://vocabulary.odm2.org/variablename/piperonylButoxide
remark	Remark	Manually added comment field to provide additional information about a particular record.	\N	http://vocabulary.odm2.org/variablename/remark
alkalinityBicarbonate	Alkalinity, bicarbonate	Bicarbonate Alkalinity	\N	http://vocabulary.odm2.org/variablename/alkalinityBicarbonate
isopropylbenzene	Isopropylbenzene	Isopropylbenzene (C9H12)	\N	http://vocabulary.odm2.org/variablename/isopropylbenzene
butane	Butane	Butane	\N	http://vocabulary.odm2.org/variablename/butane
1_3_Dimethyladamantane	1,3-Dimethyladamantane	1,3-Dimethyladamantane (C12H20).	\N	http://vocabulary.odm2.org/variablename/1_3_Dimethyladamantane
temperatureDatalogger	Temperature, datalogger	Temperature, raw data from datalogger	\N	http://vocabulary.odm2.org/variablename/temperatureDatalogger
carbonDissolvedInorganic	Carbon, dissolved inorganic	Dissolved Inorganic Carbon	\N	http://vocabulary.odm2.org/variablename/carbonDissolvedInorganic
4_6_Dinitro_2_Methylphenol	4,6-Dinitro-2-methylphenol	4,6-Dinitro-2-methylphenol (C7H6N2O5)	\N	http://vocabulary.odm2.org/variablename/4_6_Dinitro_2_Methylphenol
phosphorodithioicAcid	Phosphorodithioic acid	Phosphorodithioic acid (C10N12N3O3PS2)	\N	http://vocabulary.odm2.org/variablename/phosphorodithioicAcid
alloxanthin	Alloxanthin	The phytoplankton pigment Alloxanthin	\N	http://vocabulary.odm2.org/variablename/alloxanthin
berylliumDissolved	Beryllium, dissolved	Dissolved Beryllium (Be) . For chemical terms, "dissolved"indicates a filtered sample.	\N	http://vocabulary.odm2.org/variablename/berylliumDissolved
ruthenium_106	Ruthenium-106	The most stable isotope of ruthenium with a half life of 373.59 days.	\N	http://vocabulary.odm2.org/variablename/ruthenium_106
carbonDioxideStorageFlux	Carbon dioxide storage flux	Carbon dioxide (CO2) storage flux	\N	http://vocabulary.odm2.org/variablename/carbonDioxideStorageFlux
nitrogenParticulateOrganic	Nitrogen, particulate organic	Particulate Organic Nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenParticulateOrganic
1_4_5_8_Tetramethylnaphthalene	1,4,5,8-Tetramethylnaphthalene	1,4,5,8-Tetramethylnaphthalene (C14H16), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_4_5_8_Tetramethylnaphthalene
heatIndex	Heat index	The combination effect of heat and humidity on the temperature felt by people.	\N	http://vocabulary.odm2.org/variablename/heatIndex
evaporation	Evaporation	Evaporation	\N	http://vocabulary.odm2.org/variablename/evaporation
n_Alkane_C24	n-alkane, C24	C24 alkane, normal (i.e. straight-chain) isomer, common name: n-Tetracosane, formula : C24H50	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C24
acenaphthylene	Acenaphthylene	Acenaphthylene (C12H8), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/acenaphthylene
ironTotal	Iron, total	Total Iron (Fe)	\N	http://vocabulary.odm2.org/variablename/ironTotal
1_4_Dinitrobenzene	1,4-Dinitrobenzene	1,4-Dinitrobenzene (C6H4N2O4)	\N	http://vocabulary.odm2.org/variablename/1_4_Dinitrobenzene
ethylene	Ethylene	Ethylene (C2H4)	\N	http://vocabulary.odm2.org/variablename/ethylene
tetrahydrofuran	Tetrahydrofuran	Tetrahydrofuran (C4H8O)	\N	http://vocabulary.odm2.org/variablename/tetrahydrofuran
solidsTotalSuspended	Solids, total suspended	Total Suspended Solids	\N	http://vocabulary.odm2.org/variablename/solidsTotalSuspended
carbonTotalSolidPhase	Carbon, total solid phase	Total solid phase carbon	\N	http://vocabulary.odm2.org/variablename/carbonTotalSolidPhase
carbonTotalOrganic	Carbon, total organic	Total (Dissolved+Particulate) Organic Carbon	\N	http://vocabulary.odm2.org/variablename/carbonTotalOrganic
4_Nitrophenol	4-Nitrophenol	4-Nitrophenol (C6H5NO3)	\N	http://vocabulary.odm2.org/variablename/4_Nitrophenol
terbufos	Terbufos	Terbufos (C9H21O2PS3)	\N	http://vocabulary.odm2.org/variablename/terbufos
phosphorusDissolved	Phosphorus, dissolved	Dissolved Phosphorus (P)	\N	http://vocabulary.odm2.org/variablename/phosphorusDissolved
2_3_5_Trimethylnaphthalene	2,3,5-Trimethylnaphthalene	2,3,5-Trimethylnaphthalene (C13H14), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/2_3_5_Trimethylnaphthalene
hosphorusPhosphateFlux	Phosphorus, phosphate flux	Phosphate (PO4) flux	\N	http://vocabulary.odm2.org/variablename/hosphorusPhosphateFlux
o_Xylene	o-Xylene	o-Xylene (C8H10)	\N	http://vocabulary.odm2.org/variablename/o_Xylene
carbonMonoxideDissolved	Carbon monoxide, dissolved	Dissolved carbon monoxide (CO)	\N	http://vocabulary.odm2.org/variablename/carbonMonoxideDissolved
pentachlorophenol	Pentachlorophenol	Pentachlorophenol (C6HCl5O)	\N	http://vocabulary.odm2.org/variablename/pentachlorophenol
formate	Formate	Formate	\N	http://vocabulary.odm2.org/variablename/formate
4_ChlorophenylphenylEther	4-Chlorophenylphenyl ether	4-Chlorophenylphenyl ether (C12H9ClO)	\N	http://vocabulary.odm2.org/variablename/4_ChlorophenylphenylEther
oxygen_18_StableIsotopeRatioDelta	Oxygen-18, stable isotope ratio delta	Difference in the 18O:16O ratio between the sample and standard	\N	http://vocabulary.odm2.org/variablename/oxygen_18_StableIsotopeRatioDelta
pronamide	Pronamide	Pronamide (C12H11Cl2NO)	\N	http://vocabulary.odm2.org/variablename/pronamide
radiationNetShortwave	Radiation, net shortwave	Net Shortwave radiation	\N	http://vocabulary.odm2.org/variablename/radiationNetShortwave
manganeseDissolved	Manganese, dissolved	Dissolved Manganese (Mn)	\N	http://vocabulary.odm2.org/variablename/manganeseDissolved
frequencyOfRotation	Frequency of Rotation	Number of rotations within a time period	\N	http://vocabulary.odm2.org/variablename/frequencyOfRotation
solidsTotalVolatile	Solids, total volatile	Total Volatile Solids	\N	http://vocabulary.odm2.org/variablename/solidsTotalVolatile
waterUseCommercialIndustrialPower	Water Use, Commercial + Industrial + Power	Water pumped by commercial, industrial users.	\N	http://vocabulary.odm2.org/variablename/waterUseCommercialIndustrialPower
antimonyParticulate	Antimony, particulate	Particulate antimony (Sb) in suspension	\N	http://vocabulary.odm2.org/variablename/antimonyParticulate
deuterium	Deuterium	Deuterium (2H), Delta D	\N	http://vocabulary.odm2.org/variablename/deuterium
delta_13COfC2H6	delta-13C of C2H6	Isotope 13C of ethane	\N	http://vocabulary.odm2.org/variablename/delta_13COfC2H6
sulfurOrganic	Sulfur, organic	Organic Sulfur	\N	http://vocabulary.odm2.org/variablename/sulfurOrganic
grossBetaRadionuclides	Gross beta radionuclides	Gross Beta Radionuclides	\N	http://vocabulary.odm2.org/variablename/grossBetaRadionuclides
argon	Argon	Argon	\N	http://vocabulary.odm2.org/variablename/argon
baseflow	Baseflow	The portion of streamflow (discharge) that is supplied by groundwater sources.	\N	http://vocabulary.odm2.org/variablename/baseflow
disulfoton	Disulfoton	Disulfoton (C8H19O2PS3)	\N	http://vocabulary.odm2.org/variablename/disulfoton
diatoxanthin	Diatoxanthin	The phytoplankton pigment Diatoxanthin	\N	http://vocabulary.odm2.org/variablename/diatoxanthin
waveHeight	Wave height	The height of a surface wave, measured as the difference in elevation between the wave crest and an adjacent trough.	\N	http://vocabulary.odm2.org/variablename/waveHeight
ozone	Ozone	Ozone (O3)	\N	http://vocabulary.odm2.org/variablename/ozone
hydrogenDissolved	Hydrogen, dissolved	Dissolved Hydrogen	\N	http://vocabulary.odm2.org/variablename/hydrogenDissolved
chlorobenzilate	Chlorobenzilate	Chlorobenzilate (C16H14Cl2O3)	\N	http://vocabulary.odm2.org/variablename/chlorobenzilate
isobutyricAcid	Isobutyric acid	Isobutyric acid (C4H8O2)	\N	http://vocabulary.odm2.org/variablename/isobutyricAcid
latentHeatFlux	Latent heat flux	Latent Heat Flux	\N	http://vocabulary.odm2.org/variablename/latentHeatFlux
groundHeatFlux	Ground heat flux	Ground heat flux	\N	http://vocabulary.odm2.org/variablename/groundHeatFlux
realDielectricConstant	Real dielectric constant	Soil reponse of a reflected standing electromagnetic wave of a particular frequency which is related to the stored energy within the medium. This is the real portion of the complex dielectric constant.	\N	http://vocabulary.odm2.org/variablename/realDielectricConstant
polycyclicAromaticHydrocarbonAlkyl	Polycyclic aromatic hydrocarbon, alkyl	Polycyclic aromatic hydrocarbon (PAH) having at least one alkyl sidechain (methyl, ethyl or other alkyl group) attached to the aromatic ring structure	\N	http://vocabulary.odm2.org/variablename/polycyclicAromaticHydrocarbonAlkyl
hydrogen	Hydrogen	Hydrogen	\N	http://vocabulary.odm2.org/variablename/hydrogen
endOfFile	End of file	A categorical variable marking the end of a data file. This is used for quality control.	\N	http://vocabulary.odm2.org/variablename/endOfFile
styrene	Styrene	Styrene (C8H8)	\N	http://vocabulary.odm2.org/variablename/styrene
1_1_2_2_Tetrachloroethane	1,1,2,2-Tetrachloroethane	1,1,2,2-Tetrachloroethane (C2H2Cl4)	\N	http://vocabulary.odm2.org/variablename/1_1_2_2_Tetrachloroethane
windDirection	Wind direction	Wind direction	\N	http://vocabulary.odm2.org/variablename/windDirection
2_Nitroaniline	2-Nitroaniline	2-Nitroaniline (C6H6N2O2)	\N	http://vocabulary.odm2.org/variablename/2_Nitroaniline
carbonDioxide	Carbon dioxide	Carbon dioxide	\N	http://vocabulary.odm2.org/variablename/carbonDioxide
4_Methylchrysene	4-Methylchrysene	4-Methylchrysene (C19H14), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/4_Methylchrysene
4_BromophenylphenylEther	4-Bromophenylphenyl ether	4-Bromophenylphenyl ether (C12H9BrO)	\N	http://vocabulary.odm2.org/variablename/4_BromophenylphenylEther
SUVA254	SUVA254	Specific ultraviolet absorbance at 254 nm. Determined by absorbance normalized to DOC concentration.	\N	http://vocabulary.odm2.org/variablename/SUVA254
frictionVelocity	Friction velocity	Friction velocity	\N	http://vocabulary.odm2.org/variablename/frictionVelocity
luminousFlux	Luminous Flux	A measure of the total amount of visible light present	\N	http://vocabulary.odm2.org/variablename/luminousFlux
THSWIndex	THSW Index	The THSW Index uses temperature, humidity, solar radiation, and wind speed to calculate an apparent temperature.	\N	http://vocabulary.odm2.org/variablename/THSWIndex
4_4_Methylenebis_2_Chloroaniline	4,4-Methylenebis(2-chloroaniline)	4,4'-Methylenebis(2-chloroaniline) (C13H12Cl2N2)	\N	http://vocabulary.odm2.org/variablename/4_4_Methylenebis_2_Chloroaniline
dinoflagellates	Dinoflagellates	The chlorophyll a concentration contributed by Dinoflagellates	\N	http://vocabulary.odm2.org/variablename/dinoflagellates
aroclor_1016	Aroclor-1016	Aroclor-1016 (C24H13Cl7), a PCB mixture	\N	http://vocabulary.odm2.org/variablename/aroclor_1016
2_7_Dimethylnaphthalene	2,7-Dimethylnaphthalene	2,7-Dimethylnaphthalene (C10H6(CH3)2), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/2_7_Dimethylnaphthalene
glutathione_S_TransferaseDeltaCycleThreshold	Glutathione S-transferase, delta cycle threshold	Delta cycle threshold for glutathione S-transferase (gst). Cycle threshold is the PCR cycle number at which the fluorescent signal of the gene being amplified crosses the set threshold. Delta cycle threshold for gst is the difference between the cycle threshold (Ct) of gst gene expression and the cycle threshold (Ct) for the gene expression of the reference gene (e.g., beta-actin).	\N	http://vocabulary.odm2.org/variablename/glutathione_S_TransferaseDeltaCycleThreshold
waterPotential	Water potential	Water potential is the potential energy of water relative to pure free water (e.g. deionized water) in reference conditions. It quantifies the tendency of water to move from one area to another due to osmosis, gravity, mechanical pressure, or matrix effects including surface tension.	\N	http://vocabulary.odm2.org/variablename/waterPotential
heptachlor	Heptachlor	Heptachlor (C10H5Cl7)	\N	http://vocabulary.odm2.org/variablename/heptachlor
phosphorusInorganic	Phosphorus, inorganic	Inorganic Phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusInorganic
n_Alkane_C21	n-alkane, C21	C21 alkane, normal (i.e. straight-chain) isomer, common name: n-Henicosane, formula : C21H44.	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C21
borrichiaFrutescensCoverage	Borrichia frutescens Coverage	Areal coverage of the plant Borrichia frutescens	\N	http://vocabulary.odm2.org/variablename/borrichiaFrutescensCoverage
delta_DOfH2O	delta-D of H2O	hydrogen isotopes of water	\N	http://vocabulary.odm2.org/variablename/delta_DOfH2O
BOD2Carbonaceous	BOD2, carbonaceous	2-day Carbonaceous Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD2Carbonaceous
1_Methylfluorene	1-Methylfluorene	1-Methylfluorene (C14H12), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_Methylfluorene
pressureAbsolute	Pressure, absolute	Pressure	\N	http://vocabulary.odm2.org/variablename/pressureAbsolute
ethyleneDissolved	Ethylene, dissolved	Dissolved ethylene	\N	http://vocabulary.odm2.org/variablename/ethyleneDissolved
uranium_235	Uranium-235	An isotope of uranium that can sustain fission chain reaction	\N	http://vocabulary.odm2.org/variablename/uranium_235
sulfurDioxide	Sulfur dioxide	Sulfur dioxide (SO2)	\N	http://vocabulary.odm2.org/variablename/sulfurDioxide
aluminumParticulate	Aluminum, particulate	Particulate aluminum in suspension	\N	http://vocabulary.odm2.org/variablename/aluminumParticulate
molbydenumDissolved	Molbydenum, dissolved	Dissolved Molbydenum (Mo). For chemical terms, dissolved indicates a filtered sample.	\N	http://vocabulary.odm2.org/variablename/molbydenumDissolved
phytoplankton	Phytoplankton	Measurement of phytoplankton with no differentiation between species	\N	http://vocabulary.odm2.org/variablename/phytoplankton
radiationIncomingLongwave	Radiation, incoming longwave	Incoming Longwave Radiation	\N	http://vocabulary.odm2.org/variablename/radiationIncomingLongwave
waterUsePublicSupply	Water Use, Public Supply	Water supplied by a public utility	\N	http://vocabulary.odm2.org/variablename/waterUsePublicSupply
BODuNitrogenous	BODu, nitrogenous	Nitrogenous Ultimate Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BODuNitrogenous
hexachlorobutadiene	Hexachlorobutadiene	Hexachlorobutadiene (C4Cl6)	\N	http://vocabulary.odm2.org/variablename/hexachlorobutadiene
trifluralin	Trifluralin	Trifluralin (C13H16F3N3O4)	\N	http://vocabulary.odm2.org/variablename/trifluralin
nitrogen_NH4	Nitrogen, NH4	Ammonium (NH4)	\N	http://vocabulary.odm2.org/variablename/nitrogen_NH4
3_3_Dichlorobenzidine	3,3-Dichlorobenzidine	3,3-Dichlorobenzidine (C12H10Cl2N2)	\N	http://vocabulary.odm2.org/variablename/3_3_Dichlorobenzidine
nitrogenTotalKjeldahl	Nitrogen, total kjeldahl	Total Kjeldahl Nitrogen (Ammonia+Organic)	\N	http://vocabulary.odm2.org/variablename/nitrogenTotalKjeldahl
ironParticulate	Iron, particulate	Particulate iron (Fe) in suspension	\N	http://vocabulary.odm2.org/variablename/ironParticulate
snowWaterEquivalent	Snow water equivalent	The depth of water if a snow cover is completely melted, expressed in units of depth, on a corresponding horizontal surface area.	\N	http://vocabulary.odm2.org/variablename/snowWaterEquivalent
agencyCode	Agency code	Code for the agency which analyzed the sample	\N	http://vocabulary.odm2.org/variablename/agencyCode
hardnessMagnesium	Hardness, Magnesium	Hardness of magnesium	\N	http://vocabulary.odm2.org/variablename/hardnessMagnesium
dimethylphenanthrene	Dimethylphenanthrene	Dimethylphenanthrene (C16H14)	\N	http://vocabulary.odm2.org/variablename/dimethylphenanthrene
velocity	Velocity	The velocity of a substance, fluid or object	\N	http://vocabulary.odm2.org/variablename/velocity
nitrogenGas	Nitrogen, gas	Gaseous Nitrogen (N2)	\N	http://vocabulary.odm2.org/variablename/nitrogenGas
radium_226	Radium-226	An isotope of radium in the uranium-238 decay series	\N	http://vocabulary.odm2.org/variablename/radium_226
chlorophyllFluorescence	Chlorophyll fluorescence	Chlorophyll Fluorescence	\N	http://vocabulary.odm2.org/variablename/chlorophyllFluorescence
chromium_III	Chromium (III)	Trivalent Chromium	\N	http://vocabulary.odm2.org/variablename/chromium_III
trichloroethene	Trichloroethene	Trichloroethene (C2HCl3)	\N	http://vocabulary.odm2.org/variablename/trichloroethene
seleniumDistributionCoefficient	Selenium, distribution coefficient	Ratio of concentrations of selenium in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/seleniumDistributionCoefficient
n_Alkane_C28	n-alkane, C28	C28 alkane, normal (i.e. straight-chain) isomer, common name: n-Octacosane, formula : C28H58	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C28
waterVaporDensity	Water vapor density	Water vapor density	\N	http://vocabulary.odm2.org/variablename/waterVaporDensity
n_Alkane_C26	n-alkane, C26	C26 alkane, normal (i.e. straight-chain) isomer, common name: n-Hexacosane, formula : C26H54, synonyms: cerane, hexeikosane	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C26
watchdogErrorCount	Watchdog error count	A counter which counts the number of total datalogger watchdog errors	\N	http://vocabulary.odm2.org/variablename/watchdogErrorCount
oxygenFlux	Oxygen flux	Oxygen (O2) flux	\N	http://vocabulary.odm2.org/variablename/oxygenFlux
oxygenDissolvedPercentOfSaturation	Oxygen, dissolved percent of saturation	Dissolved oxygen, percent saturation	\N	http://vocabulary.odm2.org/variablename/oxygenDissolvedPercentOfSaturation
thalliumDistributionCoefficient	Thallium, distribution coefficient	Ratio of concentrations of thallium in two phases in equilibrium with each other. Phases must be specified.	\N	http://vocabulary.odm2.org/variablename/thalliumDistributionCoefficient
solidsTotalDissolved	Solids, total dissolved	Total Dissolved Solids	\N	http://vocabulary.odm2.org/variablename/solidsTotalDissolved
taxaCount	Taxa count	Count of unique taxa. A taxon (plural: taxa) is a group of one (or more) populations of organism(s), which is judged to be a unit.	\N	http://vocabulary.odm2.org/variablename/taxaCount
endrin	Endrin	Endrin (C12H8Cl6O)	\N	http://vocabulary.odm2.org/variablename/endrin
vanadiumDissolved	Vanadium, dissolved	Dissolved vanadium (V). "Dissolved" indicates the measurement was made on a filtered sample.	\N	http://vocabulary.odm2.org/variablename/vanadiumDissolved
osmoticPressure	Osmotic pressure	Osmotic pressure	\N	http://vocabulary.odm2.org/variablename/osmoticPressure
4_4_DDD	4,4-DDD	Dichlorodiphenyldichloroethane (C14H10Cl4)	\N	http://vocabulary.odm2.org/variablename/4_4_DDD
4_4_DDE	4,4-DDE	Dichlorodiphenyldichloroethylene (C14H8Cl4)	\N	http://vocabulary.odm2.org/variablename/4_4_DDE
isopropylAlcohol	Isopropyl alcohol	Isopropyl alcohol (C3H8O)	\N	http://vocabulary.odm2.org/variablename/isopropylAlcohol
permethrin	Permethrin	Permethrin (C21H20Cl2O3)	\N	http://vocabulary.odm2.org/variablename/permethrin
N_Nitrosodi_n_Butylamine	N-Nitrosodi-n-butylamine	N-Nitrosodi-n-butylamine (C8H18N2O)	\N	http://vocabulary.odm2.org/variablename/N_Nitrosodi_n_Butylamine
chlorophyll_c	Chlorophyll c	Chlorophyll c	\N	http://vocabulary.odm2.org/variablename/chlorophyll_c
solidsRixedDissolved	Solids, fixed dissolved	Fixed Dissolved Solids	\N	http://vocabulary.odm2.org/variablename/solidsRixedDissolved
solidsTotalFixed	Solids, total fixed	Total Fixed Solids	\N	http://vocabulary.odm2.org/variablename/solidsTotalFixed
phenol	Phenol	Phenol (C6H5OH)	\N	http://vocabulary.odm2.org/variablename/phenol
chlorideTotal	Chloride, total	Total Chloride (Cl-)	\N	http://vocabulary.odm2.org/variablename/chlorideTotal
programSignature	Program signature	A unique data recorder program identifier which is useful for knowing when the source code in the data recorder has been modified.	\N	http://vocabulary.odm2.org/variablename/programSignature
tributoxyethylPhosphate	Tributoxyethyl phosphate	Tributoxyethyl phosphate (C42H87O13P)	\N	http://vocabulary.odm2.org/variablename/tributoxyethylPhosphate
thorium_232	Thorium-232	A radioactive isotope of thorium which undergoes alpha decay	\N	http://vocabulary.odm2.org/variablename/thorium_232
microsomalProtein	Microsomal protein	The total protein concentration within the microsomal fraction of cells. Microsomes refer to vesicle-like artifacts reformed from pieces of endoplasmic reticulum when eukaryotic cells are broken up in a laboratory.	\N	http://vocabulary.odm2.org/variablename/microsomalProtein
organicMatter	Organic matter	The organic matter component of a complex material.	\N	http://vocabulary.odm2.org/variablename/organicMatter
boronTotal	Boron, total	Total Boron (B)	\N	http://vocabulary.odm2.org/variablename/boronTotal
butylbenzylphthalate	Butylbenzylphthalate	Butylbenzylphthalate (C19H20O4)	\N	http://vocabulary.odm2.org/variablename/butylbenzylphthalate
vaporPressure	Vapor pressure	The pressure of a vapor in equilibrium with its non-vapor phases	\N	http://vocabulary.odm2.org/variablename/vaporPressure
ethyleneGlycol	Ethylene glycol	Ethlene Glycol (C2H4(OH)2)	\N	http://vocabulary.odm2.org/variablename/ethyleneGlycol
methane	Methane	Methane (CH4)	\N	http://vocabulary.odm2.org/variablename/methane
bromoform	Bromoform	Bromoform (CHBr3), a haloform	\N	http://vocabulary.odm2.org/variablename/bromoform
NDVI	NDVI	Normalized difference vegetation index	\N	http://vocabulary.odm2.org/variablename/NDVI
uranium_238	Uranium-238	Uranium's most common isotope	\N	http://vocabulary.odm2.org/variablename/uranium_238
salicorniaBigeloviiCoverage	Salicornia bigelovii coverage	Areal coverage of the plant Salicornia bigelovii	\N	http://vocabulary.odm2.org/variablename/salicorniaBigeloviiCoverage
zirconium_95	Zirconium-95	A radioactive isotope of zirconium with a half-life of 63 days	\N	http://vocabulary.odm2.org/variablename/zirconium_95
delta_DOfCH4	delta-D of CH4	hydrogen isotopes of methane	\N	http://vocabulary.odm2.org/variablename/delta_DOfCH4
1_6_Dimethylnaphthalene	1,6-Dimethylnaphthalene	1,6-Dimethylnaphthalene (C10H6(CH3)2), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/1_6_Dimethylnaphthalene
imaginaryDielectricConstant	Imaginary dielectric constant	Soil reponse of a reflected standing electromagnetic wave of a particular frequency which is related to the dissipation (or loss) of energy within the medium. This is the imaginary portion of the complex dielectric constant.	\N	http://vocabulary.odm2.org/variablename/imaginaryDielectricConstant
antimonyDissolved	Antimony, dissolved	Dissolved antimony (Sb)."Dissolved" indicates measurement was on a filtered sample.	\N	http://vocabulary.odm2.org/variablename/antimonyDissolved
carbonDissolvedTotal	Carbon, dissolved total	Dissolved Total (Organic+Inorganic) Carbon	\N	http://vocabulary.odm2.org/variablename/carbonDissolvedTotal
recorderCode	Recorder code	A code used to identifier a data recorder.	\N	http://vocabulary.odm2.org/variablename/recorderCode
turbidity	Turbidity	Turbidity	\N	http://vocabulary.odm2.org/variablename/turbidity
nitrogen_15_StableIsotopeRatioDelta	Nitrogen-15, stable isotope ratio delta	Difference in the 15N:14N ratio between the sample and standard (del N 15)	\N	http://vocabulary.odm2.org/variablename/nitrogen_15_StableIsotopeRatioDelta
sulfateDissolved	Sulfate, dissolved	Dissolved Sulfate (SO4)	\N	http://vocabulary.odm2.org/variablename/sulfateDissolved
nickelDissolved	Nickel, dissolved	Dissolved Nickel (Ni)	\N	http://vocabulary.odm2.org/variablename/nickelDissolved
copperDissolved	Copper, dissolved	Dissolved Copper (Cu)	\N	http://vocabulary.odm2.org/variablename/copperDissolved
rheniumTotal	Rhenium, total	Total Rhenium (Re)	\N	http://vocabulary.odm2.org/variablename/rheniumTotal
acidityTotalAcidity	Acidity, total acidity	Total acidity	\N	http://vocabulary.odm2.org/variablename/acidityTotalAcidity
silicicAcid	Silicic acid	Hydrated silica disolved in water	\N	http://vocabulary.odm2.org/variablename/silicicAcid
reductionPotential	Reduction potential	Oxidation-reduction potential	\N	http://vocabulary.odm2.org/variablename/reductionPotential
tetraethyleneGlycol	Tetraethylene glycol	Tetraethylene glycol (C8H18O5)	\N	http://vocabulary.odm2.org/variablename/tetraethyleneGlycol
xylenesTotal	Xylenes, total	Total xylenes: C6H4(CH3)2	\N	http://vocabulary.odm2.org/variablename/xylenesTotal
nitrogenDissolvedNitrate_NO3	Nitrogen, dissolved nitrate (NO3)	Dissolved nitrate (NO3) nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenDissolvedNitrate_NO3
DNADamageTailLength	DNA damage, tail length	In a single cell gel electrophoresis assay (comet assay), tail length is the distance of DNA migration from the body of the nuclear core	\N	http://vocabulary.odm2.org/variablename/DNADamageTailLength
NAlbuminoid	N, albuminoid	Albuminoid Nitrogen	\N	http://vocabulary.odm2.org/variablename/NAlbuminoid
hydrogen_2_StableIsotopeRatioDelta	Hydrogen-2, stable isotope ratio delta	Difference in the 2H:1H ratio between the sample and standard	\N	http://vocabulary.odm2.org/variablename/hydrogen_2_StableIsotopeRatioDelta
carbazole	Carbazole	Carbazole (C12H9N)	\N	http://vocabulary.odm2.org/variablename/carbazole
N_Nitrosodimethylamine	N-Nitrosodimethylamine	N-Nitrosodimethylamine (C2H6N2O)	\N	http://vocabulary.odm2.org/variablename/N_Nitrosodimethylamine
silicaDissolved	Silica, dissolved	Dissolved silica (SiO2)	\N	http://vocabulary.odm2.org/variablename/silicaDissolved
specificConductance	Specific conductance	Specific conductance	\N	http://vocabulary.odm2.org/variablename/specificConductance
seleniumTotal	Selenium, total	Total Selenium (Se). For chemical terms, total indicates an unfiltered sample	\N	http://vocabulary.odm2.org/variablename/seleniumTotal
delta_13COfC3H8	delta-13C of C3H8	Isotope 13C of propane	\N	http://vocabulary.odm2.org/variablename/delta_13COfC3H8
nitrogenInorganic	Nitrogen, inorganic	Total Inorganic Nitrogen	\N	http://vocabulary.odm2.org/variablename/nitrogenInorganic
n_Alkane_C33	n-alkane, C33	C33 alkane, (i.e. straight-chain) isomer, common name: n-Tritriacontane, formula : C33H68	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C33
n_Alkane_C19	n-alkane, C19	C19 alkane, normal (i.e. straight-chain) isomer, common name: n-Nonadecane, formula : C19H40	\N	http://vocabulary.odm2.org/variablename/n_Alkane_C19
phosphorusOrthophosphateDissolved	Phosphorus, orthophosphate dissolved	Dissolved orthophosphate phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusOrthophosphateDissolved
sulfideTotal	Sulfide, total	Total sulfide	\N	http://vocabulary.odm2.org/variablename/sulfideTotal
polycyclicAromaticHydrocarbonTotal	Polycyclic aromatic hydrocarbon, total	total polycyclic aromatic hydrocarbon (PAH), also known as poly-aromatic hydrocarbons or polynuclear aromatic hydrocarbons	\N	http://vocabulary.odm2.org/variablename/polycyclicAromaticHydrocarbonTotal
methylTert_ButylEther_MTBE	Methyl tert-butyl ether (MTBE)	Methyl tert-butyl ether (MTBE) (C5H12O)	\N	http://vocabulary.odm2.org/variablename/methylTert_ButylEther_MTBE
bis_2_ChloroisopropylEther	bis-2-chloroisopropyl ether	bis-2-chloroisopropyl ether (C6H12Cl2O)	\N	http://vocabulary.odm2.org/variablename/bis_2_ChloroisopropylEther
carbonDissolvedOrganic	Carbon, dissolved organic	Dissolved Organic Carbon	\N	http://vocabulary.odm2.org/variablename/carbonDissolvedOrganic
propaneDissolved	Propane, dissolved	Dissolved Propane (C3H8)	\N	http://vocabulary.odm2.org/variablename/propaneDissolved
sedimentPassingSieve	Sediment, passing sieve	The amount of sediment passing a sieve in a gradation test	\N	http://vocabulary.odm2.org/variablename/sedimentPassingSieve
waterDepth	Water depth	Water depth is the distance between the water surface and the bottom of the water body at a specific location specified by the site location and offset.	\N	http://vocabulary.odm2.org/variablename/waterDepth
lowBatteryCount	Low battery count	A counter of the number of times the battery voltage dropped below a minimum threshold	\N	http://vocabulary.odm2.org/variablename/lowBatteryCount
phenolicsTotal	Phenolics, total	Total Phenolics	\N	http://vocabulary.odm2.org/variablename/phenolicsTotal
waterContent	Water Content	Quantity of water contained in a material or organism	\N	http://vocabulary.odm2.org/variablename/waterContent
BOD5	BOD5	5-day Biochemical Oxygen Demand	\N	http://vocabulary.odm2.org/variablename/BOD5
zooplankton	Zooplankton	Zooplanktonic organisms, non-specific	\N	http://vocabulary.odm2.org/variablename/zooplankton
petroleumHydrocarbonTotal	Petroleum hydrocarbon, total	Total petroleum hydrocarbon	\N	http://vocabulary.odm2.org/variablename/petroleumHydrocarbonTotal
zirconiumDissolved	Zirconium, dissolved	Dissolved Zirconium	\N	http://vocabulary.odm2.org/variablename/zirconiumDissolved
phosphorusPolyphosphate	Phosphorus, polyphosphate	Polyphosphate Phosphorus	\N	http://vocabulary.odm2.org/variablename/phosphorusPolyphosphate
vanadiumTotal	Vanadium, total	Total vanadium (V). "Total" indicates was measured on a whole water (unfiltered) sample.	\N	http://vocabulary.odm2.org/variablename/vanadiumTotal
sensibleHeatFlux	Sensible heat flux	Sensible Heat Flux	\N	http://vocabulary.odm2.org/variablename/sensibleHeatFlux
dinoseb	Dinoseb	Dinoseb (C10H12N2O5)	\N	http://vocabulary.odm2.org/variablename/dinoseb
windSpeed	Wind speed	Wind speed	\N	http://vocabulary.odm2.org/variablename/windSpeed
lithiumDissolved	Lithium, dissolved	Dissolved Lithium (Li). For chemical terms, dissolved indicates a filtered sample.	\N	http://vocabulary.odm2.org/variablename/lithiumDissolved
zincParticulate	Zinc, particulate	Particulate zinc (Zn) in suspension	\N	http://vocabulary.odm2.org/variablename/zincParticulate
speedOfSound	Speed of sound	Speed of sound in the medium sampled	\N	http://vocabulary.odm2.org/variablename/speedOfSound
dibenzothiophene	Dibenzothiophene	Dibenzothiophene (C12H8S), a polycyclic aromatic hydrocarbon (PAH)	\N	http://vocabulary.odm2.org/variablename/dibenzothiophene
bariumTotal	Barium, total	Total Barium (Ba). For chemical terms, "total" indicates an unfiltered sample.	\N	http://vocabulary.odm2.org/variablename/bariumTotal
\.


--
-- TOC entry 4822 (class 0 OID 70498)
-- Dependencies: 299
-- Data for Name: cv_variabletype; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY cv_variabletype (term, name, definition, category, sourcevocabularyuri) FROM stdin;
traceElement	Trace element	Variables associated with trace elements	\N	http://vocabulary.odm2.org/variabletype/traceElement
Climate	Climate	Variables associated with the climate, weather, or atmospheric processes	\N	http://vocabulary.odm2.org/variabletype/Climate
modelData	Model data	Variables associated with modeled data	\N	http://vocabulary.odm2.org/variabletype/modelData
uraniumSeries	Uranium series	Variables associated with uranium series	\N	http://vocabulary.odm2.org/variabletype/uraniumSeries
Geology	Geology	Variables associated with geology or geological processes	\N	http://vocabulary.odm2.org/variabletype/Geology
Unknown	Unknown	The VariableType is unknown.	\N	http://vocabulary.odm2.org/variabletype/Unknown
speciationRatio	Speciation ratio	Variables associated with a speciation ratio	\N	http://vocabulary.odm2.org/variabletype/speciationRatio
radiogenicIsotopes	Radiogenic isotopes	Variables associated with radiogenic isotopes	\N	http://vocabulary.odm2.org/variabletype/radiogenicIsotopes
rareEarthElement	Rare earth element	Variables associated with rare earth elements	\N	http://vocabulary.odm2.org/variabletype/rareEarthElement
stableIsotopes	Stable isotopes	Variables associated with stable isotopes	\N	http://vocabulary.odm2.org/variabletype/stableIsotopes
WaterQuality	Water quality	Variables associated with water quality variables or processes	\N	http://vocabulary.odm2.org/variabletype/WaterQuality
Soil	Soil	Variables associated with soil variables or processes	\N	http://vocabulary.odm2.org/variabletype/Soil
age	Age	Variables associated with age	\N	http://vocabulary.odm2.org/variabletype/age
endMember	End-Member	Variables associated with end members	\N	http://vocabulary.odm2.org/variabletype/endMember
rockMode	Rock mode	Variables associated with a rock mode	\N	http://vocabulary.odm2.org/variabletype/rockMode
Chemistry	Chemistry	Variables associated with chemistry, chemical analysis or processes	\N	http://vocabulary.odm2.org/variabletype/Chemistry
ratio	Ratio	Variables associated with a ratio	\N	http://vocabulary.odm2.org/variabletype/ratio
Instrumentation	Instrumentation	Variables associated with instrumentation and instrument properties such as battery voltages, data logger temperatures, often useful for diagnosis.	\N	http://vocabulary.odm2.org/variabletype/Instrumentation
volatile	Volatile	Variables associated with volatile chemicals	\N	http://vocabulary.odm2.org/variabletype/volatile
Hydrology	Hydrology	Variables associated with hydrologic variables or processes	\N	http://vocabulary.odm2.org/variabletype/Hydrology
majorOxideElement	Major oxide or element	Variables associated with major oxides or elements	\N	http://vocabulary.odm2.org/variabletype/majorOxideElement
Biota	Biota	Variables associated with biological organisms	\N	http://vocabulary.odm2.org/variabletype/Biota
nobleGas	Noble gas	Variables associated with noble gasses	\N	http://vocabulary.odm2.org/variabletype/nobleGas
\.


--
-- TOC entry 4835 (class 0 OID 70563)
-- Dependencies: 312
-- Data for Name: dataloggerfilecolumns; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY dataloggerfilecolumns (dataloggerfilecolumnid, resultid, dataloggerfileid, instrumentoutputvariableid, columnlabel, columndescription, measurementequation, scaninterval, scanintervalunitsid, recordinginterval, recordingintervalunitsid, aggregationstatisticcv) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 311
-- Name: dataloggerfilecolumns_dataloggerfilecolumnid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('dataloggerfilecolumns_dataloggerfilecolumnid_seq', 1, false);


--
-- TOC entry 4837 (class 0 OID 70574)
-- Dependencies: 314
-- Data for Name: dataloggerfiles; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY dataloggerfiles (dataloggerfileid, programid, dataloggerfilename, dataloggerfiledescription, dataloggerfilelink) FROM stdin;
\.


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 313
-- Name: dataloggerfiles_dataloggerfileid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('dataloggerfiles_dataloggerfileid_seq', 1, false);


--
-- TOC entry 4839 (class 0 OID 70585)
-- Dependencies: 316
-- Data for Name: dataloggerprogramfiles; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY dataloggerprogramfiles (programid, affiliationid, programname, programdescription, programversion, programfilelink) FROM stdin;
\.


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 315
-- Name: dataloggerprogramfiles_programid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('dataloggerprogramfiles_programid_seq', 1, false);


--
-- TOC entry 4823 (class 0 OID 70506)
-- Dependencies: 300
-- Data for Name: dataquality; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY dataquality (dataqualityid, dataqualitytypecv, dataqualitycode, dataqualityvalue, dataqualityvalueunitsid, dataqualitydescription, dataqualitylink) FROM stdin;
\.


--
-- TOC entry 4892 (class 0 OID 70851)
-- Dependencies: 369
-- Data for Name: datasetcitations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY datasetcitations (bridgeid, datasetid, relationshiptypecv, citationid) FROM stdin;
1	1	Cites	1
\.


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 368
-- Name: datasetcitations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('datasetcitations_bridgeid_seq', 1, true);


--
-- TOC entry 4770 (class 0 OID 70145)
-- Dependencies: 247
-- Data for Name: datasets; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY datasets (datasetid, datasetuuid, datasettypecv, datasetcode, datasettitle, datasetabstract) FROM stdin;
1	30b34aa5-788b-e3c0-f045-b1b8bead0958	Specimen time series	MarchantariaTS	CAMREX Marchantaria Time Series	10-year time series of biogeochemivcal measurements in the central Amazon River mainstem at Marchantaria, near Manaus. Conducted by the US-Brazilian CAMREX project.
\.


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 246
-- Name: datasets_datasetid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('datasets_datasetid_seq', 1, true);


--
-- TOC entry 4772 (class 0 OID 70156)
-- Dependencies: 249
-- Data for Name: datasetsresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY datasetsresults (bridgeid, datasetid, resultid) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	1	48
49	1	49
50	1	50
51	1	51
52	1	52
53	1	53
54	1	54
55	1	55
56	1	56
57	1	57
58	1	58
59	1	59
60	1	60
61	1	61
62	1	62
63	1	63
64	1	64
65	1	65
66	1	66
67	1	67
68	1	68
69	1	69
70	1	70
71	1	71
72	1	72
73	1	73
74	1	74
75	1	75
76	1	76
77	1	77
78	1	78
79	1	79
80	1	80
81	1	81
82	1	82
83	1	83
84	1	84
85	1	85
86	1	86
87	1	87
88	1	88
89	1	89
90	1	90
91	1	91
92	1	92
93	1	93
94	1	94
95	1	95
96	1	96
97	1	97
98	1	98
99	1	99
100	1	100
101	1	101
102	1	102
103	1	103
104	1	104
105	1	105
106	1	106
107	1	107
108	1	108
109	1	109
110	1	110
111	1	111
112	1	112
113	1	113
114	1	114
115	1	115
116	1	116
117	1	117
118	1	118
119	1	119
120	1	120
121	1	121
122	1	122
123	1	123
124	1	124
125	1	125
126	1	126
127	1	127
128	1	128
129	1	129
130	1	130
131	1	131
132	1	132
133	1	133
134	1	134
135	1	135
136	1	136
137	1	137
138	1	138
139	1	139
140	1	140
141	1	141
142	1	142
143	1	143
144	1	144
145	1	145
146	1	146
147	1	147
148	1	148
149	1	149
150	1	150
151	1	151
152	1	152
153	1	153
154	1	154
155	1	155
156	1	156
157	1	157
158	1	158
159	1	159
160	1	160
161	1	161
162	1	162
163	1	163
164	1	164
165	1	165
166	1	166
167	1	167
168	1	168
169	1	169
170	1	170
171	1	171
172	1	172
173	1	173
174	1	174
175	1	175
176	1	176
177	1	177
178	1	178
179	1	179
180	1	180
181	1	181
182	1	182
183	1	183
184	1	184
185	1	185
186	1	186
187	1	187
188	1	188
189	1	189
190	1	190
191	1	191
192	1	192
193	1	193
194	1	194
195	1	195
196	1	196
197	1	197
198	1	198
199	1	199
200	1	200
201	1	201
202	1	202
203	1	203
204	1	204
205	1	205
206	1	206
207	1	207
208	1	208
209	1	209
210	1	210
211	1	211
212	1	212
213	1	213
214	1	214
215	1	215
216	1	216
217	1	217
218	1	218
219	1	219
220	1	220
221	1	221
222	1	222
223	1	223
224	1	224
225	1	225
226	1	226
227	1	227
228	1	228
229	1	229
230	1	230
231	1	231
232	1	232
233	1	233
234	1	234
235	1	235
236	1	236
237	1	237
238	1	238
239	1	239
240	1	240
241	1	241
242	1	242
243	1	243
244	1	244
245	1	245
246	1	246
247	1	247
248	1	248
249	1	249
250	1	250
251	1	251
252	1	252
253	1	253
254	1	254
255	1	255
256	1	256
257	1	257
258	1	258
259	1	259
260	1	260
261	1	261
262	1	262
263	1	263
264	1	264
265	1	265
266	1	266
267	1	267
268	1	268
269	1	269
270	1	270
271	1	271
272	1	272
273	1	273
274	1	274
275	1	275
276	1	276
277	1	277
278	1	278
279	1	279
280	1	280
281	1	281
282	1	282
283	1	283
284	1	284
285	1	285
286	1	286
287	1	287
288	1	288
289	1	289
290	1	290
291	1	291
292	1	292
293	1	293
294	1	294
295	1	295
296	1	296
297	1	297
298	1	298
299	1	299
300	1	300
301	1	301
302	1	302
303	1	303
304	1	304
305	1	305
306	1	306
307	1	307
308	1	308
309	1	309
310	1	310
311	1	311
312	1	312
313	1	313
314	1	314
315	1	315
316	1	316
317	1	317
318	1	318
319	1	319
320	1	320
321	1	321
322	1	322
323	1	323
324	1	324
325	1	325
326	1	326
327	1	327
328	1	328
329	1	329
330	1	330
331	1	331
332	1	332
333	1	333
334	1	334
335	1	335
336	1	336
337	1	337
338	1	338
339	1	339
340	1	340
341	1	341
342	1	342
343	1	343
344	1	344
345	1	345
346	1	346
347	1	347
348	1	348
349	1	349
350	1	350
351	1	351
352	1	352
353	1	353
354	1	354
355	1	355
356	1	356
357	1	357
358	1	358
359	1	359
360	1	360
361	1	361
362	1	362
363	1	363
364	1	364
365	1	365
366	1	366
367	1	367
368	1	368
369	1	369
370	1	370
371	1	371
372	1	372
373	1	373
374	1	374
375	1	375
376	1	376
377	1	377
378	1	378
379	1	379
380	1	380
381	1	381
382	1	382
383	1	383
384	1	384
385	1	385
386	1	386
387	1	387
388	1	388
389	1	389
390	1	390
391	1	391
392	1	392
393	1	393
394	1	394
395	1	395
396	1	396
397	1	397
398	1	398
399	1	399
400	1	400
401	1	401
402	1	402
403	1	403
404	1	404
405	1	405
406	1	406
407	1	407
408	1	408
409	1	409
410	1	410
411	1	411
412	1	412
413	1	413
414	1	414
415	1	415
416	1	416
417	1	417
418	1	418
419	1	419
420	1	420
421	1	421
422	1	422
423	1	423
424	1	424
425	1	425
426	1	426
427	1	427
428	1	428
429	1	429
430	1	430
431	1	431
432	1	432
433	1	433
434	1	434
435	1	435
436	1	436
437	1	437
438	1	438
439	1	439
440	1	440
441	1	441
442	1	442
443	1	443
444	1	444
445	1	445
446	1	446
447	1	447
448	1	448
449	1	449
450	1	450
451	1	451
452	1	452
453	1	453
454	1	454
455	1	455
456	1	456
457	1	457
458	1	458
459	1	459
460	1	460
461	1	461
462	1	462
463	1	463
464	1	464
465	1	465
466	1	466
467	1	467
468	1	468
469	1	469
470	1	470
471	1	471
472	1	472
473	1	473
474	1	474
475	1	475
476	1	476
477	1	477
478	1	478
479	1	479
480	1	480
481	1	481
482	1	482
483	1	483
484	1	484
485	1	485
486	1	486
487	1	487
488	1	488
489	1	489
490	1	490
491	1	491
492	1	492
493	1	493
494	1	494
495	1	495
496	1	496
497	1	497
498	1	498
499	1	499
500	1	500
501	1	501
502	1	502
503	1	503
504	1	504
505	1	505
506	1	506
507	1	507
508	1	508
509	1	509
510	1	510
511	1	511
512	1	512
513	1	513
514	1	514
515	1	515
516	1	516
517	1	517
518	1	518
519	1	519
520	1	520
521	1	521
522	1	522
523	1	523
524	1	524
525	1	525
526	1	526
527	1	527
528	1	528
529	1	529
530	1	530
531	1	531
532	1	532
533	1	533
534	1	534
535	1	535
536	1	536
537	1	537
538	1	538
539	1	539
540	1	540
541	1	541
542	1	542
543	1	543
544	1	544
545	1	545
546	1	546
547	1	547
548	1	548
549	1	549
550	1	550
551	1	551
552	1	552
553	1	553
554	1	554
555	1	555
556	1	556
557	1	557
558	1	558
559	1	559
560	1	560
561	1	561
562	1	562
563	1	563
564	1	564
565	1	565
566	1	566
567	1	567
568	1	568
569	1	569
570	1	570
571	1	571
572	1	572
573	1	573
574	1	574
575	1	575
576	1	576
577	1	577
578	1	578
579	1	579
580	1	580
581	1	581
582	1	582
583	1	583
584	1	584
585	1	585
586	1	586
587	1	587
588	1	588
589	1	589
590	1	590
591	1	591
592	1	592
593	1	593
594	1	594
595	1	595
596	1	596
597	1	597
598	1	598
599	1	599
600	1	600
601	1	601
602	1	602
603	1	603
604	1	604
605	1	605
606	1	606
607	1	607
608	1	608
609	1	609
610	1	610
611	1	611
612	1	612
613	1	613
614	1	614
615	1	615
616	1	616
617	1	617
618	1	618
619	1	619
620	1	620
621	1	621
622	1	622
623	1	623
624	1	624
625	1	625
626	1	626
627	1	627
628	1	628
629	1	629
630	1	630
631	1	631
632	1	632
633	1	633
634	1	634
635	1	635
636	1	636
637	1	637
638	1	638
639	1	639
640	1	640
641	1	641
642	1	642
643	1	643
644	1	644
645	1	645
646	1	646
647	1	647
648	1	648
649	1	649
650	1	650
651	1	651
652	1	652
653	1	653
654	1	654
655	1	655
656	1	656
657	1	657
658	1	658
659	1	659
660	1	660
661	1	661
662	1	662
663	1	663
664	1	664
665	1	665
666	1	666
667	1	667
668	1	668
669	1	669
670	1	670
671	1	671
672	1	672
673	1	673
674	1	674
675	1	675
676	1	676
677	1	677
678	1	678
679	1	679
680	1	680
681	1	681
682	1	682
683	1	683
684	1	684
685	1	685
686	1	686
687	1	687
688	1	688
689	1	689
690	1	690
691	1	691
692	1	692
693	1	693
694	1	694
695	1	695
696	1	696
697	1	697
698	1	698
699	1	699
700	1	700
701	1	701
702	1	702
703	1	703
704	1	704
705	1	705
706	1	706
707	1	707
708	1	708
709	1	709
710	1	710
711	1	711
712	1	712
713	1	713
714	1	714
715	1	715
716	1	716
717	1	717
718	1	718
719	1	719
720	1	720
721	1	721
722	1	722
723	1	723
724	1	724
725	1	725
726	1	726
727	1	727
728	1	728
729	1	729
730	1	730
731	1	731
732	1	732
733	1	733
734	1	734
735	1	735
736	1	736
737	1	737
738	1	738
739	1	739
740	1	740
741	1	741
742	1	742
743	1	743
744	1	744
745	1	745
746	1	746
747	1	747
748	1	748
749	1	749
750	1	750
751	1	751
752	1	752
753	1	753
754	1	754
755	1	755
756	1	756
757	1	757
758	1	758
759	1	759
760	1	760
761	1	761
762	1	762
763	1	763
764	1	764
765	1	765
766	1	766
767	1	767
768	1	768
769	1	769
770	1	770
771	1	771
772	1	772
773	1	773
774	1	774
775	1	775
776	1	776
777	1	777
778	1	778
779	1	779
780	1	780
781	1	781
782	1	782
783	1	783
784	1	784
785	1	785
786	1	786
787	1	787
788	1	788
789	1	789
790	1	790
791	1	791
792	1	792
793	1	793
794	1	794
795	1	795
\.


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 248
-- Name: datasetsresults_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('datasetsresults_bridgeid_seq', 795, true);


--
-- TOC entry 4894 (class 0 OID 70859)
-- Dependencies: 371
-- Data for Name: derivationequations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY derivationequations (derivationequationid, derivationequation) FROM stdin;
\.


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 370
-- Name: derivationequations_derivationequationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('derivationequations_derivationequationid_seq', 1, false);


--
-- TOC entry 4885 (class 0 OID 70816)
-- Dependencies: 362
-- Data for Name: directives; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY directives (directiveid, directivetypecv, directivedescription) FROM stdin;
\.


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 361
-- Name: directives_directiveid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('directives_directiveid_seq', 1, false);


--
-- TOC entry 4841 (class 0 OID 70596)
-- Dependencies: 318
-- Data for Name: equipment; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY equipment (equipmentid, equipmentcode, equipmentname, equipmenttypecv, equipmentmodelid, equipmentserialnumber, equipmentownerid, equipmentvendorid, equipmentpurchasedate, equipmentpurchaseordernumber, equipmentdescription, equipmentdocumentationlink) FROM stdin;
\.


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 317
-- Name: equipment_equipmentid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('equipment_equipmentid_seq', 1, false);


--
-- TOC entry 4740 (class 0 OID 70016)
-- Dependencies: 217
-- Data for Name: equipmentannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY equipmentannotations (bridgeid, equipmentid, annotationid) FROM stdin;
\.


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 216
-- Name: equipmentannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('equipmentannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4843 (class 0 OID 70607)
-- Dependencies: 320
-- Data for Name: equipmentmodels; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY equipmentmodels (equipmentmodelid, modelmanufacturerid, modelpartnumber, modelname, modeldescription, isinstrument, modelspecificationsfilelink, modellink) FROM stdin;
\.


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 319
-- Name: equipmentmodels_equipmentmodelid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('equipmentmodels_equipmentmodelid_seq', 1, false);


--
-- TOC entry 4845 (class 0 OID 70618)
-- Dependencies: 322
-- Data for Name: equipmentused; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY equipmentused (bridgeid, actionid, equipmentid) FROM stdin;
\.


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 321
-- Name: equipmentused_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('equipmentused_bridgeid_seq', 1, false);


--
-- TOC entry 4856 (class 0 OID 70669)
-- Dependencies: 333
-- Data for Name: extensionproperties; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY extensionproperties (propertyid, propertyname, propertydescription, propertydatatypecv, propertyunitsid) FROM stdin;
\.


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 332
-- Name: extensionproperties_propertyid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('extensionproperties_propertyid_seq', 1, false);


--
-- TOC entry 4867 (class 0 OID 70721)
-- Dependencies: 344
-- Data for Name: externalidentifiersystems; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY externalidentifiersystems (externalidentifiersystemid, externalidentifiersystemname, identifiersystemorganizationid, externalidentifiersystemdescription, externalidentifiersystemurl) FROM stdin;
1	Digital Object Identifier	2	Digital Object Identifier	http://dx.doi.org/
\.


--
-- TOC entry 4774 (class 0 OID 70164)
-- Dependencies: 251
-- Data for Name: featureactions; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY featureactions (featureactionid, samplingfeatureid, actionid) FROM stdin;
1	1	336
2	2	337
3	3	338
4	4	339
5	5	340
6	6	341
7	7	342
8	8	343
9	9	344
10	10	345
11	11	346
12	12	347
13	13	348
14	14	349
15	15	350
16	16	351
17	17	352
18	18	353
19	19	354
20	20	355
21	21	356
22	22	357
23	23	358
24	24	359
25	25	360
26	26	361
27	27	362
28	28	363
29	29	364
30	30	365
31	31	366
32	32	367
33	33	368
34	34	369
35	35	370
36	36	372
37	37	373
38	38	374
39	39	375
40	40	376
41	41	377
42	42	378
43	43	379
44	44	380
45	45	381
46	46	382
47	47	383
48	48	384
49	49	385
50	50	386
51	51	387
52	52	388
53	53	389
54	54	390
55	55	391
56	56	392
57	74	411
58	75	412
59	57	393
60	58	394
61	59	396
62	60	397
63	61	398
64	62	399
65	63	400
66	64	401
67	65	402
68	66	403
69	67	404
70	68	405
71	69	406
72	70	407
73	71	408
74	72	409
75	73	410
76	76	413
77	77	415
78	78	416
79	79	417
80	80	418
81	81	419
82	82	420
83	83	421
84	84	422
85	85	423
86	86	424
87	87	425
88	88	426
89	89	427
90	90	428
91	91	429
92	92	430
93	93	431
94	94	432
95	95	433
96	96	434
97	97	435
98	98	436
99	33125	336
100	33126	337
101	33127	338
102	33128	339
103	33129	340
104	33130	341
105	33131	342
106	33132	343
107	33133	344
108	33134	345
109	33135	346
110	33136	347
111	33137	348
112	33138	349
113	33139	350
114	33140	351
115	33141	352
116	33142	353
117	33143	354
118	33144	355
119	33145	356
120	33146	357
121	33147	358
122	33148	359
123	33149	360
124	33150	361
125	33151	362
126	33152	363
127	33153	364
128	33154	365
129	33155	366
130	33156	367
131	33157	368
132	33158	369
133	33159	370
134	33160	372
135	33161	373
136	33162	374
137	33163	375
138	33164	376
139	33165	377
140	33166	378
141	33167	379
142	33168	380
143	33169	381
144	33170	382
145	33171	383
146	33172	384
147	33173	385
148	33174	387
149	33175	388
150	33176	389
151	33177	390
152	33178	391
153	33179	392
154	33197	411
155	33198	412
156	33180	393
157	33181	394
158	33182	396
159	33183	397
160	33184	398
161	33185	399
162	33186	400
163	33187	401
164	33188	402
165	33189	403
166	33190	404
167	33191	405
168	33192	406
169	33193	407
170	33194	408
171	33195	409
172	33196	410
173	33199	413
174	33200	415
175	33201	416
176	33202	417
177	33203	418
178	33204	419
179	33205	420
180	33206	421
181	33207	422
182	33208	423
183	33209	424
184	33210	425
185	33211	426
186	33212	427
187	33213	428
188	33214	429
189	33215	430
190	33216	431
191	33217	432
192	33218	433
193	33219	434
194	33220	435
195	33221	436
\.


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 250
-- Name: featureactions_featureactionid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('featureactions_featureactionid_seq', 195, true);


--
-- TOC entry 4847 (class 0 OID 70626)
-- Dependencies: 324
-- Data for Name: instrumentoutputvariables; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY instrumentoutputvariables (instrumentoutputvariableid, modelid, variableid, instrumentmethodid, instrumentresolution, instrumentaccuracy, instrumentrawoutputunitsid) FROM stdin;
\.


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 323
-- Name: instrumentoutputvariables_instrumentoutputvariableid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('instrumentoutputvariables_instrumentoutputvariableid_seq', 1, false);


--
-- TOC entry 4848 (class 0 OID 70635)
-- Dependencies: 325
-- Data for Name: maintenanceactions; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY maintenanceactions (actionid, isfactoryservice, maintenancecode, maintenancereason) FROM stdin;
\.


--
-- TOC entry 4909 (class 0 OID 70923)
-- Dependencies: 386
-- Data for Name: measurementresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY measurementresults (resultid, xlocation, xlocationunitsid, ylocation, ylocationunitsid, zlocation, zlocationunitsid, spatialreferenceid, censorcodecv, qualitycodecv, aggregationstatisticcv, timeaggregationinterval, timeaggregationintervalunitsid) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
2	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
3	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
4	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
5	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
6	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
7	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
8	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
9	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
10	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
11	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
12	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
13	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
14	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
15	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
16	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
17	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
18	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
19	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
20	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
21	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
22	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
23	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
24	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
25	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
26	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
27	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
28	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
29	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
30	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
31	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
32	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
33	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
34	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
35	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
36	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
37	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
38	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
39	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
40	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
41	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
42	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
43	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
44	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
45	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
46	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
47	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
48	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
49	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
50	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
51	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
52	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
53	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
54	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
55	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
56	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
57	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
58	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
59	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
60	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
61	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
62	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
63	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
64	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
65	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
66	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
67	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
68	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
69	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
70	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
71	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
72	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
73	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
74	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
75	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
76	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
77	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
78	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
79	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
80	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
81	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
82	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
83	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
84	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
85	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
86	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
87	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
88	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
89	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
90	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
91	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
92	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
93	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
94	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
95	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
96	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
97	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
98	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
99	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
100	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
101	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
102	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
103	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
104	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
105	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
106	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
107	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
108	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
109	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
110	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
111	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
112	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
113	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
114	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
115	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
116	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
117	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
118	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
119	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
120	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
121	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
122	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
123	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
124	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
125	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
126	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
127	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
128	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
129	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
130	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
131	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
132	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
133	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
134	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
135	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
136	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
137	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
138	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
139	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
140	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
141	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
142	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
143	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
144	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
145	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
146	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
147	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
148	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
149	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
150	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
151	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
152	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
153	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
154	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
155	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
156	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
157	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
158	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
159	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
160	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
161	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
162	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
163	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
164	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
165	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
166	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
167	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
168	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
169	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
170	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
171	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
172	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
173	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
174	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
175	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
176	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
177	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
178	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
179	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
180	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
181	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
182	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
183	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
184	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
185	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
186	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
187	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
188	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
189	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
190	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
191	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
192	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
193	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
194	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
195	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
196	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
197	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
198	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
199	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
200	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
201	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
202	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
203	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
204	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
205	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
206	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
207	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
208	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
209	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
210	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
211	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
212	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
213	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
214	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
215	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
216	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
217	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
218	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
219	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
220	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
221	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
222	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
223	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
224	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
225	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
226	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
227	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
228	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
229	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
230	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
231	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
232	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
233	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
234	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
235	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
236	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
237	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
238	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
239	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
240	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
241	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
242	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
243	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
244	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
245	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
246	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
247	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
248	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
249	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
250	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
251	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
252	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
253	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
254	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
255	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
256	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
257	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
258	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
259	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
260	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
261	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
262	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
263	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
264	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
265	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
266	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
267	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
268	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
269	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
270	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
271	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
272	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
273	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
274	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
275	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
276	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
277	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
278	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
279	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
280	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
281	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
282	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
283	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
284	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
285	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
286	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
287	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
288	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
289	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
290	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
291	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
292	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
293	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
294	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
295	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
296	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
297	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
298	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
299	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
300	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
301	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
302	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
303	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
304	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
305	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
306	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
307	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
308	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
309	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
310	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
311	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
312	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
313	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
314	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
315	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
316	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
317	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
318	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
319	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
320	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
321	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
322	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
323	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
324	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
325	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
326	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
327	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
328	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
329	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
330	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
331	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
332	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
333	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
334	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
335	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
336	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
337	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
338	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
339	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
340	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
341	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
342	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
343	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
344	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
345	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
346	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
347	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
348	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
349	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
350	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
351	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
352	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
353	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
354	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
355	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
356	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
357	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
358	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
359	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
360	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
361	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
362	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
363	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
364	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
365	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
366	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
367	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
368	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
369	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
370	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
371	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
372	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
373	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
374	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
375	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
376	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
377	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
378	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
379	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
380	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
381	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
382	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
383	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
384	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
385	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
386	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
387	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
388	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
389	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
390	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
391	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
392	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
393	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
394	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
395	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
396	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
397	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
398	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
399	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
400	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
401	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
402	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
403	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
404	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
405	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
406	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
407	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
408	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
409	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
410	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
411	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
412	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
413	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
414	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
415	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
416	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
417	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
418	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
419	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
420	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
421	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
422	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
423	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
424	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
425	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
426	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
427	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
428	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
429	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
430	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
431	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
432	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
433	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
434	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
435	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
436	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
437	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
438	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
439	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
440	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
441	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
442	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
443	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
444	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
445	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
446	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
447	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
448	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
449	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
450	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
451	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
452	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
453	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
454	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
455	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
456	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
457	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
458	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
459	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
460	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
461	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
462	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
463	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
464	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
465	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
466	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
467	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
468	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
469	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
470	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
471	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
472	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
473	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
474	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
475	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
476	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
477	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
478	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
479	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
480	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
481	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
482	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
483	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
484	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
485	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
486	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
487	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
488	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
489	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
490	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
491	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
492	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
493	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
494	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
495	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
496	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
497	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
498	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
499	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
500	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
501	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
502	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
503	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
504	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
505	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
506	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
507	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
508	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
509	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
510	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
511	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
512	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
513	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
514	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
515	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
516	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
517	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
518	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
519	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
520	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
521	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
522	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
523	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
524	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
525	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
526	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
527	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
528	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
529	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
530	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
531	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
532	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
533	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
534	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
535	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
536	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
537	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
538	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
539	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
540	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
541	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
542	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
543	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
544	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
545	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
546	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
547	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
548	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
549	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
550	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
551	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
552	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
553	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
554	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
555	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
556	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
557	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
558	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
559	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
560	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
561	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
562	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
563	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
564	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
565	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
566	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
567	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
568	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
569	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
570	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
571	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
572	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
573	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
574	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
575	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
576	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
577	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
578	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
579	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
580	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
581	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
582	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
583	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
584	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
585	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
586	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
587	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
588	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
589	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
590	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
591	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
592	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
593	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
594	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
595	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
596	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
597	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
598	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
599	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
600	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
601	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
602	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
603	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
604	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
605	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
606	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
607	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
608	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
609	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
610	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
611	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
612	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
613	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
614	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
615	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
616	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
617	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
618	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
619	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
620	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
621	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
622	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
623	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
624	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
625	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
626	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
627	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
628	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
629	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
630	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
631	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
632	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
633	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
634	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
635	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
636	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
637	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
638	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
639	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
640	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
641	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
642	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
643	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
644	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
645	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
646	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
647	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
648	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
649	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
650	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
651	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
652	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
653	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
654	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
655	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
656	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
657	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
658	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
659	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
660	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
661	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
662	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
663	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
664	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
665	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
666	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
667	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
668	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
669	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
670	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
671	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
672	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
673	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
674	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
675	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
676	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
677	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
678	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
679	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
680	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
681	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
682	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
683	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
684	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
685	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
686	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
687	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
688	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
689	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
690	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
691	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
692	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
693	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
694	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
695	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
696	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
697	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
698	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
699	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
700	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
701	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
702	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
703	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
704	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
705	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
706	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
707	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
708	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
709	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
710	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
711	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
712	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
713	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
714	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
715	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
716	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
717	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
718	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
719	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
720	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
721	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
722	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
723	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
724	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
725	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
726	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
727	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
728	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
729	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
730	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
731	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
732	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
733	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
734	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
735	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
736	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
737	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
738	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
739	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
740	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
741	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
742	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
743	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
744	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
745	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
746	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
747	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
748	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
749	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
750	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
751	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
752	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
753	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
754	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
755	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
756	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
757	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
758	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
759	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
760	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
761	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
762	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
763	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
764	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
765	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
766	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
767	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
768	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
769	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
770	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
771	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
772	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
773	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
774	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
775	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
776	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
777	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
778	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
779	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
780	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
781	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
782	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
783	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
784	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
785	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
786	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
787	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
788	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
789	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
790	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
791	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
792	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
793	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
794	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
795	\N	\N	\N	\N	\N	\N	\N	Not censored	Good	Sporadic	1	14
\.


--
-- TOC entry 4742 (class 0 OID 70024)
-- Dependencies: 219
-- Data for Name: measurementresultvalueannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY measurementresultvalueannotations (bridgeid, valueid, annotationid) FROM stdin;
\.


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 218
-- Name: measurementresultvalueannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('measurementresultvalueannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4911 (class 0 OID 70933)
-- Dependencies: 388
-- Data for Name: measurementresultvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY measurementresultvalues (valueid, resultid, datavalue, valuedatetime, valuedatetimeutcoffset) FROM stdin;
1	1	11.2400000000000002	1983-01-17 00:00:00	-5
2	2	2.89999999999999991	1983-01-17 00:00:00	-5
3	3	1.10000000000000009	1983-01-17 00:00:00	-5
4	4	0.30099999999999999	1983-01-17 00:00:00	-5
5	5	0.110000000000000001	1983-01-17 00:00:00	-5
6	6	274	1983-01-17 00:00:00	-5
7	7	11.2400000000000002	1983-01-27 00:00:00	-5
8	8	2.93999999999999995	1983-01-27 00:00:00	-5
9	9	1.10000000000000009	1983-01-27 00:00:00	-5
10	10	0.304999999999999993	1983-01-27 00:00:00	-5
11	11	0.110000000000000001	1983-01-27 00:00:00	-5
12	12	277	1983-01-27 00:00:00	-5
13	13	11.7599999999999998	1983-02-08 00:00:00	-5
14	14	3.16999999999999993	1983-02-08 00:00:00	-5
15	15	1.19999999999999996	1983-02-08 00:00:00	-5
16	16	0.314000000000000001	1983-02-08 00:00:00	-5
17	17	0.119999999999999996	1983-02-08 00:00:00	-5
18	18	262	1983-02-08 00:00:00	-5
19	19	11.25	1983-02-21 00:00:00	-5
20	20	3.31999999999999984	1983-02-21 00:00:00	-5
21	21	1.39999999999999991	1983-02-21 00:00:00	-5
22	22	0.343999999999999972	1983-02-21 00:00:00	-5
23	23	0.140000000000000013	1983-02-21 00:00:00	-5
24	24	246	1983-02-21 00:00:00	-5
25	25	11.2799999999999994	1983-03-03 00:00:00	-5
26	26	2.74000000000000021	1983-03-03 00:00:00	-5
27	27	1.19999999999999996	1983-03-03 00:00:00	-5
28	28	0.282999999999999974	1983-03-03 00:00:00	-5
29	29	0.119999999999999996	1983-03-03 00:00:00	-5
30	30	236	1983-03-03 00:00:00	-5
31	31	179	1983-06-07 00:00:00	-5
32	32	11.6699999999999999	1983-07-21 00:00:00	-5
33	33	2.10000000000000009	1983-07-21 00:00:00	-5
34	34	1.5	1983-07-21 00:00:00	-5
35	35	0.209999999999999992	1983-07-21 00:00:00	-5
36	36	0.149999999999999994	1983-07-21 00:00:00	-5
37	37	140	1983-07-21 00:00:00	-5
38	38	11.0399999999999991	1983-08-11 00:00:00	-5
39	39	1.56000000000000005	1983-08-11 00:00:00	-5
40	40	1.39999999999999991	1983-08-11 00:00:00	-5
41	41	0.165000000000000008	1983-08-11 00:00:00	-5
42	42	0.149999999999999994	1983-08-11 00:00:00	-5
43	43	110	1983-08-11 00:00:00	-5
44	44	10.6799999999999997	1983-09-10 00:00:00	-5
45	45	1.18999999999999995	1983-09-10 00:00:00	-5
46	46	1.19999999999999996	1983-09-10 00:00:00	-5
47	47	0.130000000000000004	1983-09-10 00:00:00	-5
48	48	0.130000000000000004	1983-09-10 00:00:00	-5
49	49	100	1983-09-10 00:00:00	-5
50	50	11.0800000000000001	1983-09-20 00:00:00	-5
51	51	1.32000000000000006	1983-09-20 00:00:00	-5
52	52	1.10000000000000009	1983-09-20 00:00:00	-5
53	53	0.139000000000000012	1983-09-20 00:00:00	-5
54	54	0.119999999999999996	1983-09-20 00:00:00	-5
55	55	116	1983-09-20 00:00:00	-5
56	56	11.5700000000000003	1983-09-30 00:00:00	-5
57	57	1.59000000000000008	1983-09-30 00:00:00	-5
58	58	1.19999999999999996	1983-09-30 00:00:00	-5
59	59	0.161000000000000004	1983-09-30 00:00:00	-5
60	60	0.119999999999999996	1983-09-30 00:00:00	-5
61	61	134	1983-09-30 00:00:00	-5
62	62	11.6699999999999999	1983-12-16 00:00:00	-5
63	63	2.02000000000000002	1983-12-16 00:00:00	-5
64	64	1.10000000000000009	1983-12-16 00:00:00	-5
65	65	0.202000000000000013	1983-12-16 00:00:00	-5
66	66	0.110000000000000001	1983-12-16 00:00:00	-5
67	67	184	1983-12-16 00:00:00	-5
68	68	10.5	1984-01-03 00:00:00	-5
69	69	2.58999999999999986	1984-01-03 00:00:00	-5
70	70	0.900000000000000022	1984-01-03 00:00:00	-5
71	71	0.287999999999999978	1984-01-03 00:00:00	-5
72	72	0.100000000000000006	1984-01-03 00:00:00	-5
73	73	288	1984-01-03 00:00:00	-5
74	74	9.57000000000000028	1984-01-19 00:00:00	-5
75	75	2.04000000000000004	1984-01-19 00:00:00	-5
76	76	0.800000000000000044	1984-01-19 00:00:00	-5
77	77	0.248999999999999999	1984-01-19 00:00:00	-5
78	78	0.100000000000000006	1984-01-19 00:00:00	-5
79	79	249	1984-01-19 00:00:00	-5
80	80	11.6699999999999999	1984-03-20 00:00:00	-5
81	81	2.2200000000000002	1984-03-20 00:00:00	-5
82	82	1	1984-03-20 00:00:00	-5
83	83	0.222000000000000003	1984-03-20 00:00:00	-5
84	84	0.100000000000000006	1984-03-20 00:00:00	-5
85	85	222	1984-03-20 00:00:00	-5
86	86	11.0800000000000001	1984-04-05 00:00:00	-5
87	87	2	1984-04-05 00:00:00	-5
88	88	1.10000000000000009	1984-04-05 00:00:00	-5
89	89	0.209999999999999992	1984-04-05 00:00:00	-5
90	90	0.119999999999999996	1984-04-05 00:00:00	-5
91	91	175	1984-04-05 00:00:00	-5
92	92	9.25999999999999979	1984-09-13 00:00:00	-5
93	93	1.57000000000000006	1984-09-13 00:00:00	-5
94	94	1.30000000000000004	1984-09-13 00:00:00	-5
95	95	0.198000000000000009	1984-09-13 00:00:00	-5
96	96	0.160000000000000003	1984-09-13 00:00:00	-5
97	97	124	1984-09-13 00:00:00	-5
98	98	9.41000000000000014	1984-09-27 00:00:00	-5
99	99	1.62000000000000011	1984-09-27 00:00:00	-5
100	100	1.19999999999999996	1984-09-27 00:00:00	-5
101	101	0.201000000000000012	1984-09-27 00:00:00	-5
102	102	0.149999999999999994	1984-09-27 00:00:00	-5
103	103	134	1984-09-27 00:00:00	-5
104	104	8.9399999999999995	1984-10-10 00:00:00	-5
105	105	1.3899999999999999	1984-10-10 00:00:00	-5
106	106	1.19999999999999996	1984-10-10 00:00:00	-5
107	107	0.181999999999999995	1984-10-10 00:00:00	-5
108	108	0.149999999999999994	1984-10-10 00:00:00	-5
109	109	121	1984-10-10 00:00:00	-5
110	110	9.41999999999999993	1984-10-25 00:00:00	-5
111	111	1.62999999999999989	1984-10-25 00:00:00	-5
112	112	1.10000000000000009	1984-10-25 00:00:00	-5
113	113	0.202000000000000013	1984-10-25 00:00:00	-5
114	114	0.130000000000000004	1984-10-25 00:00:00	-5
115	115	155	1984-10-25 00:00:00	-5
116	116	9.33000000000000007	1984-11-07 00:00:00	-5
117	117	2.27000000000000002	1984-11-07 00:00:00	-5
118	118	1	1984-11-07 00:00:00	-5
119	119	0.282999999999999974	1984-11-07 00:00:00	-5
120	120	0.130000000000000004	1984-11-07 00:00:00	-5
121	121	218	1984-11-07 00:00:00	-5
122	122	9.41999999999999993	1984-11-23 00:00:00	-5
123	123	1.80000000000000004	1984-11-23 00:00:00	-5
124	124	1.10000000000000009	1984-11-23 00:00:00	-5
125	125	0.222000000000000003	1984-11-23 00:00:00	-5
126	126	0.130000000000000004	1984-11-23 00:00:00	-5
127	127	171	1984-11-23 00:00:00	-5
128	128	9.63000000000000078	1984-12-05 00:00:00	-5
129	129	1.78000000000000003	1984-12-05 00:00:00	-5
130	130	1	1984-12-05 00:00:00	-5
131	131	0.215999999999999998	1984-12-05 00:00:00	-5
132	132	0.119999999999999996	1984-12-05 00:00:00	-5
133	133	180	1984-12-05 00:00:00	-5
134	134	9.03999999999999915	1984-12-18 00:00:00	-5
135	135	3.2200000000000002	1984-12-18 00:00:00	-5
136	136	0.900000000000000022	1984-12-18 00:00:00	-5
137	137	0.41499999999999998	1984-12-18 00:00:00	-5
138	138	0.119999999999999996	1984-12-18 00:00:00	-5
139	139	346	1984-12-18 00:00:00	-5
140	140	187	1985-02-13 00:00:00	-5
141	141	9.03999999999999915	1985-03-06 00:00:00	-5
142	142	1.98999999999999999	1985-03-06 00:00:00	-5
143	143	0.900000000000000022	1985-03-06 00:00:00	-5
144	144	0.257000000000000006	1985-03-06 00:00:00	-5
145	145	0.119999999999999996	1985-03-06 00:00:00	-5
146	146	214	1985-03-06 00:00:00	-5
147	147	8.84999999999999964	1985-03-20 00:00:00	-5
148	148	1.89999999999999991	1985-03-20 00:00:00	-5
149	149	0.900000000000000022	1985-03-20 00:00:00	-5
150	150	0.251000000000000001	1985-03-20 00:00:00	-5
151	151	0.119999999999999996	1985-03-20 00:00:00	-5
152	152	209	1985-03-20 00:00:00	-5
153	153	9.33000000000000007	1985-04-03 00:00:00	-5
154	154	2.29999999999999982	1985-04-03 00:00:00	-5
155	155	1	1985-04-03 00:00:00	-5
156	156	0.286999999999999977	1985-04-03 00:00:00	-5
157	157	0.130000000000000004	1985-04-03 00:00:00	-5
158	158	221	1985-04-03 00:00:00	-5
159	159	9.15000000000000036	1985-04-17 00:00:00	-5
160	160	2.20999999999999996	1985-04-17 00:00:00	-5
161	161	1	1985-04-17 00:00:00	-5
162	162	0.281999999999999973	1985-04-17 00:00:00	-5
163	163	0.130000000000000004	1985-04-17 00:00:00	-5
164	164	217	1985-04-17 00:00:00	-5
165	165	9.41999999999999993	1985-05-02 00:00:00	-5
166	166	2.60999999999999988	1985-05-02 00:00:00	-5
167	167	1.10000000000000009	1985-05-02 00:00:00	-5
168	168	0.32400000000000001	1985-05-02 00:00:00	-5
169	169	0.130000000000000004	1985-05-02 00:00:00	-5
170	170	249	1985-05-02 00:00:00	-5
171	171	9.6899999999999995	1985-05-15 00:00:00	-5
172	172	2.29000000000000004	1985-05-15 00:00:00	-5
173	173	1.10000000000000009	1985-05-15 00:00:00	-5
174	174	0.276000000000000023	1985-05-15 00:00:00	-5
175	175	0.130000000000000004	1985-05-15 00:00:00	-5
176	176	212	1985-05-15 00:00:00	-5
177	177	10.4000000000000004	1985-05-29 00:00:00	-5
178	178	1.92999999999999994	1985-05-29 00:00:00	-5
179	179	1	1985-05-29 00:00:00	-5
180	180	0.216999999999999998	1985-05-29 00:00:00	-5
181	181	0.1095	1985-05-29 00:00:00	-5
182	182	198	1985-05-29 00:00:00	-5
183	183	10.0299999999999994	1985-06-12 00:00:00	-5
184	184	2.10000000000000009	1985-06-12 00:00:00	-5
185	185	1.10000000000000009	1985-06-12 00:00:00	-5
186	186	0.243999999999999995	1985-06-12 00:00:00	-5
187	187	0.1245	1985-06-12 00:00:00	-5
188	188	196	1985-06-12 00:00:00	-5
189	189	10.2599999999999998	1985-06-26 00:00:00	-5
190	190	1.87999999999999989	1985-06-26 00:00:00	-5
191	191	1.19999999999999996	1985-06-26 00:00:00	-5
192	192	0.213999999999999996	1985-06-26 00:00:00	-5
193	193	0.137899999999999995	1985-06-26 00:00:00	-5
194	194	155	1985-06-26 00:00:00	-5
195	195	10.1600000000000001	1985-07-10 00:00:00	-5
196	196	1.67999999999999994	1985-07-10 00:00:00	-5
197	197	1.19999999999999996	1985-07-10 00:00:00	-5
198	198	0.193000000000000005	1985-07-10 00:00:00	-5
199	199	0.132200000000000012	1985-07-10 00:00:00	-5
200	200	146	1985-07-10 00:00:00	-5
201	201	9.42999999999999972	1985-10-10 00:00:00	-5
202	202	1.98999999999999999	1985-10-10 00:00:00	-5
203	203	1.39999999999999991	1985-10-10 00:00:00	-5
204	204	0.245999999999999996	1985-10-10 00:00:00	-5
205	205	0.171800000000000008	1985-10-10 00:00:00	-5
206	206	143.199999999999989	1985-10-10 00:00:00	-5
207	207	9.90000000000000036	1985-10-30 00:00:00	-5
208	208	2.85000000000000009	1985-10-30 00:00:00	-5
209	209	1.10000000000000009	1985-10-30 00:00:00	-5
210	210	0.336000000000000021	1985-10-30 00:00:00	-5
211	211	0.126400000000000012	1985-10-30 00:00:00	-5
212	212	266	1985-10-30 00:00:00	-5
213	213	10.0199999999999996	1985-11-13 00:00:00	-5
214	214	2.14000000000000012	1985-11-13 00:00:00	-5
215	215	1.10000000000000009	1985-11-13 00:00:00	-5
216	216	0.248999999999999999	1985-11-13 00:00:00	-5
217	217	0.128000000000000003	1985-11-13 00:00:00	-5
218	218	194.400000000000006	1985-11-13 00:00:00	-5
219	219	192.599999999999994	1985-11-27 00:00:00	-5
220	220	321.100000000000023	1985-12-12 00:00:00	-5
221	221	9.59999999999999964	1985-12-26 00:00:00	-5
222	222	2.74000000000000021	1985-12-26 00:00:00	-5
223	223	1.10000000000000009	1985-12-26 00:00:00	-5
224	224	0.333000000000000018	1985-12-26 00:00:00	-5
225	225	0.134800000000000003	1985-12-26 00:00:00	-5
226	226	247.199999999999989	1985-12-26 00:00:00	-5
227	227	9.77999999999999936	1986-01-10 00:00:00	-5
228	228	1.98999999999999999	1986-01-10 00:00:00	-5
229	229	0.900000000000000022	1986-01-10 00:00:00	-5
230	230	0.236999999999999988	1986-01-10 00:00:00	-5
231	231	0.112199999999999994	1986-01-10 00:00:00	-5
232	232	211.599999999999994	1986-01-10 00:00:00	-5
233	233	9.5600000000000005	1986-01-30 00:00:00	-5
234	234	3.50999999999999979	1986-01-30 00:00:00	-5
235	235	1	1986-01-30 00:00:00	-5
236	236	0.428999999999999992	1986-01-30 00:00:00	-5
237	237	0.126700000000000007	1986-01-30 00:00:00	-5
238	238	338.300000000000011	1986-01-30 00:00:00	-5
239	239	9.58000000000000007	1986-02-14 00:00:00	-5
240	240	3.00999999999999979	1986-02-14 00:00:00	-5
241	241	1.10000000000000009	1986-02-14 00:00:00	-5
242	242	0.365999999999999992	1986-02-14 00:00:00	-5
243	243	0.131599999999999995	1986-02-14 00:00:00	-5
244	244	278.399999999999977	1986-02-14 00:00:00	-5
245	245	9.16999999999999993	1986-03-04 00:00:00	-5
246	246	2.25999999999999979	1986-03-04 00:00:00	-5
247	247	0.900000000000000022	1986-03-04 00:00:00	-5
248	248	0.287999999999999978	1986-03-04 00:00:00	-5
249	249	0.120200000000000001	1986-03-04 00:00:00	-5
250	250	239.400000000000006	1986-03-04 00:00:00	-5
251	251	9.39000000000000057	1986-03-21 00:00:00	-5
252	252	2.14000000000000012	1986-03-21 00:00:00	-5
253	253	1.10000000000000009	1986-03-21 00:00:00	-5
254	254	0.266000000000000014	1986-03-21 00:00:00	-5
255	255	0.130299999999999999	1986-03-21 00:00:00	-5
256	256	204.099999999999994	1986-03-21 00:00:00	-5
257	257	9.83000000000000007	1986-04-12 00:00:00	-5
258	258	1.92999999999999994	1986-04-12 00:00:00	-5
259	259	1	1986-04-12 00:00:00	-5
260	260	0.229000000000000009	1986-04-12 00:00:00	-5
261	261	0.116199999999999998	1986-04-12 00:00:00	-5
262	262	196.900000000000006	1986-04-12 00:00:00	-5
263	263	166	1986-04-28 00:00:00	-5
264	264	133	1986-05-21 00:00:00	-5
265	265	119	1986-06-17 00:00:00	-5
266	266	123	1986-07-02 00:00:00	-5
267	267	109	1986-08-20 00:00:00	-5
268	268	111	1986-09-12 00:00:00	-5
269	269	207	1986-10-21 00:00:00	-5
270	270	187	1986-11-05 00:00:00	-5
271	271	227	1986-11-19 00:00:00	-5
272	272	1.10000000000000009	1987-06-05 00:00:00	-5
273	273	0.130599999999999994	1987-06-05 00:00:00	-5
274	274	1	1987-06-28 00:00:00	-5
275	275	0.0926000000000000018	1987-06-28 00:00:00	-5
276	276	10.2400000000000002	1987-08-25 00:00:00	-5
277	277	1.52000000000000002	1987-08-25 00:00:00	-5
278	278	1.39999999999999991	1987-08-25 00:00:00	-5
279	279	0.173999999999999988	1987-08-25 00:00:00	-5
280	280	0.153599999999999987	1987-08-25 00:00:00	-5
281	281	113	1987-08-25 00:00:00	-5
282	282	9.39000000000000057	1987-09-30 00:00:00	-5
283	283	1.48999999999999999	1987-09-30 00:00:00	-5
284	284	1.39999999999999991	1987-09-30 00:00:00	-5
285	285	0.185999999999999999	1987-09-30 00:00:00	-5
286	286	0.173499999999999988	1987-09-30 00:00:00	-5
287	287	107	1987-09-30 00:00:00	-5
288	288	10.3399999999999999	1988-01-08 00:00:00	-5
289	289	3.0299999999999998	1988-01-08 00:00:00	-5
290	290	1.10000000000000009	1988-01-08 00:00:00	-5
291	291	0.342000000000000026	1988-01-08 00:00:00	-5
292	292	0.119300000000000003	1988-01-08 00:00:00	-5
293	293	287	1988-01-08 00:00:00	-5
294	294	10.2599999999999998	1988-02-05 00:00:00	-5
295	295	2.22999999999999998	1988-02-05 00:00:00	-5
296	296	1.30000000000000004	1988-02-05 00:00:00	-5
297	297	0.253000000000000003	1988-02-05 00:00:00	-5
298	298	0.142199999999999993	1988-02-05 00:00:00	-5
299	299	178	1988-02-05 00:00:00	-5
300	300	10.5199999999999996	1988-04-21 00:00:00	-5
301	301	2.10999999999999988	1988-04-21 00:00:00	-5
302	302	1.19999999999999996	1988-04-21 00:00:00	-5
303	303	0.234000000000000014	1988-04-21 00:00:00	-5
304	304	0.127299999999999996	1988-04-21 00:00:00	-5
305	305	184	1988-04-21 00:00:00	-5
306	306	9.78999999999999915	1988-05-20 00:00:00	-5
307	307	1.62999999999999989	1988-05-20 00:00:00	-5
308	308	1.5	1988-05-20 00:00:00	-5
309	309	0.194000000000000006	1988-05-20 00:00:00	-5
310	310	0.176400000000000001	1988-05-20 00:00:00	-5
311	311	110	1988-05-20 00:00:00	-5
312	312	10.8800000000000008	1988-06-29 00:00:00	-5
313	313	3.20000000000000018	1988-06-29 00:00:00	-5
314	314	2.20000000000000018	1988-06-29 00:00:00	-5
315	315	0.343000000000000027	1988-06-29 00:00:00	-5
316	316	0.231699999999999989	1988-06-29 00:00:00	-5
317	317	148	1988-06-29 00:00:00	-5
318	318	10.0899999999999999	1988-07-18 00:00:00	-5
319	319	1.44999999999999996	1988-07-18 00:00:00	-5
320	320	1.60000000000000009	1988-07-18 00:00:00	-5
321	321	0.16800000000000001	1988-07-18 00:00:00	-5
322	322	0.182100000000000012	1988-07-18 00:00:00	-5
323	323	92	1988-07-18 00:00:00	-5
324	324	10.4700000000000006	1988-08-28 00:00:00	-5
325	325	1.91999999999999993	1988-08-28 00:00:00	-5
326	326	2.29999999999999982	1988-08-28 00:00:00	-5
327	327	0.213999999999999996	1988-08-28 00:00:00	-5
328	328	0.254300000000000026	1988-08-28 00:00:00	-5
329	329	84	1988-08-28 00:00:00	-5
330	330	9.09999999999999964	1988-09-23 00:00:00	-5
331	331	1.68999999999999995	1988-09-23 00:00:00	-5
332	332	2	1988-09-23 00:00:00	-5
333	333	0.215999999999999998	1988-09-23 00:00:00	-5
334	334	0.260599999999999998	1988-09-23 00:00:00	-5
335	335	83	1988-09-23 00:00:00	-5
336	336	10.25	1989-02-01 00:00:00	-5
337	337	3.24000000000000021	1989-02-01 00:00:00	-5
338	338	1	1989-02-01 00:00:00	-5
339	339	0.367999999999999994	1989-02-01 00:00:00	-5
340	340	0.116599999999999995	1989-02-01 00:00:00	-5
341	341	316	1989-02-01 00:00:00	-5
342	342	10.1300000000000008	1989-03-12 00:00:00	-5
343	343	2.39000000000000012	1989-03-12 00:00:00	-5
344	344	1.30000000000000004	1989-03-12 00:00:00	-5
345	345	0.276000000000000023	1989-03-12 00:00:00	-5
346	346	0.151499999999999996	1989-03-12 00:00:00	-5
347	347	182	1989-03-12 00:00:00	-5
348	348	12.0600000000000005	1989-07-11 00:00:00	-5
349	349	1.64999999999999991	1989-07-11 00:00:00	-5
350	350	2.10000000000000009	1989-07-11 00:00:00	-5
351	351	0.159000000000000002	1989-07-11 00:00:00	-5
352	352	0.199199999999999988	1989-07-11 00:00:00	-5
353	353	80	1989-07-11 00:00:00	-5
354	354	11.8300000000000001	1989-08-10 00:00:00	-5
355	355	1.71999999999999997	1989-08-10 00:00:00	-5
356	356	2.5	1989-08-10 00:00:00	-5
357	357	0.170000000000000012	1989-08-10 00:00:00	-5
358	358	0.246499999999999997	1989-08-10 00:00:00	-5
359	359	69	1989-08-10 00:00:00	-5
360	360	10.9800000000000004	1989-10-17 00:00:00	-5
361	361	1.67999999999999994	1989-10-17 00:00:00	-5
362	362	1.5	1989-10-17 00:00:00	-5
363	363	0.178999999999999992	1989-10-17 00:00:00	-5
364	364	0.162399999999999989	1989-10-17 00:00:00	-5
365	365	110	1989-10-17 00:00:00	-5
366	366	10.6199999999999992	1989-11-19 00:00:00	-5
367	367	1.84000000000000008	1989-11-19 00:00:00	-5
368	368	1.19999999999999996	1989-11-19 00:00:00	-5
369	369	0.202000000000000013	1989-11-19 00:00:00	-5
370	370	0.133000000000000007	1989-11-19 00:00:00	-5
371	371	152	1989-11-19 00:00:00	-5
372	372	11.4600000000000009	1989-12-12 00:00:00	-5
373	373	1.77000000000000002	1989-12-12 00:00:00	-5
374	374	1.30000000000000004	1989-12-12 00:00:00	-5
375	375	0.179999999999999993	1989-12-12 00:00:00	-5
376	376	0.131399999999999989	1989-12-12 00:00:00	-5
377	377	137	1989-12-12 00:00:00	-5
378	378	199	1990-03-13 00:00:00	-5
379	379	106	1990-06-11 00:00:00	-5
380	380	83	1990-09-14 00:00:00	-5
381	381	111	1990-10-17 00:00:00	-5
382	382	259	1990-12-01 00:00:00	-5
383	383	244	1991-01-15 00:00:00	-5
384	384	184	1991-02-08 00:00:00	-5
385	385	208	1991-03-25 00:00:00	-5
386	386	94	1991-06-28 00:00:00	-5
387	387	92.7999999999999972	1991-08-01 00:00:00	-5
388	388	83	1991-10-05 00:00:00	-5
389	389	127	1991-10-29 00:00:00	-5
390	390	251	1991-12-06 00:00:00	-5
391	391	220	1992-01-18 00:00:00	-5
392	392	194	1992-02-22 00:00:00	-5
393	393	307	1992-03-24 00:00:00	-5
394	394	215	1992-04-24 00:00:00	-5
395	395	173	1992-05-14 00:00:00	-5
396	396	132	1992-06-16 00:00:00	-5
397	397	157	1993-03-24 00:00:00	-5
398	398	113	1993-04-17 00:00:00	-5
399	399	88	1993-06-20 00:00:00	-5
400	400	97	1993-08-24 00:00:00	-5
401	401	18.6700000000000017	1983-01-17 00:00:00	-5
402	402	0.359999999999999987	1983-01-17 00:00:00	-5
403	403	0.800000000000000044	1983-01-17 00:00:00	-5
404	404	0.0229999999999999996	1983-01-17 00:00:00	-5
405	405	0.0500000000000000028	1983-01-17 00:00:00	-5
406	406	45	1983-01-17 00:00:00	-5
407	407	17.9699999999999989	1983-01-27 00:00:00	-5
408	408	0.540000000000000036	1983-01-27 00:00:00	-5
409	409	0.770000000000000018	1983-01-27 00:00:00	-5
410	410	0.0350000000000000033	1983-01-27 00:00:00	-5
411	411	0.0500000000000000028	1983-01-27 00:00:00	-5
412	412	70	1983-01-27 00:00:00	-5
413	413	25.6700000000000017	1983-02-08 00:00:00	-5
414	414	0.719999999999999973	1983-02-08 00:00:00	-5
415	415	1.10000000000000009	1983-02-08 00:00:00	-5
416	416	0.0330000000000000016	1983-02-08 00:00:00	-5
417	417	0.0500000000000000028	1983-02-08 00:00:00	-5
418	418	65	1983-02-08 00:00:00	-5
419	419	26.370000000000001	1983-02-21 00:00:00	-5
420	420	0.819999999999999951	1983-02-21 00:00:00	-5
421	421	1.12999999999999989	1983-02-21 00:00:00	-5
422	422	0.0369999999999999982	1983-02-21 00:00:00	-5
423	423	0.0500000000000000028	1983-02-21 00:00:00	-5
424	424	73	1983-02-21 00:00:00	-5
425	425	21.1900000000000013	1983-03-03 00:00:00	-5
426	426	0.680000000000000049	1983-03-03 00:00:00	-5
427	427	1.09000000000000008	1983-03-03 00:00:00	-5
428	428	0.0369999999999999982	1983-03-03 00:00:00	-5
429	429	0.0599999999999999978	1983-03-03 00:00:00	-5
430	430	62	1983-03-03 00:00:00	-5
431	431	56	1983-06-07 00:00:00	-5
432	432	21.5799999999999983	1983-07-21 00:00:00	-5
433	433	0.299999999999999989	1983-07-21 00:00:00	-5
434	434	0.739999999999999991	1983-07-21 00:00:00	-5
435	435	0.0160000000000000003	1983-07-21 00:00:00	-5
436	436	0.0400000000000000008	1983-07-21 00:00:00	-5
437	437	41	1983-07-21 00:00:00	-5
438	438	20.5300000000000011	1983-08-11 00:00:00	-5
439	439	0.130000000000000004	1983-08-11 00:00:00	-5
440	440	0.880000000000000004	1983-08-11 00:00:00	-5
441	441	0.00800000000000000017	1983-08-11 00:00:00	-5
442	442	0.0500000000000000028	1983-08-11 00:00:00	-5
443	443	15	1983-08-11 00:00:00	-5
444	444	23.3299999999999983	1983-09-10 00:00:00	-5
445	445	0.160000000000000003	1983-09-10 00:00:00	-5
446	446	1.19999999999999996	1983-09-10 00:00:00	-5
447	447	0.00800000000000000017	1983-09-10 00:00:00	-5
448	448	0.0599999999999999978	1983-09-10 00:00:00	-5
449	449	13	1983-09-10 00:00:00	-5
450	450	26.6000000000000014	1983-09-20 00:00:00	-5
451	451	0.220000000000000001	1983-09-20 00:00:00	-5
452	452	1.1399999999999999	1983-09-20 00:00:00	-5
453	453	0.0100000000000000002	1983-09-20 00:00:00	-5
454	454	0.0500000000000000028	1983-09-20 00:00:00	-5
455	455	19	1983-09-20 00:00:00	-5
456	456	26.370000000000001	1983-09-30 00:00:00	-5
457	457	0.270000000000000018	1983-09-30 00:00:00	-5
458	458	2.25999999999999979	1983-09-30 00:00:00	-5
459	459	0.0120000000000000002	1983-09-30 00:00:00	-5
460	460	0.100000000000000006	1983-09-30 00:00:00	-5
461	461	12	1983-09-30 00:00:00	-5
462	462	21.7800000000000011	1983-12-16 00:00:00	-5
463	463	0.46000000000000002	1983-12-16 00:00:00	-5
464	464	1.12000000000000011	1983-12-16 00:00:00	-5
465	465	0.0250000000000000014	1983-12-16 00:00:00	-5
466	466	0.0599999999999999978	1983-12-16 00:00:00	-5
467	467	41	1983-12-16 00:00:00	-5
468	468	25.1999999999999993	1984-01-03 00:00:00	-5
469	469	0.660000000000000031	1984-01-03 00:00:00	-5
470	470	1.08000000000000007	1984-01-03 00:00:00	-5
471	471	0.0309999999999999998	1984-01-03 00:00:00	-5
472	472	0.0500000000000000028	1984-01-03 00:00:00	-5
473	473	61	1984-01-03 00:00:00	-5
474	474	25.8999999999999986	1984-01-19 00:00:00	-5
475	475	0.560000000000000053	1984-01-19 00:00:00	-5
476	476	1.1100000000000001	1984-01-19 00:00:00	-5
477	477	0.0250000000000000014	1984-01-19 00:00:00	-5
478	478	0.0500000000000000028	1984-01-19 00:00:00	-5
479	479	50	1984-01-19 00:00:00	-5
480	480	22.1700000000000017	1984-03-20 00:00:00	-5
481	481	0.520000000000000018	1984-03-20 00:00:00	-5
482	482	0.760000000000000009	1984-03-20 00:00:00	-5
483	483	0.0269999999999999997	1984-03-20 00:00:00	-5
484	484	0.0400000000000000008	1984-03-20 00:00:00	-5
485	485	68	1984-03-20 00:00:00	-5
486	486	20.7699999999999996	1984-04-05 00:00:00	-5
487	487	0.640000000000000013	1984-04-05 00:00:00	-5
488	488	0.890000000000000013	1984-04-05 00:00:00	-5
489	489	0.0359999999999999973	1984-04-05 00:00:00	-5
490	490	0.0500000000000000028	1984-04-05 00:00:00	-5
491	491	72	1984-04-05 00:00:00	-5
492	492	34.2299999999999969	1984-09-13 00:00:00	-5
493	493	0.489999999999999991	1984-09-13 00:00:00	-5
494	494	2.05399999999999983	1984-09-13 00:00:00	-5
495	495	0.0170000000000000012	1984-09-13 00:00:00	-5
496	496	0.0700000000000000067	1984-09-13 00:00:00	-5
497	497	24	1984-09-13 00:00:00	-5
498	498	23.9200000000000017	1984-09-27 00:00:00	-5
499	499	0.309999999999999998	1984-09-27 00:00:00	-5
500	500	1.6399999999999999	1984-09-27 00:00:00	-5
501	501	0.0149999999999999994	1984-09-27 00:00:00	-5
502	502	0.0800000000000000017	1984-09-27 00:00:00	-5
503	503	19	1984-09-27 00:00:00	-5
504	504	26.4400000000000013	1984-10-10 00:00:00	-5
505	505	0.200000000000000011	1984-10-10 00:00:00	-5
506	506	2.04000000000000004	1984-10-10 00:00:00	-5
507	507	0.00899999999999999932	1984-10-10 00:00:00	-5
508	508	0.0899999999999999967	1984-10-10 00:00:00	-5
509	509	10	1984-10-10 00:00:00	-5
510	510	19.3999999999999986	1984-10-25 00:00:00	-5
511	511	0.23000000000000001	1984-10-25 00:00:00	-5
512	512	1.33000000000000007	1984-10-25 00:00:00	-5
513	513	0.0140000000000000003	1984-10-25 00:00:00	-5
514	514	0.0800000000000000017	1984-10-25 00:00:00	-5
515	515	17	1984-10-25 00:00:00	-5
516	516	26	1984-11-07 00:00:00	-5
517	517	22.6900000000000013	1984-11-23 00:00:00	-5
518	518	0.299999999999999989	1984-11-23 00:00:00	-5
519	519	1.75	1984-11-23 00:00:00	-5
520	520	0.0149999999999999994	1984-11-23 00:00:00	-5
521	521	0.0899999999999999967	1984-11-23 00:00:00	-5
522	522	17	1984-11-23 00:00:00	-5
523	523	21	1984-12-05 00:00:00	-5
524	524	0.340000000000000024	1984-12-05 00:00:00	-5
525	525	1.62000000000000011	1984-12-05 00:00:00	-5
526	526	0.0189999999999999995	1984-12-05 00:00:00	-5
527	527	0.0899999999999999967	1984-12-05 00:00:00	-5
528	528	21	1984-12-05 00:00:00	-5
529	529	21.7300000000000004	1984-12-18 00:00:00	-5
530	530	0.57999999999999996	1984-12-18 00:00:00	-5
531	531	1.48999999999999999	1984-12-18 00:00:00	-5
532	532	0.0309999999999999998	1984-12-18 00:00:00	-5
533	533	0.0800000000000000017	1984-12-18 00:00:00	-5
534	534	39	1984-12-18 00:00:00	-5
535	535	20.8900000000000006	1985-02-13 00:00:00	-5
536	536	0.25	1985-02-13 00:00:00	-5
537	537	0.950899999999999967	1985-02-13 00:00:00	-5
538	538	0.0140000000000000003	1985-02-13 00:00:00	-5
539	539	0.0531000000000000014	1985-02-13 00:00:00	-5
540	540	26	1985-02-13 00:00:00	-5
541	541	20.8099999999999987	1985-03-06 00:00:00	-5
542	542	0.270000000000000018	1985-03-06 00:00:00	-5
543	543	1.07000000000000006	1985-03-06 00:00:00	-5
544	544	0.0149999999999999994	1985-03-06 00:00:00	-5
545	545	0.0599999999999999978	1985-03-06 00:00:00	-5
546	546	25	1985-03-06 00:00:00	-5
547	547	21.4699999999999989	1985-03-20 00:00:00	-5
548	548	0.330000000000000016	1985-03-20 00:00:00	-5
549	549	0.92000000000000004	1985-03-20 00:00:00	-5
550	550	0.0179999999999999986	1985-03-20 00:00:00	-5
551	551	0.0500000000000000028	1985-03-20 00:00:00	-5
552	552	36	1985-03-20 00:00:00	-5
553	553	22	1985-04-03 00:00:00	-5
554	554	0.450000000000000011	1985-04-03 00:00:00	-5
555	555	1.32000000000000006	1985-04-03 00:00:00	-5
556	556	0.0240000000000000005	1985-04-03 00:00:00	-5
557	557	0.0700000000000000067	1985-04-03 00:00:00	-5
558	558	34	1985-04-03 00:00:00	-5
559	559	210	1985-04-17 00:00:00	-5
560	560	0.440000000000000002	1985-04-17 00:00:00	-5
561	561	1.08000000000000007	1985-04-17 00:00:00	-5
562	562	0.00200000000000000004	1985-04-17 00:00:00	-5
563	563	0.00600000000000000012	1985-04-17 00:00:00	-5
564	564	41	1985-04-17 00:00:00	-5
565	565	22.75	1985-05-02 00:00:00	-5
566	566	0.349999999999999978	1985-05-02 00:00:00	-5
567	567	0.780000000000000027	1985-05-02 00:00:00	-5
568	568	0.0179999999999999986	1985-05-02 00:00:00	-5
569	569	0.0400000000000000008	1985-05-02 00:00:00	-5
570	570	45	1985-05-02 00:00:00	-5
571	571	20.0700000000000003	1985-05-15 00:00:00	-5
572	572	0.489999999999999991	1985-05-15 00:00:00	-5
573	573	0.859999999999999987	1985-05-15 00:00:00	-5
574	574	0.0290000000000000015	1985-05-15 00:00:00	-5
575	575	0.0500000000000000028	1985-05-15 00:00:00	-5
576	576	57	1985-05-15 00:00:00	-5
577	577	17.8299999999999983	1985-05-29 00:00:00	-5
578	578	0.450000000000000011	1985-05-29 00:00:00	-5
579	579	0.810000000000000053	1985-05-29 00:00:00	-5
580	580	0.0299999999999999989	1985-05-29 00:00:00	-5
581	581	0.0529999999999999985	1985-05-29 00:00:00	-5
582	582	56	1985-05-29 00:00:00	-5
583	583	20.8299999999999983	1985-06-12 00:00:00	-5
584	584	0.380000000000000004	1985-06-12 00:00:00	-5
585	585	0.769700000000000051	1985-06-12 00:00:00	-5
586	586	0.0219999999999999987	1985-06-12 00:00:00	-5
587	587	0.0430999999999999994	1985-06-12 00:00:00	-5
588	588	50	1985-06-12 00:00:00	-5
589	589	20.3299999999999983	1985-06-26 00:00:00	-5
590	590	0.359999999999999987	1985-06-26 00:00:00	-5
591	591	0.95665	1985-06-26 00:00:00	-5
592	592	0.0210000000000000013	1985-06-26 00:00:00	-5
593	593	0.0548999999999999974	1985-06-26 00:00:00	-5
594	594	38	1985-06-26 00:00:00	-5
595	595	23.2199999999999989	1985-07-10 00:00:00	-5
596	596	0.400000000000000022	1985-07-10 00:00:00	-5
597	597	0.987199999999999966	1985-07-10 00:00:00	-5
598	598	0.0200000000000000004	1985-07-10 00:00:00	-5
599	599	0.0495999999999999983	1985-07-10 00:00:00	-5
600	600	41	1985-07-10 00:00:00	-5
601	601	28.1799999999999997	1985-10-10 00:00:00	-5
602	602	0.340000000000000024	1985-10-10 00:00:00	-5
603	603	2.61799999999999988	1985-10-10 00:00:00	-5
604	604	0.0140000000000000003	1985-10-10 00:00:00	-5
605	605	0.108399999999999996	1985-10-10 00:00:00	-5
606	606	13	1985-10-10 00:00:00	-5
607	607	20.4899999999999984	1985-10-30 00:00:00	-5
608	608	0.440000000000000002	1985-10-30 00:00:00	-5
609	609	1.03820000000000001	1985-10-30 00:00:00	-5
610	610	0.0250000000000000014	1985-10-30 00:00:00	-5
611	611	0.0590999999999999998	1985-10-30 00:00:00	-5
612	612	42	1985-10-30 00:00:00	-5
613	613	24.4400000000000013	1985-11-13 00:00:00	-5
614	614	0.479999999999999982	1985-11-13 00:00:00	-5
615	615	1.61280000000000001	1985-11-13 00:00:00	-5
616	616	0.0229999999999999996	1985-11-13 00:00:00	-5
617	617	0.076999999999999999	1985-11-13 00:00:00	-5
618	618	30	1985-11-13 00:00:00	-5
619	619	22	1985-11-27 00:00:00	-5
620	620	49	1985-12-12 00:00:00	-5
621	621	21.3399999999999999	1985-12-26 00:00:00	-5
622	622	0.589999999999999969	1985-12-26 00:00:00	-5
623	623	1.20199999999999996	1985-12-26 00:00:00	-5
624	624	0.0320000000000000007	1985-12-26 00:00:00	-5
625	625	0.0656999999999999945	1985-12-26 00:00:00	-5
626	626	49	1985-12-26 00:00:00	-5
627	627	23.2399999999999984	1986-01-10 00:00:00	-5
628	628	0.340000000000000024	1986-01-10 00:00:00	-5
629	629	1.04800000000000004	1986-01-10 00:00:00	-5
630	630	0.0170000000000000012	1986-01-10 00:00:00	-5
631	631	0.0526000000000000009	1986-01-10 00:00:00	-5
632	632	32	1986-01-10 00:00:00	-5
633	633	21.9699999999999989	1986-01-30 00:00:00	-5
634	634	0.409999999999999976	1986-01-30 00:00:00	-5
635	635	1.27879999999999994	1986-01-30 00:00:00	-5
636	636	0.0219999999999999987	1986-01-30 00:00:00	-5
637	637	0.067900000000000002	1986-01-30 00:00:00	-5
638	638	32	1986-01-30 00:00:00	-5
639	639	21.879999999999999	1986-02-14 00:00:00	-5
640	640	0.320000000000000007	1986-02-14 00:00:00	-5
641	641	0.829099999999999948	1986-02-14 00:00:00	-5
642	642	0.0170000000000000012	1986-02-14 00:00:00	-5
643	643	0.0442000000000000032	1986-02-14 00:00:00	-5
644	644	38	1986-02-14 00:00:00	-5
645	645	29.2800000000000011	1986-03-04 00:00:00	-5
646	646	0.510000000000000009	1986-03-04 00:00:00	-5
647	647	1.2548999999999999	1986-03-04 00:00:00	-5
648	648	0.0210000000000000013	1986-03-04 00:00:00	-5
649	649	0.0500000000000000028	1986-03-04 00:00:00	-5
650	650	41	1986-03-04 00:00:00	-5
651	651	23.9600000000000009	1986-03-21 00:00:00	-5
652	652	0.739999999999999991	1986-03-21 00:00:00	-5
653	653	1.12759999999999994	1986-03-21 00:00:00	-5
654	654	0.0359999999999999973	1986-03-21 00:00:00	-5
655	655	0.0548999999999999974	1986-03-21 00:00:00	-5
656	656	66	1986-03-21 00:00:00	-5
657	657	23.4400000000000013	1986-04-12 00:00:00	-5
658	658	0.699999999999999956	1986-04-12 00:00:00	-5
659	659	0.970500000000000029	1986-04-12 00:00:00	-5
660	660	0.0350000000000000033	1986-04-12 00:00:00	-5
661	661	0.0483000000000000027	1986-04-12 00:00:00	-5
662	662	72	1986-04-12 00:00:00	-5
663	663	79	1986-04-28 00:00:00	-5
664	664	72	1986-05-21 00:00:00	-5
665	665	65	1986-07-02 00:00:00	-5
666	666	42	1986-08-20 00:00:00	-5
667	667	29	1986-09-12 00:00:00	-5
668	668	33	1986-10-21 00:00:00	-5
669	669	41	1986-11-05 00:00:00	-5
670	670	38	1986-11-19 00:00:00	-5
671	671	22.1290300000000002	1987-06-05 00:00:00	-5
672	672	0.764399999999999968	1987-06-05 00:00:00	-5
673	673	0.0403000000000000025	1987-06-05 00:00:00	-5
674	674	22.2460599999999999	1987-06-28 00:00:00	-5
675	675	0.644499999999999962	1987-06-28 00:00:00	-5
676	676	0.0337999999999999967	1987-06-28 00:00:00	-5
677	677	11.4600600000000004	1987-08-25 00:00:00	-5
678	678	2.2298	1987-08-25 00:00:00	-5
679	679	0.227000000000000007	1987-08-25 00:00:00	-5
680	680	18.3900000000000006	1987-09-30 00:00:00	-5
681	681	0.160000000000000003	1987-09-30 00:00:00	-5
682	682	2.22299999999999986	1987-09-30 00:00:00	-5
683	683	0.0100000000000000002	1987-09-30 00:00:00	-5
684	684	0.140999999999999986	1987-09-30 00:00:00	-5
685	685	7	1987-09-30 00:00:00	-5
686	686	23.1506299999999996	1988-01-08 00:00:00	-5
687	687	0.887000000000000011	1988-01-08 00:00:00	-5
688	688	0.0446999999999999967	1988-01-08 00:00:00	-5
689	689	28.3900000000000006	1988-02-05 00:00:00	-5
690	690	0.709999999999999964	1988-02-05 00:00:00	-5
691	691	1.4890000000000001	1988-02-05 00:00:00	-5
692	692	0.0290000000000000015	1988-02-05 00:00:00	-5
693	693	0.0611999999999999975	1988-02-05 00:00:00	-5
694	694	48	1988-02-05 00:00:00	-5
695	695	17.5300000000000011	1988-04-21 00:00:00	-5
696	696	0.46000000000000002	1988-04-21 00:00:00	-5
697	697	0.878900000000000015	1988-04-21 00:00:00	-5
698	698	0.0299999999999999989	1988-04-21 00:00:00	-5
699	699	0.0585000000000000034	1988-04-21 00:00:00	-5
700	700	52	1988-04-21 00:00:00	-5
701	701	24.629999999999999	1988-05-20 00:00:00	-5
702	702	0.660000000000000031	1988-05-20 00:00:00	-5
703	703	1.06210000000000004	1988-05-20 00:00:00	-5
704	704	0.0309999999999999998	1988-05-20 00:00:00	-5
705	705	0.0502999999999999975	1988-05-20 00:00:00	-5
706	706	62	1988-05-20 00:00:00	-5
707	707	23.6099999999999994	1988-06-29 00:00:00	-5
708	708	0.309999999999999998	1988-06-29 00:00:00	-5
709	709	0.77090000000000003	1988-06-29 00:00:00	-5
710	710	0.0149999999999999994	1988-06-29 00:00:00	-5
711	711	0.0381000000000000019	1988-06-29 00:00:00	-5
712	712	40	1988-06-29 00:00:00	-5
713	713	17.5399999999999991	1988-07-18 00:00:00	-5
714	714	0.359999999999999987	1988-07-18 00:00:00	-5
715	715	0.550100000000000033	1988-07-18 00:00:00	-5
716	716	0.0240000000000000005	1988-07-18 00:00:00	-5
717	717	0.0366000000000000006	1988-07-18 00:00:00	-5
718	718	66	1988-07-18 00:00:00	-5
719	719	17.870000000000001	1988-08-28 00:00:00	-5
720	720	0.0800000000000000017	1988-08-28 00:00:00	-5
721	721	0.888399999999999967	1988-08-28 00:00:00	-5
722	722	0.0050000000000000001	1988-08-28 00:00:00	-5
723	723	0.0580000000000000029	1988-08-28 00:00:00	-5
724	724	9	1988-08-28 00:00:00	-5
725	725	24.1400000000000006	1988-09-23 00:00:00	-5
726	726	0.0200000000000000004	1988-09-23 00:00:00	-5
727	727	2.31510000000000016	1988-09-23 00:00:00	-5
728	728	0.00100000000000000002	1988-09-23 00:00:00	-5
729	729	0.111899999999999999	1988-09-23 00:00:00	-5
730	730	1	1988-09-23 00:00:00	-5
731	731	23.25	1989-02-01 00:00:00	-5
732	732	0.489999999999999991	1989-02-01 00:00:00	-5
733	733	1.59250000000000003	1989-02-01 00:00:00	-5
734	734	0.0250000000000000014	1989-02-01 00:00:00	-5
735	735	0.0798999999999999988	1989-02-01 00:00:00	-5
736	736	31	1989-02-01 00:00:00	-5
737	737	18.8599999999999994	1989-03-12 00:00:00	-5
738	738	0.409999999999999976	1989-03-12 00:00:00	-5
739	739	0.866500000000000048	1989-03-12 00:00:00	-5
740	740	0.0250000000000000014	1989-03-12 00:00:00	-5
741	741	0.0536000000000000018	1989-03-12 00:00:00	-5
742	742	47	1989-03-12 00:00:00	-5
743	743	22.2100000000000009	1989-07-11 00:00:00	-5
744	744	0.369999999999999996	1989-07-11 00:00:00	-5
745	745	0.75770000000000004	1989-07-11 00:00:00	-5
746	746	0.0200000000000000004	1989-07-11 00:00:00	-5
747	747	0.039800000000000002	1989-07-11 00:00:00	-5
748	748	49	1989-07-11 00:00:00	-5
749	749	21.3200000000000003	1989-08-10 00:00:00	-5
750	750	0.280000000000000027	1989-08-10 00:00:00	-5
751	751	0.776599999999999957	1989-08-10 00:00:00	-5
752	752	0.0149999999999999994	1989-08-10 00:00:00	-5
753	753	0.0425000000000000031	1989-08-10 00:00:00	-5
754	754	36	1989-08-10 00:00:00	-5
755	755	25.9299999999999997	1989-10-17 00:00:00	-5
756	756	0.239999999999999991	1989-10-17 00:00:00	-5
757	757	2.6987000000000001	1989-10-17 00:00:00	-5
758	758	0.0109999999999999994	1989-10-17 00:00:00	-5
759	759	0.121399999999999994	1989-10-17 00:00:00	-5
760	760	9	1989-10-17 00:00:00	-5
761	761	24.3399999999999999	1989-11-19 00:00:00	-5
762	762	0.340000000000000024	1989-11-19 00:00:00	-5
763	763	1.6774	1989-11-19 00:00:00	-5
764	764	0.0160000000000000003	1989-11-19 00:00:00	-5
765	765	0.0803999999999999992	1989-11-19 00:00:00	-5
766	766	20	1989-11-19 00:00:00	-5
767	767	20.3999999999999986	1989-12-12 00:00:00	-5
768	768	0.190000000000000002	1989-12-12 00:00:00	-5
769	769	0.928499999999999992	1989-12-12 00:00:00	-5
770	770	0.0109999999999999994	1989-12-12 00:00:00	-5
771	771	0.0531000000000000014	1989-12-12 00:00:00	-5
772	772	21	1989-12-12 00:00:00	-5
773	773	40	1990-03-13 00:00:00	-5
774	774	39	1990-06-11 00:00:00	-5
775	775	18	1990-09-14 00:00:00	-5
776	776	12	1990-10-17 00:00:00	-5
777	777	39	1990-12-01 00:00:00	-5
778	778	50	1991-01-15 00:00:00	-5
779	779	35	1991-02-08 00:00:00	-5
780	780	36	1991-03-25 00:00:00	-5
781	781	42	1991-06-28 00:00:00	-5
782	782	32	1991-08-01 00:00:00	-5
783	783	7.5	1991-10-05 00:00:00	-5
784	784	18.1000000000000014	1991-10-29 00:00:00	-5
785	785	35.3999999999999986	1991-12-06 00:00:00	-5
786	786	23.8000000000000007	1992-01-18 00:00:00	-5
787	787	15.1999999999999993	1992-02-22 00:00:00	-5
788	788	44.2999999999999972	1992-03-24 00:00:00	-5
789	789	45.7999999999999972	1992-04-24 00:00:00	-5
790	790	44.2000000000000028	1992-05-14 00:00:00	-5
791	791	47.1000000000000014	1992-06-16 00:00:00	-5
792	792	45.5	1993-03-24 00:00:00	-5
793	793	54.1000000000000014	1993-04-17 00:00:00	-5
794	794	74.2999999999999972	1993-06-20 00:00:00	-5
795	795	42	1993-08-24 00:00:00	-5
\.


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 387
-- Name: measurementresultvalues_valueid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('measurementresultvalues_valueid_seq', 795, true);


--
-- TOC entry 4744 (class 0 OID 70032)
-- Dependencies: 221
-- Data for Name: methodannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY methodannotations (bridgeid, methodid, annotationid) FROM stdin;
\.


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 220
-- Name: methodannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('methodannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4896 (class 0 OID 70867)
-- Dependencies: 373
-- Data for Name: methodcitations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY methodcitations (bridgeid, methodid, relationshiptypecv, citationid) FROM stdin;
\.


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 372
-- Name: methodcitations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('methodcitations_bridgeid_seq', 1, false);


--
-- TOC entry 4858 (class 0 OID 70680)
-- Dependencies: 335
-- Data for Name: methodextensionpropertyvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY methodextensionpropertyvalues (bridgeid, methodid, propertyid, propertyvalue) FROM stdin;
\.


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 334
-- Name: methodextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('methodextensionpropertyvalues_bridgeid_seq', 1, false);


--
-- TOC entry 4869 (class 0 OID 70731)
-- Dependencies: 346
-- Data for Name: methodexternalidentifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY methodexternalidentifiers (bridgeid, methodid, externalidentifiersystemid, methodexternalidentifier, methodexternalidentifieruri) FROM stdin;
\.


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 345
-- Name: methodexternalidentifiers_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('methodexternalidentifiers_bridgeid_seq', 1, false);


--
-- TOC entry 4776 (class 0 OID 70172)
-- Dependencies: 253
-- Data for Name: methods; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY methods (methodid, methodtypecv, methodcode, methodname, methoddescription, methodlink, organizationid) FROM stdin;
1	Generic non-observation	ProjectParent	Project Parent Grouping	Project Parent Grouping	\N	1
2	Observation	AggregatedMeasurements	Aggregated Measurements	Aggregated measurements, lumping all observation activities during one site visit	\N	1
\.


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 252
-- Name: methods_methodid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('methods_methodid_seq', 1, false);


--
-- TOC entry 4943 (class 0 OID 71098)
-- Dependencies: 420
-- Data for Name: modelaffiliations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY modelaffiliations (bridgeid, modelid, affiliationid, isprimary, roledescription) FROM stdin;
\.


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 419
-- Name: modelaffiliations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('modelaffiliations_bridgeid_seq', 1, false);


--
-- TOC entry 4945 (class 0 OID 71109)
-- Dependencies: 422
-- Data for Name: models; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY models (modelid, modelcode, modelname, modeldescription, version, modellink) FROM stdin;
\.


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 421
-- Name: models_modelid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('models_modelid_seq', 1, false);


--
-- TOC entry 4778 (class 0 OID 70183)
-- Dependencies: 255
-- Data for Name: organizations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY organizations (organizationid, organizationtypecv, organizationcode, organizationname, organizationdescription, organizationlink, parentorganizationid) FROM stdin;
1	Program	CAMREX	Carbon in the AMazon River EXperiment Project	Multi-national program (mainly US and Brazil) examining the biogeochemistry of the Amazon River system from the 1980s through the 2000s. US lead is the University of Washington	http://www.riversystems.washington.edu/story/Amazon	\N
2	Foundation	DOI	International DOI Foundation	Foundation that manages the Digital Object Identifier (DOI) system	http://www.doi.org	\N
\.


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 254
-- Name: organizations_organizationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('organizations_organizationid_seq', 2, true);


--
-- TOC entry 4780 (class 0 OID 70194)
-- Dependencies: 257
-- Data for Name: people; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY people (personid, personfirstname, personmiddlename, personlastname) FROM stdin;
1	Emilio	\N	Mayorga
2	A.	H.	Devol
3	B.	R.	Forsberg
4	J.	E.	Richey
5	T.	P.	Pimentel
\.


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 256
-- Name: people_personid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('people_personid_seq', 5, true);


--
-- TOC entry 4871 (class 0 OID 70742)
-- Dependencies: 348
-- Data for Name: personexternalidentifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY personexternalidentifiers (bridgeid, personid, externalidentifiersystemid, personexternalidentifier, personexternalidentifieruri) FROM stdin;
\.


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 347
-- Name: personexternalidentifiers_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('personexternalidentifiers_bridgeid_seq', 1, false);


--
-- TOC entry 4912 (class 0 OID 70939)
-- Dependencies: 389
-- Data for Name: pointcoverageresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY pointcoverageresults (resultid, zlocation, zlocationunitsid, spatialreferenceid, intendedxspacing, intendedxspacingunitsid, intendedyspacing, intendedyspacingunitsid, aggregationstatisticcv, timeaggregationinterval, timeaggregationintervalunitsid) FROM stdin;
\.


--
-- TOC entry 4746 (class 0 OID 70040)
-- Dependencies: 223
-- Data for Name: pointcoverageresultvalueannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY pointcoverageresultvalueannotations (bridgeid, valueid, annotationid) FROM stdin;
\.


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 222
-- Name: pointcoverageresultvalueannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('pointcoverageresultvalueannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4914 (class 0 OID 70946)
-- Dependencies: 391
-- Data for Name: pointcoverageresultvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY pointcoverageresultvalues (valueid, resultid, datavalue, valuedatetime, valuedatetimeutcoffset, xlocation, xlocationunitsid, ylocation, ylocationunitsid, censorcodecv, qualitycodecv) FROM stdin;
\.


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 390
-- Name: pointcoverageresultvalues_valueid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('pointcoverageresultvalues_valueid_seq', 1, false);


--
-- TOC entry 4782 (class 0 OID 70205)
-- Dependencies: 259
-- Data for Name: processinglevels; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY processinglevels (processinglevelid, processinglevelcode, definition, explanation) FROM stdin;
1	FinalPublished	Finalized and published in a peer-reviewed article	Finalized and published in a peer-reviewed article
2	FinalPreliminary	Finalized but not yet published in a peer-reviewed article; may benefit from an additional assessment	Finalized but not yet published in a peer-reviewed article; may benefit from an additional assessment
\.


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 258
-- Name: processinglevels_processinglevelid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('processinglevels_processinglevelid_seq', 1, false);


--
-- TOC entry 4915 (class 0 OID 70955)
-- Dependencies: 392
-- Data for Name: profileresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY profileresults (resultid, xlocation, xlocationunitsid, ylocation, ylocationunitsid, spatialreferenceid, intendedzspacing, intendedzspacingunitsid, intendedtimespacing, intendedtimespacingunitsid, aggregationstatisticcv) FROM stdin;
\.


--
-- TOC entry 4748 (class 0 OID 70048)
-- Dependencies: 225
-- Data for Name: profileresultvalueannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY profileresultvalueannotations (bridgeid, valueid, annotationid) FROM stdin;
\.


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 224
-- Name: profileresultvalueannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('profileresultvalueannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4917 (class 0 OID 70962)
-- Dependencies: 394
-- Data for Name: profileresultvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY profileresultvalues (valueid, resultid, datavalue, valuedatetime, valuedatetimeutcoffset, zlocation, zaggregationinterval, zlocationunitsid, censorcodecv, qualitycodecv, timeaggregationinterval, timeaggregationintervalunitsid) FROM stdin;
\.


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 393
-- Name: profileresultvalues_valueid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('profileresultvalues_valueid_seq', 1, false);


--
-- TOC entry 4873 (class 0 OID 70753)
-- Dependencies: 350
-- Data for Name: referencematerialexternalidentifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY referencematerialexternalidentifiers (bridgeid, referencematerialid, externalidentifiersystemid, referencematerialexternalidentifier, referencematerialexternalidentifieruri) FROM stdin;
\.


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 349
-- Name: referencematerialexternalidentifiers_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('referencematerialexternalidentifiers_bridgeid_seq', 1, false);


--
-- TOC entry 4824 (class 0 OID 70514)
-- Dependencies: 301
-- Data for Name: referencematerials; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY referencematerials (referencematerialid, referencematerialmediumcv, referencematerialorganizationid, referencematerialcode, referencemateriallotcode, referencematerialpurchasedate, referencematerialexpirationdate, referencematerialcertificatelink, samplingfeatureid) FROM stdin;
\.


--
-- TOC entry 4825 (class 0 OID 70522)
-- Dependencies: 302
-- Data for Name: referencematerialvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY referencematerialvalues (referencematerialvalueid, referencematerialid, referencematerialvalue, referencematerialaccuracy, variableid, unitsid, citationid) FROM stdin;
\.


--
-- TOC entry 4784 (class 0 OID 70216)
-- Dependencies: 261
-- Data for Name: relatedactions; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY relatedactions (relationid, actionid, relationshiptypecv, relatedactionid) FROM stdin;
102	336	Is child of	1
103	337	Is child of	1
104	338	Is child of	1
105	339	Is child of	1
106	340	Is child of	1
107	341	Is child of	1
108	342	Is child of	1
109	343	Is child of	1
110	344	Is child of	1
111	345	Is child of	1
112	346	Is child of	1
113	347	Is child of	1
114	348	Is child of	1
115	349	Is child of	1
116	350	Is child of	1
117	351	Is child of	1
118	352	Is child of	1
119	353	Is child of	1
120	354	Is child of	1
121	355	Is child of	1
122	356	Is child of	1
123	357	Is child of	1
124	358	Is child of	1
125	359	Is child of	1
126	360	Is child of	1
127	361	Is child of	1
128	362	Is child of	1
129	363	Is child of	1
130	364	Is child of	1
131	365	Is child of	1
132	366	Is child of	1
133	367	Is child of	1
134	368	Is child of	1
135	369	Is child of	1
136	370	Is child of	1
137	371	Is child of	1
138	372	Is child of	1
139	373	Is child of	1
140	374	Is child of	1
141	375	Is child of	1
142	376	Is child of	1
143	377	Is child of	1
144	378	Is child of	1
145	379	Is child of	1
146	380	Is child of	1
147	381	Is child of	1
148	382	Is child of	1
149	383	Is child of	1
150	384	Is child of	1
151	385	Is child of	1
152	386	Is child of	1
153	387	Is child of	1
154	388	Is child of	1
155	389	Is child of	1
156	390	Is child of	1
157	391	Is child of	1
158	392	Is child of	1
159	411	Is child of	1
160	412	Is child of	1
161	393	Is child of	1
162	394	Is child of	1
163	395	Is child of	1
164	396	Is child of	1
165	397	Is child of	1
166	398	Is child of	1
167	399	Is child of	1
168	400	Is child of	1
169	401	Is child of	1
170	402	Is child of	1
171	403	Is child of	1
172	404	Is child of	1
173	405	Is child of	1
174	406	Is child of	1
175	407	Is child of	1
176	408	Is child of	1
177	409	Is child of	1
178	410	Is child of	1
179	413	Is child of	1
180	414	Is child of	1
181	415	Is child of	1
182	416	Is child of	1
183	417	Is child of	1
184	418	Is child of	1
185	419	Is child of	1
186	420	Is child of	1
187	421	Is child of	1
188	422	Is child of	1
189	423	Is child of	1
190	424	Is child of	1
191	425	Is child of	1
192	426	Is child of	1
193	427	Is child of	1
194	428	Is child of	1
195	429	Is child of	1
196	430	Is child of	1
197	431	Is child of	1
198	432	Is child of	1
199	433	Is child of	1
200	434	Is child of	1
201	435	Is child of	1
202	436	Is child of	1
\.


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 260
-- Name: relatedactions_relationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('relatedactions_relationid_seq', 202, true);


--
-- TOC entry 4898 (class 0 OID 70875)
-- Dependencies: 375
-- Data for Name: relatedannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY relatedannotations (relationid, annotationid, relationshiptypecv, relatedannotationid) FROM stdin;
\.


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 374
-- Name: relatedannotations_relationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('relatedannotations_relationid_seq', 1, false);


--
-- TOC entry 4900 (class 0 OID 70883)
-- Dependencies: 377
-- Data for Name: relatedcitations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY relatedcitations (relationid, citationid, relationshiptypecv, relatedcitationid) FROM stdin;
\.


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 376
-- Name: relatedcitations_relationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('relatedcitations_relationid_seq', 1, false);


--
-- TOC entry 4902 (class 0 OID 70891)
-- Dependencies: 379
-- Data for Name: relateddatasets; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY relateddatasets (relationid, datasetid, relationshiptypecv, relateddatasetid, versioncode) FROM stdin;
\.


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 378
-- Name: relateddatasets_relationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('relateddatasets_relationid_seq', 1, false);


--
-- TOC entry 4850 (class 0 OID 70645)
-- Dependencies: 327
-- Data for Name: relatedequipment; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY relatedequipment (relationid, equipmentid, relationshiptypecv, relatedequipmentid, relationshipstartdatetime, relationshipstartdatetimeutcoffset, relationshipenddatetime, relationshipenddatetimeutcoffset) FROM stdin;
\.


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 326
-- Name: relatedequipment_relationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('relatedequipment_relationid_seq', 1, false);


--
-- TOC entry 4934 (class 0 OID 71053)
-- Dependencies: 411
-- Data for Name: relatedfeatures; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY relatedfeatures (relationid, samplingfeatureid, relationshiptypecv, relatedfeatureid, spatialoffsetid) FROM stdin;
1	1	Was collected at	1036	\N
2	2	Was collected at	1036	\N
3	3	Was collected at	1036	\N
4	4	Was collected at	1036	\N
5	5	Was collected at	1036	\N
6	6	Was collected at	1036	\N
7	7	Was collected at	1036	\N
8	8	Was collected at	1036	\N
9	9	Was collected at	1036	\N
10	10	Was collected at	1036	\N
11	11	Was collected at	1036	\N
12	12	Was collected at	1036	\N
13	13	Was collected at	1036	\N
14	14	Was collected at	1036	\N
15	15	Was collected at	1036	\N
16	16	Was collected at	1036	\N
17	17	Was collected at	1036	\N
18	18	Was collected at	1036	\N
19	19	Was collected at	1036	\N
20	20	Was collected at	1036	\N
21	21	Was collected at	1036	\N
22	22	Was collected at	1036	\N
23	23	Was collected at	1036	\N
24	24	Was collected at	1036	\N
25	25	Was collected at	1036	\N
26	26	Was collected at	1036	\N
27	27	Was collected at	1036	\N
28	28	Was collected at	1036	\N
29	29	Was collected at	1036	\N
30	30	Was collected at	1036	\N
31	31	Was collected at	1036	\N
32	32	Was collected at	1036	\N
33	33	Was collected at	1036	\N
34	34	Was collected at	1036	\N
35	35	Was collected at	1036	\N
36	36	Was collected at	1036	\N
37	37	Was collected at	1036	\N
38	38	Was collected at	1036	\N
39	39	Was collected at	1036	\N
40	40	Was collected at	1036	\N
41	41	Was collected at	1036	\N
42	42	Was collected at	1036	\N
43	43	Was collected at	1036	\N
44	44	Was collected at	1036	\N
45	45	Was collected at	1036	\N
46	46	Was collected at	1036	\N
47	47	Was collected at	1036	\N
48	48	Was collected at	1036	\N
49	49	Was collected at	1036	\N
50	50	Was collected at	1036	\N
51	51	Was collected at	1036	\N
52	52	Was collected at	1036	\N
53	53	Was collected at	1036	\N
54	54	Was collected at	1036	\N
55	55	Was collected at	1036	\N
56	56	Was collected at	1036	\N
57	57	Was collected at	1036	\N
58	58	Was collected at	1036	\N
59	59	Was collected at	1036	\N
60	60	Was collected at	1036	\N
61	61	Was collected at	1036	\N
62	62	Was collected at	1036	\N
63	63	Was collected at	1036	\N
64	64	Was collected at	1036	\N
65	65	Was collected at	1036	\N
66	66	Was collected at	1036	\N
67	67	Was collected at	1036	\N
68	68	Was collected at	1036	\N
69	69	Was collected at	1036	\N
70	70	Was collected at	1036	\N
71	71	Was collected at	1036	\N
72	72	Was collected at	1036	\N
73	73	Was collected at	1036	\N
74	74	Was collected at	1036	\N
75	75	Was collected at	1036	\N
76	76	Was collected at	1036	\N
77	77	Was collected at	1036	\N
78	78	Was collected at	1036	\N
79	79	Was collected at	1036	\N
80	80	Was collected at	1036	\N
81	81	Was collected at	1036	\N
82	82	Was collected at	1036	\N
83	83	Was collected at	1036	\N
84	84	Was collected at	1036	\N
85	85	Was collected at	1036	\N
86	86	Was collected at	1036	\N
87	87	Was collected at	1036	\N
88	88	Was collected at	1036	\N
89	89	Was collected at	1036	\N
90	90	Was collected at	1036	\N
91	91	Was collected at	1036	\N
92	92	Was collected at	1036	\N
93	93	Was collected at	1036	\N
94	94	Was collected at	1036	\N
95	95	Was collected at	1036	\N
96	96	Was collected at	1036	\N
97	97	Was collected at	1036	\N
98	98	Was collected at	1036	\N
99	33125	Was collected at	1036	\N
100	33126	Was collected at	1036	\N
101	33127	Was collected at	1036	\N
102	33128	Was collected at	1036	\N
103	33129	Was collected at	1036	\N
104	33130	Was collected at	1036	\N
105	33131	Was collected at	1036	\N
106	33132	Was collected at	1036	\N
107	33133	Was collected at	1036	\N
108	33134	Was collected at	1036	\N
109	33135	Was collected at	1036	\N
110	33136	Was collected at	1036	\N
111	33137	Was collected at	1036	\N
112	33138	Was collected at	1036	\N
113	33139	Was collected at	1036	\N
114	33140	Was collected at	1036	\N
115	33141	Was collected at	1036	\N
116	33142	Was collected at	1036	\N
117	33143	Was collected at	1036	\N
118	33144	Was collected at	1036	\N
119	33145	Was collected at	1036	\N
120	33146	Was collected at	1036	\N
121	33147	Was collected at	1036	\N
122	33148	Was collected at	1036	\N
123	33149	Was collected at	1036	\N
124	33150	Was collected at	1036	\N
125	33151	Was collected at	1036	\N
126	33152	Was collected at	1036	\N
127	33153	Was collected at	1036	\N
128	33154	Was collected at	1036	\N
129	33155	Was collected at	1036	\N
130	33156	Was collected at	1036	\N
131	33157	Was collected at	1036	\N
132	33158	Was collected at	1036	\N
133	33159	Was collected at	1036	\N
134	33160	Was collected at	1036	\N
135	33161	Was collected at	1036	\N
136	33162	Was collected at	1036	\N
137	33163	Was collected at	1036	\N
138	33164	Was collected at	1036	\N
139	33165	Was collected at	1036	\N
140	33166	Was collected at	1036	\N
141	33167	Was collected at	1036	\N
142	33168	Was collected at	1036	\N
143	33169	Was collected at	1036	\N
144	33170	Was collected at	1036	\N
145	33171	Was collected at	1036	\N
146	33172	Was collected at	1036	\N
147	33173	Was collected at	1036	\N
148	33174	Was collected at	1036	\N
149	33175	Was collected at	1036	\N
150	33176	Was collected at	1036	\N
151	33177	Was collected at	1036	\N
152	33178	Was collected at	1036	\N
153	33179	Was collected at	1036	\N
154	33180	Was collected at	1036	\N
155	33181	Was collected at	1036	\N
156	33182	Was collected at	1036	\N
157	33183	Was collected at	1036	\N
158	33184	Was collected at	1036	\N
159	33185	Was collected at	1036	\N
160	33186	Was collected at	1036	\N
161	33187	Was collected at	1036	\N
162	33188	Was collected at	1036	\N
163	33189	Was collected at	1036	\N
164	33190	Was collected at	1036	\N
165	33191	Was collected at	1036	\N
166	33192	Was collected at	1036	\N
167	33193	Was collected at	1036	\N
168	33194	Was collected at	1036	\N
169	33195	Was collected at	1036	\N
170	33196	Was collected at	1036	\N
171	33197	Was collected at	1036	\N
172	33198	Was collected at	1036	\N
173	33199	Was collected at	1036	\N
174	33200	Was collected at	1036	\N
175	33201	Was collected at	1036	\N
176	33202	Was collected at	1036	\N
177	33203	Was collected at	1036	\N
178	33204	Was collected at	1036	\N
179	33205	Was collected at	1036	\N
180	33206	Was collected at	1036	\N
181	33207	Was collected at	1036	\N
182	33208	Was collected at	1036	\N
183	33209	Was collected at	1036	\N
184	33210	Was collected at	1036	\N
185	33211	Was collected at	1036	\N
186	33212	Was collected at	1036	\N
187	33213	Was collected at	1036	\N
188	33214	Was collected at	1036	\N
189	33215	Was collected at	1036	\N
190	33216	Was collected at	1036	\N
191	33217	Was collected at	1036	\N
192	33218	Was collected at	1036	\N
193	33219	Was collected at	1036	\N
194	33220	Was collected at	1036	\N
195	33221	Was collected at	1036	\N
\.


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 410
-- Name: relatedfeatures_relationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('relatedfeatures_relationid_seq', 195, true);


--
-- TOC entry 4947 (class 0 OID 71120)
-- Dependencies: 424
-- Data for Name: relatedmodels; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY relatedmodels (relatedid, modelid, relationshiptypecv, relatedmodelid) FROM stdin;
\.


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 423
-- Name: relatedmodels_relatedid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('relatedmodels_relatedid_seq', 1, false);


--
-- TOC entry 4904 (class 0 OID 70899)
-- Dependencies: 381
-- Data for Name: relatedresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY relatedresults (relationid, resultid, relationshiptypecv, relatedresultid, versioncode, relatedresultsequencenumber) FROM stdin;
\.


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 380
-- Name: relatedresults_relationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('relatedresults_relationid_seq', 1, false);


--
-- TOC entry 4750 (class 0 OID 70056)
-- Dependencies: 227
-- Data for Name: resultannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY resultannotations (bridgeid, resultid, annotationid, begindatetime, enddatetime) FROM stdin;
\.


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 226
-- Name: resultannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('resultannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4905 (class 0 OID 70905)
-- Dependencies: 382
-- Data for Name: resultderivationequations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY resultderivationequations (resultid, derivationequationid) FROM stdin;
\.


--
-- TOC entry 4860 (class 0 OID 70688)
-- Dependencies: 337
-- Data for Name: resultextensionpropertyvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY resultextensionpropertyvalues (bridgeid, resultid, propertyid, propertyvalue) FROM stdin;
\.


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 336
-- Name: resultextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('resultextensionpropertyvalues_bridgeid_seq', 1, false);


--
-- TOC entry 4826 (class 0 OID 70527)
-- Dependencies: 303
-- Data for Name: resultnormalizationvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY resultnormalizationvalues (resultid, normalizedbyreferencematerialvalueid) FROM stdin;
\.


--
-- TOC entry 4786 (class 0 OID 70224)
-- Dependencies: 263
-- Data for Name: results; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY results (resultid, resultuuid, featureactionid, resulttypecv, variableid, unitsid, taxonomicclassifierid, processinglevelid, resultdatetime, resultdatetimeutcoffset, validdatetime, validdatetimeutcoffset, statuscv, sampledmediumcv, valuecount) FROM stdin;
1	20224a83-c364-51b2-34ed-6eb29f23265c	1	Measurement	3	11	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
2	4e405eb0-e3df-3fe6-bf71-0e8c0ec19313	1	Measurement	1	1	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
3	1561eb1b-036a-aa1f-afab-e63ed6f8e2ea	1	Measurement	1	12	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
4	f1303482-1de1-085b-8fd2-7ef0d1d9ef47	1	Measurement	2	1	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
5	c9fb7820-4ea6-f6e5-4769-e643665f1e23	1	Measurement	2	12	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
6	876bff67-940a-748e-eade-d1ba66248d15	1	Measurement	4	1	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
7	9a266bfa-9f0b-6563-ad80-87d2a350b4ca	2	Measurement	3	11	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
8	f6a07c1a-3df2-7e4f-3e8c-8a6743f0cc77	2	Measurement	1	1	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
9	2f0da2b7-9680-7d9e-1598-d35971b40008	2	Measurement	1	12	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
10	bd9b260a-103c-9bdd-a012-6934f4cc77e1	2	Measurement	2	1	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
11	7ee145e8-5598-6366-f53e-768d2d43f506	2	Measurement	2	12	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
12	f02677ce-c106-c694-1327-3210a9a9f540	2	Measurement	4	1	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
13	1c310af8-ae65-d850-9d16-b0bc02a9463c	3	Measurement	3	11	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
14	a89d5ed6-fd52-dd4e-b720-ffe820dfa534	3	Measurement	1	1	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
15	d3cc7b1a-ac0a-409c-90f5-5eb69ada228a	3	Measurement	1	12	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
16	d9a247c0-ffb3-5d88-7cdf-06ab22447d03	3	Measurement	2	1	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
17	f947bb62-8aa9-5a27-9c63-abb078cb71e6	3	Measurement	2	12	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
18	5eaab9ab-9b3f-83f1-0a8b-ea67f7fb154c	3	Measurement	4	1	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
19	355af147-3914-34df-cb9f-829d1e562f30	4	Measurement	3	11	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
20	c21b5f44-5a56-749f-033c-4dd77607147d	4	Measurement	1	1	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
21	5e608b6f-0132-7313-a6bf-62d8575f9d29	4	Measurement	1	12	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
22	94e446ca-d387-89e0-5ca9-b11d71872f02	4	Measurement	2	1	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
23	67408ddc-6ac1-39fd-401c-1b2d5dccf310	4	Measurement	2	12	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
24	2488ff29-5e4d-f27f-fb0a-2cfaf12cc28f	4	Measurement	4	1	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
25	32e31853-b5ff-6c1f-6260-dddeb154df1e	5	Measurement	3	11	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
26	02011cd6-d663-6ead-59a3-d61e5024d9b2	5	Measurement	1	1	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
27	8df27b9c-2e42-e269-4e3d-bd8f2db819ed	5	Measurement	1	12	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
28	b62209fe-8aa8-2374-356b-b2f64a20c682	5	Measurement	2	1	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
29	dc3220fa-6302-6fdd-e077-e89e68d9f418	5	Measurement	2	12	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
30	5ff54d87-a89c-6b8e-d394-56b301e1df73	5	Measurement	4	1	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
31	ba867a6b-0a1b-97e4-a8c5-78b476f03642	6	Measurement	4	1	\N	1	1983-06-07 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
32	6409048a-6b13-c8f6-4350-5e37ecc3ed00	7	Measurement	3	11	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
33	4e59bcd2-443a-9e61-d46b-163855b12547	7	Measurement	1	1	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
34	3df9792c-15f2-6842-d5ae-0a5c74bd8279	7	Measurement	1	12	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
35	547e7ee2-8928-c087-c74d-0ebb5adb1715	7	Measurement	2	1	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
36	046d3cec-e6d2-4ab9-e40f-f641429c4cc3	7	Measurement	2	12	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
37	cc623605-0e0e-592e-0fe6-8e5a8caf36bc	7	Measurement	4	1	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
38	017b5592-aff3-6f0b-6908-cd6ff5ec5a27	8	Measurement	3	11	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
39	d8a378de-35e4-1002-8e78-a3d2c75c1dc0	8	Measurement	1	1	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
40	9b3772bc-629e-0ea2-a40b-4ad45c14abcd	8	Measurement	1	12	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
41	bde95861-f442-7f09-16f7-a00194474cf5	8	Measurement	2	1	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
42	fb26da32-9e80-3416-cf90-fe60e513a7ed	8	Measurement	2	12	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
43	48cdbeda-b678-aa87-fd8f-40497692ebc2	8	Measurement	4	1	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
44	1c5dd788-7607-4a3b-fab5-5e042e0bf96e	9	Measurement	3	11	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
45	3367e0fa-624c-dc24-c3e7-7e23fdffa993	9	Measurement	1	1	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
46	5400d0fb-4cb4-e8ee-ec1f-b42c1688ff89	9	Measurement	1	12	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
47	ea6e62ec-430a-1afe-b154-ae080669df45	9	Measurement	2	1	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
48	9bdd4b89-29ef-44d7-dbfc-cce639dbd987	9	Measurement	2	12	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
49	a3ecb7df-42f2-ab7b-f8f6-88fb060be8dc	9	Measurement	4	1	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
50	fd2969f0-843f-820c-da83-7c584a92c159	10	Measurement	3	11	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
51	7738a9f2-51b9-8808-7c4e-ce8069c29568	10	Measurement	1	1	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
52	81a7b24b-fec2-bcfe-345a-40fb62657785	10	Measurement	1	12	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
53	7ea61aa7-e0fb-b804-0e58-193ee8736150	10	Measurement	2	1	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
54	2bb0e76d-55fc-2a5b-ac5d-6883ae271557	10	Measurement	2	12	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
55	dc7aeba7-e057-12ff-64ce-cc5ed0f50a03	10	Measurement	4	1	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
56	b0e06e1f-2d91-fb5a-1aa5-8c9ff6d35cbb	11	Measurement	3	11	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
57	f2991d30-55a4-d6db-9a7d-6326e026aa36	11	Measurement	1	1	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
58	bec23c10-2895-159f-5f84-4b21ef0ea223	11	Measurement	1	12	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
59	e3ed9417-4bdf-cdd5-b1e7-76b6ff98bbf2	11	Measurement	2	1	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
60	df121366-2b2c-fb63-6e4e-28d6097fab48	11	Measurement	2	12	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
61	052944e4-0e30-fd64-f6ea-2fc02c27e22d	11	Measurement	4	1	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
62	4c423916-16aa-5898-6912-80833a423867	12	Measurement	3	11	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
63	275c1ae8-a5ef-67b9-7cef-5feed4cd5904	12	Measurement	1	1	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
64	958ae55f-9030-88ab-64cb-0f025de62e93	12	Measurement	1	12	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
65	d13cf729-95a4-fd7b-c119-2ce2744f1cd5	12	Measurement	2	1	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
66	08043917-f661-0504-c0f0-b392392fa693	12	Measurement	2	12	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
67	bc6715df-1d08-80d0-0ad8-2c69c438197e	12	Measurement	4	1	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
68	bdc3ce30-a5f7-b6e0-fcc0-d3ff27b6df6a	13	Measurement	3	11	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
69	a11b8f3f-b491-ab3c-bc99-15cfd49e9315	13	Measurement	1	1	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
70	9b84899f-39a4-22d8-0ebe-673b9f60ebeb	13	Measurement	1	12	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
71	94d294a6-6428-d741-bd57-fd019d9a89d7	13	Measurement	2	1	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
72	0c9bebc5-88b1-ce15-f875-3b0865bc4771	13	Measurement	2	12	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
73	18b89f2b-dd49-ee09-7c7f-df567988df1a	13	Measurement	4	1	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
74	450f7181-2c6e-8d51-8988-dbcd72e45b01	14	Measurement	3	11	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
75	c1d24e83-75bb-cd94-50de-7399bef31a7f	14	Measurement	1	1	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
76	00ffc37a-8951-3800-726e-27d1e8e3b66a	14	Measurement	1	12	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
77	1d5b512f-a77d-0ca4-e91c-aa1395c95c8a	14	Measurement	2	1	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
78	cf93deaf-e010-e15b-2376-b26dedeed141	14	Measurement	2	12	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
79	4cd25580-aa58-3c53-53fa-b76a0c4130da	14	Measurement	4	1	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
80	5d96386c-e5c9-83e7-4c84-fc93f073dde1	15	Measurement	3	11	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
81	9567c898-b214-415d-cd98-d3b7665a1ab6	15	Measurement	1	1	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
82	da34a98a-1ead-de2b-50bd-1bb793540461	15	Measurement	1	12	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
83	89c72b14-fb45-474c-8c1a-15ba877792f8	15	Measurement	2	1	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
84	0f7d7c97-5b3f-1a28-5c2f-6e53fb9e8c22	15	Measurement	2	12	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
85	bfded399-55fd-c1b3-8a8d-405816f98ef7	15	Measurement	4	1	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
86	f31a8865-96cd-88bc-83ba-61548a846fd1	16	Measurement	3	11	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
87	09577a6a-75d9-d771-0e2a-f834e6f9c2bc	16	Measurement	1	1	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
88	4bad677c-f60e-2524-b1af-d23a4604cff1	16	Measurement	1	12	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
89	810b5b03-f05f-1271-9709-7e4c991ada69	16	Measurement	2	1	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
90	eb029390-929c-71b6-961d-59ad8bc8abcd	16	Measurement	2	12	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
91	ec3c6d6f-b118-8711-e349-05a9064ae33b	16	Measurement	4	1	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
92	6dbd3e19-5876-2b63-d581-9ce3af83c894	17	Measurement	3	11	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
93	8378de34-7b55-a68b-5f67-0664917e9921	17	Measurement	1	1	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
94	2a513c1b-815d-ca73-d60c-859e347f05bd	17	Measurement	1	12	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
95	bec7b36c-b8a6-2893-3c5e-1ca2b11dc61f	17	Measurement	2	1	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
96	19fb60cb-c8af-3cba-0f60-c12447b55429	17	Measurement	2	12	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
97	135a5eb3-e0a6-5b85-92e7-84fdeb076a21	17	Measurement	4	1	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
98	84a8bc8c-8e9f-4f86-830c-8f2846933d21	18	Measurement	3	11	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
99	3d5b6526-5fc8-b006-e7d3-df8126bda819	18	Measurement	1	1	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
100	4705d9ac-2b49-d157-5a60-079bdeb635ad	18	Measurement	1	12	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
101	29188d9d-a29b-61af-2725-327d2ff149d4	18	Measurement	2	1	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
102	5eb4faea-280c-3e9a-c930-81bcbcf3810e	18	Measurement	2	12	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
103	aebf0756-3b45-6d28-7b18-52a0cd70247d	18	Measurement	4	1	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
104	9f939813-3ac8-4ff8-0ce5-c03270bce39a	19	Measurement	3	11	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
105	ee256936-ba7c-d8a1-f2cd-7065e4770147	19	Measurement	1	1	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
106	092b99bd-678f-157f-3cd2-979b1e406596	19	Measurement	1	12	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
107	d27f7c34-a910-8110-cf4a-42f5ab37eb87	19	Measurement	2	1	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
108	86a98647-02cc-7d4d-f407-3403f6a78e11	19	Measurement	2	12	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
109	63179ee4-bd9a-bcb2-d7be-254a9f6aeb90	19	Measurement	4	1	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
110	83119ff7-874d-e74b-8d7e-abab15c6c4bc	20	Measurement	3	11	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
111	eb3d04c9-444f-feca-906b-00e509723f38	20	Measurement	1	1	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
112	e71d9ba4-9c89-a947-a41d-48e493dfe737	20	Measurement	1	12	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
113	661ba919-2ad6-118f-8d8e-aa7c4e5ba95e	20	Measurement	2	1	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
114	282e6ff7-c4f7-d0e9-80ce-a5382beae96f	20	Measurement	2	12	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
115	2cf82d06-e0f6-7993-bbcd-6004edd4972b	20	Measurement	4	1	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
116	b25cc79c-c951-406e-cf8b-e80beedd0796	21	Measurement	3	11	\N	1	1984-11-07 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
117	76e1a5a9-e74c-c921-7b31-6c675eb0cf15	21	Measurement	1	1	\N	1	1984-11-07 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
118	1ab0a951-0440-6cb2-f598-72d7eb9e6ade	21	Measurement	1	12	\N	1	1984-11-07 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
119	289e72bf-b4df-ca16-dfdc-a8c1d8323a5b	21	Measurement	2	1	\N	1	1984-11-07 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
120	4c4e2a2b-ac16-069d-4a90-093710c4125e	21	Measurement	2	12	\N	1	1984-11-07 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
121	e0a79da5-22df-d828-6941-f1af0bf26545	21	Measurement	4	1	\N	1	1984-11-07 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
122	bf6ec058-a243-fc4e-a0f1-610daf296ffc	22	Measurement	3	11	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
123	2bb0cebb-9da3-edee-f0a9-e94bbdd209fe	22	Measurement	1	1	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
124	fbd4feb7-c231-01df-8979-355e04033b64	22	Measurement	1	12	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
125	d641b995-9c7a-9f7f-4c06-f275e2545e63	22	Measurement	2	1	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
126	6f6cbe2f-4cde-4b92-65cb-87cdfe861dde	22	Measurement	2	12	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
127	f5c3810d-0c9c-b2aa-64f6-5951cb7cdadb	22	Measurement	4	1	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
128	115eeef7-d318-e73b-6329-cd284c2adea8	23	Measurement	3	11	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
129	2f01b571-51f6-0b05-b307-14356460a0c2	23	Measurement	1	1	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
130	1fb65c76-c5c2-3b93-a4bb-0b90af347741	23	Measurement	1	12	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
131	7712d845-d03b-23e1-7f69-23b67aa76eae	23	Measurement	2	1	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
132	97d342ed-3dd3-e2ae-4ce3-a874c862d7ed	23	Measurement	2	12	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
133	a1b3a38c-da40-2a84-f611-b62955971e1a	23	Measurement	4	1	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
134	9663bf80-612c-e748-84ff-4a0b2e4a57bc	24	Measurement	3	11	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
135	c9a46541-460b-ee9e-dedc-9f826f1a37fd	24	Measurement	1	1	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
136	6eb1f192-f057-a643-86b5-9961e5fb6086	24	Measurement	1	12	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
137	c8150f34-e5ee-ecf0-5a4e-0fb5f9a61c1e	24	Measurement	2	1	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
138	a2008717-6e3a-3ec2-ac81-80a50644a3c8	24	Measurement	2	12	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
139	784fa608-facc-3e0b-c905-f0efa7a2b203	24	Measurement	4	1	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
140	bfccd720-8f0c-0e48-97fc-5da83018057e	25	Measurement	4	1	\N	1	1985-02-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
141	9602afb7-7e86-e875-dee6-e358458160cb	26	Measurement	3	11	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
142	235c0239-420c-5039-e864-d056b5849c73	26	Measurement	1	1	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
143	3169b3a5-b99e-10ca-f018-a45da206fe3a	26	Measurement	1	12	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
144	7196155a-7635-87fe-39c2-1165f3bb8fb0	26	Measurement	2	1	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
145	0a696035-5bff-10c8-3390-f26eede7faa3	26	Measurement	2	12	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
146	b9bfdcf6-3a23-74b1-5d3c-2b406a419918	26	Measurement	4	1	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
147	10a88cb0-18e9-055e-4eed-0c13e46d94a3	27	Measurement	3	11	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
148	9c3c5b48-5f2b-d424-573a-f5293ee2758a	27	Measurement	1	1	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
149	4e334342-2a22-5a0d-1864-89de070c9a31	27	Measurement	1	12	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
150	e3b3d5a4-4821-9bda-2d1c-caf190e036a1	27	Measurement	2	1	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
151	d4977f9d-bc2b-4027-b617-a74e7bcdb864	27	Measurement	2	12	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
152	54322784-394d-1cbe-6473-3041f587a16a	27	Measurement	4	1	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
153	4f099bb0-74dd-affa-29d5-6161c5621038	28	Measurement	3	11	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
154	102fc19e-4b0a-0552-7abb-e93ad8bd3c8d	28	Measurement	1	1	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
155	e371a1cf-7757-23df-a72d-e0016162a327	28	Measurement	1	12	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
156	ec34b305-cbcb-4517-01a3-f6af9608235e	28	Measurement	2	1	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
157	ac2af36f-75fd-7704-8ff2-e973181e1f4d	28	Measurement	2	12	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
158	31b56e6f-cd83-9459-901c-28e5b74293b5	28	Measurement	4	1	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
159	fd63f52c-20fc-3441-7a67-7a58dc2ec0b9	29	Measurement	3	11	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
160	63d903e7-8fec-3d16-6ec1-441628d63060	29	Measurement	1	1	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
161	2fb9eff5-8be9-05d8-8197-c30a43b9dd1f	29	Measurement	1	12	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
162	39bf9ba1-9255-1471-634b-59aab5372b80	29	Measurement	2	1	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
163	71c15619-2579-ed9e-d3a7-ec4583fd4386	29	Measurement	2	12	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
164	82082dce-2ae4-2b3a-26ea-ba2d0fc1127c	29	Measurement	4	1	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
165	532e3157-c9d5-f1b4-0f97-faf85ba3bfbc	30	Measurement	3	11	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
166	e5ba2d70-1409-0609-56a7-bb7c5f2926f9	30	Measurement	1	1	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
167	50f67319-2e27-ad3a-a734-e36a115115dd	30	Measurement	1	12	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
168	f435ef90-7a88-bfe5-fb1f-f1c2d9609e05	30	Measurement	2	1	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
169	87427eb5-a135-fe8b-e87b-150dfd85f467	30	Measurement	2	12	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
170	c4e4726d-f6ef-d4bc-db9a-021a21bd94a8	30	Measurement	4	1	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
171	223154f3-592b-e58c-dbc4-02ee60256e00	31	Measurement	3	11	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
172	67519473-0e06-55d5-672b-c6871e814338	31	Measurement	1	1	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
173	45bcd870-bb9b-bed3-a6f2-d358eabf83b0	31	Measurement	1	12	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
174	89a4466a-aaa1-ee30-3056-9f707fb5c2eb	31	Measurement	2	1	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
175	70525ec1-6ffc-7814-06b2-3c2f7d96d169	31	Measurement	2	12	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
176	76b7a99c-f3d2-3b0b-ae08-05767257c9af	31	Measurement	4	1	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
177	007f2ef7-e7f3-adc6-3421-ed489b394b28	32	Measurement	3	11	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
178	1eca78a1-5124-1da4-234b-5db5037770a3	32	Measurement	1	1	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
179	ba7a808c-d279-1172-18ef-002d46453b67	32	Measurement	1	12	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
180	36c0515f-8c0b-cf2a-8ece-4020e08875f9	32	Measurement	2	1	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
181	7aa558d7-762d-8233-d503-d0f297cfe1c7	32	Measurement	2	12	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
182	803b6ab0-ddb6-0809-3fb3-2d37801fa20f	32	Measurement	4	1	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
183	5f6a95cd-15b0-c6ac-85b0-9d327e2a6fd7	33	Measurement	3	11	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
184	acaf24e4-c570-ef6f-e23b-cf01c2726a6c	33	Measurement	1	1	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
185	1385ceda-081f-55b8-5e6c-929d88296771	33	Measurement	1	12	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
186	5182f040-63fd-65e7-0207-e2b62051f64e	33	Measurement	2	1	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
187	91797f31-ee5b-0298-343f-f96f5042c70c	33	Measurement	2	12	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
188	87590222-7f41-02c5-0e4a-a07ec24e7bab	33	Measurement	4	1	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
189	edf6950c-3212-ae8b-da80-11068e1a0d75	34	Measurement	3	11	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
190	fce76c1d-2243-3129-f89d-f10289306835	34	Measurement	1	1	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
191	f1a44f2a-7df0-d081-425b-8eaf8909493a	34	Measurement	1	12	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
192	92ff4427-b035-aec6-7bc2-1a6a3b4ce4dc	34	Measurement	2	1	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
193	04c459fb-a586-310e-5d9e-f8470ec556d2	34	Measurement	2	12	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
194	b28b3820-9a60-8cc9-7d49-f33a79fc7048	34	Measurement	4	1	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
195	1cd6758b-f028-f8f5-645a-dbc4ea970ce1	35	Measurement	3	11	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
196	51aff3fa-6d90-f397-6e12-d5bae44c937b	35	Measurement	1	1	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
197	89400f38-7b51-7dcf-2d19-a9ca36d533ba	35	Measurement	1	12	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
198	a1c6b9f8-27d8-98a9-8f6b-1f925da0543b	35	Measurement	2	1	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
199	1a4293e8-a1b0-ce05-3faa-e2e8eee700f6	35	Measurement	2	12	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
200	5c53ec9d-8049-24b8-3340-017e39433097	35	Measurement	4	1	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
201	39e15d09-538e-01d4-4554-ff7beb5e4a9d	36	Measurement	3	11	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
202	e05e586f-3c39-c67a-0fe9-ce9e64ba7480	36	Measurement	1	1	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
203	b0321795-4787-9cec-99c3-7cc791fdaa39	36	Measurement	1	12	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
204	78304ea3-eaa4-681b-e5d3-7aaf2778ce37	36	Measurement	2	1	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
205	e8154dea-9690-493c-b0cf-a45270a9e69d	36	Measurement	2	12	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
206	be2a5964-3b45-d82e-89fd-eddacb28e026	36	Measurement	4	1	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
207	b9484421-f6e2-4462-61a9-67780b4a8401	37	Measurement	3	11	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
208	02b54231-3033-1735-3510-5e7a523ae558	37	Measurement	1	1	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
209	2cd15bcd-b8cd-863a-3b1c-c683cd90705c	37	Measurement	1	12	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
210	54cab52b-5ee2-8d3b-a5b3-8df751417ce5	37	Measurement	2	1	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
211	d8c5c792-ff04-0938-b2c4-29d67edda0b6	37	Measurement	2	12	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
212	92a122b0-ef9d-d13e-bf69-eb15c51d69f4	37	Measurement	4	1	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
213	1d52542b-8c25-d34f-0480-583758fb1463	38	Measurement	3	11	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
214	caac9e14-fc3d-c8b9-ae6f-062a4beb699b	38	Measurement	1	1	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
215	db289a13-9655-9849-aa7d-20a9a722e218	38	Measurement	1	12	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
216	4a1cb12d-d94d-24f4-2c65-641a5891b05b	38	Measurement	2	1	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
217	04772afd-066d-d55b-1c5b-50b3cc41aa8d	38	Measurement	2	12	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
218	bba9d799-af21-baa0-7429-4b588b80af2d	38	Measurement	4	1	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
219	e800fd3c-154e-03d9-5e8b-e68066d1fa2e	39	Measurement	4	1	\N	1	1985-11-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
220	599ed273-33c4-8cac-ff91-911ec01f8b30	40	Measurement	4	1	\N	1	1985-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
221	54dd51a5-e467-50ac-04ff-4a54e519e73d	41	Measurement	3	11	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
222	f454a555-3808-6c4d-5cd7-bb64f637867f	41	Measurement	1	1	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
223	4bdbcf85-5712-612e-dd58-4e2c4d4b2b4b	41	Measurement	1	12	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
224	b8f6720c-dc16-d0cf-174a-3ac2c638c739	41	Measurement	2	1	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
225	cab0edd3-59a6-38c0-64b5-38091fff82d5	41	Measurement	2	12	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
226	328b52c2-71cf-cfd5-c150-94180d828216	41	Measurement	4	1	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
227	e4d6f9a2-1025-f79a-46f6-9d3d7e2b34d4	42	Measurement	3	11	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
228	9b13b575-40c6-f515-79d0-48c954b0ad1c	42	Measurement	1	1	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
229	70bd746d-04e8-c6b6-00d1-f75a14c19989	42	Measurement	1	12	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
230	064a4203-44a2-0a43-5aea-046de0bea02d	42	Measurement	2	1	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
231	72bae803-28af-98dc-c251-c4174a326c24	42	Measurement	2	12	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
232	a3a812a7-a75b-7583-17ce-cbd19196bcf3	42	Measurement	4	1	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
233	cf20cdd8-a678-532e-e046-1a0e3acce337	43	Measurement	3	11	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
234	fefec6c4-73fa-df1d-0db4-235d3fb00b8a	43	Measurement	1	1	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
235	a1b0c1cd-b116-faea-c7a5-f7c6f3fbbde0	43	Measurement	1	12	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
236	ba44bae8-07c9-f156-64f2-890b2d3b72fe	43	Measurement	2	1	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
237	cd48051a-7337-c04a-bdbe-a3fcad45e7dd	43	Measurement	2	12	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
238	40dc7d0d-e337-02b4-1e41-4f136b7878ef	43	Measurement	4	1	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
239	1e22afe7-7cb2-e4c6-5aaf-c8744dbcee1d	44	Measurement	3	11	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
240	3002dccc-41fc-aa96-5849-b25b02e95c95	44	Measurement	1	1	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
241	0197d69a-9f8c-bf9d-ef70-6f808dae551b	44	Measurement	1	12	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
242	732789dd-65a1-e71f-69f9-e06c59587cf2	44	Measurement	2	1	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
243	fed6d6b5-9924-1c0f-9312-ba49fe83a861	44	Measurement	2	12	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
244	250c9ddd-e5e6-3599-2660-ea49a16443ad	44	Measurement	4	1	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
245	4e01204f-9051-24c5-a199-08f5aceb00fe	45	Measurement	3	11	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
246	0edf9ab6-af46-b0d3-dd3e-743a99cf1370	45	Measurement	1	1	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
247	9eed511d-aef6-13f3-0768-47daf5517b34	45	Measurement	1	12	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
248	c5f16b0f-cc7b-5f65-21fc-dc8c463ab653	45	Measurement	2	1	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
249	e8b43713-1481-438f-70cd-8e87d973ec80	45	Measurement	2	12	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
250	2ccc98ec-ff61-27f5-fd39-31da9012ebf3	45	Measurement	4	1	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
251	4cd0d94a-8507-4dd8-95a0-bef882145b65	46	Measurement	3	11	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
252	43017414-b02e-46fa-0dce-ff48a8428fe3	46	Measurement	1	1	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
253	bc36dca2-d305-1102-5bdd-fefbd30596e8	46	Measurement	1	12	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
254	5fb1f342-40eb-c317-30e0-66abb189d62c	46	Measurement	2	1	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
255	a78b74df-a43e-fa1b-8414-e151677724e8	46	Measurement	2	12	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
256	2d3e9cbb-5b23-3acf-f5fd-2a20b9bdec1b	46	Measurement	4	1	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
257	6389e3c7-96be-38ca-c9e0-39e551e8c53d	47	Measurement	3	11	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
258	2936a05f-866e-ce20-b145-b6c318593267	47	Measurement	1	1	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
259	14983c1f-3e8c-bc6c-be34-48386be89959	47	Measurement	1	12	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
260	c665259a-bf19-c3e1-6d5a-c60d616ef1bf	47	Measurement	2	1	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
261	fb690b8e-defd-1ae2-796f-5e604de53ada	47	Measurement	2	12	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
262	217da300-7065-907b-c38f-fbae5046e183	47	Measurement	4	1	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
263	02c15dcd-4d07-5628-9b93-aca5420e2aee	48	Measurement	4	1	\N	1	1986-04-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
264	da3ce57b-03e4-2062-c7dc-532c9b2369bc	49	Measurement	4	1	\N	1	1986-05-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
265	ff76d56a-2a63-88fa-e04f-97c2050126d4	50	Measurement	4	1	\N	1	1986-06-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
266	babf8edc-9dc0-4d53-5fce-5d4ea27c8aa5	51	Measurement	4	1	\N	1	1986-07-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
267	6b094a38-c31d-ce23-aa56-f356442cb27e	52	Measurement	4	1	\N	1	1986-08-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
268	f6084705-22b6-12ff-b628-2aa315649ace	53	Measurement	4	1	\N	1	1986-09-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
269	914f729e-b671-6bda-2afd-184d5e0aa7b8	54	Measurement	4	1	\N	1	1986-10-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
270	9e43a179-1966-49d6-7707-87eb31b4671c	55	Measurement	4	1	\N	1	1986-11-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
271	969af483-98d6-0b9f-8eb4-b38cc1353b51	56	Measurement	4	1	\N	1	1986-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
272	29a2ae56-ad54-5d71-1f19-4416f211df0b	57	Measurement	1	12	\N	1	1987-06-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
273	e2701096-8159-8b85-b2d5-fc562941196b	57	Measurement	2	12	\N	1	1987-06-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
274	eceac605-f5e7-59dd-edac-dd7822c90e27	58	Measurement	1	12	\N	1	1987-06-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
275	e0f0eae8-8682-9728-1a81-e5841b9456cb	58	Measurement	2	12	\N	1	1987-06-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
276	a05c9dfd-2a53-aa4f-9089-a4a82c56cbf4	59	Measurement	3	11	\N	1	1987-08-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
277	d1eb21b5-a4c5-82c8-c349-32e1331ae8ce	59	Measurement	1	1	\N	1	1987-08-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
278	f8c9c6a9-b07c-38d5-67ae-91641eefae35	59	Measurement	1	12	\N	1	1987-08-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
279	f6196d09-cfba-b060-72f5-1e9e559b44dc	59	Measurement	2	1	\N	1	1987-08-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
280	8e7d534b-820b-3b5b-887a-340702e0ab72	59	Measurement	2	12	\N	1	1987-08-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
281	40654871-f2be-8e90-8ec4-18e2e6c23791	59	Measurement	4	1	\N	1	1987-08-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
282	f9bba8e3-52b8-40f0-a381-e366e363f7d1	60	Measurement	3	11	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
283	3c575272-9163-da51-16c5-dbfd8a096aa1	60	Measurement	1	1	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
284	34f87b66-273e-5fad-49cc-b88f7605c9d4	60	Measurement	1	12	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
285	3291ca76-2691-d678-4c4b-2e5421bf4431	60	Measurement	2	1	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
286	6cc6ba37-e39c-ddd5-a178-eb03efed4d06	60	Measurement	2	12	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
287	7b21aaa5-1ec6-5508-050b-6ac7501913b2	60	Measurement	4	1	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
288	833d1abd-94fc-d221-7075-e179528dc02a	61	Measurement	3	11	\N	1	1988-01-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
289	7fe59ac5-ec0e-84e5-9b26-c43bacb4ec19	61	Measurement	1	1	\N	1	1988-01-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
290	94ca0a89-305c-b4fc-e4dc-55088733cfd6	61	Measurement	1	12	\N	1	1988-01-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
291	4eca8209-234d-4979-62d1-c6ef40c2f5d4	61	Measurement	2	1	\N	1	1988-01-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
292	a25e1343-c6e2-1d1a-149c-72e2ea6f3bd1	61	Measurement	2	12	\N	1	1988-01-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
293	fde7ec87-f7a3-9a05-7290-adcad06d88bb	61	Measurement	4	1	\N	1	1988-01-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
294	eafa9630-6448-7d82-ebbc-b89d7d3b4691	62	Measurement	3	11	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
295	704bf6d7-4cba-f50c-5654-b0280e5b135a	62	Measurement	1	1	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
296	d8c899c7-eae5-be49-a1eb-ae208aa57ba5	62	Measurement	1	12	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
297	9f5b7a61-1fba-b315-d105-f2334cd9759e	62	Measurement	2	1	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
298	ebff651a-37d2-dc12-b7e2-6ed0442582a6	62	Measurement	2	12	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
299	6133bc95-8246-325c-c637-0cba03ab8a7f	62	Measurement	4	1	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
300	ee914a9a-3cd2-935b-5acf-cc5a246ce07f	63	Measurement	3	11	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
301	de161562-a921-fa7d-b90d-ef061ef0aeb4	63	Measurement	1	1	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
302	5f22b67f-03a6-43f8-c0dd-18c6d3a01299	63	Measurement	1	12	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
303	5f82df0e-30b1-5714-c29a-9d0960c19643	63	Measurement	2	1	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
304	d9e34b71-cecf-657f-47d2-4f03b104f2e3	63	Measurement	2	12	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
305	a982e8f0-41db-9fd4-ea83-07f45fc1e843	63	Measurement	4	1	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
306	e2e459a2-cf3b-637a-83bb-8a9b3ed39227	64	Measurement	3	11	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
307	09464b0a-4455-3d9f-fe78-976ff12af4ce	64	Measurement	1	1	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
308	df894c32-11ac-b370-8e7e-a2101d0f0191	64	Measurement	1	12	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
309	6526c69c-15ec-71a4-a6bd-a3977cc4834d	64	Measurement	2	1	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
310	73f301fc-6912-1195-8fe9-f529d27053ed	64	Measurement	2	12	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
311	dab51b04-2083-3221-80b5-b8d2edcef324	64	Measurement	4	1	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
312	161c2a11-e9ad-2660-7d69-13cc5c82ca62	65	Measurement	3	11	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
313	fcf8ccde-3feb-234d-9962-e9d8e77c493e	65	Measurement	1	1	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
314	635d8cf6-fbeb-41bf-e258-f145e67263b3	65	Measurement	1	12	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
315	63efca46-d30d-b658-267a-74a1d3c3fc07	65	Measurement	2	1	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
316	8b7fabfd-dc36-d574-30f8-b83f35b589c1	65	Measurement	2	12	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
317	086f8f0a-d33c-6135-57f8-9cd1b76a7e67	65	Measurement	4	1	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
318	13752379-a443-b9fb-b683-bf75688e1511	66	Measurement	3	11	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
319	3b362b9c-0736-c0c3-fb80-42114cbb682d	66	Measurement	1	1	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
320	424525a0-880e-ea63-6647-95e2e785fbce	66	Measurement	1	12	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
321	45ff7f45-7dc8-e18b-7a23-f6e18d76fcd2	66	Measurement	2	1	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
322	08c61b77-9649-e0ea-e364-35352002941a	66	Measurement	2	12	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
323	0e2c9c07-2a7b-711d-b7f4-707ed6a6ba7f	66	Measurement	4	1	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
324	b79688a6-1913-c699-729c-9155dfa783e7	67	Measurement	3	11	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
325	ca9cdf4f-82af-cb0a-8abf-0b6dfa5ca205	67	Measurement	1	1	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
326	a62aaaa0-4dcf-4e2a-a957-101880962dee	67	Measurement	1	12	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
327	31f3fdeb-e807-89cb-39a1-34dd10ec77a5	67	Measurement	2	1	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
328	359421fb-b5f1-d909-4052-785060dd902c	67	Measurement	2	12	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
329	bea16d3d-2fe9-58ea-0776-6ef73c1416b5	67	Measurement	4	1	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
330	28e33274-dc08-e3aa-8d22-bb8f471f048f	68	Measurement	3	11	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
331	19a81e7d-b21b-97f8-6510-f45b60da8802	68	Measurement	1	1	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
332	838d6936-d62e-0841-e0c0-ef2f6340309e	68	Measurement	1	12	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
333	50051861-2630-c80b-270d-166f621278f4	68	Measurement	2	1	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
334	1f82d1d3-c440-34bc-92e0-47acd1b0697e	68	Measurement	2	12	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
335	76dd6d34-820c-bd99-7748-728a29ef8548	68	Measurement	4	1	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
336	25661121-3326-0de8-a1f3-ce58172a0511	69	Measurement	3	11	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
337	13dc3b0c-4c59-f714-3d30-f8668ee6b5e2	69	Measurement	1	1	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
338	e5d45ee2-5629-10f9-f020-b1a3c5fb1834	69	Measurement	1	12	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
339	f3848244-dc8e-feba-6f4c-387c67d8fa61	69	Measurement	2	1	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
340	5edbdb45-1949-daef-6026-be3d225b9b75	69	Measurement	2	12	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
341	cb93dd3e-c6aa-b83e-3999-c3abe46211c4	69	Measurement	4	1	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
342	678dcddd-889c-9b6f-370d-84b5ed1de474	70	Measurement	3	11	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
343	b9ec691e-39d7-5cc9-be67-22006a873023	70	Measurement	1	1	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
344	0ddcfff3-08cc-2fe7-7245-86eb669e2463	70	Measurement	1	12	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
345	9d2bb392-d864-072d-ee3e-0299948a1a96	70	Measurement	2	1	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
346	cd881670-17e2-11ff-9ab0-f73907493625	70	Measurement	2	12	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
347	a8effc6c-68eb-0689-1a52-fb0558e7288a	70	Measurement	4	1	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
348	b9d544b1-0bd7-7d4c-d3a3-b351f8516693	71	Measurement	3	11	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
349	2953f545-5190-912b-1181-79621c70503c	71	Measurement	1	1	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
350	00aed124-5fc5-a23e-4757-369b86d35dd9	71	Measurement	1	12	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
351	7c1c977f-3bc7-a259-8507-801d66ae5c5a	71	Measurement	2	1	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
352	34ec7251-ba27-d1ac-b8e1-61f341cb39df	71	Measurement	2	12	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
353	9eb26bb3-b65f-2192-0515-9f896aac1c20	71	Measurement	4	1	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
354	9cd03869-95f2-959e-8aa9-f6a19a7a2737	72	Measurement	3	11	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
355	838dd37e-48d0-ffa5-60c8-9140c499c2b3	72	Measurement	1	1	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
356	e1bd15d4-5ce0-f8dd-b64d-4a292d06d8c1	72	Measurement	1	12	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
357	4f3eabff-1ea7-2174-f874-bb7617b499f7	72	Measurement	2	1	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
358	fa25922e-ca7d-a253-186c-ca4e82268da6	72	Measurement	2	12	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
359	fff90c3d-646a-e7f0-8994-4e04491b962e	72	Measurement	4	1	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
360	fc0fd373-3daa-1254-cfb3-54be791ebbf9	73	Measurement	3	11	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
361	feb1dda2-9ca4-73d5-9a36-81938f41a8c4	73	Measurement	1	1	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
362	38b71d40-898c-7117-9e56-c2e9285e655a	73	Measurement	1	12	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
363	88cf24eb-c4f5-6b8b-f7bf-4c08a3f14981	73	Measurement	2	1	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
364	42956c43-0482-8972-b907-87b562eeb3e7	73	Measurement	2	12	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
365	624810d5-75d8-caa1-d866-15d53ccdf84d	73	Measurement	4	1	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
366	85c0542f-2d50-11d7-fc4f-142f13a9c6d5	74	Measurement	3	11	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
367	31524275-0c4d-2154-0967-6231deea834d	74	Measurement	1	1	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
368	bf6e400f-eb51-06bd-e987-e7027cc74fba	74	Measurement	1	12	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
369	9b5f5e08-ca7b-13f1-d1d8-f53c881b2b86	74	Measurement	2	1	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
370	a4fd5280-94f5-4f36-c30d-0068d0aedd97	74	Measurement	2	12	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
371	f77081ea-4084-b5c4-7eaf-8da189724954	74	Measurement	4	1	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
372	103c0629-4309-b60d-7d3d-c3a5e985cba1	75	Measurement	3	11	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
373	c4c7f93b-b5d8-e6e9-8d44-36d13d15d43e	75	Measurement	1	1	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
374	4b8490b2-9f32-5d26-550e-d7b66520e24d	75	Measurement	1	12	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
375	a77d2bf5-75d3-602a-4ec4-d9083d35052d	75	Measurement	2	1	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
376	aff906e7-8e1e-3292-e1bb-9e56f4a8d4d5	75	Measurement	2	12	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
377	7632c170-89d7-6a2e-f11b-8c0453ed03d9	75	Measurement	4	1	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
378	14032883-e98d-9837-c678-318c0dcdd4cf	76	Measurement	4	1	\N	1	1990-03-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
379	50376532-209d-5729-8e5e-7d3d709336ae	77	Measurement	4	1	\N	1	1990-06-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
380	fdafd633-1aa1-0707-f266-4b024c14dcdb	78	Measurement	4	1	\N	1	1990-09-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
381	2b9d493a-1a4b-0286-563f-b5ba033cad56	79	Measurement	4	1	\N	1	1990-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
382	7a93d736-f0a5-d2ed-d735-d7d9837452ec	80	Measurement	4	1	\N	1	1990-12-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
383	7decba2e-6dfd-d5e4-b7af-46f3386f6bea	81	Measurement	4	1	\N	1	1991-01-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
384	732d89d3-87b3-619a-7d56-d245170028fe	82	Measurement	4	1	\N	1	1991-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
385	f5713bdd-e5ed-9ae8-15f3-4730d4ccae74	83	Measurement	4	1	\N	1	1991-03-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
386	9894375e-ee94-edc5-d3ad-11347b930051	84	Measurement	4	1	\N	1	1991-06-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
387	5b06861d-1536-da04-8a97-907b04ff2037	85	Measurement	4	1	\N	1	1991-08-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
388	b2789f03-73ba-4a7e-8c62-e5fd49bcd90a	86	Measurement	4	1	\N	1	1991-10-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
389	ee5f4db0-ffda-2669-4b1f-eceb72df8669	87	Measurement	4	1	\N	1	1991-10-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
390	be5ae924-a5ce-6756-2449-726b777bb7b0	88	Measurement	4	1	\N	1	1991-12-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
391	36202df4-59c4-6323-53d0-d82250100e0d	89	Measurement	4	1	\N	1	1992-01-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
392	835e6c31-6948-37af-30a6-580e0ed8cbcb	90	Measurement	4	1	\N	1	1992-02-22 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
393	bfbd02c3-41d1-e4a7-6226-bfd1f89e7582	91	Measurement	4	1	\N	1	1992-03-24 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
394	b8a4ca2a-77f0-c082-c075-fc60d4e9ef1c	92	Measurement	4	1	\N	1	1992-04-24 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
395	7d7f6404-884a-9fbd-94b5-cd849e5f4537	93	Measurement	4	1	\N	1	1992-05-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
396	5abf7f70-0daa-d18f-c3f7-591a4ce5154e	94	Measurement	4	1	\N	1	1992-06-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
397	b45d77fb-3621-8266-84e1-2b8ffa3a16ba	95	Measurement	4	1	\N	1	1993-03-24 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
398	2a20bfa4-99b6-1b77-666c-c0ad9b1551aa	96	Measurement	4	1	\N	1	1993-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
399	f238014a-76f5-a806-52bb-bea51246f566	97	Measurement	4	1	\N	1	1993-06-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
400	3729e765-e4fd-7ba9-6f79-42eff42ec046	98	Measurement	4	1	\N	1	1993-08-24 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
401	0735d556-3071-af90-d80d-af237d1812a3	99	Measurement	7	11	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
402	a454e6b9-9800-ca39-1075-870cc29fe86b	99	Measurement	5	1	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
403	5c926170-7db7-02ca-45ce-22159cc9639b	99	Measurement	5	12	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
404	d6a2052e-3f30-9843-3fc6-1fd98436b271	99	Measurement	6	1	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
405	6b386a6e-91cb-dccb-3846-13340bf6018d	99	Measurement	6	12	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
406	c70e5db7-e15b-31ac-5c4d-cff8c626333b	99	Measurement	8	1	\N	1	1983-01-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
407	95fdd9b7-50ef-51c4-9313-85f5f67908f9	100	Measurement	7	11	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
408	6b2e9087-da27-41e1-ea60-1c7d24fbb5cb	100	Measurement	5	1	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
409	13bddd45-e5a3-c115-56c1-ea4824a95851	100	Measurement	5	12	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
410	4dc055b0-8af7-0599-7aba-9cb48820b84d	100	Measurement	6	1	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
411	3cfd769e-31ad-1a17-b6a3-8282a7cd523f	100	Measurement	6	12	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
412	2113f9ea-22da-91bb-286c-35f0ed60d493	100	Measurement	8	1	\N	1	1983-01-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
413	894aabf3-9159-1fd6-d51d-b6d2cfa1b241	101	Measurement	7	11	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
414	f6578351-3610-6899-d7a7-579548d41552	101	Measurement	5	1	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
415	b6fd47f9-1f9e-8c98-0722-09f4ce3f79ba	101	Measurement	5	12	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
416	c2f9e910-c15d-8d01-d95a-eabadf7f1c18	101	Measurement	6	1	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
417	a234baa0-1da8-6aae-579d-b9c5fdb9412b	101	Measurement	6	12	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
418	05f48dd9-da43-4aa5-8f38-5f0fa928424a	101	Measurement	8	1	\N	1	1983-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
419	24cc5fc4-16f8-2b38-fa30-806f319a9e13	102	Measurement	7	11	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
420	ac8c27f2-3ee6-5e84-28fa-f5bb228bedce	102	Measurement	5	1	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
421	53eca037-364e-ece0-cb12-01edd9b0865f	102	Measurement	5	12	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
422	dbb061ae-733d-ab3c-e0db-c6a2b57b0725	102	Measurement	6	1	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
423	03128a12-8b32-6b94-8291-ae15419c1e8a	102	Measurement	6	12	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
424	1322d954-3491-68c3-2a2a-d5f09f0742f5	102	Measurement	8	1	\N	1	1983-02-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
425	20776c17-4401-fcdc-ccfe-950886d8e973	103	Measurement	7	11	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
426	5a14baa9-0095-c87c-b5a3-605cac8f9c95	103	Measurement	5	1	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
427	d46e93cc-f012-cf25-cabf-3148ac12d154	103	Measurement	5	12	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
428	5f0c0e9c-c7cc-00dc-bac2-197ed79d17bc	103	Measurement	6	1	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
429	6e46f4e4-fef2-b241-66ee-e68ebb7ac05f	103	Measurement	6	12	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
430	74702d32-7a55-e5ad-ffff-83b1df46824f	103	Measurement	8	1	\N	1	1983-03-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
431	da75b801-2f8c-3c0f-48e3-eaff582d40e0	104	Measurement	8	1	\N	1	1983-06-07 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
432	cef6249d-233e-d0c3-0323-7e01b1e746aa	105	Measurement	7	11	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
433	5548e63f-01a7-2fbc-4677-a594e581cfbc	105	Measurement	5	1	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
434	30416560-3da3-d3bc-cc21-f7fde0b9d925	105	Measurement	5	12	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
435	ea757d39-04dd-a0d8-da91-83e106456e7c	105	Measurement	6	1	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
436	1d6f5d7c-7b2f-d80a-2c9a-b2b4ef21eaf2	105	Measurement	6	12	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
437	38176486-1219-ceeb-5405-d54bdafe08c9	105	Measurement	8	1	\N	1	1983-07-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
438	c862e119-3745-7b44-a744-53decea25810	106	Measurement	7	11	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
439	efde7d00-1d36-a002-b075-af58dc5257f4	106	Measurement	5	1	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
440	bb238b72-caed-b3d6-1ccd-7e50e61fb48b	106	Measurement	5	12	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
441	411d69e6-b241-8500-1452-c22bfe9024cd	106	Measurement	6	1	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
442	9ea7a1ac-bcd3-0c20-9314-72acda60ede9	106	Measurement	6	12	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
443	02006aa0-32f6-df08-1970-dcd8b356adca	106	Measurement	8	1	\N	1	1983-08-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
444	24aa99ac-aa36-8dc3-e8d9-5f9123cfa3c8	107	Measurement	7	11	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
445	a979ff59-5381-3790-62c8-f3c6788c35fb	107	Measurement	5	1	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
446	ff1aabfa-5386-d520-ded0-42dc399c90cd	107	Measurement	5	12	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
447	b6495800-7948-2e05-1d5c-1c6f6e24cd5c	107	Measurement	6	1	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
448	f9e17c8c-cae2-f7ad-7243-50709cfc229a	107	Measurement	6	12	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
449	c971c890-baff-a2fa-f806-a5f89bbfb2ab	107	Measurement	8	1	\N	1	1983-09-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
450	27e66ed5-6fd6-f3f5-c806-5a610f0a1cb4	108	Measurement	7	11	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
451	1f6921c0-491a-ac96-1e4b-6e14902586d5	108	Measurement	5	1	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
452	6fb4760f-1ef0-d655-34c8-493a97bedb9e	108	Measurement	5	12	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
453	b46094df-1fa1-2ead-8fad-8f6e27bb162e	108	Measurement	6	1	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
454	7e90ca13-b714-051d-7755-6059648d3846	108	Measurement	6	12	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
455	af2748fe-3fce-565c-502b-854cb6549dfd	108	Measurement	8	1	\N	1	1983-09-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
456	4df27d33-bc8f-08f3-83c0-5342321a3d11	109	Measurement	7	11	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
457	3906de93-ab5c-0f68-8584-dbcf86b14834	109	Measurement	5	1	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
458	f0cba4a6-1b3e-6153-7490-bb12c2eb1213	109	Measurement	5	12	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
459	249787f4-087e-2566-c865-547f0d209c14	109	Measurement	6	1	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
460	cb47509b-e15f-7d01-e6af-1b4ae531de5f	109	Measurement	6	12	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
461	25759ff2-f842-6a9a-7a50-033c1893cd18	109	Measurement	8	1	\N	1	1983-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
462	627ed6ba-4ce0-3850-1c45-41d2dcd1a7eb	110	Measurement	7	11	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
463	c311ac6d-587a-37cc-4cdf-49d5e4da2251	110	Measurement	5	1	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
464	2f818535-6057-bdfd-2500-14f9f3a246fd	110	Measurement	5	12	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
465	723c3578-1c3f-227a-895c-c5f503624e67	110	Measurement	6	1	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
466	60183386-73f8-0f05-1330-7485fe4b6c2c	110	Measurement	6	12	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
467	7232644a-ef99-dd4b-6c11-fad4d1e9e8cb	110	Measurement	8	1	\N	1	1983-12-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
468	e45ad464-0be1-5a5d-2408-deff4cf4db23	111	Measurement	7	11	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
469	301b9b12-fdc5-d66e-4eae-edf4be5714f7	111	Measurement	5	1	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
470	f2f62799-18d0-2ad5-98ef-ef415e01e433	111	Measurement	5	12	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
471	b32bc24f-5120-136b-6394-09146046c266	111	Measurement	6	1	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
472	83ac55c0-5d81-cf3d-330e-7041e56a1009	111	Measurement	6	12	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
473	3ae5fb45-9c09-d539-00b8-128d024ad9fa	111	Measurement	8	1	\N	1	1984-01-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
474	fd90172e-3591-8d3f-8b16-182c0b83c605	112	Measurement	7	11	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
475	ae0c1652-423a-d408-44fc-b2327755952f	112	Measurement	5	1	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
476	756169f8-f113-15cb-41f3-c83eace5fcd6	112	Measurement	5	12	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
477	8c641146-256e-078f-d16c-e3bd4edd8fc4	112	Measurement	6	1	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
478	291bd6f2-5f76-d5fb-2915-000853b01075	112	Measurement	6	12	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
479	2707811d-3beb-f90d-f6f6-bc3cb17fce34	112	Measurement	8	1	\N	1	1984-01-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
480	91270600-d649-9455-73f8-e2a9fbfc445b	113	Measurement	7	11	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
481	a4293957-fea2-dac8-d736-5ea232f9e0ef	113	Measurement	5	1	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
482	c25cb693-d346-13cc-46ad-bd498a2d6d7b	113	Measurement	5	12	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
483	003d2ccf-b1c7-e456-c39e-5920a355db61	113	Measurement	6	1	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
484	819b7284-e222-298b-21a3-362c54d95236	113	Measurement	6	12	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
485	b00e93f3-360d-dc89-c79a-22c8467b1805	113	Measurement	8	1	\N	1	1984-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
486	18ef0026-ae85-11ed-097d-050c10fd888a	114	Measurement	7	11	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
487	48a1aac6-4fd8-6481-8197-2ae9342d3568	114	Measurement	5	1	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
488	d8e98447-4b8e-9eb0-dc66-cddefa599a38	114	Measurement	5	12	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
489	ee1e6ca2-5948-3156-da23-ef2f406f7278	114	Measurement	6	1	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
490	462fdc1c-56da-933b-77cc-98e01e52a2c8	114	Measurement	6	12	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
491	e8eaace0-f048-a3d8-65a3-6635457e47c0	114	Measurement	8	1	\N	1	1984-04-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
492	747907b0-a6c8-e944-836a-649af735917d	115	Measurement	7	11	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
493	96fe7753-61f3-ac16-792e-9b1bd3351553	115	Measurement	5	1	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
494	3d4f33b4-801f-4733-5096-7774f84a385e	115	Measurement	5	12	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
495	562e9487-0fee-b289-7dd3-baaee809a3ed	115	Measurement	6	1	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
496	93875b97-f81f-bcf9-9ecd-85f518a69092	115	Measurement	6	12	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
497	473a6045-dd6a-4d58-4d51-fb40daa59f2c	115	Measurement	8	1	\N	1	1984-09-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
498	21fa32b1-d742-ee06-2b33-d385d0f73641	116	Measurement	7	11	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
499	7abacbb3-979f-f3c7-1a52-6046ce331bcf	116	Measurement	5	1	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
500	f28b1915-65f8-0da9-4fdc-22833323bdc1	116	Measurement	5	12	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
501	ccc5bfc0-a8d3-698b-416e-0d8aedf68f2a	116	Measurement	6	1	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
502	bd7620dd-068a-9da9-6883-988a750d40a4	116	Measurement	6	12	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
503	82c7eab0-16f8-8bc8-fbda-4ec96d99edf8	116	Measurement	8	1	\N	1	1984-09-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
504	e27987ee-e906-c39f-fbe4-6f5fdcd5d0d9	117	Measurement	7	11	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
505	6e56f2a0-8d59-8439-c8de-346d64eafbb7	117	Measurement	5	1	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
506	98a1be01-6452-4c68-e287-efe6ec924c21	117	Measurement	5	12	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
507	6915c0e3-128b-d9bc-5156-826ac241135e	117	Measurement	6	1	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
508	c832c00d-6b2e-42ba-6183-7b25bfd0fd44	117	Measurement	6	12	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
509	0df5a9f3-35dd-7b0a-1351-082edb5ca05e	117	Measurement	8	1	\N	1	1984-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
510	fae08c54-0746-2528-005c-da45499822f4	118	Measurement	7	11	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
511	239004e3-fe26-afeb-4148-269eb538f5a2	118	Measurement	5	1	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
512	eb7ab744-1fc2-3721-aaa2-c5cfb180bde3	118	Measurement	5	12	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
513	f0e8680f-6b14-1d56-b8e0-76924907e83a	118	Measurement	6	1	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
514	75ebba93-9bef-9e33-0979-c13473e1aef2	118	Measurement	6	12	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
515	bc240c2a-6cfd-e1d4-2bda-8ec795c2b6f4	118	Measurement	8	1	\N	1	1984-10-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
516	bb711383-6fa4-8daf-704e-ed3145d4518d	119	Measurement	8	1	\N	1	1984-11-07 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
517	6aa3d983-4e4e-9593-3da7-845493d8a357	120	Measurement	7	11	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
518	da58c7e9-b75a-188b-39ac-c160515b0675	120	Measurement	5	1	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
519	c4de6079-846a-beee-48f7-6ef36bf57392	120	Measurement	5	12	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
520	8143aaf7-e7df-545b-6ece-7ad5dcac8aab	120	Measurement	6	1	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
521	571b5883-9839-36b8-9665-64d488e59351	120	Measurement	6	12	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
522	2aed6914-236b-3b1b-40cd-719e859b495c	120	Measurement	8	1	\N	1	1984-11-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
523	f2ab5612-3b5d-4ccc-894a-fd1e3dd3aee9	121	Measurement	7	11	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
524	e47f0c15-9881-d46e-3cba-c653cc00c5d6	121	Measurement	5	1	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
525	3035edea-bdd8-e603-5daa-52e96810c629	121	Measurement	5	12	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
526	e50b8e1f-4c7c-8ee9-47d5-b3170f6d07ac	121	Measurement	6	1	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
527	c8ceb444-9e85-f137-aabb-bbcbe24b15c0	121	Measurement	6	12	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
528	3c53089b-5086-ca16-dd88-5e2cb5fcc72d	121	Measurement	8	1	\N	1	1984-12-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
529	cf0b30e7-55b9-615b-b1b8-69ac1c40bfae	122	Measurement	7	11	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
530	01a6b8ce-3bf6-ac5b-ed30-16a146296beb	122	Measurement	5	1	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
531	1ec69e5d-df37-8c3f-315e-822bcc4d5a73	122	Measurement	5	12	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
532	92bc8a9e-6452-0098-41cd-2c7bda03e2e2	122	Measurement	6	1	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
533	03b106e1-6d9d-bf76-30eb-5750b357f778	122	Measurement	6	12	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
534	fd8e9232-3b18-b284-a4dd-0e0862442691	122	Measurement	8	1	\N	1	1984-12-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
535	ee0a90d5-5c6a-3af5-4522-824ff86a3197	123	Measurement	7	11	\N	1	1985-02-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
536	1be0ff4c-2ebe-7618-b740-5532251e2777	123	Measurement	5	1	\N	1	1985-02-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
537	e20f6f93-9770-242c-623c-84036a49b505	123	Measurement	5	12	\N	1	1985-02-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
538	a69504fc-240c-d7d9-1410-2dbf95a1719a	123	Measurement	6	1	\N	1	1985-02-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
539	f4021546-4dab-5892-9fd9-39841322c957	123	Measurement	6	12	\N	1	1985-02-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
540	52a9b2e2-4e1a-b619-9ef1-8c37889f01db	123	Measurement	8	1	\N	1	1985-02-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
541	0589c262-9160-dde0-96ee-c490c9dccaf2	124	Measurement	7	11	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
542	5267c0e5-2b2a-0662-275a-fc076f18e1e4	124	Measurement	5	1	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
543	c03f3768-a2e0-91a0-14b2-3435d7fb7f32	124	Measurement	5	12	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
544	7dee69c2-9807-b74d-550d-7431e520f112	124	Measurement	6	1	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
545	e0316aec-0f55-b012-3eea-cf19ec58e4f8	124	Measurement	6	12	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
546	7c5b9cd8-6687-6416-cee4-ba1a96d9d206	124	Measurement	8	1	\N	1	1985-03-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
547	4f6329d3-1062-68e3-f044-60a55f9ee551	125	Measurement	7	11	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
548	55db5aa1-ab57-55f4-2196-4ee596a9f3d0	125	Measurement	5	1	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
549	85ffe09f-e125-b9e7-2160-6b51ae03f324	125	Measurement	5	12	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
550	e3c587e8-4576-8bb2-0d68-3a0999964353	125	Measurement	6	1	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
551	db686b80-b267-c338-69b6-4eb81e6d70fc	125	Measurement	6	12	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
552	46bc0e84-3150-90da-fd08-ce59f93c2d37	125	Measurement	8	1	\N	1	1985-03-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
553	06ada4ba-42e2-8f2c-b53d-06960c092d8f	126	Measurement	7	11	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
554	e90d6cf1-4c8e-96c5-3223-d2e564c577ca	126	Measurement	5	1	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
555	e293e406-5008-54b8-64c9-98c5aef485b0	126	Measurement	5	12	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
556	40bfeafb-c635-7fcb-422e-44f09904d24c	126	Measurement	6	1	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
557	d4312ca4-3ceb-8eb2-bdb9-193ad6ec38f1	126	Measurement	6	12	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
558	e67dd88b-776f-a934-341a-0bdfbf3695e3	126	Measurement	8	1	\N	1	1985-04-03 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
559	bdbfff45-3eb6-f9dc-dd37-c6e3cff0b7e3	127	Measurement	7	11	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
560	bdc16d9c-76a7-c2f7-e6cc-0739fbd2a22a	127	Measurement	5	1	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
561	e046a2e3-88dc-fceb-1c6e-cd27009624cd	127	Measurement	5	12	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
562	c7c9732b-8600-d14a-700f-4223b96b4aff	127	Measurement	6	1	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
563	579ddfcf-c68b-915d-af82-aa624d0eb7f8	127	Measurement	6	12	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
564	fd3e5cb2-156c-5fb7-b84f-becf41a21523	127	Measurement	8	1	\N	1	1985-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
565	53ac7309-51ca-b8eb-b146-24c7abea7511	128	Measurement	7	11	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
566	8a3b9a53-b5f0-2cb4-d334-3ed5c42b45c3	128	Measurement	5	1	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
567	9fe60ce6-a0b3-3a53-5e05-5d4f477ee64c	128	Measurement	5	12	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
568	3f6c798f-fde0-9da1-3e35-d508ee293356	128	Measurement	6	1	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
569	93729cf7-04cd-cd8e-062f-a3fb3edd5212	128	Measurement	6	12	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
570	ed90a618-b6e9-286d-f7b1-1f5b99aeaba6	128	Measurement	8	1	\N	1	1985-05-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
571	1c85d0c3-cbd7-3942-59d8-02821c129d4e	129	Measurement	7	11	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
572	c53a630f-1de3-97de-4a88-307e00c0e750	129	Measurement	5	1	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
573	1538afa6-e97a-19e9-6f4a-aa5148bc92bd	129	Measurement	5	12	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
574	49457b2c-996a-15a5-753a-e8581901ebcb	129	Measurement	6	1	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
575	8d440bc4-ca63-d8b9-1e53-df31c85796a4	129	Measurement	6	12	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
576	e72a3b90-2b22-2892-e67a-8dad9ea48778	129	Measurement	8	1	\N	1	1985-05-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
577	5053a669-e39c-0e92-c2c6-1cacffcbb1cb	130	Measurement	7	11	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
578	ec89e5c8-a37b-5fba-0f4d-5ac346e8f37f	130	Measurement	5	1	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
579	ce12b0d0-5693-95df-2dea-79ee8d19f2c3	130	Measurement	5	12	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
580	ab293f93-0ee9-9143-06a1-2bc0936dc123	130	Measurement	6	1	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
581	2eff8cac-e23c-4793-eb3a-1cb1724a0096	130	Measurement	6	12	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
582	cc11e5cb-c1ad-fc99-4995-9d3f9eb2e394	130	Measurement	8	1	\N	1	1985-05-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
583	599101d9-6b5b-e1b4-0d6c-2cefbd1ed312	131	Measurement	7	11	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
584	d6582943-e5c1-6987-a6d0-79ca19b58c90	131	Measurement	5	1	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
585	0076d618-8299-f079-07e8-a8aa9278e3a4	131	Measurement	5	12	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
586	15b9d7b2-c5b5-3933-bf44-0ed96ccdfc3a	131	Measurement	6	1	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
587	d36a516d-7154-f6cf-c6b3-344b9ab21035	131	Measurement	6	12	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
588	1371e845-2bad-54ed-6f14-32bb88b2279d	131	Measurement	8	1	\N	1	1985-06-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
589	97861bdf-cf91-0a29-46b6-4a081cc6e26b	132	Measurement	7	11	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
590	21315958-006f-8ae3-83e3-91280f3ea32f	132	Measurement	5	1	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
591	e5b0d2e3-e52d-b5d3-a111-9ac57186fa5e	132	Measurement	5	12	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
592	bc51257f-5868-0a84-77d7-132535285e50	132	Measurement	6	1	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
593	b1c90728-8c46-3e28-ae7e-ab3254bd9bbb	132	Measurement	6	12	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
594	03128f11-8368-d405-fd53-d79d09a32040	132	Measurement	8	1	\N	1	1985-06-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
595	af4dda43-46fb-2630-b07a-4e65e8fd9b3f	133	Measurement	7	11	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
596	c3f7c0d9-5652-e617-4deb-7c2ffcf57353	133	Measurement	5	1	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
597	b1a82f78-2534-7414-02c9-3def36aa5ace	133	Measurement	5	12	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
598	1a2f643f-8201-f506-8bc3-0dfc1bf4b95c	133	Measurement	6	1	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
599	35a1f00c-d9b2-14eb-3aa1-c91f266e2ff9	133	Measurement	6	12	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
600	e04e1431-d715-36e7-fa38-d785d4a0aa2b	133	Measurement	8	1	\N	1	1985-07-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
601	d00c5dee-8221-725d-3e79-8ccf1666ddb1	134	Measurement	7	11	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
602	46777265-2649-80b6-67cc-d118f942a09a	134	Measurement	5	1	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
603	f4b34159-847e-d023-d080-763bb0154e9d	134	Measurement	5	12	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
604	1310a011-6079-b4d1-6a78-56bbbc3e1737	134	Measurement	6	1	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
605	b9ac0f1d-6919-d171-a591-03bdd8a593ae	134	Measurement	6	12	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
606	e9bfc08b-abd9-79c5-f116-49aa4835174a	134	Measurement	8	1	\N	1	1985-10-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
607	a04e32a8-58a3-36c0-3bb2-3fa45c613ebf	135	Measurement	7	11	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
608	bb4e2530-1b39-d32a-fc42-672336a11cf2	135	Measurement	5	1	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
609	cebe2d13-89e8-d6df-b7a7-99327f92cb1a	135	Measurement	5	12	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
610	0cd590c2-5dd5-406f-bd44-55de42bb2cab	135	Measurement	6	1	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
611	44c30f73-9049-3535-83a8-2f029ee6ac63	135	Measurement	6	12	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
612	50c340cc-0b9f-420d-9a4e-77f8987fd1b2	135	Measurement	8	1	\N	1	1985-10-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
613	b0e61837-a91f-db73-8d20-45ad270893e0	136	Measurement	7	11	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
614	0333d1b0-5f45-9cca-cdf9-97c4196b924a	136	Measurement	5	1	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
615	d746fced-b30d-6c58-0331-ec3724f9ab0c	136	Measurement	5	12	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
616	ed0f7053-df2d-0183-dcaa-01126cd41c09	136	Measurement	6	1	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
617	f4c350b1-008d-5bfd-0504-5e78c87154ca	136	Measurement	6	12	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
618	cca94332-be6d-8ecb-7011-6d320bd3ce0e	136	Measurement	8	1	\N	1	1985-11-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
619	3e1c2228-0fc6-7e4e-5a4d-f3a3d32324a8	137	Measurement	8	1	\N	1	1985-11-27 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
620	10888532-1dc1-f58e-2d3d-5d7ed92c27d9	138	Measurement	8	1	\N	1	1985-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
621	f04d3e48-dd71-b055-3b9e-90e870990ff7	139	Measurement	7	11	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
622	826469a6-bbfe-d156-f713-947d7868bbee	139	Measurement	5	1	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
623	f57a604f-2af6-3cbf-7f75-2362d961f7bd	139	Measurement	5	12	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
624	b6904645-8b64-1042-0d0a-104ecb185743	139	Measurement	6	1	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
625	e1b3521c-5dc3-43e7-95fc-ba3567406f1d	139	Measurement	6	12	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
626	7de52149-6c88-ac4b-0be3-9168dea52132	139	Measurement	8	1	\N	1	1985-12-26 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
627	92a8d404-663b-16b7-4e7b-3d1a4acc06ac	140	Measurement	7	11	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
628	74423117-9728-22b7-0614-91b23eef2821	140	Measurement	5	1	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
629	822129d8-a9a1-1326-7379-bfd9b59debbd	140	Measurement	5	12	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
630	5128eae3-1c15-8f02-8022-b27ab12a0933	140	Measurement	6	1	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
631	76d69be0-24f3-faf1-00ac-1444a6f2235b	140	Measurement	6	12	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
632	9c279406-27f6-52cc-d6bf-e33833786061	140	Measurement	8	1	\N	1	1986-01-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
633	e18b6423-3aee-45bb-56cf-f5d51eb76280	141	Measurement	7	11	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
634	685ec555-961e-16f8-5336-7d4343a76f0e	141	Measurement	5	1	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
635	02b99e47-6dda-d336-e591-afea1fecc629	141	Measurement	5	12	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
636	ec8c1f8c-59bf-e520-5369-1fe4ba39fc24	141	Measurement	6	1	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
637	815ac2da-f4c3-47e8-7ae9-dcae81c9ae16	141	Measurement	6	12	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
638	2a5fa0f0-293a-570d-51a0-60657a5e67d3	141	Measurement	8	1	\N	1	1986-01-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
639	a7b47b3c-b37d-89bb-ff9f-42ff4c7d2bc0	142	Measurement	7	11	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
640	7ce0a4a7-424d-c783-6c0d-1a650211ae79	142	Measurement	5	1	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
641	b52d804f-45fa-8ef7-5945-065c54faa3d7	142	Measurement	5	12	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
642	10c4df2a-4350-edb2-de52-83e86103779f	142	Measurement	6	1	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
643	bfee51e8-0588-b4b2-5e8a-1977ee175e2b	142	Measurement	6	12	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
644	767951a1-8df1-e8b9-caa5-ca17be401407	142	Measurement	8	1	\N	1	1986-02-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
645	b1ecc883-3822-6b37-b44a-381aba53d8d7	143	Measurement	7	11	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
646	6ab5232a-1e7c-7bd6-4b5f-cb01686045fa	143	Measurement	5	1	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
647	7fbe23c6-4cca-4afd-60d2-0b28ed047430	143	Measurement	5	12	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
648	a4d02c83-4d54-5248-3b46-f5ae9de9a6bb	143	Measurement	6	1	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
649	75323509-d154-6ae4-aa34-6686d744ee89	143	Measurement	6	12	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
650	88a24f4a-7167-ffa4-4eaf-a7fd9b0c92ae	143	Measurement	8	1	\N	1	1986-03-04 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
651	85f1692f-2c24-8e47-7314-e52def3ac9aa	144	Measurement	7	11	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
652	35fef472-190d-7caa-3c40-028c5d1f3613	144	Measurement	5	1	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
653	2e4977b2-95f1-f270-1f0b-2bf8159eecf7	144	Measurement	5	12	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
654	fba9248b-9b67-02fd-e7fa-aa0f05a5f8e7	144	Measurement	6	1	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
655	66849d5c-2a00-9844-7637-c6d1c2e2544a	144	Measurement	6	12	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
656	7e1f3ec3-f121-9234-fb4f-3e30bc767ec0	144	Measurement	8	1	\N	1	1986-03-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
657	937556b4-7e74-8fb0-7369-406e5fdf32b1	145	Measurement	7	11	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
658	f42b5265-9cb8-7265-80f7-9724ed389756	145	Measurement	5	1	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
659	1254f510-ec25-3273-3fa5-8f15a9e65c34	145	Measurement	5	12	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
660	7a82abca-b2dc-46b8-6fae-4b475e5eb91a	145	Measurement	6	1	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
661	1f031961-0421-d48c-6bf1-607ad616e27d	145	Measurement	6	12	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
662	d885da8a-67c7-cad3-4fbc-21f722fefc1d	145	Measurement	8	1	\N	1	1986-04-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
663	961df4e8-17de-6d46-5b7a-2da97c35ab4e	146	Measurement	8	1	\N	1	1986-04-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
664	12d9e99f-14f2-7f25-1623-b98b08c5e92f	147	Measurement	8	1	\N	1	1986-05-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
665	5a2e1419-0ba6-8352-bdfd-8f797104d27e	148	Measurement	8	1	\N	1	1986-07-02 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
666	7c6e2a7a-4b41-2933-821c-717d66d0a97b	149	Measurement	8	1	\N	1	1986-08-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
667	08ae74ac-1e11-b425-ab81-753b068caf50	150	Measurement	8	1	\N	1	1986-09-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
668	804dd6b6-1838-2571-70b9-52bbd3f0c100	151	Measurement	8	1	\N	1	1986-10-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
669	1c7c3d33-77dd-d5f7-fafd-172eef3c74bf	152	Measurement	8	1	\N	1	1986-11-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
670	7ffe5804-d126-ae2c-1663-11c4806847cb	153	Measurement	8	1	\N	1	1986-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
671	2ca32ca4-c62d-7911-14fb-ff7812cb752f	154	Measurement	7	11	\N	1	1987-06-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
672	72e60938-9511-c12f-ad2a-7a9647995395	154	Measurement	5	12	\N	1	1987-06-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
673	e070cd13-501b-84ea-97dc-4dab8f57ca54	154	Measurement	6	12	\N	1	1987-06-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
674	7684e3b1-f235-b72a-6a77-2a2c3151bfec	155	Measurement	7	11	\N	1	1987-06-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
675	a80c81e4-c127-0d15-3e5a-2db26032b2bc	155	Measurement	5	12	\N	1	1987-06-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
676	de093b07-8410-671e-28d3-7deafb4e4a60	155	Measurement	6	12	\N	1	1987-06-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
677	91c0bee4-4a39-c812-8b1c-797352139d33	156	Measurement	7	11	\N	1	1987-08-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
678	73c8ca16-894f-9136-a6c1-b8b14ff70146	156	Measurement	5	12	\N	1	1987-08-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
679	5b993054-95b7-76f1-3607-07a64d6c7dc7	156	Measurement	6	12	\N	1	1987-08-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
680	948f8b50-7066-67da-20de-2f3a97fdf4bb	157	Measurement	7	11	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
681	bdf91d5d-0500-9def-29e2-44743a3af997	157	Measurement	5	1	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
682	8a865717-d69f-18c2-a738-ff5a8eeaaa62	157	Measurement	5	12	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
683	762ea16c-c2a6-8d22-94fd-1aa19e03d84f	157	Measurement	6	1	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
684	60f591e2-2ebf-312f-08ff-cdd371417659	157	Measurement	6	12	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
685	39ffd4f6-d64f-694a-3878-c08af5fc76af	157	Measurement	8	1	\N	1	1987-09-30 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
686	2a6f8494-f827-8831-a9dd-942d7c6ff859	158	Measurement	7	11	\N	1	1988-01-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
687	53492e6a-37f0-95e7-82ee-71cd69eb6b16	158	Measurement	5	12	\N	1	1988-01-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
688	351c70a7-2325-a41b-91a3-ebe85f9c5248	158	Measurement	6	12	\N	1	1988-01-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
689	6480cfec-f21d-c13d-b7f3-d5ed9a78a20e	159	Measurement	7	11	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
690	a06aa3f8-c1d3-fdb7-ab07-3ee984c14d1c	159	Measurement	5	1	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
691	11a87c57-f8ce-db6a-7a35-bfaad5eca030	159	Measurement	5	12	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
692	8d613dae-db51-cf5c-8963-0468296f53a0	159	Measurement	6	1	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
693	62bca03f-84c9-9d21-1083-2089518339f7	159	Measurement	6	12	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
694	3ecb4adf-4442-21e9-c793-2b35c6019f41	159	Measurement	8	1	\N	1	1988-02-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
695	adbedd84-ec20-a62a-bf05-995c12c53e53	160	Measurement	7	11	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
696	f0edc93c-7b59-bcb5-b280-6fe3999a30a0	160	Measurement	5	1	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
697	a2978b85-b356-655a-b257-bb598390b58e	160	Measurement	5	12	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
698	5d1a6a07-98f4-dff0-36b2-85e3b743b00c	160	Measurement	6	1	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
699	335a9575-0935-b5f3-f1b5-f8d36b02a968	160	Measurement	6	12	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
700	1c954fd2-3193-9dec-1453-e495e87e847f	160	Measurement	8	1	\N	1	1988-04-21 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
701	60697256-854f-5916-1a20-6ef56d219375	161	Measurement	7	11	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
702	4dc812c3-873a-7083-652a-fc4445bfdc29	161	Measurement	5	1	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
703	16fed41e-e0c0-ca5e-cf42-cec4a1177b32	161	Measurement	5	12	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
704	d9811bfc-3f0d-5c3b-e46e-71dae529a912	161	Measurement	6	1	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
705	06cb08a0-a221-a6e2-b2d7-13770d7293a8	161	Measurement	6	12	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
706	7f5d954f-8c3a-b926-68fb-3a535f591caf	161	Measurement	8	1	\N	1	1988-05-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
707	814d9b7e-3030-dd29-5f45-2df95302afc6	162	Measurement	7	11	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
708	1d48022f-a80b-5e09-8e94-534761254532	162	Measurement	5	1	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
709	6d3c0398-21f7-6b2c-88f5-49a5caee828e	162	Measurement	5	12	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
710	5659f3e0-e590-01db-a88f-63b9830f7410	162	Measurement	6	1	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
711	1d3fa773-6a40-6f61-0568-0ee6dac841a9	162	Measurement	6	12	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
712	691775a4-454a-5aa7-1637-a2609f5ff8d9	162	Measurement	8	1	\N	1	1988-06-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
713	f2b3c1b2-1b11-c1a6-4559-23ae4120dca5	163	Measurement	7	11	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
714	1ef3c739-5fba-f87e-d5c1-727a8e346eea	163	Measurement	5	1	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
715	caa74cce-141d-f8c5-5385-8fd36ff5efc3	163	Measurement	5	12	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
716	e8c6c512-f251-5a9c-74b5-3d82f6a9f8b5	163	Measurement	6	1	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
717	737bb1fe-e6f8-f47d-6fa2-cff6ec6f3700	163	Measurement	6	12	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
718	6c5d262d-cb60-30b7-8834-5824e8687c86	163	Measurement	8	1	\N	1	1988-07-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
719	75452801-352e-4c50-fa52-7d24c6864aa9	164	Measurement	7	11	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
720	4c030dc9-bbec-428d-b28e-5eb6085c98ee	164	Measurement	5	1	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
721	14a4dc6c-b09b-fab0-bbc6-8eb9186768e6	164	Measurement	5	12	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
722	3b72d133-dc6f-3bc1-2a93-0b26ddc3c79a	164	Measurement	6	1	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
723	fe96616e-aac6-6377-0f53-095ac5be9d22	164	Measurement	6	12	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
724	c5c7f178-a1a2-296c-df2b-e21a76f9812d	164	Measurement	8	1	\N	1	1988-08-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
725	73471153-bc7d-6c37-f878-cd81f6a5623a	165	Measurement	7	11	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
726	90d541b6-269d-ce0c-3749-1a8b05af7d88	165	Measurement	5	1	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
727	4161edfe-2ade-d6b4-39a8-74510c9dc871	165	Measurement	5	12	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
728	872d889a-84a8-8fb4-b231-8d4d38aca401	165	Measurement	6	1	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
729	679c9559-1cd1-be2d-91a6-a8569f48d703	165	Measurement	6	12	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
730	6526cca5-f75f-e830-e49f-d1b1e9b5cefa	165	Measurement	8	1	\N	1	1988-09-23 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
731	33cb33d8-3f69-f414-206e-e04f3a46c152	166	Measurement	7	11	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
732	497683a4-a9ba-9a16-2df3-82276158cb57	166	Measurement	5	1	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
733	6c162535-d8b7-aeed-9fe4-4cf5e6235b57	166	Measurement	5	12	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
734	a17fe2a6-58af-5663-ef1c-45f0d97051bc	166	Measurement	6	1	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
735	6577b33d-c4d1-e8e4-ca16-c9bf26f28e1a	166	Measurement	6	12	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
736	959acbb1-3f05-bb69-b700-17419c104e47	166	Measurement	8	1	\N	1	1989-02-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
737	0f35edbe-eeaa-8414-81df-d625ad7a85da	167	Measurement	7	11	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
738	1c5d026c-9d96-84cd-004a-e45db2d6ec45	167	Measurement	5	1	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
739	0742e4e1-66be-c28f-0b62-945554e8a78c	167	Measurement	5	12	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
740	29500239-d41f-edf8-2df1-5fcb1f82933e	167	Measurement	6	1	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
741	834fd300-066e-4973-2948-bdd0f2ad6c5e	167	Measurement	6	12	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
742	eff8cc29-090d-8396-b639-50b40882f4d6	167	Measurement	8	1	\N	1	1989-03-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
743	89116f23-5cdd-1d38-4db7-42e1a0bb3370	168	Measurement	7	11	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
744	227d7c8c-5fdd-bb66-c7b9-53f1095774b5	168	Measurement	5	1	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
745	d90b186a-8f24-dde8-ce83-71dc39b5d0b7	168	Measurement	5	12	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
746	cc5f515b-0452-dd09-2054-1a87a30754b1	168	Measurement	6	1	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
747	d655607b-7b43-b4f5-e76c-4043d5086b08	168	Measurement	6	12	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
748	8a151d35-9e81-0122-75ad-e5cc8c418c1b	168	Measurement	8	1	\N	1	1989-07-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
749	9492e7b1-e9aa-ea34-8626-bff4127b40b8	169	Measurement	7	11	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
750	33cd66bc-af55-5008-e02e-275790955299	169	Measurement	5	1	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
751	471c1e6d-88f6-52bd-faa8-b1f0a24fcd58	169	Measurement	5	12	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
752	4165470f-5570-93ca-7c16-c7c7c90df064	169	Measurement	6	1	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
753	38f5e9bf-35ca-6d38-ac78-ce8c5b92b49a	169	Measurement	6	12	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
754	133f1b38-bbc5-a1a3-834f-805cddc7e305	169	Measurement	8	1	\N	1	1989-08-10 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
755	66e78e67-a673-15e2-c82d-c9eb8bbc165c	170	Measurement	7	11	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
756	bd8a3ab1-98be-ea3a-9e92-ade772261f8a	170	Measurement	5	1	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
757	51b79fd9-81ba-bb3a-b43f-74f32489eb4b	170	Measurement	5	12	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
758	c28c5dd6-c8d5-abed-bf1b-c789f31f8fe9	170	Measurement	6	1	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
759	1166137a-eb0e-494b-f555-b112b570caab	170	Measurement	6	12	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
760	5bccdf3a-4e24-f8f7-2c6e-ddf4f3f24c05	170	Measurement	8	1	\N	1	1989-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
761	e0f54a00-c395-d530-85e8-0a3c95e090c6	171	Measurement	7	11	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
762	585a2c5e-8988-ad8c-915d-397e3c7af782	171	Measurement	5	1	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
763	0b950da4-0e6b-3ce1-9015-9d440c05a165	171	Measurement	5	12	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
764	4774257b-fbe9-bae9-fea2-cefb1dac28ad	171	Measurement	6	1	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
765	eb2732bf-6fe5-82a5-3e65-f32a492c9e58	171	Measurement	6	12	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
766	9405e940-d14a-d1e3-0f25-a1e51a0b03d4	171	Measurement	8	1	\N	1	1989-11-19 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
767	ec292635-ce5b-db6f-3e5e-b0f11afd580f	172	Measurement	7	11	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
768	267709fa-d06d-458b-5bd2-366bd1b388aa	172	Measurement	5	1	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
769	ab21349c-880d-f446-51b0-769f96688d03	172	Measurement	5	12	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
770	a2b39ab3-32a8-81e0-a048-63d72e8a1368	172	Measurement	6	1	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
771	e650a959-db51-94c0-c028-a0db83e3c073	172	Measurement	6	12	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
772	fbf95e80-0b3f-cb83-c783-8927dfc56db1	172	Measurement	8	1	\N	1	1989-12-12 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
773	4b90bc7d-ca60-b039-08cd-01b0763c3356	173	Measurement	8	1	\N	1	1990-03-13 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
774	b0b2f06f-04d5-ba6f-0d02-d32e46372440	174	Measurement	8	1	\N	1	1990-06-11 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
775	d87ed9ca-79a8-941f-2817-73a8b1bce5d1	175	Measurement	8	1	\N	1	1990-09-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
776	0d2de513-8411-f889-bf6d-0f579ec087fd	176	Measurement	8	1	\N	1	1990-10-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
777	d0430b8b-74e2-df9a-1d44-f9b4e54f66cc	177	Measurement	8	1	\N	1	1990-12-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
778	542e3dc1-baba-caeb-cfcd-7afc9657f4e1	178	Measurement	8	1	\N	1	1991-01-15 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
779	51539cfa-d38a-d384-2d08-110fe71ddf7d	179	Measurement	8	1	\N	1	1991-02-08 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
780	4644997e-03ce-3069-d82e-c0091b94892a	180	Measurement	8	1	\N	1	1991-03-25 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
781	da971fd6-47d4-a126-d745-4ccb744199b8	181	Measurement	8	1	\N	1	1991-06-28 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
782	caa6a665-4dae-b8c8-2478-653e76e23867	182	Measurement	8	1	\N	1	1991-08-01 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
783	77b4faa6-5394-96bd-8cc1-b2c1a13015d3	183	Measurement	8	1	\N	1	1991-10-05 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
784	9f4b5de3-ad43-e608-9a37-89526d8dc3f3	184	Measurement	8	1	\N	1	1991-10-29 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
785	3616f7e3-0ce1-e857-671f-b5d917702599	185	Measurement	8	1	\N	1	1991-12-06 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
786	dc50bc8d-3f5f-bfea-83bc-82a96c50a48d	186	Measurement	8	1	\N	1	1992-01-18 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
787	145661d3-be51-ba84-d195-aa5d6a43bfa9	187	Measurement	8	1	\N	1	1992-02-22 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
788	837af773-6884-1122-9e96-94ae89f8e094	188	Measurement	8	1	\N	1	1992-03-24 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
789	c87b4ecc-506d-d24f-28e4-3799685a5878	189	Measurement	8	1	\N	1	1992-04-24 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
790	a100e856-45aa-955e-927e-d307116c5ec8	190	Measurement	8	1	\N	1	1992-05-14 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
791	6cd6ef10-8b6d-e487-00c4-e02392726bc0	191	Measurement	8	1	\N	1	1992-06-16 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
792	82862873-27b5-4e34-d469-a78a91d8777c	192	Measurement	8	1	\N	1	1993-03-24 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
793	90fea32b-c423-b6bb-00d7-dedc7404ba2a	193	Measurement	8	1	\N	1	1993-04-17 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
794	ccfecc56-5a48-fcc3-9e55-ead7b35e6fb9	194	Measurement	8	1	\N	1	1993-06-20 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
795	ee7c1212-7a8f-1778-1892-a753e0e78de2	195	Measurement	8	1	\N	1	1993-08-24 00:00:00	-5	\N	\N	Complete	Liquid aqueous	1
\.


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 262
-- Name: results_resultid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('results_resultid_seq', 795, true);


--
-- TOC entry 4828 (class 0 OID 70534)
-- Dependencies: 305
-- Data for Name: resultsdataquality; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY resultsdataquality (bridgeid, resultid, dataqualityid) FROM stdin;
\.


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 304
-- Name: resultsdataquality_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('resultsdataquality_bridgeid_seq', 1, false);


--
-- TOC entry 4752 (class 0 OID 70064)
-- Dependencies: 229
-- Data for Name: samplingfeatureannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY samplingfeatureannotations (bridgeid, samplingfeatureid, annotationid) FROM stdin;
\.


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 228
-- Name: samplingfeatureannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('samplingfeatureannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4862 (class 0 OID 70696)
-- Dependencies: 339
-- Data for Name: samplingfeatureextensionpropertyvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY samplingfeatureextensionpropertyvalues (bridgeid, samplingfeatureid, propertyid, propertyvalue) FROM stdin;
\.


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 338
-- Name: samplingfeatureextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('samplingfeatureextensionpropertyvalues_bridgeid_seq', 1, false);


--
-- TOC entry 4875 (class 0 OID 70764)
-- Dependencies: 352
-- Data for Name: samplingfeatureexternalidentifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY samplingfeatureexternalidentifiers (bridgeid, samplingfeatureid, externalidentifiersystemid, samplingfeatureexternalidentifier, samplingfeatureexternalidentifieruri) FROM stdin;
\.


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 351
-- Name: samplingfeatureexternalidentifiers_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('samplingfeatureexternalidentifiers_bridgeid_seq', 1, false);


--
-- TOC entry 4788 (class 0 OID 70235)
-- Dependencies: 265
-- Data for Name: samplingfeatures; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY samplingfeatures (samplingfeatureid, samplingfeatureuuid, samplingfeaturetypecv, samplingfeaturecode, samplingfeaturename, samplingfeaturedescription, samplingfeaturegeotypecv, featuregeometry, elevation_m, elevationdatumcv) FROM stdin;
1000	7b95d5ee-f07c-1526-7763-ccab6b2ee502	Water quality station	Obi	Obidos	Station ID 1000	Point	0101000020E610000053D0ED258DC14BC099D87C5C1B2AFFBF	23	Unknown
1001	6695162e-90b6-5cb8-35c4-e218c6058d99	Water quality station	Pau	Paura	Station ID 1001	Point	0101000020E61000008716D9CEF7B74CC07689EAAD812D03C0	13	Unknown
1002	c3e4de6c-4e68-0a5d-cad1-5fc46a203266	Water quality station	SJA	Sao Jose do Amatari	Station ID 1002	Point	0101000020E6100000B6BE4868CB7D4DC0FFEC478AC8F009C0	20	Unknown
1003	824ee6dc-810f-7814-db88-8a76c9a82f3d	Water quality station	Man	Manacapuru	Station ID 1003	Point	0101000020E6100000C364AA60544E4EC0BF60376C5B940AC0	28	Unknown
1004	85f1c9f7-37bf-7f63-4347-6607073f4888	Water quality station	Ano	Anori	Station ID 1004	Point	0101000020E610000010069E7B0FCF4EC09886E123628A0EC0	34	Unknown
1005	b761b525-e2c6-fc41-2376-3d58870dd6be	Water quality station	Ita	Itapeua	Station ID 1005	Point	0101000020E61000000395F1EF33824FC08386FE092E3610C0	38	Unknown
1006	11f5f951-31f9-86f4-3699-ae20a022cd9a	Water quality station	Jutc	Jutica	Station ID 1006	Point	0101000020E61000003A3B191C250F50C04F232D95B7230DC0	42	Unknown
1007	f73ea4ad-ab44-6509-0e53-37ad6db40af7	Water quality station	Tup	Tupe	Station ID 1007	Point	0101000020E610000045813E91277750C020D26F5F070E04C0	55	Unknown
1008	f8085b5d-f3de-8389-1c4d-fcffeb390f3a	Water quality station	Xib	Xibeco	Station ID 1008	Point	0101000020E610000058E2016553CC50C0357BA01518B204C0	62	Unknown
1009	023820a0-2176-6a3e-fcae-0ad8e5820463	Water quality station	SAI	Santo Antonio do Ica	Station ID 1009	Point	0101000020E6100000B70BCD751AF950C06A6AD95A5FA408C0	66	Unknown
1010	6018a990-c8fd-3a2a-4eb7-ba0bd79730f7	Water quality station	VGr	Vargem Grande	Station ID 1010	Point	0101000020E610000043041C4295F650C00938842A353B0AC0	70	Unknown
1020	398fd3b5-d0af-1af6-322c-04ada61757b9	Water quality station	amz_iquitos	Iquitos	Station ID 1020	Point	0101000020E6100000ACFF73982F4752C0B37BF2B0506B0EC0	106	Unknown
1021	8b5e4738-1dc4-4d20-9a52-44262b48180c	Water quality station	amz_abvnapo	Amazonas above Napo	Station ID 1021	Point	0101000020E610000027DA5548F93952C0F6285C8FC2750BC0	105	Unknown
1022	ea06f6db-b04d-e4a1-865d-325b98c9347c	Water quality station	amz_blwnapo	Amazonas below Napo	Station ID 1022	Point	0101000020E6100000CBF8F719172252C08CF84ECC7AF10AC0	102	Unknown
1023	5176a91e-4f85-a781-8e01-3a14833c8d52	Water quality station	amz_pebas	Pebas	Station ID 1023 - Stallard: Pebas, and below Pebas	Point	0101000020E6100000DC63E94317F251C05F24B4E55C8A09C0	99	Unknown
1024	6b879232-5cae-c375-2a18-e1b90980a89d	Water quality station	amz_leticia	Leticia	Station ID 1024	Point	0101000020E61000003ACC9717608351C0AED85F764F5E10C0	87	Unknown
1025	dab762b4-c6e0-ee67-508d-076b7fde8d6f	Water quality station	solim_assac	Ilha Assacio	Station ID 1025	Point	0101000020E6100000166A4DF38E5D51C0E84D452A8C6D0EC0	78	Unknown
1026	8fd75300-7179-7ae7-1f0e-96371253602f	Water quality station	solim_spo	Sao Paulo de Olivenca	Station ID 1026	Point	0101000020E6100000EECEDA6D173051C00C1F115322890BC0	72	Unknown
1027	d346f3df-d8b2-9272-fe98-fbb626e879c8	Water quality station	solim_blwjut	Solimoes below Jutai	Station ID 1027	Point	0101000020E61000004CE0D6DD3CB350C0ABB2EF8AE07F05C0	60	Unknown
1028	4a14898a-9dfb-cdd8-77d5-ec6ba5c66bc4	Water quality station	solim_fb	Fonte Boa	Station ID 1028	Point	0101000020E610000014D044D8F08450C086032159C00404C0	53	Unknown
1029	42a61b15-dd3c-cadc-a089-564ae706ad20	Water quality station	solim_alvar	Alvares	Station ID 1029	Point	0101000020E61000007099D365313750C0D595CFF23C3809C0	44	Unknown
1031	6438e4b1-7f35-4f16-9189-4b86274b2bca	Water quality station	solim_laranj	Laranjal	Station ID 1031	Point	0101000020E61000006A87BF266BB84FC01B2FDD2406810EC0	40	Unknown
1032	deae2307-37a7-0c64-913c-b52a20325786	Water quality station	solim_cop	Solimoes-Parana Copea confluence	Station ID 1032	Point	0101000020E610000015E3FC4D28A84FC0DEB06D5166430FC0	39	Unknown
1033	eda7b9ba-1469-b3fb-b642-a160015d63fb	Water quality station	solim_coar	Solimoes above Coari R.	Station ID 1033	Point	0101000020E610000067F2CD3637924FC0732EC55565DF0FC0	38	Unknown
1034	97aac432-0aff-7bcd-00b0-e17c773c5e1e	Water quality station	solim_cama	Camara	Station ID 1034	Point	0101000020E6100000DB8AFD65F75C4FC0AB21718FA50F0FC0	38	Unknown
1035	d92cafca-1451-d8d7-eeb3-91032001f26a	Water quality station	solim_iuara	Ilha Iuara	Station ID 1035	Point	0101000020E6100000D00A0C59DDA64EC0CDAFE600C1DC0CC0	32	Unknown
1036	9d44acc1-c4f0-22f6-e4fd-e1d21ebb60eb	Water quality station	march	Solimoes - Marchantaria	Station ID 1036	Point	0101000020E6100000DAE6C6F484014EC0D5CF9B8A54580AC0	24	Unknown
1037	5fc5201a-c6ec-6e53-7355-80cf87c74c9d	Water quality station	amz_blwnegro	Solimoes-Negro confluence	Station ID 1037	Point	0101000020E61000002A745E6397E44DC01E8A027D220F09C0	23	Unknown
1038	989cb998-5c4a-5b92-f3bb-28b70f743e03	Water quality station	amz_itacoat	Itacoatiara	Station ID 1038	Point	0101000020E6100000DC4B1AA3753C4DC0598638D6C52D09C0	18	Unknown
1039	1dfdbff1-2468-8fa8-49c7-bcce8dba8df0	Water quality station	amz_parantins	Parantins	Station ID 1039	Point	0101000020E6100000C87BD5CA844F4CC0BEA4315A479504C0	12	Unknown
1040	7ba02369-c19b-56b4-76a3-7f478e0759c2	Water quality station	amz_apixuna	Apixuna	Station ID 1040 - Stallard: Apixuna, and above Tapajos confl.	Point	0101000020E61000009D465A2A6F874BC09291B3B0A7DD00C0	18	Unknown
1041	c3866e65-e836-3977-7320-3f4f044f1b78	Water quality station	amz_ituqui	Ilha Ituqui	Station ID 1041	Point	0101000020E61000005070B1A2061B4BC0CCEEC9C3422D03C0	11	Unknown
1042	cff498b4-f764-2bf4-8f28-46dd6d8f8611	Water quality station	amz_abvxingu	Amazonas above Xingu	Station ID 1042	Point	0101000020E610000019CA8976153A4AC006F52D73BAACF8BF	2	Unknown
1043	0db328db-5668-a14e-f2b9-ccb9df2d1e4f	Water quality station	amz_gurupa	Gurupa	Station ID 1043 - Stallard: below Xingu	Point	0101000020E6100000FB912232ACF649C0126BF12900C6F5BF	1	Unknown
1050	b2abd54c-1923-236f-05f4-970c1972acf9	Water quality station	Solim_Neg	Solimoes above Negro	Station ID 1050 - Encontro das Aguas, 1 km upstream of confluence with Negro	Point	0101000020E61000000586AC6EF5F04DC0C11C3D7E6F5309C0	24	Unknown
1101	9a894dda-6fea-3d90-89d9-c13b1eedf710	Water quality station	pdeva	Preto da Eva	Station ID 1101	Point	0101000020E6100000833463D174BA4DC09AB1683A3B1908C0	55	Unknown
1102	a284e9eb-4fbc-8d8d-1ebf-e17d90deceed	Water quality station	miner	Minerua	Station ID 1102	Point	0101000020E61000001ADD41EC4C8550C0B18A37328FBC04C0	50	Unknown
1103	6e65ac75-4c75-a3b7-576b-eeb3f93811cc	Water quality station	tonant	Tonantins	Station ID 1103	Point	0101000020E61000008E23D6E253F250C04512BD8C623906C0	64	Unknown
1104	e59c4058-827d-9d89-ccb5-c926f2da081b	Water quality station	Lago_Cam	Lago do Camaleao - Marchantaria	Station ID 1104 - Middle of lake, on Ilha da Marchantaria	Point	0101000020E6100000EC866D8B32FB4DC0E40F069E7B0F0AC0	24	Unknown
1105	69a2f45c-b1aa-50ff-bdd3-833b38344be5	Water quality station	Solim_Grass	Solimoes Flooded Grass near Marchantaria	Station ID 1105 - Flooded grasses, right bank, upstream of Ilha da Marchantaria	Point	0101000020E61000005951836918064EC0450DA661F8880AC0	24	Unknown
1106	eb0625c9-a5e0-f4f7-d042-538ca6f71000	Water quality station	Solim_Forest	Solimoes Flooded Forest near Marchantaria	Station ID 1106 - Flooded forest, right bank, upstream of Ilha da Marchantaria	Point	0101000020E6100000FCDEA63FFB094EC09031772D219F0AC0	24	Unknown
1110	4a3b0f3e-7caa-d719-fa4f-288b4450a9a9	Water quality station	cayaru	Cayaru	Station ID 1110	Point	0101000020E610000024B4E55C8A8F51C0E4839ECDAA0F0FC0	88	Unknown
1111	e1ee9d00-5d9a-8983-2f82-deca388e4c6e	Water quality station	obi_strm	Stream at Obidos	Station ID 1111	Point	0101000020E61000004E452A8C2DC44BC0508D976E1283FEBF	51	Unknown
5001	44daa344-611d-11d3-a179-94d604d37a9c	Water quality station	xingu	Xingu	Station ID 5001 - Stallard: Above confl., and Porto de Moz	Point	0101000020E6100000DC2E34D769204AC03A1E335019FFFABF	4	Unknown
9001	8bceae7b-8409-d5d5-57f4-423d604bf604	Water quality station	tapajos	tapajos	Station ID 9001	Point	0101000020E610000033FE7DC685634BC076FD82DDB02D03C0	8	Unknown
9002	5f7e16a0-a9f0-db49-8d79-2375fc0e6e0a	Water quality station	tapajos_mthbay	Tapajos at mid mouth-bay	Station ID 9002	Point	0101000020E610000016359886E18B4BC0EDD808C4EBBA05C0	16	Unknown
11101	f0eb61e2-aea3-3c9e-088e-4cc03f8586bb	Water quality station	RTrom	Trombetas	Station ID 11101 - Near Oriximina	Point	0101000020E610000023F3C81F0CF44BC0BEDEFDF15EB5FBBF	16	Unknown
11102	ab1ac855-df8d-9b48-ff12-7c95d9c34a8f	Water quality station	tromb_abvorix	Trombetas above Oriximina	Station ID 11102	Point	0101000020E610000086C954C1A8F84BC083FA96395D16FBBF	17	Unknown
11201	67504852-ae32-8066-f884-a584d2c70e02	Water quality station	nhamu	Nhamunda	Station ID 11201	Point	0101000020E6100000B8AF03E78C5C4CC01D554D10759F01C0	25	Unknown
14001	8deb84ed-b567-3f15-1348-82e5318024bb	Water quality station	uatum	Uatuma	Station ID 14001	Point	0101000020E6100000D3F6AFAC34114DC0A7B393C151B204C0	16	Unknown
15001	a988bc41-6eb4-5f22-d0d0-2fe4df28623e	Water quality station	urubu	Urubu	Station ID 15001	Point	0101000020E6100000878A71FE26744DC0EEB1F4A10BAA08C0	49	Unknown
16000	03c36bae-b80c-bdc8-9056-eb488033d45c	Water quality station	RMad	Rio Madeira	Station ID 16000	Point	0101000020E6100000D23AAA9A20664DC00B462575029A0BC0	20	Unknown
16001	a18d7c70-7c02-d978-b361-31f52e1d5d51	Water quality station	guaya	Guayaramerin	Station ID 16001 - PHICAB-GM?	Point	0101000020E6100000950ED6FF395650C0FCDEA63FFBB125C0	120	Unknown
16002	1ffee2d6-98f0-a7d5-fcab-b3239999662f	Water quality station	yata	Yata	Station ID 16002	Point	0101000020E6100000312592E8656850C066BD18CA89F625C0	136	Unknown
16003	1f69a6f3-5d23-fa52-ab2a-ec217b6ec2f2	Water quality station	arique	Ariquemes	Station ID 16003	Point	0101000020E6100000D0B359F5B9864FC02592E86514CB23C0	130	Unknown
16004	5d5c8527-3010-3929-44bc-b33719697b68	Water quality station	cand	Candeias-Porto Velho	Station ID 16004	Point	0101000020E61000007B6649809ADA4FC09CA223B9FC8721C0	77	Unknown
16005	ac5671de-39e9-7c95-6457-ac9a54bbafc8	Water quality station	carac	Caracol	Station ID 16005	Point	0101000020E6100000130A1170081350C0AB048BC3997F22C0	92	Unknown
16006	21124745-a6f3-1791-47be-0a150539fc57	Water quality station	jacip	Jaci-Paraná	Station ID 16006	Point	0101000020E6100000AA605452271850C01630815B779322C0	90	Unknown
16007	e47fbae2-4a97-55c4-2e0a-da785a0035f0	Water quality station	azul	Azul	Station ID 16007	Point	0101000020E61000001C5F7B66493C50C037894160E54023C0	103	Unknown
16008	42a9fab4-d180-5e99-5f87-d7a0f0e3cc15	Water quality station	RAbuna	Abuna Abunã	Station ID 16008	Point	0101000020E610000002486DE2E45C50C0A7E8482EFF6123C0	112	Unknown
16009	2070415b-e692-ede0-a11d-f3a2cced7230	Water quality station	abuna	Madeira Abunã	Station ID 16009	Point	0101000020E6100000C24CDBBFB25A50C0D00A0C59DD5A23C0	127	Unknown
16010	e76ea28b-6c72-966c-5162-fbebfb5294e4	Water quality station	novo	Novo	Station ID 16010	Point	0101000020E6100000029F1F4608DF4DC0F29881CAF8572CC0	295	Unknown
16011	5d799bf9-3910-f63c-6bf1-aef007647c5f	Water quality station	sara	Sararé	Station ID 16011	Point	0101000020E6100000475A2A6F47B04DC06B2BF697DD732DC0	297	Unknown
16012	cdb408f3-d51d-aa88-627d-2cb8e2a76188	Water quality station	vbgua	Vila Bela da S. Trinidade	Station ID 16012	Point	0101000020E610000091D5AD9E93FA4DC0780B24287EFC2DC0	193	Unknown
16013	80ec1025-3411-75ed-2dea-347873fbb049	Water quality station	plgua	Pontes e Lacerda	Station ID 16013	Point	0101000020E61000007D7901F6D1A94DC05760C8EA566F2EC0	290	Unknown
16014	f7ff06a9-52fb-1c03-fba6-395ad5b5a513	Water quality station	fvistal	Faz. Vista Alegre	Station ID 16014	Point	0101000020E6100000FC6F253B36024EC0E02D90A0F89113C0	36	Unknown
16015	595c4692-724c-fea1-ba1a-c298f203b03e	Water quality station	americ	America	Station ID 16015	Point	0101000020E61000001B81785DBF344EC08B6CE7FBA99114C0	40	Unknown
16016	f56b3f57-e9a0-269b-72b9-38d411176662	Water quality station	manic	Manicore	Station ID 16016	Point	0101000020E6100000268DD13AAAA64EC0151DC9E53F4417C0	48	Unknown
16017	35083161-7fc2-d5a0-e23f-eecabf5c0536	Water quality station	fatima	Fatima	Station ID 16017	Point	0101000020E6100000520ABABDA40D4FC0A3923A014DC418C0	53	Unknown
16018	df925164-deb5-5b25-4ee7-0883703d7c15	Water quality station	humaita	Humaita	Station ID 16018	Point	0101000020E6100000840D4FAF94814FC0B7973446EBE81DC0	62	Unknown
16019	6bb88028-c061-0c37-7652-2dedc35dcc86	Water quality station	pvelho	Madeira-Porto Velho	Station ID 16019	Point	0101000020E6100000BC0512143FF24FC0448B6CE7FB7921C0	96	Unknown
16020	2543edcf-d3ec-7bfa-6410-46d100194581	Water quality station	aripua	Aripuana	Station ID 16020	Point	0101000020E6100000E3DF675C38304EC01A51DA1B7CA114C0	40	Unknown
16021	0b035b3c-52c7-ed12-69f7-52e29b169a61	Water quality station	jamari	Jamari mouth	Station ID 16021	Point	0101000020E6100000645DDC4603B84FC034F44F70B1F220C0	96	Unknown
16100	6de449dd-4435-bea7-a3da-4f3d16255786	Water quality station	RiAba	Riberalta Abajo	Station ID 16100 - PHICAB-CE	Point	0101000020E610000073BA2C26367F50C02F6EA301BC9525C0	130	Unknown
16101	d7bf5757-48ae-a7f3-f63a-bc88ce9559e2	Water quality station	ortho	Orthon	Station ID 16101 - PHICAB-CA	Point	0101000020E61000008121AB5B3D8550C018CFA0A17FA225C0	131	Unknown
16102	7e03119e-733c-efd3-ae20-87b05b6b90c0	Water quality station	Mdios	Madre de Dios	Station ID 16102 - PHICAB-MF	Point	0101000020E6100000CB67791EDC8750C0F5D6C05609E625C0	133	Unknown
16103	1e3e3272-3b38-5ed9-009b-e085a9fcab1d	Water quality station	RiArr	Riberalta Arriba	Station ID 16103 - PHICAB-PC	Point	0101000020E6100000079964E42C8850C0D09B8A54180B26C0	135	Unknown
16104	affa121d-5408-5e2a-bfd4-f3691ac56c93	Water quality station	rurre	Rurrenabaque	Station ID 16104 - PHICAB-AB	Point	0101000020E6100000172B6A300DE350C0BD8C62B9A5152DC0	504	Unknown
16105	e79245e1-4bb9-c4b3-24c7-b5077179fa79	Water quality station	sape	Sapecho	Station ID 16105 - PHICAB-IN	Point	0101000020E6100000ACE28DCC23D550C05C1B2AC6F93B2FC0	608	Unknown
16106	c82eca76-6a34-1302-fd81-3d3f6115ae5b	Water quality station	lapaz	La Paz	Station ID 16106	Point	0101000020E61000009EEFA7C64B0551C0390B7BDAE18F30C0	3339	Unknown
16107	374756d3-fc13-622a-1210-54ed12392509	Water quality station	achu	Achumani	Station ID 16107	Point	0101000020E6100000158C4AEA040451C0B8239C16BC7830C0	3834	Unknown
16108	f292dc3d-5265-5f34-ab99-6477cf8e6d7b	Water quality station	kaka	Camanaui	Station ID 16108 - PHICAB-NU (Kaka-Nube, Teoponte)	Point	0101000020E6100000320395F1EFF350C09E0C8E9257E72EC0	584	Unknown
16109	0058d246-2533-2ca6-08f2-34ca382cc16e	Water quality station	yara	Yara Caranavi	Station ID 16109	Point	0101000020E6100000E88711C2A3E550C09279E40F068E2FC0	1012	Unknown
16110	0952fb94-d606-46a8-5b53-ae5283d7cd54	Water quality station	coroi	Coroico Caranavi	Station ID 16110	Point	0101000020E61000009F1F46088FE650C0DF4F8D976EA22FC0	1053	Unknown
16111	ac955120-230f-ba45-f3a2-faf3b183c6bc	Water quality station	zongo	Zongo	Station ID 16111	Point	0101000020E61000001D8F19A88C0751C0C6504EB4AB4030C0	4555	Unknown
16120	e849e4e0-13b8-1e1e-f83e-716c2bda3615	Water quality station	VG	Vuelta Grande	Station ID 16120	Point	0101000020E6100000D4F19881CA3450C0ECFA05BB610B28C0	120	Unknown
16121	83603673-cfb8-4d83-dbe4-d69b735b160f	Water quality station	PS	Puerto Siles	Station ID 16121	Point	0101000020E610000033333333334750C095607138F38B29C0	155	Unknown
16122	e63f6c46-4117-c575-02d4-812f4721317c	Water quality station	PG	Puerto Ganadero	Station ID 16122	Point	0101000020E610000015C616821C4050C000AE64C746102EC0	157	Unknown
16123	0609ac05-ff54-94f4-e34b-11269e55fef2	Water quality station	PA	Puerto Almacen	Station ID 16123	Point	0101000020E610000021EA3E00A93B50C031CEDF8442F42DC0	156	Unknown
16124	795ff4a3-bf47-72a9-0ea1-9bd1c9ca1d32	Water quality station	PV	Puerto Villarroel	Station ID 16124	Point	0101000020E610000091442FA3583250C0D3307C444CD130C0	167	Unknown
16125	92f92a11-7b7a-6e5d-bf8f-207c72571b5d	Water quality station	AP	Abapo	Station ID 16125	Point	0101000020E61000000E4FAF9465B84FC021B0726891ED32C0	359	Unknown
16140	629a7e05-1ada-6a82-d5e9-fd238f192daf	Water quality station	ESP	Esp. Santo - Tunari	Station ID 16140 - Villa Tunari	Point	0101000020E61000004C1AA375546150C05C3D27BD6F0431C0	453	Unknown
16141	031d7ed0-b81e-e9e3-63d0-d6704e858c99	Water quality station	MAT	San Mateo - Tunari	Station ID 16141 - Villa Tunari	Point	0101000020E6100000450DA661F85C50C05AD8D30E7F0D31C0	374	Unknown
16142	04a85e7a-4f2d-eab3-5ca8-c43bdf879ab3	Water quality station	CHI	Chimore	Station ID 16142 - Bridge	Point	0101000020E61000004BE5ED08A74B50C033C4B12E6E1B31C0	427	Unknown
16143	6c3f3b9e-8b74-0af1-8715-eaf7c4ed4b9f	Water quality station	ICH	Ichilo	Station ID 16143 - Bridge	Point	0101000020E61000009031772D211950C0DE54A4C2D82A31C0	196	Unknown
16144	9278f631-beb9-346d-85a3-d3b7e11fc965	Water quality station	PIR	Piray-Guardia	Station ID 16144 - Guardia	Point	0101000020E6100000CF6BEC12D5A34FC0234A7B832F6C31C0	307	Unknown
16145	5fe03e1d-2e5a-1b1a-03ba-825f13fcc884	Water quality station	ptearce	Puente Arce	Station ID 16145 - Puente Arce	Point	0101000020E61000009B1BD313964650C0EA95B20C71A432C0	1492	Unknown
16146	83e900dd-128e-a37a-4159-f06ebbef60f4	Water quality station	yapac	Yapacani	Station ID 16146 - Bridge	Point	0101000020E61000009EEA909BE1F24FC09AB67F65A54931C0	262	Unknown
16147	c0ff4052-5b2e-b470-d19d-a60b2395696e	Water quality station	gra_stacruz	Grande-Santa Cruz	Station ID 16147 - Santa Cruz	Point	0101000020E610000010CCD1E3F75E4FC08D0B0742B25031C0	222	Unknown
16148	4a53e852-5c1d-2aba-e6e2-249393bad5b5	Water quality station	challa	Challa	Station ID 16148	Point	0101000020E610000061376C5B949B50C0BDFBE3BD6A8D31C0	2653	Unknown
16160	7ad8fbc6-d626-6123-bc37-d20cc3a9969e	Water quality station	UN	Unduavi-Pte. Villa	Station ID 16160 - Puente Villa	Point	0101000020E61000004D4A41B797DE50C01D9430D3F64F30C0	2085	Unknown
16161	d7dce4f7-0e00-65ed-e843-b7bf39b194dc	Water quality station	TQ	Taquesi-Pte. Villa	Station ID 16161 - Puente Villa	Point	0101000020E61000008811C2A38DDD50C05131CEDF846230C0	2069	Unknown
16162	33f50734-3f78-2b40-ec4a-a5757c4124cd	Water quality station	MAP	Mapiri	Station ID 16162 - Guanay	Point	0101000020E61000000A9DD7D825F850C042959A3DD0DA2EC0	690	Unknown
16163	62b38efe-9259-4827-da2e-e73038baae2d	Water quality station	CHA	Challana	Station ID 16163 - Guanay	Point	0101000020E61000005A2A6F4738F750C0912C6002B7FE2EC0	526	Unknown
16164	d802535a-93fa-6e02-bc03-7eeba8cde041	Water quality station	TIP	Tipuani	Station ID 16164 - Guanay	Point	0101000020E61000008D45D3D9C9F850C099D36531B1F92EC0	500	Unknown
16165	26632978-15c9-11d0-4b2a-fa794111181f	Water quality station	TEO	Coroico-Teoponte	Station ID 16165 - Teoponte	Point	0101000020E6100000F8AA9509BFF250C047E6913F18082FC0	504	Unknown
16166	0edf285f-6d7c-6cdc-ce4e-9420e8b9c2be	Water quality station	KAK	Kaka Mouth	Station ID 16166	Point	0101000020E610000070EB6E9EEAEE50C06DC5FEB27B722EC0	500	Unknown
16200	963fd4fb-469d-fdd7-d44c-594713adde8e	Water quality station	JIP-5	Calama	Station ID 16200	Point	0101000020E61000005BEB8B84B6644FC0ECDD1FEF554B20C0	69	Unknown
16201	b1c5e827-7c81-5aec-ba8f-fab2158abc26	Water quality station	pjaru	Jarú	Station ID 16201	Point	0101000020E6100000742497FF903A4FC00BEF7211DFE924C0	195	Unknown
16202	fa7abf76-f35e-9cb1-4e39-b354eab15ee1	Water quality station	JIP-2b	Ji-Parana	Station ID 16202	Point	0101000020E61000008A93FB1D8AFA4EC01D8F19A88CDF25C0	192	Unknown
16203	295b6639-6832-7348-3833-9911d610c8dc	Water quality station	COM-2	Com. at Pimenta Bueno	Station ID 16203	Point	0101000020E61000008E75711B0D984EC085B69C4B715527C0	199	Unknown
16204	2ba074cc-cfdd-235b-b5c1-0d76e9c00a9e	Water quality station	COM-1	Vilhena - Ig. Piracolino	Station ID 16204	Point	0101000020E61000005951836918164EC01E1B81785D6F29C0	594	Unknown
16205	086764f4-135e-5190-0c76-6b55013ba10a	Water quality station	JIP-5b	Calama (half branch)	Station ID 16205	Point	0101000020E610000003CFBD874B6E4FC0AA7D3A1E332020C0	67	Unknown
16206	ddeb4e97-2242-1f12-d908-5b9a0b81c9d1	Water quality station	PRETO	Calama	Station ID 16206	Point	0101000020E6100000FE7DC68503714FC0AF08FEB7921D20C0	66	Unknown
16207	4091e9b1-927e-ba8f-d876-dd9208c764c1	Water quality station	JIP-4	Tabajara	Station ID 16207	Point	0101000020E6100000481630815B074FC085949F54FBE421C0	91	Unknown
16208	99968cac-f56d-4123-5946-cf50444ca85c	Water quality station	MAC	Machadinho D'Oeste	Station ID 16208	Point	0101000020E610000019ADA3AA09064FC088855AD3BC0323C0	198	Unknown
16209	19a063a9-ab0d-7c1a-d95a-c25f8f871375	Water quality station	JIP-3b	Barragem	Station ID 16209	Point	0101000020E6100000E97DE36BCFF44EC0F98381E7DE7323C0	200	Unknown
16210	3f339071-e5ab-c0eb-4241-48a1f17d12dd	Water quality station	JIP-3	Rebio-Jarú	Station ID 16210	Point	0101000020E610000029B3412619FD4EC057091687332F24C0	181	Unknown
16211	8625965f-50da-2434-7f00-fdf1d1203fda	Water quality station	JARU	Rebio-Jarú	Station ID 16211	Point	0101000020E6100000164D672783FF4EC0DCBA9BA73A3424C0	180	Unknown
16212	33b53f58-ac27-1b86-a606-772fe6d94720	Water quality station	JIP-2	Ji-Parana at JP/BR-364	Station ID 16212	Point	0101000020E61000009B1BD31396F84EC0C51B9947FEC025C0	191	Unknown
16213	b3960e97-0dec-3b6f-c153-e1c7338fa54a	Water quality station	URUPA	Ji-Parana	Station ID 16213	Point	0101000020E6100000D7DD3CD521FB4EC0AF08FEB792CD25C0	191	Unknown
16214	6b7e02ec-8001-9f39-e2ad-a75ec71ed8eb	Water quality station	ROLIM	Rolim de Moura	Station ID 16214	Point	0101000020E6100000E1455F419ADD4EC0C03E3A75E5E326C0	200	Unknown
16215	db37c8aa-65bc-c59f-8cbd-d288310903be	Water quality station	JIP-1	Cacoal	Station ID 16215	Point	0101000020E6100000FA27B85851BB4EC081785DBF60E726C0	200	Unknown
16216	196f8163-7222-a8a8-27a5-1209f365b1e3	Water quality station	PB-2	PB at Pimenta Bueno	Station ID 16216	Point	0101000020E61000001405FA449E984EC0F241CF66D56727C0	197	Unknown
16217	ed45cd3b-3aa2-4af4-b97c-6643831c20e3	Water quality station	PB-1	Vilhena	Station ID 16217	Point	0101000020E6100000247F30F0DC2B4EC036CD3B4ED1B129C0	495	Unknown
16218	6c957833-476f-8757-3c40-14e07dcca1e8	Water quality station	NS2	forest stream @ Faz. Nossa Senora	Station ID 16218 - NS-2, Igarape Boa Vista  at 200-500 m upstream of NS-1, before exiting forest	Point	0101000020E61000007901F6D1A92F4FC06FD39FFD488125C0	296	Unknown
16219	8023f495-bca6-c487-b1cf-b981eb746349	Water quality station	NS1	pasture stream @ Faz. Nossa Senora	Station ID 16219 - NS-1, Igarape Boa Vista at Estrada @Fazenda Nossa Senhora, after 200-500 m flowing through pasture	Point	0101000020E610000010069E7B0F2F4FC016C1FF56B28325C0	296	Unknown
16300	4edc3c7e-cda6-dc2d-2299-a48d8e4419a2	Water quality station	RIOMADREPMALDO	Rio Madre de Dios	Station ID 16300 - Landuse: Mixed. Stroud-Moore wtrshd: Rio Madre de Dios	Point	0101000020E610000048E17A14AE4B51C052B81E85EB3129C0	193	Unknown
16301	3b302cdf-b612-cc20-69c3-bac91e818857	Water quality station	RTAMBOPATAMOUTH	Rio Tambopata	Station ID 16301 - Landuse: Mixed. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E610000048E17A14AE4B51C09A999999993929C0	193	Unknown
16302	d760a1da-e945-ce5c-4380-8ba488498b31	Water quality station	RINAMBARI	Rio Inambari	Station ID 16302 - Landuse: Forest. Stroud-Moore wtrshd: Rio Inambari	Point	0101000020E6100000EC51B81E856F51C052B81E85EB7129C0	221	Unknown
16303	bde76329-046a-dfc2-2095-46713329ea0b	Water quality station	RLOSAMI	Rio Los Amigos	Station ID 16303 - Landuse: Forest. Stroud-Moore wtrshd: Rio Los Amigos	Point	0101000020E61000001F85EB51B88251C0B81E85EB511829C0	238	Unknown
16304	fd94ce5c-687b-54cb-78c9-48a9d035372d	Water quality station	RMADRECICRA	Rio Madre de Dios	Station ID 16304 - Landuse: Forest. Stroud-Moore wtrshd: Rio Madre de Dios	Point	0101000020E61000007B14AE47E18651C085EB51B81E2529C0	241	Unknown
16305	ba17d345-3c34-3957-29fc-99c6b01014e8	Water quality station	RLATORRE	Rio LaTorre	Station ID 16305 - waypoint taken on mainstem R.Tambopata opposite mouth of R. LaTorre. Landuse: Forest. Stroud-Moore wtrshd: Rio LaTorre	Point	0101000020E6100000D7A3703D0A5351C00AD7A3703DAA29C0	222	Unknown
16306	1b7b21c5-af34-1e79-ec88-f170b0f58334	Water quality station	RMELAN	Rio Malinowsqui	Station ID 16306 - Landuse: Forest. Stroud-Moore wtrshd: Rio Malinowsqui	Point	0101000020E6100000F6285C8FC26151C07B14AE47E1DA29C0	270	Unknown
16307	30985c09-1e16-2361-2f01-daff05813f4f	Water quality station	RTAMBOTRC	Rio Tambopata	Station ID 16307 - Landuse: Forest. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E6100000E17A14AE476551C06666666666462AC0	475	Unknown
16320	d71f56b5-4020-e86a-a67a-2cd457c47af6	Water quality station	Q2MIRADORCICRA	Q2MIRADORCICRA	Station ID 16320 - SH assigned SampNo 248. Landuse: Forest. Stroud-Moore wtrshd: Rio Los Amigos	Point	0101000020E6100000FDF7E0B54B8651C0853FC39B351829C0	241	Unknown
16321	9af8661e-54ff-ab62-5916-e1b4da83bb24	Water quality station	QARA1	QARA1	Station ID 16321 - Small permanent stream(?) Few insects; disturbed?. Landuse: Forest. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E610000021020EA14A5951C0BF0E9C33A2C429C0	267	Unknown
16322	1a070f71-faa3-1788-38e3-0477b3a8ee05	Water quality station	QARA3	QARA3	Station ID 16322 - Permanent; very clean water; many insect species. Landuse: Forest. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E6100000B554DE8E705A51C018213CDA38C229C0	260	Unknown
16323	0eed3c48-6bff-e4df-dbf3-85dcff60de4f	Water quality station	AQATI2	AQATI2	Station ID 16323 - Permanent; small community upstream, mostly primary forest. Landuse: Forest. Stroud-Moore wtrshd: Rio Madre de Dios	Point	0101000020E6100000A99F3715A94451C0A12DE7525C3529C0	198	Unknown
16324	12cddc40-99fd-cb85-f863-aee8b3f11d0c	Water quality station	AQATI8	AQATI8	Station ID 16324 - Landuse: Forest. Stroud-Moore wtrshd: Rio Madre de Dios	Point	0101000020E61000009B38B9DFA14451C0E71DA7E8483E29C0	200	Unknown
16325	29ca7ed7-61e1-d685-fc3c-e326c68d1431	Water quality station	QGATO	QGATO	Station ID 16325 - Medium trib to Tambopata, soap suds on stream from house; waterfall just upstream. Landuse: Forest. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E610000073F4F8BD4D5D51C0C2C073EFE1B229C0	244	Unknown
16326	0a574b83-1628-936c-d19a-deeaf9b068f3	Water quality station	QINF5	QINF5	Station ID 16326 - Landuse: Forest. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E6100000014D840D4F4F51C0EE7C3F355E5A29C0	195	Unknown
16327	93fe5552-2001-150d-db25-531098e33d13	Water quality station	QMADEROCICRA	QMADEROCICRA	Station ID 16327 - Landuse: Forest. Stroud-Moore wtrshd: Rio Los Amigos	Point	0101000020E6100000A6D590B8C78651C024D5777E511229C0	241	Unknown
16328	6bf9a1bf-8040-deaf-f94a-18d02d40c959	Water quality station	QMAQUIS2	QMAQUIS2	Station ID 16328 - Landuse: Forest. Stroud-Moore wtrshd: Rio Los Amigos	Point	0101000020E61000009274CDE49B8751C0C425C79DD21129C0	242	Unknown
16329	5529a83a-8b08-d541-43f0-eb5b08b81fa4	Water quality station	QMAQUISAPACICRA	QMAQUISAPACICRA	Station ID 16329 - 2nd order; sandy bottom, few stones. Landuse: Forest. Stroud-Moore wtrshd: Rio Los Amigos	Point	0101000020E610000077BAF3C4738751C05001309E411329C0	242	Unknown
16330	90b43499-4351-1670-3d17-e3ebfdb2f70d	Water quality station	QMISI	QMISI	Station ID 16330 - Small trib to Tambopata, gold mining at mouth; forested basin. Landuse: Forest. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E6100000B398D87C5C6151C017B7D100DED229C0	259	Unknown
16331	733ee725-13a9-c417-dbd4-a01bdc46094a	Water quality station	QTOMACICRA	QTOMACICRA	Station ID 16331 - Landuse: Forest. Stroud-Moore wtrshd: Rio Los Amigos	Point	0101000020E6100000984C158C4A8651C035E63B19982229C0	240	Unknown
16332	6c1ef8ed-3091-9f53-dd21-331fa4546678	Water quality station	QTRC2	QTRC2	Station ID 16332 - Rocky riffle. Landuse: Forest. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E61000008143A852B36751C02B6A300DC3472AC0	477	Unknown
16333	ad3809f0-5787-1513-a582-2668274a5ee0	Water quality station	QTRC4	QTRC4	Station ID 16333 - Excellent stream; best found to date. Emilio: Moved GIS longitude so QTRC2 & QTRC4 fall on different 0.005 deg cells. Landuse: Forest. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E61000005C8FC2F5286851C0D656EC2FBB472AC0	477	Unknown
16334	58908415-52d0-789c-20fa-12c7851105e5	Water quality station	Q3ESTRELLAS	Q3ESTRELLAS	Station ID 16334 - Heavy rain just before sampling, river muddy. Landuse: Agriculture. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E61000001092054CE05451C0D47D00529B6829C0	206	Unknown
16335	09fa404d-af1a-6f36-97a8-ccaa2ed3a202	Water quality station	QABEJITA	QABEJITA	Station ID 16335 - Landuse: Agriculture. Stroud-Moore wtrshd: Rio Madre de Dios	Point	0101000020E61000004E97C5C4E64751C0FFCA4A9352C028C0	200	Unknown
16336	85e01d6a-7f34-6509-dd83-0a04d66a194e	Water quality station	QINF2	QINF2	Station ID 16336 - Permanent. Landuse: Agriculture. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E6100000C2FA3F87F94E51C010751F80D45629C0	196	Unknown
16337	874184aa-eb6c-981b-009c-a63e1e5f0d21	Water quality station	QINF3	QINF3	Station ID 16337 - Permanent; name=Roja. Landuse: Agriculture. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E6100000FC8C0B07424E51C0A245B6F3FD5429C0	195	Unknown
16338	3ba9eaea-e356-12b0-26d5-0b979c5122f9	Water quality station	QINF6	QINF6	Station ID 16338 - Landuse: Agriculture. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E61000001A20EAA16A4F51C0C5FEB27BF26029C0	197	Unknown
16339	eaa77f36-8470-6114-0db8-314d30853fbb	Water quality station	QINFIERNO	QINFIERNO	Station ID 16339 - Airport upstream. Landuse: Agriculture. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E61000006AFB57569A4E51C0EB909BE1066C29C0	196	Unknown
16340	b887b9e8-d46c-155b-bca9-ec269989e9c9	Water quality station	QKM14	QKM14	Station ID 16340 - Very few insects; toxic?. Landuse: Agriculture. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E61000003E22A644125151C02B8716D9CE4729C0	200	Unknown
16341	1a469369-8587-651e-a2d6-50a52c3a4293	Water quality station	QLOBOYOC	QLOBOYOC	Station ID 16341 - Few Insects, bed unstable, riffles pea gravel. Landuse: Agriculture. Stroud-Moore wtrshd: Rio Madre de Dios	Point	0101000020E6100000BCE82B48334851C06475ABE7A4E728C0	200	Unknown
16342	24f2585d-0e2b-2a54-40fe-6261afc56b0f	Water quality station	QLAJOYA	QLAJOYA	Station ID 16342 - Very polluted. Landuse: Urban. Stroud-Moore wtrshd: Rio Tambopata	Point	0101000020E610000009A7052FFA4C51C04F58E201653329C0	194	Unknown
18000	8d278a56-1f65-10a8-3667-84ecbdd725c1	Water quality station	RNeg	Rio Negro	Station ID 18000	Point	0101000020E610000051A5660FB4264EC000000000008008C0	29	Unknown
18001	3914b939-9fe5-626d-9909-2837b3850b81	Water quality station	Rneg_Man	Negro at Manaus	Station ID 18001	Point	0101000020E6100000D690B8C7D2034EC0319413ED2A2409C0	32	Unknown
18002	1db88f9f-1d32-7e27-4684-36385362eaed	Water quality station	RNeg_Tar	Taruma, Ponta Negra, Manaus	Station ID 18002 - Ponta Negra, about 2 km upstream of port	Point	0101000020E6100000A20BEA5BE6104EC0A56B26DF6CB308C0	24	Unknown
18003	d19cbff5-693b-9bf1-3511-ae108d448760	Water quality station	RNeg_Cue	R.Negro above R.Cueiras	Station ID 18003 - above mouth of Cuieras	Point	0101000020E61000001CB62DCA6C4C4EC04963B48EAAE606C0	27	Unknown
18004	096423aa-1e6d-8b81-4bb8-ff7f429731b0	Water quality station	RNeg_Cam	R.Negro above R.Camanau	Station ID 18004 - above mouth of Camanau	Point	0101000020E61000001B12F758FAA04EC0977329AE2A7BFFBF	36	Unknown
18005	83e80d43-a30b-c332-612b-8a7293203e9c	Water quality station	RNeg_Uni	R.Negro above R.Unini	Station ID 18005 - at confluence with Rio Unini	Point	0101000020E61000007B6B60AB04BF4EC0ACFF73982F2FFABF	36	Unknown
18006	2d4e5f5b-f2a5-9303-d8b9-3eaf8f089c48	Water quality station	RNeg_Per	R. Negro @ Perseverança	Station ID 18006	Point	0101000020E6100000E42CEC69873F50C024B4E55C8AABDCBF	55	Unknown
18007	fe20f1d8-1284-6006-9f71-abe4493ebb96	Water quality station	RNeg_Pin	R. Negro above Ig. Pinto	Station ID 18007	Point	0101000020E6100000302AA913D0A050C031992A1895D4D7BF	65	Unknown
18022	a79b8121-b145-28ca-0a19-7fd6499b96a5	Water quality station	Ducke1	Ig. Barro Branco at wells, Res. Ducke	Station ID 18022 - Reserva Ducke	Point	0101000020E61000007099D36531FD4DC0A1F31ABB447507C0	59	Unknown
18025	c64835b6-ede4-a31f-a71f-17c372dd790b	Water quality station	Camp2	Res. Campinas, 100m downstream	Station ID 18025 - Reserva Campina, downstream, 100 m downstream	Point	0101000020E61000002C9FE57970034EC03563D17476B204C0	97	Unknown
18026	5b0b327e-f6ca-6dd7-1ac3-65d418eef3af	Water quality station	Camp1	Res. Campinas, well site	Station ID 18026 - Reserva Campina (km 44-45), upstream, at headwater near Michael's 	Point	0101000020E610000050FC1873D7024EC0D5B2B5BE48A804C0	99	Unknown
18040	29c6c35f-2577-17e8-490f-395e209b9c6f	Water quality station	RCue	R. Cueiras @ mouth	Station ID 18040 - at mouth, confluence with Rio Negro	Point	0101000020E6100000F3716DA8183F4EC062D68BA19CA806C0	37	Unknown
18041	4d38eee4-0089-e3d0-7bac-4e802e1ec9e6	Water quality station	I.Pedra	Ig. do Pedra @ R. Cueiras	Station ID 18041 - at mouth, confluence with R. Cueiras	Point	0101000020E6100000D13FC1C58A3A4EC053910A630B8106C0	39	Unknown
18043	754f0313-a6d4-1b81-3f47-38817bb4f269	Water quality station	RCue1	R. Cuieras above big trib	Station ID 18043 - Middle of Cuieras, mainstem	Point	0101000020E61000004D672783A3384EC0906B43C5383F06C0	40	Unknown
18044	667fe34d-14b9-f726-5f53-bcc014b4d2db	Water quality station	RCue_Forest	Flooded Forest of R. Cuieras	Station ID 18044 - Flooded forest, far from terra firma	Point	0101000020E610000015E3FC4D28344EC02C82FFAD64C705C0	47	Unknown
18045	3d76b936-689c-e4e9-91f8-1d164e669dbf	Water quality station	RCue3	R. Cueiras @ Rafael's	Station ID 18045 - at Rafael's Homestead	Point	0101000020E6100000226C787AA5284EC0C5387F130A5105C0	56	Unknown
18046	d78d2720-cdde-fef4-b634-b7f0debba718	Water quality station	I.Cach	Ig. do Cachoeira	Station ID 18046 - upstream of confluence with R. Cuieras by 5-10km	Point	0101000020E6100000C22FF5F3A6264EC09CC420B072A805C0	53	Unknown
18047	09cf54ba-7cf8-72ff-cb3d-87f7dd027abf	Water quality station	RCue2	R. Cueiras middle	Station ID 18047	Point	0101000020E61000009F76F86BB2364EC05C55F65D11FC05C0	44	Unknown
18050	66aa8259-7210-7498-7cd6-b7160b390911	Water quality station	ZF2_1	Ig. 1 do ZF2, main site	Station ID 18050 - Reserva ZF2, small stream that is instrumented by Waterloo	Point	0101000020E6100000CFF753E3A51B4EC0E90E62670ADD04C0	67	Unknown
18051	0bec1f8f-f805-4a57-1fb6-179df2586a07	Water quality station	ZF2_2	Ig. 2 do ZF2, near camp	Station ID 18051 - Reserva ZF2, small stream on tower trail near camp, flowing into Ig. 1 upstream of sampling point?	Point	0101000020E610000072BF4351A01B4EC0677E350708E604C0	67	Unknown
18060	b0370ef1-498f-18eb-e27b-eea7b52fe066	Water quality station	RPud	R.Puduari at mouth	Station ID 18060 - Mouth 	Point	0101000020E61000008C101E6D1C9D4EC02AC6F99B50C800C0	26	Unknown
18061	a81ddc71-d6ab-e510-bd85-61b8eac37099	Water quality station	I.Preta_Pud	Ig. Preta do Puduari	Station ID 18061 - at mouth, confluence with Rio Puduari	Point	0101000020E610000063B48EAA26A44EC014CB2DAD860401C0	26	Unknown
18062	dedc2c9a-19ca-b5cb-6580-b57bc0e2254e	Water quality station	RPud2	R.Puduari below falls	Station ID 18062 - below waterfall/rapids	Point	0101000020E6100000A7052FFA0AA64EC0C2DD59BBED4201C0	26	Unknown
18063	53bb3076-d4ee-1536-0491-be670c51af48	Water quality station	RPud3	R.Puduari above falls	Station ID 18063 - above waterfall/rapids	Point	0101000020E6100000A7052FFA0AA64EC0EBFF1CE6CB4B01C0	26	Unknown
18065	a55812c9-f1f0-3484-ceae-08829d35ef17	Water quality station	RBae	R.Baependi at mouth	Station ID 18065	Point	0101000020E61000007901F6D1A97F4EC0C02154A9D90301C0	40	Unknown
18070	499ed1f5-11e6-c7de-2048-8d725f668416	Water quality station	RCam	R.Camanau at mouth	Station ID 18070 - Mouth, near FUNAI Indian Reservation	Point	0101000020E61000007D5C1B2AC69D4EC083DDB06D5166FFBF	39	Unknown
18080	1b678324-4f1b-e57d-dd97-24073ba6d427	Water quality station	RUni	R.Unini at mouth	Station ID 18080 - mouth, confluence with Rio Negro	Point	0101000020E6100000738577B988C34EC08907944DB9C2FABF	35	Unknown
18081	0d670822-37f3-0550-ad79-b12e46cf2138	Water quality station	LagoUni1	Lago do Unini near mouth	Station ID 18081 - near mouth of Unini	Point	0101000020E6100000670A9DD7D8C94EC0C55565DF15C1FABF	35	Unknown
18082	56e1fb7b-6347-3ac0-ec8a-41c3cbe4fe85	Water quality station	I.Esc_Uni	Ig. Escondido do Unini	Station ID 18082 - at mouth, confluence with Rio Unini, below 1st fall/rapids	Point	0101000020E6100000878A71FE26E44EC04243FF0417ABFABF	35	Unknown
18083	3281112f-9706-f577-ed3b-6c2b98262361	Water quality station	RUni1	R.Unini below falls1	Station ID 18083 - below 1st falls/rapids	Point	0101000020E6100000A913D044D8E44EC0D8D30E7F4DD6FABF	35	Unknown
18084	43c13f2e-d367-c0bd-23e9-75f911f2b622	Water quality station	RUni2	R.Unini above falls2	Station ID 18084 - immediately above 2nd falls/rapids	Point	0101000020E61000002D78D15790EA4EC06DFFCA4A9352FBBF	35	Unknown
18085	42ff1ef0-8896-f6de-7f45-1f627c1850f1	Water quality station	I.Preta_Uni	Ig. Preta do Unini	Station ID 18085 - at mouth, confluence with Rio Unini, above second falls/rapids	Point	0101000020E61000001EDC9DB5DBF24EC056D4601A868FFBBF	36	Unknown
18086	a422d548-6579-8c9b-8ef5-b2d1154408a6	Water quality station	RUni3	Rio Unini meander	Station ID 18086 - above Lago (Man02 #25)	Point	0101000020E6100000758E01D9EBF94EC0F775E09C11A5FBBF	35	Unknown
18087	daad7b85-66e7-76c1-b4eb-b4be58e2bec5	Water quality station	LagoUni2	Lago do Unini above falls	Station ID 18087 - above Ig. Preta, above 2nd falls/rapids	Point	0101000020E6100000037D224F92FA4EC0B16D516683CCFBBF	35	Unknown
18100	ea292255-6da0-c7f8-9150-13ae1ba59a41	Water quality station	jau-6b	Jau-boca	Station ID 18100 - Stream Ord. 6	Point	0101000020E61000005E85949F54B74EC0E31934F44F70FEBF	34	Unknown
18101	d2e5b336-a25f-8bd0-ccb3-17d2c7edc485	Water quality station	jau-Car	R.Jau above Caravinani	Station ID 18101	Point	0101000020E6100000AF25E4839EC14EC090831266DAFEFEBF	34	Unknown
18102	41c0ba53-ea7e-22c5-7fa1-5ae98513eed0	Water quality station	jau-6c	Jau-capoeira grande	Station ID 18102 - Stream Ord. 6	Point	0101000020E6100000C4B12E6EA3ED4EC022C32ADEC83CFFBF	34	Unknown
18103	33afe5d9-7670-cd1a-b94c-ee3329fa9d45	Water quality station	jau-6v	Jau-volta da paz	Station ID 18103 - Stream Ord. 6	Point	0101000020E610000095F1EF332E044FC0533F6F2A52E1FFBF	34	Unknown
18104	e2715a0d-280d-c7f6-fb17-189e373ccd48	Water quality station	jau-6p	Jau-Pauini	Station ID 18104 - Stream Ord. 6	Point	0101000020E61000007BF7C77BD5324FC0CD751A69A9BC01C0	34	Unknown
18105	c080533a-abfd-3d34-fef7-25a6cdb8cae1	Water quality station	jau-5ap	Jau-Acima pauini	Station ID 18105 - Stream Ord. 5; also jau-5p	Point	0101000020E610000019FF3EE3C23D4FC099BB96900FFA01C0	34	Unknown
18120	4bd51555-d419-6f41-401f-1b497c514e61	Water quality station	preto-3	Ig. preto	Station ID 18120 - Stream Ord. 3	Point	0101000020E6100000EA094B3CA0B84EC010E9B7AF0367FFBF	34	Unknown
18121	fc65e7e2-48ed-442b-e4cf-4c04425d540f	Water quality station	jara-2	Jaraca	Station ID 18121 - Stream Ord. 2	Point	0101000020E6100000D7C0560916CF4EC01FD7868A71FEFCBF	34	Unknown
18122	8acbffcf-ca80-9d78-a952-a216ac8a3cac	Water quality station	queb-2	Quebrado	Station ID 18122 - Stream Ord. 2	Point	0101000020E61000002D431CEBE2D24EC0352905DD5E52FDBF	34	Unknown
18123	b0782c87-b6ab-c787-6e69-c2f3cd6ad3e3	Water quality station	capo-2	Ig. Capoeira grande(Jabu)	Station ID 18123 - Stream Ord. 2	Point	0101000020E6100000A4703D0AD7EB4EC0971C774A07EBFEBF	34	Unknown
18124	3c202552-e8aa-9d92-ea11-b0c47c51f398	Water quality station	paje-3	Paje	Station ID 18124 - Stream Ord. 3	Point	0101000020E6100000895E46B1DCF24EC0CBD6FA22A1ADFEBF	34	Unknown
18125	e2aca5fd-eea0-63db-820f-c41588644195	Water quality station	uma-4a	Ig. Umanapana	Station ID 18125 - Stream Ord. 4; also uma-4b	Point	0101000020E61000005AF0A2AF200D4FC019C5724BAB6100C0	34	Unknown
18126	981db05a-efcb-4868-018b-5c69f7b02dcd	Water quality station	maca-4	Ig. Macaco	Station ID 18126 - Stream Ord. 4	Point	0101000020E6100000F0F96184F0104FC033C4B12E6E2301C0	33	Unknown
18127	fa210181-ad81-3feb-3574-c2b0df8923f5	Water quality station	maca-3s	Ig. Macaco-sergio	Station ID 18127 - Stream Ord. 3	Point	0101000020E6100000BF60376C5B104FC049BA66F2CD3601C0	32	Unknown
18128	b660a4ce-d60e-3be7-cef9-ce4bf4c7a8ea	Water quality station	maca-2pc	Ig. Macaco-pret/cancao	Station ID 18128 - Stream Ord. 2	Point	0101000020E6100000BF60376C5B104FC0B1F9B836544C01C0	32	Unknown
18129	62766a35-2ba8-f2ea-5bfd-049e1caea843	Water quality station	maca-2b	Ig. Macaco-branquinho	Station ID 18129 - Stream Ord. 2; also maca-2p,oncas-2b,oncas-2p	Point	0101000020E6100000D61C2098A30F4FC0529B38B9DF6101C0	31	Unknown
18130	7d332592-2ac6-2acf-598f-750f8ad8db2f	Water quality station	maca-1c	Ig. Macaco-cancao	Station ID 18130 - Stream Ord. 1	Point	0101000020E6100000C93CF207030F4FC02EFF21FDF67501C0	30	Unknown
18131	1e0ce513-5b63-8471-5813-b3a838e7e38c	Water quality station	fortu-3	Ig. Fortuna	Station ID 18131 - Stream Ord. 3	Point	0101000020E61000002A8C2D0439344FC08BC3995FCD0102C0	33	Unknown
18132	fb0b9183-34d5-5068-31b9-3a272e422d43	Water quality station	oncas-4	Ig. Oncas	Station ID 18132 - Stream Ord. 4	Point	0101000020E61000000820B589933F4FC022FDF675E0DC02C0	34	Unknown
18133	e3ce99e7-709c-1c31-e3a4-d2b08389ed33	Water quality station	oncas-3p	Ig. Oncas-Preto	Station ID 18133 - Stream Ord. 3	Point	0101000020E6100000D690B8C7D23B4FC03CDA38622DBE03C0	34	Unknown
18134	35ec36de-7de7-d34c-7807-a1985526bf47	Water quality station	pauini-5	Pauini	Station ID 18134 - Stream Ord. 5	Point	0101000020E61000006536C824233F4FC0E1D1C6116BF101C0	34	Unknown
18135	26997efd-a82d-58dc-51e8-f4f26bbe9e5f	Water quality station	pauini-3e	Ig. Pauini-eustaque	Station ID 18135 - Stream Ord. 3	Point	0101000020E6100000F20C1AFA27444FC0E5ED08A7052F02C0	34	Unknown
18140	591d221d-6504-391a-042d-dbff3d2cfa9b	Water quality station	mira-4	Ig. Miratucu	Station ID 18140 - Stream Ord. 4	Point	0101000020E6100000543541D47DEC4EC07E1D38674469FFBF	34	Unknown
18141	7018044d-c8c5-586a-abdc-7b2544ae3c96	Water quality station	mira-3n	Miratucu-Novo	Station ID 18141 - Stream Ord. 3	Point	0101000020E610000087DC0C37E0EB4EC05DF92CCF83BBFFBF	34	Unknown
18142	f1020641-374a-eb9f-650e-0698528894f5	Water quality station	mira-2n	Miratucu-Novo	Station ID 18142 - Stream Ord. 2	Point	0101000020E61000001F11532289EA4EC0EE7C3F355EBAFFBF	34	Unknown
18143	584320f9-296b-ac48-2811-27cf939e682b	Water quality station	mira-1n	Miratucu-Novo	Station ID 18143 - Stream Ord. 1	Point	0101000020E6100000BE874B8E3BE94EC07E00529B38B9FFBF	34	Unknown
18144	2ae4999d-527f-fd1f-c89f-a6af0c58457e	Water quality station	mira-3ag	Miratucu-acima gerley	Station ID 18144 - Stream Ord. 3	Point	0101000020E61000000C1F115322ED4EC0C79DD2C1FA3F00C0	34	Unknown
18145	9387f2b9-f2d1-04ed-dd7d-3bd554c6e646	Water quality station	mira-3g	Ig. Miratucu-gerley	Station ID 18145 - Stream Ord. 3	Point	0101000020E61000000DA661F888EC4EC012143FC6DC3500C0	34	Unknown
18146	a3a56b37-ca56-6a8c-9cea-d3b7b383a6aa	Water quality station	mira-3m	Miratucu-meio caminho-ger	Station ID 18146 - Stream Ord. 3	Point	0101000020E61000007958A835CDEB4EC04C1AA375543500C0	34	Unknown
18147	413e5be0-04f4-dfe5-0fcf-964a39280f06	Water quality station	mira-2c	Ig. Miratucu-Cobra/Normal	Station ID 18147 - Stream Ord. 2	Point	0101000020E61000002B1895D409E84EC09E077767ED3600C0	34	Unknown
18148	1ce8c583-8771-26f9-a3a3-499a3d5e7842	Water quality station	mira-2	Ig. Miratucu	Station ID 18148 - Stream Ord. 2	Point	0101000020E6100000F111312592E84EC0650113B8753700C0	34	Unknown
18149	76cf9d62-f7c3-edff-0bc7-3ca860411824	Water quality station	mira-1c	Miratucu-caminho,cabeceir	Station ID 18149 - Stream Ord. 1	Point	0101000020E61000000DA661F888EC4EC0AF777FBC572D00C0	34	Unknown
18150	3477278f-5236-16d7-a5e3-3c062c15c589	Water quality station	mira-1	Ig. Miratucu	Station ID 18150 - Stream Ord. 1	Point	0101000020E61000000DA661F888EC4EC014799274CD2400C0	34	Unknown
18170	c6975c70-a44d-fd85-cbf1-eb70b2467952	Water quality station	cara-5	R. Carabinani	Station ID 18170 - From Jau Report97, also -61.528889, -1.96	Point	0101000020E6100000363CBD5296C14EC0D82AC1E27066FFBF	34	Unknown
18200	4398dc0d-3a54-3779-c2e0-2a2e98e5d512	Water quality station	branco	Branco	Station ID 18200	Point	0101000020E61000004BC8073D9BF14EC0A110018750A5F5BF	38	Unknown
18400	acaa17fc-4ad7-0fc8-3552-f876af8a3c4d	Water quality station	negro_branco	Negro at Confl. With Branco	Station ID 18400	Point	0101000020E61000002D78D15790FA4EC0247F30F0DC7BF5BF	38	Unknown
18401	27004cd6-b33c-1ec6-0674-b0f37e2deea8	Water quality station	4	R. Caurés	Station ID 18401	Point	0101000020E6100000E466B8019F1F4FC08A8EE4F21F52F5BF	37	Unknown
18402	17d632c1-9ed3-f334-b8e2-53ae48234a5b	Water quality station	16	R. Cuiuni	Station ID 18402	Point	0101000020E6100000508D976E128B4FC0C095ECD808C4E7BF	37	Unknown
18403	039d8736-6b54-4d26-b128-0155d1bd873a	Water quality station	15	R. Padauari	Station ID 18403	Point	0101000020E610000026E4839ECD0050C025CCB4FD2B2BB5BF	59	Unknown
18404	de438057-89b5-0ee9-9a07-b5a0449d8b5c	Water quality station	14	R. Preto	Station ID 18404	Point	0101000020E6100000B6A1629CBF0150C0BCE82B483316B5BF	58	Unknown
18405	1db3fded-e007-1302-bb5f-abf00ab56b8a	Water quality station	5	R. Urubaxi	Station ID 18405	Point	0101000020E61000005036E50AEF3450C00EF8FC304278E3BF	48	Unknown
18406	53b853db-d36d-272b-82e2-9fc80c621558	Water quality station	6	R. Aruanã	Station ID 18406	Point	0101000020E6100000EDF0D7648D3E50C00A68226C787AE2BF	49	Unknown
18407	7267ebd3-3337-6c43-c605-36ded758673d	Water quality station	8	R. Uneiuxi	Station ID 18407	Point	0101000020E6100000008C67D0D04750C00A68226C787AE2BF	51	Unknown
18408	563ff322-8b89-d3ff-21ca-9c302b346e59	Water quality station	9	R. Tea	Station ID 18408	Point	0101000020E61000000B24287E8C4750C0AF7C96E7C1DDDFBF	51	Unknown
18409	5e7bc5de-6904-5fd7-fdac-324fb5194566	Water quality station	10	R. Marauia	Station ID 18409	Point	0101000020E6100000C32ADEC83C4E50C02E90A0F831E6D6BF	59	Unknown
18410	9ff2f062-2361-dbc1-84d0-0e29879542a3	Water quality station	11	R. Cauaburi	Station ID 18410	Point	0101000020E61000005E9D6340F67C50C0FD4D2844C021D0BF	62	Unknown
18411	1d8e8196-df99-19a9-a7ac-dcff649ded43	Water quality station	12	R. Marie	Station ID 18411	Point	0101000020E6100000F90FE9B7AF9B50C0F3E505D847A7DCBF	65	Unknown
20000	2a266518-f7cb-88af-838d-42a9f388a56d	Water quality station	RPur	Rio Purus	Station ID 20000	Point	0101000020E610000033A7CB6262B74EC0448655BC91F90DC0	32	Unknown
20001	e435f7a9-ba5c-36e0-f2ba-7bed34447806	Water quality station	acre	Boca do Acre	Station ID 20001	Point	0101000020E61000002A6F47382DD850C0492EFF21FD7621C0	100	Unknown
20002	d92a78b0-1a49-54f0-eb09-6ecfa9ffb272	Water quality station	brasil	Brasileia	Station ID 20002	Point	0101000020E6100000064CE0D6DD3051C0C55565DF150126C0	250	Unknown
22001	5110f1e5-05ee-ce0b-25c5-a3107aca5a6e	Water quality station	coari	Coari at Coari	Station ID 22001	Point	0101000020E6100000F0F96184F0944FC0CF4E0647C92B10C0	38	Unknown
22002	6f204cdf-635b-216c-d6d6-cf4be2a8e842	Water quality station	coari_mthbay	Coari at Lower-Middle mouth-bay	Station ID 22002	Point	0101000020E61000001D554D1075A34FC0D8D30E7F4D3610C0	39	Unknown
23001	9bd964a5-0b93-f717-6462-4b10d28f32d1	Water quality station	tefe	Tefe at Tefe	Station ID 23001	Point	0101000020E61000001DACFF73982D50C0B398D87C5CDB0AC0	44	Unknown
23002	c8e9dc7b-47a3-916b-bdb6-075175a0dde1	Water quality station	tefe_mthbay	Tefe at Middle mouth-bay	Station ID 23002	Point	0101000020E6100000C53D963E743150C085EB51B81E850BC0	44	Unknown
24000	a090533d-bafe-ec9d-00df-3e329fdd0369	Water quality station	RJap	Rio Japura	Station ID 24000	Point	0101000020E61000001DE6CB0BB06B50C0A4198BA6B313FDBF	55	Unknown
25000	9cff8432-24e0-570d-deef-82ce6699ba3e	Water quality station	RJur	Rio Jurua	Station ID 25000	Point	0101000020E6100000018750A5667350C09DBAF2599EC705C0	56	Unknown
25001	ead2e217-70a3-4425-f26b-b1813c27f88a	Water quality station	crusu	Cruzeiro do Sul	Station ID 25001	Point	0101000020E6100000FFEC478AC82852C022C32ADEC87C1EC0	188	Unknown
26000	66b9edc3-1202-01ec-eb5b-85cc63a3c371	Water quality station	RJut	Rio Jutai	Station ID 26000	Point	0101000020E6100000ACADD85F76C150C0F5A10BEA5B6606C0	62	Unknown
27000	c089ab06-2d72-845d-cb6a-fc8d74277fee	Water quality station	RIca	Rio Ica	Station ID 27000	Point	0101000020E6100000A514747B490D51C052499D80264208C0	68	Unknown
28000	edcc95c9-b580-08c1-236f-edbf93ca8544	Water quality station	jandiatuba	Jandiatuba	Station ID 28000	Point	0101000020E61000008109DCBA9B2D51C099BB96900FFA0BC0	88	Unknown
29001	daa87792-6ac8-b6ca-b9b8-52d7679520f4	Water quality station	javari	Javari	Station ID 29001	Point	0101000020E61000009FABADD85F8251C00BD28C45D35911C0	83	Unknown
30000	0b08ba0e-5d6d-90f3-2dbc-fb05f78602a7	Water quality station	napo	Napo	Station ID 30000	Point	0101000020E6100000E370E657732852C0944DB9C2BB5C0AC0	103	Unknown
31001	9dd36d1a-f4fa-26ab-5303-7cff2cbba0fe	Water quality station	nanay	Nanay at Iquitos	Station ID 31001	Point	0101000020E6100000DCF4673F524C52C0A2D11DC4CE940DC0	106	Unknown
32000	fd18b753-e8b5-322e-1fd9-30c17fc08984	Water quality station	mara	Marañón	Station ID 32000	Point	0101000020E6100000BF60376C5B6452C0CD0182397A1C12C0	113	Unknown
32100	ce78fb1e-23cd-f73f-69b7-98708c7147db	Water quality station	huall_yurim	Huallaga at Yurimaguas	Station ID 32100	Point	0101000020E6100000B537F8C2640253C010751F80D4A617C0	200	Unknown
32101	4261c4ef-1b8e-1b8e-56c1-cbca388410f4	Water quality station	paranapura	Paranapura at Yurimaguas	Station ID 32101	Point	0101000020E61000007FBC57AD4C0853C0CDCCCCCCCC8C17C0	182	Unknown
32102	88104b55-6412-16cc-6ce2-990170988655	Water quality station	shanusi	Shanusi at Yurimaguas	Station ID 32102	Point	0101000020E6100000473D44A33B0653C018EC866D8BB217C0	182	Unknown
32103	b56db0f2-d794-acc3-c745-37d694dd5117	Water quality station	mayo	Mayo	Station ID 32103	Point	0101000020E61000001AA88C7F9F1B53C05FEFFE78AF3A1AC0	296	Unknown
32104	389d7c34-0b7b-8547-7463-49a1335a9d64	Water quality station	saltspr2_huall	Pilluana Salt Dome Cana salt spring	Station ID 32104	Point	0101000020E61000007FC16ED8B61253C0A0C37C7901361BC0	290	Unknown
32105	7f3717b1-c5fd-93c7-8c1f-4ba52df92180	Water quality station	saposoa	Saposoa	Station ID 32105	Point	0101000020E610000020EF552B132A53C0C80C54C6BF4F1CC0	309	Unknown
32106	325c0cf0-34c4-9132-c4f4-1656d335c396	Water quality station	huallabamba	Huallabamba	Station ID 32106	Point	0101000020E6100000CEC7B5A1623053C006F52D73BA0C1DC0	328	Unknown
32107	fe8305a2-9921-ff48-ca66-4d8f8a449f1f	Water quality station	huall_bals	Huallaga at Balsayacu	Station ID 32107	Point	0101000020E610000087A2409FC82953C0BEF6CC9200B51DC0	343	Unknown
32108	8a4f2476-fb01-b1d2-6bc4-d0007bbd4077	Water quality station	tocache	Tocache	Station ID 32108	Point	0101000020E6100000A0FD4811192253C0ED9E3C2CD45A20C0	452	Unknown
32109	46f36d9d-b67f-8e84-4187-415bd70f8bb1	Water quality station	huall_toca	Huallaga at Tocache	Station ID 32109	Point	0101000020E6100000DC9DB5DB2E2053C019390B7BDA6120C0	467	Unknown
32110	01225a72-a741-c718-111d-d8456bde6073	Water quality station	cachiyacu	Cachiyacu	Station ID 32110	Point	0101000020E6100000EC17EC866D1953C06BB75D68AE8320C0	514	Unknown
32111	6eb9468b-f5b0-dfc0-95c3-00ca7616cc1f	Water quality station	uchiza	Uchiza	Station ID 32111	Point	0101000020E6100000456458C51B1953C05E807D74EADA20C0	571	Unknown
32112	ee2bac6a-c822-561a-d986-00a7740dda59	Water quality station	aspasarta	Aspasarta	Station ID 32112	Point	0101000020E6100000D3BCE3141D0953C058E71890BD7E21C0	600	Unknown
32113	dc0a36ff-9ae3-e46e-225b-de843a916712	Water quality station	saltspr1_huall	salt spring,  left bank of Monzon R.	Station ID 32113	Point	0101000020E61000008F8D40BCAE0353C0176536C8249322C0	719	Unknown
32114	1b149a26-2635-3994-d410-899c039cb6b8	Water quality station	mozon	Monzon	Station ID 32114	Point	0101000020E6100000CC0BB08F4E0153C08A3C49BA66A222C0	677	Unknown
32115	7728f5fa-75bf-49a9-ffb1-ed2a1c9816a8	Water quality station	huall_tingo	Huallaga at Tingo Maria	Station ID 32115	Point	0101000020E61000000BD28C45D3FF52C02B4D4A41B7A722C0	705	Unknown
32116	4e94e4f4-c79f-5704-eac1-a82f247994db	Water quality station	huachipa	Huachipa	Station ID 32116	Point	0101000020E61000004B766C04E2FD52C0E65C8AABCAFE22C0	881	Unknown
32117	afbf9d55-f4ba-e226-3826-f38a2c3c7a54	Water quality station	higueras	Higueras	Station ID 32117	Point	0101000020E6100000AB5B3D27BD1153C004E275FD82DD23C0	1851	Unknown
32118	2662165e-3fc1-a5c3-5457-bf25999f5c30	Water quality station	huall_huanuco	Huallaga at Huanuco	Station ID 32118	Point	0101000020E6100000527E52EDD30F53C06D73637AC2E223C0	1837	Unknown
33000	d6b7d68a-3c3f-5899-9b56-05da1f0ada35	Water quality station	ucaya	Ucayali	Station ID 33000	Point	0101000020E61000007099D365315F52C09FCDAACFD51612C0	112	Unknown
33001	a7188d0e-ae1b-3a0e-14de-36913922ab1f	Water quality station	paucay	Ucayali at Pachitea	Station ID 33001	Point	0101000020E610000008AC1C5A64A352C0E21E4B1FBA9021C0	165	Unknown
33002	a9fcdef3-5178-77da-d596-365dc7402ab0	Water quality station	tambo	Tambo	Station ID 33002	Point	0101000020E61000006F47382D787152C0FB3F87F9F29225C0	286	Unknown
33003	a2d0ce3b-6678-5702-d5fa-c3adcd441fb0	Water quality station	cunyac	Cunyac	Station ID 33003 - At the main bridge	Point	0101000020E6100000240B98C0AD2552C0185B087250222BC0	2425	Unknown
33004	a51a4bea-d77f-b981-5366-5224f0d23771	Water quality station	urub	Urubamba	Station ID 33004	Point	0101000020E6100000A8E33103956D52C088855AD3BC8325C0	288	Unknown
33005	a259f005-3f4b-5ad7-0f74-9d3fe5229c18	Water quality station	yanat	Quellouno	Station ID 33005 - Yana means black in quechua (saw it on the web)	Point	0101000020E610000012A5BDC1172252C015747B49633429C0	1083	Unknown
33006	063ff01e-a2a2-17a3-5f88-e78be558b1e0	Water quality station	sahua	Sahuayaoti	Station ID 33006 - At Chahuares bridge	Point	0101000020E61000001895D409682252C07B14AE47E14A29C0	824	Unknown
33007	a6b66d56-78ea-ae8f-8a11-4ae4d43d54a7	Water quality station	quilla	Quillabamba	Station ID 33007 - At Pavayoc bridge. GPS coords are off; using Google Earth-based location for bridge.	Point	0101000020E61000008126C286A72B52C079E9263108BC29C0	1142	Unknown
33008	af2a244a-575b-b59a-7850-e7e976f044bf	Water quality station	osner	glacier stream at Osneritio	Station ID 33008 - At Quellouno bridge	Point	0101000020E6100000F6285C8FC21152C0713D0AD7A3502AC0	4317	Unknown
33009	e8ad3e91-2db4-5d5d-43d4-626f0c14d095	Water quality station	pachar	Pachar	Station ID 33009 - At bridge	Point	0101000020E61000002BFBAE08FE0F52C024B4E55C8A8B2AC0	3106	Unknown
33010	e96a7429-c521-ee69-7f7b-dbb89b845363	Water quality station	huanb	Huanbutio	Station ID 33010 - Just below confluence with Rio Huatanay, which drains Cusco	Point	0101000020E610000075594C6C3EEE51C0D8F50B76C3262BC0	3002	Unknown
33011	c08e7588-7273-3d1e-d92b-71143dc3944d	Water quality station	salcca	Salcca	Station ID 33011 - Near Combapata	Point	0101000020E61000007E6FD39FFDDA51C0153AAFB14B342CC0	3792	Unknown
33012	a021f03a-1ccd-4b03-0ada-88e1b57e47bc	Water quality station	tinta	Tinta	Station ID 33012 - At old foot bridge	Point	0101000020E6100000C80C54C6BFD951C04C6C3EAE0D552CC0	3571	Unknown
33013	5deee454-9406-f7bc-acc6-545a1f6ec34c	Water quality station	veluy	altiplano wetland at Veluyo	Station ID 33013	Point	0101000020E6100000B81E85EB51D451C09A99999999B92CC0	3957	Unknown
33014	c48bcf71-12de-a170-fa52-a4c43cd84392	Water quality station	langui	Langui	Station ID 33014	Point	0101000020E6100000DFE00B93A9D251C0C746205ED7DF2CC0	3877	Unknown
33050	7a0c6284-79a0-757e-f368-5d7eefcf17fa	Water quality station	ucay_pucall	Ucayali at Pucallpa	Station ID 33050	Point	0101000020E6100000E84D452A8C9F52C0CCEEC9C3429D20C0	158	Unknown
33051	7a5349c3-14e9-14ac-98d8-efab802db5ba	Water quality station	urub_machu	Urubamba at Machu Picchu	Station ID 33051	Point	0101000020E6100000F46C567DAE2252C0912749D74C4E2AC0	2029	Unknown
33052	a587e5f7-ebff-bc71-ffd1-de36964580db	Water quality station	aguascal	Stream at Aguas Calientes, Machu Picchu	Station ID 33052	Point	0101000020E61000002788BA0F401E52C048A7AE7C96672AC0	2881	Unknown
33053	222b74f4-c60a-4fec-146f-0d9268dbe65e	Water quality station	chulec	Mantaro at Chulec	Station ID 33053	Point	0101000020E6100000B4024356B7DA52C03C889D2974AE27C0	3829	Unknown
33100	ef8302e9-c569-95a9-81c6-df1a82510f7a	Water quality station	pachi	Pachitea	Station ID 33100	Point	0101000020E61000002D95B7239CA452C0BA66F2CD367721C0	165	Unknown
33101	7715e3aa-aba2-4404-3bdd-b5e75d57caa2	Water quality station	tourna	Tournavista	Station ID 33101	Point	0101000020E6100000392861A6EDAD52C05AF5B9DA8ADD21C0	170	Unknown
33102	c62483de-ec17-82e8-e8ad-15b1c9077cfb	Water quality station	ptoinca	Puerto Inca	Station ID 33102	Point	0101000020E6100000F86BB2463DBE52C0A9C1340C1FC122C0	181	Unknown
33105	d98382f7-5eb3-ead8-6d78-ec710eaf0ad6	Water quality station	sungar	Sungarayacu	Station ID 33105	Point	0101000020E6100000D235936FB6C152C074417DCB9CBE22C0	192	Unknown
33108	1558a346-3261-92b0-f7e4-6e5fbdfc5f67	Water quality station	palcazu	Palcazu	Station ID 33108	Point	0101000020E610000065AA605452BD52C062A1D634EFC823C0	189	Unknown
33109	3ddff37d-4f9a-0bde-153e-ce728f5128db	Water quality station	pichis	Pichis	Station ID 33109	Point	0101000020E61000009291B3B0A7BB52C0DF37BEF6CCD223C0	194	Unknown
33110	f19e63a8-daab-425e-1989-d986bb4f9429	Water quality station	pozuzo	Pozuzo	Station ID 33110	Point	0101000020E610000095F1EF332ED052C02497FF907ECB23C0	245	Unknown
33111	827b503c-d320-49b5-c892-7470a1fb4ec4	Water quality station	altpalcazu	Alto Palcazu	Station ID 33111	Point	0101000020E6100000EE3D5C72DCCF52C07B6B60AB04DB23C0	296	Unknown
33114	837d5b77-6a3c-2bcb-b974-0d7c032b030e	Water quality station	apurucay	Apurucayali	Station ID 33114	Point	0101000020E61000007C7E18213CBE52C07099D365310124C0	189	Unknown
33116	ca06b029-4173-14a5-e918-e1e5969a77ee	Water quality station	altpichis	Alto Pichis	Station ID 33116	Point	0101000020E6100000E7C6F48425B852C019390B7BDAB124C0	260	Unknown
33117	f5938ea5-519e-0ac8-23cb-58defe3ea7d1	Water quality station	neguachi	Neguachi	Station ID 33117	Point	0101000020E6100000D8B628B341B652C0E17A14AE47C124C0	275	Unknown
33118	bbe5a532-17f8-0d43-eb92-61855069f27a	Water quality station	nazarateg	Nazarategui	Station ID 33118	Point	0101000020E6100000417DCB9C2EB752C0115322895EC624C0	293	Unknown
33119	60a5feb2-808e-ef81-206c-209ed32416ff	Water quality station	azupizu	Azupizu	Station ID 33119	Point	0101000020E610000008C9022670B952C0E960FD9FC3AC24C0	246	Unknown
33122	fd5d6e29-84dc-2c46-6057-d963e848eb25	Water quality station	hua_stacruz	Santa Cruz	Station ID 33122	Point	0101000020E6100000800EF3E505E452C03CBD5296210E24C0	691	Unknown
33123	44194873-28ae-3edc-6441-1755bfe82ddb	Water quality station	huancab	Huancabamba	Station ID 33123	Point	0101000020E61000004390831266E252C001F6D1A92B2F24C0	849	Unknown
33124	4fc6bc04-9923-1d07-5df1-1fc77f4ba99b	Water quality station	chonta_oxap	Chontabamba at Oxapampa	Station ID 33124	Point	0101000020E61000005F0CE544BBDA52C019390B7BDA3125C0	3183	Unknown
1	344cf24a-d201-b623-3518-0e3f4fbbd935	Specimen	sta1036exp1300smp336_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 336	\N	\N	\N	\N
2	8b0b1c08-a9bd-a3d8-7020-717026fc0314	Specimen	sta1036exp1300smp337_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 337	\N	\N	\N	\N
3	8a71fc0a-61df-70e5-525a-35527eb5c0e0	Specimen	sta1036exp1300smp338_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 338	\N	\N	\N	\N
4	ec443902-13c3-0240-db79-d20b3a54ee11	Specimen	sta1036exp1300smp339_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 339	\N	\N	\N	\N
5	149bc60b-7a98-7a01-4509-ed825e350d8e	Specimen	sta1036exp1300smp340_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 340	\N	\N	\N	\N
6	0dc4512b-5087-f4f9-66a0-e3a10a65dedd	Specimen	sta1036exp1300smp341_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 341	\N	\N	\N	\N
7	fa6f28a8-b3ec-f04b-f8d8-68bc9621238a	Specimen	sta1036exp1300smp342_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 342	\N	\N	\N	\N
8	9849e2ce-d192-9a9b-3668-a5aa837731db	Specimen	sta1036exp1300smp343_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 343	\N	\N	\N	\N
9	9b2eac04-ef76-3e66-65a7-a3fe8b3ab496	Specimen	sta1036exp1300smp344_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 344	\N	\N	\N	\N
10	c5b8a172-62c7-e232-d368-441182e060f1	Specimen	sta1036exp1300smp345_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 345	\N	\N	\N	\N
11	e703f019-e41a-fbc8-5739-fc77946db3e2	Specimen	sta1036exp1300smp346_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 346	\N	\N	\N	\N
12	204794fe-3b9f-7810-4091-cb619d9327d6	Specimen	sta1036exp1300smp347_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 347	\N	\N	\N	\N
13	ae16388d-ea97-9b8e-4dde-1807dd55a062	Specimen	sta1036exp1300smp348_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 348	\N	\N	\N	\N
14	b5c4977d-2576-d3ea-9e01-893cf7c08bfa	Specimen	sta1036exp1300smp349_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 349	\N	\N	\N	\N
15	97cd5065-f3c5-8fcd-176f-dce080a7e40b	Specimen	sta1036exp1300smp350_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 350	\N	\N	\N	\N
16	dfbdc2fe-887e-e921-a20f-8df957c1a860	Specimen	sta1036exp1300smp351_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 351	\N	\N	\N	\N
17	81b7d978-5292-4e7e-2a45-d33f91150619	Specimen	sta1036exp1300smp352_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 352	\N	\N	\N	\N
18	0ab2437a-fdf9-e917-8869-bdec38815b7b	Specimen	sta1036exp1300smp353_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 353	\N	\N	\N	\N
19	97e6b1a2-cc52-3cfe-068c-a8f0c5d2c491	Specimen	sta1036exp1300smp354_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 354	\N	\N	\N	\N
20	11cbecc2-c71c-9c00-3cda-6daab428ef7e	Specimen	sta1036exp1300smp355_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 355	\N	\N	\N	\N
21	36ef8105-86e5-514c-cd05-028e165bd1a0	Specimen	sta1036exp1300smp356_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 356	\N	\N	\N	\N
22	176f6728-ebe7-0511-1bb2-cb04f255ea27	Specimen	sta1036exp1300smp357_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 357	\N	\N	\N	\N
23	a697b023-9462-9583-96b2-31fa7497a1ff	Specimen	sta1036exp1300smp358_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 358	\N	\N	\N	\N
24	7746d448-a2bf-bcf7-481c-8afb4754f7b8	Specimen	sta1036exp1300smp359_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 359	\N	\N	\N	\N
25	4681c7b6-1348-e7d6-5ae1-9e33e3186a5e	Specimen	sta1036exp1300smp360_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 360	\N	\N	\N	\N
26	ca5c17e9-9628-11d9-e3a5-fd08900e79dd	Specimen	sta1036exp1300smp361_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 361	\N	\N	\N	\N
27	2af7b6f0-538f-56ec-9f98-98ac4cb48cb0	Specimen	sta1036exp1300smp362_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 362	\N	\N	\N	\N
28	b189cec3-b1ab-b49d-4ef4-76cf68938a55	Specimen	sta1036exp1300smp363_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 363	\N	\N	\N	\N
29	114c9aec-2f4b-5aeb-b0c9-bdfeaef9d723	Specimen	sta1036exp1300smp364_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 364	\N	\N	\N	\N
30	caff4201-2299-f748-314a-4695de482a2c	Specimen	sta1036exp1300smp365_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 365	\N	\N	\N	\N
31	74b79bd6-8ff3-3253-70dd-f683c78b4763	Specimen	sta1036exp1300smp366_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 366	\N	\N	\N	\N
32	3ac57293-e676-def1-2b54-34e24c10d915	Specimen	sta1036exp1300smp367_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 367	\N	\N	\N	\N
33	65df8146-c522-ae47-8dae-f9f728933236	Specimen	sta1036exp1300smp368_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 368	\N	\N	\N	\N
34	bf7df29c-f725-3074-02d1-b803371ef271	Specimen	sta1036exp1300smp369_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 369	\N	\N	\N	\N
35	79b1bac6-f08e-fc44-9209-cfe803533af4	Specimen	sta1036exp1300smp370_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 370	\N	\N	\N	\N
36	459a0692-4846-28cc-f307-e472b65aacc9	Specimen	sta1036exp1300smp372_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 372	\N	\N	\N	\N
37	bf3f53bf-02fc-b697-062e-7ef4090403e1	Specimen	sta1036exp1300smp373_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 373	\N	\N	\N	\N
38	38d2d80a-3762-3419-400b-75d358334b22	Specimen	sta1036exp1300smp374_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 374	\N	\N	\N	\N
39	0cfa4519-c4e4-c515-ebc3-ae6da74410ae	Specimen	sta1036exp1300smp375_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 375	\N	\N	\N	\N
40	e155edbc-c578-5a96-0a83-32d312b044f7	Specimen	sta1036exp1300smp376_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 376	\N	\N	\N	\N
41	9bab7518-1f88-15d4-2d58-2a70a733489f	Specimen	sta1036exp1300smp377_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 377	\N	\N	\N	\N
42	e73e9fe9-a0df-0e4f-6f3b-85e48d04a621	Specimen	sta1036exp1300smp378_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 378	\N	\N	\N	\N
43	ffd8cbdf-b222-f233-e60c-9c9585ffe669	Specimen	sta1036exp1300smp379_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 379	\N	\N	\N	\N
44	34ddd4fa-709c-db65-243b-c0232a781a9c	Specimen	sta1036exp1300smp380_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 380	\N	\N	\N	\N
45	546b1f7d-81d4-7d05-fb9a-8d4584e12c60	Specimen	sta1036exp1300smp381_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 381	\N	\N	\N	\N
46	af035900-c5f2-a467-cc77-b3d30b8047b2	Specimen	sta1036exp1300smp382_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 382	\N	\N	\N	\N
47	d23ceb71-59a7-9fe5-f7fa-4f6ab41932f2	Specimen	sta1036exp1300smp383_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 383	\N	\N	\N	\N
48	a937b597-1989-2568-dbb2-8e25d3bbc7d5	Specimen	sta1036exp1300smp384_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 384	\N	\N	\N	\N
49	612eab78-381f-30e1-db3b-98e373a67a3f	Specimen	sta1036exp1300smp385_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 385	\N	\N	\N	\N
50	90961b43-910f-59f9-d643-d8606b47faa1	Specimen	sta1036exp1300smp386_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 386	\N	\N	\N	\N
51	81f8de55-2d0b-a187-d4f7-83f9878d02ee	Specimen	sta1036exp1300smp387_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 387	\N	\N	\N	\N
52	f087db2b-adeb-210f-3533-f15f1a67d515	Specimen	sta1036exp1300smp388_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 388	\N	\N	\N	\N
53	74499e12-aaf9-5389-16c2-9a7051321264	Specimen	sta1036exp1300smp389_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 389	\N	\N	\N	\N
54	f32c5271-c89d-ab3e-61f0-06557e3ca6d9	Specimen	sta1036exp1300smp390_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 390	\N	\N	\N	\N
55	2be48b38-f868-1605-3d52-2acb26b238b9	Specimen	sta1036exp1300smp391_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 391	\N	\N	\N	\N
56	1b7e994c-e077-4dbf-4486-9870b8bc091c	Specimen	sta1036exp1300smp392_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 392	\N	\N	\N	\N
57	9e30a95e-acb3-aeb7-e408-bd2f8699ccfb	Specimen	sta1036exp1300smp393_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 393	\N	\N	\N	\N
58	39c4a10f-445f-2e7b-a76e-c652b3f54693	Specimen	sta1036exp1300smp394_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 394	\N	\N	\N	\N
59	687c68de-7704-f641-ce9b-f25b96a7a585	Specimen	sta1036exp1300smp396_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 396	\N	\N	\N	\N
60	5c5fc1c8-8504-d50c-28ef-6cd60eeca32d	Specimen	sta1036exp1300smp397_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 397	\N	\N	\N	\N
61	01ae67b2-708f-0e91-73a3-e1e934500fb4	Specimen	sta1036exp1300smp398_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 398	\N	\N	\N	\N
62	07d4b852-40fb-8bde-5d7e-9761264c50f8	Specimen	sta1036exp1300smp399_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 399	\N	\N	\N	\N
63	b3abd8fc-acbb-5b7f-196c-f505d387caa0	Specimen	sta1036exp1300smp400_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 400	\N	\N	\N	\N
64	4cfc192f-322c-76f0-3f03-ef522406a547	Specimen	sta1036exp1300smp401_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 401	\N	\N	\N	\N
65	58203638-4e8a-cc04-5e19-5508496697ab	Specimen	sta1036exp1300smp402_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 402	\N	\N	\N	\N
66	1100f153-8b0c-05f6-9305-0fa116d388b4	Specimen	sta1036exp1300smp403_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 403	\N	\N	\N	\N
67	aa417f12-3651-b156-2cb1-ff08f2687fa3	Specimen	sta1036exp1300smp404_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 404	\N	\N	\N	\N
68	162051e9-b180-bd40-e175-36d943dd2857	Specimen	sta1036exp1300smp405_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 405	\N	\N	\N	\N
69	c6099fcb-f212-4b4a-c9d5-16517d983fe4	Specimen	sta1036exp1300smp406_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 406	\N	\N	\N	\N
70	7e33e133-611a-c27d-eff3-dea29fb36376	Specimen	sta1036exp1300smp407_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 407	\N	\N	\N	\N
71	417c3672-363d-b2de-cb6c-4007081991c3	Specimen	sta1036exp1300smp408_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 408	\N	\N	\N	\N
72	3d5959d9-6274-13f8-2665-efdec543f976	Specimen	sta1036exp1300smp409_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 409	\N	\N	\N	\N
73	f76d3a43-bad8-4a6a-a746-f5328f4ea3ae	Specimen	sta1036exp1300smp410_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 410	\N	\N	\N	\N
74	42bc1699-340b-7c15-e3f0-41134872f577	Specimen	sta1036exp1300smp411_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 411	\N	\N	\N	\N
75	ac3a4f06-7f4a-68f3-1d08-a174851360a8	Specimen	sta1036exp1300smp412_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 412	\N	\N	\N	\N
76	84cf7571-521f-6ba0-3204-f2120fdbd6f6	Specimen	sta1036exp1300smp413_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 413	\N	\N	\N	\N
77	4ae01fbc-4bfd-72b8-4f14-ee22a787be6b	Specimen	sta1036exp1300smp415_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 415	\N	\N	\N	\N
78	06977f27-222c-c582-55af-94197846ef46	Specimen	sta1036exp1300smp416_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 416	\N	\N	\N	\N
79	de86eb42-a34e-9e01-e566-0c35cc54a5a4	Specimen	sta1036exp1300smp417_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 417	\N	\N	\N	\N
80	d5bb8aa1-92fc-7f35-4941-8a8decf30e99	Specimen	sta1036exp1300smp418_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 418	\N	\N	\N	\N
81	363ce9c9-8a1a-0858-99e0-c3927183ad58	Specimen	sta1036exp1300smp419_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 419	\N	\N	\N	\N
82	455a85e1-76e5-6d1a-b8c2-65c3cd2ed811	Specimen	sta1036exp1300smp420_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 420	\N	\N	\N	\N
83	d4f2ff13-89ca-8709-231e-d651ffbbb000	Specimen	sta1036exp1300smp421_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 421	\N	\N	\N	\N
84	ac6d3296-898d-2e84-69a4-c61c81e97b80	Specimen	sta1036exp1300smp422_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 422	\N	\N	\N	\N
85	d273ffb7-3166-aa83-2e57-b156debbe375	Specimen	sta1036exp1300smp423_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 423	\N	\N	\N	\N
86	c0fb6015-eae1-9642-c243-4008fd33d1b9	Specimen	sta1036exp1300smp424_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 424	\N	\N	\N	\N
87	348dae49-1407-e8f2-e19d-8c320f183f25	Specimen	sta1036exp1300smp425_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 425	\N	\N	\N	\N
88	beadf5d3-13c8-43ac-0e46-6727820096a7	Specimen	sta1036exp1300smp426_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 426	\N	\N	\N	\N
89	fa1f9e4e-a78d-f9db-515d-1fadfff46373	Specimen	sta1036exp1300smp427_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 427	\N	\N	\N	\N
90	f88a7d5e-0a51-224d-90d1-29394d087623	Specimen	sta1036exp1300smp428_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 428	\N	\N	\N	\N
91	aa168ad1-e37c-0eed-ac43-fb0169cf01a3	Specimen	sta1036exp1300smp429_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 429	\N	\N	\N	\N
92	057f109d-accd-ace3-ca06-ae30fc92be51	Specimen	sta1036exp1300smp430_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 430	\N	\N	\N	\N
93	9fc83147-05b9-fcf3-e283-42f26d93926d	Specimen	sta1036exp1300smp431_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 431	\N	\N	\N	\N
94	4b316534-774d-0b63-54c7-0166d056bba1	Specimen	sta1036exp1300smp432_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 432	\N	\N	\N	\N
95	0eafad85-ae38-18ca-88bb-7cd4b5738ca4	Specimen	sta1036exp1300smp433_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 433	\N	\N	\N	\N
96	5d6823a4-e16b-6cdb-ea82-63ab6edf0dc8	Specimen	sta1036exp1300smp434_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 434	\N	\N	\N	\N
97	493685f9-fd99-4703-d5f4-857da360a7a7	Specimen	sta1036exp1300smp435_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 435	\N	\N	\N	\N
98	3719486f-0271-3a46-40d4-48061f87668c	Specimen	sta1036exp1300smp436_fp	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Fine Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 436	\N	\N	\N	\N
33125	b0700a25-f049-4ca3-61d1-8ec8bc8a2100	Specimen	sta1036exp1300smp336_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 336	\N	\N	\N	\N
33126	eb72e0f2-8de5-6e5b-e627-4010202c9dac	Specimen	sta1036exp1300smp337_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 337	\N	\N	\N	\N
33127	6c888bd6-6d74-1e53-f834-f9c5a5cb7caf	Specimen	sta1036exp1300smp338_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 338	\N	\N	\N	\N
33128	8146ce8d-fc8c-b269-9016-393f07b15b42	Specimen	sta1036exp1300smp339_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 339	\N	\N	\N	\N
33129	0ec14980-99e3-d8c4-742d-caae67b4d642	Specimen	sta1036exp1300smp340_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 340	\N	\N	\N	\N
33130	2b65fbf7-73c3-9afd-0022-40e84058ab18	Specimen	sta1036exp1300smp341_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 341	\N	\N	\N	\N
33131	42351772-4eb8-ec9a-1ddf-c6dd23d20bc1	Specimen	sta1036exp1300smp342_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 342	\N	\N	\N	\N
33132	73db2824-e0b1-e0cf-d970-03850e32ac1d	Specimen	sta1036exp1300smp343_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 343	\N	\N	\N	\N
33133	265488a9-83f5-2a55-d26e-faa86a356522	Specimen	sta1036exp1300smp344_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 344	\N	\N	\N	\N
33134	a1ea7f73-719f-c15b-144f-6a70c56ee213	Specimen	sta1036exp1300smp345_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 345	\N	\N	\N	\N
33135	525de0f0-b3a2-3e21-2b64-eda6c9188c10	Specimen	sta1036exp1300smp346_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 346	\N	\N	\N	\N
33136	055a1389-0e68-3f2a-6c82-acd5bbf828c9	Specimen	sta1036exp1300smp347_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 347	\N	\N	\N	\N
33137	d327b7be-a581-b26a-fa0d-e22a511b8ada	Specimen	sta1036exp1300smp348_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 348	\N	\N	\N	\N
33138	1de8df23-30d4-fdbb-854a-87f058f9fb4e	Specimen	sta1036exp1300smp349_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 349	\N	\N	\N	\N
33139	793cb908-20c7-75a7-742f-035a451d9ca4	Specimen	sta1036exp1300smp350_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 350	\N	\N	\N	\N
33140	5ff8a88b-af48-5673-c892-fc2ea21bc507	Specimen	sta1036exp1300smp351_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 351	\N	\N	\N	\N
33141	2ddf5ca1-ceb6-1992-bbc7-b1c08bf84f05	Specimen	sta1036exp1300smp352_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 352	\N	\N	\N	\N
33142	72e2401c-7086-c758-15b3-28bd0c5e46da	Specimen	sta1036exp1300smp353_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 353	\N	\N	\N	\N
33143	176dceb0-56e6-433e-b75c-5df403af8710	Specimen	sta1036exp1300smp354_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 354	\N	\N	\N	\N
33144	8c18180d-f859-fc23-d9ff-d0f12dcffed2	Specimen	sta1036exp1300smp355_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 355	\N	\N	\N	\N
33145	1c5eba11-797a-75de-4388-29ec9cad70a9	Specimen	sta1036exp1300smp356_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 356	\N	\N	\N	\N
33146	05ef58f4-c3be-db6b-971c-f4f1c40eccad	Specimen	sta1036exp1300smp357_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 357	\N	\N	\N	\N
33147	80f968b9-5336-fb91-0ec9-3612bd1b4e61	Specimen	sta1036exp1300smp358_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 358	\N	\N	\N	\N
33148	ba609343-dcfa-e0d3-675f-f9776b6963bd	Specimen	sta1036exp1300smp359_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 359	\N	\N	\N	\N
33149	e8722b97-f66a-5eb1-de83-1c64b9372b8c	Specimen	sta1036exp1300smp360_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 360	\N	\N	\N	\N
33150	5734a4de-15fc-b69f-2218-8e20c9c70986	Specimen	sta1036exp1300smp361_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 361	\N	\N	\N	\N
33151	845ea8ef-4140-83c1-bea9-1bf55a4f3221	Specimen	sta1036exp1300smp362_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 362	\N	\N	\N	\N
33152	692c3de3-9915-9787-2222-2f5a1212efb1	Specimen	sta1036exp1300smp363_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 363	\N	\N	\N	\N
33153	28f4afda-36a0-16ef-3eda-1fb6b7c2e5cb	Specimen	sta1036exp1300smp364_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 364	\N	\N	\N	\N
33154	3baee79f-5183-143d-f70d-0a698ea028d6	Specimen	sta1036exp1300smp365_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 365	\N	\N	\N	\N
33155	4002cbb6-b7bb-ec62-802e-ce66373a40cb	Specimen	sta1036exp1300smp366_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 366	\N	\N	\N	\N
33156	f0300212-06a7-e886-7d86-afc6803cf8b2	Specimen	sta1036exp1300smp367_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 367	\N	\N	\N	\N
33157	c8d41ab5-b86f-2a0d-1617-1ef5456a9b28	Specimen	sta1036exp1300smp368_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 368	\N	\N	\N	\N
33158	9727fd84-eb45-2512-530e-673e5678008f	Specimen	sta1036exp1300smp369_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 369	\N	\N	\N	\N
33159	e86a2d99-9f93-c9d4-3fc8-46c46b16b487	Specimen	sta1036exp1300smp370_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 370	\N	\N	\N	\N
33160	2b5639b9-585d-af01-28b8-bbcb718184c6	Specimen	sta1036exp1300smp372_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 372	\N	\N	\N	\N
33161	d18b6f8f-6020-8c2a-6e1f-b99a3754cd30	Specimen	sta1036exp1300smp373_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 373	\N	\N	\N	\N
33162	50c66852-092b-5870-ddc0-1d48e9778de9	Specimen	sta1036exp1300smp374_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 374	\N	\N	\N	\N
33163	0ee5730a-998d-9f7a-7dc1-0e360bb44668	Specimen	sta1036exp1300smp375_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 375	\N	\N	\N	\N
33164	f0af55b6-d282-41ac-b133-34d763f832c0	Specimen	sta1036exp1300smp376_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 376	\N	\N	\N	\N
33165	72da0983-dc07-25f3-4c6c-e002c3580c81	Specimen	sta1036exp1300smp377_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 377	\N	\N	\N	\N
33166	82f08692-e706-3f28-3d90-8426f915a5f2	Specimen	sta1036exp1300smp378_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 378	\N	\N	\N	\N
33167	a0c24230-759d-8b32-6590-7f87aa28e082	Specimen	sta1036exp1300smp379_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 379	\N	\N	\N	\N
33168	c0e0f973-a428-1b10-23ed-d94bb023e535	Specimen	sta1036exp1300smp380_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 380	\N	\N	\N	\N
33169	ac3a3add-52c8-c0c2-e6e0-fbd9ae75481a	Specimen	sta1036exp1300smp381_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 381	\N	\N	\N	\N
33170	4645624a-31f5-4ccc-c390-e589132bb114	Specimen	sta1036exp1300smp382_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 382	\N	\N	\N	\N
33171	23736c3c-c9b9-1484-a014-dd4c5c34e2f9	Specimen	sta1036exp1300smp383_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 383	\N	\N	\N	\N
33172	ae3162c7-f4d8-29ef-d6c8-927909d320d9	Specimen	sta1036exp1300smp384_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 384	\N	\N	\N	\N
33173	7a6c7e64-322a-ed0e-e75f-bce331d317a0	Specimen	sta1036exp1300smp385_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 385	\N	\N	\N	\N
33174	ee1f4aac-4831-3bce-bcff-b7772fc5dbc3	Specimen	sta1036exp1300smp387_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 387	\N	\N	\N	\N
33175	ed4f9efe-bc76-a999-998c-cbf94ce8fd09	Specimen	sta1036exp1300smp388_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 388	\N	\N	\N	\N
33176	3a583c64-2e52-0d55-3c30-de76b12063d2	Specimen	sta1036exp1300smp389_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 389	\N	\N	\N	\N
33177	79ff59be-af61-1eef-4630-f695d1fcc0a6	Specimen	sta1036exp1300smp390_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 390	\N	\N	\N	\N
33178	2e0d5120-ff1d-72a3-ec84-12a7166e6012	Specimen	sta1036exp1300smp391_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 391	\N	\N	\N	\N
33179	ee011a79-cc76-a9a2-ddab-1fd0e851955d	Specimen	sta1036exp1300smp392_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 392	\N	\N	\N	\N
33180	69e29edf-c827-1f69-65cb-96078328eff3	Specimen	sta1036exp1300smp393_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 393	\N	\N	\N	\N
33181	a788b88c-646d-6a1d-90d9-7c5a7e388e7d	Specimen	sta1036exp1300smp394_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 394	\N	\N	\N	\N
33182	dce79ee8-7a64-1c75-390b-17538ce2f725	Specimen	sta1036exp1300smp396_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 396	\N	\N	\N	\N
33183	b4e30d9d-eae8-88f7-f658-2de9b62df19f	Specimen	sta1036exp1300smp397_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 397	\N	\N	\N	\N
33184	3938b08e-a561-c99a-30bb-40915029534f	Specimen	sta1036exp1300smp398_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 398	\N	\N	\N	\N
33185	4e8a3f78-e1d8-8a1d-ebfe-02f62e76da50	Specimen	sta1036exp1300smp399_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 399	\N	\N	\N	\N
33186	62c01f71-537a-a9dd-b2bc-f7e024ac1304	Specimen	sta1036exp1300smp400_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 400	\N	\N	\N	\N
33187	086721b8-f9e9-eb87-fd04-02b50ea89f4d	Specimen	sta1036exp1300smp401_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 401	\N	\N	\N	\N
33188	944ace2e-25ce-affe-d6f4-ed85a095ffa4	Specimen	sta1036exp1300smp402_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 402	\N	\N	\N	\N
33189	0bb0d40e-b9ba-02de-a733-d517f26d6b7c	Specimen	sta1036exp1300smp403_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 403	\N	\N	\N	\N
33190	d87db5c3-a050-f91e-ea5f-eeaab1dd61d7	Specimen	sta1036exp1300smp404_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 404	\N	\N	\N	\N
33191	b74f2719-ef6c-6ab8-64c1-3355a1b6196c	Specimen	sta1036exp1300smp405_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 405	\N	\N	\N	\N
33192	dfbf1966-c339-1285-a077-00dd8b732526	Specimen	sta1036exp1300smp406_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 406	\N	\N	\N	\N
33193	d96eeee7-46f5-3f44-6889-a7d88d6750aa	Specimen	sta1036exp1300smp407_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 407	\N	\N	\N	\N
33194	7d4e8e70-3d63-ce4e-98a3-212b920bf9e0	Specimen	sta1036exp1300smp408_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 408	\N	\N	\N	\N
33195	78b78683-f510-77d7-f549-7fd1862bdea9	Specimen	sta1036exp1300smp409_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 409	\N	\N	\N	\N
33196	2ca44fd8-1996-a430-bfc8-0689fe7f3c63	Specimen	sta1036exp1300smp410_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 410	\N	\N	\N	\N
33197	6b6af98f-0712-d83c-a63f-7c82b80917a2	Specimen	sta1036exp1300smp411_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 411	\N	\N	\N	\N
33198	46959930-2967-690d-3b4b-6ab3644f19d4	Specimen	sta1036exp1300smp412_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 412	\N	\N	\N	\N
33199	d53dbbd2-c83e-0843-73f2-7d4cabdafcb2	Specimen	sta1036exp1300smp413_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 413	\N	\N	\N	\N
33200	f1405ca0-aad2-d659-7b5b-0b835bee749f	Specimen	sta1036exp1300smp415_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 415	\N	\N	\N	\N
33201	b1ac6c3f-e3d2-789d-7c44-f87e70102a52	Specimen	sta1036exp1300smp416_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 416	\N	\N	\N	\N
33202	8ba83bf5-da2c-85d9-a6d6-a276e698d67f	Specimen	sta1036exp1300smp417_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 417	\N	\N	\N	\N
33203	e66e66eb-f85f-2f2d-d1c3-313f8d147e40	Specimen	sta1036exp1300smp418_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 418	\N	\N	\N	\N
33204	e32ff1cc-99c9-4d59-1078-069f6a8ab49f	Specimen	sta1036exp1300smp419_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 419	\N	\N	\N	\N
33205	9c4fd093-5a2b-089d-1022-e118f6053543	Specimen	sta1036exp1300smp420_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 420	\N	\N	\N	\N
33206	36f606d4-bdb4-79fa-c64e-33451a5d5f90	Specimen	sta1036exp1300smp421_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 421	\N	\N	\N	\N
33207	0f58b702-153c-1da3-0b8e-84613b0e836d	Specimen	sta1036exp1300smp422_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 422	\N	\N	\N	\N
33208	24722e06-c063-918d-748b-1772b5ed5745	Specimen	sta1036exp1300smp423_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 423	\N	\N	\N	\N
33209	b5dea555-7d6f-765c-9a2e-463d8aa89161	Specimen	sta1036exp1300smp424_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 424	\N	\N	\N	\N
33210	3de2c6db-955e-83f6-a8f8-dd17fbd3b799	Specimen	sta1036exp1300smp425_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 425	\N	\N	\N	\N
33211	1c80ce1a-3735-1006-d06f-80ba2c84770d	Specimen	sta1036exp1300smp426_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 426	\N	\N	\N	\N
33212	d939ab8d-0aac-da04-4bb8-03592bad99bf	Specimen	sta1036exp1300smp427_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 427	\N	\N	\N	\N
33213	89ec5083-da40-a233-3729-67a0566fce34	Specimen	sta1036exp1300smp428_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 428	\N	\N	\N	\N
33214	b0428c46-0a60-0734-b0d9-65fbe66bc3fb	Specimen	sta1036exp1300smp429_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 429	\N	\N	\N	\N
33215	14650ebe-0904-ee91-ac97-25bc00663440	Specimen	sta1036exp1300smp430_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 430	\N	\N	\N	\N
33216	432f6099-60dd-c4d7-9ccb-4cd96a53c73b	Specimen	sta1036exp1300smp431_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 431	\N	\N	\N	\N
33217	64ffc97f-bc21-4483-2cda-66315ac56b22	Specimen	sta1036exp1300smp432_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 432	\N	\N	\N	\N
33218	4a99740d-42c2-3af2-840c-364418deab6e	Specimen	sta1036exp1300smp433_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 433	\N	\N	\N	\N
33219	4f9071a9-f151-6328-f28b-ce95b02def26	Specimen	sta1036exp1300smp434_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 434	\N	\N	\N	\N
33220	22ab0d3c-2262-6c97-88f7-885a16c117b6	Specimen	sta1036exp1300smp435_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 435	\N	\N	\N	\N
33221	ceeb79b8-2c1e-e934-a448-e723d48755a6	Specimen	sta1036exp1300smp436_cp	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria), from Marchantaria time series	Coarse Particulates specimen at station 1036 (Solimoes - Marchantaria, river Solimoes), from Marchantaria time series. From Sample ID 436	\N	\N	\N	\N
\.


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 264
-- Name: samplingfeatures_samplingfeatureid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('samplingfeatures_samplingfeatureid_seq', 33221, true);


--
-- TOC entry 4918 (class 0 OID 70971)
-- Dependencies: 395
-- Data for Name: sectionresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY sectionresults (resultid, ylocation, ylocationunitsid, spatialreferenceid, intendedxspacing, intendedxspacingunitsid, intendedzspacing, intendedzspacingunitsid, intendedtimespacing, intendedtimespacingunitsid, aggregationstatisticcv) FROM stdin;
\.


--
-- TOC entry 4754 (class 0 OID 70072)
-- Dependencies: 231
-- Data for Name: sectionresultvalueannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY sectionresultvalueannotations (bridgeid, valueid, annotationid) FROM stdin;
\.


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 230
-- Name: sectionresultvalueannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('sectionresultvalueannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4920 (class 0 OID 70978)
-- Dependencies: 397
-- Data for Name: sectionresultvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY sectionresultvalues (valueid, resultid, datavalue, valuedatetime, valuedatetimeutcoffset, xlocation, xaggregationinterval, xlocationunitsid, zlocation, zaggregationinterval, zlocationunitsid, censorcodecv, qualitycodecv, aggregationstatisticcv, timeaggregationinterval, timeaggregationintervalunitsid) FROM stdin;
\.


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 396
-- Name: sectionresultvalues_valueid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('sectionresultvalues_valueid_seq', 1, false);


--
-- TOC entry 4949 (class 0 OID 71128)
-- Dependencies: 426
-- Data for Name: simulations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY simulations (simulationid, actionid, simulationname, simulationdescription, simulationstartdatetime, simulationstartdatetimeutcoffset, simulationenddatetime, simulationenddatetimeutcoffset, timestepvalue, timestepunitsid, inputdatasetid, modelid) FROM stdin;
\.


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 425
-- Name: simulations_simulationid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('simulations_simulationid_seq', 1, false);


--
-- TOC entry 4935 (class 0 OID 71059)
-- Dependencies: 412
-- Data for Name: sites; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY sites (samplingfeatureid, sitetypecv, latitude, longitude, spatialreferenceid) FROM stdin;
1000	Stream	-1.94778000000000007	-55.512120000000003	1
1001	Stream	-2.39721999999999991	-57.4372499999999988	1
1002	Stream	-3.24257000000000017	-58.9827700000000021	1
1003	Stream	-3.32243999999999984	-60.6119500000000002	1
1004	Stream	-3.81756999999999991	-61.6176600000000008	1
1005	Stream	-4.05290999999999979	-63.0172099999999986	1
1006	Stream	-3.64244000000000012	-64.2366399999999942	1
1007	Stream	-2.50685000000000002	-65.8617899999999992	1
1008	Stream	-2.58695999999999993	-67.1925899999999956	1
1009	Stream	-3.08026	-67.892240000000001	1
1010	Stream	-3.27891000000000021	-67.8528600000000068	1
1020	Stream	-3.8024	-73.1122799999999984	1
1021	Stream	-3.43250000000000011	-72.9058399999999978	1
1022	Stream	-3.36791000000000018	-72.532660000000007	1
1023	Stream	-3.19255999999999984	-71.782669999999996	1
1024	Stream	-4.09210000000000029	-70.05274	1
1025	Stream	-3.80349000000000004	-69.4618499999999983	1
1026	Stream	-3.44195999999999991	-68.7514299999999992	1
1027	Stream	-2.68744000000000005	-66.8005899999999997	1
1028	Stream	-2.5023200000000001	-66.0772000000000048	1
1029	Stream	-3.15246000000000004	-64.8623900000000049	1
1031	Stream	-3.81300000000000017	-63.4407700000000006	1
1032	Stream	-3.90791000000000022	-63.3137299999999996	1
1033	Stream	-3.98408000000000007	-63.1423100000000019	1
1034	Stream	-3.88263999999999987	-62.7263000000000019	1
1035	Stream	-3.60779000000000005	-61.3036299999999983	1
1036	Stream	-3.29313000000000011	-60.0118700000000018	1
1037	Stream	-3.13239000000000001	-59.7858700000000027	1
1038	Stream	-3.14734999999999987	-58.4723400000000026	1
1039	Stream	-2.57289000000000012	-56.6212400000000002	1
1040	Stream	-2.10822999999999983	-55.0580799999999968	1
1041	Stream	-2.39710000000000001	-54.2111400000000003	1
1042	Stream	-1.54217000000000004	-52.4537800000000018	1
1043	Stream	-1.36084000000000005	-51.9271299999999982	1
1050	Stream	-3.16574	-59.8824899999999971	1
1101	Stream	-3.01231999999999989	-59.4566900000000018	1
1102	Stream	-2.5920700000000001	-66.0828199999999981	1
1103	Stream	-2.77802000000000016	-67.7863700000000051	1
1104	Stream	-3.25755999999999979	-59.9624799999999993	1
1105	Stream	-3.31687999999999983	-60.047620000000002	1
1106	Stream	-3.3277000000000001	-60.0779799999999966	1
1110	Stream	-3.88264999999999993	-70.2428199999999947	1
1111	Stream	-1.90700000000000003	-55.5326400000000007	1
5001	Stream	-1.68727999999999989	-52.2532300000000021	1
9001	Stream	-2.39731000000000005	-54.7775200000000027	1
9002	Stream	-2.71627000000000018	-55.0928200000000032	1
11101	Stream	-1.7317800000000001	-55.9066199999999967	1
11102	Stream	-1.69296000000000002	-55.9426500000000004	1
11201	Stream	-2.20285999999999982	-56.7230500000000006	1
14001	Stream	-2.5870700000000002	-58.1344199999999987	1
15001	Stream	-3.08302999999999994	-58.9074400000000011	1
16000	Stream	-3.45020000000000016	-58.7978700000000032	1
16001	Stream	-10.8476199999999992	-65.347290000000001	1
16002	Stream	-10.9815199999999997	-65.631219999999999	1
16003	Stream	-9.89663999999999966	-63.0525499999999965	1
16004	Stream	-8.76559999999999917	-63.7078399999999974	1
16005	Stream	-9.24921999999999933	-64.2973899999999929	1
16006	Stream	-9.2880199999999995	-64.3773999999999944	1
16007	Stream	-9.62674999999999947	-64.9419800000000009	1
16008	Stream	-9.69139999999999979	-65.4514700000000005	1
16009	Stream	-9.67746999999999957	-65.4171599999999955	1
16010	Stream	-14.1718200000000003	-59.742440000000002	1
16011	Stream	-14.7263000000000002	-59.3771800000000027	1
16012	Stream	-14.99315	-59.9576300000000018	1
16013	Stream	-15.2174600000000009	-59.3267200000000017	1
16014	Stream	-4.89254999999999995	-60.0172799999999995	1
16015	Stream	-5.14224999999999977	-60.4120899999999992	1
16016	Stream	-5.8166500000000001	-61.3020700000000005	1
16017	Stream	-6.19169999999999998	-62.1065899999999971	1
16018	Stream	-7.47745999999999977	-63.0123499999999979	1
16019	Stream	-8.73825000000000074	-63.89255	1
16020	Stream	-5.15770000000000017	-60.3767199999999988	1
16021	Stream	-8.47400999999999982	-63.4376000000000033	1
16100	Stream	-10.7924500000000005	-65.9876799999999974	1
16101	Stream	-10.81738	-66.081869999999995	1
16102	Stream	-10.9492899999999995	-66.1228100000000012	1
16103	Stream	-11.0216700000000003	-66.1277400000000029	1
16104	Stream	-14.5422799999999999	-67.5476799999999997	1
16105	Stream	-15.6171399999999991	-67.3303099999999972	1
16106	Stream	-16.5620399999999997	-68.0827500000000043	1
16107	Stream	-16.4716200000000015	-68.0627999999999957	1
16108	Stream	-15.4518400000000007	-67.8115200000000016	1
16109	Stream	-15.7773900000000005	-67.5881200000000035	1
16110	Stream	-15.8172499999999996	-67.6024799999999999	1
16111	Stream	-16.2526200000000003	-68.1179599999999965	1
16120	Stream	-12.0222300000000004	-64.824860000000001	1
16121	Stream	-12.7733399999999993	-65.1124999999999972	1
16122	Stream	-15.0317900000000009	-65.0017399999999981	1
16123	Stream	-14.9770699999999994	-64.9321900000000056	1
16124	Stream	-16.8175699999999999	-64.7866599999999977	1
16125	Stream	-18.9280000000000008	-63.4406000000000034	1
16140	Stream	-17.0173300000000012	-65.520780000000002	1
16141	Stream	-17.0527200000000008	-65.4526599999999945	1
16142	Stream	-17.1071500000000007	-65.182069999999996	1
16143	Stream	-17.1673699999999982	-64.3926500000000033	1
16144	Stream	-17.4225999999999992	-63.2799400000000034	1
16145	Stream	-18.6423500000000004	-65.1029099999999943	1
16146	Stream	-17.2876800000000017	-63.8975099999999969	1
16147	Stream	-17.3152200000000001	-62.7419399999999996	1
16148	Stream	-17.5524099999999983	-66.4309300000000036	1
16160	Stream	-16.3123600000000017	-67.4780099999999976	1
16161	Stream	-16.3848400000000005	-67.4617700000000013	1
16162	Stream	-15.4273699999999998	-67.8773099999999943	1
16163	Stream	-15.4974900000000009	-67.8628099999999961	1
16164	Stream	-15.4876799999999992	-67.8873200000000026	1
16165	Stream	-15.5158100000000001	-67.7929100000000062	1
16166	Stream	-15.2235999999999994	-67.7330699999999979	1
16200	Stream	-8.14714000000000027	-62.7868199999999987	1
16201	Stream	-10.4567800000000002	-62.4575499999999977	1
16202	Stream	-10.9366199999999996	-61.9573400000000021	1
16203	Stream	-11.6668800000000008	-61.1878999999999991	1
16204	Stream	-12.7175100000000008	-60.172620000000002	1
16205	Stream	-8.06288999999999945	-62.8616799999999998	1
16206	Stream	-8.05776000000000003	-62.8829199999999986	1
16207	Stream	-8.94722999999999935	-62.0574799999999982	1
16208	Stream	-9.50730000000000075	-62.0471700000000013	1
16209	Stream	-9.72630999999999979	-61.9125799999999984	1
16210	Stream	-10.0921900000000004	-61.977330000000002	1
16211	Stream	-10.1020099999999999	-61.9961899999999986	1
16212	Stream	-10.8769399999999994	-61.9420799999999971	1
16213	Stream	-10.90151	-61.9619700000000009	1
16214	Stream	-11.4451099999999997	-61.7312700000000021	1
16215	Stream	-11.4519099999999998	-61.4634199999999993	1
16216	Stream	-11.7027999999999999	-61.1923299999999983	1
16217	Stream	-12.8473000000000006	-60.3426800000000014	1
16218	Stream	-10.7525099999999991	-62.3723699999999965	1
16219	Stream	-10.7572200000000002	-62.3676600000000008	1
16300	Stream	-12.5975000000000001	-69.1825000000000045	1
16301	Stream	-12.6125000000000007	-69.1825000000000045	1
16302	Stream	-12.7225000000000001	-69.7425000000000068	1
16303	Stream	-12.5474999999999994	-70.042500000000004	1
16304	Stream	-12.5724999999999998	-70.1075000000000017	1
16305	Stream	-12.8324999999999996	-69.2974999999999994	1
16306	Stream	-12.9275000000000002	-69.5275000000000034	1
16307	Stream	-13.1374999999999993	-69.582499999999996	1
16320	Stream	-12.5472839999999994	-70.0983710000000002	1
16321	Stream	-12.8840500000000002	-69.3951799999999963	1
16322	Stream	-12.8793399999999991	-69.4131200000000064	1
16323	Stream	-12.6042199999999998	-69.072819999999993	1
16324	Stream	-12.6216500000000007	-69.0723799999999954	1
16325	Stream	-12.84938	-69.4578699999999998	1
16326	Stream	-12.6765000000000008	-69.2391999999999967	1
16327	Stream	-12.5357780000000005	-70.1059400000000039	1
16328	Stream	-12.5348100000000002	-70.1188899999999933	1
16329	Stream	-12.5376100000000008	-70.1164409999999947	1
16330	Stream	-12.9118499999999994	-69.5212700000000012	1
16331	Stream	-12.5675666699999997	-70.0982999999999947	1
16332	Stream	-13.1401599999999998	-69.6203200000000066	1
16333	Stream	-13.1401000000000003	-69.6274999999999977	1
16334	Stream	-12.7043099999999995	-69.3261899999999969	1
16335	Stream	-12.3756299999999992	-69.1234599999999944	1
16336	Stream	-12.6695899999999995	-69.2339800000000025	1
16337	Stream	-12.6660000000000004	-69.2227800000000002	1
16338	Stream	-12.6893499999999992	-69.2408833300000026	1
16339	Stream	-12.7109900000000007	-69.2281700000000058	1
16340	Stream	-12.64025	-69.2667399999999986	1
16341	Stream	-12.4524299999999997	-69.1281299999999987	1
16342	Stream	-12.6003799999999995	-69.202770000000001	1
18000	Stream	-3.0625	-60.3023700000000034	1
18001	Stream	-3.14265999999999979	-60.0298700000000025	1
18002	Stream	-3.08761000000000019	-60.1320300000000003	1
18003	Stream	-2.86262999999999979	-60.5970700000000022	1
18004	Stream	-1.96757000000000004	-61.2576400000000021	1
18005	Stream	-1.63651999999999997	-61.4923300000000026	1
18006	Stream	-0.447969999999999979	-64.9926399999999944	1
18007	Stream	-0.372350000000000014	-66.5126999999999953	1
18022	Stream	-2.93225999999999987	-59.9780700000000024	1
18025	Stream	-2.58714000000000022	-60.0268700000000024	1
18026	Stream	-2.58217000000000008	-60.022199999999998	1
18040	Stream	-2.83232999999999979	-60.4929399999999973	1
18041	Stream	-2.81300999999999979	-60.4573600000000013	1
18043	Stream	-2.78087000000000018	-60.4424899999999994	1
18044	Stream	-2.72236000000000011	-60.4074799999999996	1
18045	Stream	-2.66456999999999988	-60.3175499999999971	1
18046	Stream	-2.70725000000000016	-60.3019699999999972	1
18047	Stream	-2.74807999999999986	-60.4273200000000017	1
18050	Stream	-2.60793000000000008	-60.2160000000000011	1
18051	Stream	-2.61231999999999998	-60.2158299999999969	1
18060	Stream	-2.09780999999999995	-61.2274299999999982	1
18061	Stream	-2.12720999999999982	-61.282429999999998	1
18062	Stream	-2.15768000000000004	-61.2972099999999998	1
18063	Stream	-2.16200999999999999	-61.2972099999999998	1
18065	Stream	-2.12687999999999988	-60.9973699999999965	1
18070	Stream	-1.96248	-61.2326100000000011	1
18080	Stream	-1.67253999999999992	-61.5276100000000028	1
18081	Stream	-1.67213999999999996	-61.5769299999999973	1
18082	Stream	-1.66677000000000008	-61.7824400000000011	1
18083	Stream	-1.67731999999999992	-61.7878499999999988	1
18084	Stream	-1.70765999999999996	-61.8325299999999984	1
18085	Stream	-1.72253999999999996	-61.8973299999999966	1
18086	Stream	-1.7278	-61.9525099999999966	1
18087	Stream	-1.73743000000000003	-61.9575900000000033	1
18100	Stream	-1.90242	-61.4322700000000026	1
18101	Stream	-1.93721999999999994	-61.5126500000000007	1
18102	Stream	-1.95233999999999996	-61.8565499999999986	1
18103	Stream	-1.99251	-62.0326599999999999	1
18104	Stream	-2.21711999999999998	-62.3971400000000003	1
18105	Stream	-2.2471000000000001	-62.4825099999999978	1
18120	Stream	-1.96265000000000001	-61.4423900000000032	1
18121	Stream	-1.81211999999999995	-61.6178600000000003	1
18122	Stream	-1.83261000000000007	-61.6475500000000025	1
18123	Stream	-1.93237999999999999	-61.8425000000000011	1
18124	Stream	-1.91738999999999993	-61.897359999999999	1
18125	Stream	-2.04768999999999979	-62.1025599999999969	1
18126	Stream	-2.14230000000000009	-62.1323399999999992	1
18127	Stream	-2.15175999999999989	-62.1277899999999974	1
18128	Stream	-2.16226999999999991	-62.1277899999999974	1
18129	Stream	-2.17279	-62.1221800000000002	1
18130	Stream	-2.18259999999999987	-62.1172800000000009	1
18131	Stream	-2.25087999999999999	-62.4079899999999981	1
18132	Stream	-2.35785	-62.496690000000001	1
18133	Stream	-2.46785999999999994	-62.4673700000000025	1
18134	Stream	-2.24287999999999998	-62.4932599999999994	1
18135	Stream	-2.27295999999999987	-62.5324700000000036	1
18140	Stream	-1.96320000000000006	-61.8475899999999967	1
18141	Stream	-1.98327999999999993	-61.8427799999999976	1
18142	Stream	-1.9830000000000001	-61.8323099999999997	1
18143	Stream	-1.98272000000000004	-61.8221300000000014	1
18144	Stream	-2.03123999999999993	-61.8526099999999985	1
18145	Stream	-2.02629999999999999	-61.8479299999999981	1
18146	Stream	-2.02604000000000006	-61.8421999999999983	1
18147	Stream	-2.02681999999999984	-61.8128000000000029	1
18148	Stream	-2.02708000000000022	-61.8169600000000017	1
18149	Stream	-2.02213999999999983	-61.8479299999999981	1
18150	Stream	-2.01797000000000004	-61.8479299999999981	1
18170	Stream	-1.96250999999999998	-61.5123999999999995	1
18200	Stream	-1.35285999999999995	-61.8875499999999974	1
18400	Stream	-1.34274000000000004	-61.9575299999999984	1
18401	Stream	-1.3325499999999999	-62.2470399999999984	1
18402	Stream	-0.742680000000000007	-63.0865000000000009	1
18403	Stream	-0.0826899999999999996	-64.0125500000000045	1
18404	Stream	-0.0823699999999999988	-64.0273200000000031	1
18405	Stream	-0.608430000000000026	-64.8270899999999983	1
18406	Stream	-0.577450000000000019	-64.9773799999999966	1
18407	Stream	-0.577450000000000019	-65.1221199999999953	1
18408	Stream	-0.497910000000000019	-65.1179499999999933	1
18409	Stream	-0.357800000000000007	-65.2224599999999981	1
18410	Stream	-0.252060000000000006	-65.9525299999999959	1
18411	Stream	-0.447709999999999997	-66.4325999999999937	1
20000	Stream	-3.74685999999999986	-61.4326900000000009	1
20001	Stream	-8.73240000000000016	-67.377759999999995	1
20002	Stream	-11.0021199999999997	-68.7635400000000061	1
22001	Stream	-4.04276000000000035	-63.1635899999999992	1
22002	Stream	-4.05302999999999969	-63.2770099999999971	1
23001	Stream	-3.35711000000000004	-64.7124299999999977	1
23002	Stream	-3.43999999999999995	-64.7727200000000067	1
24000	Stream	-1.81730999999999998	-65.68262	1
25000	Stream	-2.72246999999999995	-65.8031399999999991	1
25001	Stream	-7.62185999999999986	-72.6372400000000056	1
26000	Stream	-2.79998000000000014	-67.0228500000000054	1
27000	Stream	-3.03230000000000022	-68.2076100000000025	1
28000	Stream	-3.4971000000000001	-68.7126300000000043	1
29001	Stream	-4.33772000000000002	-70.0370999999999952	1
30000	Stream	-3.29527999999999999	-72.6320400000000035	1
31001	Stream	-3.69765999999999995	-73.1925200000000018	1
32000	Stream	-4.52780999999999967	-73.5680799999999948	1
32100	Stream	-5.91291999999999973	-76.0374000000000052	1
32101	Stream	-5.88750000000000018	-76.1296799999999934	1
32102	Stream	-5.92436000000000007	-76.0973900000000043	1
32103	Stream	-6.55731000000000019	-76.4316100000000063	1
32104	Stream	-6.80274000000000001	-76.2924100000000038	1
32105	Stream	-7.07788000000000039	-76.6574200000000019	1
32106	Stream	-7.26243000000000016	-76.7560200000000066	1
32107	Stream	-7.42675999999999981	-76.652869999999993	1
32108	Stream	-8.17740000000000045	-76.5327800000000025	1
32109	Stream	-8.19111999999999973	-76.5028599999999983	1
32110	Stream	-8.25718999999999959	-76.3973100000000045	1
32111	Stream	-8.42756999999999934	-76.392319999999998	1
32112	Stream	-8.74754000000000076	-76.142399999999995	1
32113	Stream	-9.28739000000000026	-76.057540000000003	1
32114	Stream	-9.31719000000000008	-76.0204200000000014	1
32115	Stream	-9.32756999999999969	-75.9972700000000003	1
32116	Stream	-9.49764000000000053	-75.9669200000000018	1
32117	Stream	-9.93263999999999925	-76.2771699999999981	1
32118	Stream	-9.94289000000000023	-76.2473099999999988	1
33000	Stream	-4.52230000000000043	-73.4873900000000049	1
33001	Stream	-8.78266999999999953	-74.5529999999999973	1
33002	Stream	-10.7870100000000004	-73.7729599999999976	1
33003	Stream	-13.5670199999999994	-72.5887299999999982	1
33004	Stream	-10.7573000000000008	-73.7122200000000021	1
33005	Stream	-12.6023200000000006	-72.5327000000000055	1
33006	Stream	-12.6462500000000002	-72.5375999999999976	1
33007	Stream	-12.8672500000000003	-72.6821000000000055	1
33008	Stream	-13.1575000000000006	-72.2775000000000034	1
33009	Stream	-13.2725399999999993	-72.2498800000000045	1
33010	Stream	-13.5757100000000008	-71.7225600000000014	1
33011	Stream	-14.1021400000000003	-71.4217299999999966	1
33012	Stream	-14.1661199999999994	-71.4023300000000063	1
33013	Stream	-14.3625000000000007	-71.3174999999999955	1
33014	Stream	-14.4371899999999993	-71.2916000000000025	1
33050	Stream	-8.30715000000000003	-74.4929300000000012	1
33051	Stream	-13.1529299999999996	-72.5418999999999983	1
33052	Stream	-13.2023200000000003	-72.4726600000000047	1
33053	Stream	-11.8407300000000006	-75.4174399999999991	1
33100	Stream	-8.73283999999999949	-74.572029999999998	1
33101	Stream	-8.93270000000000053	-74.7176299999999998	1
33102	Stream	-9.37719000000000058	-74.9724899999999934	1
33105	Stream	-9.37228999999999957	-75.0267599999999959	1
33108	Stream	-9.89245000000000019	-74.9581500000000034	1
33109	Stream	-9.91172000000000075	-74.9321099999999944	1
33110	Stream	-9.89744999999999919	-75.2528199999999998	1
33111	Stream	-9.92777000000000065	-75.2478299999999933	1
33114	Stream	-10.0023300000000006	-74.9724199999999996	1
33116	Stream	-10.3473699999999997	-74.8772900000000021	1
33117	Stream	-10.3774999999999995	-74.8477599999999939	1
33118	Stream	-10.3874399999999998	-74.8622199999999935	1
33119	Stream	-10.3374299999999995	-74.8974699999999984	1
33122	Stream	-10.0275999999999996	-75.5628600000000006	1
33123	Stream	-10.0921299999999992	-75.5374800000000022	1
33124	Stream	-10.5973699999999997	-75.4176800000000043	1
\.


--
-- TOC entry 4936 (class 0 OID 71064)
-- Dependencies: 413
-- Data for Name: spatialoffsets; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY spatialoffsets (spatialoffsetid, spatialoffsettypecv, offset1value, offset1unitid, offset2value, offset2unitid, offset3value, offset3unitid) FROM stdin;
\.


--
-- TOC entry 4877 (class 0 OID 70775)
-- Dependencies: 354
-- Data for Name: spatialreferenceexternalidentifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY spatialreferenceexternalidentifiers (bridgeid, spatialreferenceid, externalidentifiersystemid, spatialreferenceexternalidentifier, spatialreferenceexternalidentifieruri) FROM stdin;
\.


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 353
-- Name: spatialreferenceexternalidentifiers_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('spatialreferenceexternalidentifiers_bridgeid_seq', 1, false);


--
-- TOC entry 4938 (class 0 OID 71071)
-- Dependencies: 415
-- Data for Name: spatialreferences; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY spatialreferences (spatialreferenceid, srscode, srsname, srsdescription, srslink) FROM stdin;
1	epsg:4326	WGS 84 (EPSG:4326)	Lat-lon Geographic 2D, WGS84, EPSG:4386	http://www.opengis.net/def/crs/EPSG/0/4326
\.


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 414
-- Name: spatialreferences_spatialreferenceid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('spatialreferences_spatialreferenceid_seq', 1, false);


--
-- TOC entry 4886 (class 0 OID 70825)
-- Dependencies: 363
-- Data for Name: specimenbatchpostions; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY specimenbatchpostions (featureactionid, batchpositionnumber, batchpositionlabel) FROM stdin;
\.


--
-- TOC entry 4939 (class 0 OID 71080)
-- Dependencies: 416
-- Data for Name: specimens; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY specimens (samplingfeatureid, specimentypecv, specimenmediumcv, isfieldspecimen) FROM stdin;
1	Grab	Particulate	t
2	Grab	Particulate	t
3	Grab	Particulate	t
4	Grab	Particulate	t
5	Grab	Particulate	t
6	Grab	Particulate	t
7	Grab	Particulate	t
8	Grab	Particulate	t
9	Grab	Particulate	t
10	Grab	Particulate	t
11	Grab	Particulate	t
12	Grab	Particulate	t
13	Grab	Particulate	t
14	Grab	Particulate	t
15	Grab	Particulate	t
16	Grab	Particulate	t
17	Grab	Particulate	t
18	Grab	Particulate	t
19	Grab	Particulate	t
20	Grab	Particulate	t
21	Grab	Particulate	t
22	Grab	Particulate	t
23	Grab	Particulate	t
24	Grab	Particulate	t
25	Grab	Particulate	t
26	Grab	Particulate	t
27	Grab	Particulate	t
28	Grab	Particulate	t
29	Grab	Particulate	t
30	Grab	Particulate	t
31	Grab	Particulate	t
32	Grab	Particulate	t
33	Grab	Particulate	t
34	Grab	Particulate	t
35	Grab	Particulate	t
36	Grab	Particulate	t
37	Grab	Particulate	t
38	Grab	Particulate	t
39	Grab	Particulate	t
40	Grab	Particulate	t
41	Grab	Particulate	t
42	Grab	Particulate	t
43	Grab	Particulate	t
44	Grab	Particulate	t
45	Grab	Particulate	t
46	Grab	Particulate	t
47	Grab	Particulate	t
48	Grab	Particulate	t
49	Grab	Particulate	t
50	Grab	Particulate	t
51	Grab	Particulate	t
52	Grab	Particulate	t
53	Grab	Particulate	t
54	Grab	Particulate	t
55	Grab	Particulate	t
56	Grab	Particulate	t
57	Grab	Particulate	t
58	Grab	Particulate	t
59	Grab	Particulate	t
60	Grab	Particulate	t
61	Grab	Particulate	t
62	Grab	Particulate	t
63	Grab	Particulate	t
64	Grab	Particulate	t
65	Grab	Particulate	t
66	Grab	Particulate	t
67	Grab	Particulate	t
68	Grab	Particulate	t
69	Grab	Particulate	t
70	Grab	Particulate	t
71	Grab	Particulate	t
72	Grab	Particulate	t
73	Grab	Particulate	t
74	Grab	Particulate	t
75	Grab	Particulate	t
76	Grab	Particulate	t
77	Grab	Particulate	t
78	Grab	Particulate	t
79	Grab	Particulate	t
80	Grab	Particulate	t
81	Grab	Particulate	t
82	Grab	Particulate	t
83	Grab	Particulate	t
84	Grab	Particulate	t
85	Grab	Particulate	t
86	Grab	Particulate	t
87	Grab	Particulate	t
88	Grab	Particulate	t
89	Grab	Particulate	t
90	Grab	Particulate	t
91	Grab	Particulate	t
92	Grab	Particulate	t
93	Grab	Particulate	t
94	Grab	Particulate	t
95	Grab	Particulate	t
96	Grab	Particulate	t
97	Grab	Particulate	t
98	Grab	Particulate	t
33125	Grab	Particulate	t
33126	Grab	Particulate	t
33127	Grab	Particulate	t
33128	Grab	Particulate	t
33129	Grab	Particulate	t
33130	Grab	Particulate	t
33131	Grab	Particulate	t
33132	Grab	Particulate	t
33133	Grab	Particulate	t
33134	Grab	Particulate	t
33135	Grab	Particulate	t
33136	Grab	Particulate	t
33137	Grab	Particulate	t
33138	Grab	Particulate	t
33139	Grab	Particulate	t
33140	Grab	Particulate	t
33141	Grab	Particulate	t
33142	Grab	Particulate	t
33143	Grab	Particulate	t
33144	Grab	Particulate	t
33145	Grab	Particulate	t
33146	Grab	Particulate	t
33147	Grab	Particulate	t
33148	Grab	Particulate	t
33149	Grab	Particulate	t
33150	Grab	Particulate	t
33151	Grab	Particulate	t
33152	Grab	Particulate	t
33153	Grab	Particulate	t
33154	Grab	Particulate	t
33155	Grab	Particulate	t
33156	Grab	Particulate	t
33157	Grab	Particulate	t
33158	Grab	Particulate	t
33159	Grab	Particulate	t
33160	Grab	Particulate	t
33161	Grab	Particulate	t
33162	Grab	Particulate	t
33163	Grab	Particulate	t
33164	Grab	Particulate	t
33165	Grab	Particulate	t
33166	Grab	Particulate	t
33167	Grab	Particulate	t
33168	Grab	Particulate	t
33169	Grab	Particulate	t
33170	Grab	Particulate	t
33171	Grab	Particulate	t
33172	Grab	Particulate	t
33173	Grab	Particulate	t
33174	Grab	Particulate	t
33175	Grab	Particulate	t
33176	Grab	Particulate	t
33177	Grab	Particulate	t
33178	Grab	Particulate	t
33179	Grab	Particulate	t
33180	Grab	Particulate	t
33181	Grab	Particulate	t
33182	Grab	Particulate	t
33183	Grab	Particulate	t
33184	Grab	Particulate	t
33185	Grab	Particulate	t
33186	Grab	Particulate	t
33187	Grab	Particulate	t
33188	Grab	Particulate	t
33189	Grab	Particulate	t
33190	Grab	Particulate	t
33191	Grab	Particulate	t
33192	Grab	Particulate	t
33193	Grab	Particulate	t
33194	Grab	Particulate	t
33195	Grab	Particulate	t
33196	Grab	Particulate	t
33197	Grab	Particulate	t
33198	Grab	Particulate	t
33199	Grab	Particulate	t
33200	Grab	Particulate	t
33201	Grab	Particulate	t
33202	Grab	Particulate	t
33203	Grab	Particulate	t
33204	Grab	Particulate	t
33205	Grab	Particulate	t
33206	Grab	Particulate	t
33207	Grab	Particulate	t
33208	Grab	Particulate	t
33209	Grab	Particulate	t
33210	Grab	Particulate	t
33211	Grab	Particulate	t
33212	Grab	Particulate	t
33213	Grab	Particulate	t
33214	Grab	Particulate	t
33215	Grab	Particulate	t
33216	Grab	Particulate	t
33217	Grab	Particulate	t
33218	Grab	Particulate	t
33219	Grab	Particulate	t
33220	Grab	Particulate	t
33221	Grab	Particulate	t
\.


--
-- TOC entry 4941 (class 0 OID 71090)
-- Dependencies: 418
-- Data for Name: specimentaxonomicclassifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY specimentaxonomicclassifiers (bridgeid, samplingfeatureid, taxonomicclassifierid, citationid) FROM stdin;
\.


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 417
-- Name: specimentaxonomicclassifiers_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('specimentaxonomicclassifiers_bridgeid_seq', 1, false);


--
-- TOC entry 4921 (class 0 OID 70987)
-- Dependencies: 398
-- Data for Name: spectraresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY spectraresults (resultid, xlocation, xlocationunitsid, ylocation, ylocationunitsid, zlocation, zlocationunitsid, spatialreferenceid, intendedwavelengthspacing, intendedwavelengthspacingunitsid, aggregationstatisticcv) FROM stdin;
\.


--
-- TOC entry 4756 (class 0 OID 70080)
-- Dependencies: 233
-- Data for Name: spectraresultvalueannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY spectraresultvalueannotations (bridgeid, valueid, annotationid) FROM stdin;
\.


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 232
-- Name: spectraresultvalueannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('spectraresultvalueannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4923 (class 0 OID 70994)
-- Dependencies: 400
-- Data for Name: spectraresultvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY spectraresultvalues (valueid, resultid, datavalue, valuedatetime, valuedatetimeutcoffset, excitationwavelength, emissionwavelength, wavelengthunitsid, censorcodecv, qualitycodecv, timeaggregationinterval, timeaggregationintervalunitsid) FROM stdin;
\.


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 399
-- Name: spectraresultvalues_valueid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('spectraresultvalues_valueid_seq', 1, false);


--
-- TOC entry 4879 (class 0 OID 70786)
-- Dependencies: 356
-- Data for Name: taxonomicclassifierexternalidentifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY taxonomicclassifierexternalidentifiers (bridgeid, taxonomicclassifierid, externalidentifiersystemid, taxonomicclassifierexternalidentifier, taxonomicclassifierexternalidentifieruri) FROM stdin;
\.


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 355
-- Name: taxonomicclassifierexternalidentifiers_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('taxonomicclassifierexternalidentifiers_bridgeid_seq', 1, false);


--
-- TOC entry 4789 (class 0 OID 70244)
-- Dependencies: 266
-- Data for Name: taxonomicclassifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY taxonomicclassifiers (taxonomicclassifierid, taxonomicclassifiertypecv, taxonomicclassifiername, taxonomicclassifiercommonname, taxonomicclassifierdescription, parenttaxonomicclassifierid) FROM stdin;
\.


--
-- TOC entry 4924 (class 0 OID 71003)
-- Dependencies: 401
-- Data for Name: timeseriesresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY timeseriesresults (resultid, xlocation, xlocationunitsid, ylocation, ylocationunitsid, zlocation, zlocationunitsid, spatialreferenceid, intendedtimespacing, intendedtimespacingunitsid, aggregationstatisticcv) FROM stdin;
\.


--
-- TOC entry 4758 (class 0 OID 70088)
-- Dependencies: 235
-- Data for Name: timeseriesresultvalueannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY timeseriesresultvalueannotations (bridgeid, valueid, annotationid) FROM stdin;
\.


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 234
-- Name: timeseriesresultvalueannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('timeseriesresultvalueannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4926 (class 0 OID 71010)
-- Dependencies: 403
-- Data for Name: timeseriesresultvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY timeseriesresultvalues (valueid, resultid, datavalue, valuedatetime, valuedatetimeutcoffset, censorcodecv, qualitycodecv, timeaggregationinterval, timeaggregationintervalunitsid) FROM stdin;
\.


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 402
-- Name: timeseriesresultvalues_valueid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('timeseriesresultvalues_valueid_seq', 1, false);


--
-- TOC entry 4927 (class 0 OID 71019)
-- Dependencies: 404
-- Data for Name: trajectoryresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY trajectoryresults (resultid, spatialreferenceid, intendedtrajectoryspacing, intendedtrajectoryspacingunitsid, intendedtimespacing, intendedtimespacingunitsid, aggregationstatisticcv) FROM stdin;
\.


--
-- TOC entry 4760 (class 0 OID 70096)
-- Dependencies: 237
-- Data for Name: trajectoryresultvalueannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY trajectoryresultvalueannotations (bridgeid, valueid, annotationid) FROM stdin;
\.


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 236
-- Name: trajectoryresultvalueannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('trajectoryresultvalueannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4929 (class 0 OID 71026)
-- Dependencies: 406
-- Data for Name: trajectoryresultvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY trajectoryresultvalues (valueid, resultid, datavalue, valuedatetime, valuedatetimeutcoffset, xlocation, xlocationunitsid, ylocation, ylocationunitsid, zlocation, zlocationunitsid, trajectorydistance, trajectorydistanceaggregationinterval, trajectorydistanceunitsid, censorcodecv, qualitycodecv, timeaggregationinterval, timeaggregationintervalunitsid) FROM stdin;
\.


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 405
-- Name: trajectoryresultvalues_valueid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('trajectoryresultvalues_valueid_seq', 1, false);


--
-- TOC entry 4930 (class 0 OID 71035)
-- Dependencies: 407
-- Data for Name: transectresults; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY transectresults (resultid, zlocation, zlocationunitsid, spatialreferenceid, intendedtransectspacing, intendedtransectspacingunitsid, intendedtimespacing, intendedtimespacingunitsid, aggregationstatisticcv) FROM stdin;
\.


--
-- TOC entry 4762 (class 0 OID 70104)
-- Dependencies: 239
-- Data for Name: transectresultvalueannotations; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY transectresultvalueannotations (bridgeid, valueid, annotationid) FROM stdin;
\.


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 238
-- Name: transectresultvalueannotations_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('transectresultvalueannotations_bridgeid_seq', 1, false);


--
-- TOC entry 4932 (class 0 OID 71042)
-- Dependencies: 409
-- Data for Name: transectresultvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY transectresultvalues (valueid, resultid, datavalue, valuedatetime, valuedatetimeutcoffset, xlocation, xlocationunitsid, ylocation, ylocationunitsid, transectdistance, transectdistanceaggregationinterval, transectdistanceunitsid, censorcodecv, qualitycodecv, aggregationstatisticcv, timeaggregationinterval, timeaggregationintervalunitsid) FROM stdin;
\.


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 408
-- Name: transectresultvalues_valueid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('transectresultvalues_valueid_seq', 1, false);


--
-- TOC entry 4791 (class 0 OID 70254)
-- Dependencies: 268
-- Data for Name: units; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY units (unitsid, unitstypecv, unitsabbreviation, unitsname, unitslink) FROM stdin;
1	Mass concentration	mg/L	milligrams per liter	\N
2	Specific surface area	m2 SA/g sed	meters^2 of surface area per gram of sediment	\N
3	Temperature	deg C	degrees Celsius	\N
4	Dimensionless	-	pH unit	\N
5	Electrical conductivity	uS/cm	micro Siemens per centimeter	\N
6	Charge concentration	ueq/L	micro equivalents per liter	\N
7	Molar concentration	uM	micro moles per liter	\N
8	Mass fraction	ppm	parts per million	\N
9	Mass fraction	sat fr	saturation fraction (ratio)	\N
10	Mass fraction	per mil	parts per thousand (mille)	\N
11	Molar fraction	mol fr	mole fraction (ratio)	\N
12	Mass fraction	mass %	mass percent	\N
13	Areal density	mg OC/m2 SA	milligrams organic carbon per meter^2 of surface area	\N
14	Time	hr	hour	\N
\.


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 267
-- Name: units_unitsid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('units_unitsid_seq', 14, true);


--
-- TOC entry 4864 (class 0 OID 70704)
-- Dependencies: 341
-- Data for Name: variableextensionpropertyvalues; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY variableextensionpropertyvalues (bridgeid, variableid, propertyid, propertyvalue) FROM stdin;
\.


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 340
-- Name: variableextensionpropertyvalues_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('variableextensionpropertyvalues_bridgeid_seq', 1, false);


--
-- TOC entry 4881 (class 0 OID 70797)
-- Dependencies: 358
-- Data for Name: variableexternalidentifiers; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY variableexternalidentifiers (bridgeid, variableid, externalidentifiersystemid, variableexternalidentifer, variableexternalidentifieruri) FROM stdin;
\.


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 357
-- Name: variableexternalidentifiers_bridgeid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('variableexternalidentifiers_bridgeid_seq', 1, false);


--
-- TOC entry 4793 (class 0 OID 70265)
-- Dependencies: 270
-- Data for Name: variables; Type: TABLE DATA; Schema: odm2; Owner: -
--

COPY variables (variableid, variabletypecv, variablecode, variablenamecv, variabledefinition, speciationcv, nodatavalue) FROM stdin;
1	Chemistry	FPOC	Carbon, particulate organic	Fine particulate organic carbon	\N	-999
2	Chemistry	FPON	Nitrogen, particulate organic	Fine particulate organic nitrogen	\N	-999
4	Water quality	FSS	Sediment, suspended	Fine suspended sediment	\N	-999
3	Chemistry	FPCNratio_a	Carbon to nitrogen molar ratio	Fine particulate atomic (molar) organic C/N ratio, acidified	\N	-999
5	Chemistry	CPOC	Carbon, particulate organic	Coarse particulate organic carbon	\N	-999
6	Chemistry	CPON	Nitrogen, particulate organic	Coarse particulate organic nitrogen	\N	-999
7	Chemistry	CPCNa	Carbon to nitrogen molar ratio	Coarse particulate atomic (molar) organic C/N ratio, acidified	\N	-999
8	Water quality	CSS	Sediment, suspended	Coarse suspended sediment	\N	-999
\.


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 269
-- Name: variables_variableid_seq; Type: SEQUENCE SET; Schema: odm2; Owner: -
--

SELECT pg_catalog.setval('variables_variableid_seq', 8, true);


SET search_path = public, pg_catalog;

--
-- TOC entry 3971 (class 0 OID 16658)
-- Dependencies: 173
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


SET search_path = odm2, pg_catalog;

--
-- TOC entry 4058 (class 2606 OID 69994)
-- Name: actionannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actionannotations
    ADD CONSTRAINT actionannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4088 (class 2606 OID 70120)
-- Name: actionby_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actionby
    ADD CONSTRAINT actionby_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4245 (class 2606 OID 70813)
-- Name: actiondirectives_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actiondirectives
    ADD CONSTRAINT actiondirectives_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4213 (class 2606 OID 70658)
-- Name: actionextensionpropertyvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actionextensionpropertyvalues
    ADD CONSTRAINT actionextensionpropertyvalues_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4090 (class 2606 OID 70131)
-- Name: actions_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (actionid);


--
-- TOC entry 4092 (class 2606 OID 70142)
-- Name: affiliations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY affiliations
    ADD CONSTRAINT affiliations_pkey PRIMARY KEY (affiliationid);


--
-- TOC entry 4060 (class 2606 OID 70005)
-- Name: annotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY annotations
    ADD CONSTRAINT annotations_pkey PRIMARY KEY (annotationid);


--
-- TOC entry 4251 (class 2606 OID 70837)
-- Name: authorlists_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authorlists
    ADD CONSTRAINT authorlists_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4189 (class 2606 OID 70544)
-- Name: calibrationactions_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY calibrationactions
    ADD CONSTRAINT calibrationactions_pkey PRIMARY KEY (actionid);


--
-- TOC entry 4191 (class 2606 OID 70552)
-- Name: calibrationreferenceequipment_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY calibrationreferenceequipment
    ADD CONSTRAINT calibrationreferenceequipment_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4193 (class 2606 OID 70560)
-- Name: calibrationstandards_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY calibrationstandards
    ADD CONSTRAINT calibrationstandards_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4271 (class 2606 OID 70914)
-- Name: categoricalresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoricalresults
    ADD CONSTRAINT categoricalresults_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4062 (class 2606 OID 70013)
-- Name: categoricalresultvalueannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoricalresultvalueannotations
    ADD CONSTRAINT categoricalresultvalueannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4273 (class 2606 OID 70922)
-- Name: categoricalresultvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoricalresultvalues
    ADD CONSTRAINT categoricalresultvalues_pkey PRIMARY KEY (valueid);


--
-- TOC entry 4215 (class 2606 OID 70666)
-- Name: citationextensionpropertyvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY citationextensionpropertyvalues
    ADD CONSTRAINT citationextensionpropertyvalues_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4227 (class 2606 OID 70720)
-- Name: citationexternalidentifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY citationexternalidentifiers
    ADD CONSTRAINT citationexternalidentifiers_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4253 (class 2606 OID 70848)
-- Name: citations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (citationid);


--
-- TOC entry 4121 (class 2606 OID 70281)
-- Name: cv_actiontype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_actiontype
    ADD CONSTRAINT cv_actiontype_pkey PRIMARY KEY (name);


--
-- TOC entry 4123 (class 2606 OID 70289)
-- Name: cv_aggregationstatistic_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_aggregationstatistic
    ADD CONSTRAINT cv_aggregationstatistic_pkey PRIMARY KEY (name);


--
-- TOC entry 4125 (class 2606 OID 70297)
-- Name: cv_annotationtype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_annotationtype
    ADD CONSTRAINT cv_annotationtype_pkey PRIMARY KEY (name);


--
-- TOC entry 4127 (class 2606 OID 70305)
-- Name: cv_censorcode_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_censorcode
    ADD CONSTRAINT cv_censorcode_pkey PRIMARY KEY (name);


--
-- TOC entry 4129 (class 2606 OID 70313)
-- Name: cv_dataqualitytype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_dataqualitytype
    ADD CONSTRAINT cv_dataqualitytype_pkey PRIMARY KEY (name);


--
-- TOC entry 4131 (class 2606 OID 70321)
-- Name: cv_datasettypecv_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_datasettypecv
    ADD CONSTRAINT cv_datasettypecv_pkey PRIMARY KEY (name);


--
-- TOC entry 4133 (class 2606 OID 70329)
-- Name: cv_directivetype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_directivetype
    ADD CONSTRAINT cv_directivetype_pkey PRIMARY KEY (name);


--
-- TOC entry 4135 (class 2606 OID 70337)
-- Name: cv_elevationdatum_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_elevationdatum
    ADD CONSTRAINT cv_elevationdatum_pkey PRIMARY KEY (name);


--
-- TOC entry 4137 (class 2606 OID 70345)
-- Name: cv_equipmenttype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_equipmenttype
    ADD CONSTRAINT cv_equipmenttype_pkey PRIMARY KEY (name);


--
-- TOC entry 4139 (class 2606 OID 70353)
-- Name: cv_methodtype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_methodtype
    ADD CONSTRAINT cv_methodtype_pkey PRIMARY KEY (name);


--
-- TOC entry 4141 (class 2606 OID 70361)
-- Name: cv_organizationtype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_organizationtype
    ADD CONSTRAINT cv_organizationtype_pkey PRIMARY KEY (name);


--
-- TOC entry 4143 (class 2606 OID 70369)
-- Name: cv_propertydatatype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_propertydatatype
    ADD CONSTRAINT cv_propertydatatype_pkey PRIMARY KEY (name);


--
-- TOC entry 4145 (class 2606 OID 70377)
-- Name: cv_qualitycode_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_qualitycode
    ADD CONSTRAINT cv_qualitycode_pkey PRIMARY KEY (name);


--
-- TOC entry 4147 (class 2606 OID 70385)
-- Name: cv_referencematerialmedium_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_referencematerialmedium
    ADD CONSTRAINT cv_referencematerialmedium_pkey PRIMARY KEY (name);


--
-- TOC entry 4149 (class 2606 OID 70393)
-- Name: cv_relationshiptype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_relationshiptype
    ADD CONSTRAINT cv_relationshiptype_pkey PRIMARY KEY (name);


--
-- TOC entry 4151 (class 2606 OID 70401)
-- Name: cv_resulttype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_resulttype
    ADD CONSTRAINT cv_resulttype_pkey PRIMARY KEY (name);


--
-- TOC entry 4153 (class 2606 OID 70409)
-- Name: cv_sampledmedium_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_sampledmedium
    ADD CONSTRAINT cv_sampledmedium_pkey PRIMARY KEY (name);


--
-- TOC entry 4155 (class 2606 OID 70417)
-- Name: cv_samplingfeaturegeotype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_samplingfeaturegeotype
    ADD CONSTRAINT cv_samplingfeaturegeotype_pkey PRIMARY KEY (name);


--
-- TOC entry 4157 (class 2606 OID 70425)
-- Name: cv_samplingfeaturetype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_samplingfeaturetype
    ADD CONSTRAINT cv_samplingfeaturetype_pkey PRIMARY KEY (name);


--
-- TOC entry 4159 (class 2606 OID 70433)
-- Name: cv_sitetype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_sitetype
    ADD CONSTRAINT cv_sitetype_pkey PRIMARY KEY (name);


--
-- TOC entry 4161 (class 2606 OID 70441)
-- Name: cv_spatialoffsettype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_spatialoffsettype
    ADD CONSTRAINT cv_spatialoffsettype_pkey PRIMARY KEY (name);


--
-- TOC entry 4163 (class 2606 OID 70449)
-- Name: cv_speciation_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_speciation
    ADD CONSTRAINT cv_speciation_pkey PRIMARY KEY (name);


--
-- TOC entry 4165 (class 2606 OID 70457)
-- Name: cv_specimenmedium_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_specimenmedium
    ADD CONSTRAINT cv_specimenmedium_pkey PRIMARY KEY (name);


--
-- TOC entry 4167 (class 2606 OID 70465)
-- Name: cv_specimentype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_specimentype
    ADD CONSTRAINT cv_specimentype_pkey PRIMARY KEY (name);


--
-- TOC entry 4169 (class 2606 OID 70473)
-- Name: cv_status_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_status
    ADD CONSTRAINT cv_status_pkey PRIMARY KEY (name);


--
-- TOC entry 4171 (class 2606 OID 70481)
-- Name: cv_taxonomicclassifiertype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_taxonomicclassifiertype
    ADD CONSTRAINT cv_taxonomicclassifiertype_pkey PRIMARY KEY (name);


--
-- TOC entry 4173 (class 2606 OID 70489)
-- Name: cv_unitstype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_unitstype
    ADD CONSTRAINT cv_unitstype_pkey PRIMARY KEY (name);


--
-- TOC entry 4175 (class 2606 OID 70497)
-- Name: cv_variablename_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_variablename
    ADD CONSTRAINT cv_variablename_pkey PRIMARY KEY (name);


--
-- TOC entry 4177 (class 2606 OID 70505)
-- Name: cv_variabletype_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cv_variabletype
    ADD CONSTRAINT cv_variabletype_pkey PRIMARY KEY (name);


--
-- TOC entry 4195 (class 2606 OID 70571)
-- Name: dataloggerfilecolumns_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataloggerfilecolumns
    ADD CONSTRAINT dataloggerfilecolumns_pkey PRIMARY KEY (dataloggerfilecolumnid);


--
-- TOC entry 4197 (class 2606 OID 70582)
-- Name: dataloggerfiles_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataloggerfiles
    ADD CONSTRAINT dataloggerfiles_pkey PRIMARY KEY (dataloggerfileid);


--
-- TOC entry 4199 (class 2606 OID 70593)
-- Name: dataloggerprogramfiles_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataloggerprogramfiles
    ADD CONSTRAINT dataloggerprogramfiles_pkey PRIMARY KEY (programid);


--
-- TOC entry 4179 (class 2606 OID 70513)
-- Name: dataquality_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataquality
    ADD CONSTRAINT dataquality_pkey PRIMARY KEY (dataqualityid);


--
-- TOC entry 4255 (class 2606 OID 70856)
-- Name: datasetcitations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetcitations
    ADD CONSTRAINT datasetcitations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4094 (class 2606 OID 70153)
-- Name: datasets_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasets
    ADD CONSTRAINT datasets_pkey PRIMARY KEY (datasetid);


--
-- TOC entry 4096 (class 2606 OID 70161)
-- Name: datasetsresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetsresults
    ADD CONSTRAINT datasetsresults_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4257 (class 2606 OID 70864)
-- Name: derivationequations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY derivationequations
    ADD CONSTRAINT derivationequations_pkey PRIMARY KEY (derivationequationid);


--
-- TOC entry 4247 (class 2606 OID 70824)
-- Name: directives_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY directives
    ADD CONSTRAINT directives_pkey PRIMARY KEY (directiveid);


--
-- TOC entry 4201 (class 2606 OID 70604)
-- Name: equipment_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (equipmentid);


--
-- TOC entry 4064 (class 2606 OID 70021)
-- Name: equipmentannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY equipmentannotations
    ADD CONSTRAINT equipmentannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4203 (class 2606 OID 70615)
-- Name: equipmentmodels_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY equipmentmodels
    ADD CONSTRAINT equipmentmodels_pkey PRIMARY KEY (equipmentmodelid);


--
-- TOC entry 4205 (class 2606 OID 70623)
-- Name: equipmentused_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY equipmentused
    ADD CONSTRAINT equipmentused_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4217 (class 2606 OID 70677)
-- Name: extensionproperties_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY extensionproperties
    ADD CONSTRAINT extensionproperties_pkey PRIMARY KEY (propertyid);


--
-- TOC entry 4229 (class 2606 OID 70728)
-- Name: externalidentifiersystems_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalidentifiersystems
    ADD CONSTRAINT externalidentifiersystems_pkey PRIMARY KEY (externalidentifiersystemid);


--
-- TOC entry 4098 (class 2606 OID 70169)
-- Name: featureactions_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY featureactions
    ADD CONSTRAINT featureactions_pkey PRIMARY KEY (featureactionid);


--
-- TOC entry 4207 (class 2606 OID 70634)
-- Name: instrumentoutputvariables_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY instrumentoutputvariables
    ADD CONSTRAINT instrumentoutputvariables_pkey PRIMARY KEY (instrumentoutputvariableid);


--
-- TOC entry 4209 (class 2606 OID 70642)
-- Name: maintenanceactions_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maintenanceactions
    ADD CONSTRAINT maintenanceactions_pkey PRIMARY KEY (actionid);


--
-- TOC entry 4275 (class 2606 OID 70930)
-- Name: measurementresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT measurementresults_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4066 (class 2606 OID 70029)
-- Name: measurementresultvalueannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY measurementresultvalueannotations
    ADD CONSTRAINT measurementresultvalueannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4277 (class 2606 OID 70938)
-- Name: measurementresultvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY measurementresultvalues
    ADD CONSTRAINT measurementresultvalues_pkey PRIMARY KEY (valueid);


--
-- TOC entry 4068 (class 2606 OID 70037)
-- Name: methodannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY methodannotations
    ADD CONSTRAINT methodannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4259 (class 2606 OID 70872)
-- Name: methodcitations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY methodcitations
    ADD CONSTRAINT methodcitations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4219 (class 2606 OID 70685)
-- Name: methodextensionpropertyvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY methodextensionpropertyvalues
    ADD CONSTRAINT methodextensionpropertyvalues_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4231 (class 2606 OID 70739)
-- Name: methodexternalidentifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY methodexternalidentifiers
    ADD CONSTRAINT methodexternalidentifiers_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4100 (class 2606 OID 70180)
-- Name: methods_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY methods
    ADD CONSTRAINT methods_pkey PRIMARY KEY (methodid);


--
-- TOC entry 4319 (class 2606 OID 71106)
-- Name: modelaffiliations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modelaffiliations
    ADD CONSTRAINT modelaffiliations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4321 (class 2606 OID 71117)
-- Name: models_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY models
    ADD CONSTRAINT models_pkey PRIMARY KEY (modelid);


--
-- TOC entry 4102 (class 2606 OID 70191)
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (organizationid);


--
-- TOC entry 4104 (class 2606 OID 70202)
-- Name: people_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (personid);


--
-- TOC entry 4233 (class 2606 OID 70750)
-- Name: personexternalidentifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY personexternalidentifiers
    ADD CONSTRAINT personexternalidentifiers_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4279 (class 2606 OID 70943)
-- Name: pointcoverageresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pointcoverageresults
    ADD CONSTRAINT pointcoverageresults_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4070 (class 2606 OID 70045)
-- Name: pointcoverageresultvalueannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pointcoverageresultvalueannotations
    ADD CONSTRAINT pointcoverageresultvalueannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4281 (class 2606 OID 70954)
-- Name: pointcoverageresultvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pointcoverageresultvalues
    ADD CONSTRAINT pointcoverageresultvalues_pkey PRIMARY KEY (valueid);


--
-- TOC entry 4106 (class 2606 OID 70213)
-- Name: processinglevels_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY processinglevels
    ADD CONSTRAINT processinglevels_pkey PRIMARY KEY (processinglevelid);


--
-- TOC entry 4283 (class 2606 OID 70959)
-- Name: profileresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY profileresults
    ADD CONSTRAINT profileresults_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4072 (class 2606 OID 70053)
-- Name: profileresultvalueannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY profileresultvalueannotations
    ADD CONSTRAINT profileresultvalueannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4285 (class 2606 OID 70970)
-- Name: profileresultvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY profileresultvalues
    ADD CONSTRAINT profileresultvalues_pkey PRIMARY KEY (valueid);


--
-- TOC entry 4235 (class 2606 OID 70761)
-- Name: referencematerialexternalidentifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY referencematerialexternalidentifiers
    ADD CONSTRAINT referencematerialexternalidentifiers_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4181 (class 2606 OID 70521)
-- Name: referencematerials_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY referencematerials
    ADD CONSTRAINT referencematerials_pkey PRIMARY KEY (referencematerialid);


--
-- TOC entry 4183 (class 2606 OID 70526)
-- Name: referencematerialvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY referencematerialvalues
    ADD CONSTRAINT referencematerialvalues_pkey PRIMARY KEY (referencematerialvalueid);


--
-- TOC entry 4108 (class 2606 OID 70221)
-- Name: relatedactions_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relatedactions
    ADD CONSTRAINT relatedactions_pkey PRIMARY KEY (relationid);


--
-- TOC entry 4261 (class 2606 OID 70880)
-- Name: relatedannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relatedannotations
    ADD CONSTRAINT relatedannotations_pkey PRIMARY KEY (relationid);


--
-- TOC entry 4263 (class 2606 OID 70888)
-- Name: relatedcitations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relatedcitations
    ADD CONSTRAINT relatedcitations_pkey PRIMARY KEY (relationid);


--
-- TOC entry 4265 (class 2606 OID 70896)
-- Name: relateddatasets_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relateddatasets
    ADD CONSTRAINT relateddatasets_pkey PRIMARY KEY (relationid);


--
-- TOC entry 4211 (class 2606 OID 70650)
-- Name: relatedequipment_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relatedequipment
    ADD CONSTRAINT relatedequipment_pkey PRIMARY KEY (relationid);


--
-- TOC entry 4307 (class 2606 OID 71058)
-- Name: relatedfeatures_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relatedfeatures
    ADD CONSTRAINT relatedfeatures_pkey PRIMARY KEY (relationid);


--
-- TOC entry 4323 (class 2606 OID 71125)
-- Name: relatedmodels_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relatedmodels
    ADD CONSTRAINT relatedmodels_pkey PRIMARY KEY (relatedid);


--
-- TOC entry 4267 (class 2606 OID 70904)
-- Name: relatedresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relatedresults
    ADD CONSTRAINT relatedresults_pkey PRIMARY KEY (relationid);


--
-- TOC entry 4074 (class 2606 OID 70061)
-- Name: resultannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resultannotations
    ADD CONSTRAINT resultannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4269 (class 2606 OID 70909)
-- Name: resultderivationequations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resultderivationequations
    ADD CONSTRAINT resultderivationequations_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4221 (class 2606 OID 70693)
-- Name: resultextensionpropertyvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resultextensionpropertyvalues
    ADD CONSTRAINT resultextensionpropertyvalues_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4185 (class 2606 OID 70531)
-- Name: resultnormalizationvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resultnormalizationvalues
    ADD CONSTRAINT resultnormalizationvalues_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4110 (class 2606 OID 70232)
-- Name: results_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4187 (class 2606 OID 70539)
-- Name: resultsdataquality_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resultsdataquality
    ADD CONSTRAINT resultsdataquality_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4076 (class 2606 OID 70069)
-- Name: samplingfeatureannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY samplingfeatureannotations
    ADD CONSTRAINT samplingfeatureannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4223 (class 2606 OID 70701)
-- Name: samplingfeatureextensionpropertyvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY samplingfeatureextensionpropertyvalues
    ADD CONSTRAINT samplingfeatureextensionpropertyvalues_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4237 (class 2606 OID 70772)
-- Name: samplingfeatureexternalidentifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY samplingfeatureexternalidentifiers
    ADD CONSTRAINT samplingfeatureexternalidentifiers_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4113 (class 2606 OID 70243)
-- Name: samplingfeatures_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY samplingfeatures
    ADD CONSTRAINT samplingfeatures_pkey PRIMARY KEY (samplingfeatureid);


--
-- TOC entry 4287 (class 2606 OID 70975)
-- Name: sectionresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectionresults
    ADD CONSTRAINT sectionresults_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4078 (class 2606 OID 70077)
-- Name: sectionresultvalueannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectionresultvalueannotations
    ADD CONSTRAINT sectionresultvalueannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4289 (class 2606 OID 70986)
-- Name: sectionresultvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectionresultvalues
    ADD CONSTRAINT sectionresultvalues_pkey PRIMARY KEY (valueid);


--
-- TOC entry 4325 (class 2606 OID 71136)
-- Name: simulations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY simulations
    ADD CONSTRAINT simulations_pkey PRIMARY KEY (simulationid);


--
-- TOC entry 4309 (class 2606 OID 71063)
-- Name: sites_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (samplingfeatureid);


--
-- TOC entry 4311 (class 2606 OID 71068)
-- Name: spatialoffsets_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spatialoffsets
    ADD CONSTRAINT spatialoffsets_pkey PRIMARY KEY (spatialoffsetid);


--
-- TOC entry 4239 (class 2606 OID 70783)
-- Name: spatialreferenceexternalidentifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spatialreferenceexternalidentifiers
    ADD CONSTRAINT spatialreferenceexternalidentifiers_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4313 (class 2606 OID 71079)
-- Name: spatialreferences_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spatialreferences
    ADD CONSTRAINT spatialreferences_pkey PRIMARY KEY (spatialreferenceid);


--
-- TOC entry 4249 (class 2606 OID 70829)
-- Name: specimenbatchpostions_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY specimenbatchpostions
    ADD CONSTRAINT specimenbatchpostions_pkey PRIMARY KEY (featureactionid);


--
-- TOC entry 4315 (class 2606 OID 71087)
-- Name: specimens_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY specimens
    ADD CONSTRAINT specimens_pkey PRIMARY KEY (samplingfeatureid);


--
-- TOC entry 4317 (class 2606 OID 71095)
-- Name: specimentaxonomicclassifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY specimentaxonomicclassifiers
    ADD CONSTRAINT specimentaxonomicclassifiers_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4291 (class 2606 OID 70991)
-- Name: spectraresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spectraresults
    ADD CONSTRAINT spectraresults_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4080 (class 2606 OID 70085)
-- Name: spectraresultvalueannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spectraresultvalueannotations
    ADD CONSTRAINT spectraresultvalueannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4293 (class 2606 OID 71002)
-- Name: spectraresultvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spectraresultvalues
    ADD CONSTRAINT spectraresultvalues_pkey PRIMARY KEY (valueid);


--
-- TOC entry 4241 (class 2606 OID 70794)
-- Name: taxonomicclassifierexternalidentifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taxonomicclassifierexternalidentifiers
    ADD CONSTRAINT taxonomicclassifierexternalidentifiers_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4115 (class 2606 OID 70251)
-- Name: taxonomicclassifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taxonomicclassifiers
    ADD CONSTRAINT taxonomicclassifiers_pkey PRIMARY KEY (taxonomicclassifierid);


--
-- TOC entry 4295 (class 2606 OID 71007)
-- Name: timeseriesresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY timeseriesresults
    ADD CONSTRAINT timeseriesresults_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4082 (class 2606 OID 70093)
-- Name: timeseriesresultvalueannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY timeseriesresultvalueannotations
    ADD CONSTRAINT timeseriesresultvalueannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4297 (class 2606 OID 71018)
-- Name: timeseriesresultvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY timeseriesresultvalues
    ADD CONSTRAINT timeseriesresultvalues_pkey PRIMARY KEY (valueid);


--
-- TOC entry 4299 (class 2606 OID 71023)
-- Name: trajectoryresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trajectoryresults
    ADD CONSTRAINT trajectoryresults_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4084 (class 2606 OID 70101)
-- Name: trajectoryresultvalueannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trajectoryresultvalueannotations
    ADD CONSTRAINT trajectoryresultvalueannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4301 (class 2606 OID 71034)
-- Name: trajectoryresultvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trajectoryresultvalues
    ADD CONSTRAINT trajectoryresultvalues_pkey PRIMARY KEY (valueid);


--
-- TOC entry 4303 (class 2606 OID 71039)
-- Name: transectresults_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transectresults
    ADD CONSTRAINT transectresults_pkey PRIMARY KEY (resultid);


--
-- TOC entry 4086 (class 2606 OID 70109)
-- Name: transectresultvalueannotations_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transectresultvalueannotations
    ADD CONSTRAINT transectresultvalueannotations_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4305 (class 2606 OID 71050)
-- Name: transectresultvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transectresultvalues
    ADD CONSTRAINT transectresultvalues_pkey PRIMARY KEY (valueid);


--
-- TOC entry 4117 (class 2606 OID 70262)
-- Name: units_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_pkey PRIMARY KEY (unitsid);


--
-- TOC entry 4225 (class 2606 OID 70709)
-- Name: variableextensionpropertyvalues_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY variableextensionpropertyvalues
    ADD CONSTRAINT variableextensionpropertyvalues_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4243 (class 2606 OID 70805)
-- Name: variableexternalidentifiers_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY variableexternalidentifiers
    ADD CONSTRAINT variableexternalidentifiers_pkey PRIMARY KEY (bridgeid);


--
-- TOC entry 4119 (class 2606 OID 70273)
-- Name: variables_pkey; Type: CONSTRAINT; Schema: odm2; Owner: -; Tablespace: 
--

ALTER TABLE ONLY variables
    ADD CONSTRAINT variables_pkey PRIMARY KEY (variableid);


--
-- TOC entry 4111 (class 1259 OID 72583)
-- Name: idx_samplingfeature_featuregeom; Type: INDEX; Schema: odm2; Owner: -; Tablespace: 
--

CREATE INDEX idx_samplingfeature_featuregeom ON samplingfeatures USING gist (featuregeometry);


--
-- TOC entry 4326 (class 2606 OID 71137)
-- Name: fk_actionannotations_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actionannotations
    ADD CONSTRAINT fk_actionannotations_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4327 (class 2606 OID 71142)
-- Name: fk_actionannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actionannotations
    ADD CONSTRAINT fk_actionannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4465 (class 2606 OID 71832)
-- Name: fk_actiondirectives_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actiondirectives
    ADD CONSTRAINT fk_actiondirectives_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4466 (class 2606 OID 71837)
-- Name: fk_actiondirectives_directives; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actiondirectives
    ADD CONSTRAINT fk_actiondirectives_directives FOREIGN KEY (directiveid) REFERENCES directives(directiveid) ON DELETE CASCADE;


--
-- TOC entry 4434 (class 2606 OID 71677)
-- Name: fk_actionextensionpropertyvalues_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actionextensionpropertyvalues
    ADD CONSTRAINT fk_actionextensionpropertyvalues_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4435 (class 2606 OID 71682)
-- Name: fk_actionextensionpropertyvalues_extensionproperties; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actionextensionpropertyvalues
    ADD CONSTRAINT fk_actionextensionpropertyvalues_extensionproperties FOREIGN KEY (propertyid) REFERENCES extensionproperties(propertyid) ON DELETE CASCADE;


--
-- TOC entry 4357 (class 2606 OID 71292)
-- Name: fk_actionpeople_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actionby
    ADD CONSTRAINT fk_actionpeople_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4358 (class 2606 OID 71297)
-- Name: fk_actionpeople_affiliations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actionby
    ADD CONSTRAINT fk_actionpeople_affiliations FOREIGN KEY (affiliationid) REFERENCES affiliations(affiliationid) ON DELETE CASCADE;


--
-- TOC entry 4359 (class 2606 OID 71302)
-- Name: fk_actions_cv_actiontype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT fk_actions_cv_actiontype FOREIGN KEY (actiontypecv) REFERENCES cv_actiontype(name) ON DELETE CASCADE;


--
-- TOC entry 4360 (class 2606 OID 71307)
-- Name: fk_actions_methods; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT fk_actions_methods FOREIGN KEY (methodid) REFERENCES methods(methodid) ON DELETE CASCADE;


--
-- TOC entry 4361 (class 2606 OID 71312)
-- Name: fk_affiliations_organizations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY affiliations
    ADD CONSTRAINT fk_affiliations_organizations FOREIGN KEY (organizationid) REFERENCES organizations(organizationid) ON DELETE CASCADE;


--
-- TOC entry 4362 (class 2606 OID 71317)
-- Name: fk_affiliations_people; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY affiliations
    ADD CONSTRAINT fk_affiliations_people FOREIGN KEY (personid) REFERENCES people(personid) ON DELETE CASCADE;


--
-- TOC entry 4328 (class 2606 OID 71147)
-- Name: fk_annotations_citations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY annotations
    ADD CONSTRAINT fk_annotations_citations FOREIGN KEY (citationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4329 (class 2606 OID 71152)
-- Name: fk_annotations_cv_annotationtype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY annotations
    ADD CONSTRAINT fk_annotations_cv_annotationtype FOREIGN KEY (annotationtypecv) REFERENCES cv_annotationtype(name) ON DELETE CASCADE;


--
-- TOC entry 4330 (class 2606 OID 71157)
-- Name: fk_annotations_people; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY annotations
    ADD CONSTRAINT fk_annotations_people FOREIGN KEY (annotatorid) REFERENCES people(personid) ON DELETE CASCADE;


--
-- TOC entry 4469 (class 2606 OID 71852)
-- Name: fk_authorlists_citations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY authorlists
    ADD CONSTRAINT fk_authorlists_citations FOREIGN KEY (citationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4470 (class 2606 OID 71857)
-- Name: fk_authorlists_people; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY authorlists
    ADD CONSTRAINT fk_authorlists_people FOREIGN KEY (personid) REFERENCES people(personid) ON DELETE CASCADE;


--
-- TOC entry 4405 (class 2606 OID 71532)
-- Name: fk_calibrationactions_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY calibrationactions
    ADD CONSTRAINT fk_calibrationactions_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4406 (class 2606 OID 71537)
-- Name: fk_calibrationactions_instrumentoutputvariables; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY calibrationactions
    ADD CONSTRAINT fk_calibrationactions_instrumentoutputvariables FOREIGN KEY (instrumentoutputvariableid) REFERENCES instrumentoutputvariables(instrumentoutputvariableid) ON DELETE CASCADE;


--
-- TOC entry 4407 (class 2606 OID 71542)
-- Name: fk_calibrationreferenceequipment_calibrationactions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY calibrationreferenceequipment
    ADD CONSTRAINT fk_calibrationreferenceequipment_calibrationactions FOREIGN KEY (actionid) REFERENCES calibrationactions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4408 (class 2606 OID 71547)
-- Name: fk_calibrationreferenceequipment_equipment; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY calibrationreferenceequipment
    ADD CONSTRAINT fk_calibrationreferenceequipment_equipment FOREIGN KEY (equipmentid) REFERENCES equipment(equipmentid) ON DELETE CASCADE;


--
-- TOC entry 4409 (class 2606 OID 71552)
-- Name: fk_calibrationstandards_calibrationactions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY calibrationstandards
    ADD CONSTRAINT fk_calibrationstandards_calibrationactions FOREIGN KEY (actionid) REFERENCES calibrationactions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4491 (class 2606 OID 71962)
-- Name: fk_categoricalresults_cv_qualitycode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY categoricalresults
    ADD CONSTRAINT fk_categoricalresults_cv_qualitycode FOREIGN KEY (qualitycodecv) REFERENCES cv_qualitycode(name) ON DELETE CASCADE;


--
-- TOC entry 4492 (class 2606 OID 71967)
-- Name: fk_categoricalresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY categoricalresults
    ADD CONSTRAINT fk_categoricalresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4493 (class 2606 OID 71972)
-- Name: fk_categoricalresults_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY categoricalresults
    ADD CONSTRAINT fk_categoricalresults_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4331 (class 2606 OID 71162)
-- Name: fk_categoricalresultvalueannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY categoricalresultvalueannotations
    ADD CONSTRAINT fk_categoricalresultvalueannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4332 (class 2606 OID 71167)
-- Name: fk_categoricalresultvalueannotations_categoricalresultvalues; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY categoricalresultvalueannotations
    ADD CONSTRAINT fk_categoricalresultvalueannotations_categoricalresultvalues FOREIGN KEY (valueid) REFERENCES categoricalresultvalues(valueid) ON DELETE CASCADE;


--
-- TOC entry 4494 (class 2606 OID 71977)
-- Name: fk_categoricalresultvalues_categoricalresults; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY categoricalresultvalues
    ADD CONSTRAINT fk_categoricalresultvalues_categoricalresults FOREIGN KEY (resultid) REFERENCES categoricalresults(resultid) ON DELETE CASCADE;


--
-- TOC entry 4436 (class 2606 OID 71687)
-- Name: fk_citationextensionpropertyvalues_citations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY citationextensionpropertyvalues
    ADD CONSTRAINT fk_citationextensionpropertyvalues_citations FOREIGN KEY (citationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4437 (class 2606 OID 71692)
-- Name: fk_citationextensionpropertyvalues_extensionproperties; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY citationextensionpropertyvalues
    ADD CONSTRAINT fk_citationextensionpropertyvalues_extensionproperties FOREIGN KEY (propertyid) REFERENCES extensionproperties(propertyid) ON DELETE CASCADE;


--
-- TOC entry 4448 (class 2606 OID 71747)
-- Name: fk_citationexternalidentifiers_citations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY citationexternalidentifiers
    ADD CONSTRAINT fk_citationexternalidentifiers_citations FOREIGN KEY (citationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4449 (class 2606 OID 71752)
-- Name: fk_citationexternalidentifiers_externalidentifiersystems; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY citationexternalidentifiers
    ADD CONSTRAINT fk_citationexternalidentifiers_externalidentifiersystems FOREIGN KEY (externalidentifiersystemid) REFERENCES externalidentifiersystems(externalidentifiersystemid) ON DELETE CASCADE;


--
-- TOC entry 4411 (class 2606 OID 71562)
-- Name: fk_dataloggerfilecolumns_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerfilecolumns
    ADD CONSTRAINT fk_dataloggerfilecolumns_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4412 (class 2606 OID 71567)
-- Name: fk_dataloggerfilecolumns_dataloggerfiles; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerfilecolumns
    ADD CONSTRAINT fk_dataloggerfilecolumns_dataloggerfiles FOREIGN KEY (dataloggerfileid) REFERENCES dataloggerfiles(dataloggerfileid) ON DELETE CASCADE;


--
-- TOC entry 4413 (class 2606 OID 71572)
-- Name: fk_dataloggerfilecolumns_instrumentoutputvariables; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerfilecolumns
    ADD CONSTRAINT fk_dataloggerfilecolumns_instrumentoutputvariables FOREIGN KEY (instrumentoutputvariableid) REFERENCES instrumentoutputvariables(instrumentoutputvariableid) ON DELETE CASCADE;


--
-- TOC entry 4414 (class 2606 OID 71577)
-- Name: fk_dataloggerfilecolumns_recordingunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerfilecolumns
    ADD CONSTRAINT fk_dataloggerfilecolumns_recordingunits FOREIGN KEY (recordingintervalunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4415 (class 2606 OID 71582)
-- Name: fk_dataloggerfilecolumns_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerfilecolumns
    ADD CONSTRAINT fk_dataloggerfilecolumns_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4416 (class 2606 OID 71587)
-- Name: fk_dataloggerfilecolumns_scanunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerfilecolumns
    ADD CONSTRAINT fk_dataloggerfilecolumns_scanunits FOREIGN KEY (scanintervalunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4417 (class 2606 OID 71592)
-- Name: fk_dataloggerfiles_dataloggerprogramfiles; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerfiles
    ADD CONSTRAINT fk_dataloggerfiles_dataloggerprogramfiles FOREIGN KEY (programid) REFERENCES dataloggerprogramfiles(programid) ON DELETE CASCADE;


--
-- TOC entry 4418 (class 2606 OID 71597)
-- Name: fk_dataloggerprogramfiles_affiliations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataloggerprogramfiles
    ADD CONSTRAINT fk_dataloggerprogramfiles_affiliations FOREIGN KEY (affiliationid) REFERENCES affiliations(affiliationid) ON DELETE CASCADE;


--
-- TOC entry 4392 (class 2606 OID 71467)
-- Name: fk_dataquality_cv_dataqualitytype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataquality
    ADD CONSTRAINT fk_dataquality_cv_dataqualitytype FOREIGN KEY (dataqualitytypecv) REFERENCES cv_dataqualitytype(name) ON DELETE CASCADE;


--
-- TOC entry 4393 (class 2606 OID 71472)
-- Name: fk_dataquality_units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY dataquality
    ADD CONSTRAINT fk_dataquality_units FOREIGN KEY (dataqualityvalueunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4471 (class 2606 OID 71862)
-- Name: fk_datasetcitations_citations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY datasetcitations
    ADD CONSTRAINT fk_datasetcitations_citations FOREIGN KEY (citationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4472 (class 2606 OID 71867)
-- Name: fk_datasetcitations_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY datasetcitations
    ADD CONSTRAINT fk_datasetcitations_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4473 (class 2606 OID 71872)
-- Name: fk_datasetcitations_datasets; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY datasetcitations
    ADD CONSTRAINT fk_datasetcitations_datasets FOREIGN KEY (datasetid) REFERENCES datasets(datasetid) ON DELETE CASCADE;


--
-- TOC entry 4363 (class 2606 OID 71322)
-- Name: fk_datasets_cv_datasettypecv; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY datasets
    ADD CONSTRAINT fk_datasets_cv_datasettypecv FOREIGN KEY (datasettypecv) REFERENCES cv_datasettypecv(name) ON DELETE CASCADE;


--
-- TOC entry 4364 (class 2606 OID 71327)
-- Name: fk_datasetsresults_datasets; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY datasetsresults
    ADD CONSTRAINT fk_datasetsresults_datasets FOREIGN KEY (datasetid) REFERENCES datasets(datasetid) ON DELETE CASCADE;


--
-- TOC entry 4365 (class 2606 OID 71332)
-- Name: fk_datasetsresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY datasetsresults
    ADD CONSTRAINT fk_datasetsresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4467 (class 2606 OID 71842)
-- Name: fk_directives_cv_directivetype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY directives
    ADD CONSTRAINT fk_directives_cv_directivetype FOREIGN KEY (directivetypecv) REFERENCES cv_directivetype(name) ON DELETE CASCADE;


--
-- TOC entry 4419 (class 2606 OID 71602)
-- Name: fk_equipment_cv_equipmenttype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT fk_equipment_cv_equipmenttype FOREIGN KEY (equipmenttypecv) REFERENCES cv_equipmenttype(name) ON DELETE CASCADE;


--
-- TOC entry 4420 (class 2606 OID 71607)
-- Name: fk_equipment_equipmentmodels; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT fk_equipment_equipmentmodels FOREIGN KEY (equipmentmodelid) REFERENCES equipmentmodels(equipmentmodelid) ON DELETE CASCADE;


--
-- TOC entry 4421 (class 2606 OID 71612)
-- Name: fk_equipment_organizations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT fk_equipment_organizations FOREIGN KEY (equipmentvendorid) REFERENCES organizations(organizationid) ON DELETE CASCADE;


--
-- TOC entry 4422 (class 2606 OID 71617)
-- Name: fk_equipment_people; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipment
    ADD CONSTRAINT fk_equipment_people FOREIGN KEY (equipmentownerid) REFERENCES people(personid) ON DELETE CASCADE;


--
-- TOC entry 4424 (class 2606 OID 71627)
-- Name: fk_equipmentactions_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipmentused
    ADD CONSTRAINT fk_equipmentactions_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4425 (class 2606 OID 71632)
-- Name: fk_equipmentactions_equipment; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipmentused
    ADD CONSTRAINT fk_equipmentactions_equipment FOREIGN KEY (equipmentid) REFERENCES equipment(equipmentid) ON DELETE CASCADE;


--
-- TOC entry 4333 (class 2606 OID 71172)
-- Name: fk_equipmentannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipmentannotations
    ADD CONSTRAINT fk_equipmentannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4334 (class 2606 OID 71177)
-- Name: fk_equipmentannotations_equipment; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipmentannotations
    ADD CONSTRAINT fk_equipmentannotations_equipment FOREIGN KEY (equipmentid) REFERENCES equipment(equipmentid) ON DELETE CASCADE;


--
-- TOC entry 4423 (class 2606 OID 71622)
-- Name: fk_equipmentmodels_organizations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY equipmentmodels
    ADD CONSTRAINT fk_equipmentmodels_organizations FOREIGN KEY (modelmanufacturerid) REFERENCES organizations(organizationid) ON DELETE CASCADE;


--
-- TOC entry 4438 (class 2606 OID 71697)
-- Name: fk_extensionproperties_cv_propertydatatype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY extensionproperties
    ADD CONSTRAINT fk_extensionproperties_cv_propertydatatype FOREIGN KEY (propertydatatypecv) REFERENCES cv_propertydatatype(name) ON DELETE CASCADE;


--
-- TOC entry 4439 (class 2606 OID 71702)
-- Name: fk_extensionproperties_units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY extensionproperties
    ADD CONSTRAINT fk_extensionproperties_units FOREIGN KEY (propertyunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4450 (class 2606 OID 71757)
-- Name: fk_externalidentifiersystems_organizations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY externalidentifiersystems
    ADD CONSTRAINT fk_externalidentifiersystems_organizations FOREIGN KEY (identifiersystemorganizationid) REFERENCES organizations(organizationid) ON DELETE CASCADE;


--
-- TOC entry 4366 (class 2606 OID 71337)
-- Name: fk_featureactions_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY featureactions
    ADD CONSTRAINT fk_featureactions_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4367 (class 2606 OID 71342)
-- Name: fk_featureactions_samplingfeatures; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY featureactions
    ADD CONSTRAINT fk_featureactions_samplingfeatures FOREIGN KEY (samplingfeatureid) REFERENCES samplingfeatures(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4592 (class 2606 OID 72467)
-- Name: fk_featureparents_featuresparent; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedfeatures
    ADD CONSTRAINT fk_featureparents_featuresparent FOREIGN KEY (relatedfeatureid) REFERENCES samplingfeatures(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4593 (class 2606 OID 72472)
-- Name: fk_featureparents_samplingfeatures; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedfeatures
    ADD CONSTRAINT fk_featureparents_samplingfeatures FOREIGN KEY (samplingfeatureid) REFERENCES samplingfeatures(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4594 (class 2606 OID 72477)
-- Name: fk_featureparents_spatialoffsets; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedfeatures
    ADD CONSTRAINT fk_featureparents_spatialoffsets FOREIGN KEY (spatialoffsetid) REFERENCES spatialoffsets(spatialoffsetid) ON DELETE CASCADE;


--
-- TOC entry 4410 (class 2606 OID 71557)
-- Name: fk_fieldcalibrationstandards_referencematerials; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY calibrationstandards
    ADD CONSTRAINT fk_fieldcalibrationstandards_referencematerials FOREIGN KEY (referencematerialid) REFERENCES referencematerials(referencematerialid) ON DELETE CASCADE;


--
-- TOC entry 4426 (class 2606 OID 71637)
-- Name: fk_instrumentoutputvariables_equipmentmodels; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY instrumentoutputvariables
    ADD CONSTRAINT fk_instrumentoutputvariables_equipmentmodels FOREIGN KEY (modelid) REFERENCES equipmentmodels(equipmentmodelid) ON DELETE CASCADE;


--
-- TOC entry 4427 (class 2606 OID 71642)
-- Name: fk_instrumentoutputvariables_methods; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY instrumentoutputvariables
    ADD CONSTRAINT fk_instrumentoutputvariables_methods FOREIGN KEY (instrumentmethodid) REFERENCES methods(methodid) ON DELETE CASCADE;


--
-- TOC entry 4428 (class 2606 OID 71647)
-- Name: fk_instrumentoutputvariables_units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY instrumentoutputvariables
    ADD CONSTRAINT fk_instrumentoutputvariables_units FOREIGN KEY (instrumentrawoutputunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4429 (class 2606 OID 71652)
-- Name: fk_instrumentoutputvariables_variables; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY instrumentoutputvariables
    ADD CONSTRAINT fk_instrumentoutputvariables_variables FOREIGN KEY (variableid) REFERENCES variables(variableid) ON DELETE CASCADE;


--
-- TOC entry 4430 (class 2606 OID 71657)
-- Name: fk_maintenanceactions_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY maintenanceactions
    ADD CONSTRAINT fk_maintenanceactions_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4495 (class 2606 OID 71982)
-- Name: fk_measurementresults_aiunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT fk_measurementresults_aiunits FOREIGN KEY (timeaggregationintervalunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4496 (class 2606 OID 71987)
-- Name: fk_measurementresults_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT fk_measurementresults_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4497 (class 2606 OID 71992)
-- Name: fk_measurementresults_cv_censorcode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT fk_measurementresults_cv_censorcode FOREIGN KEY (censorcodecv) REFERENCES cv_censorcode(name) ON DELETE CASCADE;


--
-- TOC entry 4498 (class 2606 OID 71997)
-- Name: fk_measurementresults_cv_qualitycode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT fk_measurementresults_cv_qualitycode FOREIGN KEY (qualitycodecv) REFERENCES cv_qualitycode(name) ON DELETE CASCADE;


--
-- TOC entry 4499 (class 2606 OID 72002)
-- Name: fk_measurementresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT fk_measurementresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4500 (class 2606 OID 72007)
-- Name: fk_measurementresults_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT fk_measurementresults_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4501 (class 2606 OID 72012)
-- Name: fk_measurementresults_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT fk_measurementresults_xunits FOREIGN KEY (xlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4502 (class 2606 OID 72017)
-- Name: fk_measurementresults_yunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT fk_measurementresults_yunits FOREIGN KEY (ylocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4503 (class 2606 OID 72022)
-- Name: fk_measurementresults_zunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresults
    ADD CONSTRAINT fk_measurementresults_zunits FOREIGN KEY (zlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4335 (class 2606 OID 71182)
-- Name: fk_measurementresultvalueannotations_measurementresultvalues; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresultvalueannotations
    ADD CONSTRAINT fk_measurementresultvalueannotations_measurementresultvalues FOREIGN KEY (valueid) REFERENCES measurementresultvalues(valueid) ON DELETE CASCADE;


--
-- TOC entry 4504 (class 2606 OID 72027)
-- Name: fk_measurementresultvalues_measurementresults; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresultvalues
    ADD CONSTRAINT fk_measurementresultvalues_measurementresults FOREIGN KEY (resultid) REFERENCES measurementresults(resultid) ON DELETE CASCADE;


--
-- TOC entry 4337 (class 2606 OID 71192)
-- Name: fk_methodannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodannotations
    ADD CONSTRAINT fk_methodannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4338 (class 2606 OID 71197)
-- Name: fk_methodannotations_methods; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodannotations
    ADD CONSTRAINT fk_methodannotations_methods FOREIGN KEY (methodid) REFERENCES methods(methodid) ON DELETE CASCADE;


--
-- TOC entry 4474 (class 2606 OID 71877)
-- Name: fk_methodcitations_citations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodcitations
    ADD CONSTRAINT fk_methodcitations_citations FOREIGN KEY (citationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4475 (class 2606 OID 71882)
-- Name: fk_methodcitations_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodcitations
    ADD CONSTRAINT fk_methodcitations_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4476 (class 2606 OID 71887)
-- Name: fk_methodcitations_methods; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodcitations
    ADD CONSTRAINT fk_methodcitations_methods FOREIGN KEY (methodid) REFERENCES methods(methodid) ON DELETE CASCADE;


--
-- TOC entry 4440 (class 2606 OID 71707)
-- Name: fk_methodextensionpropertyvalues_extensionproperties; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodextensionpropertyvalues
    ADD CONSTRAINT fk_methodextensionpropertyvalues_extensionproperties FOREIGN KEY (propertyid) REFERENCES extensionproperties(propertyid) ON DELETE CASCADE;


--
-- TOC entry 4441 (class 2606 OID 71712)
-- Name: fk_methodextensionpropertyvalues_methods; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodextensionpropertyvalues
    ADD CONSTRAINT fk_methodextensionpropertyvalues_methods FOREIGN KEY (methodid) REFERENCES methods(methodid) ON DELETE CASCADE;


--
-- TOC entry 4451 (class 2606 OID 71762)
-- Name: fk_methodexternalidentifiers_externalidentifiersystems; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodexternalidentifiers
    ADD CONSTRAINT fk_methodexternalidentifiers_externalidentifiersystems FOREIGN KEY (externalidentifiersystemid) REFERENCES externalidentifiersystems(externalidentifiersystemid) ON DELETE CASCADE;


--
-- TOC entry 4452 (class 2606 OID 71767)
-- Name: fk_methodexternalidentifiers_methods; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methodexternalidentifiers
    ADD CONSTRAINT fk_methodexternalidentifiers_methods FOREIGN KEY (methodid) REFERENCES methods(methodid) ON DELETE CASCADE;


--
-- TOC entry 4368 (class 2606 OID 71347)
-- Name: fk_methods_cv_methodtype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methods
    ADD CONSTRAINT fk_methods_cv_methodtype FOREIGN KEY (methodtypecv) REFERENCES cv_methodtype(name) ON DELETE CASCADE;


--
-- TOC entry 4369 (class 2606 OID 71352)
-- Name: fk_methods_organizations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY methods
    ADD CONSTRAINT fk_methods_organizations FOREIGN KEY (organizationid) REFERENCES organizations(organizationid) ON DELETE CASCADE;


--
-- TOC entry 4609 (class 2606 OID 72552)
-- Name: fk_modelaffiliations_affiliations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY modelaffiliations
    ADD CONSTRAINT fk_modelaffiliations_affiliations FOREIGN KEY (affiliationid) REFERENCES affiliations(affiliationid) ON DELETE CASCADE;


--
-- TOC entry 4610 (class 2606 OID 72557)
-- Name: fk_modelaffiliations_models; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY modelaffiliations
    ADD CONSTRAINT fk_modelaffiliations_models FOREIGN KEY (modelid) REFERENCES models(modelid) ON DELETE CASCADE;


--
-- TOC entry 4370 (class 2606 OID 71357)
-- Name: fk_organizations_cv_organizationtype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT fk_organizations_cv_organizationtype FOREIGN KEY (organizationtypecv) REFERENCES cv_organizationtype(name) ON DELETE CASCADE;


--
-- TOC entry 4371 (class 2606 OID 71362)
-- Name: fk_organizations_organizations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT fk_organizations_organizations FOREIGN KEY (parentorganizationid) REFERENCES organizations(organizationid) ON DELETE CASCADE;


--
-- TOC entry 4386 (class 2606 OID 71437)
-- Name: fk_parenttaxon_taxon; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY taxonomicclassifiers
    ADD CONSTRAINT fk_parenttaxon_taxon FOREIGN KEY (parenttaxonomicclassifierid) REFERENCES taxonomicclassifiers(taxonomicclassifierid) ON DELETE CASCADE;


--
-- TOC entry 4453 (class 2606 OID 71772)
-- Name: fk_personexternalidentifiers_externalidentifiersystems; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY personexternalidentifiers
    ADD CONSTRAINT fk_personexternalidentifiers_externalidentifiersystems FOREIGN KEY (externalidentifiersystemid) REFERENCES externalidentifiersystems(externalidentifiersystemid) ON DELETE CASCADE;


--
-- TOC entry 4454 (class 2606 OID 71777)
-- Name: fk_personexternalidentifiers_people; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY personexternalidentifiers
    ADD CONSTRAINT fk_personexternalidentifiers_people FOREIGN KEY (personid) REFERENCES people(personid) ON DELETE CASCADE;


--
-- TOC entry 4505 (class 2606 OID 72032)
-- Name: fk_pointcoverageresults_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresults
    ADD CONSTRAINT fk_pointcoverageresults_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4506 (class 2606 OID 72037)
-- Name: fk_pointcoverageresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresults
    ADD CONSTRAINT fk_pointcoverageresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4507 (class 2606 OID 72042)
-- Name: fk_pointcoverageresults_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresults
    ADD CONSTRAINT fk_pointcoverageresults_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4508 (class 2606 OID 72047)
-- Name: fk_pointcoverageresults_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresults
    ADD CONSTRAINT fk_pointcoverageresults_xunits FOREIGN KEY (intendedxspacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4509 (class 2606 OID 72052)
-- Name: fk_pointcoverageresults_yunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresults
    ADD CONSTRAINT fk_pointcoverageresults_yunits FOREIGN KEY (intendedyspacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4510 (class 2606 OID 72057)
-- Name: fk_pointcoverageresults_zunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresults
    ADD CONSTRAINT fk_pointcoverageresults_zunits FOREIGN KEY (zlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4339 (class 2606 OID 71202)
-- Name: fk_pointcoverageresultvalueannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresultvalueannotations
    ADD CONSTRAINT fk_pointcoverageresultvalueannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4340 (class 2606 OID 71207)
-- Name: fk_pointcoverageresultvalueannotations_pointcoverageresultvalue; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresultvalueannotations
    ADD CONSTRAINT fk_pointcoverageresultvalueannotations_pointcoverageresultvalue FOREIGN KEY (valueid) REFERENCES pointcoverageresultvalues(valueid) ON DELETE CASCADE;


--
-- TOC entry 4511 (class 2606 OID 72062)
-- Name: fk_pointcoverageresultvalues_cv_censorcode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresultvalues
    ADD CONSTRAINT fk_pointcoverageresultvalues_cv_censorcode FOREIGN KEY (censorcodecv) REFERENCES cv_censorcode(name) ON DELETE CASCADE;


--
-- TOC entry 4512 (class 2606 OID 72067)
-- Name: fk_pointcoverageresultvalues_cv_qualitycode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresultvalues
    ADD CONSTRAINT fk_pointcoverageresultvalues_cv_qualitycode FOREIGN KEY (qualitycodecv) REFERENCES cv_qualitycode(name) ON DELETE CASCADE;


--
-- TOC entry 4513 (class 2606 OID 72072)
-- Name: fk_pointcoverageresultvalues_pointcoverageresults; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresultvalues
    ADD CONSTRAINT fk_pointcoverageresultvalues_pointcoverageresults FOREIGN KEY (resultid) REFERENCES pointcoverageresults(resultid) ON DELETE CASCADE;


--
-- TOC entry 4514 (class 2606 OID 72077)
-- Name: fk_pointcoverageresultvalues_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresultvalues
    ADD CONSTRAINT fk_pointcoverageresultvalues_xunits FOREIGN KEY (xlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4515 (class 2606 OID 72082)
-- Name: fk_pointcoverageresultvalues_yunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY pointcoverageresultvalues
    ADD CONSTRAINT fk_pointcoverageresultvalues_yunits FOREIGN KEY (ylocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4516 (class 2606 OID 72087)
-- Name: fk_profileresults_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresults
    ADD CONSTRAINT fk_profileresults_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4517 (class 2606 OID 72092)
-- Name: fk_profileresults_dunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresults
    ADD CONSTRAINT fk_profileresults_dunits FOREIGN KEY (intendedzspacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4518 (class 2606 OID 72097)
-- Name: fk_profileresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresults
    ADD CONSTRAINT fk_profileresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4519 (class 2606 OID 72102)
-- Name: fk_profileresults_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresults
    ADD CONSTRAINT fk_profileresults_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4520 (class 2606 OID 72107)
-- Name: fk_profileresults_tunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresults
    ADD CONSTRAINT fk_profileresults_tunits FOREIGN KEY (intendedtimespacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4521 (class 2606 OID 72112)
-- Name: fk_profileresults_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresults
    ADD CONSTRAINT fk_profileresults_xunits FOREIGN KEY (xlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4522 (class 2606 OID 72117)
-- Name: fk_profileresults_yunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresults
    ADD CONSTRAINT fk_profileresults_yunits FOREIGN KEY (ylocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4341 (class 2606 OID 71212)
-- Name: fk_profileresultvalueannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresultvalueannotations
    ADD CONSTRAINT fk_profileresultvalueannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4342 (class 2606 OID 71217)
-- Name: fk_profileresultvalueannotations_profileresultvalues; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresultvalueannotations
    ADD CONSTRAINT fk_profileresultvalueannotations_profileresultvalues FOREIGN KEY (valueid) REFERENCES profileresultvalues(valueid) ON DELETE CASCADE;


--
-- TOC entry 4523 (class 2606 OID 72122)
-- Name: fk_profileresultvalues_aiunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresultvalues
    ADD CONSTRAINT fk_profileresultvalues_aiunits FOREIGN KEY (timeaggregationintervalunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4524 (class 2606 OID 72127)
-- Name: fk_profileresultvalues_cv_censorcode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresultvalues
    ADD CONSTRAINT fk_profileresultvalues_cv_censorcode FOREIGN KEY (censorcodecv) REFERENCES cv_censorcode(name) ON DELETE CASCADE;


--
-- TOC entry 4525 (class 2606 OID 72132)
-- Name: fk_profileresultvalues_cv_qualitycode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresultvalues
    ADD CONSTRAINT fk_profileresultvalues_cv_qualitycode FOREIGN KEY (qualitycodecv) REFERENCES cv_qualitycode(name) ON DELETE CASCADE;


--
-- TOC entry 4526 (class 2606 OID 72137)
-- Name: fk_profileresultvalues_dunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresultvalues
    ADD CONSTRAINT fk_profileresultvalues_dunits FOREIGN KEY (zlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4527 (class 2606 OID 72142)
-- Name: fk_profileresultvalues_profileresults; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY profileresultvalues
    ADD CONSTRAINT fk_profileresultvalues_profileresults FOREIGN KEY (resultid) REFERENCES profileresults(resultid) ON DELETE CASCADE;


--
-- TOC entry 4394 (class 2606 OID 71477)
-- Name: fk_referencematerials_cv_referencematerialmedium; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerials
    ADD CONSTRAINT fk_referencematerials_cv_referencematerialmedium FOREIGN KEY (referencematerialmediumcv) REFERENCES cv_referencematerialmedium(name) ON DELETE CASCADE;


--
-- TOC entry 4395 (class 2606 OID 71482)
-- Name: fk_referencematerials_organizations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerials
    ADD CONSTRAINT fk_referencematerials_organizations FOREIGN KEY (referencematerialorganizationid) REFERENCES organizations(organizationid) ON DELETE CASCADE;


--
-- TOC entry 4396 (class 2606 OID 71487)
-- Name: fk_referencematerials_samplingfeatures; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerials
    ADD CONSTRAINT fk_referencematerials_samplingfeatures FOREIGN KEY (samplingfeatureid) REFERENCES samplingfeatures(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4397 (class 2606 OID 71492)
-- Name: fk_referencematerialvalues_citations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerialvalues
    ADD CONSTRAINT fk_referencematerialvalues_citations FOREIGN KEY (citationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4398 (class 2606 OID 71497)
-- Name: fk_referencematerialvalues_referencematerials; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerialvalues
    ADD CONSTRAINT fk_referencematerialvalues_referencematerials FOREIGN KEY (referencematerialid) REFERENCES referencematerials(referencematerialid) ON DELETE CASCADE;


--
-- TOC entry 4399 (class 2606 OID 71502)
-- Name: fk_referencematerialvalues_units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerialvalues
    ADD CONSTRAINT fk_referencematerialvalues_units FOREIGN KEY (unitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4400 (class 2606 OID 71507)
-- Name: fk_referencematerialvalues_variables; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerialvalues
    ADD CONSTRAINT fk_referencematerialvalues_variables FOREIGN KEY (variableid) REFERENCES variables(variableid) ON DELETE CASCADE;


--
-- TOC entry 4455 (class 2606 OID 71782)
-- Name: fk_refmaterialextidentifiers_extidentifiersystems; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerialexternalidentifiers
    ADD CONSTRAINT fk_refmaterialextidentifiers_extidentifiersystems FOREIGN KEY (externalidentifiersystemid) REFERENCES externalidentifiersystems(externalidentifiersystemid) ON DELETE CASCADE;


--
-- TOC entry 4456 (class 2606 OID 71787)
-- Name: fk_refmaterialextidentifiers_refmaterials; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY referencematerialexternalidentifiers
    ADD CONSTRAINT fk_refmaterialextidentifiers_refmaterials FOREIGN KEY (referencematerialid) REFERENCES referencematerials(referencematerialid) ON DELETE CASCADE;


--
-- TOC entry 4372 (class 2606 OID 71367)
-- Name: fk_relatedactions_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedactions
    ADD CONSTRAINT fk_relatedactions_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4373 (class 2606 OID 71372)
-- Name: fk_relatedactions_actions_arerelated; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedactions
    ADD CONSTRAINT fk_relatedactions_actions_arerelated FOREIGN KEY (relatedactionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4374 (class 2606 OID 71377)
-- Name: fk_relatedactions_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedactions
    ADD CONSTRAINT fk_relatedactions_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4477 (class 2606 OID 71892)
-- Name: fk_relatedannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedannotations
    ADD CONSTRAINT fk_relatedannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4478 (class 2606 OID 71897)
-- Name: fk_relatedannotations_annotations_arerelated; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedannotations
    ADD CONSTRAINT fk_relatedannotations_annotations_arerelated FOREIGN KEY (relatedannotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4479 (class 2606 OID 71902)
-- Name: fk_relatedannotations_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedannotations
    ADD CONSTRAINT fk_relatedannotations_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4480 (class 2606 OID 71907)
-- Name: fk_relatedcitations_citations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedcitations
    ADD CONSTRAINT fk_relatedcitations_citations FOREIGN KEY (citationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4481 (class 2606 OID 71912)
-- Name: fk_relatedcitations_citations_arerelated; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedcitations
    ADD CONSTRAINT fk_relatedcitations_citations_arerelated FOREIGN KEY (relatedcitationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4482 (class 2606 OID 71917)
-- Name: fk_relatedcitations_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedcitations
    ADD CONSTRAINT fk_relatedcitations_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4483 (class 2606 OID 71922)
-- Name: fk_relateddatasets_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relateddatasets
    ADD CONSTRAINT fk_relateddatasets_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4484 (class 2606 OID 71927)
-- Name: fk_relateddatasets_datasets; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relateddatasets
    ADD CONSTRAINT fk_relateddatasets_datasets FOREIGN KEY (datasetid) REFERENCES datasets(datasetid) ON DELETE CASCADE;


--
-- TOC entry 4485 (class 2606 OID 71932)
-- Name: fk_relateddatasets_datasets_arerelated; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relateddatasets
    ADD CONSTRAINT fk_relateddatasets_datasets_arerelated FOREIGN KEY (relateddatasetid) REFERENCES datasets(datasetid) ON DELETE CASCADE;


--
-- TOC entry 4431 (class 2606 OID 71662)
-- Name: fk_relatedequipment_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedequipment
    ADD CONSTRAINT fk_relatedequipment_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4432 (class 2606 OID 71667)
-- Name: fk_relatedequipment_equipment; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedequipment
    ADD CONSTRAINT fk_relatedequipment_equipment FOREIGN KEY (equipmentid) REFERENCES equipment(equipmentid) ON DELETE CASCADE;


--
-- TOC entry 4433 (class 2606 OID 71672)
-- Name: fk_relatedequipment_equipment_arerelated; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedequipment
    ADD CONSTRAINT fk_relatedequipment_equipment_arerelated FOREIGN KEY (relatedequipmentid) REFERENCES equipment(equipmentid) ON DELETE CASCADE;


--
-- TOC entry 4595 (class 2606 OID 72482)
-- Name: fk_relatedfeatures_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedfeatures
    ADD CONSTRAINT fk_relatedfeatures_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4611 (class 2606 OID 72562)
-- Name: fk_relatedmodels_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedmodels
    ADD CONSTRAINT fk_relatedmodels_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4612 (class 2606 OID 72567)
-- Name: fk_relatedmodels_models; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedmodels
    ADD CONSTRAINT fk_relatedmodels_models FOREIGN KEY (modelid) REFERENCES models(modelid) ON DELETE CASCADE;


--
-- TOC entry 4486 (class 2606 OID 71937)
-- Name: fk_relatedresults_cv_relationshiptype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedresults
    ADD CONSTRAINT fk_relatedresults_cv_relationshiptype FOREIGN KEY (relationshiptypecv) REFERENCES cv_relationshiptype(name) ON DELETE CASCADE;


--
-- TOC entry 4487 (class 2606 OID 71942)
-- Name: fk_relatedresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedresults
    ADD CONSTRAINT fk_relatedresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4488 (class 2606 OID 71947)
-- Name: fk_relatedresults_results_arerelated; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY relatedresults
    ADD CONSTRAINT fk_relatedresults_results_arerelated FOREIGN KEY (relatedresultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4343 (class 2606 OID 71222)
-- Name: fk_resultannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultannotations
    ADD CONSTRAINT fk_resultannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4344 (class 2606 OID 71227)
-- Name: fk_resultannotations_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultannotations
    ADD CONSTRAINT fk_resultannotations_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4489 (class 2606 OID 71952)
-- Name: fk_resultderivationequations_derivationequations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultderivationequations
    ADD CONSTRAINT fk_resultderivationequations_derivationequations FOREIGN KEY (derivationequationid) REFERENCES derivationequations(derivationequationid) ON DELETE CASCADE;


--
-- TOC entry 4490 (class 2606 OID 71957)
-- Name: fk_resultderivationequations_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultderivationequations
    ADD CONSTRAINT fk_resultderivationequations_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4442 (class 2606 OID 71717)
-- Name: fk_resultextensionpropertyvalues_extensionproperties; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultextensionpropertyvalues
    ADD CONSTRAINT fk_resultextensionpropertyvalues_extensionproperties FOREIGN KEY (propertyid) REFERENCES extensionproperties(propertyid) ON DELETE CASCADE;


--
-- TOC entry 4443 (class 2606 OID 71722)
-- Name: fk_resultextensionpropertyvalues_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultextensionpropertyvalues
    ADD CONSTRAINT fk_resultextensionpropertyvalues_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4401 (class 2606 OID 71512)
-- Name: fk_resultnormalizationvalues_referencematerialvalues; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultnormalizationvalues
    ADD CONSTRAINT fk_resultnormalizationvalues_referencematerialvalues FOREIGN KEY (normalizedbyreferencematerialvalueid) REFERENCES referencematerialvalues(referencematerialvalueid) ON DELETE CASCADE;


--
-- TOC entry 4402 (class 2606 OID 71517)
-- Name: fk_resultnormalizationvalues_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultnormalizationvalues
    ADD CONSTRAINT fk_resultnormalizationvalues_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4375 (class 2606 OID 71382)
-- Name: fk_results_cv_resulttype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_results_cv_resulttype FOREIGN KEY (resulttypecv) REFERENCES cv_resulttype(name) ON DELETE CASCADE;


--
-- TOC entry 4376 (class 2606 OID 71387)
-- Name: fk_results_cv_sampledmedium; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_results_cv_sampledmedium FOREIGN KEY (sampledmediumcv) REFERENCES cv_sampledmedium(name) ON DELETE CASCADE;


--
-- TOC entry 4377 (class 2606 OID 71392)
-- Name: fk_results_cv_status; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_results_cv_status FOREIGN KEY (statuscv) REFERENCES cv_status(name) ON DELETE CASCADE;


--
-- TOC entry 4378 (class 2606 OID 71397)
-- Name: fk_results_featureactions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_results_featureactions FOREIGN KEY (featureactionid) REFERENCES featureactions(featureactionid) ON DELETE CASCADE;


--
-- TOC entry 4379 (class 2606 OID 71402)
-- Name: fk_results_processinglevels; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_results_processinglevels FOREIGN KEY (processinglevelid) REFERENCES processinglevels(processinglevelid) ON DELETE CASCADE;


--
-- TOC entry 4380 (class 2606 OID 71407)
-- Name: fk_results_taxonomicclassifiers; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_results_taxonomicclassifiers FOREIGN KEY (taxonomicclassifierid) REFERENCES taxonomicclassifiers(taxonomicclassifierid) ON DELETE CASCADE;


--
-- TOC entry 4381 (class 2606 OID 71412)
-- Name: fk_results_units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_results_units FOREIGN KEY (unitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4382 (class 2606 OID 71417)
-- Name: fk_results_variables; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_results_variables FOREIGN KEY (variableid) REFERENCES variables(variableid) ON DELETE CASCADE;


--
-- TOC entry 4403 (class 2606 OID 71522)
-- Name: fk_resultsdataquality_dataquality; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultsdataquality
    ADD CONSTRAINT fk_resultsdataquality_dataquality FOREIGN KEY (dataqualityid) REFERENCES dataquality(dataqualityid) ON DELETE CASCADE;


--
-- TOC entry 4404 (class 2606 OID 71527)
-- Name: fk_resultsdataquality_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY resultsdataquality
    ADD CONSTRAINT fk_resultsdataquality_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4336 (class 2606 OID 71187)
-- Name: fk_resultvalueannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY measurementresultvalueannotations
    ADD CONSTRAINT fk_resultvalueannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4345 (class 2606 OID 71232)
-- Name: fk_samplingfeatureannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatureannotations
    ADD CONSTRAINT fk_samplingfeatureannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4346 (class 2606 OID 71237)
-- Name: fk_samplingfeatureannotations_samplingfeatures; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatureannotations
    ADD CONSTRAINT fk_samplingfeatureannotations_samplingfeatures FOREIGN KEY (samplingfeatureid) REFERENCES samplingfeatures(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4444 (class 2606 OID 71727)
-- Name: fk_samplingfeatureextensionpropertyvalues_extensionproperties; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatureextensionpropertyvalues
    ADD CONSTRAINT fk_samplingfeatureextensionpropertyvalues_extensionproperties FOREIGN KEY (propertyid) REFERENCES extensionproperties(propertyid) ON DELETE CASCADE;


--
-- TOC entry 4445 (class 2606 OID 71732)
-- Name: fk_samplingfeatureextensionpropertyvalues_samplingfeatures; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatureextensionpropertyvalues
    ADD CONSTRAINT fk_samplingfeatureextensionpropertyvalues_samplingfeatures FOREIGN KEY (samplingfeatureid) REFERENCES samplingfeatures(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4457 (class 2606 OID 71792)
-- Name: fk_samplingfeatureexternalidentifiers_externalidentifiersystems; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatureexternalidentifiers
    ADD CONSTRAINT fk_samplingfeatureexternalidentifiers_externalidentifiersystems FOREIGN KEY (externalidentifiersystemid) REFERENCES externalidentifiersystems(externalidentifiersystemid) ON DELETE CASCADE;


--
-- TOC entry 4458 (class 2606 OID 71797)
-- Name: fk_samplingfeatureexternalidentifiers_samplingfeatures; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatureexternalidentifiers
    ADD CONSTRAINT fk_samplingfeatureexternalidentifiers_samplingfeatures FOREIGN KEY (samplingfeatureid) REFERENCES samplingfeatures(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4383 (class 2606 OID 71422)
-- Name: fk_samplingfeatures_cv_elevationdatum; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatures
    ADD CONSTRAINT fk_samplingfeatures_cv_elevationdatum FOREIGN KEY (elevationdatumcv) REFERENCES cv_elevationdatum(name) ON DELETE CASCADE;


--
-- TOC entry 4384 (class 2606 OID 71427)
-- Name: fk_samplingfeatures_cv_samplingfeaturegeotype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatures
    ADD CONSTRAINT fk_samplingfeatures_cv_samplingfeaturegeotype FOREIGN KEY (samplingfeaturegeotypecv) REFERENCES cv_samplingfeaturegeotype(name) ON DELETE CASCADE;


--
-- TOC entry 4385 (class 2606 OID 71432)
-- Name: fk_samplingfeatures_cv_samplingfeaturetype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY samplingfeatures
    ADD CONSTRAINT fk_samplingfeatures_cv_samplingfeaturetype FOREIGN KEY (samplingfeaturetypecv) REFERENCES cv_samplingfeaturetype(name) ON DELETE CASCADE;


--
-- TOC entry 4528 (class 2606 OID 72147)
-- Name: fk_sectionresults_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresults
    ADD CONSTRAINT fk_sectionresults_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4529 (class 2606 OID 72152)
-- Name: fk_sectionresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresults
    ADD CONSTRAINT fk_sectionresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4530 (class 2606 OID 72157)
-- Name: fk_sectionresults_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresults
    ADD CONSTRAINT fk_sectionresults_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4531 (class 2606 OID 72162)
-- Name: fk_sectionresults_tmunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresults
    ADD CONSTRAINT fk_sectionresults_tmunits FOREIGN KEY (intendedtimespacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4532 (class 2606 OID 72167)
-- Name: fk_sectionresults_units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresults
    ADD CONSTRAINT fk_sectionresults_units FOREIGN KEY (ylocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4533 (class 2606 OID 72172)
-- Name: fk_sectionresults_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresults
    ADD CONSTRAINT fk_sectionresults_xunits FOREIGN KEY (intendedxspacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4534 (class 2606 OID 72177)
-- Name: fk_sectionresults_zunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresults
    ADD CONSTRAINT fk_sectionresults_zunits FOREIGN KEY (intendedzspacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4347 (class 2606 OID 71242)
-- Name: fk_sectionresultvalueannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalueannotations
    ADD CONSTRAINT fk_sectionresultvalueannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4348 (class 2606 OID 71247)
-- Name: fk_sectionresultvalueannotations_sectionresultvalues; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalueannotations
    ADD CONSTRAINT fk_sectionresultvalueannotations_sectionresultvalues FOREIGN KEY (valueid) REFERENCES sectionresultvalues(valueid) ON DELETE CASCADE;


--
-- TOC entry 4535 (class 2606 OID 72182)
-- Name: fk_sectionresultvalues_aiunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalues
    ADD CONSTRAINT fk_sectionresultvalues_aiunits FOREIGN KEY (timeaggregationintervalunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4536 (class 2606 OID 72187)
-- Name: fk_sectionresultvalues_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalues
    ADD CONSTRAINT fk_sectionresultvalues_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4537 (class 2606 OID 72192)
-- Name: fk_sectionresultvalues_cv_censorcode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalues
    ADD CONSTRAINT fk_sectionresultvalues_cv_censorcode FOREIGN KEY (censorcodecv) REFERENCES cv_censorcode(name) ON DELETE CASCADE;


--
-- TOC entry 4538 (class 2606 OID 72197)
-- Name: fk_sectionresultvalues_cv_qualitycode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalues
    ADD CONSTRAINT fk_sectionresultvalues_cv_qualitycode FOREIGN KEY (qualitycodecv) REFERENCES cv_qualitycode(name) ON DELETE CASCADE;


--
-- TOC entry 4539 (class 2606 OID 72202)
-- Name: fk_sectionresultvalues_sectionresults; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalues
    ADD CONSTRAINT fk_sectionresultvalues_sectionresults FOREIGN KEY (resultid) REFERENCES sectionresults(resultid) ON DELETE CASCADE;


--
-- TOC entry 4540 (class 2606 OID 72207)
-- Name: fk_sectionresultvalues_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalues
    ADD CONSTRAINT fk_sectionresultvalues_xunits FOREIGN KEY (xlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4541 (class 2606 OID 72212)
-- Name: fk_sectionresultvalues_zunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sectionresultvalues
    ADD CONSTRAINT fk_sectionresultvalues_zunits FOREIGN KEY (zlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4613 (class 2606 OID 72572)
-- Name: fk_simulations_actions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY simulations
    ADD CONSTRAINT fk_simulations_actions FOREIGN KEY (actionid) REFERENCES actions(actionid) ON DELETE CASCADE;


--
-- TOC entry 4614 (class 2606 OID 72577)
-- Name: fk_simulations_models; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY simulations
    ADD CONSTRAINT fk_simulations_models FOREIGN KEY (modelid) REFERENCES models(modelid) ON DELETE CASCADE;


--
-- TOC entry 4596 (class 2606 OID 72487)
-- Name: fk_sites_cv_sitetype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT fk_sites_cv_sitetype FOREIGN KEY (sitetypecv) REFERENCES cv_sitetype(name) ON DELETE CASCADE;


--
-- TOC entry 4597 (class 2606 OID 72492)
-- Name: fk_sites_samplingfeatures; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT fk_sites_samplingfeatures FOREIGN KEY (samplingfeatureid) REFERENCES samplingfeatures(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4598 (class 2606 OID 72497)
-- Name: fk_sites_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT fk_sites_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4599 (class 2606 OID 72502)
-- Name: fk_spatialoffsets_cv_spatialoffsettype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spatialoffsets
    ADD CONSTRAINT fk_spatialoffsets_cv_spatialoffsettype FOREIGN KEY (spatialoffsettypecv) REFERENCES cv_spatialoffsettype(name) ON DELETE CASCADE;


--
-- TOC entry 4600 (class 2606 OID 72507)
-- Name: fk_spatialoffsets_offset1units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spatialoffsets
    ADD CONSTRAINT fk_spatialoffsets_offset1units FOREIGN KEY (offset1unitid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4601 (class 2606 OID 72512)
-- Name: fk_spatialoffsets_offset2units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spatialoffsets
    ADD CONSTRAINT fk_spatialoffsets_offset2units FOREIGN KEY (offset2unitid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4602 (class 2606 OID 72517)
-- Name: fk_spatialoffsets_offset3units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spatialoffsets
    ADD CONSTRAINT fk_spatialoffsets_offset3units FOREIGN KEY (offset3unitid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4459 (class 2606 OID 71802)
-- Name: fk_spatialreferenceexternalidentifiers_externalidentifiersystem; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spatialreferenceexternalidentifiers
    ADD CONSTRAINT fk_spatialreferenceexternalidentifiers_externalidentifiersystem FOREIGN KEY (externalidentifiersystemid) REFERENCES externalidentifiersystems(externalidentifiersystemid) ON DELETE CASCADE;


--
-- TOC entry 4460 (class 2606 OID 71807)
-- Name: fk_spatialreferenceexternalidentifiers_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spatialreferenceexternalidentifiers
    ADD CONSTRAINT fk_spatialreferenceexternalidentifiers_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4468 (class 2606 OID 71847)
-- Name: fk_specimenbatchpostions_featureactions; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY specimenbatchpostions
    ADD CONSTRAINT fk_specimenbatchpostions_featureactions FOREIGN KEY (featureactionid) REFERENCES featureactions(featureactionid) ON DELETE CASCADE;


--
-- TOC entry 4603 (class 2606 OID 72522)
-- Name: fk_specimens_cv_specimenmedium; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY specimens
    ADD CONSTRAINT fk_specimens_cv_specimenmedium FOREIGN KEY (specimenmediumcv) REFERENCES cv_specimenmedium(name) ON DELETE CASCADE;


--
-- TOC entry 4604 (class 2606 OID 72527)
-- Name: fk_specimens_cv_specimentype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY specimens
    ADD CONSTRAINT fk_specimens_cv_specimentype FOREIGN KEY (specimentypecv) REFERENCES cv_specimentype(name) ON DELETE CASCADE;


--
-- TOC entry 4605 (class 2606 OID 72532)
-- Name: fk_specimens_samplingfeatures; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY specimens
    ADD CONSTRAINT fk_specimens_samplingfeatures FOREIGN KEY (samplingfeatureid) REFERENCES samplingfeatures(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4606 (class 2606 OID 72537)
-- Name: fk_specimentaxonomicclassifiers_citations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY specimentaxonomicclassifiers
    ADD CONSTRAINT fk_specimentaxonomicclassifiers_citations FOREIGN KEY (citationid) REFERENCES citations(citationid) ON DELETE CASCADE;


--
-- TOC entry 4607 (class 2606 OID 72542)
-- Name: fk_specimentaxonomicclassifiers_specimens; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY specimentaxonomicclassifiers
    ADD CONSTRAINT fk_specimentaxonomicclassifiers_specimens FOREIGN KEY (samplingfeatureid) REFERENCES specimens(samplingfeatureid) ON DELETE CASCADE;


--
-- TOC entry 4608 (class 2606 OID 72547)
-- Name: fk_specimentaxonomicclassifiers_taxonomicclassifiers; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY specimentaxonomicclassifiers
    ADD CONSTRAINT fk_specimentaxonomicclassifiers_taxonomicclassifiers FOREIGN KEY (taxonomicclassifierid) REFERENCES taxonomicclassifiers(taxonomicclassifierid) ON DELETE CASCADE;


--
-- TOC entry 4542 (class 2606 OID 72217)
-- Name: fk_spectraresults_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresults
    ADD CONSTRAINT fk_spectraresults_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4543 (class 2606 OID 72222)
-- Name: fk_spectraresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresults
    ADD CONSTRAINT fk_spectraresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4544 (class 2606 OID 72227)
-- Name: fk_spectraresults_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresults
    ADD CONSTRAINT fk_spectraresults_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4545 (class 2606 OID 72232)
-- Name: fk_spectraresults_units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresults
    ADD CONSTRAINT fk_spectraresults_units FOREIGN KEY (intendedwavelengthspacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4546 (class 2606 OID 72237)
-- Name: fk_spectraresults_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresults
    ADD CONSTRAINT fk_spectraresults_xunits FOREIGN KEY (xlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4547 (class 2606 OID 72242)
-- Name: fk_spectraresults_yunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresults
    ADD CONSTRAINT fk_spectraresults_yunits FOREIGN KEY (ylocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4548 (class 2606 OID 72247)
-- Name: fk_spectraresults_zunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresults
    ADD CONSTRAINT fk_spectraresults_zunits FOREIGN KEY (zlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4349 (class 2606 OID 71252)
-- Name: fk_spectraresultvalueannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresultvalueannotations
    ADD CONSTRAINT fk_spectraresultvalueannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4350 (class 2606 OID 71257)
-- Name: fk_spectraresultvalueannotations_spectraresultvalues; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresultvalueannotations
    ADD CONSTRAINT fk_spectraresultvalueannotations_spectraresultvalues FOREIGN KEY (valueid) REFERENCES spectraresultvalues(valueid) ON DELETE CASCADE;


--
-- TOC entry 4549 (class 2606 OID 72252)
-- Name: fk_spectraresultvalues_aiunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresultvalues
    ADD CONSTRAINT fk_spectraresultvalues_aiunits FOREIGN KEY (timeaggregationintervalunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4550 (class 2606 OID 72257)
-- Name: fk_spectraresultvalues_cv_censorcode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresultvalues
    ADD CONSTRAINT fk_spectraresultvalues_cv_censorcode FOREIGN KEY (censorcodecv) REFERENCES cv_censorcode(name) ON DELETE CASCADE;


--
-- TOC entry 4551 (class 2606 OID 72262)
-- Name: fk_spectraresultvalues_cv_qualitycode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresultvalues
    ADD CONSTRAINT fk_spectraresultvalues_cv_qualitycode FOREIGN KEY (qualitycodecv) REFERENCES cv_qualitycode(name) ON DELETE CASCADE;


--
-- TOC entry 4552 (class 2606 OID 72267)
-- Name: fk_spectraresultvalues_spectraresults; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresultvalues
    ADD CONSTRAINT fk_spectraresultvalues_spectraresults FOREIGN KEY (resultid) REFERENCES spectraresults(resultid) ON DELETE CASCADE;


--
-- TOC entry 4553 (class 2606 OID 72272)
-- Name: fk_spectraresultvalues_wunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY spectraresultvalues
    ADD CONSTRAINT fk_spectraresultvalues_wunits FOREIGN KEY (wavelengthunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4461 (class 2606 OID 71812)
-- Name: fk_taxonomicclassifierextids_extidsystems; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY taxonomicclassifierexternalidentifiers
    ADD CONSTRAINT fk_taxonomicclassifierextids_extidsystems FOREIGN KEY (externalidentifiersystemid) REFERENCES externalidentifiersystems(externalidentifiersystemid) ON DELETE CASCADE;


--
-- TOC entry 4462 (class 2606 OID 71817)
-- Name: fk_taxonomicclassifierextids_taxonomicclassifiers; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY taxonomicclassifierexternalidentifiers
    ADD CONSTRAINT fk_taxonomicclassifierextids_taxonomicclassifiers FOREIGN KEY (taxonomicclassifierid) REFERENCES taxonomicclassifiers(taxonomicclassifierid) ON DELETE CASCADE;


--
-- TOC entry 4387 (class 2606 OID 71442)
-- Name: fk_taxonomicclassifiers_cv_taxonomicclassifiertype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY taxonomicclassifiers
    ADD CONSTRAINT fk_taxonomicclassifiers_cv_taxonomicclassifiertype FOREIGN KEY (taxonomicclassifiertypecv) REFERENCES cv_taxonomicclassifiertype(name) ON DELETE CASCADE;


--
-- TOC entry 4554 (class 2606 OID 72277)
-- Name: fk_timeseriesresults_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresults
    ADD CONSTRAINT fk_timeseriesresults_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4555 (class 2606 OID 72282)
-- Name: fk_timeseriesresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresults
    ADD CONSTRAINT fk_timeseriesresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4556 (class 2606 OID 72287)
-- Name: fk_timeseriesresults_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresults
    ADD CONSTRAINT fk_timeseriesresults_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4557 (class 2606 OID 72292)
-- Name: fk_timeseriesresults_tunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresults
    ADD CONSTRAINT fk_timeseriesresults_tunits FOREIGN KEY (intendedtimespacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4558 (class 2606 OID 72297)
-- Name: fk_timeseriesresults_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresults
    ADD CONSTRAINT fk_timeseriesresults_xunits FOREIGN KEY (xlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4559 (class 2606 OID 72302)
-- Name: fk_timeseriesresults_yunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresults
    ADD CONSTRAINT fk_timeseriesresults_yunits FOREIGN KEY (ylocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4560 (class 2606 OID 72307)
-- Name: fk_timeseriesresults_zunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresults
    ADD CONSTRAINT fk_timeseriesresults_zunits FOREIGN KEY (zlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4351 (class 2606 OID 71262)
-- Name: fk_timeseriesresultvalueannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresultvalueannotations
    ADD CONSTRAINT fk_timeseriesresultvalueannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4352 (class 2606 OID 71267)
-- Name: fk_timeseriesresultvalueannotations_timeseriesresultvalues; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresultvalueannotations
    ADD CONSTRAINT fk_timeseriesresultvalueannotations_timeseriesresultvalues FOREIGN KEY (valueid) REFERENCES timeseriesresultvalues(valueid) ON DELETE CASCADE;


--
-- TOC entry 4561 (class 2606 OID 72312)
-- Name: fk_timeseriesresultvalues_aiunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresultvalues
    ADD CONSTRAINT fk_timeseriesresultvalues_aiunits FOREIGN KEY (timeaggregationintervalunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4562 (class 2606 OID 72317)
-- Name: fk_timeseriesresultvalues_cv_censorcode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresultvalues
    ADD CONSTRAINT fk_timeseriesresultvalues_cv_censorcode FOREIGN KEY (censorcodecv) REFERENCES cv_censorcode(name) ON DELETE CASCADE;


--
-- TOC entry 4563 (class 2606 OID 72322)
-- Name: fk_timeseriesresultvalues_cv_qualitycode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresultvalues
    ADD CONSTRAINT fk_timeseriesresultvalues_cv_qualitycode FOREIGN KEY (qualitycodecv) REFERENCES cv_qualitycode(name) ON DELETE CASCADE;


--
-- TOC entry 4564 (class 2606 OID 72327)
-- Name: fk_timeseriesresultvalues_timeseriesresults; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY timeseriesresultvalues
    ADD CONSTRAINT fk_timeseriesresultvalues_timeseriesresults FOREIGN KEY (resultid) REFERENCES timeseriesresults(resultid) ON DELETE CASCADE;


--
-- TOC entry 4565 (class 2606 OID 72332)
-- Name: fk_trajectoryresults_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresults
    ADD CONSTRAINT fk_trajectoryresults_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4566 (class 2606 OID 72337)
-- Name: fk_trajectoryresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresults
    ADD CONSTRAINT fk_trajectoryresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4567 (class 2606 OID 72342)
-- Name: fk_trajectoryresults_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresults
    ADD CONSTRAINT fk_trajectoryresults_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4568 (class 2606 OID 72347)
-- Name: fk_trajectoryresults_tsunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresults
    ADD CONSTRAINT fk_trajectoryresults_tsunits FOREIGN KEY (intendedtrajectoryspacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4569 (class 2606 OID 72352)
-- Name: fk_trajectoryresults_tunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresults
    ADD CONSTRAINT fk_trajectoryresults_tunits FOREIGN KEY (intendedtimespacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4353 (class 2606 OID 71272)
-- Name: fk_trajectoryresultvalueannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalueannotations
    ADD CONSTRAINT fk_trajectoryresultvalueannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4354 (class 2606 OID 71277)
-- Name: fk_trajectoryresultvalueannotations_trajectoryresultvalues; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalueannotations
    ADD CONSTRAINT fk_trajectoryresultvalueannotations_trajectoryresultvalues FOREIGN KEY (valueid) REFERENCES trajectoryresultvalues(valueid) ON DELETE CASCADE;


--
-- TOC entry 4570 (class 2606 OID 72357)
-- Name: fk_trajectoryresultvalues_aiunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalues
    ADD CONSTRAINT fk_trajectoryresultvalues_aiunits FOREIGN KEY (timeaggregationintervalunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4571 (class 2606 OID 72362)
-- Name: fk_trajectoryresultvalues_cv_censorcode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalues
    ADD CONSTRAINT fk_trajectoryresultvalues_cv_censorcode FOREIGN KEY (censorcodecv) REFERENCES cv_censorcode(name) ON DELETE CASCADE;


--
-- TOC entry 4572 (class 2606 OID 72367)
-- Name: fk_trajectoryresultvalues_cv_qualitycode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalues
    ADD CONSTRAINT fk_trajectoryresultvalues_cv_qualitycode FOREIGN KEY (qualitycodecv) REFERENCES cv_qualitycode(name) ON DELETE CASCADE;


--
-- TOC entry 4573 (class 2606 OID 72372)
-- Name: fk_trajectoryresultvalues_distanceunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalues
    ADD CONSTRAINT fk_trajectoryresultvalues_distanceunits FOREIGN KEY (trajectorydistanceunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4574 (class 2606 OID 72377)
-- Name: fk_trajectoryresultvalues_trajectoryresults; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalues
    ADD CONSTRAINT fk_trajectoryresultvalues_trajectoryresults FOREIGN KEY (resultid) REFERENCES trajectoryresults(resultid) ON DELETE CASCADE;


--
-- TOC entry 4575 (class 2606 OID 72382)
-- Name: fk_trajectoryresultvalues_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalues
    ADD CONSTRAINT fk_trajectoryresultvalues_xunits FOREIGN KEY (xlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4576 (class 2606 OID 72387)
-- Name: fk_trajectoryresultvalues_yunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalues
    ADD CONSTRAINT fk_trajectoryresultvalues_yunits FOREIGN KEY (ylocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4577 (class 2606 OID 72392)
-- Name: fk_trajectoryresultvalues_zunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY trajectoryresultvalues
    ADD CONSTRAINT fk_trajectoryresultvalues_zunits FOREIGN KEY (zlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4578 (class 2606 OID 72397)
-- Name: fk_transectresults_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresults
    ADD CONSTRAINT fk_transectresults_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4579 (class 2606 OID 72402)
-- Name: fk_transectresults_results; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresults
    ADD CONSTRAINT fk_transectresults_results FOREIGN KEY (resultid) REFERENCES results(resultid) ON DELETE CASCADE;


--
-- TOC entry 4580 (class 2606 OID 72407)
-- Name: fk_transectresults_spatialreferences; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresults
    ADD CONSTRAINT fk_transectresults_spatialreferences FOREIGN KEY (spatialreferenceid) REFERENCES spatialreferences(spatialreferenceid) ON DELETE CASCADE;


--
-- TOC entry 4581 (class 2606 OID 72412)
-- Name: fk_transectresults_tmunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresults
    ADD CONSTRAINT fk_transectresults_tmunits FOREIGN KEY (intendedtimespacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4582 (class 2606 OID 72417)
-- Name: fk_transectresults_tsunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresults
    ADD CONSTRAINT fk_transectresults_tsunits FOREIGN KEY (intendedtransectspacingunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4583 (class 2606 OID 72422)
-- Name: fk_transectresults_units; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresults
    ADD CONSTRAINT fk_transectresults_units FOREIGN KEY (zlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4355 (class 2606 OID 71282)
-- Name: fk_transectresultvalueannotations_annotations; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalueannotations
    ADD CONSTRAINT fk_transectresultvalueannotations_annotations FOREIGN KEY (annotationid) REFERENCES annotations(annotationid) ON DELETE CASCADE;


--
-- TOC entry 4356 (class 2606 OID 71287)
-- Name: fk_transectresultvalueannotations_transectresultvalues; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalueannotations
    ADD CONSTRAINT fk_transectresultvalueannotations_transectresultvalues FOREIGN KEY (valueid) REFERENCES transectresultvalues(valueid) ON DELETE CASCADE;


--
-- TOC entry 4584 (class 2606 OID 72427)
-- Name: fk_transectresultvalues_aiunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalues
    ADD CONSTRAINT fk_transectresultvalues_aiunits FOREIGN KEY (timeaggregationintervalunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4585 (class 2606 OID 72432)
-- Name: fk_transectresultvalues_cv_aggregationstatistic; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalues
    ADD CONSTRAINT fk_transectresultvalues_cv_aggregationstatistic FOREIGN KEY (aggregationstatisticcv) REFERENCES cv_aggregationstatistic(name) ON DELETE CASCADE;


--
-- TOC entry 4586 (class 2606 OID 72437)
-- Name: fk_transectresultvalues_cv_censorcode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalues
    ADD CONSTRAINT fk_transectresultvalues_cv_censorcode FOREIGN KEY (censorcodecv) REFERENCES cv_censorcode(name) ON DELETE CASCADE;


--
-- TOC entry 4587 (class 2606 OID 72442)
-- Name: fk_transectresultvalues_cv_qualitycode; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalues
    ADD CONSTRAINT fk_transectresultvalues_cv_qualitycode FOREIGN KEY (qualitycodecv) REFERENCES cv_qualitycode(name) ON DELETE CASCADE;


--
-- TOC entry 4588 (class 2606 OID 72447)
-- Name: fk_transectresultvalues_distanceunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalues
    ADD CONSTRAINT fk_transectresultvalues_distanceunits FOREIGN KEY (transectdistanceunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4589 (class 2606 OID 72452)
-- Name: fk_transectresultvalues_transectresults; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalues
    ADD CONSTRAINT fk_transectresultvalues_transectresults FOREIGN KEY (resultid) REFERENCES transectresults(resultid) ON DELETE CASCADE;


--
-- TOC entry 4590 (class 2606 OID 72457)
-- Name: fk_transectresultvalues_xunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalues
    ADD CONSTRAINT fk_transectresultvalues_xunits FOREIGN KEY (xlocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4591 (class 2606 OID 72462)
-- Name: fk_transectresultvalues_yunits; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY transectresultvalues
    ADD CONSTRAINT fk_transectresultvalues_yunits FOREIGN KEY (ylocationunitsid) REFERENCES units(unitsid) ON DELETE CASCADE;


--
-- TOC entry 4388 (class 2606 OID 71447)
-- Name: fk_units_cv_unitstype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY units
    ADD CONSTRAINT fk_units_cv_unitstype FOREIGN KEY (unitstypecv) REFERENCES cv_unitstype(name) ON DELETE CASCADE;


--
-- TOC entry 4446 (class 2606 OID 71737)
-- Name: fk_variableextensionpropertyvalues_extensionproperties; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variableextensionpropertyvalues
    ADD CONSTRAINT fk_variableextensionpropertyvalues_extensionproperties FOREIGN KEY (propertyid) REFERENCES extensionproperties(propertyid) ON DELETE CASCADE;


--
-- TOC entry 4447 (class 2606 OID 71742)
-- Name: fk_variableextensionpropertyvalues_variables; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variableextensionpropertyvalues
    ADD CONSTRAINT fk_variableextensionpropertyvalues_variables FOREIGN KEY (variableid) REFERENCES variables(variableid) ON DELETE CASCADE;


--
-- TOC entry 4463 (class 2606 OID 71822)
-- Name: fk_variableexternalidentifiers_externalidentifiersystems; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variableexternalidentifiers
    ADD CONSTRAINT fk_variableexternalidentifiers_externalidentifiersystems FOREIGN KEY (externalidentifiersystemid) REFERENCES externalidentifiersystems(externalidentifiersystemid) ON DELETE CASCADE;


--
-- TOC entry 4464 (class 2606 OID 71827)
-- Name: fk_variableexternalidentifiers_variables; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variableexternalidentifiers
    ADD CONSTRAINT fk_variableexternalidentifiers_variables FOREIGN KEY (variableid) REFERENCES variables(variableid) ON DELETE CASCADE;


--
-- TOC entry 4389 (class 2606 OID 71452)
-- Name: fk_variables_cv_speciation; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variables
    ADD CONSTRAINT fk_variables_cv_speciation FOREIGN KEY (speciationcv) REFERENCES cv_speciation(name) ON DELETE CASCADE;


--
-- TOC entry 4390 (class 2606 OID 71457)
-- Name: fk_variables_cv_variablename; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variables
    ADD CONSTRAINT fk_variables_cv_variablename FOREIGN KEY (variablenamecv) REFERENCES cv_variablename(name) ON DELETE CASCADE;


--
-- TOC entry 4391 (class 2606 OID 71462)
-- Name: fk_variables_cv_variabletype; Type: FK CONSTRAINT; Schema: odm2; Owner: -
--

ALTER TABLE ONLY variables
    ADD CONSTRAINT fk_variables_cv_variabletype FOREIGN KEY (variabletypecv) REFERENCES cv_variabletype(name) ON DELETE CASCADE;


-- Completed on 2015-05-22 09:38:46 PDT

--
-- PostgreSQL database dump complete
--

