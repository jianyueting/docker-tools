FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://mirrors.ustc.edu.cn/apache/skywalking/6.6.0/apache-skywalking-apm-6.6.0.tar.gz /skywalking.tgz \
 && jm_untar /skywalking.tgz && ln -s /apache-skywalking-apm-bin /skywalking

COPY startup.sh /startup.sh

EXPOSE 8080
VOLUME /skywalking/config

CMD ["/startup.sh"]
