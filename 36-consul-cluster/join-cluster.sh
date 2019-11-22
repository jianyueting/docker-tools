#!/usr/bin/env bash

#同时加入集群节点，后一个可能不成功，有个不同的时间隔
random=$(expr $(echo $RANDOM) % 3)
sleep ${random}

/consul join consul1 &