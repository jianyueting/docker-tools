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
for i in 2 1;do
    mkdir -p ${base}/mysql-data${i} &>/dev/null
    remove_image mysql-${i}
    docker run --rm -d --net mysql -p $(expr 3305 + ${i}):3306 -v ${base}/mysql-data${i}:/data --hostname mysql-${i} --name mysql-${i} jm-mysql5.7-cluster &>/dev/null
done

connect_to_image mysql-1
