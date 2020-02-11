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

docker run -d --name kibana --net=elasticsearch --rm -v $(current_directory $0):/etc/kibana -p 5601:5601 debian-kibana

connect_to_image kibana
