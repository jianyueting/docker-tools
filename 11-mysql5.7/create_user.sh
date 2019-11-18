#!/usr/bin/env bash

MYSQL_PASSWORD=${MYSQL_PASSWORD:-"123456"}
mysql -u root -e "grant all privileges on *.* to 'root'@'%' identified by '"$MYSQL_PASSWORD"' with grant option;flush privileges;"