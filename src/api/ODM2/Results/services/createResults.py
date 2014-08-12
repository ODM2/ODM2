__author__ = 'Stephanie'

import sys
import os

from ... import serviceBase
from ..model import *
from ODMconnection import SessionFactory


class createResults(serviceBase):
    def test(self):
        return None

    def createTimeSeriesResult(self, result,aggregationstatistic, xloc=None, xloc_unitid=None, yloc=None,
                               yloc_unitid=None, zloc=None, zloc_unitid=None,
                               srsID=None, timespacing=None, timespacing_unitid=None):

        tsr = Timeseriesresult()

        #tsr.ResultID = result.ResultID
        #tsr.ResultUUID = result.ResultUUID


        tsr.XLocation = xloc
        tsr.XLocationUnitsID = xloc_unitid
        tsr.YLocation = yloc
        tsr.YLocationUnitsID = yloc_unitid
        tsr.ZLocation = zloc
        tsr.ZLocationUnitsID = zloc_unitid
        tsr.SpatialReferenceID = srsID
        tsr.IntendedTimeSpacing = timespacing
        tsr.IntendedTimeSpacingUnitsID = timespacing_unitid
        tsr.AggregationStatisticCV = aggregationstatistic


        #tsr.ResultID = result.ResultID
        tsr.ResultUUID = result.ResultUUID
        tsr.FeatureActionID = result.FeatureActionID
        tsr.VariableID = result.VariableID
        tsr.UnitsID = result.UnitsID
        tsr.ProcessingLevelID = result.ProcessingLevelID
        tsr.ValueCount = result.ValueCount
        tsr.SampledMediumCV = result.SampledMediumCV
        tsr.ResultTypeCV = result.ResultTypeCV



        self._session.add(tsr)
        self._session.commit()

        return tsr


    def createTimeSeriesResultValues(self, resultid, datavalues, datetimes, datetimeoffsets, censorcodecv, qualitycodecv,
                                     timeaggregationinterval, timeaggregationunit):


        try:
            values = Timeseriesresultvalue()
            for i in range(len(datavalues)):

                values.ResultID = resultid
                values.CensorCodeCV = censorcodecv
                values.QualityCodeCV = qualitycodecv
                values.TimeAggregationInterval = timeaggregationinterval
                values.TimeAggregationIntervalUnitsID = timeaggregationunit
                values.DataValue = datavalues[i]
                values.ValueDateTime = datetimes[i]
                values.ValueDateTimeUTCOffset = datetimeoffsets[i]
                self._session.add(values)
            self._session.commit()
            return values
        except Exception, e:
            print e
            return None
