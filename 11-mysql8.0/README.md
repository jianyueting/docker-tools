MySQL
====

### 说明
----
mysql服务，要外部提供数据库路径及端口。外部访问root默认密码123456，也可以在启动时使用环境变量MYSQL_PASSWORD自定义密码。

```shell
docker run -d -p 3306:3306 -v $(pwd)/mysql-data:/data jm-mysql8.0
```
