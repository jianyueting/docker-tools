#!/usr/bin/env bash

java -jar /zipkin.jar -STORAGE_TYPE=mysql -MYSQL_DB=zipkin -MYSQL_USER=*** -MYSQL_PASS=*** -MYSQL_HOST=** -MYSQL_TCP_PORT=3306 &>/zipkin.log &

tail -f /dev/null