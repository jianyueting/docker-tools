#!/usr/bin/env bash

mkdir /data/{logs,pd,tikv} -p &>/dev/null

/tidb/bin/pd-server --data-dir=/data/pd --log-file=/data/logs/pd.log &
/tidb/bin/tikv-server --pd="127.0.0.1:2379" --data-dir=/data/tikv --log-file=/data/logs/tikv.log &
/tidb/bin/tidb-server --store=tikv --path="127.0.0.1:2379" --log-file=/data/logs/tidb.log &

tail -f /dev/null