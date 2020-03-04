FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs etcd

COPY startup.sh /startup.sh

EXPOSE 2379 2380
VOLUME /data

CMD ["/startup.sh"]