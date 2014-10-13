from sqlalchemy.exc import SQLAlchemyError, DBAPIError
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

class SessionFactory():
    def __init__(self, connection_string, echo):
        self.engine = create_engine(connection_string, encoding='utf-8', echo=echo, pool_recycle=3600, pool_timeout=5, pool_size=20,
                                    max_overflow=0)
        self.psql_test_engine = create_engine(connection_string, encoding='utf-8', echo=echo, pool_recycle=3600, pool_timeout=5,
                                    max_overflow=0,  connect_args={'connect_timeout': 1})
        self.ms_test_engine = create_engine(connection_string, encoding='utf-8', echo=echo, pool_recycle=3600, pool_timeout=5,
                                    max_overflow=0,  connect_args={'timeout': 1})


        # Create session maker
        self.Session = sessionmaker(bind=self.engine)
        self.psql_test_Session = sessionmaker(bind=self.psql_test_engine)
        self.ms_test_Session = sessionmaker(bind=self.ms_test_engine)

    def getSession(self):
        return self.Session()

    def __repr__(self):
        return "<SessionFactory('%s')>" % (self.engine)



class dbconnection():
    def __init__(self, debug=False):
        self.debug = debug
        self._connections = []
        self.version = 0
        self._connection_format = "%s+%s://%s:%s@%s/%s"

    @classmethod
    def createConnection(self, engine, address, db, user, password):
        connection_string= dbconnection.buildConnDict(dbconnection(), engine, address, db, user, password)
        #if self.testConnection(connection_string):
        if self.testEngine(connection_string):
            #print "sucess"
            return SessionFactory(connection_string, echo  = False)
        else:
            return None

    @classmethod
    def testEngine(self, connection_string):
        s= SessionFactory(connection_string, echo  = False)
        try:
            if 'mssql' in connection_string:
                s.ms_test_Session().execute("Select top 1 VariableCode From Variables")
            elif 'postgresql' in connection_string:
                s.psql_test_Session().execute('Select "VariableCode" From "ODM2Core"."Variables" Limit 1')
                #s.psql_test_Session().execute('Select "VariableNameCV" From "ODM2Core"."Variables" Limit 1')
            elif 'mysql' in connection_string:
                s.psql_test_Session().execute('Select "VariableCode" From "ODM2Core"."Variables" Limit 1')

        except Exception as e:
            print "session was crap ", e.message
            return False
        return True



    def buildConnDict(self, engine, address, db, user, password):
        line_dict = {}
        line_dict['engine'] = engine
        line_dict['user'] = user
        line_dict['password'] = password
        line_dict['address'] = address
        line_dict['db'] = db
        self._connections.append(line_dict)
        self._current_connection = self._connections[-1]
        return self.__buildConnectionString(line_dict)

    def getConnections(self):
        return self._connections

    def getCurrentConnection(self):
        return self._current_connection

    def addConnection(self, conn_dict):
        """conn_dict must be a dictionary with keys: engine, user, password, address, db"""

        # remove earlier connections that are identical to this one
        self.deleteConnection(conn_dict)

        self._connections.append(conn_dict)
        self._current_connection = self._connections[-1]


    def testConnection(self, conn_dict):
        try:
            self.version = self.get_db_version(conn_dict)
        except DBAPIError:
            pass
            # print e.message
        except SQLAlchemyError:
            return False
        return True

    def deleteConnection(self, conn_dict):
        self._connections[:] = [x for x in self._connections if x != conn_dict]


    ## ###################
    # private variables
    ## ###################


    def __buildConnectionString(self, conn_dict):
        driver = ""
        if conn_dict['engine'] == 'mssql':
            driver = "pyodbc"
        elif conn_dict['engine'] == 'mysql':
            driver = "pymysql"
        elif conn_dict['engine'] == 'postgresql':
            driver = "psycopg2"
        else:
            driver = "None"

        conn_string = self._connection_format % (
            conn_dict['engine'], driver, conn_dict['user'], conn_dict['password'], conn_dict['address'],
            conn_dict['db'])
        #print conn_string
        return conn_string



