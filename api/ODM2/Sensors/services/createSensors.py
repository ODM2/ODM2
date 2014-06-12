__author__ = 'Stephanie'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import serviceBase
import ODM2.Sensors.model as m
#from ODM2 import SessionFactory



class createSensors (serviceBase):
    def createDeploymentAction(self, actionId, cvType, desc, configActionId, calibActionId, spatialOffSet,
                               deploymentSchematicLink):
        """Create DeploymentAction Object

        :param **kwargs:
            :param actionId:
                :type Integer:
            :param cvType:
                :type String(255):
            :param desc:
                :type String(500):
            :param configActionId:
                :type Integer:
            :param calibActionId:
                :type Integer:
            :param spatialOffSet:
                :type Integer:
            :param deploymentSchematicLink:
                :type String(255):
            :return:
        """

        da = m.Deploymentaction()
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)



