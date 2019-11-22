#!/usr/bin/env bash

#待主从配置完成
sleep 5

#创建数据库
scp /nacos/conf/nacos-mysql.sql mysql-1:/tmp
ssh mysql-1 "mysql -u root -e 'create database nacos;'"
ssh mysql-1 "mysql -u root nacos </tmp/nacos-mysql.sql"

sed -i 's/# nacos.cmdb/nacos.cmdb/' /nacos/conf/application.properties

cat >>/nacos/conf/application.properties<<EOF
db.num=1
db.url.0=jdbc:mysql://mysql-1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true
db.user=root
db.password=123456
EOF

ip=$(ifconfig |grep -v 127|grep inet|awk '{print $2}')
net_pre=$(echo ${ip}|awk -F. '{print $1"."$2"."$3"."}')
net_suf=$(echo ${ip}|awk -F. '{print $4}')

:>/nacos/conf/cluster.conf
#cluster只能使用ip
if [ ${HOSTNAME} = "nacos1" ];then
    echo ${net_pre}${net_suf}:8848 >>/nacos/conf/cluster.conf
    echo ${net_pre}$(expr ${net_suf} + 1):8848 >>/nacos/conf/cluster.conf
    echo ${net_pre}$(expr ${net_suf} + 2):8848 >>/nacos/conf/cluster.conf
elif [ ${HOSTNAME} = "nacos2" ];then
    echo ${net_pre}$(expr ${net_suf} - 1):8848 >>/nacos/conf/cluster.conf
    echo ${net_pre}${net_suf}:8848 >>/nacos/conf/cluster.conf
    echo ${net_pre}$(expr ${net_suf} + 1):8848 >>/nacos/conf/cluster.conf
elif [ ${HOSTNAME} = "nacos3" ];then
    echo ${net_pre}$(expr ${net_suf} - 2):8848 >>/nacos/conf/cluster.conf
    echo ${net_pre}$(expr ${net_suf} - 1):8848 >>/nacos/conf/cluster.conf
    echo ${net_pre}${net_suf}:8848 >>/nacos/conf/cluster.conf
fi

mkdir /data/data /data/logs /data/work &>/dev/null
ln -s /data/data /nacos &>/dev/null
ln -s /data/logs /nacos &>/dev/null
ln -s /data/work /nacos &>/dev/null

/nacos/bin/startup.sh
