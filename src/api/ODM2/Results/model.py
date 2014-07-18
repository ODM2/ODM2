# coding: utf-8
from sqlalchemy import BigInteger, Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
#from ODM2 import modelBase as Base


from ..Core.model import Result, Unit, Taxonomicclassifier, Base
from ..SamplingFeatures.model import Spatialreference

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

    XUnitObj = relationship(Unit, primaryjoin='Pointcoverageresult.IntendedXSpacingUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Pointcoverageresult.IntendedYSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    ZUnitObj = relationship(Unit, primaryjoin='Pointcoverageresult.ZLocationUnitsID == Unit.UnitsID')


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

    TimeUnitObj = relationship(Unit, primaryjoin='Profileresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Profileresult.IntendedZSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    XUnitObj = relationship(Unit, primaryjoin='Profileresult.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Profileresult.YLocationUnitsID == Unit.UnitsID')


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

    SpatialReferenceObj = relationship(Spatialreference)


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

    TimeUnitObj = relationship(Unit, primaryjoin='Transectresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    TransectUnitObj = relationship(Unit, primaryjoin='Transectresult.IntendedTransectSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    ZUnitObj = relationship(Unit, primaryjoin='Transectresult.ZLocationUnitsID == Unit.UnitsID')


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

    WaveUnitObj = relationship(Unit, primaryjoin='Spectraresult.IntendedWavelengthSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    XUnitObj = relationship(Unit, primaryjoin='Spectraresult.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Spectraresult.YLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Spectraresult.ZLocationUnitsID == Unit.UnitsID')


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

    TimeUnitObj = relationship(Unit, primaryjoin='Timeseriesresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    XUnitObj = relationship(Unit, primaryjoin='Timeseriesresult.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Timeseriesresult.YLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Timeseriesresult.ZLocationUnitsID == Unit.UnitsID')


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

    TimeUnitObj = relationship(Unit, primaryjoin='Sectionresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    XUnitObj = relationship(Unit, primaryjoin='Sectionresult.IntendedXSpacingUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Sectionresult.IntendedZSpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)
    YUnitObj = relationship(Unit, primaryjoin='Sectionresult.YLocationUnitsID == Unit.UnitsID')


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

    TimeUnitObj = relationship(Unit, primaryjoin='Trajectoryresult.IntendedTimeSpacingUnitsID == Unit.UnitsID')
    TrajectoryUnitObj = relationship(Unit, primaryjoin='Trajectoryresult.IntendedTrajectorySpacingUnitsID == Unit.UnitsID')
    SpatialReferenceObj = relationship(Spatialreference)


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

    SpatialReferenceObj = relationship(Spatialreference)
    TimeUnitObj = relationship(Unit, primaryjoin='Measurementresult.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    XUnitObjObj = relationship(Unit, primaryjoin='Measurementresult.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Measurementresult.YLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Measurementresult.ZLocationUnitsID == Unit.UnitsID')


class Categoricalresultvalue(Base):
    __tablename__ = u'CategoricalResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.CategoricalResults.ResultID'), nullable=False)
    DataValue = Column(String(255), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    CategoricalResultObj = relationship(Categoricalresult)


class Measurementresultvalue(Base):
    __tablename__ = u'MeasurementResultValues'
    __table_args__ = {u'schema': 'ODM2Results'}

    ValueID = Column(BigInteger, primary_key=True)
    ResultID = Column(ForeignKey('ODM2Results.MeasurementResults.ResultID'), nullable=False)
    DataValue = Column(Float(53), nullable=False)
    ValueDateTime = Column(DateTime, nullable=False)
    ValueDateTimeUTCOffset = Column(Integer, nullable=False)

    MeasurementResultObj = relationship(Measurementresult)


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

    PointCoverageResultObj = relationship(Pointcoverageresult)
    XUnitObj = relationship(Unit, primaryjoin='Pointcoverageresultvalue.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Pointcoverageresultvalue.YLocationUnitsID == Unit.UnitsID')


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

    ProfileResultObj = relationship(u'Profileresult')
    TimeUnitObj = relationship(Unit, primaryjoin='Profileresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Profileresultvalue.ZLocationUnitsID == Unit.UnitsID')


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

    SectionResultObj = relationship(Sectionresult)
    TimeUnitObj = relationship(Unit, primaryjoin='Sectionresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    XUnitObj = relationship(Unit, primaryjoin='Sectionresultvalue.XLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Sectionresultvalue.ZLocationUnitsID == Unit.UnitsID')


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

    SpectraResultObj = relationship(Spectraresult)
    TimeUnitObj = relationship(Unit, primaryjoin='Spectraresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    WavelengthUnitObj = relationship(Unit, primaryjoin='Spectraresultvalue.WavelengthUnitsID == Unit.UnitsID')


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

    TimeSeriesResultObj = relationship(Timeseriesresult)
    TimeUnitObj = relationship(Unit)


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

    TrajectoryResultObj = relationship(Trajectoryresult)
    TimeUnitObj = relationship(Unit, primaryjoin='Trajectoryresultvalue.TimeAggregationIntervalUnitsID == Unit.UnitsID')
    XUnitObj = relationship(Unit, primaryjoin='Trajectoryresultvalue.XLocationUnitsID == Unit.UnitsID')
    YUnitObj = relationship(Unit, primaryjoin='Trajectoryresultvalue.YLocationUnitsID == Unit.UnitsID')
    ZUnitObj = relationship(Unit, primaryjoin='Trajectoryresultvalue.ZLocationUnitsID == Unit.UnitsID')


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

    TransectResultObj = relationship(Transectresult)



