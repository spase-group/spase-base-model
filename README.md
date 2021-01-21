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

Schema:<br>
   Version: Release version of the model<br>
   Since: Initial version of the model this term was introduced.<br>
   Type: The name given to the type<br>
   Description: A description of the item.
   
**dictionary.tab**

The definition of terms in the model vocabulary. Term names must be unique.

Schema:<br>
   Version: Release version of the model<br>
   Since: Initial version of the model this term was introduced.<br>
   Term: The name for the term.<br>
   Type: The data type of the term.<br>
   List: The name of an enumerated list, used when type is "Enumeration"<br>
   Elements: 
   Attributes:   Additional aspects of the term. These are analogous to attirbutes in XML elements. Rarely used.<br>
   Description: A definition of term.
   

**list.tab**

The definition of enumeration lists.

Schema:<br>
   Version: Release version of the model<br>
   Since: Initial version of the model this term was introduced.<br>
   Name: The name for the item.<br>
   Type: The classification of the kind of list. Allowed values are "Closed" for lists with a defined set of members and "Union" which have a combination of members from two or more other enumerations.<br>
   Referenc: A comma separated list of enumeration list names. Names must include a namespace prefix. For example, "spase:Region" refers to the "Region" list in the "spase" namespace.
   Description: A description of the item.

**member.tab**

The definition of members of a enumeration lists.

Schema:<br>
   Version: Release version of the model<br>
   Since: Initial version of the model this term was introduced.<br>
   List: The name of the list the item is a member of.<br>
   Item: The name of the term which is a member of the list. The term must be definition in the dictionary.

**ontology.tab**

The hierarchial organization of the dictionary terms.

Schema:<br>
   Version: Release version of the model<br>
   Since: Initial version of the model this term was introduced.<br>
   Object: The name of the grouping of terms.<br>
   Element: The name of a member of the group. This can be a dictionary term or the name of defined object.<br>
   Order: The appearance order of the element in the group. The first element is "1".
   Occurrence: The number of times the element is allowed to appear in the group. Allowed values are: "0" for an optional element, "1" for a required element that can appear only once, "*" for an element that can appear any number of times and "+" for an element that must be present, but can appear any number of times.<br>
   Group: The name of super group for the object. A super group allows any member object to appear. For example, in the "Spase" group any of the resource type groups may appear.<br>
   Type: The inherited type for the group or element. Used when defining an extension to the another specification. For example, the simulation extensions use many of the terms and objects defined in the base SPASE information model.<br>
   
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

