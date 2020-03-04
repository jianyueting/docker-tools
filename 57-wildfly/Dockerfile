FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://download.jboss.org/wildfly/18.0.1.Final/wildfly-18.0.1.Final.tar.gz /wildfly.tgz \
RUN jm_download https://www.softking.top/wildfly-18.0.1.Final.tar.gz /wildfly.tgz \
 && jm_untar /wildfly.tgz && ln -s /wildfly-18.0.1.Final /wildfly\
 && /wildfly/bin/add-user.sh -u admin -p admin \
 && sed -i 's/127.0.0.1/0.0.0.0/' /wildfly/standalone/configuration/standalone.xml

COPY startup.sh /startup.sh

EXPOSE 8080 9990 8443

CMD ["/startup.sh"]