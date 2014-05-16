ODM2 Concepts: Controlled Vocabularies
============================
We are currently developing approaches and mechanisms regarding the use of controlled vocabularies (CV's) in ODM2. Similar to the approach used in ODM1, the validity of vocabulary terms will be assessed internally within an ODM2 database against a listing found in thetable [ODM2CV.CVTerms](http://uchic.github.io/ODM2/schemas/ODM2_Current/tables/ODM2CV_CVTerms.html), found within the [CV extension](http://uchic.github.io/ODM2/schemas/ODM2_Current/diagrams/ODM2CV.html).

## Vocabulary web hosting and access on MMI ##

The ODM2 team has explored options for external hosting of web-accessible vocabularies. After initial discussions and tests carried out during the March 2014 workshop at Logan, UT, the decision for the initial path forward was to use the [MMI ORR (Marine Metadata Interoperability Ontology Registry and Repository)](http://mmisw.org/). MMI ORR includes convenient vocabulary and vocabulary mapping management capabilities, and ontology and vocabulary term URI resolvers that are both user (human) and machine friendly.

* Listing of all the ODM2 test CV's created on MMI, stored under the "odm2test" authority: http://mmisw.org/ont/odm2test. As of May 9, 2014, there's only one test vocabulary. More will come soon.
* The test ODM2 vocabulary is called "actiontype"
  * User-friendly, readable HTML access: http://mmisw.org/ont/odm2test/actiontype
  * RDF access: http://mmisw.org/ont?uri=http://mmisw.org/ont/odm2test/actiontype&form=rdf
* Sample term access via URL's (_note that the term portion of the URL is case sensitive_)
  * User-friendly, readable HTML: http://mmisw.org/ont/odm2test/actiontype/ObservationAct
  * Programmatically accessible responses are available by adding an extension to the user-friendly term URL:
    * RDF:  http://mmisw.org/ont/odm2test/actiontype/ObservationAct.rdf
    * JSON: http://mmisw.org/ont/odm2test/actiontype/ObservationAct.json
* Vocabulary mappings: [IPython notebook illustrating the use of a SPARQL query on MMI to obtain terms from one vocabulary of finely resolved terms (eg, nitrate) by querying another vocabulary of broader terms (eg, nutrients)](http://nbviewer.ipython.org/gist/emiliom/9843a515c7a524931467/SPARQLWrapper_MMI_IOOSParameterVocabTerm.ipynb). See specially the simpler section at the bottom, under the heading "Narrow Match of IOOS Parameter Vocabulary terms from IOOS Core Variable dissolved_nutrients term"
 

### MMI ORR ###

#### General resources and guidelines ####

The MMI system we're using is the [MMI ORR (MMI Ontology Registry and Repository)](http://mmisw.org/). Note that an "ontology" can be iether a _vocabulary_ (a list of terms) or a _mapping_ (a mapping of terms across vocabularies). MMI ORR can store both and provides similar capabilities for accessing and managing both. MMI has a lof of useful and detailed stand-alone documentation. But beware that most of it may be somewhat out of date. Most of it was last updated in 2009. I suspect that most of the incremental enhancements applied to the MMI ORR software since are not reflected in those documents.
* Some useful MMI ORR documents (but note the caveat above about documents possibly not being up-to-date):
  * [MMI Ontology Registry and Repository User Manual](https://marinemetadata.org/mmiorrusrman/)
  * [Registering Your Existing Ontology](https://marinemetadata.org/mmiorrusrman/registerexisting)
  * [Working with Mappings](https://marinemetadata.org/mmiorrusrman/mmiorrmapps)
  * [The Best Parameter Vocabulary (blog post from John Graybeal)](https://marinemetadata.org/blogs/graybeal/the-best-parameter-vocabulary)
* [MMI ORR ontology browser](http://mmisw.org/orr/#b). Provides browsing by ontology type (vocabulary vs mapping) or by authority. However, beware that there's some ambiguity about how/when an ontology is formally defined as a mapping ontology, such that some ontologies listed as vocabulary are actually mapping!
* Here's a helpful recommendation about _authority names_, from the MMI ORR User Manual: "The authority abbreviation should be short but descriptive; it is possible for one organization to have multiple authority names (e.g., mmi, mmitest, mmidev), but a profusion of authority names is discouraged (familiarity is more important than uniqueness). Organizations that will be submitting a lot of overlapping ontologies should consider using authority names to provide namespace separation."
* The MMI ORR software is apparently available on github at https://github.com/mmisw/orr-ont


#### Creating new vocabularies or updating existing ones ####

_These guidelines correspond to the general workflow we've defined for ODM2, which involves an initial "manual" creation of terms and their definitions on simple spreadsheets (say, on Google Docs)._ 

1. __Create the new vocabulary.__ Before loading terms and their attributes, the "empty" vocabulary should be created. That means creating all the vocabulary-level metadata (authority, vocabulary name, etc), including defining the set of attributes available for each term (eg, term, name, definition). For now we've only talked about creating this metadata manually via the MMI UI form. An alternative is to fill out a template in RDF, then create the vocabulary by loading this template. [See the RDF for the existing test ODM2 vocabulary for an example.](http://mmisw.org/ont?form=rdf&uri=http://mmisw.org/ont/odm2test/actiontype)
2. __Load the "csv" table of terms and their attributes.__ Note that how to do this is __NOT__ at all obvious or intuitive! But once you know how, it's very easy.
 1. Once you're signed in, go to the vocabulary page
 2. Click on Edit New Version
 3. In the pop-up that comes up, click "Ok" (ie, "Do you want to do in-place editing of the contents of the ontology?"). _This statement is counter-intuitive and misleading_, I think, but so be it. Now you're in Edit mode for in-place editing.
 4. Go to the bottom, under the "Contents" listing that shows the table of terms. Click on the down-arrow icon on the first column (to the left) of the first header row, and select the "Import" option.
 5. What to do from there should be self-explanatory.
 6. To do batch updates (edits, deletes, inserts) to terms in an existing vocabulary, here's the workflow I've found easiest and least error prone: first "Export" the existing terms to csv (delimited ascii text); Follow the steps above to "d", but select "Export" instead of "Import". Then copy the "csv" term listing that is presented in the pop up, and paste it on your local computer (to a file, to an open text editor session, whatever). Do all the edits locally on your computer. Then follow the csv import instructions listed above, and do a copy-paste from your new, local version.
