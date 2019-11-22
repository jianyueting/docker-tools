#!/usr/bin/env bash

mkdir /data/data /data/logs /data/work &>/dev/null
ln -s /data/data /nacos &>/dev/null
ln -s /data/logs /nacos &>/dev/null
ln -s /data/work /nacos &>/dev/null

#解决debian里默认使用dash出现的bug
bash /nacos/bin/startup.sh -m standalone &

tail -f /dev/null