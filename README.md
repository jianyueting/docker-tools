Docker开发记录
====

1. 启动命令统一命名为 startup.sh。常用一般是挂载数据盘，挂载路径统一为 /data。
2. startup.sh最后一个命令都是 `tail -f /dev/null`，相当于后台启动服务。run脚本里面都是用服务方式启动容器，最后用exec联接到image中。即使退出了，保证容器依在运行。
3. Dockerfile 最终以CMD调用startup.sh，不用ENTRYPOINT。测试时可以自定义命令参数，然后调用startup.sh来测试。

生成容器命名规则：将目录名的前2位数值修改为debian。目录名前2位数值包含了一定的依赖关系，数值小的先生成。编号大的容器可能依赖编号小的容器。所有容器都依赖debian-base。

nginx-lua、 redis、 mysql 配合使用脚本

```shell
#!/usr/bin/env bash

#base=$(pwd)
base=/tmp
#创建网络
docker network ls | grep -q network11 || (echo "create network network11" && docker network create network11 &>/dev/null)

#要使用wait-for脚本，nginx-lua要在redis和mysql启动完成后才能启动

#启动redis
echo "Starting redis server"
docker rm redis-server &>/dev/null
docker run --net network11 --hostname redis-server --name redis-server --rm -d -v ${base}/redis-data:/data -p 6379:6379 debian-redis

#启动mysql
echo "Starting mysql server"
docker rm mysql-server &>/dev/null
docker run --net network11 --hostname mysql-server --name mysql-server --rm -d -v ${base}/mysql-data:/data -p 3306:3306 debian-mysql-5.7 /wait-for-it.sh redis-server:6379 -- /startup.sh

#启动nginx-lua
echo "Starting nginx server"
docker rm nginx-server &>/dev/null
docker run --net network11 --hostname nginx-server --name nginx-server --rm -d -v /path/to/lua/scripts/directory:/data -p 80:80 debian-nginx-lua /wait-for-it.sh mysql-server:3306 -- /startup.sh
```

elasticsearch 集群、 logstash、 kibana 配合使用脚本

```shell
#!/usr/bin/env bash

#base=$(pwd)
base=/tmp
#创建网络
docker network ls | grep -q network12 || (echo "create network network12" && docker network create network12 &>/dev/null)

#要使用wait-for脚本，logstash和kibana要在elasticsearch启动完成后才能启动

#启动elasticsearch集群
mkdir -p ${base}/node2 &>/dev/null
docker rm elastic-node2 &>/dev/null
docker run --rm -d -v ${base}/node2:/var/lib/elasticsearch --net=network12 --name=elastic-node2 --hostname=elastic-node2 debian-elasticsearch

mkdir -p ${base}/node3 &>/dev/null
docker rm elastic-node3 &>/dev/null
docker run -d -v ${base}/node3:/var/lib/elasticsearch --net=network12 --name=elastic-node3 --hostname=elastic-node3 debian-elasticsearch

mkdir -p ${base}/node1 &>/dev/null
docker rm elastic-node1 &>/dev/null
docker run -d -v ${base}/node1:/var/lib/elasticsearch -p 9200:9200 -p 9300:9300 --net=network12 --name=elastic-node1 --hostname=elastic-node1 debian-elasticsearch

#启动logstash
docker rm logstash &>/dev/null
docker run -d -v /path/to/logstash/config/file:/etc/logstash/conf.d --net=network12 --name=logstash --hostname=logstash debian-logstash /wait-for-it.sh elastic-node1:9200 -- /startup.sh

#启动kibana
docker rm kibana &>/dev/null
docker run -d -p 5601:5601 -v /path/to/kibana/config/file:/etc/kibana --net=network12 --name=kibana --hostname=kibana debian-kibana /wait-for-it.sh elastic-node1:9200 -- /startup.sh
```
