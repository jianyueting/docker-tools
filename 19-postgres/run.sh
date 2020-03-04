#!/usr/bin/env bash

#当前目录
function current_directory(){
    file=${1}
    dir=$(dirname ${file})
    echo $(realpath ${dir})
}
#父目录
function parent_directory(){
    file=${1}
    dir=$(dirname ${file})/..
    echo $(realpath ${dir})
}

source $(parent_directory $0)/base-functions.sh

docker run -d --rm --name postgres -p 5432:5432 -v $(current_directory ${0})/postgresql.conf:/postgresql.conf jm-postgres

connect_to_image postgres