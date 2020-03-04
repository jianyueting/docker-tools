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

create_network git

base=/tmp
data_dir=${base}/gitbucket-repositories
mkdir -p ${data_dir} &>/dev/null

#docker run -d --rm --name gitbucket --network git --hostname gitbucket -p 8080:8080 -p 29418:29418 -v $(current_directory $0)/conf/database.conf:/data/database.conf -v ${data_dir}:/data/repositories jm-gitbucket

docker run -d --rm --name gitbucket --network git --hostname gitbucket -p 8080:8080 -p 29418:29418 -v ${data_dir}:/data/repositories  jm-gitbucket

connect_to_image gitbucket