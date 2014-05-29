from TimeSeries import *
from TimeSeries import copy_data_value

from odmtests import test_util

class TestDataValue:
	def setup(self):
		self.connection_string = "sqlite:///:memory:"
		session_factory = SessionFactory(self.connection_string, echo=False)
		test_util.build_db(session_factory.engine)
		self.session = session_factory.get_session()
		self.series = test_util.add_series(self.session)
		self.data_values = self.series.data_values

	def test_create_data_values(self):
		assert self.data_values != []
		assert self.data_values[0].id != None

	def test_site_relationship(self):
		site = self.data_values[0].site
		assert site != None
		assert site.id != None

	def test_variable_relationship(self):
		var = self.data_values[0].variable
		assert var != None
		assert var.id != None

	def test_method_relationship(self):
		method = self.data_values[0].method
		assert method != None
		assert method.id != None

	def test_source_relationship(self):
		source = self.data_values[0].source
		assert source != None
		assert source.id != None

	def test_qcl_relationship(self):
		qcl = self.data_values[0].quality_control_level
		assert qcl != None
		assert qcl.id != None

	def test_list_repr(self):
		dv = self.data_values[0]
		assert len(dv.list_repr()) == 17
		assert dv.id in dv.list_repr()