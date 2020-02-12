FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

#RUN curl -L https://github.com/seata/seata/releases/download/v1.0.0/seata-server-1.0.0.tar.gz -o /seata-server-1.0.0.tar.gz \
#    && tar xf /seata-server-1.0.0.tar.gz && rm /seata-server-1.0.0.tar.gz

RUN curl -L https://www.softking.top/seata-server-1.0.0.tar.gz -o /seata-server-1.0.0.tar.gz \
    && tar xf /seata-server-1.0.0.tar.gz && rm /seata-server-1.0.0.tar.gz

CMD ["/startup.sh"]