FROM jm-nginx

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs lua-nginx-redis lua-json lua-sql-mysql

COPY startup.sh /startup.sh

EXPOSE 80

VOLUME /data /etc/nginx/sites-enabled

CMD ["/startup.sh"]
