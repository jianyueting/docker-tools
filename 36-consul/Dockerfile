FROM debian-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN apt-get update && apt-get upgrade -y && apt-get install unzip -y && rm -rf /var/lib/apt/* /var/cache/apt/* \
#    && curl https://releases.hashicorp.com/consul/1.6.2/consul_1.6.2_linux_amd64.zip -o /consul_1.6.2_linux_amd64.zip \
#    && unzip /consul_1.6.2_linux_amd64.zip && rm /consul_1.6.2_linux_amd64.zip

RUN apt-get update && apt-get upgrade -y && apt-get install unzip -y && rm -rf /var/lib/apt/* /var/cache/apt/* \
    && curl https://www.softking.top/consul_1.6.2_linux_amd64.zip -o /consul_1.6.2_linux_amd64.zip \
    && unzip /consul_1.6.2_linux_amd64.zip && rm /consul_1.6.2_linux_amd64.zip

COPY startup.sh /startup.sh
EXPOSE 8500 8600 8502

CMD ["/startup.sh"]