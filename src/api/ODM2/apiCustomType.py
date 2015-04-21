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
            el = element.name.replace('_', '')
            path = "[SamplingFeatures_1].[FeatureGeometry]"
            format = "%s.%s(%s)"
            return format % (path, el, val)
        #GEOMETRY::ST_GeomFromText

        elif isinstance(compiler, MySQLCompiler):
            el = element.name.split('_')[1].lower()
            path = "`ODM2`.`SamplingFeatures`.`FeatureGeometry`"
            format = "%s(%s)"
            return format % (el, path)

        else:
            el = element.name
            path = '"odm2"."samplingfeatures"."FeatureGeometry"'
            format = "%s(%s)"
            return format % (el, path)

    return cls

def save_as_bound(cls):
    @compiles(cls)
    def compile_function(element, compiler, **kw):
        #print type(compiler)

        if isinstance(compiler, MSSQLCompiler):
            val = ", ".join([compiler.process(e) for e in element.clauses.clauses[1:]])
            el = element.name.replace('_', '')
            #path = "[SamplingFeatures_1].[FeatureGeometry]"
            format = "%s.%s(%s)"
            return format % ( el, val)
        #GEOMETRY::ST_GeomFromText

        elif isinstance(compiler, MySQLCompiler):
            el = element.name.split('_')[1].lower()
            #path = "`ODM2`.`SamplingFeatures`.`FeatureGeometry`"
            format= "%s(%s)"
            return format % (el, ":FeatureGeometry")

        else:
            el = element.name
            #path = '"ODM2"."SamplingFeatures"."FeatureGeometry"'
            format = "%s(%s)"
            return format % (el)






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

@save_as_bound
class ST_GeomFromText(FunctionElement):
    name = 'ST_GeomFromText'



class Geometry(GeometryBase):
    from_text = 'Geometry::STGeomFromText'
    from_text = 'GeomFromText'

    def column_expression(self, col):

        value = ST_AsText(col, type_=self)
        if value is  None:
            value = func.ST_AsText(col, type_=self)
        return value


    def bind_expression(self, bindvalue):
        #return func.ST_GeomFromText(bindvalue, type_=self)
        #value = ST_GeomFromText(bindvalue,  type_=self)
        value= getattr(func, self.from_text)(bindvalue, type_=self)
        if value is  None:
            value = func.ST_GeomFromText(bindvalue, type_=self)
        return value

    def getfuncname(self):
        pass





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

