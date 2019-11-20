FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y && apt-get install unzip -y \
    && rm -rf /var/lib/apt/* /var/cache/apt/* \
    && curl https://mirrors.ustc.edu.cn/apache/rocketmq/4.5.2/rocketmq-all-4.5.2-bin-release.zip -o /rocketmq-all-4.5.2-bin-release.zip \
    && unzip -q /rocketmq-all-4.5.2-bin-release.zip && rm /rocketmq-all-4.5.2-bin-release.zip && ln -s /rocketmq-all-4.5.2-bin-release /rocketmq 

ENV JAVA_OPT=-Duser.home=/data

COPY startup.sh /startup.sh

EXPOSE 10909 10911 10912 9876
VOLUME /data

CMD ["/startup.sh"]