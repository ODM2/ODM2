from sqlalchemy import func
from src.api.ODM2.models import Variables, People, Method, Processinglevel, SamplingFeatures, Unit, Organization, Result, \
    Datasets, Affiliation, Featureaction, Action, Dataquality, Equipment, Timeseriesresult, Timeseriesresultvalue, Sites, \
    Deploymentaction, SpatialReferences, Model, Simulation, Relatedmodel

import pandas as pd

__author__ = 'jmeline'
# ################################################################################
# Annotations
# ################################################################################

class readAnnotations(object):
    def test(self):
        return None


# ################################################################################
# CV
# ################################################################################


class readCV(object):
    def test(self):
        return None


# ################################################################################
# Core
# ################################################################################


class readCore(object):
    """queries to tables contained in the core schema"""

    def __init__(self, session):
        self._session = session

    """
    Variable
    """

    def getVariables(self):
        """Select all on Variables

        :return Variable Objects:
            :type list:
        """
        return self._session.query(Variables).all()

    def getVariableById(self, variableId):
        """Select by variableId

        :param variableId:
            :type Integer:
        :return Return matching Variable object filtered by variableId:
            :type Variable:
        """
        try:
            return self._session.query(Variables).filter_by(VariableID=variableId).first()
        except:
            return None

    def getVariableByCode(self, variableCode):
        """Select by variableCode

        :param variableCode:
            :type String:
        :return Return matching Variable Object filtered by variableCode:
            :type Variable:
        """
        try:
            return self._session.query(Variables).filter_by(VariableCode=variableCode).first()
        except:
            return None

    """
    Method
    """

    def getMethods(self):
        """Select all on Methods

        :return Method Objects:
            :type list:
        """
        return self._session.query(Method).all()

    def getMethodById(self, methodId):
        """Select by methodId

        :param methodId:
            :type Integer
        :return Return matching Method Object filtered by methodId:
            :type Method:
        """
        try:
            return self._session.query(Method).filter_by(MethodID=methodId).first()
        except:
            return None

    def getMethodByCode(self, methodCode):
        """Select by methodCode

        :param methodCode:
            :type String:
        :return Return matching Method Object filtered by method Code:
            :type Method:
        """
        try:
            return self._session.query(Method).filter_by(MethodCode=methodCode).first()
        except:
            return None

    """
    ProcessingLevel
    """

    def getProcessingLevels(self):
        """Select all on Processing Level

        :return ProcessingLevel Objects:
            :type list:
        """
        return self._session.query(Processinglevel).all()

    def getProcessingLevelById(self, processingId):
        """Select by processingId

        :param processingId:
            :type Integer:
        :return Return matching ProcessingLevel Object filtered by processingId:
            :type Processinglevel:
        """
        try:
            return self._session.query(Processinglevel).filter_by(ProcessingLevelID=processingId).first()
        except:
            return None

    def getProcessingLevelByCode(self, processingCode):
        """Select by processingCode

        :param processingCode:
            :type String(50):
        :return Return matching Processinglevel Object filtered by processingCode:
            :type Processinglevel:
        """
        try:
            return self._session.query(Processinglevel).filter_by(ProcessingLevelCode=str(processingCode)).first()
        except Exception, e:
            print e
            return None

    """
    Sampling Feature
    """

    def getSamplingFeatures(self):
        """Select all on SamplingFeatures

        :return SamplingFeature Objects:
            :type list:
        """

        return self._session.query(SamplingFeatures).all()

    def getSamplingFeatureById(self, samplingId):
        """Select by samplingId

        :param samplingId:
            :type Integer:
        :return Return matching SamplingFeature Object filtered by samplingId:
            :type SamplingFeature:
        """
        try:
            return self._session.query(SamplingFeatures).filter_by(SamplingFeatureID=samplingId).first()
        except:
            return None

    def getSamplingFeatureByCode(self, samplingFeatureCode):
        """Select by samplingFeatureCode

        :param samplingFeatureCode:
            :type String:
        :return Return matching SamplingFeature Object filtered by samplingId
            :type list:
        """

        try:
            return self._session.query(SamplingFeatures).filter_by(SamplingFeatureCode=samplingFeatureCode).first()
        except Exception as e:
            return None

    def getSamplingFeaturesByType(self, samplingFeatureTypeCV):
        """Select by samplingFeatureTypeCV

        :param samplingFeatureTypeCV:
            :type String:
        :return Return matching SamplingFeature Objects filtered by samplingFeatureTypeCV:
            :type list:
        """

        try:
            return self._session.query(SamplingFeatures).filter_by(SamplingFeatureTypeCV=samplingFeatureTypeCV).all()
        except Exception as e:
            print e
            return None

    def getSamplingFeatureByGeometry(self, wkt_geometry):

        try:
            # ST_Equals(geometry, geometry)
            return self._session.query(SamplingFeatures).filter(
                func.ST_AsText(SamplingFeatures.FeatureGeometry) == func.ST_AsText(wkt_geometry)).first()
        except Exception, e:
            print e
            return None

    def getGeometryTest(self, TestGeom):
        Geom = self._session.query(SamplingFeatures).first()
        print "Queried Geometry: ", self._session.query(Geom.FeatureGeometry.ST_AsText()).first()
        GeomText = self._session.query(
            func.ST_Union(Geom.FeatureGeometry, func.ST_GeomFromText(TestGeom)).ST_AsText()).first()

        print GeomText

    """
    Unit
    """

    def getUnits(self):
        """Select all on Unit

        :return Unit Objects:
            :type list:
        """
        return self._session.query(Unit).all()

    def getUnitById(self, unitId):
        """Select by samplingId

        :param unitId:
            :type Integer:
        :return Return matching Unit Object filtered by UnitId:
            :type Unit:
        """
        try:
            return self._session.query(Unit).filter_by(UnitsID=unitId).first()
        except:
            return None

    def getUnitByName(self, unitName):


        try:
            return self._session.query(Unit).filter(Unit.UnitsName.ilike(unitName)).first()
        except:
            return None

    """
    Organization
    """

    def getOrganizations(self):
        """Select all on Organization

        :return Organization Objects:
            :type list:
        """
        return self._session.query(Organization).all()

    def getOrganizationById(self, orgId):
        """Select by orgId

        :param orgId:
            :type Integer:
        :return Return matching Unit Object filtered by orgId:
            :type Organization:
        """
        try:
            return self._session.query(Organization).filter_by(OrganizationID=orgId).first()
        except:
            return None

    def getOrganizationByCode(self, orgCode):
        """Select by orgCode

        :param orgCode:
            :type String:
        :return Return matching Organization Object filtered by orgCode
            :type Organization:
        """
        try:
            return self._session.query(Organization).filter_by(OrganizationCode=orgCode).first()

        except:
            return None

    """
    Person
    """

    def getPeople(self):
        """Select all on Person

        :return Person Objects:
            :type list:
        """
        return self._session.query(People).all()

    def getPersonById(self, personId):
        """Select by personId

        :param personId:
            :type Integer:
        :return Return matching Person Object filtered by personId:
            :type Person:
        """
        try:
            return self._session.query(People).filter_by(PersonID=personId).first()

        except:
            return None

    def getPersonByName(self, personfirst, personlast):
        """Select by person name, last name combination

        :param personfirst: first name of person
        :param personlast: last name of person
        :return Return matching Person Object:
            :type Person:
        """
        try:
            return self._session.query(People).filter(People.PersonFirstName.ilike(personfirst)). \
                filter(People.PersonLastName.ilike(personlast)).first()
        except:
            return None

    def getAffiliationByPersonAndOrg(self, personfirst, personlast, orgcode):
        """
        Select all affiliation of person
        :param personfirst: first name of person
        :param personlast: last name of person
        :param orgcode: organization code (e.g. uwrl)
        :return: ODM2.Affiliation
        """

        try:
            return self._session.query(Affiliation).filter(Organization.OrganizationCode.ilike(orgcode)) \
                .filter(People.PersonFirstName.ilike(personfirst)) \
                .filter(People.PersonLastName.ilike(personlast)).first()
        except:
            return None

    def getAffiliationsByPerson(self, personfirst, personlast):
        """
        Select all affiliation of person
        :param personfirst: first name of person
        :param personlast: last name of person
        :return: [ODM2.Affiliation]
        """

        try:
            return self._session.query(Affiliation).filter(People.PersonFirstName.ilike(personfirst)) \
                .filter(People.PersonLastName.ilike(personlast)).all()
        except:
            return None

    """
    Results
    """

    def getResults(self):

        try:
            return self._session.query(Result).all()
        except:
            return None

    def getResultByActionID(self, actionID):

        try:
            return self._session.query(Result).join(Featureaction).join(Action).filter_by(ActionID=actionID).all()
        except:
            return None

    def getResultByID(self, resultID):
        try:
            return self._session.query(Result).filter_by(ResultID=resultID).one()
        except:
            return None

    def getResultAndGeomByID(self, resultID):
        try:
            return self._session.query(Result, SamplingFeatures.FeatureGeometry.ST_AsText()). \
                join(Featureaction). \
                join(SamplingFeatures). \
                join(Result). \
                filter_by(ResultID=resultID).one()
        except:
            return None

    def getResultAndGeomByActionID(self, actionID):

        try:
            return self._session.query(Result, SamplingFeatures.FeatureGeometry.ST_AsText()). \
                join(Featureaction). \
                join(SamplingFeatures). \
                join(Action). \
                filter_by(ActionID=actionID).all()
        except:
            return None

    """
    Datasets
    """

    def getDataSets(self):
        try:
            return self._session.query(Datasets).all()
        except:
            return None

    def getDataSetByCode(self, dscode):

        try:
            return self._session.query(Datasets).filer(Datasets.DataSetCode.ilike(dscode)).first()
        except:
            return None


