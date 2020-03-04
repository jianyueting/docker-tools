FROM jm-openjdk8-sshd

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://github.com/alibaba/nacos/releases/download/1.1.4/nacos-server-1.1.4.tar.gz /nacos.tgz \
RUN jm_download https://www.softking.top/nacos-server-1.1.4.tar.gz /nacos.tgz \
 && jm_untar /nacos.tgz

COPY startup.sh /startup.sh
COPY start-server.sh /start-server.sh

EXPOSE 8848
VOLUME /data

CMD ["/startup.sh"]