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

docker run --rm -d --name skywalking --hostname skywalking -v $(current_directory $0)/conf/application.yml:/skywalking/config/application.yml -p 8080:8080 debian-skywalking &>/dev/null

connect_to_image skywalking