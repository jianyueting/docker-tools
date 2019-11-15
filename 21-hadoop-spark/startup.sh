#!/usr/bin/env bash 

sudo /usr/sbin/sshd -D &

if [ ${HOSTNAME} = "spark-namenode" ]; then
     [ ! -e /data/dfs/name ] && (echo "format dfs" && ${HADOOP_HOME}/bin/hdfs namenode -format)
     
     echo "start dfs" && ${HADOOP_HOME}/sbin/start-dfs.sh
     echo "start yarn" && ${HADOOP_HOME}/sbin/start-yarn.sh
     echo "mkdir /spark-log" && ${HADOOP_HOME}/bin/hadoop fs -mkdir /spark-log &>/dev/null
     echo "start spark" && ${SPARK_HOME}/sbin/start-all.sh
fi
tail -f /dev/null
