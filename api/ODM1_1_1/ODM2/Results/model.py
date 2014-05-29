# coding: utf-8
from sqlalchemy import BigInteger, Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mssql.base import UNIQUEIDENTIFIER
from sqlalchemy.types import NullType
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Action(Base):
    __tablename__ = u'Actions'
    __table_args__ = {u'schema': u'ODM2Core'}

    ActionID = Column(Integer, primary_key=True)
    ActionTypeCV = Column(String(255), nullable=False)
    MethodID = Column(ForeignKey('ODM2Core.Methods.MethodID'), nullable=False)
    BeginDateTime = Column(DateTime, nullable=False)
    BeginDateTimeUTCOffset = Column(Integer, nullable=False)
    EndDateTime = Column(DateTime)
    EndDateTimeUTCOffset = Column(Integer)
    ActionDescription = Column(String(500))
    ActionFileLink = Column(String(255))

    Method = relationship(u'Method')


class Featureaction(Base):
    __tablename__ = u'FeatureActions'
    __table_args__ = {u'schema': u'ODM2Core'}

    FeatureActionID = Column(Integer, primary_key=True)
    SamplingFeatureID = Column(ForeignKey('ODM2Core.SamplingFeatures.SamplingFeatureID'), nullable=False)
    ActionID = Column(ForeignKey('ODM2Core.Actions.ActionID'), nullable=False)

    Action = relationship(u'Action')
    SamplingFeature = relationship(u'Samplingfeature')


class Method(Base):
    __tablename__ = u'Methods'
    __table_args__ = {u'schema': u'ODM2Core'}

    MethodID = Column(Integer, primary_key=True)
    MethodTypeCV = Column(String(255), nullable=False)
    MethodCode = Column(String(50), nullable=False)
    MethodName = Column(String(255), nullable=False)
    MethodDescription = Column(String(500))
    MethodLink = Column(String(255))
    OrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))

    Organization = relationship(u'Organization')


class Organization(Base):
    __tablename__ = u'Organizations'
    __table_args__ = {u'schema': u'ODM2Core'}

    OrganizationID = Column(Integer, primary_key=True)
    OrganizationTypeCV = Column(String(255), nullable=False)
    OrganizationCode = Column(String(50), nullable=False)
    OrganizationName = Column(String(255), nullable=False)
    OrganizationDescription = Column(String(500))
    OrganizationLink = Column(String(255))
    ParentOrganizationID = Column(ForeignKey('ODM2Core.Organizations.OrganizationID'))

    parent = relationship(u'Organization', remote_side=[OrganizationID])


class Processinglevel(Base):
    __tablename__ = u'ProcessingLevels'
    __table_args__ = {u'schema': u'ODM2Core'}

    ProcessingLevelID = Column(Integer, primary_key=True)
    ProcessingLevelCode = Column(String(50), nullable=False)
    Definition = Column(String(500))
    Explanation = Column(String(500))


class Result(Base):
    __tablename__ = u'Results'
    __table_args__ = {u'schema': u'ODM2Core'}

    ResultID = Column(BigInteger, primary_key=True)
    ResultUUID = Column(UNIQUEIDENTIFIER, nullable=False)
    FeatureActionID = Column(ForeignKey('ODM2Core.FeatureActions.FeatureActionID'), nullable=False)
    ResultTypeCV = Column(ForeignKey('ODM2Results.ResultTypeCV.ResultTypeCV'), nullable=False)
    VariableID = Column(ForeignKey('ODM2Core.Variables.VariableID'), nullable=False)
    UnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    TaxonomicClassifierID = Column(ForeignKey('ODM2Core.TaxonomicClassifiers.TaxonomicClassifierID'))
    ProcessingLevelID = Column(ForeignKey('ODM2Core.ProcessingLevels.ProcessingLevelID'), nullable=False)
    ResultDateTime = Column(DateTime)
    ResultDateTimeUTCOffset = Column(BigInteger)
    ValidDateTime = Column(DateTime)
    ValidDateTimeUTCOffset = Column(BigInteger)
    StatusCV = Column(String(255))
    SampledMediumCV = Column(String(255), nullable=False)
    ValueCount = Column(Integer, nullable=False)
    IntendedObservationSpacing = Column(String(255))

    FeatureAction = relationship(u'Featureaction')
    ProcessingLevel = relationship(u'Processinglevel')
    ResultTypeCV1 = relationship(u'Resulttypecv')
    TaxonomicClassifier = relationship(u'Taxonomicclassifier')
    Unit = relationship(u'Unit')
    Variable = relationship(u'Variable')


