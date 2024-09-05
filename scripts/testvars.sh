#!/bin/bash
#echo "$ALLMYVARS" ${s:1:-1}
echo "${ALLMYVARS:1:-1}" | sed "s/\"//g" | sed 's/,$//' > Tempfile
cat Tempfile
for var in `cat Tempfile`
do
  name=`echo "$var" | awk -F: '{print $1}'`
  value=`echo "$var" | awk '-F: ' '{print $2}'`
  sed -i 's/${name}/$value/g' test.tomb
  sed -i 's/${{ name }}/$value/g' test.tomb
done
# cat output1.txt
# cat output2.txt
