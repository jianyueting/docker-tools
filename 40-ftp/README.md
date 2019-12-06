Docker ftp
====

### 说明
使用vsftpd，认证用户才可以上传和下载文件。配置环境变量 FTP\_USER和FTP\_PASSWORD配置可以登录的用户名和密码，也可以后续修改/etc/vsftpd/virtual_users.txt添加用户。 /etc/vsftpd/virtual_users.txt文件规则奇数行表示用户名，偶数行表示密码。运行`/usr/bin/db5.3_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db`最终添加用户。