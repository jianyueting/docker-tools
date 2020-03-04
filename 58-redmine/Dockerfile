FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs ruby ruby-dev build-essential imagemagick libmagickcore-dev libmagickwand-dev libmariadb-dev apache2 libapache2-mod-passenger git pkg-config \
#&& jm_download https://www.redmine.org/releases/redmine-4.0.6.tar.gz /redmine.tgz \
 && jm_download https://www.softking.top/4.0.6.tar.gz /redmine.tgz \
 && jm_untar /redmine.tgz && ln -s /redmine-4.0.6 /redmine \
 && touch /redmine/log/production.log && gem sources --remove https://rubygems.org/ && gem sources -a https://mirrors.tuna.tsinghua.edu.cn/rubygems/  && gem sources -u \
 && gem install bundler mysql2 && cp /redmine/config/database.yml{.example,} \
 && pushd /redmine && sed -i 's#https://rubygems.org#https://mirrors.tuna.tsinghua.edu.cn/rubygems/#' Gemfile && bundle config set without 'development test' && bundle install

COPY redmine_apache.conf /etc/apache2/redmine_apache.conf
COPY startup.sh /startup.sh

EXPOSE 80
VOLUME /redmine/config /redmine/plugins

CMD ["/startup.sh"]