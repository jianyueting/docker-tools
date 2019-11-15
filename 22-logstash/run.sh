#!/usr/bin/env bash

echo "start logstash ..."
docker run --rm -d  -v $(pwd):/etc/logstash/conf.d -p 4560:4560 --name logstash debian-logstash &>/dev/null

docker exec -it logstash bash