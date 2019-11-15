FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN useradd hadoop -m \
    && curl https://mirrors.ustc.edu.cn/apache/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz -o /hadoop-2.9.2.tar.gz \
    && tar xf /hadoop-2.9.2.tar.gz && rm /hadoop-2.9.2.tar.gz && ln -s /hadoop-2.9.2 /hadoop && chown hadoop\: -R /hadoop* \
    && apt-get update && apt-get upgrade -y && apt-get install sudo openssh-server openssh-client -y && rm -rf /var/cache/apt/* /var/lib/apt/* \
    && echo "hadoop ALL=(ALL:ALL) NOPASSWD: ALL" >>/etc/sudoers && mkdir -p /run/sshd

COPY ssh_config /home/hadoop/.ssh/config
COPY startup.sh /startup.sh
COPY hadoop /hadoop/etc/hadoop

RUN chmod +x /startup.sh && chown hadoop\: -R /home/hadoop /startup.sh /hadoop/etc/hadoop

USER hadoop

RUN chmod 700 ~/.ssh && ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ENV JAVA_HOME=/usr/lib/jvm/zulu-8-amd64 \
    HADOOP_HOME=/hadoop HADOOP_INSTALL=/hadoop HADOOP_MAPRED_HOME=/hadoop HADOOP_HDFS_HOME=/hadoop HADOOP_COMMON_HOME=/hadoop HADOOP_CONF_DIR=/hadoop/etc/hadoop \
    YARN_HOME=/hadoop YARN_CONF_DIR=/hadoop/etc/hadoop \
    LD_LIBRARY_PATH=/hadoop/lib/native \
    PATH=${HADOO_HOME}/bin:${HADOO_HOME}/sbin:${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${JAVA_HOME}/bin:${PATH} 

# HDFS ports
EXPOSE 9000 50010 50020 50070 50075 50090 14000
# MapReduce ports 
EXPOSE 19888 
# YARN ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088

VOLUME /data

CMD ["/startup.sh"]
