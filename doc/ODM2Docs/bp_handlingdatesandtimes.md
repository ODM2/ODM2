ODM2 Best Practices: Handling Dates and Times
=============================================

### UTC and Local Times ###
Unambiguous interpretation of date and time information requires specification of the time zone or offset from universal time (UTC). A UTCOffset is included for each date/time in ODM2 to ensure that local times can be referenced to standard time and to enable comparison of results across ODM2 instances that may encode data values collected in different time zones (e.g., compare data values from one hydrologic observatory to those collected at another hydrologic observatory located across the country). The UTCOffset is especially important for the time stamps of individual data values because even though the time zone is the same for all measurements at a site, the offset may change due to daylight savings. 

Some investigators may run data loggers on UTC time, while others may use local time adjusting for daylight saving time. To avoid the necessity to keep track of the system used, or impose a system that might be cumbersome and lead to errors, we decided that if the UTCOffset was always recorded, the precise time would be unambiguous and would reduce the chance for interpretation errors. 

### Best Practice for Recording Times at a Sensor ###
Even though it may be known that a particular sensor network switches from daylight saving time to standard time, it's possible that the operator may not have switched the data logger to standard time at exactly the right time of day, leading to potential errors if a blanket calculation of UTCOffset is applied using "official" dates and times for the switch to standard time.

To avoid these problems, we recommend that all data loggers be set to local standard time and record in that time even during periods of daylight saving time. It's much easier to adopt this convention at the source, rather than try to compute the correct UTCOffset afterward.

### Beginning or End of Interval Reporting Time for Interval Result Values ###
Some ResultTypes used in ODM2 apply to measurements that occur over an interval of time. The date and time reported and encoded in ODM2 associated with each result value should be the beginning time of the observation interval. This default convention was adopted to be consistent with the way dates and times are represented in most common database management systems. 

It should be noted that using the beginning of the interval is not consistent with the time a datalogger would log an observation value. Care should be exercised in adding data to the ODM to ensure that the beginning of interval convention is followed. If this convention is not followed, notes should be provided in the Method description indicating that values are recorded at the end of the interval.

### Distinguishing Instances of Dates and Times in ODM2 ###

**Actions:** In the Actions table, the BeginDateTime and EndDateTime are specified. The BeginDateTime is required and represents the date and time that the action was initiated. The EndDateTime is optional. Some Actions (e.g., a sensor deployment) are more or less instantaneous and do not require an EndDateTime. For other actions, the EndDatetime may be important to give an indication of the action's duration.

Example:

>I calibrated a sensor in the field. The Calibration Action began 7/21/2014 at 10:05 AM (BeginDateTime). I completed the calibration 7/21/2014 at 10:40 AM (EndDateTime). Recording the period of calibration indicates when this sensor was not deployed and for which the associated measurements are not valid.

In some cases, the Action BeginDateTime and EndDateTime may be somewhat ambiguous and user discretion should be applied. For example, a sensor is sent to the factory for routine maintenance and service. 

Example:

>The BeginDateTime and EndDateTime for the Maintenance Action could be selected to represent when the sensor was shipped to and returned form the factory. Alternatively, only a BeginDateTime could be entered to represent the date that the service was performed at the factory.

**Results**: The Results entity contain two types of dates and times. The ResultDateTime represents the date and time at which the entry in the Results became available. For the example of a sensor deployment with data streaming to an ODM2 database, the ResultDateTime is the date and time that the sensor began collecting data. The actual date and times of the sensor observations are encoded in the ResultValues table. 

The ValidDateTime represents the date and time for which the result is valid. This should typically only be used for a forecast associated with some prospective date and time to which it applies.  

**Result Values**: The ResultValues tables for each result type contain the ValueDateTime attributes to record the date and time that the measurement was made, recorded, or reported. For interval result values, see the above discussion on beginning or end of interval reporting. Most of the Result types involve time spacing and aggregation, which are recorded in the Results and ResultValues tables.

**Equipment**: Because relationships between pieces of equipment may change as the status of the equipment changes, the RelatedEquipment table includes StartDateTime and EndDateTime attributes to indicate the time period for which a relationship between pieces of equipment occurred.
