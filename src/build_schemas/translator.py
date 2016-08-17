__author__ = 'tonycastronova'
from math import floor, ceil
import data_mapping

class MSSQL():
    def __init__(self, options, dbwrenchObj):
        self.__schemas = dbwrenchObj
        self.__use_schemas = options.use_schemas
        self.map = data_mapping.MSSQL()
        self.__global_schema = options.global_schema

    def build_ddl(self):
        ddl_text = ''

        #Drop the database called 'ODM2' if it exists and then create a new database called 'ODM2'
        ddl_text += "-- Drop the database called 'ODM2' if it exists and then create a new database called 'ODM2'"
        ddl_text += '\nUSE master;'
        ddl_text += '\nGO\n'

        ddl_text += "\nIF DB_ID(N'ODM2') IS NOT NULL"
        ddl_text += '\nDROP DATABASE ODM2;'
        ddl_text += '\nGO\n'

        ddl_text += '\nCREATE DATABASE ODM2;'
        ddl_text += '\nGO\n'

        ddl_text += '\nUSE ODM2;'
        ddl_text += '\nGO\n'


        if self.__use_schemas:
            for obj in set(self.__schemas):
                # create schema
                ddl_text += '\nCREATE SCHEMA %s;' % obj.name()
                ddl_text += ('\nGO\n')
        else:
            # create global schema
            ddl_text += '\nCREATE SCHEMA %s;' % self.__global_schema
            ddl_text += ('\nGO\n')


        #write table data
        for obj in self.__schemas:
            ddl_text += self._schema2mssql(obj, self.__use_schemas)

        # write foreign keys
        for obj in self.__schemas:
            ddl_text += self._foreignkey2mssql(obj, self.__use_schemas)

        return ddl_text

    def _schema2mssql(self, schema, use_schemas):

        # add table comment
        ddl_text = write_title_comment('CREATE %s'%schema.name().upper())

        for tbl in schema.get_tables():
            if use_schemas:
                ddl_text +=  self._table2mssql(schema.name()+'.', tbl)
            else:
                ddl_text +=  self._table2mssql(self.__global_schema+'.',tbl)
        return ddl_text

    def _table2mssql(self,schema_name,tbl):

        ddl = ('\nCREATE TABLE %s%s (' % (schema_name, tbl.name()))

        for col in tbl.get_columns():
            ddl += self._column2mssql(col)

        # add primary key
        ddl += '\n\tPRIMARY KEY (%s)' % tbl.pk().attrib['ClNs']

        # add constraints
        uc = tbl.uniqueconstraint()
        if uc is not None:
            constraints = uc.get_classnames()
            constraint_string = ''
            if len(constraints) > 16:
                print '\n\tWARNING: Table "%s" contains more than 16 constraints which is not allowed in SQL Server.  \n\tI will use the first 16 values that I encounter, which may result unintended functionality. \n\tIt is recommended that you revisit the database *.xml file and adjust these constraints to satisfy SQL Server limitations.\n' % (tbl.name())
                constraint_string = ','.join(constraints[:16])
            else:
                constraint_string = ','.join(constraints)
            uc_name = uc.name()
            ddl += ',\n\tCONSTRAINT %s UNIQUE (%s) ' % (uc_name, ','.join(uc.get_classnames()))

        return ddl + '\n)'

    def _column2mssql(self, column):
        ddl = ''

        att = column.get_attributes()
        name = att['name']
        type = self.map.map_data_type(att['dtype'] )
        ln = '('+att['length']+')' if att['length'] is not None else ''
        nu = 'NOT NULL' if not att['nullable'] else 'NULL'
        pk = 'IDENTITY (1,1)' if att['autoincrement'] else ''

        ddl = '\n\t%s %s %s %s %s' % (name, type, ln, pk, nu)

        return ddl.rstrip(' ')+','

    def _foreignkey2mssql(self, schema,use_schemas=True):
        ddl_text = ''
        for tbl in schema.get_tables():
            for fk in tbl.get_foreignkeys():
                if use_schemas:
                    ddl_text +=  '\n\nALTER TABLE %s%s ADD CONSTRAINT %s' \
                                 '\nFOREIGN KEY (%s) REFERENCES %s%s (%s)' \
                                 '\nON UPDATE NO ACTION ON DELETE NO ACTION' \
                                % (fk.childSch+'.', fk.childTbl, fk.name, fk.childCol, fk.parentSch+'.', fk.parentTbl, fk.parentCol)
                else:
                    ddl_text +=  '\n\nALTER TABLE %s%s ADD CONSTRAINT %s' \
                                 '\nFOREIGN KEY (%s) REFERENCES %s%s (%s)' \
                                 '\nON UPDATE NO ACTION ON DELETE NO ACTION' \
                                % (self.__global_schema+'.', fk.childTbl, fk.name, fk.childCol, self.__global_schema+'.', fk.parentTbl, fk.parentCol)

        return ddl_text

    def _unique2mssql(self, schema, use_schemas=True):
        print 'TODO: CHECK!'
        ddl_text = ''
        for tbl in schema.get_tables():
            uc = tbl.get_uniqueconstraints()
            if len(uc) > 0:
                tblname = tbl.name()
                if use_schemas:
                    tblname = schema.name() + tblname

                for constraint in uc:
                    ddl_text += '\n\nALTER TABLE %s ADD CONSTRAINT %s' \
                            '\nUNIQUE (%s)' \
                            % (tblname, constraint.name(), ','.join(constraint.get_classnames()))
        return ddl_text

