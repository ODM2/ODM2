# coding: utf-8


from sqlalchemy import Column, Date, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from ODM2.Core.model import Action, Dataset,Unit, Base




class Model(Base):
    __tablename__ = 'Models'
    __table_args__ = {u'schema': 'ODM2'}

    ModelID = Column(Integer, primary_key=True)
    ModelCode = Column(String(255), nullable=False)
    ModelName = Column(String(255), nullable=False)
    ModelDescription = Column(String(500))


class Relatedmodel(Base):
    __tablename__ = 'RelatedModels'
    __table_args__ = {u'schema': 'ODM2'}

    RelationID = Column(Integer, primary_key=True)
    ModelID = Column(ForeignKey('ODM2.Models.ModelID'), nullable=False)
    RelationshipTypeCV = Column(String(255), nullable=False)
    RelatedModelID = Column(ForeignKey('ODM2.Models.ModelID'), nullable=False)

    Model = relationship(u'Model', primaryjoin='Relatedmodel.ModelID == Model.ModelID')
    Model1 = relationship(u'Model', primaryjoin='Relatedmodel.RelatedModelID == Model.ModelID')


class Simulation(Base):
    __tablename__ = 'Simulations'
    __table_args__ = {u'schema': 'ODM2'}

    SimulationID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    SimulationName = Column(String(255), nullable=False)
    SimulationDescription = Column(String(500))
    SimulationStartDateTime = Column(Date, nullable=False)
    SimulationStartDateTimeUTCOffset = Column(Integer, nullable=False)
    SimulationEndDateTime = Column(Date, nullable=False)
    SimulationEndDateTimeUTCOffset = Column(Integer, nullable=False)
    TimeStepValue = Column(Float(53), nullable=False)
    TimeStepUnitsID = Column(ForeignKey('ODM2.Units.UnitsID'), nullable=False)
    InputDataSetID = Column(ForeignKey('ODM2.DataSets.DataSetID'))
    OutputDataSetID = Column(Integer)
    ModelID = Column(ForeignKey('ODM2.Models.ModelID'), nullable=False)

    Action = relationship(u'Action')
    DataSet = relationship(u'Dataset')
    Model = relationship(u'Model')
    Unit = relationship(u'Unit')
