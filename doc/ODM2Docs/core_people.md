ODM2 Core: People
=================

**People** are included in ODM2 so that observations and other types of **Actions** can be affiliated with the individual People that perform them. People are represented by their first, middle, and last names. People are linked to **Organizations** using the **Affiliations** entity. People can be affiliated with one or more Organizations, but a person does not have to be affiliated with an Organization to perform an Action. However, all Actions must be performed by at least one person. The following describe how a Person is affiliated with an Action:

### In the Case that a Person is a Member of an Organization ###
1. A person is created in the **People** entity.
2. An Affiliation is created in the **Affiliations** entity that associates the Person with the Organization. The Affiliation includes a beginning and ending date, and the Person's contact information at the Organization is also included with the Affiliation. A Person can also be designated as an Organization's primary contact in the Affiliations entity.
3. The Affiliation is associated with an Action via the **ActionBy** entity. Multiple Affiliations (People/Organization combinations) can be associated with an Action, but at least one Affiliation is required.

NOTE:  Secondary contact information for a person can be added as an ExtensionProperty to the Affiliations entity.  See the ODM2ExtensionProperties schema.

### In the Case that a Person is not a Member of an Organization ###
1. A person is created in the **People** entity.
2. An Affiliation is created in the **Affiliations** entity. The Person's contact information is entered, but no Organization is linked.
3. As above, the Affiliation is associated with an Action via the **ActionBy** entity.

### Roles and Action Leadership ###
Each Person affiliated with an Action can play a role, as specified by the **RoleDescription** in the **ActionBy** entity.  Additionally, a single person can be designated as the leader of a particular Action in the **ActionBy** entity. Roles specify the part that a Person plays in performing an Action. It is not required to specify a role for a person that participates in an Action. The description of a role is created by the user and is not subject to a controlled vocabulary. Examples of roles that might be useful in implementing ODM2 instances include:

* **Observer** - specifies that the person is the one that made the observation
* **Participant** - specifies that the person was a participant
* **Analyst** - specifies that the person was the analyst that operated the instrument associated with the Action
* **Sample collector** - specifies that the person was the one that collected a sample
* Etc.
