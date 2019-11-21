FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y\
    && apt-get install redis -y\
    && rm -rf /var/lib/apt/* /var/cache/apt/*

COPY startup.sh /startup.sh
COPY create_cluster.sh /create_cluster.sh

EXPOSE 6379
VOLUME /data /sys

CMD ["/startup.sh"]
