FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

#RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s

RUN curl -L https://www.softking.top/zipkin-server-2.19.3-exec.jar -o /zipkin.jar

EXPOSE 9411

CMD ["/startup.sh"]