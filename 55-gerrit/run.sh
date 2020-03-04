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

create_network git

#docker run -d --rm --name gerrit  --network git --hostname gerrit -p 80:80 -p 29419:29418 -v $(current_directory $0)/conf/default:/etc/nginx/sites-enabled/default  -v  $(current_directory $0)/conf/replication.config:/gerrit/etc/replication.config jm-gerrit

docker run -d --rm --name gerrit  --network git --hostname gerrit -p 80:80 -p 29419:29418 -v $(current_directory $0)/conf/default:/etc/nginx/sites-enabled/default jm-gerrit

connect_to_image gerrit