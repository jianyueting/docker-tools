#!/usr/bin/env bash

base=/tmp
data_dir=${base}/mysql-data

mkdir -p ${data_dir} &>/dev/null

docker run -d -p 3306:3306 -v ${data_dir}:/data debian-mysql5.7