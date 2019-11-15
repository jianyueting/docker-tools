#!/usr/bin/env bash

docker run -d --name kibana --rm debian-kibana

docker exec -it kibana bash