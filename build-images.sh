#!/usr/bin/env bash

for dir in $(echo */);do
	pushd ${dir} &>/dev/null
    if [ ! -f Dockerfile ]; then
        continue
    fi
    #去除排序数字和最后/字符
	name=${dir#??-}
    name=debian-"${name%/}"
	echo ${name}
    docker images|grep -q ${name}
    if [ $? -ne 0 ];then
        echo "Building ${BG_RED}${BLUE}${name}${NORMAL} ..."
        pushd ${dir} &>/dev/null
        docker build -t "${name}" .
        popd &>/dev/null
    fi
	popd &>/dev/null
done
