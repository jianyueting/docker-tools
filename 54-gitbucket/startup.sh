#!/usr/bin/env bash

java -jar /gitbucket.war --gitbucket.home=/data &>/gitbucket.log &

tail -f /dev/null