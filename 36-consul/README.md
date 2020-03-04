consul
====

### 说明
----
单机consul，供开发使用。

端口说明如下：

|端口号|协议|功能|
|----|----|----|
|8300|TCP|agent server 使用的，用于处理其他agent发来的请求|
|8301|TCP 、UDP|agent使用此端口处理LAN中的gossip|
|8302|TCP 、UDP|agent server使用此端口处理WAN中的与其他server的gossip|
|8400|TCP|agent用于处理从CLI来的RPC请求|
|8500|TCP|agent用于处理HTTP API|
|8600|TCP 、UDP|agent用于处理 DNS 查询|
