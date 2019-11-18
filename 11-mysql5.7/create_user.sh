#!/usr/bin/env bash

MYSQL_PASSWORD=${MYSQL_PASSWORD:-"123456"}

result=$(mysql -u root -e "select count(1) cnt from mysql.user where host='%' and user='root';"|grep -q 1 &>/dev/null;echo $?)
[ ${result} -eq 0 ] || mysql -u root -e "grant all privileges on *.* to 'root'@'%' identified by '"$MYSQL_PASSWORD"' with grant option;flush privileges;"