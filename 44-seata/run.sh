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

#docker run -d --rm -p 8091:8091 -v $(current_directory $0)/conf/file.conf:/seata/conf/file.conf --name seata debian-seata 

docker run -d --rm -p 8091:8091 --name seata debian-seata 

connect_to_image seata