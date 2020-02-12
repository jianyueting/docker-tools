FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN curl https://mirrors.ustc.edu.cn/apache/skywalking/6.6.0/apache-skywalking-apm-6.6.0.tar.gz -o /apache-skywalking-apm-6.6.0.tar.gz \
    && tar xf /apache-skywalking-apm-6.6.0.tar.gz && ln -s /apache-skywalking-apm-bin /skywalking \
    && rm /apache-skywalking-apm-6.6.0.tar.gz

COPY startup.sh /startup.sh

EXPOSE 8080

VOLUME /skywalking/config

CMD ["/startup.sh"]
