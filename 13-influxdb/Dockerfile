FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && apt-get install influxdb influxdb-client -y \
    && sed -i 's#var/lib/influxdb#data#' /etc/influxdb/influxdb.conf \
    && rm -rf /var/lib/apt/* /var/cache/apt/*

COPY startup.sh /startup.sh
EXPOSE 8086

CMD ["/startup.sh"]