class POSTGRESQL():
    def __init__(self, options, dbwrenchObj):
        self.__schemas = dbwrenchObj
        self.__use_schemas = options.use_schemas
        self.map = data_mapping.POSTGRESQL()
        self.__case_sensitive = options.maintain_case
        self.__global_schema = options.global_schema

    def build_ddl(self, include_postgis=True):

        ddl_text = ''

        if include_postgis:
            ddl_text += '\nCREATE EXTENSION if not exists postgis;'
            ddl_text += '\nCREATE EXTENSION if not exists postgis_topology;'
            ddl_text += '\nCREATE EXTENSION if not exists fuzzystrmatch;'
            ddl_text += '\nCREATE EXTENSION if not exists postgis_tiger_geoCoder;\n'

        if self.__use_schemas:
            # drop schemas
            for obj in set(self.__schemas):
                ddl_text += '\ndrop schema if exists %s cascade;' % obj.name()
            ddl_text +='\n'

            # create schemas
            for obj in set(self.__schemas):
                ddl_text +='\ncreate schema %s;' % obj.name()
            ddl_text +='\n'
        else:
            ddl_text += '\ndrop schema if exists %s cascade;\n' % self.__global_schema
            ddl_text +='\ncreate schema %s;\n' % self.__global_schema


        # create tables
        for obj in self.__schemas:
            ddl_text += self._schema2postgres(obj, self.__use_schemas)

        # create foreign keys
        for obj in self.__schemas:
            ddl_text += self._foreignkey2postgres(obj,self.__use_schemas)

        return ddl_text

    def _column2postgres(self, column):
        ddl = ''

        att = column.get_attributes()
        name = att['name'].lower()
        type = self.map.map_data_type(att['dtype'])
        ln = '('+att['length']+')' if att['length'] is not None else ''
        nu = 'NOT NULL' if not att['nullable'] else 'NULL'
        pk = 'primary key' if att['primarykey'] else ''

        if att['autoincrement']:
            # map numeric types to their autoincrement equivilent
            # type = _mapPostgresAutoIncrement(type)
            type = self.map.mapAutoIncrement(type)

        ddl = '\n\t%s %s %s %s %s' % (name, type, ln, nu, pk)

        return ddl.rstrip(' ')+','

    def _table2postgres(self,schema_name, tbl):

        tblname = tbl.name()
        if self.__case_sensitive:
            tblname = '"%s"'%tblname

            if self.__use_schemas:
                schema_name = '"%s"'%schema_name[:-1]+'.'

        ddl = ('\ncreate table %s%s (' % (schema_name, tblname))

        for col in tbl.get_columns():
            ddl += self._column2postgres(col)

        # add constraints
        uc = tbl.uniqueconstraint()
        if uc is not None:
            ddl += '\n\tUNIQUE (%s) ' % (','.join(uc.get_classnames()))

        return ddl[:-1] + '\n);'

    def _schema2postgres(self,schema,use_schemas=True):

        # add table comment
        ddl_text = write_title_comment('CREATE %s'%schema.name().upper())

        for tbl in schema.get_tables():
            if use_schemas:
                ddl_text +=  self._table2postgres(schema.name()+'.', tbl)
            else:
                ddl_text +=  self._table2postgres(self.__global_schema+'.', tbl)
        return ddl_text

    def _foreignkey2postgres(self,schema,use_schemas=True):
        ddl_text = ''
        for tbl in schema.get_tables():
            for fk in tbl.get_foreignkeys():
                if use_schemas:
                    ddl_text +=  '\n\nalter table %s%s add constraint %s' \
                                 '\nforeign key (%s) References %s%s (%s)' \
                                 '\non update no Action on delete cascade;' \
                                % (fk.childSch+'.', fk.childTbl, fk.name, fk.childCol, fk.parentSch+'.', fk.parentTbl, fk.parentCol)
                else:
                    ddl_text +=  '\n\nalter table %s%s add constraint %s' \
                                 '\nforeign key (%s) References %s%s (%s)' \
                                 '\non update no Action on delete cascade;' \
                                % (self.__global_schema+'.', fk.childTbl, fk.name, fk.childCol, self.__global_schema+'.', fk.parentTbl, fk.parentCol)

        return ddl_text

