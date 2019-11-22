#!/usr/bin/env bash

mkdir -p /data/zookeeper &>/dev/null
mkdir -p /data/zookeeper-logs &>/dev/null
mkdir -p /data/kafka-logs &>/dev/null

id=$(echo ${HOSTNAME}|sed 's/kafka//')
echo ${id} >/data/zookeeper/myid
echo "
dataLogDir=/data/zookeeper-logs
tickTime=2000
initLimit=10
syncLimit=5
server.1=kafka1:2888:3888
server.2=kafka2:2888:3888
server.3=kafka3:2888:3888
">>/kafka/config/zookeeper.properties
sed -i "/^broker.id/s/0/${id}/" /kafka/config/server.properties
sed -i "/^zookeeper.connect=/s/localhost:2181/kafka1:2181,kafka2:2181,kafka3:2181/" /kafka/config/server.properties

/kafka/bin/zookeeper-server-start.sh -daemon /kafka/config/zookeeper.properties
/kafka/bin/kafka-server-start.sh /kafka/config/server.properties &

tail -f /dev/null