#!/bin/bash -f
base=${1:-.}

pushd $base
ok="OK"
i=0;
while IFS=$'\t' read -r -a input; do
   n=${#input[@]}	# number of fields
   i=$((i+1))		# Line number
   if [ $n -ne 5 ]; then
      echo "Line: $i: $n"
   fi
done < history.tab

popd