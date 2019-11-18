#!/usr/bin/env bash

source ../base-functions.sh

remove_image activemq

docker run --rm -d -p 8161:8161 -p 61616:61616 -v $(pwd)/conf/jetty-realm.properties:/activemq/conf/jetty-realm.properties --name activemq --hostname activemq debian-activemq &>/dev/null

connect_to_image activemq