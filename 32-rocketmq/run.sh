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

mkdir -p ${base}/mq-data &>/dev/null
remove_image rocketmq
docker run --rm -d -v ${base}/mq-data:/data -p 9876:9876 --name rocketmq --hostname rocketmq debian-rocketmq &>/dev/null

connect_to_image rocketmq