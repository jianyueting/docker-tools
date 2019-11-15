#!/usr/bin/env bash

if [ $# -ne 1 ];then
    echo "修改datanode\n用法:"
    echo "$0 <num>"
    exit 127
fi

n=${1}
:>spark/slaves
:>hadoop/slaves
echo "hadoop-namenode" >>spark/slaves
for i in $(seq 1 ${n});do
    echo hadoop-datanode${i} >>spark/slaves
    echo hadoop-datanode${i} >>hadoop/slaves
done

sed -i "/^num=/d;2anum=${n}" run-cluster.sh

docker rmi debian-hadoop-spark-hive &>/dev/null
docker build . -t debian-hadoop-spark-hive
