FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs vsftpd db5.3-util whois \
 && mkdir -p /var/run/vsftpd/empty /etc/vsftpd/user_conf /var/ftp \
 && touch /var/log/vsftpd.log

COPY startup.sh /startup.sh
COPY vsftpd_virtual /etc/pam.d

VOLUME /data
EXPOSE 20 21

CMD ["/startup.sh"]