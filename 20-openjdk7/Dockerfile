FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://cdn.azul.com/zulu/bin/zulu7.36.0.5-ca-jdk7.0.252-linux_amd64.deb /zulu.deb \
RUN jm_download https://www.softking.top/zulu7.36.0.5-ca-jdk7.0.252-linux_amd64.deb /zulu.deb \
 && jm_install_pkgs java-common libasound2 libx11-6 libxau6 libxcb1 libxdmcp6 libxext6 libxi6 libxrender1 libxtst6 libfontconfig1 \
 && jm_install_debs /zulu.deb

ENV JAVA_HOME=/usr/lib/jvm/zulu-7-amd64
ENV PATH=${JAVA_HOME}/bin:${PATH}

CMD ["/bin/bash"]