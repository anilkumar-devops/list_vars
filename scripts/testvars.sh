#!/bin/bash
#echo "$ALLMYVARS" ${s:1:-1}
echo "${ALLMYVARS:1:-1}" | sed "s/\"//g" | sed 's/,$//' > Tempfile
for var in `cat Tempfile`
do
  name=`echo "$var" | awk -F: '{print $1}'`
  value=`echo "$var" | awk '-F: ' '{print $2}'`
  echo $name
  echo $value
  #sed 's/${$name}/$value/g' test.tomb >> outuput1.txt
  #sed 's/${{ $name }}/$value/g' test.tomb >> output2.txt
done
# cat output1.txt
# cat output2.txt
