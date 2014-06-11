__author__ = 'Stephanie'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import serviceBase
from ODM2.Sensors.model as m


class readSensors(serviceBase):
    """
    DeploymentAction
    """

    def getAllDeploymentAction(self):
        """Select all on DeploymentAction

        :return DeploymentAction Objects:
            :type list:
        """
        return self._session.query(m.Deploymentaction).all()

        # return self._session.query(m.)

    def getDeploymentActionById(self, deploymentId):
        """Select by deploymentId

        :param deploymentId:
            :type Integer:
        :return Return Matching DeploymentAction Object filtered by deploymentId:
            :type DeploymentAction:
        """
        try:
            return self._session.query(m.Deploymentaction).filter_by(DeploymentActionID=deploymentId).one()
        except:
            return None

    def getDeploymentActionByCode(self, deploymentCode):
        """Select by deploymentCode

        :param deploymentCode:
            :type String:
        :return Return matching DeploymentAction Object filtered by deploymentCode:
            :type DeploymentAction:
        """
        try:
            return self._session.query(m.Deploymentaction).filter_by(DeploymentActionCode=deploymentCode).one()
        except:
            return None
