
from sqlalchemy.exc import SQLAlchemyError, DBAPIError
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker



class dbconnection():
    def __init__(self, debug=False):
        self.debug = debug
        self._connections = []
        self.version = 0
        self._connection_format = "%s+%s://%s:%s@%s/%s"

    def build_conn_dict(self, engine,  address, db, user, password):
        line_dict = {}
        line_dict['engine'] = engine
        line_dict['user'] = user
        line_dict['password'] = password
        line_dict['address'] = address
        line_dict['db'] = db
        self._connections.append(line_dict)
        self._current_connection = self._connections[-1]
        return self.__build_connection_string(line_dict)

    def get_connections(self):
        return self._connections

    def get_current_connection(self):
        return self._current_connection

    def add_connection(self, conn_dict):
        """conn_dict must be a dictionary with keys: engine, user, password, address, db"""

        # remove earlier connections that are identical to this one
        self.delete_connection(conn_dict)

        self._connections.append(conn_dict)
        self._current_connection = self._connections[-1]


    def test_connection(self, conn_dict):
        try:
            self.version = self.get_db_version(conn_dict)
        except DBAPIError:
            pass
            #print e.message
        except SQLAlchemyError:
            return False
        return True

    def delete_connection(self, conn_dict):
        self._connections[:] = [x for x in self._connections if x != conn_dict]


    ## ###################
    # private variables
    ## ###################


    def __build_connection_string(self, conn_dict):
        driver = ""
        if conn_dict['engine'] == 'mssql':
            driver = "pyodbc"
        elif conn_dict['engine'] == 'mysql':
            driver = "pymysql"
        else:
            driver = "None"

        conn_string = self._connection_format % (
            conn_dict['engine'], driver, conn_dict['user'], conn_dict['password'], conn_dict['address'],
            conn_dict['db'])
        return conn_string



class SessionFactory():
    def __init__(self, connection_string, echo):
        self.engine = create_engine(connection_string, encoding='utf-8', echo=echo,
                                    #pool_size=20,
                                    pool_recycle=3600,
                                    pool_timeout=5,
                                    max_overflow=0)

        # Create session maker
        self.Session = sessionmaker(bind=self.engine)

    def get_session(self):
        return self.Session()

    def __repr__(self):
        return "<SessionFactory('%s')>" % (self.engine)
