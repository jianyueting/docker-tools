FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://downloads.jboss.org/keycloak/8.0.2/keycloak-8.0.2.tar.gz /keycloak.tgz \
RUN jm_download https://www.softking.top/keycloak-8.0.2.tar.gz /keycloak.tgz \
 && jm_untar /keycloak.tgz && ln -s /keycloak-8.0.2 /keycloak \
 && sed -i 's#127.0.0.1#0.0.0.0#' /keycloak/standalone/configuration/standalone.xml \
 && /keycloak/bin/add-user-keycloak.sh -u admin -p admin

COPY startup.sh /startup.sh

EXPOSE 8080 9990

CMD ["/startup.sh"]