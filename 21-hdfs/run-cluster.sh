#!/usr/bin/env bash

num=2
#base=$(pwd)
base="/tmp"
docker network ls | grep -q hdfs || (echo "create network hdfs" && docker network create hdfs) 

for i in $(seq 1 ${num});do
    echo "Start hdfs datanode${i} ..."
    mkdir -p ${base}/data-${i} &>/dev/null
    docker rm -f hdfs-datanode${i} &>/dev/null
    docker run -d --rm --net=hdfs -v ${base}/data-${i}:/data --name hdfs-datanode${i} --hostname hdfs-datanode${i} debian-hdfs &>/dev/null
done

echo "Start hadoop namenode ..."

docker rm -f hdfs-namenode &>/dev/null
mkdir -p ${base}/name &>/dev/null
docker run --rm -d --net=hdfs -v ${base}/name:/data \
    -p 9000:9000 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -p 50090:50090 -p 14000:14000 \
    -p 8030:8030 -p 8031:8031 -p 8032:8032 -p 8033:8033 -p 8040:8040 -p 8042:8042  -p 8088:8088\
    -p 19888:19888 \
    --name hdfs-namenode --hostname hdfs-namenode debian-hdfs &>/dev/null

docker exec -it hdfs-namenode bash
