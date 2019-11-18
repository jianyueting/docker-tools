FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && rm -rf /var/lib/apt/* /var/cache/apt/* \
    && curl https://mirrors.ustc.edu.cn/apache/activemq/5.15.10/apache-activemq-5.15.10-bin.tar.gz -o /apache-activemq-5.15.10-bin.tar.gz \
    && tar xf /apache-activemq-5.15.10-bin.tar.gz && ln -s /apache-activemq-5.15.10 activemq && rm /apache-activemq-5.15.10-bin.tar.gz

ENV ACTIVEMQ_HOME=/activemq PATH=${ACTIVEMQ_HOME}/bin:${PATH}

EXPOSE 5672 40363 61613 61614 61616 1833 8161

ADD startup.sh /startup.sh

CMD ["/startup.sh"]