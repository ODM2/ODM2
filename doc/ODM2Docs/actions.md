Actions
=======

In ODM2, the "Actions" entity is used to encode information about activities or actions that are performed in the process of making observations.  The fundamental Action type associated with an observation is an "Observation act."  Observation "Results" can only be created by an Action of type "Observation act," and every Result must be associated with a single Action of type "Observation act."  However, Actions can be of many different types. The following is a list of some other types of Actions that can be encoded using ODM2.  The full list of Action types is a controlled vocabulary:

* Sample collection
* Sample preparation
* Sample analysis
* Site visit
* Instrument deployment
* Etc.

In ODM2, Actions are modeled generically so that many different types of actions can be recorded and associated with an observation.  Each observation "Result" must have only one Action direclty associagted with it (i.e., the "Observation act"), but "Observation acts" may have many other Actions associated with them.  Relationships among Actions (e.g., in the case of a workflow of many Actions that culminates in an "Observation act") can be encoded using parent/child relationships among Actions.  The following are two examples of how Actions can be used to describe the workflow of generating ex situ versus in situ observations.

### Ex Situ Observation Example ###


###  In Situ Observation Example ###
