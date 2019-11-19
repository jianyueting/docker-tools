FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY redis.conf /etc/redis.conf

RUN apt-get update \
    && apt-get upgrade \
    && apt-get install redis -y\
    && rm -rf /var/cache/apt/*

EXPOSE 6379
VOLUME /data

CMD ["/startup.sh"]
