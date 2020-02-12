FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

#RUN curl -L https://downloads.jboss.org/keycloak/8.0.2/keycloak-8.0.2.tar.gz -o /keycloak-8.0.2.tar.gz \
#    && tar xf /keycloak-8.0.2.tar.gz && ln -s /keycloak-8.0.2 /keycloak && rm /keycloak-8.0.2.tar.gz \
#    && sed -i 's#127.0.0.1#0.0.0.0#' /keycloak/standalone/configuration/standalone.xml \
#    && /keycloak/bin/add-user-keycloak.sh -u jeff -p jeff1234

RUN curl -L https://www.softking.top/keycloak-8.0.2.tar.gz -o /keycloak-8.0.2.tar.gz \
    && tar xf /keycloak-8.0.2.tar.gz && ln -s /keycloak-8.0.2 /keycloak && rm /keycloak-8.0.2.tar.gz \
    && sed -i 's#127.0.0.1#0.0.0.0#' /keycloak/standalone/configuration/standalone.xml

RUN /keycloak/bin/add-user-keycloak.sh -u admin -p admin

CMD ["/startup.sh"]