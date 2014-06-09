__author__ = 'Stephanie'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import serviceBase
import ODM2.Core.model as m


class read(serviceBase):
    """queries to tables contained in the core schema"""

    """
    Variable
    """

    def getAllVariables(self):
        """Select all on Variables

        :return Variable Objects:
            :type list:
        """
        return self._session.query(m.Variable).all()

    def getVariableById(self, variableId):
        """Select by variableId

        :param variableId:
            :type Integer:
        :return Return matching Variable object filtered by variableId:
            :type Variable:
        """
        try:
            return self._session.query(m.Variable).filter_by(VariableID=variableId).one()
        except:
            return None

    def getVariableByCode(self, variableCode):
        """Select by variableCode

        :param variableCode:
            :type String:
        :return Return matching Variable Object filtered by variableCode:
            :type Variable:
        """
        try:
            return self._session.query(m.Variable).filter_by(VariableCode=variableCode).one()
        except:
            return None

    """
    Method
    """

    def getAllMethods(self):
        """Select all on Methods

        :return Method Objects:
            :type list:
        """
        return self._session.query(m.Method).all()

    def getMethodById(self, methodId):
        """Select by methodId

        :param methodId:
            :type Integer
        :return Return matching Method Object filtered by methodId:
            :type Method:
        """
        try:
            return self._session.query(m.Method).filter_by(MethodID=methodId).one()
        except:
            return None

    def getMethodByCode(self, methodCode):
        """Select by methodCode

        :param methodCode:
            :type String:
        :return Return matching Method Object filtered by method Code:
            :type Method:
        """
        try:
            return self._session.query(m.Method).filter_by(MethodCode=methodCode).one()
        except:
            return None

    """
    ProcessingLevel
    """

    def getAllProcessingLevel(self):
        """Select all on Processing Level

        :return ProcessingLevel Objects:
            :type list:
        """
        return self._session.query(m.Processinglevel).all()

    def getProcessingLevelById(self, processingId):
        """Select by processingId

        :param processingId:
            :type Integer:
        :return Return matching ProcessingLevel Object filtered by processingId:
            :type Processinglevel:
        """
        try:
            return self._session.query(m.Processinglevel).filter_by(ProcessingLevelID=processingId).one()
        except:
            return None


    def getProcessingLevelByCode(self, processingCode):
        """Select by processingCode

        :param processingCode:
            :type String(50):
        :return Return matching Processinglevel Object filtered by processingCode:
            :type Processinglevel:
        """
        try:
            return self._session.query(m.Processinglevel).filter_by(ProcessingLevelCode=processingCode).one()
        except:
            return None

    """
    Sampling Feature
    """

    def getAllSamplingFeature(self):
        """Select all on SamplingFeatures

        :return SamplingFeature Objects:
            :type list:
        """
        return self._session.query(m.Samplingfeature).all()

    def getSamplingFeatureById(self, samplingId):
        """Select by samplingId

        :param samplingId:
            :type Integer:
        :return Return matching SamplingFeature Object filtered by samplingId:
            :type SamplingFeature:
        """
        try:
            return self._session.query(m.Samplingfeature).filter_by(SamplingFeatureID=samplingId).one()
        except:
            return None

    def getSamplingFeaturebyCode(self, samplingCode):
        """Select by samplingCode

        :param samplingCode:
            :type String:
        :return Return matching SamplingFeature Object filtered by samplingId
            :type SamplingFeature:
        """
        try:
            return self._session.query(m.Samplingfeature).filter_by(SamplingFeatureCode=samplingCode).one()
        except:
            return None

    """
    DeploymentAction
    """

    def getAllDeploymentAction(self):
        """Select all on DeploymentAction

        :return DeploymentAction Objects:
            :type list:
        """
        pass

        #return self._session.query(m.)

    def getDeploymentActionById(self, deploymentId):
        """Select by deploymentId

        :param deploymentId:
            :type Integer:
        :return Return Matching DeploymentAction Object filtered by deploymentId:
            :type DeploymentAction:
        """
        pass

    def getDeploymentActionByCode(self, deploymentCode):
        """Select by deploymentCode

        :param deploymentCode:
            :type String:
        :return Return matching DeploymentAction Object filtered by deploymentCode:
            :type DeploymentAction:
        """
        pass




    """
    Results
    """


    def getAllResults(self):
        pass


    def getResultsById(self, resultsId):
        pass


    def getResultsByCode(self, resultsCode):
        pass






