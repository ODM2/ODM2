ODM2 Core: Methods
==================

The **Methods** entity is used to encode information about the procedure used to perform an **Action**. Every **Action** must be performed using a **Method**. **Methods** are modeled generically in ODM2 and can be of many types, including:

* Sample collection methods
* Sample preparation methods
* Sample analysis methods
* Observation methods

**Methods** have a MethodType that is selected from a controlled vocabulary. Each **Method** has a code and a name and may have a detailed description and link to a URL that provides further details of the **Method**. **Methods** may also be associated with an **Organization** - e.g., in the case that a **Method** was developed by a particular **Organization**.
