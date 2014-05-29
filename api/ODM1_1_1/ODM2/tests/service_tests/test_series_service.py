import pytest
import sqlalchemy.orm.exc

from odmdata import *
from odmservices import SeriesService

from odmtests import test_util

class TestSeriesService:
	def setup(self):
		self.connection_string = "sqlite:///:memory:"
		self.series_service = SeriesService(self.connection_string, debug=False)
		self.session = self.series_service._session_factory.get_session()
		engine = self.series_service._session_factory.engine
		test_util.build_db(engine)

	def test_get_db_version(self):
		version = test_util.add_version(self.session)
		db_version = self.series_service.get_db_version()
		assert version.version_number == db_version

	def test_get_all_sites_empty(self):
		sites = self.series_service.get_all_sites()
		assert len(sites) == 0
		assert sites == []

	def test_get_all_sites(self):
		assert self.series_service.get_all_sites() == []
		site = test_util.add_site(self.session)
		sites = self.series_service.get_all_sites()
		assert len(sites) == 1
		assert site.code == sites[0].code

	def test_get_site_by_id_fail(self):
		assert self.series_service.get_site_by_id(0) == None

		site = test_util.add_site(self.session)
		db_site = self.series_service.get_site_by_id(10)
		assert db_site == None

	def test_get_site_by_id(self):
		site = test_util.add_site(self.session)
		db_site = self.series_service.get_site_by_id(site.id)
		assert db_site != None
		assert site.code == db_site.code

	def test_get_all_variables(self):
		assert self.series_service.get_all_variables() == []
		variable = test_util.add_variable(self.session)
		variables = self.series_service.get_all_variables()
		assert len(variables) == 1
		assert variable.code == variables[0].code

	def test_get_variable_by_id(self):
		assert self.series_service.get_variable_by_id(10) == None

		variable = test_util.add_variable(self.session)
		db_var = self.series_service.get_variable_by_id(variable.id)

		assert db_var != None
		assert db_var.code == variable.code

	def test_get_variables_by_site_code(self):
		assert self.series_service.get_variables_by_site_code('ABC123') == []

		series = test_util.add_series(self.session)
		variable = series.variable

		db_variables = self.series_service.get_variables_by_site_code(series.site_code)
		assert db_variables != None
		assert variable.code == db_variables[0].code

	def test_get_all_units(self):
		assert self.series_service.get_all_units() == []

		unit = test_util.add_unit(self.session)
		units = self.series_service.get_all_units()

		assert len(units) == 1
		assert unit.name == units[0].name

	def test_get_unit_by_name(self):
		assert self.series_service.get_unit_by_name("FAIL") == None

		unit = test_util.add_unit(self.session)
		db_unit = self.series_service.get_unit_by_name(unit.name)

		assert unit.id == db_unit.id

	def test_get_unit_by_id(self):
		assert self.series_service.get_unit_by_id(10) == None

		unit = test_util.add_unit(self.session)
		db_unit = self.series_service.get_unit_by_id(unit.id)

		assert unit.name == db_unit.name

	def test_get_all_series(self):
		assert self.series_service.get_all_series() == []

		series = test_util.add_series(self.session)
		all_series = self.series_service.get_all_series()

		assert all_series != []
		assert series.id == all_series[0].id

	def test_get_series_by_id(self):
		assert self.series_service.get_series_by_id(10) == None

		series = test_util.add_series(self.session)
		db_series = self.series_service.get_series_by_id(series.id)

		assert series.id == db_series.id

	def test_get_series_by_id_quint(self):
		assert self.series_service.get_series_by_id_quint(10, 10, 10, 10, 10) == None

		series = test_util.add_series(self.session)
		db_series = self.series_service.get_series_by_id_quint(
			series.site_id, series.variable_id, series.method_id,
			series.source_id, series.quality_control_level_id)

		assert series.id == db_series.id

	def test_series_exists(self):
		assert self.series_service.series_exists(10,10,10,10,10) == False

		series = test_util.add_series(self.session)
		site_id = series.site_id
		var_id = series.variable_id
		method_id = series.method_id
		source_id = series.source_id
		qcl_id = series.quality_control_level_id

		assert self.series_service.series_exists(site_id,var_id,method_id,source_id,qcl_id) == True

	def test_save_series(self):
		series = Series()
		site = test_util.add_site(self.session)
		variable = test_util.add_variable(self.session)
		method = test_util.add_method(self.session)
		source = test_util.add_source(self.session)
		qcl = test_util.add_qcl(self.session)

		series.site_id = site.id
		series.variable_id = variable.id
		series.method_id = method.id
		series.source_id = source.id
		series.quality_control_level_id = qcl.id

		dvs = []
		for val in range(10):
			dv = DataValue()
			dv.data_value = val
			dv.site_id = site.id
			dv.variable_id = variable.id
			dv.method_id = method.id
			dv.source_id = source.id
			dv.quality_control_level_id = qcl.id
			dvs.append(dv)

		print series.variable_code
		assert self.series_service.save_series(series, dvs) == True
		assert self.series_service.series_exists(site.id, variable.id, method.id, source.id, qcl.id) == True
		assert self.series_service.save_series(series, dvs) == False

	def test_get_data_value_by_id(self):
		assert self.series_service.get_data_value_by_id(10) == None

		data_values = test_util.add_series(self.session).data_values
		dv = data_values[0]
		db_dv = self.series_service.get_data_value_by_id(dv.id)

		assert dv.data_value == db_dv.data_value

	def test_get_qcl_by_id(self):
		assert self.series_service.get_qcl_by_id(10) == None

		qcl = test_util.add_qcl(self.session)
		db_qcl = self.series_service.get_qcl_by_id(qcl.id)
		assert qcl.code == db_qcl.code

	def test_get_all_qcls(self):
		assert self.series_service.get_all_qcls() == []

		qcl = test_util.add_qcl(self.session)
		all_qcls = self.series_service.get_all_qcls()

		assert len(all_qcls) == 1
		assert qcl.id == all_qcls[0].id

	def test_get_all_methods(self):
		assert self.series_service.get_all_methods() == []

		method = test_util.add_method(self.session)
		all_methods = self.series_service.get_all_methods()

		assert len(all_methods) == 1
		assert method.id == all_methods[0].id

	def test_get_method_by_id(self):
		assert self.series_service.get_method_by_id(10) == None

		method = test_util.add_method(self.session)
		db_method = self.series_service.get_method_by_id(method.id)

		assert method.description == db_method.description

	def test_delete_dvs(self):
		series = test_util.add_series(self.session)
		dvs = series.data_values

		subset = dvs[:5]
		self.series_service.delete_dvs(subset)
		assert self.series_service.get_data_value_by_id(subset[0].id) == None
		series = self.series_service.get_series_by_id(series.id)  # Reload
		assert len(series.data_values) == 5

	def test_update_dvs(self):
		series = test_util.add_series(self.session)
		dvs = series.data_values

		subset = dvs[:5]
		for i in range(len(subset)):
			subset[i].data_value = 100

		self.series_service.update_dvs(subset)
		series = self.series_service.get_series_by_id(series.id)
		assert series.data_values[0].data_value == 100

	def test_create_new_series(self):
		site = test_util.add_site(self.session)
		variable = test_util.add_variable(self.session)
		method = test_util.add_method(self.session)
		source = test_util.add_source(self.session)
		qcl = test_util.add_qcl(self.session)

		dvs = []
		for val in range(10):
			dv = DataValue()
			dv.data_value = val
			dv.site_id = site.id
			dv.variable_id = variable.id
			dv.method_id = method.id
			dv.source_id = source.id
			dv.quality_control_level_id = qcl.id
			dvs.append(dv)

		series = self.series_service.create_new_series(dvs, site.id, variable.id, method.id, source.id, qcl.id)
		assert series != None
		assert len(series.data_values) == 10
		assert series.site_id == site.id
		assert series.variable_id == variable.id

	def test_update_series(self):
		series = test_util.add_series(self.session)
		series.site_code = "NEW"
		series.variable_code = "NEW"

		self.series_service.update_series(series)

		series = self.series_service.get_series_by_id(series.id)
		assert series.site_code == "NEW"
		assert series.variable_code == "NEW"

	def test_create_method(self):
		description = "This tests creating a method"
		link = "http://www.example.com"
		method = self.series_service.create_method(description, link)

		assert method.id != None
		assert method.description == description
		assert method.link == link

	def test_create_variable(self):
		unit = test_util.add_unit(self.session)
		variable = self.series_service.create_variable(
			"Code",	"Name","Speciation", unit.id, "SampleMedium", "ValueType", 
			True, # is_regular
			5.0, # time_support
			unit.id, # time_unit_id
			"DataType",	"GeneralCategory",-999.0)  # no_data_value

		assert variable.id != None
		assert variable.code == "Code"
		assert variable.variable_unit_id == unit.id

	def test_create_qcl(self):
		qcl = self.series_service.create_qcl("Code", "Definition", "Explanation")

		assert qcl.id != None
		assert qcl.code == "Code"

	def test_delete_series(self):
		series = test_util.add_series(self.session)		
		assert self.series_service.get_series_by_id(series.id) != None

		self.series_service.delete_series(series)
		assert self.series_service.get_series_by_id(series.id) == None
		
	def test_qcl_exists(self):
		qcl = test_util.add_qcl(self.session)
		assert self.series_service.qcl_exists(qcl) == True

		qcl.code = "00000"
		qcl.definition = "A new definition"
		assert self.series_service.qcl_exists(qcl) == False

	def test_method_exists(self):
		method = test_util.add_method(self.session)
		assert self.series_service.method_exists(method) == True

		method.description = "A new description"
		assert self.series_service.method_exists(method) == False

	def test_variable_exists(self):
		variable = test_util.add_variable(self.session)
		assert self.series_service.variable_exists(variable) == True

		variable.code = "00000"
		variable.name = "A new name"
		assert self.series_service.variable_exists(variable) == False

	def test_qcl_exists(self):
		qcl = test_util.add_qcl(self.session)
		assert self.series_service.qcl_exists(qcl) == True

		qcl.code = "00000"
		qcl.definition = "A new definition"
		assert self.series_service.qcl_exists(qcl) == False

	def test_method_exists(self):
		method = test_util.add_method(self.session)
		assert self.series_service.method_exists(method) == True

		method.description = "A new description"
		assert self.series_service.method_exists(method) == False

	def test_variable_exists(self):
		variable = test_util.add_variable(self.session)
		assert self.series_service.variable_exists(variable) == True

		variable.code = "00000"
		variable.name = "A new name"
		assert self.series_service.variable_exists(variable) == False

