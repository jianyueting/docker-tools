FROM debian-openjdk11

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN curl -L https://artifacts.elastic.co/downloads/logstash/logstash-7.5.2.deb -o /elasticsearch-7.5.2-amd64.deb && dpkg -i /elasticsearch-7.5.2-amd64.deb && rm /elasticsearch-7.5.2-amd64.deb 

RUN curl -L https://www.softking.top/logstash-7.5.2.deb -o /logstash-7.5.2.deb && dpkg -i /logstash-7.5.2.deb && rm /logstash-7.5.2.deb

COPY startup.sh /startup.sh

VOLUME /etc/logstash/conf.d

# custom logstash ports
EXPOSE 4560

CMD ["/startup.sh"]
