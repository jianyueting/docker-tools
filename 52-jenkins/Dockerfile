FROM jm-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_download https://mirrors.ustc.edu.cn/jenkins/war/latest/jenkins.war /jenkins.war

COPY startup.sh /startup.sh

EXPOSE 8080

CMD ["/startup.sh"]