__author__ = 'tonycastronova'

import os, sys
from os.path import join, dirname, basename
import base
import translator
import xml.etree.ElementTree as et
from optparse import OptionParser

input_file = 'ODM2_DBWrench_Schema.xml'
use_schemas = True
default_schema = 'ODM2'

def parse_xml(input_file):
    # parse the dbwrench file
    tree = et.parse(input_file)
    root = tree.getroot()

    table_output = ''

    ddl_objs = []

    # find all of the schemas
    schemas = root.findall('Sch')


    if not use_schemas:
        sch_obj = base.Schema(name=default_schema)

    for schema in schemas:

        schemaname = schema.attrib['nm']
        schemacomment = schema.attrib['Cm']

        if use_schemas:
            # create schema object
            sch_obj = base.Schema(name=schemaname)

        # get all tables in schema
        tables = schema.findall('Tbl')


        for table in tables:
            tablename = table.attrib['nm']

            # get the primary key
            pk = table.find('Pk')
            pk_col_name = pk.attrib['ClNs']

            # create table object
            tbl_obj = base.Table(name=tablename, pk=pk)

            # get the columns for this table
            cols = table.findall('Cl')

            for col in cols:
                att = col.attrib
                att.update(col.find('DT').attrib)


                pkey = 1 if att['nm'] == pk_col_name else 0
                # add column instance to table obj
                tbl_obj.add_column(base.Column(name=att['nm'], datatype=att['ds'], primarykey = pkey, autoincrement=att['au'],
                                               length=att['ln'] if att['ln'] != 'null' else None,
                                          scale=att['sc'], unsigned=att['un'], id=att['id'], nullable=att['nu'],default=att['df']))


            # add foriegn keys to table
            fks = table.findall('Fk')
            for fk in fks:
                # get parent table
                p = fk.find('PrTb')

                # get child table
                c = fk.find('CdTb')

                # get relation
                r = fk.find('ClPr')

                foreignKey = base.ForeignKey(name=fk.attrib['nm'],
                                             parentSch=p.attrib['sch'], parentTbl=p.attrib['nm'], parentCol=r.attrib['prCl'],
                                             childSch=c.attrib['sch'], childTbl=c.attrib['nm'], childCol=r.attrib['cdCl'] )
                tbl_obj.add_foreignkey(foreignKey)

            # get the unique constraints
            ucs = table.find('UniqueConstraints')
            for uc in ucs.getchildren():
                clns = uc.find('ClNs')
                name = uc.get('nm')
                vals = clns.text.split(',')
                constraint = base.UniqueConstraint(name, vals)
                tbl_obj.uniqueconstraint(constraint)

            # add table object to the schema object
            sch_obj.add_table(tbl_obj)

        # store the schema object
        ddl_objs.append(sch_obj)

    return ddl_objs

def BUILD_MSSSQL_DDL(opts, ddl_objs, use_schemas):
    #---------------------------------#
    #-------- Write MsSQL DDL --------#
    #---------------------------------#
    print '> Building MsSQL DDL...'
    outdir = os.path.join(os.path.abspath(opts.output), 'ODM2_for_MSSQL.sql')
    with open(outdir, 'w') as f:
        f.write(translator.MSSQL(opts, ddl_objs).build_ddl())

def BUILD_POSTGRES_DDL(opts, ddl_objs, use_schemas):
    #--------------------------------------#
    #-------- Write PostgreSQL DDL --------#
    #--------------------------------------#
    print '> Building PostgreSQL DDL...'
    outdir = os.path.join(os.path.abspath(opts.output), 'ODM2_for_PostgreSQL.sql')
    with open(outdir, 'w') as f:
        f.write(translator.POSTGRESQL(opts, ddl_objs).build_ddl())

def BUILD_MYSQL_DDL(opts, ddl_objs, use_schemas):
    #---------------------------------#
    #-------- Write MySQL DDL --------#
    #---------------------------------#
    print '> Building MySQL DDL...'
    outdir = os.path.join(os.path.abspath(opts.output), 'ODM2_for_MySQL.sql')
    with open(outdir, 'w') as f:
        f.write(translator.MYSQL(opts, ddl_objs).build_ddl())

