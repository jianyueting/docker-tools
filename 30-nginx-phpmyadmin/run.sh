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

remove_image nginx-phpmyadmin
#直接将lua-server映射到sites-enabled中
docker run --rm -d -v $(current_directory $0)/conf:/etc/nginx/sites-enabled -p 80:80 --name nginx-phpmyadmin debian-nginx-phpmyadmin &>/dev/null

connect_to_image nginx-phpmyadmin
