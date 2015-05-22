# Marchantaria Time Series Data Use Case
Contact [Emilio Mayorga](https://github.com/emiliom) for questions.

## Description
A 10 year "time series" (not sensor based) of lots of biogeochemical measurements from a location on the central Amazon mainstem. The data, with some small exceptions, was published 20 years ago: http://dx.doi.org/10.1029/95GB01145. The dataset includes measurements on several physical fractions (dissolved, fine particulates, coarse particulates, and probably "total" or bulk), plus river stage and possibly discharge.

## Database loading/mapping status
I've fully loaded fine and coarse particulates and all ancillary data I'm interested in loading initially (specimens, sites, dataset, citation, people, organizations, doi externalidentifier, etc), and come up with a template scheme for loading the remaining physical fractions. I'll do the dissolved and bulk measurements in June.

## PostgreSQL Database Dump
I've created a PostgreSQL Database Dump file ([marchantariats.sql](marchantariats.sql)) using `pg_dump`, with plain-text format. It can be restored using the `postgres` user and the following `psql` (*not pg_restore!*) statement:
```
psql -h localhost -p 5432 -U postgres -W -f "./marchantariats.sql" template1
```
The database and the dump file were created using PostgreSQL 9.3 and PostGIS 2.1, on Ubuntu Linux 14.04. The ODM2 database uses PostGIS geometry objects in the `samplingfeatures` table.
