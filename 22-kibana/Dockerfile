FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://artifacts.elastic.co/downloads/kibana/kibana-7.5.2-amd64.deb /kibana.deb && jm_install_debs /kibana.deb \
RUN jm_download https://www.softking.top/kibana-7.5.2-amd64.deb /kibana.deb && jm_install_debs /kibana.deb \
 && sed -i '$aserver.host: "0.0.0.0"\nelasticsearch.requestTimeout: 90000\nelasticsearch.startupTimeout: 50000' /etc/kibana/kibana.yml

COPY startup.sh /startup.sh

CMD ["/startup.sh"]