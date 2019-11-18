#!/usr/bin/env bash

source ../base-functions.sh

echo "start logstash ..."
docker run --rm -d  -v $(pwd):/etc/logstash/conf.d -p 4560:4560 --name logstash debian-logstash &>/dev/null

connect_to_image logstash
