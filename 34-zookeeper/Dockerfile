FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://mirrors.ustc.edu.cn/apache/zookeeper/zookeeper-3.5.6/apache-zookeeper-3.5.6-bin.tar.gz /zookeeper.tgz \
 && jm_untar /zookeeper.tgz && ln -s /apache-zookeeper-3.5.6-bin /zookeeper \
 && cp /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg && sed -i 's#dataDir=.*#dataDir=/data#' /zookeeper/conf/zoo.cfg

COPY startup.sh /startup.sh
EXPOSE 2181

CMD ["/startup.sh"]