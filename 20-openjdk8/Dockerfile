FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN apt-get update && apt-get upgrade -y\
    && apt-get install java-common libasound2 libx11-6 libxau6 libxcb1 libxdmcp6 libxext6 libxi6 libxrender1 libxtst6 libfontconfig1 -y \
    && rm -rf /var/cache/apt/* /var/lib/apt/* \
    && curl https://cdn.azul.com/zulu/bin/zulu8.42.0.23-ca-jdk8.0.232-linux_amd64.deb -o /zulu8.42.0.23-ca-jdk8.0.232-linux_amd64.deb && dpkg -i /zulu8.42.0.23-ca-jdk8.0.232-linux_amd64.deb \
    && rm -f /zulu8.42.0.23-ca-jdk8.0.232-linux_amd64.deb

ENV JAVA_HOME=/usr/lib/jvm/zulu-8-amd64 \
    PATH=${JAVA_HOME}/bin:${PATH}

CMD ["/bin/bash"]