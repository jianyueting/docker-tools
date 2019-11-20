#!/usr/bin/env bash

mkdir -p /var/lib/rabbitmq &>/dev/null

scp rabbitmq1:/var/lib/rabbitmq/.erlang.cookie /var/lib/rabbitmq
chown rabbitmq\: /var/lib/rabbitmq/.erlang.cookie

/etc/init.d/rabbitmq-server start

rabbitmq-plugins enable rabbitmq_management

RABBITMQ_USER=${RABBITMQ_USER:-admin}
RABBITMQ_PASSWORD=${RABBITMQ_PASSWORD:-123456}

rabbitmqctl add_user ${RABBITMQ_USER} ${RABBITMQ_PASSWORD}
rabbitmqctl set_user_tags ${RABBITMQ_USER} administrator

rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@rabbitmq1
rabbitmqctl start_app

tail -f /dev/null