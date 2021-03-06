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
#base=$(pwd)
base=/tmp

mkdir -p ${base}/kafka-data &>/dev/null
docker run -d --name kafka --rm -v ${base}/kafka-data:/data -p 9092:9092 jm-kafka &>/dev/null

connect_to_image kafka
