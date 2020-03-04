FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs influxdb influxdb-client \
 && sed -i 's#var/lib/influxdb#data#' /etc/influxdb/influxdb.conf

COPY startup.sh /startup.sh

EXPOSE 8086
VOLUME /data

CMD ["/startup.sh"]