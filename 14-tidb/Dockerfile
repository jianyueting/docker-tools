FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && curl -Lo /tidb-latest-linux-amd64.tar.gz http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz \
    && tar xf /tidb-latest-linux-amd64.tar.gz && ln -s /tidb-latest-linux-amd64 /tidb \
    && rm -rf /tidb-latest-linux-amd64.tar.gz /var/cache/apt/* /var/lib/apt/*

COPY startup.sh /startup.sh

EXPOSE 4000 2379
VOLUME /data

CMD ["/startup.sh"]