#!/usr/bin/env bash

ip=$(ifconfig |grep -v 127|grep inet|awk '{print $2}')

etcd --data-dir /data --listen-client-urls http://0.0.0.0:2379 --advertise-client-urls http://0.0.0.0:2379 --listen-peer-urls http://${ip}:2380 &>/etcd.log &

tail -f /dev/null