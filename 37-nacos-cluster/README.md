Docker nacos
====

### 说明
----
Nacos的集群环境，要和mysql共同启动。

1. 启动mysql主从复制
2. 手工创建数据库及表
3. 手工编辑cluster.conf文件，添加nacos服务的ip地址。由于docker的ip地址是连续的，可以根据mysql的ip地址，添加nacos服务的3个ip
4. 启动nacos集群