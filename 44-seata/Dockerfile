FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://github.com/seata/seata/releases/download/v1.1.0/seata-server-1.1.0.tar.gz /seata.tgz \
RUN jm_download https://www.softking.top/seata-server-1.1.0.tar.gz /seata.tgz \
 && jm_untar /seata.tgz

COPY startup.sh /startup.sh

CMD ["/startup.sh"]