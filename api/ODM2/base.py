from ODMconnection import SessionFactory


class serviceBase():

    def __init__(self, connection_string, debug=False):
        self._session_factory = SessionFactory(connection_string, debug)
        self._session = self._session_factory.getSession()
        self._debug = debug


from sqlalchemy import func
from sqlalchemy.types import UserDefinedType
class Geometry(UserDefinedType):
    def get_col_spec(self):
        return "GEOMETRY"
    def bind_expression(self, bindvalue):
        return func.GeomFromText(bindvalue, type_=self)
    def column_expression(self, col):
        return func.STAsText(col, type_=self)