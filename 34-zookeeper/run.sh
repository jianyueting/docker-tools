#!/usr/bin/env bash

source ../base-functions.sh
#base=$(pwd)
base=/tmp

remove_image zookeeper
mkdir ${base}/zookeeper-data
docker run --rm -d --name zookeeper -v ${base}/zookeeper-data:/data -p 2181:2181 debian-zookeeper &>/dev/null
connect_to_image zookeeper
