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

create_network mysql

mkdir -p ${base}/mysql-data2 &>/dev/null
remove_image mysql-2
docker run --rm -d --net mysql -v ${base}/mysql-data2:/data --hostname mysql-2 --name mysql-2 jm-mysql8.0-cluster &>/dev/null

mkdir -p ${base}/mysql-data1 &>/dev/null
remove_image mysql-1
docker run --rm -d --net mysql -p 3306:3306 -v ${base}/mysql-data1:/data --hostname mysql-1 --name mysql-1 jm-mysql8.0-cluster &>/dev/null

connect_to_image mysql-1
