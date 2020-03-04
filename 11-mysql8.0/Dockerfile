FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-server_8.0.19-1debian10_amd64.deb-bundle.tar /mysql-server.tar
RUN jm_download https://www.softking.top/mysql-server_8.0.19-1debian10_amd64.deb-bundle.tar /mysql-server.tar \
 && jm_install_pkgs python perl psmisc libjson-perl libaio1 libatomic1 libnuma1 libmecab2 libncurses6 \
 && mkdir /mysql && tar xf /mysql-server.tar -C /mysql && rm /mysql-server.tar /mysql/*debug_*deb /mysql/*test_*deb /mysql/*testsuite_*deb /mysql/*dev_*deb \
 && jm_install_debs /mysql/*.deb && rm -rf /mysql

COPY conf /etc/mysql/mysql.conf.d
COPY startup.sh /startup.sh
COPY create_user.sh /create_user.sh

EXPOSE 3306
VOLUME /data

CMD ["/startup.sh"]