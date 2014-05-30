__author__ = 'Stephanie'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import service_base
import ODM2.Core.model as m
from ODMconnection import SessionFactory



class create(service_base):


    def createVariable(self, code, name, definition, vType, nodv, speciation):
        """

        :param code:
        :param name:
        :param definition:
        :param vType:
        :param nodv:
        :param speciation:
        :return:
        """
        var = m.Variable()
        var.VariableCode= code
        var.VariableNameCV =name
        var.VariableDefinition = definition
        var.VariableTypeCV = vType
        var.NoDataValue = nodv
        var.SpeciationCV= speciation

        self._session.add(var)
        self._session.commit()