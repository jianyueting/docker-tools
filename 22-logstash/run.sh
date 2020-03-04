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

create_network elasticsearch

echo "start logstash ..."
docker run --rm -d  -v $(current_directory $0):/etc/logstash/conf.d -p 4560:4560 --net=elasticsearch --name logstash jm-logstash &>/dev/null

connect_to_image logstash
