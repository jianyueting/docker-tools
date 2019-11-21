FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update  && apt-get upgrade -y \
    && apt-get install redis -y \
    && rm -rf /var/lib/apt/* /var/cache/apt/*

EXPOSE 6379
VOLUME /data

CMD ["/startup.sh"]
