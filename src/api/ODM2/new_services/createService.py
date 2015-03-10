from ..models import TimeSeriesResults
from ..models import TimeSeriesResultValues
from ..models import SpatialReferences
from ..models import DeploymentActions
from ..models import Models
from ..models import RelatedModels
from ..models import Simulations
from ..models import Actions
from ..models import DataSetsResults
from ..models import ActionBy
from ..models import FeatureActions
from ..models import Results
from ..models import Variables
from ..models import Methods
from ..models import ProcessingLevels
from ..models import SamplingFeatures
from ..models import Units
from ..models import Organizations
from ..models import People
from ..models import Affiliations
from ..models import DataSets
#from src.api.ODM1_1_1 import Site

__author__ = 'jmeline'

from api import serviceBase
import datetime as dt
import uuid


# ################################################################################
# Annotations
# ################################################################################
class createAnnotations(serviceBase):
    def test(self):
        return None


# ################################################################################
# CV
# ################################################################################

class createCV(serviceBase):
    def test(self):
        return None


# ################################################################################
# Core
# ################################################################################


class createCore(serviceBase):
    def createVariable(self, code, name, vType, nodv, speciation=None, definition=None):
        """

        :param code:
            :type String(50):
        :param name:
            :type String(255):
        :param vType:
            :type String(255):
        :param nodv:
            :type Float(53):
        :param speciation:
            :type String(255):
        :param definition:
            :type String(500):
        :return:
        """
        var = Variables()
        var.VariableCode = code
        var.VariableNameCV = name
        var.VariableDefinition = definition
        var.VariableTypeCV = vType
        var.NoDataValue = nodv
        var.SpeciationCV = speciation

        self._session.add(var)
        self._session.commit()

        return var

    def createMethod(self, code, name, vType, orgId=None, link=None, description=None):
        """Create Method table for the database

        :param code:
            :type String(50):
        :param name:
            :type String(255):
        :param vType:
            :type String(255):
        :param orgId:
            :type Integer:
        :param link:
            :type String(255):
        :param description:
            :type String(500):
        :return:
        """

        meth = Methods()
        meth.MethodCode = code
        meth.MethodName = name
        meth.MethodDescription = description
        meth.MethodTypeCV = vType
        meth.MethodLink = link
        meth.OrganizationID = orgId

        self._session.add(meth)
        self._session.commit()

        return meth

    def createProcessingLevel(self, code, definition=None, explanation=None):
        """Create Processinglevel table for database

        :param code:
            :type String(50):
        :param definition:
            :type String(500):
        :param explanation:
            :type String(500):
        :return:
        """
        pl = ProcessingLevels()
        pl.ProcessingLevelCode = str(code)
        pl.Definition = definition
        pl.Explanation = explanation

        self._session.add(pl)
        self._session.commit()

        return pl

    def createSamplingFeature(self, code, vType, name=None, description=None, geoType=None, elevation=None,
                              elevationDatum=None, featureGeo=None):
        """Create SamplingFeature table

        :param code:
            :type String(50):
        :param vType:
            :type String(255):
        :param name:
            :type String(255):
        :param description:
            :type String(500):
        :param geoType:
            :type String(255):
        :param evelation:
            :type Float(53):
        :param evelationDatum:
            :type String(255):
        :param featureGeo:
            :type NullType:
        :return:
        """
        sf = SamplingFeatures()
        sf.SamplingFeatureTypeCV = vType
        sf.SamplingFeatureCode = code
        sf.SamplingFeatureName = name
        sf.SamplingFeatureDescription = description
        sf.SamplingFeatureGeoTypeCV = geoType
        sf.Elevation_m = elevation
        sf.ElevationDatumCV = elevationDatum
        sf.FeatureGeometry = featureGeo

        self._session.add(sf)
        self._session.commit()

        return sf


    def createUnit(self, type, abbrev, name):
        """Create Unit table

        :param code:
            :type String(255):
        :param abbrev:
            :type String(50):
        :param name:
            :type String(255):
        :return:
        """
        unit = Units()
        unit.UnitsTypeCV = type
        unit.UnitsAbbreviation = abbrev
        unit.UnitsName = name

        self._session.add(unit)
        self._session.commit()

        return unit

    def createOrganization(self, cvType, code, name, desc, link, parentOrgId):
        """Create Organization table

        :param cvType:
            :type String(255):
        :param code:
            :type String(50):
        :param name:
            :type String(255):
        :param desc:
            :type String(500):
        :param link:
            :type String(255):
        :param parentOrgId:
            :type Integer:
        :return:
        """

        org = Organizations()
        org.OrganizationTypeCV = cvType
        org.OrganizationCode = code
        org.OrganizationName = name
        org.OrganizationDescription = desc
        org.OrganizationLink = link
        org.ParentOrganizationID = parentOrgId

        self._session.add(org)
        self._session.commit()

        return org

    def createPerson(self, firstName, lastName, middleName=""):
        """Create Person Table

        :param firstName:
            :type String(255):
        :param lastName:
            :type String(255):
        :param middleName:
            :type String(255):
        :return:
        """

        p = People()
        p.PersonFirstName = firstName
        p.PersonMiddleName = middleName
        p.PersonLastName = lastName

        self._session.add(p)
        self._session.commit()

        return p

        # def createResult(self, uuid, featureActionId, vType, ):

    def createAffiliation(self, personid, organizationid, email, phone=None, address=None, link=None,
                          iscontact=False, affiliation_start=dt.datetime.today(), affiliation_end=None):
        """

        :param personid: id of the person record
        :param organizationid: id of the organization record
        :param email: primary email address
        :param phone: primary phone number
        :param address: primary mailing address
        :param link: url pointing the web resource such as researchGate profile
        :param iscontact: indicate if this person is the primary contact for the organization
        :param affiliation_start: begin date of affiliation with organization
        :param affiliation_end: end date of affiliation with organization
        :return: ODM2.Affiliation
        """

        # create affiliation object
        a = Affiliations()
        a.PersonID = personid
        a.OrganizationID = organizationid
        a.PrimaryEmail = email
        a.PrimaryPhone = phone
        a.PrimaryAddress = address
        a.PersonLink = link
        a.IsPrimaryOrganizationContact = iscontact
        a.AffiliationStartDate = affiliation_start
        a.AffiliationEndDate = affiliation_end

        self._session.add(a)
        self._session.flush()
        # self._session.refresh(a)

        print a.OrganizationID

        return a

    def createDataSet(self, dstype, dscode, dstitle, dsabstract):
        ds = DataSets()

        # create the dataset
        ds.DataSetTypeCV = dstype
        ds.DataSetCode = dscode
        ds.DataSetTitle = dstitle
        ds.DataSetAbstract = dsabstract
        ds.DataSetUUID = uuid.uuid4().hex

        self._session.add(ds)
        self._session.commit()

        return ds

    def createDataSetResults(self, dsid, resultid):
        dsr = DataSetsResults()

        # link dataset to results
        dsr.DataSetID = dsid
        dsr.ResultID = resultid

        self._session.add(dsr)
        self._session.commit()

        return dsr

    def createAction(self, type, methodid, begindatetime, begindatetimeoffset, enddatetime=None, enddatetimeoffset=None,
                     description=None, filelink=None):
        action = Actions()
        action.ActionTypeCV = type
        action.MethodID = methodid
        action.BeginDateTime = begindatetime
        action.BeginDateTimeUTCOffset = begindatetimeoffset
        action.EndDateTime = enddatetime
        action.EndDateTimeUTCOffset = enddatetimeoffset
        action.ActionDescription = description
        action.ActionFileLink = filelink

        self._session.add(action)
        self._session.commit()

        return action

    def createActionBy(self, actionid, affiliationid, isactionlead=True, roledescription=None):
        actionby = ActionBy()
        actionby.ActionID = actionid
        actionby.AffiliationID = affiliationid
        actionby.IsActionLead = isactionlead
        actionby.RoleDescription = roledescription

        self._session.add(actionby)
        self._session.commit()

        return actionby

    def createFeatureAction(self, samplingfeatureid, actionid):
        featureaction = FeatureActions()
        featureaction.SamplingFeatureID = samplingfeatureid
        featureaction.ActionID = actionid

        self._session.add(featureaction)
        self._session.commit()

        return featureaction


    def createResult(self, featureactionid, variableid, unitid, processinglevelid, valuecount, sampledmedium,
                     resulttypecv,
                     taxonomicclass=None, resultdatetime=None, resultdatetimeutcoffset=None,
                     validdatetime=None, validdatetimeutcoffset=None, statuscv=None):
        result = Results()
        result.ResultUUID = uuid.uuid4().hex
        result.FeatureActionID = featureactionid
        result.ResultTypeCV = resulttypecv
        result.VariableID = variableid
        result.UnitsID = unitid
        result.ProcessingLevelID = processinglevelid
        result.ValueCount = valuecount
        result.SampledMediumCV = sampledmedium
        result.TaxonomicClassifierID = taxonomicclass
        result.ResultDateTime = resultdatetime
        result.ResultDateTimeUTCOffset = resultdatetimeutcoffset
        result.ValidDateTime = validdatetime
        result.ValidDateTimeUTCOffset = validdatetimeutcoffset
        result.StatusCV = statuscv

        self._session.add(result)
        self._session.commit()

        return result


