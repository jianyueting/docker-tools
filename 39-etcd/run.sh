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

base=/tmp
data_dir=${base}/etcd.data
mkdir -p ${data_dir}

source $(parent_directory $0)/base-functions.sh

docker run -d --rm --name etcd -v ${data_dir}:/data -p 2379:2379 -p 2380:2380 jm-etcd

connect_to_image etcd