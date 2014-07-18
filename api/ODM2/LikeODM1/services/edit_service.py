import sqlite3

from ODM1_1_1 import SessionFactory
from ODM1_1_1 import DataValue
from series_service import SeriesService
from ODM1_1_1 import series as series_module


class EditService():
    # Mutual exclusion: cursor, or connection_string
    def __init__(self, series_id, connection=None, connection_string="", debug=False):
        self._connection = connection
        self._series_id = series_id
        self._filter_from_selection = False
        self._debug = debug

        if (connection_string is not ""):
            self._session_factory = SessionFactory(connection_string, debug)
            self._series_service = SeriesService(connection_string, debug)
        elif (factory is not None):
            #TODO code has changed to no longer use a session factory, refactor so it is correct SR
            self._session_factory = factory
            service_manager = ServiceManager()
            self._series_service = service_manager.get_series_service()
        else:
            # One or the other must be set
            print("Must have either a connection string or session factory")
            #
            # TODO throw an exception

        self._edit_session = self._session_factory.getSession()

        if self._connection == None:
            series_service = SeriesService(connection_string, False)
            series = series_service.get_series_by_id(series_id)
            DataValues = [(dv.id, dv.data_value, dv.value_accuracy, dv.local_date_time, dv.utc_offset, dv.date_time_utc,
                           dv.site_id, dv.variable_id, dv.offset_value, dv.offset_type_id, dv.censor_code,
                           dv.qualifier_id, dv.method_id, dv.source_id, dv.sample_id, dv.derived_from_id,
                           dv.quality_control_level_id) for dv in series.data_values]
            self._connection = sqlite3.connect(":memory:", detect_types=sqlite3.PARSE_DECLTYPES)
            tmpCursor = self._connection.cursor()
            self.init_table(tmpCursor)
            tmpCursor.executemany("INSERT INTO DataValues VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", DataValues)

        self._connection.commit()
        self._cursor = self._connection.cursor()

        self._populate_series()
        self.reset_filter()

    def _populate_series(self):
        # [(ID, value, datetime), ...]
        self._cursor.execute("SELECT ValueID, DataValue, LocalDateTime FROM DataValues ORDER BY LocalDateTime")
        results = self._cursor.fetchall()

        self._series_points = results


    def _test_filter_previous(self):
        if not self._filter_from_selection:
            self.reset_filter()

    ###################
    # Filters
    ###################
    # operator is a character, either '<' or '>'
    def filter_value(self, value, operator):
        self._test_filter_previous()

        if operator == '<':  # less than
            for i in range(len(self._series_points)):
                # If it's not already in the selection, skip it
                if (self._filter_from_selection and not self._filter_list[i]):
                    continue
                if self._series_points[i][1] < value:
                    self._filter_list[i] = True
                else:
                    self._filter_list[i] = False
        if operator == '>':  # greater than
            for i in range(len(self._series_points)):
                if (self._filter_from_selection and not self._filter_list[i]):
                    continue
                if self._series_points[i][1] > value:
                    self._filter_list[i] = True
                else:
                    self._filter_list[i] = False

    def filter_date(self, before, after):
        self._test_filter_previous()

        previous_date_filter = False
        if before != None:
            tmp = []
            for i in range(len(self._series_points)):
                if (self._filter_from_selection and not self._filter_list[i]):
                    continue
                if self._series_points[i][2] < before:
                    self._filter_list[i] = True
                else:
                    self._filter_list[i] = False
            previous_date_filter = True  # We've done a previous date filter
        if after != None:
            for i in range(len(self._series_points)):
                if ((previous_date_filter or self._filter_from_selection)
                    and not self._filter_list[i]):
                    continue
                if self._series_points[i][2] > after:
                    self._filter_list[i] = True
                else:
                    self._filter_list[i] = False

    # Data Gaps
    def data_gaps(self, value, time_period):
        length = len(self._series_points)

        value_sec = 0

        if time_period == 'second':
            value_sec = value
        if time_period == 'minute':
            value_sec = value * 60
        if time_period == 'hour':
            value_sec = value * 60 * 60
        if time_period == 'day':
            value_sec = value * 60 * 60 * 24

        tmp = {}

        for i in xrange(length):
            if (self._filter_from_selection and
                    not self._filter_list[i]):
                continue

            if i + 1 < length:  # make sure we stay in bounds
                point1 = self._series_points[i]
                point2 = self._series_points[i + 1]
                interval = point2[2] - point1[2]
                interval_total_sec = interval.total_seconds()

                if interval_total_sec >= value_sec:
                    tmp[i] = True
                    tmp[i + 1] = True

        self.reset_filter()
        for key in tmp.keys():
            self._filter_list[key] = True

    def value_change_threshold(self, value, operator):
        length = len(self._series_points)
        tmp = {}
        for i in xrange(length):
            if (self._filter_from_selection and
                    not self._filter_list[i]):
                continue

            if i + 1 < length:  # make sure we stay in bounds
                point1 = self._series_points[i]
                point2 = self._series_points[i + 1]
                if operator == '>':
                    if abs(point1[1] - point2[1]) >= value:
                        tmp[i] = True
                        tmp[i + 1] = True
                if operator == '<':
                    if abs(point1[1] - point2[1]) <= value:
                        tmp[i] = True
                        tmp[i + 1] = True

        self.reset_filter()
        for key in tmp.keys():
            self._filter_list[key] = True

    def select_points_tf(self, tf_list):
        self._filter_list = tf_list

    def select_points(self, id_list=[], datetime_list=[]):
        self.reset_filter()

        # This should be either one or the other. If it's both, id is used first.
        # If neither are set this function does nothing.
        if len(id_list)>0:
            for i in range(len(self._series_points)):
                if self._series_points[i][0] in id_list:
                    self._filter_list[i] = True
        elif datetime_list != None:
            for i in range(len(self._series_points)):

                if self._series_points[i][2] in datetime_list:
                    self._filter_list[i] = True
        else:
            pass


    def reset_filter(self):
        self._filter_list = [False] * len(self._series_points)

    def toggle_filter_previous(self):
        self._filter_from_selection = not self._filter_from_selection


    ###################
    # Gets
    ###################
    def get_series(self):
        return self._series_service.get_series_by_id(self._series_id)

    def get_series_points(self):
        #all point in the series
        return self._series_points

    def get_filtered_points(self):
        #list of selected points
        tmp = []
        for i in range(len(self._series_points)):
            if self._filter_list[i]:
                tmp.append(self._series_points[i])

        return tmp

    def get_filtered_dates(self):

        return [x[2] for x in self.get_filtered_points()]

    def get_filter_list(self):
        #true or false list the length of the entire series. true indicate the point is selected
        return self._filter_list

    def get_qcl(self, qcl_id):
        return self._series_service.get_qcl_by_id(qcl_id)



    def get_method(self, method_id):
        return self._series_service.get_method_by_id(method_id)

    def get_variable(self, variable_id):
        return self._series_service.get_variable_by_id(variable_id)


    #################
    # Edits
    #################

    def change_value(self, value, operator):
        filtered_points = self.get_filtered_points()
        tmp_filter_list = self._filter_list
        query = "UPDATE DataValues SET DataValue = "
        if operator == '+':
            query += " DataValue + %s " % (value)

        if operator == '-':
            query += " DataValue - %s " % (value)

        if operator == '*':
            query += " DataValue * %s " % (value)

        if operator == '=':
            query += "%s " % (value)

        query += "WHERE ValueID IN ("
        for i in range(len(filtered_points) - 1):
            query += "%s," % (filtered_points[i][0])
        query += "%s)" % (filtered_points[-1][0])
        self._cursor.execute(query)

        self._populate_series()
        self._filter_list = tmp_filter_list

    def add_points(self, points):
        query = "INSERT INTO DataValues (DataValue, ValueAccuracy, LocalDateTime, UTCOffset, DateTimeUTC, OffsetValue, OffsetTypeID, "
        query += "CensorCode, QualifierID, SampleID, SiteID, VariableID, MethodID, SourceID, QualityControlLevelID) "
        query += "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
        self._cursor.executemany(query, points)
        self._populate_series()

    def delete_points(self):
        query = "DELETE FROM DataValues WHERE ValueID IN ("
        filtered_points = self.get_filtered_points()
        num_filtered_points = len(filtered_points)
        if num_filtered_points > 0:
            for i in range(num_filtered_points - 1):  # loop through the second-to-last active point
                query += "%s," % (filtered_points[i][0])  # append its ID
            query += "%s)" % (filtered_points[-1][0])  # append the final point's ID and close the set

            # Delete the points from the cursor
            self._cursor.execute(query)

            self._populate_series()
            self.reset_filter()

    def interpolate(self):
        tmp_filter_list = self._filter_list
        groups = self.get_selection_groups()

        for group in groups:
            # determine first and last point for the interpolation
            first_index = group[0] - 1
            last_index = group[-1] + 1
            # ignore this group (which is actually the whole set)
            # if it includes the first or last point of the series
            if first_index <= 0 or last_index == len(self._series_points):
                continue

            first_point = self._series_points[first_index]
            last_point = self._series_points[last_index]
            a = 0
            c = (last_point[2] - first_point[2]).total_seconds()
            f_a = first_point[1]
            f_c = last_point[1]
            update_list = []
            for i in group:
                b = (self._series_points[i][2] - first_point[2]).total_seconds()
                # linear interpolation formula: f(b) = f(a) + ((b-a)/(c-a))*(f(c) - f(a))
                new_val = f_a + ((b - a) / (c - a)) * (f_c - f_a)
                point_id = self._series_points[i][0]
                update_list.append((new_val, point_id))
            query = "UPDATE DataValues SET DataValue = ? WHERE ValueID = ?"
            self._cursor.executemany(query, update_list)

        self._populate_series()
        self._filter_list = tmp_filter_list

    def drift_correction(self, gap_width):
        tmp_filter_list = self._filter_list
        groups = self.get_selection_groups()

        # only perform a drift correction if there's a single group
        if len(groups) == 1:
            group = groups[0]
            first_index = group[0]
            last_index = group[-1]
            first_point = self._series_points[first_index]
            last_point = self._series_points[last_index]
            x_l = (last_point[2] - first_point[2]).total_seconds()

            update_list = []
            for i in group:
                point = self._series_points[i]
                x_i = (point[2] - first_point[2]).total_seconds()
                # y_n = y_0 + G(x_i / x_l)
                new_val = point[1] + gap_width * (x_i / x_l)
                update_list.append((new_val, point[0]))
            query = "UPDATE DataValues SET DataValue = ? WHERE ValueID = ?"
            self._cursor.executemany(query, update_list)

            self._populate_series()
            self._filter_list = tmp_filter_list

            return True
        else:
            return False

    def get_selection_groups(self):
        length = len(self._series_points)
        found_group = False
        groups = []
        cur_group = []
        for i in range(length):
            if self._filter_list[i]:
                if not found_group:
                    found_group = True
                cur_group.append(i)  # Append the actual index to the point
                if i == length - 1:
                    groups.append(cur_group)
            elif not self._filter_list[i] and found_group:
                found_group = False
                groups.append(cur_group)
                cur_group = []
            else:
                continue

        return groups

    def flag(self, qualifier_id):
        filtered_points = self.get_filtered_points()
        query = "UPDATE DataValues SET QualifierID = %s WHERE ValueID = ?" % (qualifier_id)
        self._cursor.executemany(query, [(str(x[0]),) for x in filtered_points])

    ###################
    # Save/Restore
    ###################

    def restore(self):
        self._connection.rollback()
        self._populate_series()
        self.reset_filter()

    def save(self, var=None, method=None, qcl=None, isSave=False):
        dvs = []
        is_new_series = False

        if var is not None:
            self._cursor.execute("UPDATE DataValues SET VariableID = %s" % (var.id))
            is_new_series = True
        if method is not None:
            self._cursor.execute("UPDATE DataValues SET MethodID = %s" % (method.id))
            is_new_series = True
        # check that the code is not zero
        #if qcl is not None and qcl.code != 0:
        if qcl is not None:
            self._cursor.execute("UPDATE DataValues SET QualityControlLevelID = %s" % (qcl.id))
            is_new_series = True
        #else:
        #    raise ValueError("Quality Control Level cannot be zero")

        self._cursor.execute("SELECT * FROM DataValues ORDER BY LocalDateTime")
        results = self._cursor.fetchall()

        # ValueID, DataValue, ValueAccuracy, LocalDateTime, UTCOffset, DateTimeUTC, SiteID, VariableID,
        # OffsetValue, OffsetTypeID, CensorCode, QualifierID, MethodID, SourceID, SampleID, DerivedFromID, QualityControlLevelID
        for row in results:
            dv = self._build_dv_from_tuple(row)

            if is_new_series:
                dv.id = None
            dvs.append(dv)

        series = self._series_service.get_series_by_id(self._series_id)

        if is_new_series:
            series = series_module.copy_series(series)
            if var:
                series.variable_id = var.id
                series.variable_code = var.code
                series.variable_name = var.name
                series.speciation = var.speciation
                series.variable_units_id = var.variable_unit.id
                series.variable_units_name = var.variable_unit.name
                series.sample_medium = var.sample_medium
                series.value_type = var.value_type
                series.time_support = var.time_support
                series.time_units_id = var.time_unit.id
                series.time_units_name = var.time_unit.name
                series.data_type = var.data_type
                series.general_category = var.general_category
            if method:
                series.method_id = method.id
                series.method_description = method.description
            if qcl:
                series.quality_control_level_id = qcl.id
                series.quality_control_level_code = qcl.code

        series.begin_date_time = dvs[0].local_date_time
        series.end_date_time = dvs[-1].local_date_time
        series.begin_date_time_utc = dvs[0].date_time_utc
        series.end_date_time_utc = dvs[-1].date_time_utc
        series.value_count = len(dvs)

        if not is_new_series:
            # delete old dvs
            old_dvs = series.data_values
            self._series_service.delete_dvs(old_dvs)

        series.data_values = dvs
        print("series.data_values: %s" % ([x for x in series.data_values]))
        if self._series_service.save_series(series, dvs, isSave):
            print ("series saved!")
        else:
            print("Crap happened")

    def create_qcl(self, code, definition, explanation):
        return self._series_service.create_qcl(code, definition, explanation)

    def create_method(self, description, link):
        return self._series_service.create_method(description, link)

    def create_variable(self, code, name, speciation, variable_unit_id, sample_medium,
                        value_type, is_regular, time_support, time_unit_id, data_type, general_category, no_data_value):

        return self._series_service.create_variable(code, name, speciation, variable_unit_id, sample_medium,
                                                    value_type, is_regular, time_support, time_unit_id, data_type,
                                                    general_category, no_data_value)

    def reconcile_dates(self, parent_series_id):
        # FUTURE FEATURE: pull in new field data from another series and add to this series
        # (i.e one series contains new field data of an ediited series at a higher qcl)
        pass

    def _build_dv_from_tuple(self, dv_tuple):
        dv = DataValue()

        dv.id_list = dv_tuple[0]
        dv.data_value = dv_tuple[1]
        dv.value_accuracy = dv_tuple[2]
        dv.local_date_time = dv_tuple[3]
        dv.utc_offset = dv_tuple[4]
        dv.date_time_utc = dv_tuple[5]
        dv.site_id = dv_tuple[6]
        dv.variable_id = dv_tuple[7]
        dv.offset_value = dv_tuple[8]
        dv.offset_type_id = dv_tuple[9]
        dv.censor_code = dv_tuple[10]
        dv.qualifier_id = dv_tuple[11]
        dv.method_id = dv_tuple[12]
        dv.source_id = dv_tuple[13]
        dv.sample_id = dv_tuple[14]
        dv.derived_from_id = dv_tuple[15]
        dv.quality_control_level_id = dv_tuple[16]

        return dv

    def init_table(self, cursor):
        cursor.execute("""CREATE TABLE DataValues
                (ValueID INTEGER NOT NULL,
                DataValue FLOAT NOT NULL,
                ValueAccuracy FLOAT,
                LocalDateTime TIMESTAMP NOT NULL,
                UTCOffset FLOAT NOT NULL,
                DateTimeUTC TIMESTAMP NOT NULL,
                SiteID INTEGER NOT NULL,
                VariableID INTEGER NOT NULL,
                OffsetValue FLOAT,
                OffsetTypeID INTEGER,
                CensorCode VARCHAR(50) NOT NULL,
                QualifierID INTEGER,
                MethodID INTEGER NOT NULL,
                SourceID INTEGER NOT NULL,
                SampleID INTEGER,
                DerivedFromID INTEGER,
                QualityControlLevelID INTEGER NOT NULL,

                PRIMARY KEY (ValueID)
                UNIQUE (DataValue, LocalDateTime, SiteID, VariableID, MethodID, SourceID, QualityControlLevelID))
               """)