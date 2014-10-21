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
        print type(compiler)
        if isinstance(compiler, MSSQLCompiler):
            #return "%s.%s(%s)" % (element.clauses.clauses[0], element.name,", ".join([compiler.process(e) for e in element.clauses.clauses[1:]]))
            return "%s.%s(%s)" % ("[SamplingFeatures_1].[FeatureGeometry]", element.name,", ".join([compiler.process(e) for e in element.clauses.clauses[1:]]))
        elif isinstance(compiler, MySQLCompiler):
            return "%s(%s)"%("ST_AsText", "`ODM2`.`SamplingFeatures`.`FeatureGeometry`")
        else:
            return "%s(%s)"%("ST_AsText", "\"ODM2\".\"SamplingFeatures\".\"FeatureGeometry\"")
    return cls


@compiles_as_bound
class ST_AsText(FunctionElement):
    name = 'STAsText'



@compiles_as_bound
class ST_AsBinary(FunctionElement):
    name = 'STAsBinary'



class Geometry(GeometryBase):

    def column_expression(self, col):

        value = ST_AsText(col, type_=self)

        if value is  None:
            value = func.ST_AsText(col, type_=self)
        return value