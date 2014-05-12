ODM2 Core: Taxonomic Classifiers
================================

### Use of TaxonomicClassifiers with Results ###

**TaxonomicClassifiers** provide a way to classify Results according to terms from a formal taxonomy. It provides an additional dimension to Results, enabling users to assign both a name for the Variable that was measured and a taxonomic term that qualifies the Variable name. Examples include:

* Specification of the taxonomic name of a species for which a presence/absence or count observation has been made.
* Specification of the taxonomic name of a mineral for which a percent composition observation has been made on a sample. 
* Specification of the taxonomic name for a soil type on which an observation has been made. 

The use of TaxonomicClassifiers avoids the repetition and complexity of overloading Variable names with taxonomic terms. For example, if an investigator was observing the number of fish for multiple species within a given stretch of river, a lengthy list of VariableNames would be needed (especially if the same observation were made over many stretches of river in different parts of the world). A VariableName would be required for each fish species that might be observed. For example:

* Count of Oncorhynchus mykiss
* Count of Salmo trutta
* Count of Oncorhynchus clarkii
* Count of Salvelinus fontinalis
* ...

ODM2 enables specification of a single Variable with a name of "Count". The entity being counted can then be specified using terms from a taxonomy. In this example, terms from the taxonomy specify the count "of what."  Similarly, if a user were observing percent composition of many different minerals in a rock sample, a single Variable name of "Percent composition" could be used along with a taxonomy that formally defines the names of the minerals.

### Using Taxonomic Classifiers with Specimens ###

In the ODM2SamplingFeatures schema, TaxonomicClassifers are also connected to Specimens. This is so that Specimens can be assigned classifications according to formal taxonomies (e.g., specifying the mineral composition of a Specimen using terms from a taxonomy of mineral names). In some cases, multiple researchers have classified individual samples differently. In these cases, a Specimen may be linked to multiple classifications, with each qualified by a Citation from which the classification was derived (e.g., the research paper in which an author reported a classification of a Specimen). This is primarily useful for solid earth samples.

### External Identifiers for Taxonomic Classifiers ###

The TaxonomicClassifiers entity is also linked to the ODM2ExternalIdentifiers extension. This enables users to link the taxonomic terms they are using to an externally maintained taxonomy.
