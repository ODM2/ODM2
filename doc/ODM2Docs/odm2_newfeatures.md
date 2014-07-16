New Features of ODM2
====================

The following are new features of ODM2 that either didn't exist in ODM 1.1.1 or were not fully supported:

1. **Add multiple comments/annotations to any record in any entity**: In ODM 1.1.1, only DataValues could have comments associated with them. Each DataValue could have only one "Qualifier".  ODM2 enables users to add any number of annotations to any entity in the information model.
2. **Represent Actions and Sequences of Actions**: ODM2 enables the representation of the activities or Actions that lead to Observations. Relationships among Actions can also be specified, making it possible to record workflows of Actions.
3. **Store information about Actions having no Results**: ODM2 enables the capture of information about field activities and other Actions that may not have resulting observations, but that are important in the full specification of the data.
4. **Better represent People and Organizations**: ODM2 has a more granular representation of People and Organizations than ODM 1.1.1, which combined these concepts into "Sources". ODM2 enables People to be tied to Actions and their Results.
5. **Separate Results and ResultValues**: By separating Results and ResultValues, ODM2 enables Results of multiple different types. This also moves data values out of the center of the schema (as it was in ODM 1.1.1) and better supports a cataloging functional use case.
6. **Add TaxonomicClassifers to Results**: This adds an additional dimension to Results in ODM2 that did not exist in ODM 1.1.1. TaxonmicClassifiers enable the specification of a taxonomic classification of a Result. One example is a Result whose value is a count of a particular fish species - the Variable is "Count" and the TaxonomicClassifier would be the taxonomic name of the fish species (effectively specifying the count of "what").
7. **Create relationships among Results**: ODM2 better supports Provenance of data by maintaining information about relationships among Results. Relationships may specify that one Result was derived from another Result or set of Results.
8. **Group Results into DataSets**: ODM2 includes a new concept of a DataSet, which is a group of Results. Users can group Results for any reason.
9. **Store information about Equipment used to create observations**: The ODM2 Equipment extension enables users to store information about their inventory of equipment used to make observations, making it possible to create important linkages between Results and the instruments used to create them.
10. **Add extension properties to any record in any entity**: ODM2 provides a standardized way to add additional attributes to entities within the model.
11. **Link many entities to external identifier systems**: In many cases the entities associated with observations (e.g., Sites, Specimens, etc.) have identifiers that are maintained in external systems. ODM2 enables linkage to external identifier systems.
12. **Create SamplingFeatures of multiple types**: ODM 1.1.1 supported only discrete point SamplingFeatures. ODM2 supports point features (Sites) as well as Specimens and SamplingFeatures with more complex geometries.
13. **Support for parent-child relationships among SamplingFeatures**: ODM2 supports relationships among SamplingFeatures (e.g., one can formally specify that a Specimen is collected at a Site).
14. **Not limited to a single spatial offset**: ODM2 supports specification of spatial offsets among sampling features as well as spatial offsets of Results. 
15. **More specific definition of multiple ResultTypes**: ODM2 defines several new ResultTypes in addition to hydrologic time series (e.g., Measurement, Categorical, Profile, Point Coverage, Section, Transect, Trajectory, and Spectra ResultTypes). ODM2 uses a general pattern for defining ResultTypes (e.g., one entity for attributes that are fixed and another that stores attributes and values that are variable or measured), which means that additional new ResultTypes could be defined without changing the ODM2Core schema. 
16. **Specify data quality information**: ODM2 enables the specification of specific data quality metadata for observation Results. Additionally, information about ReferenceMaterials used in making or normalizing Results can be described.
17. **Maintain provenance information**: ODM2 enables the storage of Citations and additional metadata for maintaining the provenance of observational data.





