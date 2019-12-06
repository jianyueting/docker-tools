#!/usr/bin/env bash

# Create home dir and update vsftpd user db:
mkdir -p "/data/${FTP_USER}"
chown -R ftp:ftp /data

echo -e "${FTP_USER}\n${FTP_PASSWORD}" > /etc/vsftpd/virtual_users.txt
/usr/bin/db5.3_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db

/usr/sbin/vsftpd /etc/vsftpd.conf &

tail -f /dev/null
