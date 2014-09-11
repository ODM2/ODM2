ODM2 Core: Variables
====================

**Variables** specify the property of the **SamplingFeature** that was observed. Each **Result** can have a single Variable. Variables are described by a VariableType (from a controlled vocabulary), a unique VariableCode, a VariableName (from a controlled vocabulary), a VariableDefinition, a Speciation, and a NoDataValue.

### Variable Types ###
Variable types provide a way to group Variables into categories for easier querying and filtering. Variable types are selected from a controlled vocabulary. The following is a list of potential variable types:

* Biota
* Chemistry
* Geology
* Hydrology
* Instrumentation
* Soil
* Water Quality

### Variable Codes ###
VariableCode permits users to assign their own naming representation to a variable. This may help simplify queries involving the differentiation of Variables that are distinguished by other attributes. For example, measurements collected by two different air temperature sensors have the same VariableName (Temperature), but could be distinguished by their variable codes, e.g., "AirTemp_ST110" and "AirTemp_HC2S3". Another example is a Turbidity sensor that records minimum, maximum, and median for a measurement interval. The distinguishing aggregation statistic is found in the ResultValues table, so VariableCodes could be assigned to help document the distinction- e.g., "Turb_Min", "Turb_Max", "Turb_Med". The VariableCode can also facilitate consistency if the user has chosen to implement multiple databases, i.e., identical variables may not have the same ID, but could be assigned the same VariableCode. Note that VariableCodes must be unique. 

### Variable Names ###
To facilitate interoperability of data from various sources, a controlled vocabulary is used to name variables. This prevents confusion that can occur between semantics of describing variables. For example, for the measurement of phosphorus, the user would select a VariableName from this subset of the controlled vocabulary list: 

*Phosphorus, dissolved	
*Phosphorus, dissolved organic	
*Phosphorus, inorganic	
*Phosphorus, organic	
*Phosphorus, orthophosphate	
*Phosphorus, orthophosphate dissolved	
*Phosphorus, orthophosphate total	
*Phosphorus, particulate	
*Phosphorus, particulate organic	
*Phosphorus, phosphate (PO4)	
*Phosphorus, phosphate flux
*Phosphorus, polyphosphate	
*Phosphorus, total	
*Phosphorus, total dissolved

###Variable Definition###
VariableDefinition permits users to provide additional information to describe the variable being observed. This is an optional text field to be used at the users' discretion. 

### Speciation ###
Speciation indicates the chemical speciation in which the ResultValues are expressed. For example, a measurement of "Total phosphorus" could be expressed in mg/L as "P" or mg/L as "PO4", where "P" or "PO4" are the Speciation. Speciation is optional as not all observations have a Speciation. Values for Speciation are selected from a controlled vocabulary.

### No Data Values ###
NoDataValues are used as placeholders to indicate that no value was observed or recorded, but a value should have been recorded. Each Variable has a configurable NoDataValue. NoDataValues should be set so they are outside the possible range of values for the Variable. In most cases a NoDataValue of -9999 is sufficient.
