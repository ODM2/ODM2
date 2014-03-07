ODM2 Core: FeatureActionResult
==================

The [**FeatureActionResult** entity](http://uchic.github.io/ODM2/schemas/ODM2_Current/tables/ODM2Core_FeatureActionResult.html) provides flexible linkage between **Actions**, **SamplingFeatures** and **Results**. SamplingFeatureID and ActionID are required, but ResultID is nullable. This "triple" bridge accommodates **Actions** with differents kinds of outcomes:

* Observation _Actions_ on one SamplingFeature, generating one Result (and therefore one Variable only). This case may be depicted as the most conventional Action type in ODM2.
* _Actions_ with Methods that produce many Results on many SamplingFeatures. For example, a lab analysis that uses a single instrument and a single Method to process many samples (Specimens), generating many Variables on each sample.
* _Actions_ on one SamplingFeature but generating no Results. Collecting one sample in the field is an example of such an Action.
* _Actions_ that produce no Results and involve no SamplingFeatures. An important maintenance operation on a lab instrument is an example of such an Action.

The primary key of FeatureActionResult is defined as the combination of the entity's three fields. Therefore, such "triplet" must be unique, even if ResultID is Null.
