#!/usr/bin/env bash

if [ -e /data/mysql ]; then
  echo "MySQL directory already present, skipping creation"
else
  echo "MySQL data directory not found, creating initial DBs"

  mysqld --initialize-insecure --datadir=/data --user=root --tmpdir=/tmp
fi

/usr/bin/mysqld_safe --user=root --console &

/wait-for-it.sh localhost:3306 -- /create_user.sh
tail -f /dev/null