# ################################################################################
# Data Quality
# ################################################################################

class createDataQuality(serviceBase):
    def test(self):
        return None


# ################################################################################
# Equipment
# ################################################################################

class createEquipment(serviceBase):
    def test(self):
        return None


# ################################################################################
# ExtensionProperties
# ################################################################################


class createExtensionProperties(serviceBase):
    def test(self):
        return None


# ################################################################################
# External Identifiers
# ################################################################################

class createExternalIdentifiers(serviceBase):
    def test(self):
        return None


# ################################################################################
# Lab Analyses
# ################################################################################

class createLabAnalyses(serviceBase):
    def test(self):
        return None


# ################################################################################
# Provenance
# ################################################################################

class createProvenance(serviceBase):
    def test(self):
        return None


# ################################################################################
# Results
# ################################################################################


class createResults(serviceBase):
    def test(self):
        return None

    def createTimeSeriesResult(self, result, aggregationstatistic, xloc=None, xloc_unitid=None, yloc=None,
                               yloc_unitid=None, zloc=None, zloc_unitid=None,
                               srsID=None, timespacing=None, timespacing_unitid=None):

        tsr = TimeSeriesResults()

        # tsr.ResultID = result.ResultID
        #tsr.ResultUUID = result.ResultUUID


        tsr.XLocation = xloc
        tsr.XLocationUnitsID = xloc_unitid
        tsr.YLocation = yloc
        tsr.YLocationUnitsID = yloc_unitid
        tsr.ZLocation = zloc
        tsr.ZLocationUnitsID = zloc_unitid
        tsr.SpatialReferenceID = srsID
        tsr.IntendedTimeSpacing = timespacing
        tsr.IntendedTimeSpacingUnitsID = timespacing_unitid
        tsr.AggregationStatisticCV = aggregationstatistic


        #tsr.ResultID = result.ResultID
        tsr.ResultUUID = result.ResultUUID
        tsr.FeatureActionID = result.FeatureActionID
        tsr.VariableID = result.VariableID
        tsr.UnitsID = result.UnitsID
        tsr.ProcessingLevelID = result.ProcessingLevelID
        tsr.ValueCount = result.ValueCount
        tsr.SampledMediumCV = result.SampledMediumCV
        tsr.ResultTypeCV = result.ResultTypeCV

        self._session.add(tsr)
        self._session.commit()

        return tsr


    def createTimeSeriesResultValues(self, resultid, datavalues, datetimes, datetimeoffsets, censorcodecv,
                                     qualitycodecv,
                                     timeaggregationinterval, timeaggregationunit):


        try:
            values = TimeSeriesResultValues()
            for i in range(len(datavalues)):
                values.ResultID = resultid
                values.CensorCodeCV = censorcodecv
                values.QualityCodeCV = qualitycodecv
                values.TimeAggregationInterval = timeaggregationinterval
                values.TimeAggregationIntervalUnitsID = timeaggregationunit
                values.DataValue = datavalues[i]
                values.ValueDateTime = datetimes[i]
                values.ValueDateTimeUTCOffset = datetimeoffsets[i]
                self._session.add(values)
            self._session.commit()
            return values
        except Exception, e:
            print e
            return None


