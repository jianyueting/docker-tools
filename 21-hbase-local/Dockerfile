FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://mirrors.ustc.edu.cn/apache/hbase/stable/hbase-2.2.3-bin.tar.gz /hbase.tgz \
 && jm_untar /hbase.tgz && ln -s /hbase-2.2.3 /hbase \
 && sed -i '/JAVA_HOME/aexport JAVA_HOME=/usr/lib/jvm/zulu-8-amd64' /hbase/conf/hbase-env.sh

COPY startup.sh /startup.sh
COPY hbase-site.xml /hbase/conf

EXPOSE 16000 16010 16020 16030 2181
VOLUME /data

CMD ["/startup.sh"]