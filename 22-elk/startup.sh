#!/usr/bin/env bash

/etc/init.d/elasticsearch start
/etc/init.d/logstash start
/etc/init.d/kibana start

tail -f /dev/null