# ################################################################################
# Sampling Features
# ################################################################################

class createSamplingFeatures(serviceBase):
    def createSite(self, vType, latitude, longitude):
        """Create Site table

        :param vType:
            :type String(255):
        :param latitude:
            :type Float(53):
        :param longitude:
            :type Float(53):
        :return:
        """

        s = Site()
        s.SiteTypeCV = vType
        s.Latitude = latitude
        s.Longitude = longitude

        self._session.add(s)
        self._session.commit()

        return s


    def createSpatialReference(self, srsCode, srsName, srsDescription=None):
        spatialreference = SpatialReferences()
        spatialreference.SRSCode = srsCode
        spatialreference.SRSName = srsName
        spatialreference.SRSDescription = srsDescription

        self._session.add(spatialreference)
        self._session.commit()

        return spatialreference


# ################################################################################
# Sensors
# ################################################################################
class createSensors(serviceBase):
    def createDeploymentAction(self, actionId, cvType, desc, configActionId, calibActionId, spatialOffSet,
                               deploymentSchematicLink, **kwargs):
        """Create DeploymentAction Object

        :param **kwargs:
            :param actionId:
                :type Integer:
            :param cvType:
                :type String(255):
            :param desc:
                :type String(500):
            :param configActionId:
                :type Integer:
            :param calibActionId:
                :type Integer:
            :param spatialOffSet:
                :type Integer:
            :param deploymentSchematicLink:
                :type String(255):
            :return:
        """

        da = DeploymentActions()
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)
        da.ActionID = (kwargs['actionId'] if kwargs['actionId'] else None)


