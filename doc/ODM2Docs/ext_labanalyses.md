ODM2 Extensions: LabAnalyses
=====================

The **LabAnalyses** extension is used to encode detailed information about laboratory analyses of Specimens in support of deriving observations from Specimens.



### Directives ###
The **Directives** entity is used to encode information about why an **Action** associated with a laboratory analysis is performed.  For example, a **Directive** might state that an **Action** is performed as part of a particular:

* Project
* Monitoring program
* Field campaign
* Etc.

One **Directive** may result in many different **Actions**.  An **Action** does not have to  be associated with a **Directive**, but can be associated with only one.  It is up to the user to define the **Directives** under which **Actions** are performed.