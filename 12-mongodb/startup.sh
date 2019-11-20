#!/usr/bin/env bash

/mongodb/bin/mongod --dbpath /data &

tail -f /dev/null