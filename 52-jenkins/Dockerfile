FROM debian-openjdk8

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

RUN curl -L https://mirrors.ustc.edu.cn/jenkins/war/latest/jenkins.war -o /jenkins.war 

CMD ["/startup.sh"]