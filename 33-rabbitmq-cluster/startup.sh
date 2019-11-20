#!/usr/bin/env bash

/usr/sbin/sshd -D &
/etc/init.d/rabbitmq-server start

rabbitmq-plugins enable rabbitmq_management

RABBITMQ_USER=${RABBITMQ_USER:-admin}
RABBITMQ_PASSWORD=${RABBITMQ_PASSWORD:-123456}

rabbitmqctl add_user ${RABBITMQ_USER} ${RABBITMQ_PASSWORD}
rabbitmqctl set_user_tags ${RABBITMQ_USER} administrator

tail -f /dev/null