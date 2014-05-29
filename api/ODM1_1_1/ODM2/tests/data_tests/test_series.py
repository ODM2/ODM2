from TimeSeries import *
from TimeSeries import copy_series

from odmtests import test_util

class TestSeries:
	def setup(self):
		self.connection_string = "sqlite:///:memory:"
		session_factory = SessionFactory(self.connection_string, echo=False)
		test_util.build_db(session_factory.engine)
		self.session = session_factory.get_session()
		self.series = test_util.add_series(self.session)

	def test_create_series(self):
		assert self.series != None
		assert self.series.id != None

	def test_data_values_relationship(self):
		assert self.series.data_values != None
		assert len(self.series.data_values) != 0

	def test_site_relationship(self):
		site = self.series.site
		assert site != None

	def test_variable_relationship(self):
		var = self.series.variable
		assert var != None

	def test_method_relationship(self):
		method = self.series.method
		assert method != None

	def test_source_relationship(self):
		source = self.series.source
		assert source != None

	def test_qcl_relationship(self):
		qcl = self.series.quality_control_level
		assert qcl != None

	def test_get_table_cols(self):
		assert len(self.series.get_table_columns()) == 30
		assert "SeriesID" in self.series.get_table_columns()
		assert "ValueCount" in self.series.get_table_columns()

	def test_list_repr(self):
		assert len(self.series.list_repr()) == 30
		assert self.series.id == self.series.list_repr()[0]

	def test_copy_series(self):
		copy = copy_series(self.series)
		assert copy.id != self.series.id
		assert copy.site_id == self.series.site_id
		assert copy.variable_id == self.series.variable_id
		assert copy.method_id == self.series.method_id
		assert copy.source_id == self.series.source_id
		assert copy.quality_control_level_id == self.series.quality_control_level_id