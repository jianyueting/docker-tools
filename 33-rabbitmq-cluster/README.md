Rabbitmq
====

### 说明
增加了新管理员用户，默认用户名密码为admin/123456，可以在运行时通过环境变量 `RABBITMQ_USER` 和 `RABBITMQ_PASSWORD`配置。
仅开启了 rabbitmq\_management 插件，可以通过15672访问。

集群模式，此处使用了两个image处理。也可以使用更多image。修改runcluster.sh，注意端口映射。
