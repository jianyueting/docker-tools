#!/usr/bin/env bash

/etc/init.d/nginx start
/etc/init.d/php7.3-fpm start

tail -f /dev/null