ODM2 Extensions:  Data Quality
==============================
The Data Quality extension enables users to encode specific information related to the quality of their observations. Data quality information can be added to both Results and individual ResultValues.

### Data Quality Values

Information about the quality of Results in ODM2 is encoded in the DataQuality entity. Data quality measures may include accuracy, percision, 

### Reference Materials

Reference materials are materials or substances whose property values are sufficiently homogenous and well established to be used for the calibration of an apparatus or instrument, the assessment of a measurement method, or for assigning values to materials. Standard Reference Materials (SRMs) are those whose properties are certified by a procedure that establisheds its traceability to an accurate realization of the unit in which the property value is expressed and for which the certified value is accompanied by an estimate of the uncertainity in the property value.

Since most analytical instrumentation is compative, many observations require a sample of known composition for accurate instrument calibration and/or for normalization of the results. Thus, recording information about the reference materials used for a measurement is critical information for interpreting many Results.  

Information about reference materials used to calibrate instruments or to normalize results is encoded in the ReferenceMaterials entity in ODM2. ReferenceMaterials serve as a special type of SamplingFeature. They are essentially Specimens having known composition or properties, but are not included in Specimens because they are manufactured and have attributes in addition to those included for Specimens.

The ReferenceMaterials entity has two uses in ODM2:

1. The first use is to provide the Standard Reference Material (SRM) name and its "accepted value" as metadata for a Result that was normalized to that value. There are many normalization approaches/equations, and those methods are usually also described. The reason for this is that an SRM's "accepted value" typically changes, or improves, over time due to improving analytical methods. Thus, this metadata allows one to go back and renormalize older literature data to the new accepted value, which is required for data synthesis. 
2. The second use of a SRM is for lab uses, in which an SRM is analyzed as an unknown Specimen alongside other unknown Specimens. This allows the lab to do the normalization of true unknowns to SRM. This is considered best practice for most labs, and many publications actually report the values they get for the SRM (and thus indirectly supply the constants for their normalization equation).