# ################################################################################
# Data Quality
# ################################################################################

class readDataQuality(object):
    def getAllDataQuality(self):
        """Select all on Data Quality

        :return Dataquality Objects:
            :type list:
        """
        return self._session.query(Dataquality).all()


# ################################################################################
# Equipment
# ################################################################################

class readEquipment(object):
    def getAllEquipment(self):
        return self._session.query(Equipment).all()


# ################################################################################
# Extension Properties
# ################################################################################

class readExtensionProperties(object):
    def test(self):
        return None


# ################################################################################
# External Identifiers
# ################################################################################

class readExternalIdentifiers(object):
    def test(self):
        return None


# ################################################################################
# Lab Analyses
# ################################################################################

class readLabAnalyses(object):
    def test(self):
        return None


# ################################################################################
# Provenance
# ################################################################################

class readProvenance(object):

    """
    Citation
    """

    # def getCitations(self):
    #     self._session.query(Provenance)
    #

    def test(self):
        return None


# ################################################################################
# Results
# ################################################################################

class readResults(object):
    """queries to tables contained in Results schema"""

    def __init__(self, session):
        self._session = session
    """
    TimeSeriesResults
    """

    def getTimeSeriesResults(self):
        """Select all on TimeSeriesResults

        :return TimeSeriesResults Objects:
            :type list:
        """
        return self._session.query(Timeseriesresult).all()

    def getTimeSeriesResultByResultId(self, resultId):
        """Select by resultID on ResultID

        :param resultId:
            :type Integer:
        :return return matching Timeseriesresult Object filtered by resultId
        """

        try:
            return self._session.query(Timeseriesresult).filter_by(ResultID=resultId).one()
        except:
            return None

    def getTimeSeriesResultbyCode(self, timeSeriesCode):
        """Select by time
        """
        pass

    """
    TimeSeriesResultValues
    """

    def getTimeSeriesResultValues(self):
        """Select all on TimeSeriesResults

        :return TimeSeriesResultsValue Objects:
            :type list:
        """

        q = self._session.query(Timeseriesresultvalue).all()
        df = pd.DataFrame([dv.list_repr() for dv in q])
        df.columns = q[0].get_columns()
        return df
        # return self._session.query(Timeseriesresultvalue).all()

    def getTimeSeriesResultValuesByResultId(self, resultId):
        """Select by resultId

        :param timeSeriesId:
            :type Integer:
        :return return matching Timeseriesresultvalue Object filtered by resultId:
            :type Timeseriesresultvalue:
        """
        try:
            q = self._session.query(Timeseriesresultvalue).filter_by(ResultID=resultId).all()

            df = pd.DataFrame([dv.list_repr() for dv in q])
            df.columns = q[0].get_columns()
            return df
            # return self._session.query(Timeseriesresultvalue).filter_by(ResultID=resultId).all()
        except Exception as e:
            return None

    def getTimeSeriesResultValuesByCode(self, timeSeriesCode):
        """

        :param timeSeriesCode:
        :return:
        """
        pass

    def getTimeSeriesResultValuesByTime(self, resultid, starttime, endtime=None):

        # set end = start if it is None
        endtime = starttime if not endtime else endtime

        try:
            return self._session.query(Timeseriesresultvalue).filter_by(ResultID=resultid) \
                .filter(Timeseriesresultvalue.ValueDateTime >= starttime) \
                .filter(Timeseriesresultvalue.ValueDateTime <= endtime) \
                .order_by(Timeseriesresultvalue.ValueDateTime).all()
        except:
            return None


