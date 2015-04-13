from yaml import load
import sys
import logging
from pprint import pformat
from converters import timestamp, timeonly
from sqlalchemy.orm import class_mapper
from sqlalchemy import Unicode, Date, DateTime, Time, Integer, Float, Boolean, String, Binary, inspect

try:
    from sqlalchemy.exc import IntegrityError
except ImportError:
    from sqlalchemy.exceptions import IntegrityError
from functools import partial

log = logging.Logger('bootalchemy', level=logging.INFO)
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
log.addHandler(ch)

# Support for SQLAlchemy 0.5 while 0.6 is in beta. This will be removed in future versions.
try:
    from sqlalchemy.dialects.postgresql.base import PGArray
except ImportError:
    log.error('You really should upgrade to SQLAlchemy=>0.6 to get the full bootalchemy experience')
    PGArray = None

class Loader(object):
    """
       Basic Loader

       *Arguments*
          model
            list of classes in your model.
          references
            references from an sqlalchemy session to initialize with.
          check_types
            introspect the target model class to re-cast the data appropriately.
    """
    default_encoding = 'utf-8'

    def cast(self, type_, cast_func, value):
        if type(value) == type_:
            return value
        else:
            return cast_func(value)

    def __init__(self, model, references=None, check_types=True):
        self.default_casts = {Integer:int,
                              Unicode: partial(self.cast, unicode, lambda x: unicode(x, self.default_encoding)),
                              Date: timestamp,
                              DateTime: timestamp,
                              Time: timeonly,
                              Float:float,
                              Boolean: partial(self.cast, bool, lambda x: x.lower() not in ('f', 'false', 'no', 'n')),
                              Binary: partial(self.cast, str, lambda x: x.encode('base64'))
        }
        if PGArray:
            self.default_casts[PGArray] = list

        self.source = 'UNKNOWN'
        self.model = model
        if references is None:
            self._references = {}
        else:
            self._references = references

        if not isinstance(model, list):
            model = [model]

        self.modules = []
        for item in model:
            if isinstance(item, basestring):
                self.modules.append(__import__(item))
            else:
                self.modules.append(item)

        self.check_types = check_types

    def clear(self):
        """
        clear the existing references
        """
        self._references = {}

    def create_obj(self, klass, item):
        """
        create an object with the given data
        """
        # xxx: introspect the class constructor and pull the items out of item that you can, assign the rest
        try:
            obj = klass(**item)
        except TypeError, e:
            self.log_error(e, None, klass, item)
            raise TypeError("The class, %s, cannot be given the items %s. Original Error: %s" %
                            (klass.__name__, str(item), str(e)))
        except AttributeError, e:
            self.log_error(e, None, klass, item)
            raise AttributeError("Object creation failed while initializing a %s with the items %s. Original Error: %s" %
                                 (klass.__name__, str(item), str(e)))
        except KeyError, e:
            self.log_error(e, None, klass, item)
            raise KeyError("On key, %s, failed while initializing a %s with the items %s. %s.keys() = %s" %
                           (str(e), klass.__name__, str(item), klass.__name__, str(klass.__dict__.keys())))

        return obj

    def resolve_value(self, value):
        """
        `value` is a string or list that will be applied to an ObjectName's attribute.
        Link in references when it hits a value that starts with an "*"
        Ignores values that start with an "&"
        Nesting also happens here: Create new objects for values that start with a "!"
        Recurse through lists.
        """
        if isinstance(value, basestring):
            if value.startswith('&'):
                return None
            elif value.startswith('*'):
                if value[1:] in self._references:
                    return self._references[value[1:]]
                else:
                    raise Exception('The pointer %(val)s could not be found. Make sure that %(val)s is declared before it is used.' % { 'val': value })
        elif isinstance(value, dict):
            keys = value.keys()
            if len(keys) == 1 and keys[0].startswith('!'):
                klass_name = keys[0][1:]
                items = value[keys[0]]
                klass = self.get_klass(klass_name)

                if isinstance(items, dict):
                    return self.add_klass_with_values(klass, items)
                elif isinstance(items, list):
                    return self.add_klasses(klass, items)
                else:
                    raise TypeError('You can only give a nested value a list or a dict. You tried to feed a %s into a %s.' %
                                    (items.__class__.__name__, klass_name))

        elif isinstance(value, list):
            return [self.resolve_value(list_item) for list_item in value]

        # an 'assert isinstance(value, basestring) and value[0:1] not in ('&', '*', '!') could probably go here.
        return value

    def has_references(self, item):
        for key, value in item.iteritems():
            if isinstance(value, basestring) and value.startswith('&'):
                return True

    def add_reference(self, key, obj):
        """
        add a reference to the internal reference dictionary
        """
        self._references[key[1:]] = obj

    def set_references(self, obj, item):
        """
        extracts the value from the object and stores them in the reference dictionary.
        """
        for key, value in item.iteritems():
            if isinstance(value, basestring) and value.startswith('&'):
                self._references[value[1:]] = getattr(obj, key)
            if isinstance(value, list):
                for i in value:
                    if isinstance(value, basestring) and i.startswith('&'):
                        self._references[value[1:]] = getattr(obj, value[1:])

    def _check_types(self, klass, obj):
        if not self.check_types:
            return obj
        mapper = class_mapper(klass)
        for table in mapper.tables:
            for key in obj.keys():
                col = table.columns.get(key, None)
                value = obj[key]
                if value is not None and col is not None and col.type is not None:
                    for type_, func in self.default_casts.iteritems():
                        if isinstance(col.type, type_):
                            obj[key] = func(value)
                            break
                if value is None and col is not None and isinstance(col.type, (String, Unicode)):
                    obj[key] = ''
        return obj

    def get_klass(self, klass_name):
        klass = None
        for module in self.modules:
            # try:
            klass = getattr(module, klass_name)
            break
            # except AttributeError:
            # pass
        # check that the class was found.
        if klass is None:
            raise AttributeError('Class %s from %s not found in any module' % (klass_name , self.source))
        return klass

    def obtain_key_value(self, key, value, resolved_values):
        """
        Need to convert 'key' value to be the object equivalent in each table.
        Examples:
            PersonID -> PersonObj

        """
        # save off key
        new_obj_key = key

        # pop off old key in order to maintain size of resolved_values when the object version is added to the dictionary
        resolved_values.pop(key)

        # Convert the sqlalchemy object equivalent of <table>Obj from <table>ID
        key = self.get_object_key(new_obj_key)

        # value = self.get_key_value_tuple(new_obj_key, value)

        assert isinstance(key, basestring)
        # assert isinstance(value, tuple)

        return key, value

    def get_object_key(self, key):
        """
        Turn <Table>ID into <Table>Obj

        Since <Table>ID can only store Integers and we are following bootAlchemy's work flow, we need to change <Table>ID into <Table>Obj

        Example:
            If we are working with '<class ODM2.models.AuthorLists>', we are working with the following schema
                {
                    AuthorOrder,
                    BridgeID,
                    CitationID,
                    CitationObj,
                    PersonID,
                    PersonObj
                }

            The algorithm is to change the incoming key value of PersonID into PersonObj and CitationID into CitationObj. The Key
                is paired with the YAML object in resolved_values.
        """
        tmp_key = key
        ## Turn Person into People
        tmp_key = tmp_key[:-2] + 'Obj'
        return tmp_key

    def get_key_value_tuple(self, key, value):
        """
        Return a tuple of the <Table> and values needed to build <Table> as listed in the ODM2 Schema

        Examples:
            key = PersonID
            key[:-2] == Person. In ODM2, Person no longer exists, so return People
            class = People

            key = SamplingFeatureID
            class = SamplingFeature + 's' = SamplingFeatures (since ODM2 has changed to be plural)
        """

        tmp_key = key


        # Need to handle special cases
        if tmp_key[:-2] == 'Person':
            tmp_key = 'People'

        elif 'Units' in tmp_key[:-2]:
            tmp_key = "Units"

        # Handle plural cases
        else:
            tmp_key = key[:-2] + 's'
        klass = tmp_key

        return (klass, value)

    def add_klass_with_values(self, klass, values):
        """
        klass is a type, values is a dictionary. Returns a new object.
        """
        ref_name = None
        keys = values.keys()

        if len(keys) == 1 and keys[0].startswith('&') and isinstance(values[keys[0]], dict):
            ref_name = keys[0]
            values = values[ref_name] # ie. item.values[0]

        # Values is a dict of attributes and their values for any ObjectName.
        # Copy the given dict, iterate all key-values and process those with special directions (nested creations or links).
        resolved_values = values.copy()

        for key, value in resolved_values.iteritems():

            # if "ID" in key and "UUID" not in key:
            if value and isinstance(value, basestring) and value.startswith('*'):
                value = self.obtain_object_id(key, value)
                # key, value = self.obtain_key_value(key, value, resolved_values)


            resolved_values[key] = self.resolve_value(value)


        # _check_types currently does nothingublssdf (unless you call the loaded with a check_types parameter)
        resolved_values = self._check_types(klass, resolved_values)

        obj = self.create_obj(klass, resolved_values)
        self.session.add(obj)

        if ref_name:
            self.add_reference(ref_name, obj)
        if self.has_references(values):
            self.session.flush()
            self.set_references(obj, values)

        return obj

    def obtain_object_id(self, key, value):
        self.session.flush()

        ref = None

        try:

            ref = self._references[value[1:]]

            if key.endswith("ID"):
                # obtain the primary key value
                value = inspect(ref).identity[0]
            #     if not 'UnitsID' in key:
            #         value = getattr(ref, key)
            #     else:
            #         value = getattr(ref, "UnitsID")
            elif key.endswith("Obj"):
                value = ref

            return value
        except Exception as e:
            return value
            # print "key: ", key, " value: ", value

            # value = None
            # if ref:
            #     if not 'UnitsID' in key:
            #         value = getattr(ref, key)
            #     else:
            #         value = getattr(ref, "UnitsID")
            #
            # return value

    def resolve_references(self, session, values):
        """

        :param values:
        :return:
        """

        dictOfValues = {}

        self.session = session

        """
        Find the ID for each of the anchors/aliases without adding
        it to a session but pulling references from available session
        """
        dictOfValues = {}

        columnValues = None
        if isinstance(values, dict) and "ColumnDefinitions" in values:
            columnValues = values.pop('ColumnDefinitions')


            for i in columnValues:
                values = []
                # print "I: ", i
                for k, v in i.iteritems():
                    newValue = self.resolve_value(v)
                    if k == "ResultID":
                        newValue = newValue.ResultID
                    elif k == "TimeAggregationIntervalUnitsID":
                        newValue = newValue.UnitsID
                    values.append(newValue)
                    # print "K: ", k, " Value: ", newValue
                dictOfValues[i['Label']] = values
                print

        return dictOfValues

    def obtain_time_series(self, timeSeries):
        """
        Clean up time series data to be put into a pandas dataframe
        """

        data = self.resolve_references(self.session, timeSeries)

        try:
            data.pop('ValueDateTime')
            data.pop('ValueDateTimeUTCOffset')
        except:
            pass

        # convert dictionary of data into a list of data with the first element removed
        tmp_list = []
        for k, v in data.iteritems():
            v.pop(0)
            tmp_list.append(v)
        data = tmp_list
        tmp_list = None

        return data

    def loadTimeSeriesResults(self, session, engine, timeSeries):
        """
        Loads TimeSeriesResultsValues into pandas DataFrame
        """
        self.session = session
        self.engine = engine
        try:
            data_values = timeSeries.pop('Data')
        except:
            return
        data = self.obtain_time_series(timeSeries)

        import pandas as pd
        # removes the warning message for pandas chained_assignment
        pd.options.mode.chained_assignment = None

        column_labels = data_values[0]
        data_values = data_values[1:]
        df = pd.DataFrame(data_values, columns=column_labels)
        df.set_index(['ValueDateTime', 'ValueDateTimeUTCOffset'], inplace=True)
        dfUnstacked = df.unstack(level=['ValueDateTime', 'ValueDateTimeUTCOffset'])

        df2 = pd.DataFrame(data, columns=['Label', 'ResultID', 'ODM2Field', 'CensorCodeCV', 'TimeAggregationInterval',
                                          'TimeAggregationIntervalUnitsID'])
        dfUnstacked = dfUnstacked.reset_index()
        df3 = pd.merge(df2, dfUnstacked, left_on="Label", right_on="level_0")

        # Remove unnecessary column
        del df3['ODM2Field']
        del df3['level_0']

        # print df3

        # Construct the sql queries
        AVGDataFrame = df3[df3['Label'] == 'AirTemp_Avg']
        MaxDataFrame = df3[df3['Label'] == 'AirTemp_Max']
        MinDataFrame = df3[df3['Label'] == 'AirTemp_Min']

        # Remove unnecessary column
        del AVGDataFrame['Label']
        del MaxDataFrame['Label']
        del MinDataFrame['Label']
        del df3
        del dfUnstacked
        del df2
        del df

        # set column names for the last element
        AVGDataFrame.columns.values[-1] = 'DataValue'
        MinDataFrame.columns.values[-1] = 'DataValue'
        MaxDataFrame.columns.values[-1] = 'DataValue'

        # add missing values
        AVGDataFrame['QualityCodeCV'] = 'Unknown'
        MinDataFrame['QualityCodeCV'] = 'Unknown'
        MaxDataFrame['QualityCodeCV'] = 'Unknown'

        klass = self.get_klass("TimeSeriesResultValues")

        AVGValues = AVGDataFrame.to_dict('records')
        MinValues = MinDataFrame.to_dict('records')
        MaxValues = MaxDataFrame.to_dict('records')

        merged_dicts = self.merge_dicts(AVGValues, MinValues, MaxValues)
        AVGValues = None
        MinValues = None
        MaxValues = None

        for value in merged_dicts:
            resolved_values = self._check_types(klass, value)
            obj = self.create_obj(klass, resolved_values)
            self.session.add(obj)


    def add_klasses(self, klass, items):
        """
        Returns a list of the new objects. These objects are already in session, so you don't *need* to do anything with them.
        """
        objects = []
        for item in items:
            obj = self.add_klass_with_values(klass, item)
            objects.append(obj)
        return objects

    def from_list(self, session, data):
        """
        Extract data from a list of groups in the form:

        [
            { #start of the first grouping
              ObjectName:[ #start of objects of type ObjectName
                          {'attribute':'value', 'attribute':'value' ... more attributes},
                          {'attribute':'value', 'attribute':'value' ... more attributes},
                          ...
                          }
                          ]
              ObjectName: [ ... more attr dicts here ... ]
              [commit:None] #optionally commit at the end of this grouping
              [flush:None]  #optionally flush at the end of this grouping
            }, #end of first grouping
            { #start of the next grouping
              ...
            } #end of the next grouping
        ]

        Data can also be nested, for example; here are three different ways to do it. The following:

        --- Mountaineering Data Document
        - MountainRegion:
          - name: Appalacians
            coast: East
            climate: { '!Climate': { high: 85, low: 13, precipitation: '54 inches annually' } }
            ranges:
              - '!MountainRange': { name: Blue Ridge Mountains, peak: Mount Mitchell }
              - '!MountainRange': { name: Piedmont Plateau, peak: Piedmont Crescent Peak }
            valleys:
              '!ValleyArea': [ { name: Hudson River Crevasse }, { name: Susquehanna Valleyway } ]

          Is equivalent to this:

        --- Mountaineering Data Document
        - Climate:
            '&appal-climate': { high: 85, low: 13, precipitation: '54 inches annually' }
        - MountainRange: ['&blue-ridge': { name: Blue Ridge Mountains, peak: Mount Mitchell },
                          '&peidmont': { name: Piedmont Plateau, peak: Piedmont Crescent Peak }]
        - ValleyArea:
          - '&hudson':
              name: Hudson River Crevasse
          - '&susq':
              name: Susquehanna Valleyway
        - MountainRegion:
          - name: Appalacians
            coast: East
            climate: '*appal-climate'
            ranges: ['*blue-ridge', '*peidmont']
            valleys: ['*hudson', '*susq']

        However, the nested data is not and cannot be added to the list of references. It is anonymous in that sense.

        Careful! Here are some pitfalls:

        This would double list the valleys. Not good. Like saying "valleys: [['*hudson', '*susq']]"
            valleys:
              - '!ValleyArea': [ { name: Hudson River Crevasse }, { name: Susquehanna Valleyway } ]

        This is not valid:
            climate: '!Climate': { high: 85, low: 13, precipitation: '54 inches annually' }

        Also, literal tags, like !Climate (without quotes), do not work, and will generally break.
        """
        self.session = session
        klass = None
        item = None
        group = None
        skip_keys = ['flush', 'commit', 'clear']
        try:
            print "Modules: ", self.modules
            for group in data:
                # print "Group: ", group
                for name, items in group.iteritems():
                    if name not in skip_keys:
                        # print "Name: ", name
                        # print "Items: ", items

                        klass = self.get_klass(name)
                        # print klass, '\n'
                        self.add_klasses(klass, items)

                # session.flush()

                if 'flush' in group:
                    session.flush()
                if 'commit' in group:
                    session.commit()
                if 'clear' in group:
                    self.clear()

        except AttributeError, e:
            if hasattr(item, 'iteritems'):
                missing_refs = [(key, value) for key, value in item.iteritems() if isinstance(value,basestring) and value.startswith('*')]
                self.log_error(e, data, klass, item)
                if missing_refs:
                    log.error('*'*80)
                    log.error('It is very possible you are missing a reference, or require a "flush:" between blocks to store the references')
                    log.error('here is a list of references that were not accessible (key, value): %s'%missing_refs)
                    log.error('*'*80)
            else:
                self.log_error(e, data, klass, item)
        ## except IntegrityError, e:
        ##     raise IntegrityError("Error while inserting %s. Original Error: %s" %
        ##         (klass.__name__, str(item), str(e)))
        #except Exception, e:
        #    self.log_error(sys.exc_info()[2], data, klass, item)
        #    raise

        self.session = None

    def log_error(self, e, data, klass, item):
        log.error('error occured while loading yaml data with output:\n%s'%pformat(data))
        log.error('references:\n%s'%pformat(self._references))
        log.error('class: %s'%klass)
        log.error('item: %s'%item)
        import traceback
        log.error(traceback.format_exc(e))

    def merge_dicts(self, *dict_args):
        '''
        Given any number of dicts, shallow copy and merge into a new dict,
        precedence goes to key value pairs in latter dicts.
        '''
        result = []

        if isinstance(dict_args, tuple):
            for i in dict_args:
                for dictionary in i:
                    result.append(dictionary)
        return result

class YamlLoader(Loader):

    def loadf(self, session, filename):
        """
        Load a yaml file by filename.
        """
        self.source = filename
        s = open(filename).read()
        return self.loads(session, s)

    def loads(self, session, s):
        """
        Load a yaml string into the database.
        """
        data = load(s)
        if data:
            return self.from_list(session, data)
