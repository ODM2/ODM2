__author__ = 'tonycastronova'


from ... import serviceBase
from ..model import *

class readSimulation(serviceBase):


    def getAllModels(self):

        try:
            return self._session.query(Model).all()
        except:
            return None

    def getModelByCode(self,modelcode):
        try:
            return self._session.query(Model).filter(Model.ModelCode.ilike(modelcode)).first()
        except:
            return None

    def getAllSimulations(self):

        try:
            return self._session.query(Simulation).all()
        except:
            return None

    def getSimulationByName(self,simulationName):
        try:
            return self._session.query(Simulation).filter(Simulation.SimulationName.ilike(simulationName)).first()
        except:
            return None

    def getSimulationByActionID(self,actionID):
        try:
            return self._session.query(Simulation).filter_by(ActionID = actionID).first()
        except:
            return None

    def getRelatedModelsByID(self,modelid):
        try:
            return self._session.query(Relatedmodel).filter_by(RelatedModelID = modelid).all()
        except:
            return None

    def getRelatedModelsByCode(self,modelcode):
        try:
            return self._session.query(Relatedmodel).join(Relatedmodel.ModelID == Model.ModelID) \
                                                    .filter(Model.ModelCode == modelcode)
        except:
            return None
