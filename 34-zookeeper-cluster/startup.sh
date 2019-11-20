#!/usr/bin/env bash

#生成myid文件
id=$(echo ${HOSTNAME}|sed 's/zookeeper-//')
echo ${id} >/data/myid

echo "
server.1=zookeeper-1:2888:3888
server.2=zookeeper-2:2888:3888
server.3=zookeeper-3:2888:3888
">>/zookeeper/conf/zoo.cfg

/zookeeper/bin/zkServer.sh start

tail -f /dev/null