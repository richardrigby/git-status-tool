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
    master="On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working tree clean"
    develop="On branch develop
Your branch is up-to-date with 'origin/develop'.
nothing to commit, working tree clean"

    if [[ $res =~ $master ]]; then
        echo -e "\e[34m$res\e[0m"
    elif [[ $res =~ $develop ]]; then
        echo -e "\e[32m$res\e[0m"
    else
        echo -e "\e[91m$res\e[0m"
    fi
    echo "###############  COMPLETE  ##############"
    echo ""
    echo ""
    cd ../
done
