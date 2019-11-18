#!/usr/bin/env bash

#根据名称创建docker网络
function create_network() {
    network=${1}
    docker network ls | grep -q ${network} || (echo "create network ${network}" && docker network create ${network} &>/dev/null)
}

#根据名称删除已经在运行的image
function remove_image() {
    image=${1}
    docker rm -f ${image} &>/dev/null   
}

#连接到指定名称的image
function connect_to_image() {
    image=${1}
    docker exec -it ${image} bash
}