# ################################################################################
# Annotations
# ################################################################################

class readSamplingFeatures(object):
    """Queries to tables contained in the SamplingFeature """
    def __init__(self, session):
        self._session = session
    """
    Site
    """

    def getAllSites(self):
        """Select all on Sites

        :return Site Objects:
            :type list:
        """
        return self._session.query(Sites).all()

    def getSiteBySFId(self, siteId):
        """Select by siteId

        :param siteId:
            :type Integer:
        :return Return matching Site Object filtered by siteId:
            :type Site:
        """
        try:
            return self._session.query(Sites).filter_by(SamplingFeatureID=siteId).one()
        except:
            return None


    def getSiteBySFCode(self, siteCode):
        """Select by siteCode

        :param siteCode:
            :type String:
        :return Return matching Samplingfeature Object filtered by siteCode:
            :type Samplingfeature:
        """

        sf = self._session.query(SamplingFeatures).filter_by(SamplingFeatureCode=siteCode).one()
        return self._session.query(Sites).filter_by(SamplingFeatureID=sf.SamplingFeatureID).one()

    def getSpatialReferenceByCode(self, srsCode):


        try:
            return self._session.query(SpatialReferences).filter(SpatialReferences.SRSCode.ilike(srsCode)).first()
        except:
            return None


