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
config_file=$(pwd)/cluster.conf
#base=$(pwd)
base=/tmp

create_network nacos

#启动nacos集群
for i in $(seq 1 3);do
    mkdir ${base}/nacos-data${i} &>/dev/null
    remove_image nacos${i}
    docker run --rm -d --net nacos -p 884${i}:8848 -v ${config_file}:/nacos/conf/cluster.conf -v ${base}/nacos-data${i}:/data --hostname nacos${i} --name nacos${i} debian-nacos-cluster &>/dev/null
done

connect_to_image nacos1