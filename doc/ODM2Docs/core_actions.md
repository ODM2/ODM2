ODM2 Core: Actions
==================

In ODM2, the "Actions" entity is used to encode information about activities or actions that are performed in the process of making observations.  The fundamental Action type associated with an observation is an "Observation act."  Observation "Results" can only be created by an Action of type "Observation act." Every Result must be associated with a single Action of type "Observation act."  However, Actions can be of many different types. The full list of Action types is a controlled vocabulary. The following is a list of some other types of Actions that can be encoded using ODM2.  

* Sample collection
* Sample preparation
* Sample analysis
* Site visit
* Instrument deployment
* Etc.

Each Action is associated with a "Sampling Feature" at which or on which it is performed.  Actions have beginning and ending dates and are perfomed using a Method.  Actions may be performed under a Directive, which specifies the reason that the Action was performed.

Actions are performed by one or more People, each of which may be affiliated with an Organization. Each of the People who participate in an Action may have a Role. For example, the "Observation act" is performed by a Person whose role is "Observer."

Actions are modeled generically so that many different types of actions can be recorded and associated indirectly with an observation.  Each observation "Result" must have only one Action direclty associated with it (i.e., the "Observation act"), but an Action may result in multiple Results.  "Observation acts" may have many other Actions associated with them.  Relationships among Actions (e.g., in the case of a workflow of many Actions that culminates in an "Observation act") can be encoded using parent/child relationships among Actions.

The following are two examples of how Actions can be used to describe the workflow of generating ex situ versus in situ observations.

### Ex Situ Observation Example ###

The following is an example workflow for collection and ex situ analysis of a field sample.  Actions can be created for any of these steps, but at a minimum the Observation act must be created if a Result is to be created.

1. A field technician visits a monitoring site. 
2. The technician collects a sample.  
3. The sample is filtered and/or preserved in the field. 
4. The sample is analyzed in the laboratory.  
5. The value of concentration of a constituent is observed (this is the "Observation act" that is required)

###  In Situ Observation Example ###

The following is an example workflow for collection of in situ water quality observations using a sensor.  Actions can be created for any of these steps, but at a minimum the Observation act must be created if a Result is to be created.

1. A field technician visits a monitoring site.
2. A field technician deploys a sensor at the site.
3. The value of a water quality variable is observed (this is the "Observation act" that is required)