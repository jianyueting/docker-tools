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

create_network redis

remove_image nginx_lua
#直接将lua-server映射到sites-enabled中
docker run --rm -d  --net redis -v $(current_directory $0)/data:/data -v $(current_directory $0)/conf:/etc/nginx/sites-enabled -p 80:80 --hostname nginx-lua --name nginx-lua jm-nginx-lua

connect_to_image nginx-lua
