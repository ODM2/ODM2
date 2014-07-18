import csv
import xml.etree.cElementTree as ET
import datetime


class ExportService():
    '''
    Create with the Service Manager!!!
    '''

    def __init__(self, series_service):
        self._series_service = series_service
        self.dt_format_str = "%m/%d/%Y %I:%M:%S %p"

    def export_series_data(self, series_id, filename, utc=False, site=False, var=False, offset=False, qual=False,
                           src=False, qcl=False):
        series = self._series_service.get_series_by_id(series_id)
        if series is None:
            return False

        writer = csv.writer(open(filename, 'wb'))
        print "filename: ", filename
        self.write_data_header(writer, utc, site, var, offset, qual, src, qcl)
        for dv in series.data_values:
            self.write_data_row(writer, series, dv, utc, site, var, offset, qual, src, qcl)


    def write_data_row(self, writer, series, dv, utc, site, var, offset, qual, src, qcl):
        data = []
        data.append(series.id)
        data.append(dv.id)
        data.append(dv.data_value)
        data.append(dv.value_accuracy)
        data.append(dv.local_date_time)
        if utc:
            data.append(dv.utc_offset)
            data.append(dv.date_time_utc)
        data.append(series.site_code)
        if site:
            data.append(series.site_name)
            data.append(series.site.type)
            data.append(series.site.latitude)
            data.append(series.site.longitude)
            data.append(series.site.spatial_ref.srs_name)
        data.append(series.variable_code)
        if var:
            data.append(series.variable_name)
            data.append(series.speciation)
            data.append(series.variable_units_name)
            data.append(series.variable.variable_unit.abbreviation)
            data.append(series.sample_medium)
        data.append(dv.offset_value)
        data.append(dv.offset_type_id)
        if offset:
            if dv.offset_type is not None:
                data.append(dv.offset_type.description)
                data.append(dv.offset_type.unit.name)
            else:
                data.append('')
                data.append('')
        data.append(dv.censor_code)
        data.append(dv.qualifier_id)
        if qual:
            if dv.qualifier is not None:
                data.append(dv.qualifier.code)
                data.append(dv.qualifier.description)
            else:
                data.append('')
                data.append('')
        if src:
            data.append(series.organization)
            data.append(series.source_description)
            data.append(series.citation)
        if qcl:
            data.append(series.quality_control_level_code)
            data.append(series.quality_control_level.definition)
            data.append(series.quality_control_level.explanation)
        data.append(dv.sample_id)

        writer.writerow(data)


    def write_data_header(self, writer, utc, site, var, offset, qual, src, qcl):
        # Build header list
        header = []
        header.append("SeriesId")
        header.append("ValueId")
        header.append("DataValue")
        header.append("ValueAccuracy")
        header.append("LocalDateTime")
        if utc:
            header.append("UTCOffset")
            header.append("DateTimeUTC")
        header.append("SiteCode")
        if site:
            header.append("SiteName")
            header.append("SiteType")
            header.append("Latitude")
            header.append("Longitude")
            header.append("SRSName")
        header.append("VariableCode")
        if var:
            header.append("VariableName")
            header.append("Speciation")
            header.append("VariableUnitsName")
            header.append("VariableUnitsAbbreviation")
            header.append("SampleMedium")
        header.append("OffsetValue")
        header.append("OffsetTypeID")
        if offset:
            header.append("OffsetDescription")
            header.append("OffsetUnitsName")
        header.append("CensorCode")
        header.append("QualifierID")
        if qual:
            header.append("QualifierCode")
            header.append("QualifierDescription")
        if src:
            header.append("Organization")
            header.append("SourceDescription")
            header.append("Citation")
        if qcl:
            header.append("QualityControlLevelCode")
            header.append("Definition")
            header.append("Explanation")
        header.append("SampleID")

        writer.writerow(header)

    def export_series_metadata(self, series_ids, filename):
        if len(series_ids) == 0:
            return

        root = ET.Element("Metadata")
        list_root = ET.SubElement(root, "DataSeriesList")
        list_root.set("Total", str(len(series_ids)))

        try:
            with open(filename):
                file_exists = True
        except IOError:
            file_exists = False

        if file_exists:
            # Read the file into the XML tree
            pass

        for series_id in series_ids:
            series = self._series_service.get_series_by_id(series_id)
            self.append_series_node(series, list_root)

        tree = ET.ElementTree(root)
        tree.write(filename)

    def append_series_node(self, series, parent):
        series_node = ET.SubElement(parent, "DataSeries")
        series_node.set("ID", str(series.id))
        self.append_general_info(series, series_node)
        self.append_site_info(series, series_node)
        self.append_var_info(series, series_node)
        self.append_method_source_info(series, series_node)
        self.append_misc_info(series, series_node)

        return series_node

    def append_general_info(self, series, parent):
        meta = series.source.iso_metadata
        general_node = ET.SubElement(parent, "GeneralInformation")
        topic = ET.SubElement(general_node, "TopicCategory")
        topic.text = meta.topic_category
        title = ET.SubElement(general_node, "Title")
        title.text = meta.title
        abstract = ET.SubElement(general_node, "Abstract")
        abstract.text = meta.abstract
        prof_version = ET.SubElement(general_node, "ProfileVersion")
        prof_version.text = meta.profile_version
        metadata_link = ET.SubElement(general_node, "MetadataLink")
        metadata_link.text = meta.metadata_link
        date = ET.SubElement(general_node, "MetadataCreationDate")
        # 7/1/2013 12:17:16 PM
        date.text = datetime.datetime.now().strftime(self.dt_format_str)

    def append_site_info(self, series, parent):
        site = series.site
        site_node = ET.SubElement(parent, "SiteInformation")
        site_code = ET.SubElement(site_node, "SiteCode")
        site_code.text = site.code
        site_name = ET.SubElement(site_node, "SiteName")
        site_name.text = site.name
        site_type = ET.SubElement(site_node, "SiteType")
        site_type.text = site.type

        geo_coords = ET.SubElement(site_node, "GeographicCoordinates")
        latitude = ET.SubElement(geo_coords, "Latitude")
        latitude.text = str(site.latitude)
        longitude = ET.SubElement(geo_coords, "Longitude")
        longitude.text = str(site.longitude)
        srs_id = ET.SubElement(geo_coords, "SRSID")
        srs_id.text = str(site.spatial_ref.srs_id)
        srs_name = ET.SubElement(geo_coords, "SRSName")
        srs_name.text = site.spatial_ref.srs_name
        is_geo = ET.SubElement(geo_coords, "IsGeographic")
        is_geo.text = str(site.spatial_ref.is_geographic)
        notes = ET.SubElement(geo_coords, "Notes")
        notes.text = site.spatial_ref.notes

        local_coords = ET.SubElement(site_node, "LocalCoordinates")
        local_x = ET.SubElement(local_coords, "LocalX")
        local_x.text = str(site.local_x)
        local_y = ET.SubElement(local_coords, "LocalY")
        local_y.text = str(site.local_y)
        local_srs_id = ET.SubElement(local_coords, "SRSID")
        local_srs_id.text = str(site.local_spatial_ref.srs_id)
        local_srs_name = ET.SubElement(local_coords, "SRSName")
        local_srs_name.text = site.local_spatial_ref.srs_name
        local_is_geo = ET.SubElement(local_coords, "IsGeographic")
        local_is_geo.text = str(site.local_spatial_ref.is_geographic)
        local_notes = ET.SubElement(local_coords, "Notes")
        local_notes.text = site.local_spatial_ref.notes
        elevation = ET.SubElement(local_coords, "Elevation_m")
        if site.elevation_m: elevation.text = str(site.elevation_m)
        vert_datum = ET.SubElement(local_coords, "VerticalDatum")
        if site.vertical_datum_id: vert_datum.text = str(site.vertical_datum_id)

        pos_accuracy = ET.SubElement(site_node, "PosAccuracy_m")
        pos_accuracy.text = str(site.pos_accuracy_m)
        state = ET.SubElement(site_node, "State")
        state.text = site.state
        county = ET.SubElement(site_node, "County")
        county.text = site.county
        comments = ET.SubElement(site_node, "Comments")
        comments.text = site.comments

    def append_var_info(self, series, parent):
        variable = series.variable
        var_node = ET.SubElement(parent, "VariableInformation")

        var_code = ET.SubElement(var_node, "VariableCode")
        var_code.text = variable.code
        var_name = ET.SubElement(var_node, "VariableName")
        var_name.text = variable.name
        speciation = ET.SubElement(var_node, "Speciation")
        speciation.text = variable.speciation

        var_units = ET.SubElement(var_node, "VariableUnits")
        units_name = ET.SubElement(var_units, "UnitsName")
        units_name.text = variable.variable_unit.name
        units_type = ET.SubElement(var_units, "UnitsType")
        units_type.text = variable.variable_unit.type
        units_abbrev = ET.SubElement(var_units, "UnitsAbbreviation")
        units_abbrev.text = variable.variable_unit.abbreviation

        sample_medium = ET.SubElement(var_node, "SampleMedium")
        sample_medium.text = variable.sample_medium
        val_type = ET.SubElement(var_node, "ValueType")
        val_type.text = variable.value_type
        is_reg = ET.SubElement(var_node, "IsRegular")
        is_reg.text = str(variable.is_regular)
        time_support = ET.SubElement(var_node, "TimeSupport")
        time_support.text = str(variable.time_support)

        time_support_units = ET.SubElement(var_node, "TimeSupportUnits")
        ts_units_name = ET.SubElement(time_support_units, "UnitsName")
        ts_units_name.text = variable.time_unit.name
        ts_units_type = ET.SubElement(time_support_units, "UnitsType")
        ts_units_type.text = variable.time_unit.type
        ts_units_abbrev = ET.SubElement(time_support_units, "UnitsAbbreviation")
        ts_units_abbrev.text = variable.time_unit.abbreviation

        data_type = ET.SubElement(var_node, "DataType")
        data_type.text = variable.data_type
        gen_cat = ET.SubElement(var_node, "GeneralCategory")
        gen_cat.text = variable.general_category
        no_dv = ET.SubElement(var_node, "NoDataValue")
        no_dv.text = str(variable.no_data_value)

        period = ET.SubElement(var_node, "PeriodOfRecord")
        begin_dt = ET.SubElement(period, "BeginDateTime")
        begin_dt.text = series.begin_date_time.strftime(self.dt_format_str)
        end_dt = ET.SubElement(period, "EndDateTime")
        end_dt.text = series.end_date_time.strftime(self.dt_format_str)
        begin_dt_utc = ET.SubElement(period, "BeginDateTimeUTC")
        begin_dt_utc.text = series.begin_date_time_utc.strftime(self.dt_format_str)
        end_dt_utc = ET.SubElement(period, "EndDateTimeUTC")
        end_dt_utc.text = series.end_date_time_utc.strftime(self.dt_format_str)
        value_count = ET.SubElement(period, "ValueCount")
        value_count.text = str(series.value_count)

    def append_method_source_info(self, series, parent):
        method = series.method
        method_node = ET.SubElement(parent, "MethodInformation")
        method_desc = ET.SubElement(method_node, "MethodDescription")
        method_desc.text = method.description
        method_link = ET.SubElement(method_node, "MethodLink")
        method_link.text = method.link

        source = series.source
        source_node = ET.SubElement(parent, "SourceInformation")
        org = ET.SubElement(source_node, "Organization")
        org.text = source.organization
        source_desc = ET.SubElement(source_node, "SourceDescription")
        source_desc.text = source.description
        source_link = ET.SubElement(source_node, "SourceLink")
        source_link.text = source.link

        contact = ET.SubElement(source_node, "Contact")
        contact_name = ET.SubElement(contact, "ContactName")
        contact_name.text = source.contact_name
        phone = ET.SubElement(contact, "Phone")
        phone.text = source.phone
        email = ET.SubElement(contact, "Email")
        email.text = source.email
        address = ET.SubElement(contact, "Address")
        address.text = source.address
        city = ET.SubElement(contact, "City")
        city.text = source.city
        state = ET.SubElement(contact, "State")
        state.text = source.state
        zip_code = ET.SubElement(contact, "ZipCode")
        zip_code.text = source.zip_code

        citation = ET.SubElement(source_node, "Citation")
        citation.text = source.citation

    def append_misc_info(self, series, parent):
        qcl = series.quality_control_level

        qcl_node = ET.SubElement(parent, "QualityControlLevelInformation")
        qcl_code = ET.SubElement(qcl_node, "QualityControlLevelCode")
        qcl_code.text = qcl.code
        qcl_def = ET.SubElement(qcl_node, "Definition")
        qcl_def.text = qcl.definition
        qcl_expl = ET.SubElement(qcl_node, "Explanation")
        qcl_expl.text = qcl.explanation

        offsets_node = ET.SubElement(parent, "OffsetInformation")
        offsets = self._series_service.get_offset_types_by_series_id(series.id)
        for offset in offsets:
            offset_id = ET.SubElement(offsets_node, "Offset")
            if offset:
                offset_id.set("ID", str(offset.id))
            else:
                offset_id.set("ID", "")
            offset_desc = ET.SubElement(offsets_node, "OffsetDescription")
            if offset: offset_desc.text = offset.description
            offset_units = ET.SubElement(offsets_node, "OffsetUnits")
            units_name = ET.SubElement(offset_units, "UnitsName")
            if offset: units_name.text = offset.unit.name
            units_type = ET.SubElement(offset_units, "UnitsType")
            if offset: units_type.text = offset.unit.type
            units_abbrev = ET.SubElement(offset_units, "UnitsAbbreviation")
            if offset: units_abbrev.text = offset.unit.abbreviation

        qualifiers_node = ET.SubElement(parent, "QualifierInformation")
        qualifiers = self._series_service.get_qualifiers_by_series_id(series.id)
        for qual in qualifiers:
            qual_id = ET.SubElement(qualifiers_node, "Qualifier")
            if qual:
                qual_id.set("ID", str(qual.id))
            else:
                qual_id.set("ID", "")
            qual_code = ET.SubElement(qual_id, "QualiferCode")
            if qual: qual_code.text = qual.code
            qual_desc = ET.SubElement(qual_id, "QualifierDescription")
            if qual: qual_desc.text = qual.description

        samples_node = ET.SubElement(parent, "SampleInformation")
        samples = self._series_service.get_samples_by_series_id(series.id)
        for sample in samples:
            sample_id = ET.SubElement(samples_node, "Sample")
            if sample:
                sample_id.set("ID", str(sample.id))
            else:
                sample_id.set("ID", "")
            sample_type = ET.SubElement(sample_id, "SampleType")
            if sample: sample_type.text = sample.type
            lab_code = ET.SubElement(sample_id, "LabSampleCode")
            if sample: lab_code.text = sample.lab_sample_code
            lab_method_id = ET.SubElement(sample_id, "LabMethodID")
            if sample: lab_method_id = sample.lab_method_id

        lab_method_node = ET.SubElement(parent, "LabMethodInformation")
        for sample in samples:
            if sample: lab_method = sample.lab_method
            lab_method_id = ET.SubElement(lab_method_node, "LabMethod")
            if lab_method:
                lab_method_id.set("ID", str(lab_method.id))
            else:
                lab_method_id.set("ID", "")
            lab_name = ET.SubElement(lab_method_id, "LabName")
            if lab_method: lab_name.text = lab_method.name
            lab_org = ET.SubElement(lab_method_id, "LabOrganization")
            if lab_method: lab_org.text = lab_method.organization
            method_name = ET.SubElement(lab_method_id, "LabMethodName")
            if lab_method: method_name.text = lab_method.method_name
            method_desc = ET.SubElement(lab_method_id, "LabMethodDescription")
            if lab_method: method_desc.text = lab_method.method_description
            method_link = ET.SubElement(lab_method_id, "LabMethodLink")
            if lab_method: method_link.text = lab_method.link