FROM jm-base

MAINTAINER Jian Yueting <jianyueting@gmail.com>

RUN jm_install_pkgs openssh-server openssh-client \
 && mkdir -p /run/sshd /root/.ssh && chmod 700 /root/.ssh \
 && ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '' && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
 && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config 

COPY startup.sh /startup.sh
COPY ssh_config /root/.ssh/config

EXPOSE 22

CMD ["/startup.sh"]