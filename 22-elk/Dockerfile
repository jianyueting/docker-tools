FROM debian-openjdk11

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN  apt-get update && apt-get upgrade -y \
#    && apt-get install procps -y && rm -rf /var/lib/apt/* /var/cache/apt/* \
#    && curl -L https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.4.2-amd64.deb -o /elasticsearch-7.4.2-amd64.deb && dpkg -i /elasticsearch-7.4.2-amd64.deb && rm /elasticsearch-7.4.2-amd64.deb \
#    && sed -i '$anode.name: node-1\nnetwork.host: 0.0.0.0\ncluster.initial_master_nodes: ["node-1"]' /etc/elasticsearch/elasticsearch.yml \
#    && curl -L https://artifacts.elastic.co/downloads/logstash/logstash-7.4.2.deb  -o /logstash-7.4.2.deb && dpkg -i /logstash-7.4.2.deb && rm /logstash-7.4.2.deb \
#    && curl -L https://artifacts.elastic.co/downloads/kibana/kibana-7.4.2-amd64.deb -o /kibana-7.4.2-amd64.deb && dpkg -i /kibana-7.4.2-amd64.deb && rm /kibana-7.4.2-amd64.deb \
#    && sed -i '$aserver.host: "0.0.0.0"\nelasticsearch.requestTimeout: 90000\nelasticsearch.startupTimeout: 50000' /etc/kibana/kibana.yml

RUN  apt-get update && apt-get upgrade -y \
        && apt-get install procps -y && rm -rf /var/lib/apt/* /var/cache/apt/* \
        && curl -L https://www.softking.top/elasticsearch-7.4.2-amd64.deb -o /elasticsearch-7.4.2-amd64.deb && dpkg -i /elasticsearch-7.4.2-amd64.deb && rm /elasticsearch-7.4.2-amd64.deb \
        && sed -i '$anode.name: node-1\nnetwork.host: 0.0.0.0\ncluster.initial_master_nodes: ["node-1"]' /etc/elasticsearch/elasticsearch.yml \
        && curl -L https://www.softking.top/logstash-7.4.2.deb  -o /logstash-7.4.2.deb && dpkg -i /logstash-7.4.2.deb && rm /logstash-7.4.2.deb \
        && curl -L https://www.softking.top/kibana-7.4.2-amd64.deb -o /kibana-7.4.2-amd64.deb && dpkg -i /kibana-7.4.2-amd64.deb && rm /kibana-7.4.2-amd64.deb \
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
