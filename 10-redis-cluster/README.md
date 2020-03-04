redis
====

### 说明
----
集群redis，集群配置redis.conf和单机redis.conf比较，只是开启动了配置`cluster-enabled yes`。

直接使用机器名不能集群成功，使用ip地址，可以集群成功
计算机器ip思路：
    调用run-cluster时机器ip是连接的，最后调用redis1。使用ifconfig获取redis1的ip地址。ip地址最后一位数值-6+1为第一个启动的ip地址最后一位数值。
```sh
ip=$(ifconfig |grep -v 127|grep inet|awk '{print $2}')
net_pre=$(echo ${ip}|awk -F. '{print $1"."$2"."$3"."}')
net_suf=$(echo ${ip}|awk -F. '{print $4}')

for i in $(seq $(expr ${net_suf} - 6 + 1) ${net_suf});do
    #显示所有机器ip
    echo "${net_pre}${i}"
done

```