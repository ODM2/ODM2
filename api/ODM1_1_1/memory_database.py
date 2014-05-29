
import sqlite3

class MemoryDatabase(object):
### this code should be changed to work with the database abstract layer so that sql queries are not in the code

    # series_service is a SeriesService
    def __init__(self, series_service):
        self.series_service = series_service        
        self.conn = sqlite3.connect(":memory:", detect_types= sqlite3.PARSE_DECLTYPES)
        self.cursor = self.conn.cursor()
        self.editLoaded= False
        self.initDB()
        self.initSC()

     ############
     #DB Queries
     ###########   
    def delete_points(self, filter):
        raise NotImplementedError

    def add_points(self, filter):
        raise NotImplementedError

    def update_points(self, filter, values):
        raise NotImplementedError

    def get_data_values(self):
        return []

    def getDataValuesforEdit(self):  
        # query = "SELECT ValueID, SeriesID, DataValue, ValueAccuracy, LocalDateTime, UTCOffset, DateTimeUTC, QualifierCode, OffsetValue, OffsetTypeID, CensorCode, SampleID FROM DataValues AS d LEFT JOIN Qualifiers AS q ON (d.QualifierID = q.QualifierID) "
        query = "SELECT * from DataValues ORDER BY LocalDateTime"
        self.cursor.execute(query)
        return [list(x) for x in  self.cursor.fetchall()]

    def getEditDataValuesforGraph(self):   
        query ="SELECT DataValue, LocalDateTime, CensorCode, strftime('%m', LocalDateTime) as DateMonth, strftime('%Y', LocalDateTime) as DateYear FROM DataValues ORDER BY LocalDateTime"
        self.cursor.execute(query)
        return [list(x) for x in  self.cursor.fetchall()]# return a list of lists orig returns a list of cursors
    
    def getEditRowCount(self):
        query ="SELECT COUNT(ValueID) FROM DataValues "
        self.cursor.execute(query)
        return self.cursor.fetchone()[0]


    def getEditColumns(self):
        sql = "SELECT * FROM DataValues WHERE 1=0 "
        # sql= "SELECT ValueID, SeriesID, DataValue, ValueAccuracy, LocalDateTime, UTCOffset, DateTimeUTC, QualifierCode, OffsetValue, OffsetTypeID, CensorCode, SampleID FROM DataValues AS d LEFT JOIN Qualifiers AS q ON (d.QualifierID = q.QualifierID) WHERE 1=0"
        self.cursor.execute(sql)  
        return [(x[0],i) for (i,x) in enumerate(self.cursor.description)]

    def getDataValuesforGraph(self, seriesID, noDataValue, startDate=None, endDate=None):
        series = self.series_service.get_series_by_id(seriesID)
        DataValues = [
            (dv.data_value, dv.local_date_time, dv.censor_code, dv.local_date_time.strftime('%m'), dv.local_date_time.strftime('%Y') )
            for dv in series.data_values
            if dv.data_value != noDataValue if dv.local_date_time >= startDate if dv.local_date_time <= endDate
        ]
        return DataValues

    def getSeriesCatalog(self):
        sql = "SELECT * FROM SeriesCatalog"
        self.cursor.execute(sql)    
        return [list(x) for x in self.cursor.fetchall()]


    def getSeriesColumns(self):
        sql = "SELECT * FROM SeriesCatalog WHERE 1=0"
        self.cursor.execute(sql)  
        return (x[0] for (i,x) in enumerate(self.cursor.description))

    def resetDB(self, series_service):
        self.series_service = series_service

        self.conn = sqlite3.connect(":memory:", detect_types= sqlite3.PARSE_DECLTYPES)
        self.cursor = self.conn.cursor()
        self.initDB()

        self.DataValues= None
        self.SeriesCatalog = None

    def commit(self):
        self.conn.commit()

    def rollback(self):
        self.conn.rollback()

    def stopEdit(self):       
        self.DataValues= None
        self.editLoaded= False
        self.cursor.execute("DROP TABLE DataValues")
        self.conn.commit()
        self.createEditTable()


    def initEditValues(self, seriesID):
        if not self.editLoaded:
            series = self.series_service.get_series_by_id(seriesID)
            self.DataValues = [(dv.id, dv.data_value, dv.value_accuracy, dv.local_date_time, dv.utc_offset, dv.date_time_utc,
                dv.site_id, dv.variable_id, dv.offset_value, dv.offset_type_id, dv.censor_code,
                dv.qualifier_id, dv.method_id, dv.source_id, dv.sample_id, dv.derived_from_id,
                dv.quality_control_level_id) for dv in series.data_values]

            self.cursor.executemany("INSERT INTO DataValues VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", self.DataValues)
            self.conn.commit()
            self.editLoaded = True



    def initSC(self):
        self.SeriesCatalog = [(s.id, s.site_id, s.site_code, s.site_name, s.variable_id, s.variable_code,
            s.variable_name, s.speciation, s.variable_units_id, s.variable_units_name, s.sample_medium,
            s.value_type, s.time_support, s.time_units_id, s.time_units_name, s.data_type, s.general_category,
            s.method_id, s.method_description, s.source_id, s.organization, s.source_description,
            s.citation, s.quality_control_level_id, s.quality_control_level_code, s.begin_date_time,
            s.end_date_time, s.begin_date_time_utc, s.end_date_time_utc, s.value_count) for s in self.series_service.get_all_series() ]
        self.cursor.executemany("INSERT INTO SeriesCatalog VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", self.SeriesCatalog)
        self.cursor.execute("ALTER TABLE SeriesCatalog ADD COLUMN isSelected INTEGER ")
        
        self.cursor.execute("UPDATE SeriesCatalog SET isSelected=0")
        self.conn.commit()

    def initDB(self):
        self.cursor.execute("""CREATE TABLE SeriesCatalog
                (SeriesID INTEGER NOT NULL,
                SiteID INTEGER,
                SiteCode VARCHAR(50),
                SiteName VARCHAR(255),
                VariableID INTEGER, 
                VariableCode VARCHAR(50), 
                VariableName VARCHAR(255),
                Speciation VARCHAR(255),
                VariableUnitsID INTEGER,
                VariableUnitsName VARCHAR(255),
                SampleMedium VARCHAR(255),
                ValueType VARCHAR(255),
                TimeSupport FLOAT, 
                TimeUnitsID INTEGER, 
                TimeUnitsName VARCHAR(255),
                DataType VARCHAR(255), 
                GeneralCategory VARCHAR(255), 
                MethodID INTEGER, 
                MethodDescriptions VARCHAR(255),
                SourceID INTEGER, 
                Organization VARCHAR(255),
                SourceDescription VARCHAR(255),
                Citation VARCHAR(255), 
                QualityControlLevelID INTEGER, 
                QualityControlLevelCode VARCHAR(50),
                BeginDateTime TIMESTAMP, 
                EndDateTime TIMESTAMP, 
                BeginDateTimeUTC TIMESTAMP, 
                EndDateTimeUTC TIMESTAMP, 
                ValueCount INTEGER,

                PRIMARY KEY (SeriesID))
                
               """)




        self.createEditTable()

    def createEditTable(self):
        self.cursor.execute("""CREATE TABLE DataValues
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

                PRIMARY KEY (ValueID),
                UNIQUE (DataValue, LocalDateTime, SiteID, VariableID, MethodID, SourceID, QualityControlLevelID, SampleID))
               """)