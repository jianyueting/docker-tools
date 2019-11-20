#!/usr/bin/env bash

source ../base-functions.sh
#base=$(pwd)
base=/tmp

mkdir -p ${base}/mq-data &>/dev/null
remove_image rocketmq
docker run --rm -d -v ${base}/mq-data:/data -p 9876:9876 --name rocketmq --hostname rocketmq debian-rocketmq &>/dev/null

connect_to_image rocketmq