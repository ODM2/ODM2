__author__ = 'Stephanie'

import sys
import os

this_file = os.path.realpath(__file__)
directory = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(this_file))))
sys.path.insert(0, directory)

from ODM2 import serviceBase
import ODM2.Core.model as m


class create(serviceBase):
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
        var = m.Variable()
        var.VariableCode = code
        var.VariableNameCV = name
        var.VariableDefinition = definition
        var.VariableTypeCV = vType
        var.NoDataValue = nodv
        var.SpeciationCV = speciation

        self._session.add(var)
        self._session.commit()

    def createMethod(self, code, name, vType, link=None, description=None):
        """Create Method table for the database

        :param code:
            :type String(50):
        :param name:
            :type String(255):
        :param vType:
            :type String(255):
        :param link:
            :type String(255):
        :param description:
            :type String(500):
        :return:
        """

        meth = m.Method()
        meth.MethodCode = code
        meth.MethodNameCV = name
        meth.MethodDescription = description
        meth.MethodTypeCV = vType
        meth.MethodLink = link
        # # TODO what do I do for foreign keys?

        self._session.add(meth)
        self._session.commit()

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
        pl = m.Processinglevel()
        pl.ProcessingLevelCode = code
        pl.Definition = definition
        pl.Explanation = explanation

        self._session.add(pl)
        self._session.commit()

    def createSamplingFeature(self, code, vType, name=None, description=None, geoType=None,
                              evelation=None, evelationDatum=None, featureGeo=None):
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
        sf = m.Samplingfeature()
        sf.SamplingFeatureTypeCV = vType
        sf.SamplingFeatureCode = code
        sf.SamplingFeatureName = name
        sf.SamplingFeatureDescription = description
        sf.SamplingFeatureGeotTypeCV=geoType
        sf.Elevation_m=evelation
        sf.ElevationDatumCV=evelationDatum
        sf.FeatureGeometry = featureGeo

        self._session.add(sf)
        self._session.commit()

    #def createResult(self, uuid, featureActionId, vType, ):