FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs  adduser libfontconfig1 \
# && jm_download https://dl.grafana.com/oss/release/grafana_6.6.1_amd64.deb /grafana.deb \
 && jm_download https://www.softking.top/grafana_6.6.1_amd64.deb /grafana.deb \
 && jm_install_debs /grafana.deb

COPY startup.sh /startup.sh

EXPOSE 3000

CMD ["/startup.sh"]