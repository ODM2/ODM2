



from sqlalchemy.ext.declarative import declarative_base

class Singleton(type):
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(Singleton, cls).__call__(*args, **kwargs)
            print "Singleton", cls._instances[cls]
        return cls._instances[cls]

class serviceBase(object):

    __metaclass__ = Singleton

    def __init__(self,  session_factory, debug=False):

        self._session_factory = session_factory
        self._session = session_factory.getSession()
        # self._session.autoflush = False
        print "Session ", self._session

        # print "ServiceBase Called!", self._session


        self._debug = debug
        #self._session

    #self._session_factory=""
   # def getSessionFactory( session = None):
    def getSession(self):
        return self._session


class modelBase():

    Base = declarative_base()
    metadata = Base.metadata
