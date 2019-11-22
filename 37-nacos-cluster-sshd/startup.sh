#!/usr/bin/env bash

/wait-for-it.sh mysql-1:3306 -- /start-server.sh

tail -f /dev/null