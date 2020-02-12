FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN apt-get update && apt-get upgrade -y\
#    && apt-get install java-common libasound2 libx11-6 libxau6 libxcb1 libxdmcp6 libxext6 libxi6 libxrender1 libxtst6 libfontconfig1 -y \
#    && rm -rf /var/cache/apt/* /var/lib/apt/* \
#    && curl https://cdn.azul.com/zulu/bin/zulu11.35.15-ca-jdk11.0.5-linux_amd64.deb -o /zulu11.35.15-ca-jdk11.0.5-linux_amd64.deb && dpkg -i /zulu11.35.15-ca-jdk11.0.5-linux_amd64.deb \
#    && rm -f /zulu11.35.15-ca-jdk11.0.5-linux_amd64.deb
RUN apt-get update && apt-get upgrade -y\
        && apt-get install java-common libasound2 libx11-6 libxau6 libxcb1 libxdmcp6 libxext6 libxi6 libxrender1 libxtst6 libfontconfig1 -y \
        && rm -rf /var/cache/apt/* /var/lib/apt/* \
        && curl https://www.softking.top/zulu11.35.15-ca-jdk11.0.5-linux_amd64.deb -o /zulu11.35.15-ca-jdk11.0.5-linux_amd64.deb && dpkg -i /zulu11.35.15-ca-jdk11.0.5-linux_amd64.deb \
        && rm -f /zulu11.35.15-ca-jdk11.0.5-linux_amd64.deb

ENV JAVA_HOME=/usr/lib/jvm/zulu-11-amd64
ENV PATH=${JAVA_HOME}/bin:${PATH}

CMD ["/bin/bash"]