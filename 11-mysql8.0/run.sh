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
data_dir=${base}/mysql-data

mkdir -p ${data_dir} &>/dev/null
remove_image mysql-server
docker run --rm -d -p 3306:3306 -v ${data_dir}:/data --name mysql-server debian-mysql8.0 &>/dev/null

connect_to_image mysql-server
