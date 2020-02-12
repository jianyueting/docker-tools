#!/usr/bin/env bash

java -jar /zipkin.jar &>/zipkin.log &

tail -f /dev/null