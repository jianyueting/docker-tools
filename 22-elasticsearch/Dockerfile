FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.5.2-amd64.deb /elasticsearch.deb \
# && jm_download https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.5.2/elasticsearch-analysis-ik-7.5.2.zip /ik.zip \
RUN jm_download https://www.softking.top/elasticsearch-7.5.2-amd64.deb /elasticsearch.deb \
 && jm_download https://www.softking.top/elasticsearch-analysis-ik-7.5.2.zip /ik.zip \
 && jm_install_debs /elasticsearch.deb \
 && mkdir -p /usr/share/elasticsearch/plugins/ik && unzip /ik.zip -d /usr/share/elasticsearch/plugins/ik && rm /ik.zip

COPY startup.sh /startup.sh

ENV JAVA_HOME=/usr/share/elasticsearch/jdk
ENV PATH=${JAVA_HOME}/bin:${PATH}

VOLUME /var/lib/elasticsearch

# elasticsearh ports
EXPOSE 9200 9300

CMD ["/startup.sh"]
