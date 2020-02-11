FROM debian-nginx

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    && apt-get install unzip php-fpm php-mysql php-mbstring -y \
    && curl -L https://files.phpmyadmin.net/phpMyAdmin/5.0.0/phpMyAdmin-5.0.0-all-languages.zip -o /phpMyAdmin-5.0.0-all-languages.zip \
    && mkdir /www && unzip /phpMyAdmin-5.0.0-all-languages.zip -d /www && mv /www/phpMyAdmin-5.0.0-all-languages /www/myadmin && rm /phpMyAdmin-5.0.0-all-languages.zip \
    && sed -i "s#\$cfg\['AllowArbitraryServer'\] = false;#\$cfg['AllowArbitraryServer']=true;#" /www/myadmin/libraries/config.default.php && mkdir /www/myadmin/tmp \
    && chown www-data\: -R /www/myadmin \
    && rm -rf /var/lib/apt/* /var/cache/apt/*

COPY startup.sh /startup.sh

EXPOSE 80

CMD ["/startup.sh"]