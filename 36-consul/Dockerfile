FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_download https://releases.hashicorp.com/consul/1.6.2/consul_1.6.2_linux_amd64.zip /consul.zip \
RUN jm_download https://www.softking.top/consul_1.6.2_linux_amd64.zip /consul.zip \
  && unzip /consul_1.6.2_linux_amd64.zip && rm /consul_1.6.2_linux_amd64.zip

COPY startup.sh /startup.sh

EXPOSE 8500 8600 8502

CMD ["/startup.sh"]