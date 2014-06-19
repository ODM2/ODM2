__author__ = 'Stephanie'

import sys
import os



from ... import serviceBase
from ..model import *
from ODMconnection import SessionFactory



class readEquipment (serviceBase):

   def getAllEquipment(self):
       return self._session.query(Equipment).all()