Docker Redis
===

### 说明
----
redis服务，要外部提供路径绑定redis数据路径，端口6379

示例:
```shell
docker run -d -p 6379:6379 -v $(pwd)/redis-data:/data alpine-redis 
```