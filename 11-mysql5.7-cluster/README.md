Docker MySQL 主从复制
====

### 说明
----
mysql主从复制服务，要外部提供数据库路径及端口。
服务器命名规则，使用 mysql-? 格式命名，1为主机，其他的为从机。
当前就一个从机，一个主机。改多个从机，要修改startup.sh脚本，并重新生成docker image。