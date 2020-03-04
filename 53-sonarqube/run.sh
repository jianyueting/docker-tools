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

#docker run -d --rm --name sonarqube -p 9000:9000 -v $(current_directory $0)/conf/sonar.properties:/sonarqube/conf/sonar.properties jm-sonarqube

docker run -d --rm --name sonarqube -p 9000:9000 jm-sonarqube

connect_to_image sonarqube