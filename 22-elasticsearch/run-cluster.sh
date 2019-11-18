#!/usr/bin/env bash

#base=$(pwd)
base=/tmp

docker network ls | grep -q elasticsearch || (echo "create network elasticsearch" && docker network create elasticsearch &>/dev/null)

echo "start node2"
mkdir -p ${base}/node2 &>/dev/null
docker rm elastic-node2 &>/dev/null
docker run --rm -d -v ${base}/node2:/var/lib/elasticsearch --net=elasticsearch --name=elastic-node2 --hostname=elastic-node2 debian-elasticsearch &>/dev/null

echo "start node3"
mkdir -p ${base}/node3 &>/dev/null
docker rm elastic-node3 &>/dev/null
docker run --rm -d -v ${base}/node3:/var/lib/elasticsearch --net=elasticsearch --name=elastic-node3 --hostname=elastic-node3 debian-elasticsearch &>/dev/null

echo "start node1"
mkdir -p ${base}/node1 &>/dev/null
docker rm elastic-node1 &>/dev/null
docker run --rm -d -v ${base}/node1:/var/lib/elasticsearch -p 9200:9200 -p 9300:9300 --net=elasticsearch --name=elastic-node1 --hostname=elastic-node1 debian-elasticsearch &>/dev/null

docker exec -it elastic-node1 bash
