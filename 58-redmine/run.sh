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

create_network redmine

#docker run -d --rm --name redmine --network redmine --hostname redmine -p 3000:3000 -v $(current_directory ${0})/conf/database.yml:/redmine/config/database.yml -v $(current_directory ${0})/redmine-plugins:/redmine/plugins jm-redmine
docker run -d --rm --name redmine --network redmine --hostname redmine -p 3000:3000 -v $(current_directory ${0})/conf/database.yml:/redmine/config/database.yml jm-redmine

connect_to_image redmine
