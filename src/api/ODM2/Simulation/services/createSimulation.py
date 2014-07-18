__author__ = 'tonycastronova'


from ... import serviceBase
from ..model import *

class createSimulation(serviceBase):


    def createModel(self, code, name, description=None):

        model = Model()
        model.ModelCode = code
        model.ModelName = name
        model.ModelDescription = description

        self._session.add(model)
        self._session.commit()

        return model


    def createRelatedModel (self,modelid, relatedModelID, relationshipType):

        related = Relatedmodel()
        related.ModelID = modelid
        related.RelationshipTypeCV = relationshipType
        related.RelatedModelID = relatedModelID

        self._session.add(related)
        self._session.commit()

        return related


    def createSimulation(self,actionid,modelID, simulationName,simulationDescription,simulationStartDateTime, simulationStartOffset,
                   simulationEndDateTime,simulationEndOffset,timeStepValue,timeStepUnitID,inputDatasetID=None):

        sim = Simulation()
        sim.ActionID = actionid
        sim.ModelID = modelID
        sim.SimulationName = simulationName
        sim.SimulationDescription = simulationDescription
        sim.SimulationStartDateTime = simulationStartDateTime
        sim.SimulationStartDateTimeUTCOffset = simulationStartOffset
        sim.SimulationEndDateTime = simulationEndDateTime
        sim.SimulationEndDateTimeUTCOffset = simulationEndOffset
        sim.TimeStepValue = timeStepValue
        sim.TimeStepUnitsID = timeStepUnitID
        sim.InputDataSetID = inputDatasetID

        self._session.add(sim)
        self._session.commit()

        return sim
