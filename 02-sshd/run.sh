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

remove_image sshd

docker run -d --name sshd -p 22:22 debian-sshd &>/dev/null

connect_to_image sshd