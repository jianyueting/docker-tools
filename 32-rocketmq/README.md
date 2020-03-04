Rocketmq
====

### 说明
----
增加了环境变量 `JAVA_OPT=-Duser.home=/data`，将日志及数据保存到/data中。
为了在docker中运行，在startup.sh中修改了broker的内存大小。如果实际内存够大，可以去除这处修改。