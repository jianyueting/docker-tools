#!/usr/bin/env bash

/usr/sbin/sshd -D &

if [ -e /data/mysql ]; then
  echo "MySQL directory already present, skipping creation"
else
  echo "MySQL data directory not found, creating initial DBs"

  mysqld --initialize-insecure --datadir=/data --user=root --tmpdir=/tmp
fi

serverid=$(echo ${HOSTNAME}|sed 's/mysql-//')
echo "log-bin=mysql-bin
server-id=${serverid}" >> /etc/mysql/mysql.conf.d/mysqld.cnf

/usr/bin/mysqld_safe --user=root --console &

/wait-for-it.sh localhost:3306 -- /create_cluster.sh

tail -f /dev/null