Hadoop spark hive
====

### 说明
----

docker build . -t jm-hadoop-spark-hive可创建对应image。 resize-datanode-num.sh修改datanode个数，重新生成image。 run-cluster.sh运行集群环境，修改run-cluster.sh中base的值即可修改映射文件路径。

路径 /data 为hdfs使用的路径
路径 /postgres-data 为 postgresql 使用的路径

#### hadoop
----
hadoop环境，启动会创建hdfs。启动hdfs和yarn。

#### spark
----
spark 依赖hadoop。在启动之前会在hdfs中创建目录 /spark-log。

#### hive
----
hive 

支持表数据可修改

set hive.txn.manager=org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;
set hive.support.concurrency=true;
