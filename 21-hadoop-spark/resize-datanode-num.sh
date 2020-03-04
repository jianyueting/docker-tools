#!/usr/bin/env bash

if [ $# -ne 1 ];then
    echo "修改datanode\n用法:"
    echo "$0 <num>"
    exit 127
fi

n=${1}
:>spark/slaves
:>hadoop/slaves
echo "spark-namenode" >>spark/slaves
for i in $(seq 1 ${n});do
    echo spark-datanode${i} >>spark/slaves
    echo spark-datanode${i} >>hadoop/slaves
done

sed -i "/^num=/d;17anum=${n}" run-cluster.sh

docker rmi jm-hadoop-spark &>/dev/null
docker build . -t jm-hadoop-spark
