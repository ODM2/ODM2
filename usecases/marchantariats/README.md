# Marchantaria Time Series Data Use Case
Contact [Emilio Mayorga](https://github.com/emiliom) for questions. **This is a work in progress!** Some data haven't been loaded yet, and some implementation decisions will likely be changed in the future.

## Description
A 10 year "time series" (not sensor based) of lots of biogeochemical measurements from a location on the central Amazon mainstem. The data, with some small exceptions, was published 20 years ago: http://dx.doi.org/10.1029/95GB01145. The dataset includes measurements on several physical fractions (dissolved, fine particulates, coarse particulates, and probably "total" or bulk), plus river stage and possibly discharge.

Here are some important implementation choices and considerations (I will add more over time):
- Actions are highly coarse or aggregated at this time. There's simply one Observation action lumping ALL observations made at the site that day (what could otherwise be called a "sampling event"). These actions are all assigned to the coarse Method:  "Aggregated measurements, lumping all observation activities during one site visit"
- In general, each physical fraction sample has been assigned a single specimen SamplingFeature per sampling event. Except, two types of dissolved fractions have been distinguished, based on the collection and filtration sequence.
- Each Result is linked directly with a specimen SamplingFeature (via the FeatureActions table), and only indirectly with the related sites SamplingFeature via the RelatedFeatures table that relates specimens with sites.
- Note that specimen SamplingFeatures are not required to have non-null FeatureGeometry entries, b/c the geometry can be found in the related parent site or parent SamplingFeature. I chose not to populate FeatureGeometry for specimen SamplingFeatures, to avoid the possibility of incorrectly duplicated information. This means that a set of joins us required to bring in the geometry information together with FeatureActions and Results. I've created the convenience `odm2.specimen_site_sf` View to join site attributes and site SamplingFeatures attributes to specimen SamplingFeatureID. This view is included in the database dump file.
- Fow now, all specimens are related to a single site (SamplingFeatureID 1036), but it's best not to hard-wired that assumption in any querie. I may add a second site (SamplingFeatureID 1003 / (SamplingFeatureCode 'Man') in the near future. I loaded many other site SamplingFeatures, but these are not associated with any Actions or Results. All the other sites were loaded because the Marchantaria measurements "time series" is part of a larger database of Amazon biogeochemical data that I want to load into this ODM2 database eventually. All other sites should be ignored at this time.
- Some variables have been created that are specific to each fraction (eg, FSS vs CSS for Fine and Coarse Suspended Sediment, respectively). The use of such variables together with specimens by physical fraction is somewhat redundant, but convenient.
- This dataset was collected and can be viewed as a "time series", though not in the ODM2 "TimeSeries" ResultType sense. For each variable, there's a time series of up to individual 101 measurements, with corresponding individual Results and MeasurementResultValues.

## IPython (Jupyter) notebook demonstrating access to this data use case via the ODM2 REST API web services
I've created an IPython notebook that shows the use of the [ODM2 REST API's](http://sis-devel.cloudapp.net/docs/) (web services) from Python to acccess the Marchantaria data use case. The notebook can be [viewed as rendered by Github](https://github.com/BiG-CZ/BiG-CZ-Toolbox/blob/master/ipynotebooks/ODM2RESTdemo_MarchantariaUseCase.ipynb), but with the glitch that the interactive, inline map is not rendered; for best results see the notebook as [rendered on nbviewer](http://nbviewer.ipython.org/github/BiG-CZ/BiG-CZ-Toolbox/blob/master/ipynotebooks/ODM2RESTdemo_MarchantariaUseCase.ipynb). It can be downloaded from either system. 8/8/2015.

## Database loading/mapping status
I've loaded 4 specimen (or fraction) types: fine and coarse particulates, dissolved (filtered) from thorough cross-section composite samples, and dissolved (but unfiltered) constituents collected via Niskin bottles and minimizing aeration (to sample for gases or gas-influenced parameters). I also loaded all ancillary data I'm interested in initially (specimens, sites, dataset, citation, people, organizations, doi externalidentifier, etc), and come up with a template scheme for loading the remaining physical fractions. *I plan to do all remaining measurements (eg, constituent fraction sums, respiration rates, river stage and discharge, etc) in June. I will also revisit some decisions and categorizations made initially.*

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
