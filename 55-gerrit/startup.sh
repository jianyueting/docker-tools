#!/usr/bin/env bash

/etc/init.d/nginx start
/gerrit/bin/gerrit.sh start

tail -f /dev/null