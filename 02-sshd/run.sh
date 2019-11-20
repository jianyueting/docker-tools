#!/usr/bin/env bash

source ../base-functions.sh

remove_image sshd

docker run -d --name sshd -p 22:22 debian-sshd &>/dev/null

connect_to_image sshd