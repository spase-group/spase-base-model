#!/bin/bash
# Get specification for a version of the model as a set of tables.
# The output should be equivalent to the tables that were originally loaded.
#
# Arguments
# $1 : version of the spec. (default: 2.3.1)
# $2 : database file name. (default: spase-base-model.db)

version=${1:-2.3.1}
db=${2:-spase-base-model.db}

mkdir spase-base-$version

sqlite3 -header $db "select * from dictionary where version='$version';" > temp.tab
cat temp.tab | tr '|' '\t' > spase-base-$version/dictionary.tab
sqlite3 -header $db "select * from list where version='$version';" > temp.tab
cat temp.tab | tr '|' '\t' > spase-base-$version/list.tab
sqlite3 -header $db "select * from member where version='$version';" > temp.tab
cat temp.tab | tr '|' '\t' > spase-base-$version/member.tab
sqlite3 -header $db "select * from ontology where version='$version';" > temp.tab
cat temp.tab | tr '|' '\t' > spase-base-$version/ontology.tab
sqlite3 -header $db "select * from type where version='$version';" > temp.tab
cat temp.tab | tr '|' '\t' > spase-base-$version/type.tab

rm temp.tab