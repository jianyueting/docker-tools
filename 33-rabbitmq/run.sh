#!/usr/bin/env bash

source ../base-functions.sh

remove_image rabbitmq
docker run --rm -d -p 5672:5672 -p 15672:15672 --name rabbitmq debian-rabbitmq &>/dev/null
connect_to_image rabbitmq
