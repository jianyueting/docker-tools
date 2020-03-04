#!/usr/bin/env bash

/wildfly/bin/standalone.sh &>/wildfly.log &

tail -f /dev/null