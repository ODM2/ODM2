__author__ = 'Stephanie'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

import datetime as dt
from ...base import serviceBase
from ..model import *


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
        var = Variable()
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

        meth = Method()
        meth.MethodCode = code
        meth.MethodNameCV = name
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
        pl = Processinglevel()
        pl.ProcessingLevelCode = code
        pl.Definition = definition
        pl.Explanation = explanation

        self._session.add(pl)
        self._session.commit()

        return pl

    def createSamplingFeature(self, code, vType, name=None, description=None, geoType=None, evelation=None,
                              evelationDatum=None, featureGeo=None):
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
        sf = Samplingfeature()
        sf.SamplingFeatureTypeCV = vType
        sf.SamplingFeatureCode = code
        sf.SamplingFeatureName = name
        sf.SamplingFeatureDescription = description
        sf.SamplingFeatureGeoTypeCV = geoType
        sf.Elevation_m = evelation
        sf.ElevationDatumCV = evelationDatum
        sf.FeatureGeometry = featureGeo

        self._session.add(sf)
        self._session.commit()

        return sf


    def createUnit(self, code, abbrev, name):
        """Create Unit table

        :param code:
            :type String(255):
        :param abbrev:
            :type String(50):
        :param name:
            :type String(255):
        :return:
        """
        unit = Unit()
        unit.UnitsTypeCV = code
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

        org = Organization()
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

        p = Person()
        p.PersonFirstName = firstName
        p.PersonMiddleName = middleName
        p.PersonLastName = lastName

        self._session.add(p)
        self._session.commit()

        return p

        # def createResult(self, uuid, featureActionId, vType, ):

    def createAffiliation(self,personid,organizationid,email,phone=None,address=None, link=None,
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
        :return: ODM2Core.Affiliation
        """

        # create affiliation object
        a = Affiliation()
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
        self._session.commit()

        return a