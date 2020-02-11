#!/usr/bin/env bash

MYSQL_PASSWORD=${MYSQL_PASSWORD:-"123456"}

result=$(mysql -u root -e "select count(1) cnt from mysql.user where host='%' and user='root';"|grep -q 1 &>/dev/null;echo $?)
[ ${result} -eq 0 ] || mysql -u root -e "create user 'root'@'%' identified with mysql_native_password by '"${MYSQL_PASSWORD}"';grant all on *.* to 'root'@'%';"

if [ ${HOSTNAME} = "mysql-1" ];then
    #生成主从复制的随机密码
    passwd=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c6)
    mysql -u root -e "create user 'replication'@'%' identified with mysql_native_password by '"${passwd}"';grant replication slave on *.* to 'replication'@'%';"
    mysql -u root -e "flush privileges;"
    mysql -u root -e "flush logs;"
    file=$(mysql -u root -e "show master status\G"|grep "File"|awk '{print $2}')
    pos=$(mysql -u root -e "show master status\G"|grep "Position"|awk '{print $2}')
    #多个主机要复制以下命令，并且修改主机名
    /wait-for-it.sh mysql-2:3306 -- ssh mysql-2 "mysql -u root -e \"change master to master_host='mysql-1', master_user='replication', master_password='"${passwd}"', master_log_file='"${file}"', master_log_pos="${pos}";\""
    /wait-for-it.sh mysql-2:3306 -- ssh mysql-2 "mysql -u root -e \"start slave;\""
fi