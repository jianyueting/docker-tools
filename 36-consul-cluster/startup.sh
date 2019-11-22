#!/usr/bin/env bash

ip=$(ifconfig|grep -v 127|grep inet|awk '{print $2}')

/consul agent -server -bootstrap-expect 2 -data-dir=/data -node=${HOSTNAME} -bind=${ip} -client=0.0.0.0 -ui &

if [ ! ${HOSTNAME} = "consul1" ];then
    /wait-for-it.sh consul1:8500 -- /join-cluster.sh
fi

tail -f /dev/null