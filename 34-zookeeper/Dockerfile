FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && curl https://mirrors.ustc.edu.cn/apache/zookeeper/zookeeper-3.5.6/apache-zookeeper-3.5.6-bin.tar.gz -o /apache-zookeeper-3.5.6-bin.tar.gz \
    && tar xf /apache-zookeeper-3.5.6-bin.tar.gz && ln -s /apache-zookeeper-3.5.6-bin /zookeeper && rm /apache-zookeeper-3.5.6-bin.tar.gz \
    && cp /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg && sed -i 's#dataDir=.*#dataDir=/data#' /zookeeper/conf/zoo.cfg
    
COPY startup.sh /startup.sh
EXPOSE 2181

CMD ["/startup.sh"]