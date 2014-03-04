ODM2 Extensions:  Data Quality
==============================
The Data Quality extension enables users to encode specific information on the quality of their Results.  The DataQuality entity/table provides values for the precision, detection limit, etc. for Results.  The ReferenceMaterials entity/table provides a means to track materials used to develop calibrations and normalizations, and the NormalizationReferenceMaterialValues entity/table records the specific values used.

### Data Quality Values

Information about the quality of Results in ODM2 is encoded in the **DataQuality** entity. **DataQualityTypes** include measures such as accuracy, precision_2sigma (2 standard deviations), Method Detection Limit (MDL), Reporting Level (RL), 95% confidence for no false negatives, etc.  Each Result (i.e. the Action of applying a single Method on a single SamplingFeature to quantify a single Variable) can have a **DataQualityValue** for one or more DataQualityTypes; and each DataQuality record can describe one or more Results.  Thus the **ResultsDataQuality** cross-reference table provides for a many-to-many relationship between Results and DataQuality.  

A DataQuality record does not always require a DataQualityValue, depending on the DataQualityType.  Such **DataQualityCodes** are often called *Data Qualifier Flags*, and include blank contamination, holding time exceedance, out of range, etc.  For examples, see http://www.caslab.com/EPA-Data-Qualifiers/.

### Reference Materials and their Established Values

Most analytical instrumentation requires a specimen with known properties for accurate instrument calibration and/or for normalization of the results to recognized scales and units. These specimens with known properties are called reference materials, and tracking information about the specific reference material used for a measurement is critical for interpreting many Results.  

*Reference materials*, sometimes called *calibration standards*, are materials or substances whose properties are sufficiently homogenous and well established to be used for the calibration of an apparatus or instrument, the assessment of a measurement method, or for assigning values to unknown specimens. *Certified Reference Materials* (CRMs), sometimes called *Standard Reference Materials*, are those whose property values are certified, traceable and accompanied by an estimate of the uncertainty.

Information about reference materials in ODM2 is encoded in the **ReferenceMaterials** entity. ReferenceMaterials serve as a special type of SamplingFeature. They are essentially Specimens having known composition or properties, but are not included in the Specimens entity because they are manufactured and have attributes in addition to those included for Specimens **[EMILIO: Looks like not all Specimen attributes would be relevant or meaningful, so the distinction is not exactly about having additional attributes?]**.  One of the most important attributes of ReferenceMaterials are their "accepted" **ReferenceMaterialValues**, which can be certified by an agency or vendor, established in the literature by the research community, or developed for "in house" use only by a laboratory. Each ReferenceMaterial may have values for one or more variables.  Furthermore, it is common for ReferenceMaterialValues to be updated to "new" values by the agency or research community due to improvements in analytical approaches.  Therefore, ReferenceMaterials has a one-to-many relationship with ReferenceMaterialValues.

The ReferenceMaterials entity has three uses in ODM2:

1. Providing the ReferenceMaterial name and its established property values as metadata for a Result that was normalized to those values. 
  * This data quality metadata is commonly reported in the literature and considered "best practice" for Certified Reference Materials whose values have been revised over time. Thus, this metadata allows one to go back and renormalize older literature data to the new accepted value, which is required for data synthesis.
  * There are many normalization approaches/equations, and those methods are usually also described in publications.
2. Tracking the analysis of a ReferenceMaterial as if it were an unknown Specimen alongside other unknown Specimens. 
  * This tracking is what a lab must do to assess the accuracy of analytical methods and apply corrections to *normalize* property values for unknown specimens to be directly comparable to the established ReferenceMaterialValue. 
  * This is considered best practice for most labs, and many publications actually report the values they get for the SRM (and thus indirectly supply the constants for their normalization equation).
  * In ODM2, this lab analysis use case might record two different Actions. One Action would be an Analysis ObservationAction, that collects raw Results for both ReferenceMaterials and unknowns. A second Action might be a calibration Action that refers to the ReferenceMaterials and that explicitly creates a calibration equation that is applied to raw Results of unknowns to derived normalized Results using the DerivedEquation and RelatedResults tables (in the LabAnalyses and Provenance schemas).
3. Tracking the use of a ReferenceMaterial in Calibration Actions for a sensor, where the calibration Result and calibration equation are performed and recorded internally by the sensor instrument (i.e a typical pH meter).
  * ReferenceMaterial calibration solutions often require tracking lot codes and certificates to look up the most accurate and precise property values. 




