FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz /tidb.tgz \
 && jm_untar /tidb.gz && ln -s /tidb-latest-linux-amd64 /tidb

COPY startup.sh /startup.sh

EXPOSE 4000 2379
VOLUME /data

CMD ["/startup.sh"]