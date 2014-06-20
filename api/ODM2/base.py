

from ODMconnection import SessionFactory

from sqlalchemy.ext.declarative import declarative_base


class serviceBase():

    def __init__(self, connection_string, debug=False):
        self._session_factory = SessionFactory(connection_string, debug)
        self._session = self._session_factory.getSession()
        self._debug = debug
        #self._session


class modelBase():

    Base = declarative_base()
    metadata = Base.metadata
