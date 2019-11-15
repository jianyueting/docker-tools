#!/usr/bin/env bash

base=/tmp
data_dir=${base}/mysql-data

mkdir -p ${data_dir} &>/dev/null
docker rm mysql-server &>/dev/null
docker run --rm -d -p 3306:3306 -v ${data_dir}:/data --name mysql-server debian-mysql5.7 &>/dev/null

docker exec -it mysql-server bash