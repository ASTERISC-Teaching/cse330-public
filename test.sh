#!/bin/bash -e

if [ ! $# -eq 1 ]
  then
    echo "Usage: ./test.sh <test[0-9]>"
    echo "  example: ./test.sh test0"
fi

pushd memalloc
    make remove || true
    make && make install
popd 

pushd testcases
    gcc $1.c -o $1
    sudo ./$1
popd