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

create_network rocketmq

export NO_SLAVE="true"

mkdir -p ${base}/mq-data-namesrv &>/dev/null
remove_image rocketmq-namesrv
docker run --rm -d -v ${base}/mq-data-namesrv:/data -p 9876:9876 --name rocketmq-namesrv --hostname rocketmq-namesrv jm-rocketmq-cluster &>/dev/null

mkdir -p ${base}/mq-data-master1 &>/dev/null
remove_image rocketmq-master1
docker run --rm -d -v ${base}/mq-data-master1:/data --name rocketmq-master1 --hostname rocketmq-master1 jm-rocketmq-cluster &>/dev/null

mkdir -p ${base}/mq-data-master2 &>/dev/null
remove_image rocketmq-master2
docker run --rm -d -v ${base}/mq-data-master2:/data --name rocketmq-master2 --hostname rocketmq-master2 jm-rocketmq-cluster &>/dev/null

connect_to_image rocketmq-namesrv