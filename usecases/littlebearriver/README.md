Little Bear River Watershed Hydrology and Water Quality Data Use Case
=====================================================================

#### ODM2 Data Use Case Implementation ####

The LBR data have been transferred from an ODM 1.1.1 database to ODM2 using a [SQL script](https://github.com/ODM2/ODM2/blob/master/usecases/littlebearriver/sqlscripts/ODM1.1.1_to_ODM2_LBR.sql). Extensive notes describing the [mapping of the LBR ODM 1.1.1 database to ODM2](https://github.com/UCHIC/ODM2/blob/master/usecases/littlebearriver/littlebearriver_notes.md) are available.  Additionally, many use case [SQL queries](https://github.com/ODM2/ODM2/blob/master/usecases/littlebearriver/sqlscripts/ODM1.1.1_vs_ODM2_Queries_LBR.sql) have been written with demonstrations of how the same query can be done in ODM 1.1.1 and in ODM2.

#### Dataset Description ####
The LBR data consist of time series of hydrologic observations collected at aquatic and weather monitoring sites in the Little Bear River of Northern Utah, USA. Also included are water quality samples collected in the Little Bear River and analyzed for constituents such as suspended sediment and nutrient concentrations. The Little Bear River data are currently stored in a CUAHSI Hydrologic Information System (HIS) ODM Version 1.1.1 database in Microsoft SQL Server.  

#### Data Source Information ####

**Contact**:  Jeff Horsburgh  
**Email**:  jeff.horsburgh@usu.edu  
**Organization**:  Utah Water Research Laboratory, Utah State University

#### Temporal Information ####

Continuous time series collected every 30 minutes at aquatic sites and every 60 minutes at weather stations. Sporadic and event based, instantaneous water quality samples. Water quality samples were collected by technicians in the field as grab samples or via automated samplers during storm and snowmelt events.

#### Observation Types ####

In situ sensor, laboratory sample analysis, field observations, derived data

#### Measured Variables ####

Alkalinity; Barometric Pressure; Battery Voltage; Discharge; Distance; Electrical Conductivity; Gage Height; Imaginary dielectric constant; Nitrogen, total; Nitrogen, total dissolved; Oxygen, dissolved; Oxygen, dissolved percent of saturation; pH; Phosphorus, particulate; Phosphorus, total; Phosphorus, total dissolved; Precipitation; Radiation, incoming shortwave; Real dielectric constant; Relative Humidity; Snow Depth; Solids, Total Suspended; Specific Conductance; Temperature; Turbidity; Volumetric Water Content; Wind Direction; Wind Speed

#### Other Links ####

Documentation for [ODM 1.1.1](http://hydroserver.codeplex.com/wikipage?title=Observations%20Data%20Model&referringTitle=Documentation) is available online. 

The LBR Data are available via several mechanisms.  They can be downloaded from [http://littlebearriver.usu.edu](http://littlebearriver.usu.edu) and they can be accessed via a CUAHSI HIS WaterOneFlow web service at [http://data.iutahepscor.org/LittleBearRiverWOF/](http://data.iutahepscor.org/LittleBearRiverWOF/).


