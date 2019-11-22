#!/usr/bin/env bash

/kafka/bin/zookeeper-server-start.sh -daemon /kafka/config/zookeeper.properties
/kafka/bin/kafka-server-start.sh /kafka/config/server.properties &

tail -f /dev/null