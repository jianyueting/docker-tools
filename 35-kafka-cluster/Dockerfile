FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://mirrors.ustc.edu.cn/apache/kafka/2.3.1/kafka_2.12-2.3.1.tgz /kafka.tgz \
 && jm_untar /kafka.tgz && ln -s /kafka_2.12-2.3.1 /kafka \
 && sed -i 's#tmp#data#' /kafka/config/zookeeper.properties \
 && sed -i 's#tmp#data#' /kafka/config/server.properties

COPY startup.sh /startup.sh 

EXPOSE 2181 9092
VOLUME /data

CMD ["/startup.sh"]