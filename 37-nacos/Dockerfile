FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://github.com/alibaba/nacos/releases/download/1.1.4/nacos-server-1.1.4.tar.gz /nacos.tgz \
RUN jm_download https://www.softking.top/nacos-server-1.1.4.tar.gz /nacos.tgz \
 && jm_untar /nacos.tgz

COPY startup.sh /startup.sh

EXPOSE 8848
VOLUME /data /nacos/conf

CMD ["/startup.sh"]