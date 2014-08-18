""" DbWrench_DDL_postprocess.py
Emilio Mayorga (UW/APL)
8/15-18/2014
Take the DDL SQL output from DbWrench for PostgreSQL, and apply changes in order to
generate a new, blank ODM2 database following ODM2 conventions. Specifically:
1. All entity names will be lowercase
2. All entities will be under a single schema
3. The field samplingfeatures.featuregeometry will be PostGIS geometry field constrained 
   to be 2D, but otherwise free to store any project (eg, epsg:4326) and to
   accept any geometry type (point, line, polygon, and collections thereof [multi-polygon, etc])

- Assumes that the source DDL SQL file is in the same directory as the script
- This DDL must be run on a pre-existing, "empty" database. All permissions (roles) settings
must be set up by the database administrator.
------------------------------------

Note: developed and tested on Linux only.
------------------------------------

See this great online tool (there are others), to test regex, export to code, etc
http://regex101.com
"""

import re


# =============== USER (run-time) CHANGES =================
# DDL input file name
ddlfile   = "ODM2_DDL_for_PostgreSQL9.3PostGIS2.1.sql"
# DDL output file name
ddlppfile = "ODM2_DDL_for_PostgreSQL9.3PostGIS2.1_postprocessed.sql"

newschemaname = "odm2"
odmversion = "2.0"
odm2infodct = {'schema':newschemaname, 'version':odmversion}
# =========================================================


pre_block = """ /* Post-processed DDL based on DbWrench export. 2014-8-18 10pm PDT */

-- IF THIS DDL SCRIPT IS TO *CREATE* THE DATABASE ITSELF, 
-- WILL NEED TO FIRST KNOW THE DATABASE NAME AND ROLES TO BE USED. 

/* Add single base schema for all odm2 entities */
CREATE SCHEMA %(schema)s;
COMMENT ON SCHEMA %(schema)s IS 'Schema holding all ODM2 (%(version)s) entities (tables, etc).';
""" % odm2infodct

post_block = """/* ** Set up samplingfeatures.featuregeometry as a heterogeneous, 2D PostGIS geom field. */
ALTER TABLE %(schema)s.samplingfeatures ALTER COLUMN featuregeometry TYPE geometry;
ALTER TABLE %(schema)s.samplingfeatures ADD CONSTRAINT 
  enforce_dims_featuregeometry CHECK (st_ndims(featuregeometry) = 2);
CREATE INDEX idx_samplingfeature_featuregeom ON %(schema)s.samplingfeatures USING gist (featuregeometry);
-- Populate and tweak geometry_columns
SELECT Populate_Geometry_Columns();
-- But it assigned a POINT type to  %(schema)s.samplingfeatures. Need instead to use the generic
-- 'geometries', to accept any type (point, line, polygon, and collections thereof [multi-polygon, etc])
UPDATE public.geometry_columns SET type = 'GEOMETRY' WHERE f_table_schema = '%(schema)s' AND f_table_name = 'samplingfeatures';
""" % odm2infodct

# Relies on these assumptions:
# 1. All schema names start with the prefix "ODM2"
# 2. No entity other than schemas starts with the prefix "ODM2"
p = re.compile(ur'(ODM2\w*?)(?=\.)')

ddl_pp_lines = []
with open(ddlfile, 'r') as ddl_f:
    for ddl_ln in ddl_f.readlines():
        ddl_ln.replace('"', '')  # remove double quotes, if present
        if 'schema' in ddl_ln.lower():
            # Skip the line, so it won't be written out
            # Assumes all schema statements are found as single lines
            continue
        else:
            ddl_pp_lines.append(re.sub(p, newschemaname, ddl_ln))

# Write out new, post-processed DDL file
# Insert pre and post blocks, and the modified DDL lines in between
ddl_ppf = open(ddlppfile, 'w')
ddl_ppf.write(pre_block)
ddl_ppf.write("/* ================================================================\n")
ddl_ppf.write("   ================================================================ */\n\n")
ddl_ppf.writelines(ddl_pp_lines)
ddl_ppf.write("\n/* ================================================================\n")
ddl_ppf.write("   ================================================================ */\n\n")
ddl_ppf.write(post_block)
ddl_ppf.close()
