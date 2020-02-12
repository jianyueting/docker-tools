#!/usr/bin/env bash

java -jar /jenkins.war &>/jenkins.log

tail -f /dev/null