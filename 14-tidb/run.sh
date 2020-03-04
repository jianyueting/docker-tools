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

base=/tmp
data_dir=${base}/tidb-data

mkdir -p ${data_dir} &>/dev/null
remove_image tidb-server
docker run --rm -d -p 4000:4000 -v ${data_dir}:/data --name tidb-server jm-tidb &>/dev/null

connect_to_image tidb-server
