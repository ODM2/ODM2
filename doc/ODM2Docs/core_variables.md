ODM2 Core: Variables
====================

**Variables** specify the property of the SamplingFeature that was observed. Each Result can have a single Variable. Variables are described by a VariableType (from a controlled vocabulary), a unique VariableCode, a VariableName (from a controlled vocabulary), a VariableDefinition, a Speciation, and a NoDataValue.

### Variable Types ###
Variable types provide a way to group Variables into categories for easier querying.

**TODO:  Need more information here.**

### Speciation ###
Speciation indicates the chemical speciation in which the ResultValues are expressed. For example, a measurement of "Total phosphorus" could be expressed in mg/L as "P" or mg/L as "PO4", where "P" or "PO4" are the Speciation. Speciation is optional as not all observations have a Speciation. Values for Speciation are selected from a controlled vocabulary.

### No Data Values ###
NoDataValues are used as placeholders to indicate that no value was observed or recorded, but a value should have been recorded. Each Variable has a configurable NoDataValue. NoDataValues should be set so they are outside the possible range of values for the Variable. In most cases a NoDataValue of -9999 is sufficient.