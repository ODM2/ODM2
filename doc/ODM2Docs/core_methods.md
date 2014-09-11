ODM2 Core: Methods
==================

The **Methods** entity is used to encode information about the procedure used to perform an **Action**. Every **Action** must be performed using a **Method**. **Methods** are modeled generically in ODM2 and can be of many types, including:

* Sample collection methods
* Sample preparation methods
* Sample analysis methods
* Observation methods

**Methods** have a MethodType that is selected from a controlled vocabulary. Each **Method** has a code and a name and may have a detailed description and link to a URL that provides further details of the **Method**. **Methods** may also be associated with an **Organization** - e.g., in the case that a **Method** was developed by a particular **Organization**.

### MethodTypes ###
MethodTypes, which are chosen from a controlled vocabulary, indicate categories of methods. The full description of the procedure used to perform an **Action** should be specified in the MethodDescription, but the MethodType attribute provides a convenient way to query **Results** based on categories of **Methods**. Examples of MethodTypes from the controlled vocabulary include:

* **Field procedure** - A Field procedure Method may be used to create an observation of a Variable using a field instrument
* **Model simulation** - A Model simulation Method may be used to generate Results by executing a simulation or model 
* **Derivation** - A Derivation Method may be used to generate Result(s) that are directly derived from another Result or set of Results
* **Sample** - A Sample Method may be used to generate Result(s) from analyzing a sample in a laboratory
* **Etc.**
