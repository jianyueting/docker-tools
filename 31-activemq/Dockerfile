FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://mirrors.ustc.edu.cn/apache/activemq/5.15.10/apache-activemq-5.15.10-bin.tar.gz -o /activemq.tgz \
 && jm_untar /activemq.tgz && ln -s /apache-activemq-5.15.10 activemq

ENV ACTIVEMQ_HOME=/activemq
ENV PATH=${ACTIVEMQ_HOME}/bin:${PATH}

EXPOSE 5672 40363 61613 61614 61616 1833 8161

ADD startup.sh /startup.sh

CMD ["/startup.sh"]