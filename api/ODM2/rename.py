from __future__ import print_function
import pandas as pd
import os
import ntpath

filenames= ['read.py', 'create.py', 'update.py', 'delete.py']


#new_file = open('D:DEV\ODM2\api', 'w')

def path_leaf(path):
    head, tail = ntpath.split(path)
    #print ("tail: " + tail)
    return tail or ntpath.basename(head)

def setupfile(path, filename, schema):
    curfile = open(path, 'w+')
    print (curfile.name, curfile.mode, curfile.closed)
    print (curfile.read())
    curfile.write("""__author__ = \'Stephanie\'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import serviceBase
import ODM2."""+schema+""".model as m
from ODMconnection import SessionFactory



class """ + filename+" (serviceBase):\n")
    curfile.close()



def file_reader(path):
    print ("call file reader")
    file_path =[]
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
                    file_path.append( path)
                
                    directories = path.rsplit('\\')
                    directories.reverse()
                    #print ("directory:" +directories[2])
                    filename = ''.join(directories[0][:-3]) + directories[2]
                    print (os.path.dirname(path)+'\\'+filename + ext)
                    #print(path)
                    setupfile(path, filename, directories[2])
                    os.rename(path, os.path.dirname(path)+'\\'+filename + ext)
            



    return file_path



file_reader("D:\DEV\ODM2\\api\ODM2")


""" 

$ ls
cheese_cheese_type.bar  cheese_cheese_type.foo
$ python
>>> import os
>>> for filename in os.listdir("."):
...  if filename.startswith("cheese_"):
...    os.rename(filename, filename[7:])"""


