__author__ = 'Stephanie'

import sys
import os



from ... import serviceBase
from ..model import *
from ODMconnection import SessionFactory



class readDataQuality (serviceBase):

   def getAllDataQuality(self):
        """Select all on Data Quality

        :return Dataquality Objects:
            :type list:
        """
        return self._session.query(Dataquality).all()

