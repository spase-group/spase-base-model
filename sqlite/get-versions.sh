#!/bin/bash
# Get the versions of the model in the passed sqlite3 database.
#
# Arguments
# $1 : database file name. (default: spase-base-model.db)

db=${1:-spase-base-model.db}

echo "Versions:"
sqlite3 $db "select distinct version from dictionary;"
