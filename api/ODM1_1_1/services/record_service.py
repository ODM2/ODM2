import logging

from wx.lib.pubsub import pub as Publisher

from common.logger import LoggerTool


tool = LoggerTool()
logger = tool.setupLogger(__name__, __name__ + '.log', 'w', logging.DEBUG)


class RecordService():
    # Script header (imports etc.) will be set up in Main when record is clicked.
    def __init__(self, script, edit_service, connection_string, record=False):
        self._script = script
        #logger.debug(dir(self._script))
        self._edit_service = edit_service
        self._connection_string = connection_string
        self._record = record

    ###################
    # Filters
    ###################
    def filter_value(self, value, operator):
        self._edit_service.filter_value(value, operator)
        if self._record:
            self._script("edit_service.filter_value(%s, '%s')\n" % (value, operator), 'black')
            Publisher.sendMessage("scroll")


    def filter_date(self, before, after):
        self._edit_service.filter_date(before, after)
        if self._record:
            self._script("edit_service.filter_date(%s, %s)\n" % (repr(before), repr(after)), 'black')
            Publisher.sendMessage("scroll")


    def data_gaps(self, value, time_period):
        self._edit_service.data_gaps(value, time_period)
        if self._record:
            self._script("edit_service.data_gaps(%s, '%s')\n" % (value, time_period), 'black')
            Publisher.sendMessage("scroll")


    def value_change_threshold(self, value):
        self._edit_service.value_change_threshold(value)
        if self._record:
            self._script("edit_service.value_change_threshold(%s)\n" % (value), 'black')
            Publisher.sendMessage("scroll")


    def toggle_filter_previous(self):
        self._edit_service.toggle_filter_previous()

    def select_points_tf(self, tf_list):
        self._edit_service.select_points_tf(tf_list)
        if self._record:
            #print [x[2] for x in self._edit_service.get_filtered_points()]
            self._script("edit_service.select_points({list})\n".format(
                list=[x[2] for x in self._edit_service.get_filtered_points()]))
            Publisher.sendMessage("scroll")

    def select_points(self, id_list=[], datetime_list=[]):
        self._edit_service.select_points(id_list, datetime_list)
        if self._record:
            #print [x[2] for x in self._edit_service.get_filtered_points()]
            #self._script("edit_service.select_points({list})\n".format(list=[x[2] for x in self._edit_service.get_filtered_points()]))
            self._script("edit_service.select_points({id}, {list})\n".format(id=id_list, list=[x[2] for x in
                                                                                               self._edit_service.get_filtered_points()]))
            Publisher.sendMessage("scroll")
            #print self._edit_service.get_filtered_points()


    ###################
    # Editing
    ###################
    def add_points(self, points):
        self._edit_service.add_points(points)
        if self._record:
            self._script("# add points\n")
            Publisher.sendMessage("scroll")


    def delete_points(self):
        self._edit_service.delete_points()
        if self._record:
            self._script("edit_service.delete_points()\n", 'black')
            Publisher.sendMessage("scroll")


    def change_value(self, operator, value):
        self._edit_service.change_value(operator, value)
        if self._record:
            self._script("edit_service.change_value(%s, '%s')\n" % (operator, value), 'black')
            Publisher.sendMessage("scroll")


    def interpolate(self):
        self._edit_service.interpolate()
        if self._record:
            self._script("edit_service.interpolate()\n", 'black')
            Publisher.sendMessage("scroll")


    def drift_correction(self, gap_width):
        ret = self._edit_service.drift_correction(gap_width)
        if self._record:
            self._script("edit_service.drift_correction(%s)\n" % (gap_width), 'black')
            Publisher.sendMessage("scroll")

        return ret

    def reset_filter(self):
        self._edit_service.reset_filter()
        if self._record:
            self._script("edit_service.reset_filter()\n", 'black')
            Publisher.sendMessage("scroll")


    def flag(self, qualifier_id):
        self._edit_service.flag(qualifier_id)
        if self._record:
            self._script("edit_service.flag(%s)\n" % qualifier_id, 'black')
            Publisher.sendMessage("scroll")


    def restore(self):
        self._edit_service.restore()
        if self._record:
            self._script("edit_service.restore()\n", 'black')
            Publisher.sendMessage("scroll")


    def save(self, var=None, method=None, qcl=None, isSave=False):
        self._edit_service.save(var=var, method=method, qcl=qcl, isSave=isSave)
        if self._record:
            self._script("edit_service.save()\n", 'black')
            Publisher.sendMessage("scroll")


    ###################
    # Gets
    ###################
    def get_series(self):
        return self._edit_service.get_series()

    def get_series_points(self):
        return self._edit_service.get_series_points()

    def get_filtered_points(self):
        return self._edit_service.get_filtered_points()

    def get_filter_list(self):
        return self._edit_service.get_filter_list()

    def get_filtered_dates(self):
        return self._edit_service.get_filtered_dates()

    def get_selection_groups(self):
        return self._edit_service.get_selection_groups()

    def get_qcl(self, q):
        qcl = self._edit_service.get_qcl(q.id)
        if self._record:
            self._script('new_qcl = series_service.get_qcl_by_id(%s)\n' % (qcl.id))
            Publisher.sendMessage("scroll")

        return qcl

    def get_method(self, m):
        method = self._edit_service.get_method(m.id)
        if self._record:
            self._script('new_method = series_service.get_method_by_id(%s)\n' % (method.id))
            Publisher.sendMessage("scroll")

        return method

    def get_variable(self, v):
        var = self._edit_service.get_variable(v.id)
        if self._record:
            self._script('new_variable = series_service.get_variable_by_id(%s)\n' % (var.id))
            Publisher.sendMessage("scroll")

        return var


    def toggle_record(self):
        if self._record:
            self._record = False
        else:
            self._record = True

    ###################
    # Creates
    ###################
    def create_qcl(self, code, definition, explanation):
        qcl = self._edit_service.create_qcl(code, definition, explanation)
        if self._record:
            self._script('new_qcl = series_service.get_qcl_by_id(%s)\n' % (qcl.id))
            Publisher.sendMessage("scroll")

        return qcl

    def create_method(self, m):
        method = self._edit_service.create_method(m.description, m.link)
        if self._record:
            self._script('new_method = series_service.get_method_by_id(%s)\n' % (method.id))
            Publisher.sendMessage("scroll")

        return method

    def create_variable(self, v):
        var = self._edit_service.create_variable(v.code, v.name, v.speciation, v.variable_unit_id, v.sample_medium,
                                                 v.value_type, v.is_regular, v.time_support, v.time_unit_id,
                                                 v.data_type, v.general_category, v.no_data_value)
        if self._record:
            self._script('new_variable = series_service.get_variable_by_id(%s)\n' % (var.id))
            Publisher.sendMessage("scroll")

        return var

    def write_header(self):
        self._script("from odmservices import EditService\n", 'black')
        self._script("from odmservices import SeriesService\n", 'black')
        self._script("edit_service  = EditService(series_id={id}, connection_string='{con}')\n".format(
            id=self._edit_service._series_id, con=self._connection_string), 'black')
        self._script("series_service = SeriesService(connection_string='%s')\n" % (self._connection_string), 'black')
        self._script("## To run commands from the python console uncomment and run the following command ##\n", 'black')
        self._script("#edit_service = Tools\n", 'black')
        Publisher.sendMessage("scroll")


