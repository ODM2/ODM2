__author__ = 'Stephanie'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import service_base
import ODM2.Core.model as m
from ODMconnection import SessionFactory


class CoreService(service_base):

    # Variables methods
    def get_all_variables(self):
        return self._session.query(m.Variable).all()

    def get_variable_by_id(self, variable_id):
        try:
            return self._session.query(m.Variable).filter_by(VariableID=variable_id).one()
        except:
            return None

    def get_variable_by_code(self, variable_code):
        try:
            return self._session.query(m.Variable).filter_by(VariableCode=variable_code).one()
        except:
            return None



