#!/usr/bin/env bash

/mongodb/bin/mongod --bind_ip_all --dbpath /data &

tail -f /dev/null