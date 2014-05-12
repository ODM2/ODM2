ODM2 Core: Related Results
==========================

ODM2 allows users to create relationships among observation Results. Essentially, this is a mechanism for grouping Results. The nature of the relationship between Results must be specified by the user and is described in the **RelationshipTypeCV** attribute in the **RelatedResults** entity. Specifying relationships among Results is optional and not required in the ODM2Core schema. The following are potential use cases for using RelatedResults:

* Storing information about which Result(s) a particular Result was derived from.
* Relating Results created at a single site
* Relating Results collected for a particular purpose
* Relating Results collected within a particular watershed
* Etc.

Grouping of Results could also be done using [DataSets](core_datasets.md), which group Results but require additional descriptive information.
