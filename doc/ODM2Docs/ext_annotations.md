ODM2 Extensions: Annotations
============================
The Annotations extension enables users to create data qualifying comments or notes about entities within an ODM2 instance. The Annotations extension is designed such that one or more annotations can be added to records in the following entities:

* SamplingFeatures
* Actions
* Methods
* Results
* ResultValues

Each text annotation is classified by an AnnotationType (e.g., "Data qualifying comment" or "Sampling feature attribute", etc.) and an optional AnnotationCode (e.g., "a" as a code for "Approved"). Each text Annotation is also characterized by a date on which it was created and is linked to the Person that created it. 

In ODM2, annotations are added to individual records in each of the entities listed above. For example, an annotation can be added to a single SamplingFeature without requiring a similar value for all other SamplingFeatures. This allows users to make very granular text annotations. The design also allows for multiple annotations for a single record - e.g., in the case that a user needs to add many annotations to a single Result or ResultValue.
