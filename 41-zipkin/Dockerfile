FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s
RUN jm_download https://www.softking.top/zipkin-server-2.19.3-exec.jar /zipkin.jar

COPY startup.sh /startup.sh

EXPOSE 9411

CMD ["/startup.sh"]