class Pointcoverageresult(Result):
    __tablename__ = u'PointCoverageResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    IntendedXSpacing = Column(Float(53))
    IntendedXSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    IntendedYSpacing = Column(Float(53))
    IntendedYSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    AggregationStatisticCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(Integer, nullable=False)

    Unit = relationship(u'Unit', primaryjoin='Pointcoverageresult.IntendedXSpacingUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Pointcoverageresult.IntendedYSpacingUnitsID == Unit.UnitsID')
    SpatialReference = relationship(u'Spatialreference')
    Unit2 = relationship(u'Unit', primaryjoin='Pointcoverageresult.ZLocationUnitsID == Unit.UnitsID')


class Profileresult(Result):
    __tablename__ = u'ProfileResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    IntendedZSpacing = Column(Float(53))
    IntendedZSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    AggregationStatisticCV = Column(String(255), nullable=False)

    Unit = relationship(u'Unit', primaryjoin='Profileresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Profileresult.IntendedZSpacingUnitsID == Unit.UnitsID')
    SpatialReference = relationship(u'Spatialreference')
    Unit2 = relationship(u'Unit', primaryjoin='Profileresult.XLocationUnitsID == Unit.UnitsID')
    Unit3 = relationship(u'Unit', primaryjoin='Profileresult.YLocationUnitsID == Unit.UnitsID')


class Categoricalresult(Result):
    __tablename__ = u'CategoricalResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(Integer)
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(Integer)
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(Integer)
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    QualityCodeCV = Column(BigInteger, nullable=False)

    SpatialReference = relationship(u'Spatialreference')


class Transectresult(Result):
    __tablename__ = u'TransectResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    IntendedTransectSpacing = Column(Float(53))
    IntendedTransectSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    AggregationStatisticCV = Column(String(255), nullable=False)

    Unit = relationship(u'Unit', primaryjoin='Transectresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Transectresult.IntendedTransectSpacingUnitsID == Unit.UnitsID')
    SpatialReference = relationship(u'Spatialreference')
    Unit2 = relationship(u'Unit', primaryjoin='Transectresult.ZLocationUnitsID == Unit.UnitsID')


class Spectraresult(Result):
    __tablename__ = u'SpectraResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    IntendedWavelengthSpacing = Column(Float(53))
    IntendedWavelengthSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    AggregationStatisticCV = Column(String(255), nullable=False)

    Unit = relationship(u'Unit', primaryjoin='Spectraresult.IntendedWavelengthSpacingUnitsID == Unit.UnitsID')
    SpatialReference = relationship(u'Spatialreference')
    Unit1 = relationship(u'Unit', primaryjoin='Spectraresult.XLocationUnitsID == Unit.UnitsID')
    Unit2 = relationship(u'Unit', primaryjoin='Spectraresult.YLocationUnitsID == Unit.UnitsID')
    Unit3 = relationship(u'Unit', primaryjoin='Spectraresult.ZLocationUnitsID == Unit.UnitsID')


class Timeseriesresult(Result):
    __tablename__ = u'TimeSeriesResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    AggregationStatisticCV = Column(String(255), nullable=False)

    Unit = relationship(u'Unit', primaryjoin='Timeseriesresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    SpatialReference = relationship(u'Spatialreference')
    Unit1 = relationship(u'Unit', primaryjoin='Timeseriesresult.XLocationUnitsID == Unit.UnitsID')
    Unit2 = relationship(u'Unit', primaryjoin='Timeseriesresult.YLocationUnitsID == Unit.UnitsID')
    Unit3 = relationship(u'Unit', primaryjoin='Timeseriesresult.ZLocationUnitsID == Unit.UnitsID')


class Sectionresult(Result):
    __tablename__ = u'SectionResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    IntendedXSpacing = Column(Float(53))
    IntendedXSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    IntendedZSpacing = Column(Float(53))
    IntendedZSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    AggregationStatisticCV = Column(String(255), nullable=False)

    Unit = relationship(u'Unit', primaryjoin='Sectionresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Sectionresult.IntendedXSpacingUnitsID == Unit.UnitsID')
    Unit2 = relationship(u'Unit', primaryjoin='Sectionresult.IntendedZSpacingUnitsID == Unit.UnitsID')
    SpatialReference = relationship(u'Spatialreference')
    Unit3 = relationship(u'Unit', primaryjoin='Sectionresult.YLocationUnitsID == Unit.UnitsID')


class Trajectoryresult(Result):
    __tablename__ = u'TrajectoryResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    IntendedTrajectorySpacing = Column(Float(53))
    IntendedTrajectorySpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    IntendedTimeSpacing = Column(Float(53))
    IntendedTimeSpacingUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    AggregationStatisticCV = Column(String(255), nullable=False)

    Unit = relationship(u'Unit', primaryjoin='Trajectoryresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Trajectoryresult.IntendedTrajectorySpacingUnitsID == Unit.UnitsID')
    SpatialReference = relationship(u'Spatialreference')


class Measurementresult(Result):
    __tablename__ = u'MeasurementResults'
    __table_args__ = {u'schema': 'ODM2Results'}

    ResultID = Column(ForeignKey('ODM2Core.Results.ResultID'), primary_key=True)
    XLocation = Column(Float(53))
    XLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    YLocation = Column(Float(53))
    YLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    ZLocation = Column(Float(53))
    ZLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'))
    SpatialReferenceID = Column(ForeignKey('ODM2SamplingFeatures.SpatialReferences.SpatialReferenceID'))
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    AggregationStatisticCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)

    SpatialReference = relationship(u'Spatialreference')
    Unit = relationship(u'Unit', primaryjoin='Measurementresult.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Measurementresult.XLocationUnitsID == Unit.UnitsID')
    Unit2 = relationship(u'Unit', primaryjoin='Measurementresult.YLocationUnitsID == Unit.UnitsID')
    Unit3 = relationship(u'Unit', primaryjoin='Measurementresult.ZLocationUnitsID == Unit.UnitsID')


