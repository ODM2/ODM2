ODM2 Core: FeatureActions
=========================

The [**FeatureActions** entity](http://uchic.github.io/ODM2/schemas/ODM2_Current/tables/ODM2Core_FeatureActions.html) provides flexible linkage between **Actions** and the **SamplingFeatures** on which or at which they were performed. SamplingFeatureID and ActionID are required indicating that each **Action** that generates a **Result** must be performed on or at a **SamplingFeature**. This bridge accommodates **Actions** with differents kinds of outcomes:

* Observation _Actions_ on one **SamplingFeature**, generating one **Result** (and therefore one **Variable** only). This case may be depicted as the most conventional **Action** type in ODM2.
* Observation _Actions_ with **Methods** that produce many **Results** on many **SamplingFeatures**. For example, a lab analysis that uses a single instrument and a single **Method** to process many samples (**Specimens**), generating **Results** for many **Variables** on each sample.
* _Actions_ on one **SamplingFeature** but generating no **Results**. Collecting one sample in the field is an example of such an **Action**. A routine field sensor calibration may be another example.


It should be noted that it is possible to have _Actions_ that don't involve a **SamplingFeature** and produce no **Results**. An important maintenance operation on a lab instrument is an example of such an **Action**. In this case, there would be no record in the **FeatureAction** entity for this type of **Action** as there is no associated **SamplingFeature**.

All **Actions** that produce a result must involve a **SamplingFeature**. A field sensor calibration does not produce a result (unless the sensor maintainer chooses to store some calibration-specific **Results**), but does occur at a Site **SamplingFeature**. Lab equipment maintenance could involve no **SamplingFeature** or **Result**, or if it does produce a **Result** (say, based on a calibration with a standard reference material) it will involve a Specimen **SamplingFeature**.

The primary key of the **FeatureActions** entity is FeatureActionID. It is a unique identifier assigned to each unique combination of SamplingFeatureID and ActionID. Therefore, each record in the **FeatureActions** entity must be unique.
