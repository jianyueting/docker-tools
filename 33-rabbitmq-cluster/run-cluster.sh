#!/usr/bin/env bash

source ../base-functions.sh

create_network rabbitmq

remove_image rabbitmq1
docker run -d --rm -p 5672:5672 -p 15672:15672 --net rabbitmq --hostname rabbitmq1 --name rabbitmq1 debian-rabbitmq-cluster  &>/dev/null

# TODO 要更多image集群，复制下面命令行
remove_image rabbitmq2
#使用5673端口映射
docker run -d --rm -p 5673:5672 -p 15673:15672 --net rabbitmq --hostname rabbitmq2 --name rabbitmq2 debian-rabbitmq-cluster \
 /wait-for-it.sh rabbitmq1:5672 -- /join-cluster.sh &>/dev/null

connect_to_image rabbitmq1