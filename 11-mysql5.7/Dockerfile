FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && apt-get install python perl psmisc libjson-perl libaio1 libatomic1 libnuma1 libmecab2 libncurses6 -y \
    && curl -L https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-server_5.7.28-1debian10_amd64.deb-bundle.tar -O /mysql-server_5.7.28-1debian10_amd64.deb-bundle.tar \
    && mkdir /mysql && tar xf /mysql-server_5.7.28-1debian10_amd64.deb-bundle.tar -D /mysql && dpkg -i /mysql/*.deb \
    && rm -rf /mysql* /var/cache/apt/* /var/lib/apt/*

COPY my.cnf /etc/my.cnf
COPY startup.sh /startup.sh

EXPOSE 3306
VOLUME /data

ENTRYPOINT ["/startup.sh"]