#!/usr/bin/env bash

source ../base-functions.sh
#base=$(pwd)
base=/tmp

mkdir -p ${base}/mongodb-data &>/dev/null
docker run -d --rm -v ${base}/mongodb-data:/data -p 27017:27017 --name mongodb debian-mongodb &>/dev/null

connect_to_image mongodb