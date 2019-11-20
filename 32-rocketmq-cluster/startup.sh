#!/usr/bin/env bash

#解决broker启动问题
sed -i 's/8g/2g/g' /rocketmq/bin/runbroker.sh
sed -i 's/4g/1g/g' /rocketmq/bin/runbroker.sh

if [ ${HOSTNAME} = "rocketmq-namesrv" ];then
    /rocketmq/bin/mqnamesrv &
elif [ ${NO_SLAVE} = "true" ];then #无slave模式
    if [ ${HOSTNAME} = "rocketmq-master1" ];then
        /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-noslave/broker-a.properties &
    elif [ ${HOSTNAME} = "rocketmq-master2" ];then
        /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-noslave/broker-b.properties &
    fi
elif [ ${NO_SLAE} = "false" ];then 
    if [ ${ASYNC_MODE} = "true" ];then #异步模式
        if [ ${HOSTNAME} = "rocketmq-master1" ];then
            /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-2s-async/broker-a.properties &
        elif [ ${HOSTNAME} = "rocketmq-master2" ];then
            /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-2s-async/broker-b.properties &
        elif [ ${HOSTNAME} = "rocketmq-slave1" ];then
            /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-2s-async/broker-a-s.properties &
        elif [ ${HOSTNAME} = "rocketmq-slave2" ];then
            /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-2s-async/broker-b-s.properties &
        fi
    elif [ ${ASYNC_MODE} = "false" ];then #同步模式
        if [ ${HOSTNAME} = "rocketmq-master1" ];then
            /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-2s-sync/broker-a.properties &
        elif [ ${HOSTNAME} = "rocketmq-master2" ];then
            /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-2s-sync/broker-b.properties &
        elif [ ${HOSTNAME} = "rocketmq-slave1" ];then
            /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-2s-sync/broker-a-s.properties &
        elif [ ${HOSTNAME} = "rocketmq-slave2" ];then
            /rocketmq/bin/mqbroker -n rocketmq-namesrv:9876 -c /rocketmq/conf/2m-2s-sync/broker-b-s.properties &
        fi
    fi
fi

tail -f /dev/null