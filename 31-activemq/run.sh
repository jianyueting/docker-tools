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

remove_image activemq

docker run --rm -d -p 8161:8161 -p 61616:61616 -v $(current_directory $0)/conf/jetty-realm.properties:/activemq/conf/jetty-realm.properties --name activemq --hostname activemq debian-activemq &>/dev/null

connect_to_image activemq