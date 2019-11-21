#!/usr/bin/env bash

source ../base-functions.sh

base=/tmp
data_dir=${base}/redis-data

mkdir -p ${data_dir}
remove_image redis-server
docker run --rm -d -p 6379:6379 -v ${data_dir}:/data -v $(current_directory $0)/redis.conf:/etc/redis.conf --name redis-server debian-redis
connect_to_image redis-server