class Samplingfeature(Base):
    __tablename__ = u'SamplingFeatures'
    __table_args__ = {u'schema': u'ODM2Core'}

    SamplingFeatureID = Column(Integer, primary_key=True)
    SamplingFeatureTypeCV = Column(String(255), nullable=False)
    SamplingFeatureCode = Column(String(50), nullable=False)
    SamplingFeatureName = Column(String(255))
    SamplingFeatureDescription = Column(String(500))
    SamplingFeatureGeotypeCV = Column(String(255))
    Elevation_m = Column(Float(53))
    ElevationDatumCV = Column(String(255))
    FeatureGeometry = Column(NullType)


class Taxonomicclassifier(Base):
    __tablename__ = u'TaxonomicClassifiers'
    __table_args__ = {u'schema': u'ODM2Core'}

    TaxonomicClassifierID = Column(Integer, primary_key=True)
    TaxonomicClassifierTypeCV = Column(String(255), nullable=False)
    TaxonomicClassifierName = Column(String(255), nullable=False)
    TaxonomicClassifierCommonName = Column(String(255))
    TaxonomicClassifierDescription = Column(String(500))
    ParentTaxonomicClassifierID = Column(ForeignKey('ODM2Core.TaxonomicClassifiers.TaxonomicClassifierID'))

    parent = relationship(u'Taxonomicclassifier', remote_side=[TaxonomicClassifierID])


class Unit(Base):
    __tablename__ = u'Units'
    __table_args__ = {u'schema': u'ODM2Core'}

    UnitsID = Column(Integer, primary_key=True)
    UnitsTypeCV = Column(String(255), nullable=False)
    UnitsAbbreviation = Column(String(50), nullable=False)
    UnitsName = Column(String(255), nullable=False)


class Variable(Base):
    __tablename__ = u'Variables'
    __table_args__ = {u'schema': u'ODM2Core'}

    VariableID = Column(Integer, primary_key=True)
    VariableTypeCV = Column(String(255), nullable=False)
    VariableCode = Column(String(50), nullable=False)
    VariableNameCV = Column(String(255), nullable=False)
    VariableDefinition = Column(String(500))
    SpeciationCV = Column(String(255))
    NoDataValue = Column(Float(53), nullable=False)


class Categoricalresultvalue(Base):
    __tablename__ = u'CategoricalResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.CategoricalResults.ResultID'), nullable=False)
    DataValue = Column(String(255), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    CategoricalResult = relationship(u'Categoricalresult')


class Measurementresultvalue(Base):
    __tablename__ = u'MeasurementResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.MeasurementResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    MeasurementResult = relationship(u'Measurementresult')


class Pointcoverageresultvalue(Base):
    __tablename__ = u'PointCoverageResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.PointCoverageResults.ResultID'), nullable=False)
    DataValue = Column(BigInteger, nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    YLocation = Column(Float(53), nullable=False)
    YLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)

    PointCoverageResult = relationship(u'Pointcoverageresult')
    Unit = relationship(u'Unit', primaryjoin='Pointcoverageresultvalue.XLocationUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Pointcoverageresultvalue.YLocationUnitsID == Unit.UnitsID')


class Profileresultvalue(Base):
    __tablename__ = u'ProfileResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.ProfileResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    ZLocation = Column(Float(53), nullable=False)
    ZAggregationInterval = Column(Float(53), nullable=False)
    ZLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)

    ProfileResult = relationship(u'Profileresult')
    Unit = relationship(u'Unit', primaryjoin='Profileresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Profileresultvalue.ZLocationUnitsID == Unit.UnitsID')


