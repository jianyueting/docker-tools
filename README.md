Docker开发记录
====

1. 启动命令统一命名为 startup.sh。常用一般是挂载数据盘，挂载路径统一为 /data。
2. docker在生产环境上是以服务启动，startup.sh里不能以后台运行方式调用服务。比如 sshd，不能调用 `/etc/init.d/ssh start`，而要用 `/usr/sbin/sshd -D`，不然docker run -d 不能正常启动服务。
3. Dockerfile 最终以CMD调用startup.sh，不用ENTRYPOINT。测试时可以自定义命令参数，然后调用startup.sh来测试。

nginx-lua redis mysql 配合使用脚本

```shell
#!/usr/bin/env bash

#base=$(pwd)
base=/tmp
#创建网络
docker network ls | grep -q network11 || (echo "create network network11" && docker network create network11 &>/dev/null)

#要使用wait-for脚本，nginx-lua要在redis和mysql启动完成后才能启动

#启动redis
echo "Starting redis server"
docker run --net network11 --hostname redis-server --name redis-server --rm -d -v ${base}/redis-data:/data -p 6379:6379 debian-redis

#启动mysql
echo "Starting mysql server"
docker run --net network11 --hostname mysql-server --name mysql-server --rm -d -v ${base}/mysql-data:/data -p 3306:3306 debian-mysql-5.7 /wait-for-it.sh redis-server:6379 /startup.sh

#启动nginx-lua
echo "Starting nginx server"
docker run --net network11 --hostname nginx-server --name nginx-server --rm -d -v /path/to/lua/scripts/directory:/data -p 80:80 debian-nginx-lua /wait-for-it.sh mysql-server:3306 /startup.sh
```
