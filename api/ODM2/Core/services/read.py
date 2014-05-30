__author__ = 'Stephanie'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import service_base
import ODM2.Core.model as m
from ODMconnection import SessionFactory

class read(service_base):
     # Variables methods
    def getAllVariables(self):
        return self._session.query(m.Variable).all()

    def getVariableById(self, variableId):
        try:
            return self._session.query(m.Variable).filter_by(VariableID=variableId).one()
        except:
            return None

    def getVariableByCode(self, variableCode):
        try:
            return self._session.query(m.Variable).filter_by(VariableCode=variableCode).one()
        except:
            return None