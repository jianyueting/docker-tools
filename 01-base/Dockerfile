FROM debian:10.1

MAINTAINER Jian Yueting <jianyueting@gmail.com>

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

ADD localtime /etc/localtime

RUN mv /etc/apt/sources.list /etc/apt/sources.list-bak \
    && echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian stable-updates main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian-security/ stable/updates main non-free contrib" > /etc/apt/sources.list \
    && apt-get update \
    && apt-get upgrade -y\
    && apt-get install curl net-tools procps -y \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf /var/cache/apt/* /var/lib/apt/*

CMD ["/bin/bash"]