#!/usr/bin/env bash

num=2
#base=$(pwd)
base="/tmp"
docker network ls | grep -q spark || (echo "create network spark" && docker network create spark) 

for i in $(seq 1 ${num});do
    echo "Start hadoop datanode${i} ..."
    mkdir ${base}/data-${i} &>/dev/null
    docker rm -f spark-datanode${i} &>/dev/null
    docker run -d --rm --net=spark -v ${base}/data-${i}:/data --name spark-datanode${i} --hostname spark-datanode${i} debian-hadoop-spark &>/dev/null
done

echo "Start hadoop namenode ..."

docker rm -f spark-namenode &>/dev/null
mkdir ${base}/name &>/dev/null
docker run --rm -d --net=spark -v ${base}/name:/data \
    -p 8080:8080 -p 4040:4040 -p 7077:7077 -p 6066:6066\
    -p 50070:50070 -p 9000:9000 -p 50075:50075 -p 50090:50090 -p 14000:14000 -p 50020:50020 -p 50010:50010 \
    -p 8030:8030 -p 8031:8031 -p 8032:8032 -p 8033:8033 -p 8040:8040 -p 8042:8042  -p 8088:8088\
    -p 19888:19888 \
    --name spark-namenode --hostname spark-namenode debian-hadoop-spark &>/dev/null

docker exec -it spark-namenode bash
