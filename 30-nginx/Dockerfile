FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs nginx

COPY startup.sh /startup.sh

EXPOSE 80

VOLUME /data /etc/nginx/sites-enabled

CMD ["/startup.sh"]