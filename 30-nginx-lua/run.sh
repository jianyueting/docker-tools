#!/usr/bin/env bash

source ../base-functions.sh

docker run -d -v ${pwd}/data:/data --name nginx-lua debian-nginx-lua

connect_to_image nginx-lua
