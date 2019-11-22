FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/* /var/cache/apt/* \
    && curl https://mirrors.ustc.edu.cn/apache/kafka/2.3.1/kafka_2.12-2.3.1.tgz -o /kafka_2.12-2.3.1.tgz && tar xf /kafka_2.12-2.3.1.tgz && rm /kafka_2.12-2.3.1.tgz \
    && ln -s /kafka_2.12-2.3.1 /kafka \
    && sed -i 's#tmp#data#' /kafka/config/zookeeper.properties \
    && sed -i 's#tmp#data#' /kafka/config/server.properties

COPY startup.sh /startup.sh 
EXPOSE 2181 9092
VOLUME /data

CMD ["/startup.sh"]