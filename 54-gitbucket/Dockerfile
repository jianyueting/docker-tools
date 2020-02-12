FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

#RUN curl -L https://github.com/gitbucket/gitbucket/releases/download/4.33.0/gitbucket.war -o /gitbucket.war

RUN curl -L https://www.softking.top/gitbucket.war -o /gitbucket.war

EXPOSE 8080

VOLUME /data

CMD ["/startup.sh"]