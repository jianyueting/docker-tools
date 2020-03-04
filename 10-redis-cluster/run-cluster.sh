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

create_network redis

for id in $(seq 2 6);do
    mkdir -p ${base}/redis-data${id} &>/dev/null
    remove_image redis${id}
    docker run --rm -d -p 630${id}:6379 -v ${base}/redis-data${id}:/data -v $(current_directory $0)/redis.conf:/etc/redis.conf --net redis \
        --hostname redis${id} --name redis${id} jm-redis-cluster &>/dev/null
done

mkdir -p ${base}/redis-data1 &>/dev/null
remove_image redis1
docker run --rm -d -p 6301:6379 -v ${base}/redis-data1:/data -v $(current_directory $0)/redis.conf:/etc/redis.conf --net redis --hostname redis1 --name redis1 jm-redis-cluster &>/dev/null

connect_to_image redis1