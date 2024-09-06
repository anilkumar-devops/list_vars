#!/bin/bash
#echo "$ALLMYVARS" ${s:1:-1}
echo "${ALLMYVARS:1:-1}" | sed "s/\"//g" | sed 's/,$//' > Tempfile
cat Tempfile
for var in `cat Tempfile`
do
  echo "$var"
  var_name=`echo "$var" | awk -F: '{print $1}'`
  var_value=`echo "$var" | awk '-F: ' '{print $2}'`
  echo "newvar=$($var_name)"
  sed -i 's/${name}/$value/g' test.tomb
  sed -i 's/${{ name }}/$value/g' test.tomb
done
# cat output1.txt
# cat output2.txt
