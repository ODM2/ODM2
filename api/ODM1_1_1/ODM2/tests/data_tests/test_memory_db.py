import pytest

from odmdata import MemoryDatabase
from odmservices import SeriesService

from odmtests import test_util


class TestMemoryDB:
	def setup(self):
		self.connection_string = "sqlite:///:memory:"
		self.series_service = SeriesService(connection_string=self.connection_string, debug=False)
		self.session = self.series_service._session_factory.get_session()
		engine = self.series_service._session_factory.engine
		test_util.build_db(engine)
		self.series = test_util.add_series(self.session)

		self.memory_db = MemoryDatabase(self.series_service)

	def test_delete_points(self):
		with pytest.raises(NotImplementedError):
			self.memory_db.delete_points("filter")

	def test_add_points(self):
		with pytest.raises(NotImplementedError):
			self.memory_db.add_points("filter")

	def test_update_points(self):
		with pytest.raises(NotImplementedError):
			self.memory_db.update_points("filter", [1,2,3])

	def test_get_data_values_is_empty(self):
		dvs = self.memory_db.get_data_values()
		assert len(dvs) == 0