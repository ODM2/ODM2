ODM2 Core: Datasets
===================

The **Datasets** entity is used to encode information about groups of **Results** that are logically related. A **Dataset** has a type, title, an abstract, and is the entity in ODM2 that would receive a citation. A **Dataset** may consist of a single **Result** or could be a group of many **Results**. Any particular **Result** may participate in zero or more **Datasets**. The following are examples of **Datasets** that could be represented in ODM2:

* All of the time series **Results** from a single continuous water quality monitoring site
* All of the measurement **Results** from an individual **Specimen**
* All of the **Results** collected by a particular **Person**
* All of the **Results** collected by a particular **Organization**

ODM2 does not constrain how **Results** are grouped into **Datasets** - this is determined by the user.

### Dataset Citations ###

Each **Dataset** created within an ODM2 instance can be assigned one or more citations using the ODM2 Provenance extension. **Datasets** are linked to a **Citations** entity where the full details of the **Citation** are encoded. If the **Datase**t was loaded into an ODM2 instance from an external source, the **Citation** would point at the original source of the data. If the ODM2 instance in which the data are stored is the original source of the data (e.g., where the ODM2 database is used by a research group or system to publish original data), the **Citation** information would specify how that **Dataset** should be cited by others. See the documentation for the [ODM2 Provenance](ext_provenance.md) extension for more details.
