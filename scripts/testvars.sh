#!/bin/bash
#echo "$ALLMYVARS" ${s:1:-1}
echo "${ALLMYVARS:1:-1}" | sed "s/\"//g" | sed 's/,$//' | sed '/^[[:space:]]*$/d' > Tempfile
while read line
do
    printf "%s\n" "$line"
    var_name=`echo "$line" | awk -F: '{print $1}'`
    var_value=`echo "$line" | awk '-F: ' '{print $2}'`
    tempvar1=`echo "$var_name" | awk '{print "${"$0"}"}'`
    tempvar2=`echo "$var_name" | awk '{print "${{ "$0" }}"}'`
    sed -i "s,$tempvar1,$var_value,g" test.tomb
    sed -i "s,$tempvar2,$var_value,g" test.tomb
    head -5 test.tomb
done < "Tempfile"
