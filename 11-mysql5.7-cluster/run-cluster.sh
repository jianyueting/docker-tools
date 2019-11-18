#!/usr/bin/env bash

source ../base-functions.sh

base=/tmp

create_network mysql

mkdir -p ${base}/mysql-data2 &>/dev/null
remove_image mysql-2
docker run --rm -d --net mysql -v ${base}/mysql-data2:/data --hostname mysql-2 --name mysql-2 debian-mysql5.7-cluster &>/dev/null

mkdir -p ${base}/mysql-data1 &>/dev/null
remove_image mysql-1
docker run --rm -d --net mysql -p 3306:3306 -v ${base}/mysql-data1:/data --hostname mysql-1 --name mysql-1 debian-mysql5.7-cluster &>/dev/null

connect_to_image mysql-1
