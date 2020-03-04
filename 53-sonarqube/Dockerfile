FROM jm-openjdk11

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y && apt-get install unzip && rm -rf /var/cache/apt/* /var/lib/apt/*

#RUN jm_download https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.1.0.31237.zip /sonarqube.zip \
RUN jm_download https://www.softking.top/sonarqube-8.1.0.31237.zip /sonarqube.zip \
 && unzip /sonarqube.zip && ln -s /sonarqube-8.1.0.31237 /sonarqube \
 && useradd qube -m && chown qube\: -R /sonarqube*

COPY startup.sh /startup.sh

EXPOSE 9000
VOLUME /sonarqube/conf

USER qube

CMD ["/startup.sh"]