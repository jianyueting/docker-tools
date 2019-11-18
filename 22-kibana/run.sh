#!/usr/bin/env bash

source ../base-functions.sh
docker run -d --name kibana --rm -v $(pwd):/etc/kibana debian-kibana

connect_to_image kibana
