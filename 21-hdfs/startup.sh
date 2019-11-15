#!/usr/bin/env bash 

sudo /usr/sbin/sshd -D &

if [ ${HOSTNAME} = "hdfs-namenode" ]; then
     [ ! -e /data/dfs/name ] && (echo "format dfs" && ${HADOOP_HOME}/bin/hdfs namenode -format)
     echo "start dfs" && ${HADOOP_HOME}/sbin/start-dfs.sh
     echo "start yarn" && ${HADOOP_HOME}/sbin/start-yarn.sh
fi
tail -f /dev/null
