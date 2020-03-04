FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs redis

COPY startup.sh /startup.sh
COPY create_cluster.sh /create_cluster.sh

EXPOSE 6379
VOLUME /data /sys

CMD ["/startup.sh"]
