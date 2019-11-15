Docker开发记录
====

1. 启动命令统一命名为 startup.sh。常用一般是挂载数据盘，挂载路径统一为 /data。
2. docker在生产环境上是以服务启动，startup.sh里不能以后台运行方式调用服务。比如 sshd，不能调用 `/etc/init.d/ssh start`，而要用 `/usr/sbin/sshd -D`，不然docker run -d 不能正常启动服务。
3. Dockerfile 最终以CMD调用startup.sh，不用ENTRYPOINT。测试时可以自定义命令参数，然后调用startup.sh来测试。

