# CV imports
from ODMconnection import SessionFactory
from ODM1_1_1 import VerticalDatumCV
from ODM1_1_1 import SiteTypeCV
from ODM1_1_1 import VariableNameCV
from ODM1_1_1 import SpeciationCV
from ODM1_1_1 import SampleMediumCV
from ODM1_1_1 import ValueTypeCV
from ODM1_1_1 import DataTypeCV
from ODM1_1_1 import GeneralCategoryCV
from ODM1_1_1 import CensorCodeCV
from ODM1_1_1 import TopicCategoryCV
from ODM1_1_1 import SampleTypeCV
from ODM1_1_1 import OffsetType
from ODM1_1_1 import Sample
from ODM1_1_1 import Qualifier
from ODM1_1_1 import Unit


class CVService():
    # Accepts a string for creating a SessionFactory, default uses odmdata/connection.cfg
    def __init__(self, connection_string="", debug=False):
        self._session_factory = SessionFactory(connection_string, debug)
        self._edit_session = self._session_factory.getSession()
        self._debug = debug

    # Controlled Vocabulary get methods



    #return a list of all terms in the cv
    def get_vertical_datum_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(VerticalDatumCV).order_by(VerticalDatumCV.term).all()
        session.close()
        return result

    def get_samples(self):
        session = self._session_factory.getSession()
        result = session.query(Sample).order_by(Sample.lab_sample_code).all()
        session.close()
        return result

    def get_qualifiers(self):
        result = self._edit_session.query(Qualifier).order_by(Qualifier.code).all()
        return result

    def create_qualifier(self, qualifier):
        session = self._session_factory.getSession()
        self._edit_session.add(qualifier)

        self._edit_session.commit()

    def get_site_type_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(SiteTypeCV).order_by(SiteTypeCV.term).all()
        session.close()
        return result

    def get_variable_name_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(VariableNameCV).order_by(VariableNameCV.term).all()
        session.close()
        return result

    def get_offset_type_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(OffsetType).order_by(OffsetType.id).all()
        session.close()
        return result

    def get_speciation_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(SpeciationCV).order_by(SpeciationCV.term).all()
        session.close()
        return result

    def get_sample_medium_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(SampleMediumCV).order_by(SampleMediumCV.term).all()
        session.close()
        return result

    def get_value_type_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(ValueTypeCV).order_by(ValueTypeCV.term).all()
        session.close()
        return result

    def get_data_type_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(DataTypeCV).order_by(DataTypeCV.term).all()
        session.close()
        return result

    def get_general_category_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(GeneralCategoryCV).order_by(GeneralCategoryCV.term).all()
        session.close()
        return result

    def get_censor_code_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(CensorCodeCV).order_by(CensorCodeCV.term).all()
        session.close()
        return result

    def get_sample_type_cvs(self):
        session = self._session_factory.getSession()
        result = session.query(SampleTypeCV).order_by(SampleTypeCV.term).all()
        session.close()
        return result

    def get_units(self):
        session = self._session_factory.getSession()
        result = self._edit_session.query(Unit).all()
        session.close()
        return result


    # return a single cv


    def get_unit_by_name(self, unit_name):
        session = self._session_factory.getSession()
        result = self._edit_session.query(Unit).filter_by(name=unit_name).one()
        session.close()
        return result

    def get_unit_by_id(self, unit_id):
        session = self._session_factory.getSession()
        result = self._edit_session.query(Unit).filter_by(id=unit_id).one()
        session.close()
        return result
