#!/usr/bin/env bash

#直接使用机器名不能集群，下面计算ip地址
ip=$(ifconfig |grep -v 127|grep inet|awk '{print $2}')
net_pre=$(echo ${ip}|awk -F. '{print $1"."$2"."$3"."}')
net_suf=$(echo ${ip}|awk -F. '{print $4}')

for i in $(seq $(expr ${net_suf} - 6 + 1) ${net_suf});do
    s=$s" ${net_pre}${i}:6379"
done
echo ${s}

echo "yes"|/usr/bin/redis-cli --cluster create ${s} --cluster-replicas 1 