# ################################################################################
# Simulation
# ################################################################################

class createSimulation(serviceBase):
    def createModel(self, code, name, description=None):
        model = Models()
        model.ModelCode = code
        model.ModelName = name
        model.ModelDescription = description

        self._session.add(model)
        self._session.commit()

        return model


    def createRelatedModel(self, modelid, relatedModelID, relationshipType):
        related = RelatedModels()
        related.ModelID = modelid
        related.RelationshipTypeCV = relationshipType
        related.RelatedModelID = relatedModelID

        self._session.add(related)
        self._session.commit()

        return related


    def createSimulation(self, actionid, modelID, simulationName, simulationDescription, simulationStartDateTime,
                         simulationStartOffset,
                         simulationEndDateTime, simulationEndOffset, timeStepValue, timeStepUnitID,
                         inputDatasetID=None):
        sim = Simulations()
        sim.ActionID = actionid
        sim.ModelID = modelID
        sim.SimulationName = simulationName
        sim.SimulationDescription = simulationDescription
        sim.SimulationStartDateTime = simulationStartDateTime
        sim.SimulationStartDateTimeUTCOffset = simulationStartOffset
        sim.SimulationEndDateTime = simulationEndDateTime
        sim.SimulationEndDateTimeUTCOffset = simulationEndOffset
        sim.TimeStepValue = timeStepValue
        sim.TimeStepUnitsID = timeStepUnitID
        sim.InputDataSetID = inputDatasetID

        self._session.add(sim)
        self._session.commit()

        return sim

# ################################################################################
# ODM2
# ################################################################################

class createODM2(serviceBase):
   def test(self):
        return None