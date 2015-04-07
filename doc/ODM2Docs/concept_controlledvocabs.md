ODM2 Concepts: Controlled Vocabularies
============================
We have explored several approaches and mechanisms regarding the use of controlled vocabularies (CVs) in ODM2. Similar to the approach used in ODM1, the validity of vocabulary terms will be assessed internally within an ODM2 database against a listing found in a CV table corresponding to each vocabulary. CV tables are found within the [CV extension](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2CV.html).

## Vocabulary Web Hosting and Access ##

After initial discussions and tests carried out during the March 2014 ODM2 workshop in Logan, UT, the decision for the initial path forward was to use the [MMI ORR (Marine Metadata Interoperability Ontology Registry and Repository)](http://mmisw.org/). MMI ORR includes convenient vocabulary and vocabulary mapping management capabilities, and ontology and vocabulary term URI resolvers that are both user (human) and machine friendly. 

However, MMI doesn't yet offer the community vocabulary moderation system we wanted initially for ODM2 (especially in support of the Critical Zone Observatory Information Managers). So, we decided that we needed an initial repository and registry where ODM2 users could access the existing CV terms, request modifications to existing terms, and suggest new terms. We also wanted to maintain the moderation system that we built with the ODM1 CV system. While we have not ruled out a future partnership with MMI, ODM2 CVs are currently hosted at:

http://vocabulary.odm2.org

At this website, you can view the list of vocabularies, view the terms in each vocabulary, and view the details of each individual term. Change requests for either new terms or modifications to existing terms can also be made on this website.

As a new feature of the ODM2 CV website, all vocabularies and terms are accessible via individual URLs (e.g., http://vocabulary.odm2.org/actiontype/ to access the ActionTypeCV and http://vocabulary.odm2.org/actiontype/observation/ to access the descrption of an individual term. Additionally, to improve the interoperability of the ODM2 vocabularies, they have been exposed in RDF/XML format via a RESTful API using Simple Knowledge Organization System (SKOS) encoding. For example:

http://vocabulary.odm2.org/api/v1/actiontype/?format=skos - Returns an RDF/XML document containing the ActionTypeCV

http://vocabulary.odm2.org/api/v1/actiontype/observation/?format=skos - Returns an RDF/XML document containing an individual term within the ActionTypeCV

The URL patterns for all other CVs is similar.