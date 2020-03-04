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

remove_image influxdb
mkdir -p ${base}/influxdb-data &>/dev/null
docker run --rm -d -p 8086:8086 -v ${base}/influxdb-data:/data --name influxdb jm-influxdb &>/dev/null

connect_to_image influxdb