#!/usr/bin/env bash

docker run -d --name kibana --rm -v $(pwd):/etc/kibana debian-kibana

docker exec -it kibana bash