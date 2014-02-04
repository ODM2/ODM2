People
======

People are included in ODM2 so that observations and other types of Actions can be affiliated with the individual People that perform them. People are represented by thier first, middle, and last names. People are linked to Organizations using the Affiliations entity. People can be affiliated with one or more Organizations, but a person does not have to be affiliated with an Organization to perform an Action. However, all Actions must be performed by a person. The following describe how a Person is affiliated with an Action:

### In the Case that a Person is a Member of an Organization ###
1. A Person is created.
2. An Affiliation is created that associates the Person with the Organization. The Affiliation includes a beginning and ending date, and the Person's contact information at the Organization is also included with the Affiliation. A Person can also be designated as an Organization's primary contact in the Affiliations entity.
3. The Affiliation is associated with an Action via the ActionPeople entity. Multiple Affiliations (People/Organization combinations) can be associated with an Action, but at least one Affiliation is required.

### In the Cast that a Person is not a Member of an Organization ###
1. A person is created.
2. An Affiliation is created. The Person's contact information is entered, but no Organization is linked.
3. As above, the Affiliation is associated with an Action via the ActionPeople entity.

### Roles and Action Leaderhip ###
Each Person affiliated with an Action can play a Role, as specified by the Role in the ActionPeople entity.  Additionally, a single person can be designated as the leader of a particular Action in the ActionPeople entity.
