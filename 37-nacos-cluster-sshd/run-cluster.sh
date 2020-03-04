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

create_network nacos

#启动主从mysql
for i in 2 1;do
    mkdir -p ${base}/mysql-data${i} &>/dev/null
    remove_image mysql-${i}
    docker run --rm -d --net nacos -p $(expr 3305 + ${i}):3306 -v ${base}/mysql-data${i}:/data --hostname mysql-${i} --name mysql-${i} jm-mysql5.7-cluster &>/dev/null
done

#启动nacos集群
for i in $(seq 1 3);do
    mkdir ${base}/nacos-data${i} &>/dev/null
    remove_image nacos${i}
    docker run --rm -d --net nacos -p 884${i}:8848 -v ${base}/nacos-data${i}:/data --hostname nacos${i} --name nacos${i} jm-nacos-cluster-sshd &>/dev/null
done

connect_to_image nacos1