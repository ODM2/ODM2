__author__ = 'tonycastronova'

class POSTGRESQL():
    def __init__(self):
        pass

    def map_data_type(self,type):

        type = self._fixTypeNames(type.lower())
        type = self._mapPostgresDataTypes(type.lower())
        return type

    def _fixTypeNames(self, type):
        fixNames = {
            'int4'    : 'integer',
            'int'     : 'integer',
            'bool'    : 'boolean',
            'float8'  : 'double precision',
            'int8'    : 'bigint',
            'serial8' : 'bigserial',
            'serial4' : 'serial',
            'float4'  : 'real',
            'int2'    : 'smallint',
            'character varying' : 'varchar',
            'datetime' : 'timestamp',
            'uniqueid' : 'uuid'

        }
        if type in fixNames:
            return fixNames[type]


        return type

    def _mapPostgresDataTypes(self, type):
        dtype_equiv = {
            'bigint':'bigint',
            'binary':'bytea',
            'bit':'bit',
            'blob':'bytea',
            'boolean':'boolean',
            'char ':'character',
            'date':'date',
            'datetime':'timestamp',
            'decimal ':'real',
            'double':'double precision',
            'float':'double precision',
            'integer':'integer',
            'mediumint':'integer',
            'money':'money',
            'number':'real',
            'numeric':'numeric',
            'real':'real',
            'smallint':'smallint',
            'text':'text',
            'time':'time',
            'timestamp':'timestamp',
            'tinyint':'smallint',
            'uniqueid':'uuid',
            'uuid':'uuid',
            'varbinary':'bit',
            'varchar':'varchar',
            'varchar2':'varchar',
        }

        if type in dtype_equiv:
            return dtype_equiv[type]


        return type

    def mapAutoIncrement(self, type):
        dtype_equiv = {
            "smallint" :"serial",
            "integer" :"serial",
            "bigint" :"bigserial",
            "decimal" :"serial",
            "numeric" :"serial",
            "real" :"serial",
            "double precision" :"bigserial",
            }

        if type in dtype_equiv:
            return dtype_equiv[type]


        return type


class MYSQL():
    def __init__(self):
        pass

    def map_data_type(self,type):

        type = self._mapMySQLDataTypes(type.lower())
        return type

    def _mapMySQLDataTypes(self, type):
        dtype_equiv = {
            'bigint':'BIGINT',
            'binary':'BINARY',
            'bit':'BIT',
            'blob':'BLOB',
            'boolean':'BIT',
            'char ':'CHAR',
            'date':'DATE',
            'datetime':'DATETIME',
            'decimal ':'DECIMAL',
            'double':'DOUBLE',
            'float':'FLOAT',
            'integer':'INT',
            'mediumint':'MEDIUMINT',
            'money':'NUMERIC',
            'number':'NUMERIC',
            'numeric':'NUMERIC',
            'real':'DECIMAL',
            'smallint':'SMALLINT',
            'text':'TEXT',
            'time':'TIME',
            'timestamp':'TIMESTAMP',
            'tinyint':'TINYINT',
            'uniqueid':'VARCHAR(36)',
            'uuid':'BINARY',
            'varbinary':'VARBINARY',
            'varchar':'VARCHAR',
            'varchar2':'VARCHAR',
        }

        if type in dtype_equiv:
            return dtype_equiv[type]


        return type

class SQLITE():
    def __init__(self):
        pass

    def map_data_type(self,type):

        type = self._mapSQLiteDataTypes(type.lower())
        return type

    def _mapSQLiteDataTypes(self, type):
        dtype_equiv = {
            'bigint':'BIGINT',
            'binary':'BINARY',
            'bit':'BIT',
            'blob':'BLOB',
            'boolean':'BIT',
            'char ':'CHAR',
            'date':'DATE',
            'datetime':'DATETIME',
            'decimal ':'DECIMAL',
            'double':'DOUBLE',
            'float':'FLOAT',
            'integer':'INTEGER',
            'mediumint':'MEDIUMINT',
            'money':'NUMERIC',
            'number':'NUMERIC',
            'numeric':'NUMERIC',
            'real':'DECIMAL',
            'smallint':'SMALLINT',
            'text':'TEXT',
            'time':'TIME',
            'timestamp':'TIMESTAMP',
            'tinyint':'TINYINT',
            'uniqueid':'VARCHAR(36)',
            'uuid':'BINARY',
            'varbinary':'VARBINARY',
            'varchar':'VARCHAR',
            'varchar2':'VARCHAR',
        }

        if type in dtype_equiv:
            return dtype_equiv[type]

        return type

class MSSQL():
    def __init__(self):
        pass

    def map_data_type(self,type):

        type = self._mapMsSQLDataTypes(type.lower())
        return type

    def _mapMsSQLDataTypes(self, type):
        dtype_equiv = {
            'bigint':'bigint',
            'binary':'binary',
            'bit':'bit',
            'blob':'binary',
            'boolean':'bit',
            'char ':'char',
            'date':'date',
            'datetime':'datetime',
            'decimal ':'decimal',
            'double':'float',
            'float':'float',
            'integer':'int',
            'mediumint':'int',
            'money':'money',
            'number':'numeric',
            'numeric':'numeric',
            'real':'real',
            'smallint':'smallint',
            'text':'text',
            'time':'time',
            'timestamp':'timestamp',
            'tinyint':'tinyint',
            'uniqueid':'uniqueidentifier',
            'uuid':'uniqueidentifier',
            'varbinary':'varbinary',
            'varchar':'varchar',
            'varchar2':'varchar',
        }

        if type in dtype_equiv:
            # print '%s -> %s'% (type,dtype_equiv[type])
            return dtype_equiv[type]


        return type
