ODM2 Best Practices: Handling Dates and Times
=============================================

### UTC and Local Times ###
Unambiguous interpretation of date and time information requires specification of the time zone or offset from universal time (UTC). A UTCOffset is included for each date/time in ODM2 to ensure that local times can be referenced to standard time and to enable comparison of results across ODM2 instances that may encode data values collected in different time zones (e.g., compare data values from one hydrologic observatory to those collected at another hydrologic observatory located across the country). The UTCOffset is especially important for the time stamps of individual data values because even though the time zone is the same for all measurements at a site, the offset may change due to daylight savings. 

Some investigators may run data loggers on UTC time, while others may use local time adjusting for daylight saving time. To avoid the necessity to keep track of the system used, or impose a system that might be cumbersome and lead to errors, we decided that if the UTCOffset was always recorded, the precise time would be unambiguous and would reduce the chance for interpretation errors. 

### Best Practice for Recording Times at a Sensor ###
Even though it may be known that a particular sensor network switches from daylight saving time to standard time, it's possible that the operator may not have switched the data logger to standard time at exactly the right time of day, leading to potential errors if a blanket calculation of UTCOffset is applied using "official" dates and times for the switch to standard time.

To avoid these problems, we recommend that all data loggers be set to local standard time and record in that time even during periods of daylight saving time. It's much easier to adopt this convention at the source, rather than try to compute the correct UTCOffset afterward.

### Beginning of Interval Reporting Time for Interval Data Values ###
Some data types used in ODM2 apply to data values that occur over an interval of time. The date and time reported and encoded in ODM2 associated with each data value should be the beginning time of the observation interval. This default convention was adopted to be consistent with the way dates and times are represented in most common database management systems. 

It should be noted that using the beginning of the interval is not consistent with the time a datalogger would log an observation value. Care should be exercised in adding data to the ODM to ensure that the beginning of interval convention is followed. If this convention is not followed, notes should be provided in the Method description indicating that values are recorded at the end of the interval.