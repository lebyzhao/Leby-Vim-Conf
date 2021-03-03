#!/bin/sh
# added by lebyzhao for vim cscope

CUR_PATH=`pwd`
echo -ne "create cscope out files for $CUR_PATH ...\n"

find ${CUR_PATH}/ -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.c" -o -name "*.inl"> cscope.files

cscope -bkq -i cscope.files
rm cscope.files

echo "make cscope done"
