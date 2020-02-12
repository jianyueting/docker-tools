FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

RUN curl -L https://www.softking.top/nexus-3.20.0-04-unix.tar.gz -o /nexus-3.20.0-04-unix.tar.gz \
    && tar xf /nexus-3.20.0-04-unix.tar.gz && ln -s /nexus-3.20.0-04 /nexus && rm /nexus-3.20.0-04-unix.tar.gz \
    && echo 'run_as_user="root"' >/nexus/bin/nexus.rc

CMD ["/startup.sh"]