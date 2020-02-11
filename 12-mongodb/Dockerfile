FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN apt-get update && apt-get upgrade -y \
#    && apt-get install libpcap0.8 -y \
#    && curl https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-debian10-4.2.2.tgz -o /mongodb-linux-x86_64-debian10-4.2.2.tgz \
#    && tar xf /mongodb-linux-x86_64-debian10-4.2.2.tgz && rm /mongodb-linux-x86_64-debian10-4.2.2.tgz && ln -s /mongodb-linux-x86_64-debian10-4.2.2 /mongodb \
#    && rm -rf /var/lib/apt/* /var/cache/apt/*

RUN apt-get update && apt-get upgrade -y \
    && apt-get install libpcap0.8 -y \
    && curl https://www.softking.top/mongodb-linux-x86_64-debian10-4.2.2.tgz -o /mongodb-linux-x86_64-debian10-4.2.2.tgz \
    && tar xf /mongodb-linux-x86_64-debian10-4.2.2.tgz && rm /mongodb-linux-x86_64-debian10-4.2.2.tgz && ln -s /mongodb-linux-x86_64-debian10-4.2.2 /mongodb \
    && rm -rf /var/lib/apt/* /var/cache/apt/*

COPY startup.sh /startup.sh
EXPOSE 27017
VOLUME /data

CMD ["/startup.sh"]