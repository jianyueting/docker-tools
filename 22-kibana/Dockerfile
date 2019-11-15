FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

COPY startup.sh /startup.sh

#RUN chmod +x /startup.sh \
#    && curl -L https://artifacts.elastic.co/downloads/kibana/kibana-7.4.2-amd64.deb -o /kibana-7.4.2-amd64.deb && dpkg -i /kibana-7.4.2-amd64.deb && rm /kibana-7.4.2-amd64.deb \
#    && sed -i '$aserver.host: "0.0.0.0"\nelasticsearch.requestTimeout: 90000\nelasticsearch.startupTimeout: 50000' /etc/kibana/kibana.yml

RUN chmod +x /startup.sh \
    && curl -L https://www.softking.top/kibana-7.4.2-amd64.deb -o /kibana-7.4.2-amd64.deb && dpkg -i /kibana-7.4.2-amd64.deb && rm /kibana-7.4.2-amd64.deb \
    && sed -i '$aserver.host: "0.0.0.0"\nelasticsearch.requestTimeout: 90000\nelasticsearch.startupTimeout: 50000' /etc/kibana/kibana.yml


CMD ["/startup.sh"]