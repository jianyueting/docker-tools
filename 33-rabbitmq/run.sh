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

remove_image rabbitmq
docker run --rm -d -p 5672:5672 -p 15672:15672 --name rabbitmq jm-rabbitmq &>/dev/null
connect_to_image rabbitmq
