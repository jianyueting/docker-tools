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

mkdir -p "${base}/data" &>/dev/null

echo "start elk ..."
remove_image elk
docker run -d --name elk --hostname jm-elk \
    -v $(current_directory $0)/server.conf:/etc/logstash/conf.d/server.conf -v ${base}/data:/var/lib/elasticsearch \
    -p 4560:4560  -p 9200:9200 -p 9300:9300 -p 5601:5601 \
    jm-elk &>/dev/null

connect_to_image elk
