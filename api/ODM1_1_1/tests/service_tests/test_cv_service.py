import pytest
import sqlalchemy.orm.exc

from odmservices import CVService

from odmdata import SessionFactory
from odmdata import VerticalDatumCV
from odmdata import SiteTypeCV
from odmdata import VariableNameCV
from odmdata import SpeciationCV
from odmdata import SampleMediumCV
from odmdata import ValueTypeCV
from odmdata import DataTypeCV
from odmdata import GeneralCategoryCV
from odmdata import CensorCodeCV
from odmdata import TopicCategoryCV
from odmdata import SampleTypeCV
from odmdata import OffsetType
from odmdata import LabMethod
from odmdata import Sample
from odmdata import Qualifier
from odmdata import Unit

from odmtests import test_util

session = None

class TestCVService:
	def setup(self):
		self.connection_string = "sqlite:///:memory:"
		self.cv_service = CVService(self.connection_string, debug=False)
		self.session = self.cv_service._session_factory.get_session()
		engine = self.cv_service._session_factory.engine
		test_util.build_db(engine)

	def test_get_vertical_datum_cvs(self):
		assert self.cv_service.get_vertical_datum_cvs() == []

		vert_dat = test_util.add_vertical_datum_cv(self.session)
		db_vert_dat = self.cv_service.get_vertical_datum_cvs()[0]
		assert vert_dat.term == db_vert_dat.term

	def test_get_samples(self):
		assert self.cv_service.get_samples() == []

		lab_method = test_util.add_lab_method(self.session)
		sample = test_util.add_sample(self.session, lab_method.id)

		db_sample = self.cv_service.get_samples()[0]
		assert sample.id == db_sample.id
		assert sample.lab_method_id == db_sample.lab_method_id

	def test_create_qualifier(self):
		qual = Qualifier()
		qual.code = "ABC123"
		qual.description = "This is a test"
		self.cv_service.create_qualifier(qual)

		assert qual.id is not None

	def test_get_qualifiers(self):
		assert self.cv_service.get_qualifiers() == []

		qual = Qualifier()
		qual.code = "ABC123"
		qual.description = "This is a test"
		self.cv_service.create_qualifier(qual)

		db_qual = self.cv_service.get_qualifiers()[0]
		assert qual.id == db_qual.id

	def test_get_site_type_cvs(self):
		assert self.cv_service.get_site_type_cvs() == []

		st_cv = test_util.add_site_type_cv(self.session)
		db_st_cv = self.cv_service.get_site_type_cvs()[0]
		assert st_cv.term == db_st_cv.term

	def test_get_variable_name_cvs(self):
		assert self.cv_service.get_variable_name_cvs() == []

		var_name_cv = test_util.add_variable_name_cv(self.session)
		db_var_name_cv = self.cv_service.get_variable_name_cvs()[0]
		assert var_name_cv.term == db_var_name_cv.term

	def test_get_offset_type_cvs(self):
		assert self.cv_service.get_offset_type_cvs() == []

		unit = test_util.add_unit(self.session)
		offset = test_util.add_offset_type_cv(self.session, unit.id)

		db_offset = self.cv_service.get_offset_type_cvs()[0]
		assert offset.id == db_offset.id
		assert offset.unit_id == db_offset.unit_id

	def test_get_speciation_cvs(self):
		assert self.cv_service.get_speciation_cvs() == []

		speciation = test_util.add_speciation_cv(self.session)
		db_speciation = self.cv_service.get_speciation_cvs()[0]
		assert speciation.term == db_speciation.term

	def test_get_sample_medium_cvs(self):
		assert self.cv_service.get_sample_medium_cvs() == []

		sample_medium = test_util.add_sample_medium_cv(self.session)
		db_sample_medium = self.cv_service.get_sample_medium_cvs()[0]
		assert sample_medium.term == db_sample_medium.term

	def test_get_value_type_cvs(self):
		assert self.cv_service.get_value_type_cvs() == []

		value_type = test_util.add_value_type_cv(self.session)
		db_val_type = self.cv_service.get_value_type_cvs()[0]
		assert value_type.term == db_val_type.term

	def test_get_data_type_cvs(self):
		assert self.cv_service.get_data_type_cvs() == []

		data_type = test_util.add_data_type_cv(self.session)
		db_data_type = self.cv_service.get_data_type_cvs()[0]
		assert data_type.term == db_data_type.term

	def test_get_general_category_cvs(self):
		assert self.cv_service.get_general_category_cvs() == []

		gen_cat = test_util.add_general_category_cv(self.session)
		db_gen_cat = self.cv_service.get_general_category_cvs()[0]
		assert gen_cat.term == db_gen_cat.term

	def test_get_censor_code_cvs(self):
		assert self.cv_service.get_censor_code_cvs() == []

		censor_code = test_util.add_censor_code_cv(self.session)
		db_censor_code = self.cv_service.get_censor_code_cvs()[0]
		assert censor_code.term == db_censor_code.term

	def test_get_sample_type_cvs(self):
		assert self.cv_service.get_sample_type_cvs() == []

		sample_type = test_util.add_sample_type_cv(self.session)
		db_sample_type = self.cv_service.get_sample_type_cvs()[0]
		assert sample_type.term == db_sample_type.term

	def test_get_units(self):
		assert self.cv_service.get_units() == []

		unit = test_util.add_unit(self.session)
		units = self.cv_service.get_units()
		assert len(units) == 1
		assert unit.id == units[0].id

	def test_get_unit_by_name(self):
		with pytest.raises(sqlalchemy.orm.exc.NoResultFound):
			self.cv_service.get_unit_by_name("Nothing")

		unit = test_util.add_unit(self.session)
		db_unit = self.cv_service.get_unit_by_name(unit.name)
		assert db_unit is not None
		assert unit.id == db_unit.id

	def test_get_unit_by_id(self):
		with pytest.raises(sqlalchemy.orm.exc.NoResultFound):
			self.cv_service.get_unit_by_id(0)

		unit = test_util.add_unit(self.session)
		db_unit = self.cv_service.get_unit_by_id(unit.id)
		assert db_unit is not None
		assert unit.name == db_unit.name

