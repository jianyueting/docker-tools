FROM debian-sshd

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && apt-get install rabbitmq-server -y \
    && rm -rf /var/lib/apt/* /var/cache/apt/*

COPY startup.sh /startup.sh
COPY join-cluster.sh /join-cluster.sh

EXPOSE 5672 15672

CMD ["/startup.sh"]