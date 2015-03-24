ODM2 Extensions: Provenance
============================
The ODM2 Provenance Extension is used to encode the following:

- Citations for Annotations, Datasets, and Methods
- The author list for Citations
- Relationships between Citations
- Relationships between Datasets
- Relationships between Results (including how derived Results were created)

### Citations ###
TODO

### Related Annotations ###
TODO

### Related Datasets ###
TODO

### Related Results ###
ODM2 allows users to create relationships among observation Results. Essentially, this is a mechanism for grouping Results. The nature of the relationship between Results must be specified by the user and is described in the **RelationshipTypeCV** attribute in the **RelatedResults** entity. Specifying relationships among Results is optional and not required. The following are potential use cases for using RelatedResults:

* Storing information about which Result(s) a particular Result was derived from.
* Relating Results created at a single site
* Relating Results collected for a particular purpose
* Relating Results collected within a particular watershed
* Etc.

Grouping of Results could also be done using [DataSets](core_datasets.md), which group Results but require additional descriptive information.

### Derived Results ###
In ODM2 a Result may be derived from another Result (e.g., a time series of river stage might be converted to a time series of discharge). Where it is desired to record the relationship between a Result and the Result from which it was derived, an entry can be made in the RelatedResults entity that records the ResultID of the derived Result and the ResultID of the Result from which it was derived. The RelationshipTypeCV would be specified using a term from the RelationshipType controlled vocabulary - in this case the term "isDerivedFrom". An optional VersionCode can be specified if a specific version number or code is to be applied.  

In cases were a Result is derived from multiple other Results, multiple records would be entered into the RelatedResults entity. Each could be assigned a RelatedResultSequenceNumber that identifies the order in which the Result was used in the derivation. Where it is desired to store the equation by which the conversion was performed, it can be encoded in the ResultDerivationEquations and DerivationEquations entities. Each derivation equation is recorded in the DerivationEquations entity and then can be applied to one or more derived Results. In the case where multiple Results were used to create a single derived Result, the DerivationEquation entity can encode the equation in such a way that it records the sequence in which the related results were used.
