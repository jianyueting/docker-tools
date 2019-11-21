#!/usr/bin/env bash

#当前目录
function current_directory(){
    file=${1}
    dir=$(dirname ${file})
    echo $(realpath ${dir})
}
#父目录
function parent_directory(){
    file=${1}
    dir=$(dirname ${file})/..
    echo $(realpath ${dir})
}

source $(parent_directory $0)/base-functions.sh

num=2
#base=$(pwd)
base="/tmp"
create_network hdfs

for i in $(seq 1 ${num});do
    echo "Start hdfs datanode${i} ..."
    mkdir -p ${base}/data-${i} &>/dev/null
    remove_image hdfs-datanode${i}
    docker run -d --rm --net=hdfs -v ${base}/data-${i}:/data --name hdfs-datanode${i} --hostname hdfs-datanode${i} debian-hdfs &>/dev/null
done

echo "Start hadoop namenode ..."

mkdir -p ${base}/name &>/dev/null
remove_image hdfs-namenode
docker run --rm -d --net=hdfs -v ${base}/name:/data \
    -p 9000:9000 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -p 50090:50090 -p 14000:14000 \
    -p 8030:8030 -p 8031:8031 -p 8032:8032 -p 8033:8033 -p 8040:8040 -p 8042:8042  -p 8088:8088\
    -p 19888:19888 \
    --name hdfs-namenode --hostname hdfs-namenode debian-hdfs &>/dev/null

connect_to_image hdfs-namenode
