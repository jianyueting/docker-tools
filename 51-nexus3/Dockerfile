FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://www.softking.top/nexus-3.20.0-04-unix.tar.gz /nexus.tgz \
 && jm_untar /nexus.tgz && ln -s /nexus-3.20.0-04 /nexus \
 && echo 'run_as_user="root"' >/nexus/bin/nexus.rc

COPY startup.sh /startup.sh

EXPOSE 8081

CMD ["/startup.sh"]