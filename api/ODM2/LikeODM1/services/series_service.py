

from sqlalchemy import distinct
import sqlalchemy.exc

from ODMconnection import SessionFactory
from ODM1_1_1 import Site
from ODM1_1_1 import Variable
from ODM1_1_1 import Unit
from ODM1_1_1 import Series
from ODM1_1_1 import DataValue
from ODM1_1_1 import Qualifier
from ODM1_1_1 import OffsetType
from ODM1_1_1 import Sample
from ODM1_1_1 import Method
from ODM1_1_1 import QualityControlLevel
from ODM1_1_1 import ODMVersion



class SeriesService():
    # Accepts a string for creating a SessionFactory, default uses odmdata/connection.cfg
    def __init__(self, connection_string="", debug=False):
        self._session_factory = SessionFactory(connection_string, debug)
        self._edit_session = self._session_factory.get_session()
        self._debug = debug

    def get_db_version(self):
        return self._edit_session.query(ODMVersion).first().version_number

    # Site methods
    def get_all_sites(self):
        return self._edit_session.query(Site).order_by(Site.code).all()

    def get_site_by_id(self, site_id):
        try:
            return self._edit_session.query(Site).filter_by(id=site_id).one()
        except:
            return None

    # Variables methods
    def get_all_variables(self):
        return self._edit_session.query(Variable).all()

    def get_variable_by_id(self, variable_id):
        try:
            return self._edit_session.query(Variable).filter_by(id=variable_id).one()
        except:
            return None

    def get_variable_by_code(self, variable_code):
        try:
            return self._edit_session.query(Variable).filter_by(code=variable_code).one()
        except:
            return None

    def get_variables_by_site_code(self, site_code):  # covers NoDV, VarUnits, TimeUnits
        try:
            var_ids = [x[0] for x in self._edit_session.query(distinct(Series.variable_id)).filter_by(
                site_code=site_code).all()]
        except:
            var_ids = None

        variables = []
        for var_id in var_ids:
            variables.append(self._edit_session.query(Variable).filter_by(id=var_id).one())

        return variables

    # Unit methods
    def get_all_units(self):
        return self._edit_session.query(Unit).all()

    def get_unit_by_name(self, unit_name):
        try:
            return self._edit_session.query(Unit).filter_by(name=unit_name).one()
        except:
            return None

    def get_unit_by_id(self, unit_id):
        try:
            return self._edit_session.query(Unit).filter_by(id=unit_id).one()
        except:
            return None

    def get_offset_types_by_series_id(self, series_id):
        subquery = self._edit_session.query(DataValue.offset_type_id).outerjoin(
            Series.data_values).filter(Series.id == series_id, DataValue.offset_type_id != None).distinct().subquery()
        return self._edit_session.query(OffsetType).join(subquery).distinct().all()

    def get_qualifiers_by_series_id(self, series_id):
        subquery = self._edit_session.query(DataValue.qualifier_id).outerjoin(
            Series.data_values).filter(Series.id == series_id, DataValue.qualifier_id != None).distinct().subquery()
        return self._edit_session.query(Qualifier).join(subquery).distinct().all()

    def get_samples_by_series_id(self, series_id):
        subquery = self._edit_session.query(DataValue.sample_id).outerjoin(
            Series.data_values).filter(Series.id == series_id, DataValue.sample_id != None).distinct().subquery()
        return self._edit_session.query(Sample).join(subquery).distinct().all()

    # Series Catalog methods
    def get_all_series(self):
        return self._edit_session.query(Series).order_by(Series.id).all()

    def get_series_by_id(self, series_id):
        try:
            return self._edit_session.query(Series).filter_by(id=series_id).order_by(Series.id).one()
        except:
            return None

    def get_series_by_id_quint(self, site_id, var_id, method_id, source_id, qcl_id):
        try:
            return self._edit_session.query(Series).filter_by(
                site_id=site_id, variable_id=var_id, method_id=method_id,
                source_id=source_id, quality_control_level_id=qcl_id).one()
        except:
            return None

    def get_series_from_filter(self):
        # Pass in probably a Series object, match it against the database
        pass

    def save_series(self, series, data_values, isSave=False):
        doesExist = self.series_exists(
            series.site_id,
            series.variable_id,
            series.method_id,
            series.source_id,
            series.quality_control_level_id
        )
        # Save case
        if isSave:
            if doesExist:
                self._edit_session.add(series)
                self._edit_session.add_all(data_values)
                self._edit_session.commit()
                print ("Existing File was overwritten with new information")
                return True
            else:
                print("There wasn't an existing file to overwrite, please select 'Save As' first")
                # there wasn't an existing file to overwrite
                return False
        # Save As case
        elif not isSave:
            if doesExist:
                print(
                    "There is already an existing file with this information. Please select 'Save' to overwrite")
                return False
            else:
                self._edit_session.add(series)
                self._edit_session.add_all(data_values)
            self._edit_session.commit()
            print("A new series was added to the database")
        return True

    def series_exists(self, site_id, var_id, method_id, source_id, qcl_id):
        try:
            result = self._edit_session.query(Series).filter_by(
                site_id=site_id,
                variable_id=var_id,
                method_id=method_id,
                source_id=source_id,
                quality_control_level_id=qcl_id
            ).one()

            return True
        except:
            return False

    def get_data_value_by_id(self, id):
        try:
            return self._edit_session.query(DataValue).filter_by(id=id).one()
        except:
            return None

    def get_all_qcls(self):
        return self._edit_session.query(QualityControlLevel).all()

    def get_qcl_by_id(self, qcl_id):
        try:
            return self._edit_session.query(QualityControlLevel).filter_by(id=qcl_id).one()
        except:
            return None

    def get_qcl_by_code(self, qcl_code):
        try:
            return self._edit_session.query(QualityControlLevel).filter_by(code=qcl_code).one()
        except:
            return None

    # Method methods
    def get_all_methods(self):
        return self._edit_session.query(Method).all()

    def get_method_by_id(self, method_id):
        try:
            result = self._edit_session.query(Method).filter_by(id=method_id).one()
        except:
            result = None
        return result

    def get_method_by_description(self, method_code):
        try:
            result = self._edit_session.query(Method).filter_by(description=method_code).one()
        except:
            result = None
        return result

    # Edit/delete methods
    def delete_dvs(self, dv_list):
        for dv in dv_list:
            merged_dv = self._edit_session.merge(dv)
            self._edit_session.delete(merged_dv)
        self._edit_session.commit()

    def update_dvs(self, dv_list):
        merged_dv_list = map(self._edit_session.merge, dv_list)
        self._edit_session.add_all(merged_dv_list)
        self._edit_session.commit()

    def create_new_series(self, data_values, site_id, variable_id, method_id, source_id, qcl_id):
        self.update_dvs(data_values)
        series = Series()
        series.site_id = site_id
        series.variable_id = variable_id
        series.method_id = method_id
        series.source_id = source_id
        series.quality_control_level_id = qcl_id

        self._edit_session.add(series)
        self._edit_session.commit()
        return series

    def update_series(self, series):
        merged_series = self._edit_session.merge(series)
        self._edit_session.add(merged_series)
        self._edit_session.commit()

    def create_method(self, description, link):
        meth = Method()
        meth.description = description
        if link is not None:
            meth.link = link

        self._edit_session.add(meth)
        self._edit_session.commit()
        return meth

    def create_variable(
            self, code, name, speciation, variable_unit_id, sample_medium,
            value_type, is_regular, time_support, time_unit_id, data_type,
            general_category, no_data_value):
        var = Variable()
        var.code = code
        var.name = name
        var.speciation = speciation
        var.variable_unit_id = variable_unit_id
        var.sample_medium = sample_medium
        var.value_type = value_type
        var.is_regular = is_regular
        var.time_support = time_support
        var.time_unit_id = time_unit_id
        var.data_type = data_type
        var.general_category = general_category
        var.no_data_value = no_data_value

        self._edit_session.add(var)
        self._edit_session.commit()
        return var

    def create_qcl(self, code, definition, explanation):
        qcl = QualityControlLevel()
        qcl.code = code
        qcl.definition = definition
        qcl.explanation = explanation

        self._edit_session.add(qcl)
        self._edit_session.commit()
        return qcl

    def delete_series(self, series):
        self.delete_dvs(series.data_values)

        delete_series = self._edit_session.merge(series)
        self._edit_session.delete(delete_series)
        self._edit_session.commit()

    def qcl_exists(self, q):
        try:
            result = self._edit_session.query(QualityControlLevel).filter_by(code=q.code, definition=q.definition).one()
            return True
        except:
            return False

    def method_exists(self, m):
        try:
            result = self._edit_session.query(Method).filter_by(description=m.description).one()
            return True
        except:
            return False

    def variable_exists(self, v):
        try:
            result = self._edit_session.query(Variable).filter_by(code=v.code,
                                                                  name=v.name, speciation=v.speciation,
                                                                  variable_unit_id=v.variable_unit_id,
                                                                  sample_medium=v.sample_medium,
                                                                  value_type=v.value_type, is_regular=v.is_regular,
                                                                  time_support=v.time_support,
                                                                  time_unit_id=v.time_unit_id, data_type=v.data_type,
                                                                  general_category=v.general_category,
                                                                  no_data_value=v.no_data_value).one()
            return True
        except:
            return False