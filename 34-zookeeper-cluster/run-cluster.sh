#!/usr/bin/env bash

source ../base-functions.sh
#base=$(pwd)
base=/tmp

remove_image zookeeper-1
mkdir ${base}/zookeeper-data1
docker run --rm -d --name zookeeper-1 --hostname zookeeper-1 -v ${base}/zookeeper-data1:/data -p 2181:2181 debian-zookeeper-cluster &>/dev/null

remove_image zookeeper-2
mkdir ${base}/zookeeper-data2
docker run --rm -d --name zookeeper-2 --hostname zookeeper-2 -v ${base}/zookeeper-data2:/data -p 2182:2181 debian-zookeeper-cluster &>/dev/null

remove_image zookeeper-3
mkdir ${base}/zookeeper-data3
docker run --rm -d --name zookeeper-3 --hostname zookeeper-3 -v ${base}/zookeeper-data3:/data -p 2183:2181 debian-zookeeper-cluster &>/dev/null

connect_to_image zookeeper-1
