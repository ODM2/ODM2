__author__ = 'Jacob'

import sys
import os

#this_file = os.path.realpath(__file__)
#directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
#sys.path.insert(0, directory)

#from ODM2 import serviceBase
#import ODM2.SamplingFeatures.model as m

from ...base import serviceBase
from ..model import *

class createSamplingFeatures(serviceBase):
    def createSite(self, vType, latitude, longitude):
        """Create Site table

        :param vType:
            :type String(255):
        :param latitude:
            :type Float(53):
        :param longitude:
            :type Float(53):
        :return:
        """

        s = Site()
        s.SiteTypeCV = vType
        s.Latitude = latitude
        s.Longitude = longitude

        self._session.add(s)
        self._session.commit()

        return s


    def createSpatialReference(self,srsCode,srsName,srsDescription):

        spatialreference = Spatialreference()
        spatialreference.SRSCode = srsCode
        spatialreference.SRSName = srsName
        spatialreference.SRSDescription = srsDescription

        self._session.add(spatialreference)
        self._session.commit()

        return spatialreference