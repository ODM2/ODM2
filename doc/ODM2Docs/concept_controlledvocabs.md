ODM2 Concepts: Controlled Vocabularies
============================
We are currently developing approaches and mechanisms regarding the use of controlled vocabularies (CV's) in ODM2. Similar to the approach used in ODM1, the validity of vocabulary terms will be assessed internally within an ODM2 database against a listing found in thetable [ODM2CV.CVTerms](http://uchic.github.io/ODM2/schemas/ODM2_Current/tables/ODM2CV_CVTerms.html), found within the [CV extension](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2CV.html).

## Vocabulary web hosting and access ##

Options for external hosting of web-accessible vocabularies are being explored. Current tests were initated during the March 2014 workshop at Logan, UT; they involve the use of the [MMI Ontology Registry and Repository](http://mmisw.org/), which includes and ontology and term URI resolver:

* Listing of all the ODM2 test CV's created on MMI, stored under the "odm2test" authority: http://mmisw.org/ont/odm2test
* Sample/test ODM2 CV
  * User-friendly, readable HTML: http://mmisw.org/ont/odm2test/actiontype
  * RDF: http://mmisw.org/ont?uri=http://mmisw.org/ont/odm2test/actiontype&form=rdf
* Sample term URL's
  * User-friendly, readable HTML: http://mmisw.org/ont/odm2test/actiontype/ObservationAct
  * Programmatically accessible responses are available by adding an extension to the user-friendly term URL:
    * RDF:  http://mmisw.org/ont/odm2test/actiontype/ObservationAct.rdf
    * JSON: http://mmisw.org/ont/odm2test/actiontype/ObservationAct.json
