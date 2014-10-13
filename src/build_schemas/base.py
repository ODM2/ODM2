__author__ = 'tonycastronova'


class Schema():
    def __init__(self, name):
        self.__name = name
        self.__tables = []

    def name(self):
        return self.__name

    def add_table(self, table):
        self.__tables.append(table)
    def get_tables(self):
        return self.__tables

class Table():
    def __init__(self, name, pk):
        self.__name = name
        self.__pk = pk
        self.__colums = []
        self.__foreignkeys = []

    def name(self):
        return self.__name
    def pk(self):
        return self.__pk
    def add_column(self, column):
        self.__colums.append(column)
    def get_columns(self):
        return self.__colums

    def add_foreignkey(self, fk):
        self.__foreignkeys.append(fk)

    def get_foreignkeys(self):
        return self.__foreignkeys

class Column():
    def __init__(self, name, datatype, primarykey=False, autoincrement= False, length=None, scale=None, unsigned=False, id=None, nullable=False,default=None):
        self.__name = name
        self.__ds = datatype
        self.__ln = length
        self.__sc = scale
        self.__un = bool(int(unsigned))
        self.__id = id
        self.__au = bool(int(autoincrement))
        self.__nu = bool(int(nullable))
        self.__df = default
        self.__pk = bool(int(primarykey))
        #self.__arr
        #self.__en
        #self.__sg

    def get_attributes(self):
        return {'name':self.__name,
                'dtype':self.__ds,
                'length': self.__ln,
                'scale': self.__sc,
                'unsigned':self.__un,
                'id':self.__id,
                'autoincrement':self.__au,
                'nullable':self.__nu,
                'default':self.__df,
                'primarykey':self.__pk}

class ForeignKey():
    def __init__(self, name, parentSch, parentTbl, parentCol, childSch, childTbl, childCol ):

        self.name = name
        self.parentSch = parentSch
        self.parentTbl = parentTbl
        self.parentCol = parentCol
        self.childSch = childSch
        self.childTbl = childTbl
        self.childCol = childCol



