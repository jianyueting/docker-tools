#!/usr/bin/env bash 

sudo /usr/sbin/sshd -D &

if [ ${HOSTNAME} = "hadoop-namenode" ]; then
     [ ! -e /data/dfs/name ] && (echo "format dfs" && ${HADOOP_HOME}/bin/hdfs namenode -format)
     
     [ ! -e /postgres-data/PG_VERSION ] && sudo su - postgres -c "/usr/lib/postgresql/11/bin/initdb -D /postgres-data && /usr/lib/postgresql/11/bin/pg_ctl -D /postgres-data start -l /postgres-data/postgres-$(date +%F).log && /usr/bin/createdb hive && /usr/bin/psql hive -f /hive/scripts/metastore/upgrade/postgres/hive-schema-3.1.0.postgres.sql"
     [ ! -e /var/run/postgresql/.s.PGSQL.5432 ] && sudo su - postgres -c "/usr/lib/postgresql/11/bin/pg_ctl -D /postgres-data start -l /postgres-data/postgres-$(date +%F).log"

     echo "start dfs" && ${HADOOP_HOME}/sbin/start-dfs.sh
     echo "start yarn" && ${HADOOP_HOME}/sbin/start-yarn.sh
     echo "mkdir /spark-log" && ${HADOOP_HOME}/bin/hadoop fs -mkdir /spark-log &>/dev/null
     echo "start spark" && ${SPARK_HOME}/sbin/start-all.sh
     echo "start hive" && ${HIVE_HOME}/bin/hiveserver2 &> /tmp/hiveserver.log &
fi
tail -f /dev/null