class Resulttypecv(Base):
    __tablename__ = u'ResultTypeCV'
    __table_args__ = {u'schema': u'ODM2Results'}

    ResultTypeCV = Column(String(255), primary_key=True)
    ResultTypeCategory = Column(String(255), nullable=False)
    DataType = Column(String(255), nullable=False)
    ResultTypeDefinition = Column(String(500), nullable=False)
    FixedDimensions = Column(String(255), nullable=False)
    VaryingDimensions = Column(String(255), nullable=False)
    SpaceMeasurementFramework = Column(String(255), nullable=False)
    TimeMeasurementFramework = Column(String(255), nullable=False)
    VariableMeasurementFramework = Column(String(255), nullable=False)


class Sectionresultvalue(Base):
    __tablename__ = u'SectionResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.SectionResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(BigInteger, nullable=False)
    ValueDateTimeUTCOffset = Column(BigInteger, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XAggregationInterval = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    ZLocation = Column(BigInteger, nullable=False)
    ZAggregationInterval = Column(Float(53), nullable=False)
    ZLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    AggregationStatisticCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)

    SectionResult = relationship(u'Sectionresult')
    Unit = relationship(u'Unit', primaryjoin='Sectionresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Sectionresultvalue.XLocationUnitsID == Unit.UnitsID')
    Unit2 = relationship(u'Unit', primaryjoin='Sectionresultvalue.ZLocationUnitsID == Unit.UnitsID')


class Spectraresultvalue(Base):
    __tablename__ = u'SpectraResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.SpectraResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    ExcitationWavelength = Column(Float(53), nullable=False)
    EmissionWavelength = Column(Float(53), nullable=False)
    WavelengthUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)

    SpectraResult = relationship(u'Spectraresult')
    Unit = relationship(u'Unit', primaryjoin='Spectraresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Spectraresultvalue.WavelengthUnitsID == Unit.UnitsID')


class Timeseriesresultvalue(Base):
    __tablename__ = u'TimeSeriesResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.TimeSeriesResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)

    TimeSeriesResult = relationship(u'Timeseriesresult')
    Unit = relationship(u'Unit')


class Trajectoryresultvalue(Base):
    __tablename__ = u'TrajectoryResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.TrajectoryResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    YLocation = Column(Float(53), nullable=False)
    YLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    ZLocation = Column(Float(53), nullable=False)
    ZLocationUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)
    TrajectoryDistance = Column(Float(53), nullable=False)
    TrajectoryDistanceAggregationInterval = Column(Float(53), nullable=False)
    TrajectoryDistanceUnitsID = Column(Integer, nullable=False)
    CensorCode = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(ForeignKey('ODM2Core.Units.UnitsID'), nullable=False)

    TrajectoryResult = relationship(u'Trajectoryresult')
    Unit = relationship(u'Unit', primaryjoin='Trajectoryresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    Unit1 = relationship(u'Unit', primaryjoin='Trajectoryresultvalue.XLocationUnitsID == Unit.UnitsID')
    Unit2 = relationship(u'Unit', primaryjoin='Trajectoryresultvalue.YLocationUnitsID == Unit.UnitsID')
    Unit3 = relationship(u'Unit', primaryjoin='Trajectoryresultvalue.ZLocationUnitsID == Unit.UnitsID')


class Transectresultvalue(Base):
    __tablename__ = u'TransectResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.TransectResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(DateTime, nullable=False)
    XLocation = Column(Float(53), nullable=False)
    XLocationUnitsID = Column(Integer, nullable=False)
    YLocation = Column(Float(53), nullable=False)
    YLocationUnitsID = Column(Integer, nullable=False)
    TransectDistance = Column(Float(53), nullable=False)
    TransectDistanceAggregationInterval = Column(Float(53), nullable=False)
    TransectDistanceUnitsID = Column(Integer, nullable=False)
    CensorCodeCV = Column(String(255), nullable=False)
    QualityCodeCV = Column(String(255), nullable=False)
    AggregationStatisticCV = Column(String(255), nullable=False)
    TimeAggregationInterval = Column(Float(53), nullable=False)
    TimeAggregationIntervalUnitsID = Column(Integer, nullable=False)

    TransectResult = relationship(u'Transectresult')


class Spatialreference(Base):
    __tablename__ = u'SpatialReferences'
    __table_args__ = {u'schema': u'ODM2SamplingFeatures'}

    SpatialReferenceID = Column(Integer, primary_key=True)
    SRSCode = Column(String(50))
    SRSName = Column(String(255), nullable=False)
    SRSDescription = Column(String(500))
