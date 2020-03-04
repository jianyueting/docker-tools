FROM debian:10.3

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN echo "deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free\ndeb http://mirrors.ustc.edu.cn/debian stable-updates main contrib non-free\ndeb http://mirrors.ustc.edu.cn/jm-security/ stable/updates main non-free contrib" > /etc/apt/sources.list \
 && apt-get update && apt-get upgrade -y && apt-get install bash curl unzip net-tools procps nano -y && rm -rf /var/cache/apt/* /var/lib/apt/* \
 && rm /bin/sh && ln -s bash /bin/sh \
 && echo "Asia/Shanghai" > /etc/timezone

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

ADD localtime /etc/localtime
ADD wait-for-it.sh /wait-for-it.sh
ADD scripts/jm_* /usr/sbin/
RUN chmod +x /wait-for-it.sh /usr/sbin/jm_*

CMD ["/bin/bash"]