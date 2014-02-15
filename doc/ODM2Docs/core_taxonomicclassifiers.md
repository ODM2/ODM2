ODM2 Core: Taxonomic Classifiers
================================

Taxonomic classifiers provide a way to classify results according to terms from a formal taxonomy. It provides an additional dimension to results, enabling users to assign both a variable name and a taxonomic term that qualifies the variable name. Examples include:

* Specification of the taxonomic name of a species for which a presence/absence or count observation has been made.
* Specification of the taxonomic name of a mineral for which a percent coposition observation has been made on a sample. 
* Specification of the taxonomic name for a soil type on which an observation has been made. 

The use of taxonomic classifiers avoids the repetition and complexity of overloading variable names with with taxonomic terms. For example, if an investigator was observing the number of fish for multiple species within a given stretch of river, a lengthy list of variable names would be needed (especially if the same observation were made over many stretches of river in different parts of the world). A variable name would be required for each fish species that might be observed:

* Count of Oncorhynchus mykiss
* Count of Salmo trutta
* Count of Oncorhynchus clarkii
* Count of Salvelinus fontinalis
* ...

ODM2 enables specification of a single variable with a name of "Count". The entity being counted can then be specified using terms from a taxonomy. In this example, terms from the taxonomy specify the count "of what."  Similarly, if a user were observing percent composition of many different minerals in a rock sample, a single variable name of "Percent composition" could be used along with a taxonomy that formally defines the names of the minerals.

The Taxonomic Classifiers entity is also linked to the ODM2 external identifiers extension. This enables users to link the taxonomic terms they are using to an externally maintained taxonomy.
