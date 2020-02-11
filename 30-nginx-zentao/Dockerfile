FROM debian-nginx

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && apt-get install unzip php-fpm php-mysql php-mbstring -y \
    && curl -L http://dl.cnezsoft.com/zentao/12.0/ZenTaoPMS.12.0.stable.zip -o /ZenTaoPMS.12.0.stable.zip \
    && mkdir /www && unzip /ZenTaoPMS.12.0.stable.zip -d /www && rm /ZenTaoPMS.12.0.stable.zip \
    && chown www-data\: -R /www/zentaopms \
    && rm -rf /var/lib/apt/* /var/cache/apt/*

COPY startup.sh /startup.sh

EXPOSE 80

CMD ["/startup.sh"]