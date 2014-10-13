# coding: utf-8
from sqlalchemy import Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
#from ODM2  import modelBase as Base
from ODM2.Core.model import Action, Base




class Directive(Base):
    __tablename__ = u'Directives'
    __table_args__ = {u'schema': u'ODM2'}

    DirectiveID = Column(Integer, primary_key=True)
    DirectiveTypeCV = Column(String(255), nullable=False)
    DirectiveDescription = Column(String(500), nullable=False)


class Actiondirective(Base):
    __tablename__ = u'ActionDirectives'
    __table_args__ = {u'schema': 'ODM2'}

    BridgeID = Column(Integer, primary_key=True)
    ActionID = Column(ForeignKey('ODM2.Actions.ActionID'), nullable=False)
    DirectiveID = Column(ForeignKey('ODM2.Directives.DirectiveID'), nullable=False)

    ActionObj = relationship(Action)
    DirectiveObj = relationship(Directive)



