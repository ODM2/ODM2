__author__ = 'Stephanie'

import sys
import os



from ... import serviceBase
from ..model import *
#from ODM2 import SessionFactory



class createSensors (serviceBase):

    def createDeploymentAction(self, actionId, cvType, desc, configActionId, calibActionId, spatialOffSet,
                               deploymentSchematicLink, **kwargs):
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




