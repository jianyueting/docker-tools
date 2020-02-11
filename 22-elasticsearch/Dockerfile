FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN curl -L https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.5.2-amd64.deb -o /elasticsearch-7.5.2-amd64.deb && dpkg -i /elasticsearch-7.5.2-amd64.deb && rm /elasticsearch-7.5.2-amd64.deb \
#    && curl -L https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.5.2/elasticsearch-analysis-ik-7.5.2.zip  -o /elasticsearch-analysis-ik-7.5.2.zip \
#   && mkdir -p /usr/share/elasticsearch/plugins/ik \
#   && unzip /elasticsearch-analysis-ik-7.5.2.zip -d /usr/share/elasticsearch/plugins/ik \
#   && rm -rf /var/cache/apt/* /var/lib/apt/*

RUN apt-get update && apt-get upgrade -y \
    && apt-get install unzip \
    && curl -L https://www.softking.top/elasticsearch-7.5.2-amd64.deb -o /elasticsearch-7.5.2-amd64.deb && dpkg -i /elasticsearch-7.5.2-amd64.deb && rm /elasticsearch-7.5.2-amd64.deb \
    && curl -L https://www.softking.top/elasticsearch-analysis-ik-7.5.2.zip  -o /elasticsearch-analysis-ik-7.5.2.zip \
    && mkdir -p /usr/share/elasticsearch/plugins/ik \
    && unzip /elasticsearch-analysis-ik-7.5.2.zip -d /usr/share/elasticsearch/plugins/ik \
    && rm -rf /var/cache/apt/* /var/lib/apt/*

COPY startup.sh /startup.sh

ENV JAVA_HOME=/usr/share/elasticsearch/jdk
ENV PATH=${JAVA_HOME}/bin:${PATH}

VOLUME /var/lib/elasticsearch

# elasticsearh ports
EXPOSE 9200 9300

CMD ["/startup.sh"]
