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

#docker run -d --rm --name nacos -p 8848:8848 -v ${base}/nacos-data:/data -v $(current_directory)/conf/application.properties:/nacos/conf/application.properties jm-nacos &>/dev/null

docker run -d --rm --name nacos -p 8848:8848 -v ${base}/nacos-data:/data jm-nacos &>/dev/null

connect_to_image nacos
