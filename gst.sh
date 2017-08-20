#!/bin/bash

if [ $# -eq 1 ]
then
    dir=$1"*/"
else
    dir="*/"
fi

for d in $dir ; do
    echo ""
    echo "#############  $(basename $d)  ############"
    echo "$d"
    cd "$d"
    git fetch
    echo ""
    git status
    echo "###############  COMPLETE  ##############"
    echo ""
    echo ""
    cd ../
done
