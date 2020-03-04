FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs postgresql
RUN rm -rf /var/lib/postgresql/11/main

COPY startup.sh /startup.sh

EXPOSE 5432
VOLUME /data

CMD ["/startup.sh"]