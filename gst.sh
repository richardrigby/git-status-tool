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
    res=$(git status)
    expected="On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working tree clean"

    if [[ $res =~ $expected ]]; then
        echo -e "\e[34m$res\e[0m"
    else
        echo -e "\e[91m$res\e[0m"
    fi
    echo "###############  COMPLETE  ##############"
    echo ""
    echo ""
    cd ../
done
