ODM2 Core: Roles
================

Roles specify the part that a Person plays in performing an Action. It is not required to specify a Role for a person that participates in an Action. The description of a Role is created by the user and is not subject to a controlled vocabulary. Examples of roles that might be useful in implementing ODM2 instances include:

* **Observer** - specifies that the person is the one that made the observation
* **Participant** - specifies that the person was a participant
* **Analyst** - specifies that the person was the analyst that operated the instrument associated with the Action
* **Sample collector** - specifies that the person was the one that collected a sample
* Etc.

Leadership of an Action can be specified using the IsActionLead attribute in the ActionPeople entity rather than specifying a "Leader" role in the Roles entity.
