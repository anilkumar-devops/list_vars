#!/bin/bash
#echo "$ALLMYVARS" ${s:1:-1}
echo "${ALLMYVARS:1:-1}" | sed "s/\"//g" | sed 's/,$//' | sed '/^[[:space:]]*$/d' > Tempfile
head -2 Tempfile
wc -l Tempfile
#for var in `cat Tempfile`;
#do
  #echo "$var"
  #var_name=`echo "$var" | awk -F: '{print $1}'`
  #var_value=`echo "$var" | awk '-F: ' '{print $2}'`
  #echo "newvar=$($var_name)"
  #sed -i 's/${name}/$value/g' test.tomb
  #sed -i 's/${{ name }}/$value/g' test.tomb
#done
while read line
do
    printf "%s\n" "$line"
done < "Tempfile"
# cat output1.txt
# cat output2.txt
