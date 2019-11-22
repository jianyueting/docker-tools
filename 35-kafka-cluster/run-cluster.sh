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

create_network kafka

for i in $(seq 1 3);do
    remove_image kafka${i}
    mkdir -p ${base}/kafka-data${i} &>/dev/null
    docker run -d --network kafka --name kafka${i} --hostname kafka${i} --rm -v ${base}/kafka-data${i}:/data -p 909${i}:9092 debian-kafka-cluster &>/dev/null
done

connect_to_image kafka1