# ################################################################################
# Sensors
# ################################################################################


class readSensors(object):
    """
    DeploymentAction
    """


    def getAllDeploymentAction(self):
        """Select all on DeploymentAction

        :return DeploymentAction Objects:
            :type list:
        """
        return self._session.query(Deploymentaction).all()

        # return self._session.query)

    def getDeploymentActionById(self, deploymentId):
        """Select by deploymentId

        :param deploymentId:
            :type Integer:
        :return Return Matching DeploymentAction Object filtered by deploymentId:
            :type DeploymentAction:
        """
        try:
            return self._session.query(Deploymentaction).filter_by(DeploymentActionID=deploymentId).one()
        except:
            return None

    def getDeploymentActionByCode(self, deploymentCode):
        """Select by deploymentCode

        :param deploymentCode:
            :type String:
        :return Return matching DeploymentAction Object filtered by deploymentCode:
            :type DeploymentAction:
        """
        try:
            return self._session.query(Deploymentaction).filter_by(DeploymentActionCode=deploymentCode).one()
        except:
            return None


# ################################################################################
# Simulation
# ################################################################################


class readSimulation(object):
    def getAllModels(self):

        try:
            return self._session.query(Model).all()
        except:
            return None

    def getModelByCode(self, modelcode):
        try:
            return self._session.query(Model).filter(Model.ModelCode.ilike(modelcode)).first()
        except:
            return None

    def getAllSimulations(self):

        try:
            return self._session.query(Simulation).all()
        except:
            return None

    def getSimulationByName(self, simulationName):
        try:
            return self._session.query(Simulation).filter(Simulation.SimulationName.ilike(simulationName)).first()
        except:
            return None

    def getSimulationByActionID(self, actionID):
        try:
            return self._session.query(Simulation).filter_by(ActionID=actionID).first()
        except:
            return None

    def getRelatedModelsByID(self, modelid):
        try:
            return self._session.query(Relatedmodel).filter_by(RelatedModelID=modelid).all()
        except:
            return None

    def getRelatedModelsByCode(self, modelcode):
        try:
            return self._session.query(Relatedmodel).join(Relatedmodel.ModelID == Model.ModelID) \
                .filter(Model.ModelCode == modelcode)
        except:
            return None

    def getResultsBySimulationID(self, simulationID):
        try:
            return self._session.query(Result).filter(Simulation.SimulationID == simulationID).all()
        except:
            return None

# ################################################################################
# ODM2
# ################################################################################

class readODM2(object):
   def test(self):
        return None