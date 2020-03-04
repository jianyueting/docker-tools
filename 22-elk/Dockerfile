FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

ENV JAVA_HOME=/usr/share/elasticsearch/jdk
ENV PATH=${JAVA_HOME}/bin:${PATH}

#RUN jm_download https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.5.2-amd64.deb /elasticsearch.deb && jm_install_debs /elasticsearch.deb \
#&&jm_download https://artifacts.elastic.co/downloads/logstash/logstash-7.5.2.deb /logstash.deb && jm_install_debs /logstash.deb \
#&&jm_download https://artifacts.elastic.co/downloads/kibana/kibana-7.5.2-amd64.deb /kibana.deb && jm_install_debs /kibana.deb \
RUN jm_download https://www.softking.top/elasticsearch-7.5.2-amd64.deb  /elasticsearch.deb && jm_install_debs /elasticsearch.deb \
 && jm_download https://www.softking.top/logstash-7.5.2.deb /logstash.deb && jm_install_debs /logstash.deb \
 && jm_download https://www.softking.top/kibana-7.5.2-amd64.deb /kibana.deb && jm_install_debs /kibana.deb \
 && sed -i '$anode.name: node-1\nnetwork.host: 0.0.0.0\ncluster.initial_master_nodes: ["node-1"]' /etc/elasticsearch/elasticsearch.yml\
 && jm_download https://www.softking.top/elasticsearch-analysis-ik-7.5.2.zip /ik.zip \
 && mkdir -p /usr/share/elasticsearch/plugins/ik && unzip /ik.zip -d /usr/share/elasticsearch/plugins/ik && rm /ik.zip \
 && sed -i '$aserver.host: "0.0.0.0"\nelasticsearch.requestTimeout: 90000\nelasticsearch.startupTimeout: 50000' /etc/kibana/kibana.yml

COPY startup.sh /startup.sh

VOLUME /etc/logstash/conf.d /var/lib/elasticsearch

# elasticsearh ports
EXPOSE 9200 9300
# kibana ports
EXPOSE 5601
# custom logstash ports
EXPOSE 4560

CMD ["/startup.sh"]
