Docker MySQL
====

### 说明
----
mysql服务，要外部提供数据库路径及端口

```shell
docker run -d -p 3306:3306 -v $(pwd)/mariadb-data:/data debian-mariadb
```
