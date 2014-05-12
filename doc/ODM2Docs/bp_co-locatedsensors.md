ODM2 Best Practices: Encoding Data for Co-Located Sensors
=========================================================

In many cases you may have multiple sensors installed at a single monitoring site that are measuring the same Variable. Examples include:

* Soil moisture sensors installed at multiple depths within a single soil profile
* Multiple water temperature sensors installed a multiple depths (or even at the same depth) within a stream
* Multiple rain gages installed at the same weather station

Within ODM2, you can easily encode data for multiple sensors at a single site, but there are some guidelines to follow. 

* In the case where the sensors are measuring exactly the same variable, you should use a single record in the Variables table to describe the data from all of the sensors (all Results should have the same VariableID).
* If any of the data collection attributes are different from one sensor to the next (e.g., one sensor is recording instantaneous values and one is recording hourly averages, resulting in a different TimeAggregationInterval and/or AggregationStatistic for each sensor), you will need to record these values in the Results and ResultValues entities.
* Where multiple of the same sensor are used at a Site, you should describe each of the Actions that have Results using the same MethodDescription. However, you may choose to create a different MethodDescription for each sensor. The MethodDescription would be very similar for each sensor, but should include enough information to differentiate between them.  For example, MethodDescriptions for two soil moisture sensors installed at the same Site but at different depths might be "Soil volumetric water content measured using a Stevens Hydra II soil moisture sensor installed 20 cm below the soil surface" versus "Soil volumetric water content measured using a Stevens Hydra II soil moisture sensor installed 40 cm below the soil surface."
* Where sensors are installed at different depths or offsets at a single site (e.g., the soil moisture sensor example above), make sure you use the XLocation, YLocation, and ZLocation attributes and their Units and SpatialReference to encode the offset information for the sensors relative to the monitoring Site location.