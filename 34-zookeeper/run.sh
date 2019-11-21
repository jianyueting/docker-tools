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

remove_image zookeeper
mkdir ${base}/zookeeper-data
docker run --rm -d --name zookeeper -v ${base}/zookeeper-data:/data -p 2181:2181 debian-zookeeper &>/dev/null
connect_to_image zookeeper
