i=0;
while IFS=$'\t' read -r -a input; do
   n=${#input[@]}
   i=$((i+1))
   if [ $n -ne 6 ]; then
      echo "Line: $i: $n"
   fi
done < history.tab