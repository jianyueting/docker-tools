export JAVA_HOME=/usr/lib/jvm/zulu-8-amd64
export HADOOP_HOME=/hadoop
export SPARK_HOME=/spark
export SPARK_MASTER_IP=spark-namenode
export SPARK_WORKER_MEMORY=512m
export SPARK_WORKE_CORES=3
export SPARK_DIST_CLASSPATH=$(${HADOOP_HOME}/bin/hadoop classpath)
export LD_LIBRARY_PATH=${HADOOP_HOME}/lib/native