FROM jm-openjdk11

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://artifacts.elastic.co/downloads/logstash/logstash-7.5.2.deb /logstash-7.5.2.deb && jm_install_debs /logstash-7.5.2.deb
RUN jm_download https://www.softking.top/logstash-7.5.2.deb /logstash-7.5.2.deb && jm_install_debs /logstash-7.5.2.deb

COPY startup.sh /startup.sh

VOLUME /etc/logstash/conf.d

# custom logstash ports
EXPOSE 4560

CMD ["/startup.sh"]
