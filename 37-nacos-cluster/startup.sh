#!/usr/bin/env bash

sed -i 's/# nacos.cmdb/nacos.cmdb/' /nacos/conf/application.properties

cat >>/nacos/conf/application.properties<<EOF
db.num=1
db.url.0=jdbc:mysql://mysql-1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true
db.user=root
db.password=123456
EOF

#cluster只能使用ip
#cat >/nacos/conf/cluster.conf<<EOF
#172.25.0.4:8848
#172.25.0.5:8848
#172.25.0.6:8848
#EOF

mkdir /data/data /data/logs /data/work &>/dev/null
ln -s /data/data /nacos &>/dev/null
ln -s /data/logs /nacos &>/dev/null
ln -s /data/work /nacos &>/dev/null

/nacos/bin/startup.sh

tail -f /dev/null