class MYSQL():
    def __init__(self, options, dbwrenchObj):
        self.__schemas = dbwrenchObj
        self.__use_schemas = options.use_schemas
        self.map = data_mapping.MYSQL()
        self.__global_schema = options.global_schema

    def build_ddl(self, include_postgis=True):

        ddl_text = ''

        if self.__use_schemas:
            # write schema data
            ddl_text += '\nSET FOREIGN_KEY_CHECKS = 0;'
            for obj in set(self.__schemas):
                # drop schema
                ddl_text += '\nDROP SCHEMA IF EXISTS %s;' % obj.name()
            ddl_text += '\nSET FOREIGN_KEY_CHECKS = 1;\n'

            for obj in set(self.__schemas):
                # create schema
                ddl_text += '\nCREATE SCHEMA IF NOT EXISTS %s;' % obj.name()
            ddl_text += '\n'
        else:
            ddl_text += '\nDROP SCHEMA IF EXISTS %s;\n' % self.__global_schema
            ddl_text += '\nCREATE SCHEMA IF NOT EXISTS %s;\n' % self.__global_schema

        # write table data
        for obj in self.__schemas:
            ddl_text += self._schema2mysql(obj, self.__use_schemas)

        # write foreign keys
        for obj in self.__schemas:
            ddl_text += self._foreignkey2mysql(obj,self.__use_schemas)

        return ddl_text

    def _schema2mysql(self, schema,use_schemas=True):


        # add table comment
        ddl_text = write_title_comment('CREATE %s'%schema.name().upper())
        if use_schemas:
            ddl_text += 'USE %s;\n'%schema.name()
        else:
            ddl_text += 'USE %s;\n'%self.__global_schema

        for tbl in schema.get_tables():
            if use_schemas:
                ddl_text +=  self._table2mysql(tbl)
            else:
                ddl_text +=  self._table2mysql(tbl)
        return ddl_text

    def _table2mysql(self,tbl):


        ddl = ('\nCREATE TABLE %s (' % tbl.name())

        for col in tbl.get_columns():
            ddl += self._column2mysql(col)

        # add constraints
        uc = tbl.uniqueconstraint()
        if uc is not None:
            constraints = uc.get_classnames()
            constraint_string = ''
            if len(constraints) > 16:
                print '\n\tWARNING: Table "%s" contains more than 16 constraints which is not allowed in MySQL Server.  \n\tI will use the first 16 values that I encounter, which may result unintended functionality. \n\tIt is recommended that you revisit the database *.xml file and adjust these constraints to satisfy MySQL limitations.\n' % (tbl.name())
                constraint_string = ','.join(constraints[:16])
            else:
                constraint_string = ','.join(constraints)
            uc_name = uc.name()
            ddl += '\n\tCONSTRAINT %s UNIQUE (%s) ' % (uc_name, constraint_string)

        return ddl[:-1] + '\n);\n'

    def _column2mysql(self, column):
        ddl = ''

        att = column.get_attributes()
        name = att['name']
        type = self.map.map_data_type(att['dtype'])
        #type = self.map._mapMySQLDataTypes(att['dtype'])
        ln = '('+att['length']+')' if att['length'] is not None else ''
        nu = 'NOT NULL' if not att['nullable'] else 'NULL'
        pk = 'PRIMARY KEY' if att['primarykey'] else ''
        au = 'AUTO_INCREMENT' if att['autoincrement'] else ''

        ddl = '\n\t%s %s %s %s %s %s' % (name, type, ln, au, nu, pk)

        return ddl.rstrip(' ')+','

    def _foreignkey2mysql(self, schema,use_schemas=True):
        ddl_text = ''
        for tbl in schema.get_tables():
            for fk in tbl.get_foreignkeys():
                if use_schemas:
                    ddl_text +=  '\n\nALTER TABLE %s%s ADD CONSTRAINT %s' \
                                 '\nFOREIGN KEY (%s) REFERENCES %s%s (%s)' \
                                 '\nON UPDATE NO ACTION ON DELETE NO ACTION;' \
                                % (fk.childSch+'.', fk.childTbl, fk.name, fk.childCol, fk.parentSch+'.', fk.parentTbl, fk.parentCol)
                else:
                    ddl_text +=  '\n\nALTER TABLE %s%s ADD CONSTRAINT %s' \
                                 '\nFOREIGN KEY (%s) REFERENCES %s%s (%s)' \
                                 '\nON UPDATE NO ACTION ON DELETE NO ACTION;' \
                                % ('', fk.childTbl, fk.name, fk.childCol, '', fk.parentTbl, fk.parentCol)

        return ddl_text

    # def _unique2mysql(self, schema, use_schemas=True):
    #     ddl_text = ''
    #     for tbl in schema.get_tables():
    #         uc = tbl.uniqueconstraint()
    #         if uc is not None:
    #             tblname = tbl.name()
    #             if use_schemas:
    #                 tblname = schema.name() + tblname
    #
    #             ddl_text += '\n\nALTER TABLE %s ADD CONSTRAINT %s' \
    #                     '\nUNIQUE (%s)' \
    #                     % (tblname, uc.name(), ','.join(uc.get_classnames()))
    #     return ddl_text

