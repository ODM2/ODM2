from ODMconnection import SessionFactory


class service_base():

    def __init__(self, connection_string, debug=False):
        self._session_factory = SessionFactory(connection_string, debug)
        self._session = self._session_factory.get_session()
        self._debug = debug