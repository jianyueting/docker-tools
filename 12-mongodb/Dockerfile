FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-debian10-4.2.2.tgz /mongodb.tgz \
RUN jm_download https://www.softking.top/mongodb-linux-x86_64-debian10-4.2.2.tgz /mongodb.tgz \
 && jm_install_pkgs libpcap0.8 \
 && jm_untar /mongodb.tgz && ln -s /mongodb-linux-x86_64-debian10-4.2.2 /mongodb

COPY startup.sh /startup.sh

EXPOSE 27017
VOLUME /data

CMD ["/startup.sh"]