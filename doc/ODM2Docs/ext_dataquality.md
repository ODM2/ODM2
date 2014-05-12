ODM2 Extensions:  Data Quality
==============================
The optional DataQuality extension enables ODM2 users to encode specific information about the quality of their Results.  The **DataQuality** entity provides values for the precision, detection limit, etc. for Results.  The **ReferenceMaterials** entity provides a means to track materials used to develop calibrations and normalizations, and the **ReferenceMaterialValues** entity records the specific established values used for the calibration or normalization.

### Data Quality Values

Information about the quality of Results in ODM2 is encoded in the **DataQuality** entity. **DataQualityTypes** include measures such as Accuracy, Precision_2sigma (2 standard deviations), Method Detection Limit (MDL), Reporting Level (RL), 95% Confidence for no False Negatives, etc.  Each Result (i.e., from the Action of applying a single Method on a single SamplingFeature to quantify a single Variable) can have a **DataQualityValue** for one or more DataQualityTypes, and each DataQuality record can describe one or more Results (e.g., in the case where data quality information is applied to a batch of Results that came from a single Analysis Action).  The **ResultsDataQuality** cross-reference table provides for this many-to-many relationship between Results and DataQuality.  

A DataQuality record does not always require a DataQualityValue, depending on the DataQualityType.  Such **DataQualityCodes** are often called *Data Qualifier Flags*, and include statements such as "blank contamination," "holding time exceedance," "value out of range," etc.  For examples, see [http://www.caslab.com/EPA-Data-Qualifiers/](http://www.caslab.com/EPA-Data-Qualifiers/).

### Reference Materials and their Established Values

Most analytical instrumentation requires the analysis of a specimen with known properties for accurate instrument calibration and/or for normalization of the results to established scales and units. These specimens with known properties are called reference materials, and tracking information about the specific reference material used for a measurement is critical for interpreting many Results.  

*Reference materials*, sometimes called *calibration standards*, are materials or substances whose properties are sufficiently homogenous and well established to be used for the calibration of an apparatus or instrument, the assessment of a measurement method, or for assigning values to unknown specimens. *Certified Reference Materials* (CRMs), sometimes called *Standard Reference Materials*, are those whose property values are certified, traceable and accompanied by an estimate of their uncertainty.

Information about reference materials in ODM2 is encoded in the **ReferenceMaterials** entity. ReferenceMaterials serve as a special type of SamplingFeature. They are essentially Specimens having known composition or properties, but are not included in the Specimens entity because they are manufactured and have different attributes than Specimens.  One of the most important attributes of ReferenceMaterials is their established and "accepted" **ReferenceMaterialValues**, which can be certified by an agency or vendor, established in the literature by the research community, or developed for "in house" use by only a single laboratory. Each ReferenceMaterial may have values for one or more variables.  Furthermore, it is common for ReferenceMaterialValues to be updated to "new" values by an agency or research community due to improvements in analytical approaches.  Therefore, the ReferenceMaterials entity has a one-to-many relationship with the ReferenceMaterialValues entity. Each ReferenceMaterialValue is linked to a Citation (via the ODM2 Provenance extension), which is the documentation source from which the values were obtained.

The ReferenceMaterials and ReferenceMaterialValues entities have three uses in ODM2:

1. Providing the ReferenceMaterial name and its established property values as metadata for a Result that was normalized to those values. 
  * This data quality metadata is commonly reported in the literature and considered "best practice" for Certified Reference Materials whose values have been revised over time. Thus, this metadata allows one to go back and renormalize older literature data to the new accepted value, which is required for data synthesis.
  * There are many normalization approaches/equations, and those methods are usually also described in publications.
  * Example: The primary stable isotope of oxygen (i.e., VariableCode = delta18O) is typically reported in units of "per mil" versus one of three reference materials that depend on the Medium (SMOW, PDB or Air).  The "accepted" conversion offset between these scales has been revised over time and would need to be provided when a scale conversion is performed.
  * For other examples, read: Coplen, T. B., Brand, W. A., Gehre, M., Gröning, M., Meijer, H. A., Toman, B., & Verkouteren, R. M. (2006). New guidelines for δ 13C measurements. Analytical Chemistry, 78(7), 2439-2441.
  * For this case, ReferenceMaterialValues are linked to 0 or more Results whose values have been normalized using that ReferenceMaterialValue. A normalized Result can only be linked to a single ReferenceMaterialValue.
2. Tracking the analysis of a ReferenceMaterial as if it were an unknown Specimen alongside other unknown Specimens.
  * This use, along with features in the optional Equipment and LabAnalyses extensions, enables ODM2 users to provide many of the functions of a Laboratory Information Management System (LIMS).
  * This tracking of analyses of ReferenceMaterials is an important laboratory "best practice" that enables labs to assess the accuracy of analytical methods and to apply corrections to *normalize* property values for unknown specimens to be directly comparable to the established ReferenceMaterialValue. 
  * Many publications report the values they get for a Certified Reference Material (and thus indirectly supply the constants for their normalization equation).
  * In ODM2, this lab analysis use case might record two different Actions. One Action would be an Analysis Observation Action, that collects raw Results for both ReferenceMaterials and unknowns, where the resulting values are stored in the ResultValues entity. A second Action might be a Calibration Action that explicitly creates a calibration equation by comparing measured raw ResultValues for a ReferenceMaterial versus the established ReferenceMaterialValues that are stored in the entity of that name.  The Calibration Action might then apply the calibration equation to raw ResultValues of unknown Specimens to derive normalized ResultValues for those same unknown Specimens using the DerivedEquation and RelatedResults tables (in the LabAnalyses and Provenance schemas).
    * It is not possible for a user of ODM2 to confuse laboratory Results from ReferenceMaterials with Results for unknown Specimens.  This is because every Result is associated with one and only one SamplingFeature, and ReferenceMaterials represent a separate sub-class of SamplingFeatures that is clearly distinguishable from the Specimen sub-class of SamplingFeatures.
3. Tracking the use of a ReferenceMaterial in Calibration Actions for a sensor, where the calibration Result and calibration equation are performed and recorded internally by the sensor instrument (i.e., a typical pH meter).
  * ReferenceMaterial calibration solutions often require tracking lot codes and certificates to look up the most accurate and precise property values. 
  
In summary, a user of ODM2 can use the optional DataQuality extension of ODM2 for a variety of purposes related to tracking data quality information associated with Results.




