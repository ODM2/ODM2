__author__ = 'Stephanie'

import sys
import os



from ... import serviceBase
from ..model import *


class readSensors(serviceBase):
    """
    DeploymentAction
    """


    def getAllDeploymentAction(self):
        """Select all on DeploymentAction

        :return DeploymentAction Objects:
            :type list:
        """
        return self._session.query(Deploymentaction).all()

        # return self._session.query)

    def getDeploymentActionById(self, deploymentId):
        """Select by deploymentId

        :param deploymentId:
            :type Integer:
        :return Return Matching DeploymentAction Object filtered by deploymentId:
            :type DeploymentAction:
        """
        try:
            return self._session.query(Deploymentaction).filter_by(DeploymentActionID=deploymentId).one()
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
            return self._session.query(Deploymentaction).filter_by(DeploymentActionCode=deploymentCode).one()
        except:
            return None
