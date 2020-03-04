FROM jm-openjdk8-sshd

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs nginx git apache2-utils \
#&& jm_download https://gerrit-releases.storage.googleapis.com/gerrit-3.1.3.war /gerrit-3.1.3.war \
 && jm_download https://www.softking.top/gerrit-3.1.3.war /gerrit-3.1.3.war \
 && java -jar /gerrit-3.1.3.war init -b --install-all-plugins -d /gerrit \
 && pkill -15 java && java -jar /gerrit-3.1.3.war reindex -d /gerrit \
 && rm /gerrit-3.1.3.war \
 && git config -f /gerrit/etc/gerrit.config auth.type "http" \
 && git config -f /gerrit/etc/gerrit.config httpd.listenUrl "proxy-http://*:8080/gerrit" \
 && git config -f /gerrit/etc/gerrit.config gerrit.canonicalWebUrl "http://localhost/gerrit" \
 && htpasswd -cb /gerrit.user root root

COPY startup.sh /startup.sh

EXPOSE 29418 80
VOLUME /etc/nginx/sites-enabled /gerrit/etc

CMD ["/startup.sh"]