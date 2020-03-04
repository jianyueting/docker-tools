#!/usr/bin/env bash

#当前目录
function current_directory(){
    file=${1}
    dir=$(dirname ${file})
    echo $(realpath ${dir})
}

#父目录
function parent_directory(){
    file=${1}
    dir=$(dirname ${file})/..
    echo $(realpath ${dir})
}

source $(parent_directory $0)/base-functions.sh
#base=$(pwd)
base=/tmp

mkdir ${base}/data &>/dev/null

remove_image ftp
docker run --rm -d -p 21:21 -p 20:20 -e FTP_USER=jeff -e FTP_PASSWORD=123456 --name ftp -v $(current_directory $0)/vsftpd.conf:/etc/vsftpd.conf -v ${base}/data:/data jm-ftp &>/dev/null

connect_to_image ftp