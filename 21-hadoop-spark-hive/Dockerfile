FROM debian-openjdk8-sshd

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN useradd hadoop -m \
    && curl https://mirrors.ustc.edu.cn/apache/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz -o /hadoop-2.9.2.tar.gz \
    && tar xf /hadoop-2.9.2.tar.gz && rm /hadoop-2.9.2.tar.gz && ln -s /hadoop-2.9.2 /hadoop && chown hadoop\: -R /hadoop* \
    && curl https://mirrors.ustc.edu.cn/apache/spark/spark-2.3.4/spark-2.3.4-bin-without-hadoop.tgz -o /spark-2.3.4-bin-without-hadoop.tgz \
    && tar xf /spark-2.3.4-bin-without-hadoop.tgz && rm /spark-2.3.4-bin-without-hadoop.tgz && ln -s /spark-2.3.4-bin-without-hadoop /spark && chown hadoop\: -R /spark* \
    && curl https://mirrors.ustc.edu.cn/apache/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz -o /apache-hive-3.1.2-bin.tar.gz \
    && tar xf /apache-hive-3.1.2-bin.tar.gz && rm /apache-hive-3.1.2-bin.tar.gz && ln -s /apache-hive-3.1.2-bin hive && chown hadoop\: -R /apache-hive* /hive \
    && rm /spark/jars/orc-*jar && ln -s /hive/lib/orc-*.jar /hive/lib/hive-exec-*jar /hive/lib/hive-common*.jar /spark/jars \
    && for jar in $(ls /spark/jars/*.jar) ;do a=${jar#/spark/jars/}; [ ! -e "/hive/lib/${a}" ] && ln -s ${jar} /hive/lib ;done \
    && apt-get update && apt-get upgrade -y && apt-get install sudo postgresql -y && rm -rf /var/cache/apt/* /var/lib/apt/* \
    && echo "hadoop ALL=(ALL:ALL) NOPASSWD: ALL" >>/etc/sudoers && mkdir -p /run/sshd  && rm -rf /var/lib/postgresql/11/main

COPY ssh_config /home/hadoop/.ssh/config
COPY startup.sh /startup.sh
COPY hadoop /hadoop/etc/hadoop
COPY spark /spark/conf
COPY hive /hive/conf
COPY custom-auth.jar /hive/lib
COPY orc-mapreduce-1.5.6.jar /spark/jars

RUN chmod +x /startup.sh && chown hadoop\: -R /home/hadoop /startup.sh /spark/conf /hadoop/etc/hadoop /hive/lib/custom-auth.jar

USER hadoop

RUN chmod 700 ~/.ssh && ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ENV JAVA_HOME=/usr/lib/jvm/zulu-8-amd64
ENV HADOOP_HOME=/hadoop
ENV HADOOP_INSTALL=/hadoop
ENV HADOOP_MAPRED_HOME=/hadoop
ENV HADOOP_HDFS_HOME=/hadoop
ENV HADOOP_COMMON_HOME=/hadoop
ENV HADOOP_CONF_DIR=/hadoop/etc/hadoop
ENV YARN_HOME=/hadoop
ENV YARN_CONF_DIR=/hadoop/etc/hadoop
ENV SPARK_HOME=/spark
ENV HIVE_HOME=/hive
ENV LD_LIBRARY_PATH=/hadoop/lib/native
ENV PATH=${HADOO_HOME}/bin:${HADOO_HOME}/sbin:${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${JAVA_HOME}/bin:${PATH} 

# HDFS ports
EXPOSE 9000 50010 50020 50070 50075 50090 14000
# MapReduce ports 
EXPOSE 19888 
# YARN ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
# SPARK ports
EXPOSE 6066 7077 8080 4040
# HIVE ports
EXPOSE 10000

VOLUME /data /postgres-data

CMD ["/startup.sh"]
