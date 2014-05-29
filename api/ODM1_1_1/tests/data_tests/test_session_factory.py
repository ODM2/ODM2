from TimeSeries import SessionFactory

class TestSessionFactory:

	def setup(self):
		self.connection_string = "sqlite:///:memory:"
		self.session_factory = SessionFactory(self.connection_string, echo=True)

	def test_create_session_factory(self):
		assert repr(self.session_factory) == "<SessionFactory('Engine(%s)')>" % self.connection_string
		assert self.session_factory.Session != None

	def test_get_session(self):
		session = self.session_factory.get_session()
		assert 'sqlalchemy.orm.session.SessionMaker' in repr(session)