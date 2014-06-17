__author__ = 'Stephanie'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import serviceBase
import ODM2.DataQuality.model as m
from ODMconnection import SessionFactory



class createDataQuality (serviceBase):
<<<<<<< HEAD
   def test(self):
        return None
=======
    pass
>>>>>>> 80be1730e4dfe721cdd35bc595533ed62116729f
