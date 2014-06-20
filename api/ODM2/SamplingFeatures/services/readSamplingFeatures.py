__author__ = 'Jacob'

import sys
import os


from ... import serviceBase
from ..model import *


from ...base import serviceBase
from ..model import *
from ...Core.model import *

class readSamplingFeatures(serviceBase):
    """Queries to tables contained in the SamplingFeature """

    """
    Site
    """

    def getAllSites(self):
        """Select all on Sites

        :return Site Objects:
            :type list:
        """
        return self._session.query(Site).all()

    def getSiteBySFId(self, siteId):
        """Select by siteId

        :param siteId:
            :type Integer:
        :return Return matching Site Object filtered by siteId:
            :type Site:
        """
        try:
            return self._session.query(Site).filter_by(SamplingFeatureID=siteId).one()
        except:
            return None


    def getSiteBySFCode(self, siteCode):
        """Select by siteCode

        :param siteCode:
            :type String:
        :return Return matching Samplingfeature Object filtered by siteCode:
            :type Samplingfeature:
        """


        sf= self._session.query(Samplingfeature).filter_by(SamplingFeatureCode = siteCode).one()
        return self._session.query(Site).filter_by(SamplingFeatureID = sf.SamplingFeatureID).one()

    def getSpatialReferenceByCode(self,srsCode):


        try:
            return self._session.query(Spatialreference).filter(Spatialreference.SRSCode.ilike(srsCode)).one()
        except:
            return None
