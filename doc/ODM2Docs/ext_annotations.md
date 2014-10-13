ODM2 Extensions: Annotations
============================
The Annotations extension enables users to create data qualifying comments or notes about entities within an ODM2 instance. The Annotations extension is designed such that one or more annotations can be added to records in the following entities:

* SamplingFeatures
* Actions
* Methods
* Results
* ResultValues (the ResultValue entities for any of the ResultTypes)
* Equipment

Each text Annotation is classified by an AnnotationType (e.g., "Action Annotation" or "SamplingFeature Annotation", etc.) and an optional AnnotationCode (e.g., "a" as a code for an annotation of "Approved"). Each text Annotation is also optionally characterized by a date on which it was created and is linked to the Person that created it via AnnotatorID. Finally, an annotation may be linked to a Citation via the ODM2 Provenance extension where it is desireable to store information about the source of a particular Annotation. 

In ODM2, Annotations are added to individual records in each of the entities listed above. For example, an Annotation can be added to a single SamplingFeature without requiring a similar value for all other SamplingFeatures. This allows users to make very granular text Annotations. The design also allows for multiple Annotations for a single record - e.g., in the case that a user needs to add many Annotations to a single Result or ResultValue.
