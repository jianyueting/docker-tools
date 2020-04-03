FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download 'https://www.kooteam.com/home/download.do?app=kooteam&type=install' /kooteam.tgz \
 && jm_untar /kooteam.tgz

COPY startup.sh /startup.sh

CMD ["/startup.sh"]