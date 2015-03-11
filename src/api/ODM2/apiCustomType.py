from sqlalchemy.dialects.mssql.base import MSSQLCompiler
from sqlalchemy.dialects.mysql.mysqldb import MySQLCompiler
from sqlalchemy import func
from sqlalchemy.sql.expression import FunctionElement
from sqlalchemy.types import UserDefinedType
from sqlalchemy.ext.compiler import compiles


from geoalchemy2 import Geometry as GeometryBase


def compiles_as_bound(cls):
    @compiles(cls)
    def compile_function(element, compiler, **kw):
        #print type(compiler)

        if isinstance(compiler, MSSQLCompiler):
            val = ", ".join([compiler.process(e) for e in element.clauses.clauses[1:]])
            element = element.name.replace('_', '')
            path = "[SamplingFeatures_1].[FeatureGeometry]"
            format = "%s.%s(%s)"
            return format % (path, element, val)

        elif isinstance(compiler, MySQLCompiler):
            element = element.name.split('_')[1].lower()
            path = "`ODM2`.`SamplingFeatures`.`FeatureGeometry`"
            format = "%s(%s)"
            return format % (element, path)

        else:
            element = element.name
            path = '"ODM2"."SamplingFeatures"."FeatureGeometry"'
            format = "%s(%s)"
            return format % (element, path)

    return cls


        #works
    '''
        if isinstance(compiler, MSSQLCompiler):
            #return "%s.%s(%s)" % (element.clauses.clauses[0], element.name,", ".join([compiler.process(e) for e in element.clauses.clauses[1:]]))
            return "%s.%s(%s)" % ("[SamplingFeatures_1].[FeatureGeometry]", element.name,", ".join([compiler.process(e) for e in element.clauses.clauses[1:]]))
        elif isinstance(compiler, MySQLCompiler):
            return "%s(%s)"%("astext", "`ODM2`.`SamplingFeatures`.`FeatureGeometry`")
        else:
            return "%s(%s)"%("ST_AsText", "\"ODM2\".\"SamplingFeatures\".\"FeatureGeometry\"")
    return cls
    '''



@compiles_as_bound
class ST_AsText(FunctionElement):
    name = 'ST_AsText'

@compiles_as_bound
class ST_AsBinary(FunctionElement):
    name = 'ST_AsBinary'

@compiles_as_bound
class ST_GeomFromText(FunctionElement):
    name = 'ST_GeomFromText'



class Geometry(GeometryBase):
    from_text = 'ST_GeomFromText'

    def column_expression(self, col):

        value = ST_AsText(col, type_=self)
        if value is  None:
            value = func.ST_AsText(col, type_=self)
        return value

    def bind_expression(self, bindvalue):
        return func.ST_GeomFromText(bindvalue, type_=self)



'''
from sqlalchemy import func
from sqlalchemy.types import UserDefinedType

class Geometry(UserDefinedType):
    def get_col_spec(self):
        return "GEOMETRY"

    def bind_expression(self, bindvalue):
        return func.ST_GeomFromText(bindvalue, type_=self)

    def column_expression(self, col):
        return func.ST_AsText(col, type_=self)


'''