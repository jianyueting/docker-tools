FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://mirrors.ustc.edu.cn/apache/rocketmq/4.5.2/rocketmq-all-4.5.2-bin-release.zip /rocketmq.zip \
 && unzip -q /rocktemq.zip && rm /rocketmq.zip && ln -s /rocketmq-all-4.5.2-bin-release /rocketmq

ENV JAVA_OPT="-Duser.home=/data"

COPY startup.sh /startup.sh

EXPOSE 10909 10911 10912 9876
VOLUME /data

CMD ["/startup.sh"]