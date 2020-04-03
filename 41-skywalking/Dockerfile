FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://mirrors.ustc.edu.cn/apache/skywalking/6.6.0/apache-skywalking-apm-6.6.0.tar.gz /skywalking.tgz \
 && jm_untar /skywalking.tgz && ln -s /apache-skywalking-apm-bin /skywalking && rm -rf /skywalking/agent \
 && sed -i 's/256/1024/' /skywalking/bin/oapService.sh && sed -i 's/512/1024/' /skywalking/bin/oapService.sh

COPY startup.sh /startup.sh

EXPOSE 8080 12800 11800
VOLUME /skywalking/config

CMD ["/startup.sh"]
