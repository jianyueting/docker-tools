#!/usr/bin/env bash

echo never > /sys/kernel/mm/transparent_hugepage/enabled

redis-server /etc/redis.conf

if [ ${HOSTNAME} = "redis1" ];then
    /wait-for-it.sh redis6:6379 -- /create_cluster.sh
fi

tail -f /dev/null