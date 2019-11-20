Docker Rocketmq
====

### 说明
----
增加了环境变量 `JAVA_OPT=-Duser.home=/data`，将日志及数据保存到/data中。
为了在docker中运行，在startup.sh中修改了broker的内存大小。如果实际内存够大，可以去除这处修改。

startup.sh使用环境变量 NO\_SLAVE、ASYNC\_MODE来控制类型。
NO\_SLAVE=true是集群无slave
ASYNC\_MODE=true是异步复制
ASYNC\_MODE=false是同步复制

* 模式对比

1. 集群无slave
    优点：配置简单，单个Master 宕机或重启维护对应用无影响
    缺点：单台机器宕机期间，这台机器上未被消费的消息在机器恢复之前不可订阅，消息实时性会受到受到影响

2. 异步复制
    优点：即使磁盘损坏，消息丢失的非常少，且消息实时性不会受影响
    缺点：Master 宕机，磁盘损坏情况，会丢失少量消息

3. 同步复制
    优点：数据与服务都无单点，Master宕机情况下，消息无延迟，服务可用性与数据可用性都非常高
    缺点：性能比异步复制模式略低，大约低 10%左右，发送单个消息的 RT 会略高
