#!/usr/bin/env bash

/rocketmq/bin/mqnamesrv &
echo "
autoCreateTopicEnable = true
namesrvAddr = 127.0.0.1:9876
" >>/rocketmq/conf/broker.conf
#解决broker启动问题
sed -i 's/8g/2g/g' /rocketmq/bin/runbroker.sh
sed -i 's/4g/1g/g' /rocketmq/bin/runbroker.sh
/rocketmq/bin/mqbroker -c /rocketmq/conf/broker.conf &

tail -f /dev/null