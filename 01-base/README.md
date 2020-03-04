基础
====

### 说明
----

- 配置中文环境
- 安装 curl、net-tools、procps、nano、unzip 工具
- 使用bash做为默认sh
- 配置时区为"Asia/Shanghai"并添加 timezone 文件

配置脚本文件

脚本使用说明

|脚本|使用方式|说明|
|----|----|----|
|jm_download|jm_download url file|下载url，保存文件为file|
|jm_install_deps|jm_install_debs *.deb|安装当前目录下的*.deb文件，安装完成后删除对应deb文件|
|jm_install_pkgs|jm_install_pkgs xx|使用源安装xx软件|
|jm_update_pkgs|jm_update_pkgs|使用源更新系统|
|jm_untar|jm_untar xx.tgz|解压xx.tgz，并删除xx.tgz|
