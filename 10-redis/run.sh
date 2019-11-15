#!/usr/bin/env bash
#########################################################################
# File Name: run.sh
# Author: jeff
# mail: jeff_jian@126.com
# Created Time: Fri Nov 15 10:14:49 2019
#########################################################################

base=/tmp
data_dir=${base}/redis-data

mkdir -p ${data_dir}
docker rm redis-server &>/dev/null
docker run --rm -d -p 6379:6379 -v ${data_dir}:/data --name redis-server debian-redis
docker exec -it redis-server bash