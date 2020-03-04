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

remove_image mongodb
mkdir -p ${base}/mongodb-data &>/dev/null
docker run -d --rm -v ${base}/mongodb-data:/data -p 27017:27017 --name mongodb jm-mongodb &>/dev/null

connect_to_image mongodb