class SQLITE():
    def __init__(self, options, dbwrenchObj):
        self.__schemas = dbwrenchObj
        self.__use_schemas = options.use_schemas
        self.map = data_mapping.SQLITE()
        self.__global_schema = options.global_schema

    def build_ddl(self, include_postgis=True):

        ddl_text = ''
        
        # SQLite doesn't use schemas, so no need to do anything with schemas.
        
        # write table data including foreign keys because foreign key creation must be in the create table statement
        for obj in self.__schemas:
            ddl_text += self._schema2sqlite(obj, self.__use_schemas)

        # The other databases write foreign keys here, but for SQLite it has to be done as part of the table creation

        return ddl_text

    def _schema2sqlite(self, schema, use_schemas=True):

        # add table comment
        ddl_text = write_title_comment('CREATE %s' % schema.name().upper())

        for tbl in schema.get_tables():
            ddl_text += self._table2sqlite(tbl)

        return ddl_text

    def _table2sqlite(self, tbl):

        ddl = ('\nCREATE TABLE %s (' % tbl.name())

        # add table columns
        for col in tbl.get_columns():
            ddl += self._column2sqlite(col)

        # add foreign keys
        for fk in tbl.get_foreignkeys():
            ddl +=  '\n\tFOREIGN KEY (%s) REFERENCES %s (%s)' \
                    '\n\tON UPDATE NO ACTION ON DELETE NO ACTION,' \
                    % (fk.childCol, fk.parentTbl, fk.parentCol)

        # add constraints
        uc = tbl.uniqueconstraint()
        if uc is not None:
            ddl += '\n\tUNIQUE (%s) ' % (','.join(uc.get_classnames()))

        return ddl[:-1] + '\n);\n'

    def _column2sqlite(self, column):
        
        ddl = ''

        att = column.get_attributes()
        name = att['name']
        type = self.map.map_data_type(att['dtype'])
        #type = self.map._mapMySQLDataTypes(att['dtype'])
        ln = '('+att['length']+')' if att['length'] is not None else ''
        nu = 'NOT NULL' if not att['nullable'] else 'NULL'
        pk = 'PRIMARY KEY' if att['primarykey'] else ''
        # au = 'AUTO_INCREMENT' if att['autoincrement'] else ''
        # For SQLite, primary key columns automatically autoincrement
        # The auto_increment flag was causing problems
        au = ''

        ddl = '\n\t%s %s %s %s %s %s' % (name, type, ln, au, nu, pk)

        return ddl.rstrip(' ')+','


def write_title_comment(title):
    # center the text
    width = 75.
    center = len(title) + 2
    left = int(floor((width-center)/2))
    right = int(ceil((width-center)/2))

    # assemble the comment
    text = '\n/'+int(width)*'*'+'/\n'
    text += '/'+left*'*'
    text += ' %s ' % title
    text += right*'*'+'/\n'
    text += '/'+int(width)*'*'+'/\n'

    return text

