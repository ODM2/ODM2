from __future__ import print_function
import pandas as pd
import os
import ntpath

filenames= ['read.py', 'create.py', 'update.py', 'delete.py']
initfilenames = ["__init__.py",'']


#new_file = open('D:DEV\ODM2\api', 'w')

def path_leaf(path):
    head, tail = ntpath.split(path)
    #print ("tail: " + tail)
    return tail or ntpath.basename(head)

def initfile(path, schema):
    curfile = open(path, 'w')
    
    inittext="""__author__ = \'Stephanie\'
from ODMconnection import dbconnection
from read{schema} import read{schema}
from update{schema} import update{schema}
from create{schema} import create{schema}
from delete{schema} import delete{schema}



__all__ = [
    'read{schema}',
    'update{schema}',
    'create{schema}',
    'delete{schema}',

]""".format(schema = schema)
    print(inittext)
    curfile.write(inittext)

def setupfile(path, filename, schema):
    curfile = open(path, 'w')
    curfile.write("""__author__ = \'Stephanie\'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ... import serviceBase
from ..model import *
from ODMconnection import SessionFactory



class """ + filename+" (serviceBase):\n")
    curfile.close()



def initfilereader(path):
    print ("call init file reader")
    for root, dirs, files in os.walk(path):
        for f in files:           
            p=os.path.join(root, f)
            #print( p)             
            path = os.path.abspath(p)
            #print ("path: " + str(path)  )          
            ext = os.path.splitext(path)[1] 
            #print("extension: " + str(ext))

            if  ext=='.py': 
                print (path_leaf(path))
                print ( path_leaf(path) in initfilenames)
                if path_leaf(path) in initfilenames:
                    print (os.path.dirname(path))
                    if "services" in os.path.dirname(path):
                        directories = path.rsplit('\\')
                        directories.reverse()
                        initfile(path , directories[2])
                        


def crudfilereader(path):
    print ("call crud file reader")
    for root, dirs, files in os.walk(path):
        for f in files:           
            p=os.path.join(root, f)
            #print( p)             
            path = os.path.abspath(p)
            #print ("path: " + str(path)  )          
            ext = os.path.splitext(path)[1] 
            #print("extension: " + str(ext))

            if  ext=='.py': 
                if path_leaf(path) in filenames:
                
                    directories = path.rsplit('\\')
                    directories.reverse()
                    #print ("directory:" +directories[2])
                    filename = ''.join(directories[0][:-3]) + directories[2]
                    print (os.path.dirname(path)+'\\'+filename + ext)
                    #print(path)
                    #setupfile(path, filename, directories[2])
                    os.rename(path, os.path.dirname(path)+'\\'+filename + ext)
            



#crudfilereader("D:\DEV\ODM2\\api\ODM2")
initfilereader("D:\DEV\ODM2\\api\ODM2")



""" 

$ ls
cheese_cheese_type.bar  cheese_cheese_type.foo
$ python
>>> import os
>>> for filename in os.listdir("."):
...  if filename.startswith("cheese_"):
...    os.rename(filename, filename[7:])"""


