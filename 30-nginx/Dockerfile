FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && apt-get install nginx -y  \
    && rm -rf /var/lib/apt/* /var/cache/apt/*

COPY startup.sh /startup.sh

EXPOSE 80

VOLUME /data

CMD ["/startup.sh"]