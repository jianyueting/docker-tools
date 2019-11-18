FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN apt-get update && apt-get upgrade -y \
#    && apt-get install python perl psmisc libjson-perl libaio1 libatomic1 libnuma1 libmecab2 libncurses6 -y \
#    && curl -L https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-server_5.7.28-1debian10_amd64.deb-bundle.tar -o /mysql-server_5.7.28-1debian10_amd64.deb-bundle.tar \
#    && mkdir /mysql && tar xf /mysql-server_5.7.28-1debian10_amd64.deb-bundle.tar -C /mysql && dpkg -i /mysql/*.deb \
#    && rm -rf /mysql* /var/cache/apt/* /var/lib/apt/* /var/lib/mysql
RUN apt-get update && apt-get upgrade -y \
    && apt-get install python perl psmisc libjson-perl libaio1 libatomic1 libnuma1 libmecab2 libncurses6 -y \
    && curl -L https://www.softking.top/mysql-server_5.7.28-1debian10_amd64.deb-bundle.tar -o /mysql-server_5.7.28-1debian10_amd64.deb-bundle.tar \
    && mkdir /mysql && tar xf /mysql-server_5.7.28-1debian10_amd64.deb-bundle.tar -C /mysql && dpkg -i /mysql/*.deb \
    && rm -rf /mysql* /var/cache/apt/* /var/lib/apt/* /var/lib/mysql

COPY conf /etc/mysql/mysql.conf.d
COPY startup.sh /startup.sh
COPY create_user.sh /create_user.sh

EXPOSE 3306
VOLUME /data

CMD ["/startup.sh"]