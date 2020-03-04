FROM jm-nginx

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs php-fpm php-mysql php-mbstring \
 && jm_download http://dl.cnezsoft.com/zentao/12.0/ZenTaoPMS.12.0.stable.zip /ZenTaoPMS.zip \
 && mkdir /www && unzip /ZenTaoPMS.zip -d /www && rm /ZenTaoPMS.zip \
 && chown www-data\: -R /www/zentaopms

COPY startup.sh /startup.sh

EXPOSE 80
VOLUME /etc/nginx/sites-enabled

CMD ["/startup.sh"]