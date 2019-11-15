#!/usr/bin/env bash

#base=$(pwd)
base=/tmp

mkdir -p "${base}/data" &>/dev/null

echo "start elk ..."
docker rm elk &>/dev/null
docker run -d --name elk --hostname debian-elk \
    -v $(pwd):/etc/logstash/conf.d -v ${base}/data:/var/lib/elasticsearch \
    -p 4560:4560  -p 9200:9200 -p 9300:9300 -p 5601:5601 \
    debian-elk &>/dev/null

docker exec -it elk bash