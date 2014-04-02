ODM2 Extensions: Results - Measurement Frameworks
===========================================================

In describing the individual ResultTypes supported by ODM2, it is useful to describe the concept of a **Measurement Framework**. A measurement framework is a conceptual scheme that establishes rules for control of other components of a phenomenon to permit measurement of one component (Chrisman, 1995; 1997; 1999). In ODM2, each ResultType has a spatial component, a temporal component, and an observed Variable component. According to Chrisman (1999), there are three possible roles for the spatial, temporal, and observed Variable components. In general, in order to measure one component, one of the others has to be fixed, while the third serves as a control. Chrisman (1999) states that control denotes a mechanism of restraint on the variation of a component. For example, a water level sensor must be fixed in one location, and the rate of temporal sampling controlled so the depth of water (the attribute) can be measured. The following sections describe how these three components are handled in ODM2.

### Observed Variable Component ###
In ODM2, a fundamental, structural choice has been made that affects the measurement framework associated with the different ResultTypes. For *all* ODM2 ResultTypes, the  observed Variable component is "measured." For the purposes of ODM2, ProcessingLevel, Units, Status, and SampledMedium, which are all Attributes of a Result, are part of the observed Variable component that is measured in the measurement framework for each ResultType. Given that the attribute component of the measurement framework for all ODM ResultTypes is always measured, it is the spatial and temporal components that distinguish between the different ResultTypes. 

### Spatial Component ###
In the measurement frameworks for ODM2 ResultTypes, space may be fixed, but it may also be controlled or measured. For example, consider the following measurement scenarios for the spatial component:

1. Fixed space: A Result is measured on a single, fixed SamplingFeature (e.g., a Specimen or an individual Site). 
2. Fixed space: A Result is measured on a single, fixed SamplingFeature, but at a location that is offset from the SamplingFeature (e.g., a sensor that is installed at a Site, but located some distance below the soil surface or above the ground). 
3. Controlled space: A Result is measured across multiple SamplingFeatures (e.g., values representing a Variable at multiple sites at the same time).
4. Measured space: A Result is measured on on a SamplingFeauture that is not fixed (e.g., a glider or sensor mounted to a boat). 

### Temporal Component ###
Similar to the spatial component, the temporal component may be fixed or controlled in ODM2. For a sensor installed at a Site, individual ResultValues are regularly recorded with a spacing that is controlled by the datalogger. However, a Specimen is collected at single instant in time, effectively fixing the temporal component for any Results created from that Specimen. In some special cases, the temporal component may be measured (e.g., the time at which a particular value of a variable occurred).