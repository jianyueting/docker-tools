FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/* /var/cache/apt/* \
#    && curl -L https://github.com/alibaba/nacos/releases/download/1.1.4/nacos-server-1.1.4.tar.gz -o /nacos-server-1.1.4.tar.gz \
#    && tar xf /nacos-server-1.1.4.tar.gz && rm /nacos-server-1.1.4.tar.gz

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/* /var/cache/apt/* \
    && curl -L https://www.softking.top/nacos-server-1.1.4.tar.gz -o /nacos-server-1.1.4.tar.gz \
    && tar xf /nacos-server-1.1.4.tar.gz && rm /nacos-server-1.1.4.tar.gz

COPY startup.sh /startup.sh
EXPOSE 8848
VOLUME /data /nacos/conf

CMD ["/startup.sh"]