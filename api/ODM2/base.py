



from sqlalchemy.ext.declarative import declarative_base


class serviceBase(object):

    def __init__(self,  connection, debug=False):

        self._session_factory = connection
        self._session = connection.getSession()


        self._debug = debug
        #self._session

    #self._session_factory=""
   # def getSessionFactory( session = None):


class modelBase():

    Base = declarative_base()
    metadata = Base.metadata
