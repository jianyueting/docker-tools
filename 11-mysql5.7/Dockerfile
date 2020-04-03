FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://mirrors.ustc.edu.cn/mysql-ftp/Downloads/MySQL-5.7/mysql-server_5.7.29-1debian10_amd64.deb-bundle.tar /mysql-server.tar \
 && jm_install_pkgs python perl psmisc libjson-perl libaio1 libatomic1 libnuma1 libmecab2 libncurses6 \
 && mkdir /mysql && tar xf /mysql-server.tar -C /mysql && rm /mysql-server.tar /mysql/*source*deb /mysql/*test*deb /mysql/*dev*deb \
 && jm_install_debs /mysql/*.deb && rm -rf /mysql /var/lib/mysql

COPY conf /etc/mysql/mysql.conf.d
COPY startup.sh /startup.sh
COPY create_user.sh /create_user.sh

EXPOSE 3306
VOLUME /data
ENV MYSQL_ROOT_PASSWORD=""

CMD ["/startup.sh"]