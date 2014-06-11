import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import serviceBase
import ODM2.Results.model as m

__author__ = 'Jacob'

class readResults(serviceBase):
    """queries to tables contained in Results schema"""

    def __init__(self):
        pass

    """
    TimeSeriesResults
    """
    def getAllTimeSeriesResults(self):
        """Select all on TimeSeriesResults

        :return TimeSeriesResults Objects:
            :type list:
        """
        return self._session.query(m.Timeseriesresult).all()

    def getTimeSeriesResultsByResultId(self, resultId):
        """Select by resultID on ResultID

        :param resultId:
            :type Integer:
        :return return matching Timeseriesresult Object filtered by resultId
        """

        try:
            return self._session.query(m.Timeseriesresult).filter_by(ResultID=resultId).one()
        except:
            return None

    def getTimeSeriesResultsbyCode(self, timeSeriesCode):
        """Select by time
        """
        pass


    """
    TimeSeriesResultValues
    """
    def getAllTimeSeriesValues(self):
        """Select all on TimeSeriesResults

        :return TimeSeriesResultsValue Objects:
            :type list:
        """
        return self._session.query(m.Timeseriesresultvalue).all()

    def getTimeSeriesValuesByResultId(self, resultId):
        """Select by resultId

        :param timeSeriesId:
            :type Integer:
        :return return matching Timeseriesresultvalue Object filtered by resultId:
            :type Timeseriesresultvalue:
        """
        try:
            return self._session.query(m.Timeseriesresultvalue).filter_by(ResultID=resultId).one()
        except:
            return None

    def getTimeSeriesValuesByCode(self, timeSeriesCode):
        """

        :param timeSeriesCode:
        :return:
        """
        pass
