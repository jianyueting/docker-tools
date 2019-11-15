FROM debian-openjdk11

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN curl -L https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.4.2-amd64.deb -o /elasticsearch-7.4.2-amd64.deb && dpkg -i /elasticsearch-7.4.2-amd64.deb && rm /elasticsearch-7.4.2-amd64.deb 

RUN curl -L https://www.softking.top/elasticsearch-7.4.2-amd64.deb -o /elasticsearch-7.4.2-amd64.deb && dpkg -i /elasticsearch-7.4.2-amd64.deb && rm /elasticsearch-7.4.2-amd64.deb

COPY startup.sh /startup.sh

VOLUME /var/lib/elasticsearch

# elasticsearh ports
EXPOSE 9200 9300

CMD ["/startup.sh"]
