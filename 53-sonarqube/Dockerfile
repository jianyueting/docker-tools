FROM debian-openjdk11

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

RUN apt-get update && apt-get upgrade -y && apt-get install unzip && rm -rf /var/cache/apt/* /var/lib/apt/*

#RUN curl -L https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.1.0.31237.zip -o /sonarqube-8.1.0.31237.zip \
#    && unzip /sonarqube-8.1.0.31237.zip && ln -s /sonarqube-8.1.0.31237 /sonarqube && rm /sonarqube-8.1.0.31237.zip \
#    && useradd qube -m && chown qube\: -R /sonarqube-8.1.0.31237

RUN curl -L https://www.softking.top/sonarqube-8.1.0.31237.zip -o /sonarqube-8.1.0.31237.zip \
    && unzip /sonarqube-8.1.0.31237.zip && ln -s /sonarqube-8.1.0.31237 /sonarqube && rm /sonarqube-8.1.0.31237.zip \
    && useradd qube -m && chown qube\: -R /sonarqube-8.1.0.31237

EXPOSE 9000

VOLUME /sonarqube/conf

USER qube

CMD ["/startup.sh"]