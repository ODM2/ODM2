/* 1/3-5/2014. odm2_0.81_pgsql_emilio_changes.sql
   Emilio Mayorga
   My changes to ODM2 0.81, for my PRISM-XAN data use case in PostgreSQL

1. Forward engineered from DbWrench 0.81 ODM2 schema, to a SQL file (*not* directly to a PostgreSQL database).
2. In a text editor, search-and-removed all double quotes, to let postgresql auto-convert all object names to all-lowercase.
3. Applied the statements to a database that already had separate schemas holding my PRISM-XAN data use case, and already had my standard set of permissions. These schemas are the ones I use for PRISM-XAN.
4. Applied the following changes to the ODM2 schema, impacting 3 odm2core tables, plus public.geometry_columns.
*/

/* ------------- odm2core.variables
ERROR:  column "variabledefinition" is of type bigint but expression is of type character varying
>> Changed the odm2core.variables.variabledefinition data type from bigint.
>> Get field descriptions/intents from Jeff et al, then add field comments (definitions)
>> It doesn't make sense to have the nodatavalue field in this table.
*/
ALTER TABLE odm2core.variables ALTER COLUMN variabledefinition TYPE character varying(255);

/* ------------- odm2core.results
DbWrench forward-engineered data type was "DATE".
*/
ALTER TABLE odm2core.results ALTER COLUMN resultdatetime TYPE timestamp without time zone;

/* ------------- odm2core.samplingfeatures
Modified and added fields.
Set up featuregeometry as a heterogeneous, 2D epsg:4326 Postgis geom field.
>> I'm not using spatialreferenceid at this time. I think ultimately we should rely as much
as possible on ogc/epsg urn's, and a similar loose coupling system for locally defined spatial refs
See as example (and look for the equivalent ogc "REST" url):
http://www.epsg-registry.org/indicio/query?request=GetRepositoryItem&id=urn:ogc:def:crs:EPSG::4326
>> We shouldn't get in the business of fully defining widely used spatial references
   (one of the roles for ODM2SamplingFeatures.SpatialReferences), 
   when there are widely used standards available for that.
*/
ALTER TABLE odm2core.samplingfeatures 
  RENAME COLUMN samplingfeatureuniqueidtypecv TO samplingfeatureuniqueidcv;

ALTER TABLE odm2core.samplingfeatures ADD COLUMN samplingfeaturename character varying(255);
COMMENT ON COLUMN odm2core.samplingfeatures.samplingfeaturename IS 'Sampling Feature name (free text).';
-- Added to better correspond to ODM2 Types CVs.xlsx/SamplingFeatureTypeCV
ALTER TABLE odm2core.samplingfeatures ADD COLUMN samplingfeaturegeotype character varying(50);
COMMENT ON COLUMN odm2core.samplingfeatures.samplingfeaturegeotype IS 'point2d, line2d, etc';

ALTER TABLE odm2core.samplingfeatures ALTER COLUMN featuregeometry TYPE geometry;
ALTER TABLE odm2core.samplingfeatures ADD CONSTRAINT 
  enforce_dims_featuregeometry CHECK (st_ndims(featuregeometry) = 2);
ALTER TABLE odm2core.samplingfeatures ADD CONSTRAINT 
  enforce_srid_featuregeometry CHECK (st_srid(featuregeometry) = 4326);
-- spatial index
CREATE INDEX idx_samplingfeature_featuregeom ON odm2core.samplingfeatures USING gist (featuregeometry);
-- ==============================================================================================

-- 12/11/2013. THE STEPS I TOOK WITH samplingfeatures DIDN'T POPULATE geometry_columns
-- Cleans up and rebuilds geometry_columns
SELECT Populate_Geometry_Columns();
-- HMM, but note that it assigned a POINT type to odm2core.samplingfeatures! Isn't there a more generic type?
-- AND it had the impact of making QGIS think there are only POINT geometries!!
-- The statement below did the trick, manually
UPDATE public.geometry_columns SET type = 'GEOMETRY' WHERE f_table_schema = 'odm2core' AND f_table_name = 'samplingfeatures';
