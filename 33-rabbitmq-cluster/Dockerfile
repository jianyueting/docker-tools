FROM jm-sshd

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs rabbitmq-server

COPY startup.sh /startup.sh
COPY join-cluster.sh /join-cluster.sh

EXPOSE 5672 15672

CMD ["/startup.sh"]