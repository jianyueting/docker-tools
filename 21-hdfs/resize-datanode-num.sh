#!/usr/bin/env bash

if [ $# -ne 1 ];then
    echo "修改datanode\n用法:"
    echo "$0 <num>"
    exit 127
fi

n=${1}
:>hadoop/slaves
for i in $(seq 1 ${n});do
    echo hdfs-datanode${i} >>hadoop/slaves
done

sed -i "/^num=/d;17anum=${n}" run-cluster.sh

docker rmi jm-hdfs &>/dev/null
docker build . -t jm-hdfs
