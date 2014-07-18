__author__ = 'Stephanie'
from  createCore import  createCore
from deleteCore import deleteCore
from readCore import readCore
from updateCore import updateCore


class CoreServices(object):
    def __init__(self, connection):
        self.read= readCore(connection)
        self.delete= deleteCore(connection)
        self.update= updateCore(connection)
        self.create= createCore(connection)

