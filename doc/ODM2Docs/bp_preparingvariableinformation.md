ODM2 Best Practices: Preparing Variable Information
===================================================

### Assigning VariableCodes ###
A VariableCode is a short, unique text identifier for a Variable, where a Variable is defined as a single record within the Variables table. Both its uniqueness and its conciseness lend it towards performing queries on the data, as opposed to using the long name for the Variable.

Example:

>I have a variable named “Carbon dioxide, transducer signal”. I have assigned it a VariableCode of “CO2sig”.

### Make VariableCodes Unique within an ODM Database ###
Each variable is assigned a VariableCode that must be unique within your instance of ODM2. VariableCodes are used by various tools to locate a specific Variable within ODM2, so that’s why they must be unique. You must create a new VariableCode to identify any new record that is added to the Variables table.

Example:

>My sensor reports minimum and maximum temperature for each reading. I have two variables named “Temperature” in my database, where one set of ResultValues has an AggregationStatistic of “Maximum” and the other has an AggregationStatistic of “Minimum”. Because VariableCode is the field that can be searched on by various tools, I must assign a code that also differentiates these two variables. I assign one variable a code of “TempMax”, and the other “TempMin”.

It’s ok for variables in different ODM2 databases to have the same VariableCode. This will not break any tools that operate on ODM2 databases. Just make sure that within a given ODM2 database, the VariableCode is unique for each record in the Variables table.

### Make VariableCodes Concise ###
When we query for data in an ODM2 database, we might be typing in queries by hand. Typing in very long VariableCodes can be tedious, so keeping them brief is recommended.

**Important:** For your VariableCodes, try to avoid using special characters that might be used by other applications to parse text, or which might be altered or removed by web applications. Example of characters to avoid include commas, tildes, semicolons, plus signs, spaces, and colons.

### Assigning VariableNames and other Information ###
Before you load your data into an ODM2 database, have a look at the VariableName controlled vocabulary. A set of suggested VariableNames has already been provided for you. It’s best to use the items from the ODM2 controlled vocabularies to describe your data. This makes it much, much easier to relate your data to other datasets that are out there. That way, if someone is looking at a "Temperature" Variable in your ODM2 instance and a "Temperature" Variable in another ODM2 instance from another university, they can have confidence that they are looking at the same thing. Another important case for using the controlled vocabulary involves variables that make related measures, but for which the VariableName provides an important semantic distinction. For example, "Gage height", "Water depth", and "Water level" all represent similar concepts with ResultValues that are distinct.

If the variable that you are measuring is not found in the ODM2 Controlled Vocabulary list, you may add it to your instance of ODM2 and request that it be added to the ODM2 Central Controlled Vocabulary list.

VariableType and Speciation should also come from ODM2 Controlled Vocabularies. VariableType will facilitate grouping variables into logical categories used by various tools. The user has some discretion into which category variables are assigned.

Example: 

>I have a sensor measuring water temperature. I assign a VariableType of "Water Quality". I could also potentially assign a VariableType of "Hydrology".

Speciation is optional, and is only needed for chemical measurements that could be expressed as measurement of various species. In these cases, however, speciation is essential

Example:

>I am reporting values of alkalinity, which is expressed as mg/L CaCO3. The speciation should be specified as CaCO3.

The NoDataValue represents an indicator that no value was measured or collected when one should have been. This must be a numeric value, and should be outside the range of observed values for the variable. Many of the tools developed for ODM2 expect -9999 as the NoDataValue, and will not display data of this value in plots, etc.

Example:

>I have a datalogger program that reports NaN when there is a problem with the result. When these data stream into an ODM2 database, the NaN entries are converted to -9999 to represent no data.
