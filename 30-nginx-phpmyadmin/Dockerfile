FROM jm-nginx

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs php-fpm php-mysql php-mbstring \
 && jm_download https://files.phpmyadmin.net/phpMyAdmin/5.0.0/phpMyAdmin-5.0.0-all-languages.zip /phpMyAdmin.zip \
 && mkdir /www && unzip /phpMyAdmin.zip -d /www && mv /www/phpMyAdmin-5.0.0-all-languages /www/myadmin && rm /phpMyAdmin.zip \
 && sed -i "s#\$cfg\['AllowArbitraryServer'\] = false;#\$cfg['AllowArbitraryServer']=true;#" /www/myadmin/libraries/config.default.php && mkdir /www/myadmin/tmp \
 && chown www-data\: -R /www/myadmin

COPY startup.sh /startup.sh

EXPOSE 80
VOLUME /etc/nginx/sites-enabled

CMD ["/startup.sh"]