
from ODM1_1_1.services.series_service import SeriesService as ODM1SeriesService
from sqlalchemy import distinct
import sqlalchemy.exc

from ODM2.LikeODM1 import *
import logging

from ODMconnection import SessionFactory

from common.logger import LoggerTool

tool = LoggerTool()
logger = tool.setupLogger(__name__, __name__ + '.log', 'w', logging.DEBUG)


class SeriesService(ODM1SeriesService):
    # Accepts a string for creating a SessionFactory, default uses odmdata/connection.cfg
    def __init__(self, connection_string="", debug=False):
        self._session_factory = SessionFactory(connection_string, debug)
        self._edit_session = self._session_factory.get_session()
        self._debug = debug

    def get_db_version(self):
        return self._edit_session.query(ODMVersion).first().version_number

    def get_all_sites(self):
        return self._edit_session.query(Site).order_by(Site.code).all()

