#!/usr/bin/env bash

source ../base-functions.sh

base=/tmp
data_dir=${base}/mysql-data

mkdir -p ${data_dir} &>/dev/null
remove_image mysql-server
docker run --rm -d -p 3306:3306 -v ${data_dir}:/data --name mysql-server debian-mysql5.7 &>/dev/null

connect_to_image mysql-server
