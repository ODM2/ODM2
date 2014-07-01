
from ODMconnection import SessionFactory


from sqlalchemy.ext.declarative import declarative_base


class serviceBase(object):

    def __init__(self, connection_string=None, existing_session=None, debug=False):
        if connection_string:
            self._session_factory = SessionFactory(connection_string, debug)
            self._session = self._session_factory.getSession()
        elif existing_session:
            self._session_factory = existing_session
            self._session = self._session_factory.getSession()
        else:
            if self._session_factory is None:
                pass

        self._debug = debug
        #self._session

    #self._session_factory=""
   # def getSessionFactory( session = None):


class modelBase():

    Base = declarative_base()
    metadata = Base.metadata
