FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

#RUN jm_install_pkgs apt-transport-https gnupg ca-certificates \
# && echo "deb https://apache.bintray.com/couchdb-deb buster main" >/etc/apt/sources.list.d/couchdb.list \
# && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8756C4F765C9AC3CB6B85D62379CE192D401AB61 \
# && jm_install_pkgs couchdb \
# && rmidr /opt/couchdb/data && ln -s /data /opt/couchdb

RUN jm_install_pkgs libmozjs-60-0 libicu63 \
 && jm_download https://www.softking.top/couchdb_3.0.0.deb /couchdb.deb && jm_install_debs /couchdb.deb \
 && rmdir /opt/couchdb/data && ln -s /data /opt/couchdb

COPY startup.sh /startup.sh

EXPOSE 4369
VOLUME /data

CMD ["/startup.sh"]