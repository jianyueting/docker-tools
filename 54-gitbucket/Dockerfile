FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

#RUN jm_download https://github.com/gitbucket/gitbucket/releases/download/4.33.0/gitbucket.war /gitbucket.war
RUN jm_download https://www.softking.top/gitbucket.war /gitbucket.war

EXPOSE 8080 29418

VOLUME /data/repositories

CMD ["/startup.sh"]