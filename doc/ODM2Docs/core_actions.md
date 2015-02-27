ODM2 Core: Actions
==================

In ODM2, the **Actions** entity is used to encode information about activities or actions that are performed in the process of making observations.  The fundamental **Action** type associated with an observation is an "Observation act," but there are other **Action** types that may generate **Results**. However, observation **Results** can only be created by an **Action** having a type appropriate for generating a **Result** (e.g., a "Sample analysis" action or an "Instrument deployment" action). Every **Result** must be associated with a single **Action** that generates the **Result**.  However, **Actions** can be of many different types, and not every **Action** produces a **Result**. The full list of ActionTypes is a controlled vocabulary in which there is an indication of whether the ActionType can produce a **Result**. The following is a list of some of the ActionTypes that can be encoded using ODM2.  

* Observation act (produces a Result)
* Sample collection
* Sample preparation
* Sample analysis (produces a Result)
* Site visit
* Instrument deployment (Produces a Result)
* Instrument maintenance
* Instrument calibration
* Etc.

Each **Action** that produces a **Result** is associated with a **Sampling Feature** at which or on which it is performed. **Actions** have beginning and ending dates and are performed using a **Method**. An **Action** represents a specific instance of the execution of a **Method**. **Actions** are performed by one or more **People**, each of which may be affiliated with an **Organization**. Each of the **People** who participate in an **Action** may have a **Role**. For example, an "Observation act" is performed by a **Person** whose **Role** is "Observer."

**Actions** are modeled generically so that many different types of **Actions** can be recorded and associated indirectly with an observation.  Each observation **Result** must have only one **Action** directly associated with it (i.e., the "Observation act"), but a single **Action** may have multiple **Results**. Relationships among an **Action**, the **SamplingFeature(s)** on which or at which it was performed, and its observation **Results** (if any exist) are encoded in the  **Actions**, **FeatureActions** and **Results** entities.  Refer to the documentation for [FeatureActions](core_featureactions.md) for more information. In ODM2, Actions are specifically separated from Results for two reasons:

1. This allows for multiple Results to be created from a single Action (e.g., a single "Sample analysis" Action may produce many Measurement Results)
2. This allows for many other Action types that do not produce Results, but that may be related to Actions that do produce Results (e.g., a "Specimen preparation" Action that is related to a "Specimen analysis" Action that produces a Result)

### Related Actions ###
**Actions** that have observation **Results** may have many other **Actions** associated with them. For example, a "Sample analysis" **Action** that generates a **Result** may have a related "Sample collection" **Action** and a related "Sample preparation" **Action**. Relationships among **Actions** (e.g., in the case of a workflow of many **Actions** that culminates in an "Observation act") can be encoded using parent/child relationships among **Actions** in the **RelatedActions** entity (see the [RelatedActions](core_relatedactions.md) article for more details).

### Examples ###
The following are two examples of how **Actions** can be used to describe the workflow of generating *ex situ* versus *in situ* observations.

#### *Ex Situ* Observation Example ####

The following is an example workflow for collection and *ex situ* analysis of a field sample.  Actions can be created for any of these steps, but, at a minimum, the "Sample analysis" Action must be created if a Result is to be created.

1. A field technician visits a monitoring site. 
2. The technician collects a sample.  
3. The sample is filtered and/or preserved in the field. 
4. The sample is analyzed in the laboratory producing a Result that is the value of concentration of a constituent (this is the "Observation act" that is required).  

####  *In Situ* Observation Example ####

The following is an example workflow for collection of *in situ* water quality observations using a sensor.  Actions can be created for any of these steps, but, at a minimum, the "InstrumentDeployment action" must be created if a Result is to be created. See the documentation for [RelatedActions](core_relatedactions.md) for more invovled examples of Actions with *in situ* measurements.

1. A field technician visits a monitoring site.
2. A field technician deploys a sensor at the site that produces one or more values of the concentration of a water quality variable (this is the "Observation act" that is required).