def BUILD_SQLITE_DDL(opts, ddl_objs, use_schemas):
    #----------------------------------#
    #-------- Write SQLite DDL --------#
    #----------------------------------#
    print '> Building SQLite DDL...'
    outdir = os.path.join(os.path.abspath(opts.output), 'ODM2_for_SQLite.sql')
    with open(outdir, 'w') as f:
        f.write(translator.SQLITE(opts, ddl_objs).build_ddl())

def BUILD_ALL(opts, ddl_objs, use_schemas):

    BUILD_MSSSQL_DDL(opts, ddl_objs, use_schemas)

    BUILD_POSTGRES_DDL(opts, ddl_objs, use_schemas)

    BUILD_MYSQL_DDL(opts, ddl_objs, use_schemas)

    BUILD_SQLITE_DDL(opts, ddl_objs, use_schemas)




def parse_args(arg):

    # check if input file exists
    if not os.path.exists(arg.xml):
        print '> could not find [XML] path: %s'%arg.xml
        return

    # parse XML
    print '> Parsing XML...'
    objs = parse_xml(arg.xml)

    # build DDLs
    if arg.database.lower() == 'mssql': BUILD_MSSSQL_DDL(arg, objs, use_schemas)
    elif arg.database.lower() == 'mysql': BUILD_MYSQL_DDL(arg, objs, use_schemas)
    elif arg.database.lower() == 'postgresql': BUILD_POSTGRES_DDL(arg, objs, use_schemas)
    elif arg.database.lower() == 'sqlite': BUILD_SQLITE_DDL(arg, objs, use_schemas)
    elif arg.database.lower() == 'all': BUILD_ALL(arg, objs, use_schemas)
    else: print '> error in input arguments %s %s %s' %(arg.xml,arg.database,use_schemas)


def main(argv):
    print '|---------------------------------|'
    print '|          Welcome to the         |'
    print '|     ODM2 DDL Building Tool      |'
    print '|---------------------------------|'
    print '   Warning: Use at your own risk!   '
    print '\nPlease enter a command or type "-h, --help" for a list of commands'

    usage = "Usage: %s [options]" % basename(__file__).split('.')[0]

    parser = OptionParser(usage = usage )
    parser.add_option('-u','--use-schemas', help='Indicates that schemas should be used when building the DDL', default=False,action = 'store_true')
    parser.add_option('-d','--database', help='Type of database to generate the DDL for, (e.g. mssql, mysql, postgresql, sqlite, all)',default='all')
    parser.add_option('-x', '--xml', help='A DbWrench XML file path',default=None)
    parser.add_option('-c','--maintain-case', help='Maintain CamelCasing in DDL',default=False,action = 'store_true')
    parser.add_option('-o','--output', help='The output directory for the DDL script',default=join(dirname(__file__),'ddl'))
    parser.add_option('-g','--global-schema', help='Specifies the name of a single (global) schema to be used',default='ODM2')


    try:

        (opts,cmd) = parser.parse_args()

        # make sure XML path is given
        if opts.xml is None:
            print '> [Error] XML file path not given'

        else:

            # make output directory
            if not os.path.exists(opts.output):
                os.makedirs(opts.output)

            print '\n' + 50*'-'
            print '> [SETTING] Build DDL for             : %s'%opts.database
            print '> [SETTING] Use Schemas               : %s'%opts.use_schemas
            print '> [SETTING] Global Schema Name        : %s'%opts.global_schema
            print '> [SETTING] Maintain Case Sensitivity : %s'%opts.maintain_case
            print '> [SETTING] Output Directory          : %s'%opts.output
            print 50*'-' + '\n'

            parse_args(opts)

    except Exception, e:
        print e




if __name__ == '__main__':
    main(sys.argv[1:])