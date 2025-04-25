# spase-base-model
Specification for the SPASE base information model.

## Specification Files

Each release version of the model has its own specification files that are stored in separte folders that have the release version in the folder name.
For example, the folder name for version 2.3.1 of the base SPASE information model is in the folder "spase-base-2.3.1"

The information model specification is divided into 5 distinct flat tables stored in files as tab delimited records. 

The files are:

**type.tab**

Data types used in the information model. Tools will translate these types into the appropriate type in the generated 
expressions. For example, a tool that generates a JSON expression of the model will translate "Numeric" type into a "var".

Schema:
| Name        | Description                                            |
| ----------- | ------------------------------------------------------ |
| Version     | Release version of the model.                          |
| Since       | Initial version of the model this term was introduced. |
| Type        |  The name given to the type                            |
| Description | A description of the item.                             |
   
**dictionary.tab**

The definition of terms in the model vocabulary. Term names must be unique.

Schema:
| Name        | Description                                            |
| ----------- | ------------------------------------------------------ |
| Version     | Release version of the model.                          |
| Since       | Initial version of the model this term was introduced. |
| Term        | The name for the term.                                 |
| Type        | The data type of the term.                             |
| List        | The name of an enumerated list, used when type is "Enumeration" |
| Elements    |                                                        |
| Attributes  | Additional aspects of the term. These are analogous to attirbutes in XML elements. Rarely used. |
| Description | A definition of term.                                  |
   

**list.tab**

The definition of enumeration lists.

Schema:
| Name        | Description                                            |
| ----------- | ------------------------------------------------------ |
| Version     | Release version of the model.                          |
| Since       | Initial version of the model this term was introduced. |
| Name        | The name for the item.                                 |
| Type        | The classification of the kind of list. Allowed values are "Closed" for lists with a defined set of members and "Union" which have a combination of members from two or more other enumerations. |
| Reference   | A comma separated list of enumeration list names. Names must include a namespace prefix. For example, "spase:Region" refers to the "Region" list in the "spase" namespace. |
| Description | A definition of term.                                  |

**member.tab**

The definition of members of a enumeration lists.

Schema:
| Name        | Description                                            |
| ----------- | ------------------------------------------------------ |
| Version     | Release version of the model.                          |
| Since       | Initial version of the model this term was introduced. |
| List        | The name of the list the item is a member of.          |
| Item        | The name of the term which is a member of the list. The term must be definition in the dictionary. |

**ontology.tab**

The hierarchial organization of the dictionary terms.

Schema:
| Name        | Description                                            |
| ----------- | ------------------------------------------------------ |
| Version     | Release version of the model.                          |
| Since       | Initial version of the model this term was introduced. |
| Object      | The name of the grouping of terms.                     |
| Element     | The name of a member of the group. This can be a dictionary term or the name of defined object. |
| Order       | The appearance order of the element in the group. The first element is "1". |
| Occurrence  | The number of times the element is allowed to appear in the group. Allowed values are: "0" for an optional element, "1" for a required element that can appear only once, "*" for an element that can appear any number of times and "+" for an element that must be present, but can appear any number of times. |
| Group       | The name of super group for the object. A super group allows any member object to appear. For example, in the "Spase" group any of the resource type groups may appear. |
| Type       | The inherited type for the group or element. Used when defining an extension to the another specification. For example, the simulation extensions use many of the terms and objects defined in the base SPASE information model. |
   
**history.tab**

Descriptions of changes to the schema.

Schema:
| Name        | Description                                              |
| ----------- | -------------------------------------------------------- |
| ID#         | Incremental identifier for the change.                   |
| Version     | Schema version where change occurred.                    |
| Updated     | Date of change.                                          |
| ChangedBy   | First initial and last name of person making the change. |
| Description | Description of change.                                   |
| Note        | Any contextual information.                              |
   
## Other Specification Files
Files used to create the PDF documentation are in the "template" folder of the information model. 

## Creating distribution
Using the spase-model-tools which can be installed with:

`npm install spase-model-tools -g`

**json**

`spase-model-json -b spase-base-2.3.2 -o ../model/spase-base-2.3.2.json`

**xsd**

`spase-model-xsd -d model/spase-base-2.3.2.json -o model/spase-base-2.3.2.xsd`

**pdf**

`spase-model-pdf -b spase-base-2.3.2/template -d ../../model/spase-base-2.3.2.json -o ../../model/spase-base-2.3.2.pdf`

In a development environment with tool source nearby:

**json**

`node ../../spase-model-tools-node/src/makejson.js -b spase-base-2.3.2 -o ../model/spase-base-2.3.2.json`

**xsd**

`node ../../spase-model-tools-node/src/makexsd.js -d model/spase-base-2.3.2.json -o model/spase-base-2.3.2.xsd`

**pdf**

`node ../../spase-model-tools-node/src/makepdf.js -b spase-base-2.3.2/template -d ../../model/spase-base-2.3.2.json -o ../../model/spase-base-2.3.2.pdf`

## Handy scripts

**build-all.sh**

Run with no options will build all versions of the data model in the current directory. Output is written in the "build" folder.

If a version number is given as the first option, it will build just that version number. 

If "draft" is given as the second option, a draft version of the model will be built.

Example: Build draft for version 2.5.0
```
bash build-all.sh 2.5.0 draft
```
