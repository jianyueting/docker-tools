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

create_network consul
for i in $(seq 1 3);do
    mkdir -p ${base}/consul${i} &>/dev/null
    remove_image consul${i}
    docker run --rm --network consul -v ${base}/consul${i}:/data -d -p 850${i}:8500 -p 860${i}:8600 --hostname consul${i} --name consul${i} jm-consul-cluster &>/dev/null
done

connect_to_image consul1