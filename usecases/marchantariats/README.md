# Marchantaria Time Series Data Use Case
Contact [Emilio Mayorga](https://github.com/emiliom) for questions. **This is a work in progress!** Some data haven't been loaded yet, and some implementation decisions will likely be changed in the future.

## Description
A 10 year "time series" (not sensor based) of lots of biogeochemical measurements from a location on the central Amazon mainstem. The data, with some small exceptions, was published 20 years ago: http://dx.doi.org/10.1029/95GB01145. The dataset includes measurements on several physical fractions (dissolved, fine particulates, coarse particulates, and probably "total" or bulk), plus river stage and possibly discharge.

Each physical fraction sample has been assigned a specimen SamplingFeature. In addition, variables have been created that are specific to each fraction (eg, FSS vs CSS for Fine and Coarse Suspended Sediment, respectively). *I will add more ODM2 implementation descriptions in the future.*

## Database loading/mapping status
I've fully loaded fine and coarse particulates and all ancillary data I'm interested in loading initially (specimens, sites, dataset, citation, people, organizations, doi externalidentifier, etc), and come up with a template scheme for loading the remaining physical fractions. *I'll do the dissolved and bulk measurements in June.*

### ODM2 Schema version and tweaks
This database was created using the [ODM2_for_PostgreSQL.sql blank schema DDL script](https://github.com/ODM2/ODM2/blob/master/src/blank_schema_scripts/postgresql/ODM2_for_PostgreSQL.sql) downloaded on May 10, 2015. A few modifications were applied to that standard ODM2 blank script, mostly related to PostGIS usage:
```sql
-- Removed all "CREATE EXTENSION" statements
ALTER TABLE odm2.samplingfeatures ADD CONSTRAINT 
  enforce_dims_featuregeometry CHECK (st_ndims(featuregeometry) = 2);
CREATE INDEX idx_samplingfeature_featuregeom ON odm2.samplingfeatures USING gist (featuregeometry);
SELECT Populate_Geometry_Columns();
UPDATE public.geometry_columns SET type = 'GEOMETRY' WHERE f_table_schema = 'odm2' AND f_table_name = 'samplingfeatures';
```

## PostgreSQL Database Dump
I've created a PostgreSQL database dump file ([marchantariats.sql](marchantariats.sql)) using `pg_dump`, with plain-text format. It can be restored using the `postgres` user and the following `psql` (*not pg_restore!*) statement:
```
psql -h localhost -p 5432 -U postgres -W -f "./marchantariats.sql" template1
```
The database and the dump file were created using PostgreSQL 9.3 and PostGIS 2.1, on Ubuntu Linux 14.04. The ODM2 database uses PostGIS geometry objects in the `samplingfeatures` table. The dump file was created with the following `pg_dump` statement (note: the database was originally called "odm2_rivers"):
```
pg_dump -h localhost -p 5432 -d odm2_rivers --exclude-schema=amz_riverbgc -U "postgres" --role="postgres" -W --no-privileges --no-owner --format=p --create --blobs --verbose --file="./marchantariats.sql"
```
