FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs redis

COPY startup.sh /startup.sh

EXPOSE 6379
VOLUME /data

CMD ["/startup.sh"]
