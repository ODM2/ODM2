ODM2 Best Practices: Preparing Variable Information
===================================================

### Assigning VariableCodes ###
A VariableCode is a short, unique text identifier for a Variable, where a Variable is defined as a single record within the Variables table. Both its uniqueness and its conciseness lend it towards performing queries on the data, as opposed to using the long name for the Variable.

Example:
```
I have a variable named “Carbon dioxide, transducer signal”. I have assigned it a VariableCode of “CO2sig”.
```

### Make VariableCodes Unique within an ODM Database ###
Each variable is assigned a VariableCode that must be unique within your instance of ODM2. VariableCodes are used by various tools to locate a specific Variable within ODM2, so that’s why they must be unique. You must create a new VariableCode to identify any new record that is added to the Variables table.

Example:
```
My sensor reports minimum and maximum temperature for each reading. I have two variables named “Temperature” in my database, where one variable has a DataType of “Maximum” and the other has a DataType of “Minimum”. Because VariableCode is the field that is searched on by various tools, I must assign a code that also differentiates these two variables. I assign one variable a code of “TempMax”, and the other “TempMin”.
```

It’s ok for variables in different ODM2 databases to have the same VariableCode. This will not break any tools that operate on ODM2 databases. Just make sure that within a given ODM2 database, the VariableCode is unique for each record in the Variables table.

### Make VariableCodes Concise ###
When we query for data in an ODM2 database, we might be typing in queries by hand. Typing in very long VariableCodes can be tedious, so keeping them brief is recommended.

**Important:** For your VariableCodes, try to avoid using special characters that might be used by other applications to parse text, or which might be altered or removed by web applications. Example of characters to avoid include commas, tildes, semicolons, plus signs, spaces, and colons.

## Assigning VariableNames and other Info
Before you load your data into an ODM2 database, have a look at the VariableName controlled vocabulary. A set of suggested VariableNames has already been provided for you. It’s best to use the items from the ODM2 controlled vocabularies to describe your data. This makes it much, much easier to relate your data to other datasets that are out there. That way, if someone is looking at a "Temperature" Variable in your ODM2 instance and a "Temperature" Variable in another ODM2 instance from another university, they can have confidence that they are looking at the same thing.