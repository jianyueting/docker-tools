FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

RUN curl -L https://mirrors.ustc.edu.cn/apache/hbase/stable/hbase-2.2.3-bin.tar.gz -o /hbase-2.2.3-bin.tar.gz \
    && tar xf /hbase-2.2.3-bin.tar.gz && ln -s /hbase-2.2.3 /hbase && rm /hbase-2.2.3-bin.tar.gz \
    && sed -i '/JAVA_HOME/aexport JAVA_HOME=/usr/lib/jvm/zulu-8-amd64' /hbase/conf/hbase-env.sh

COPY hbase-site.xml /hbase/conf

EXPOSE 16000 16010 16020 16030 2181

VOLUME /data

CMD ["/startup.sh"]