#!/bin/sh
#################################################################
###《 Github 仓库同步脚本 》                                  ###
### 同步远程 Github 仓库代码，如果出现异常，则直接删除后重来  ###
### Created by: anonymouscoward <root@anonymous744wjcx.onion> ###
### Created Date: Sat Sep 26 12:21:00 CST 2015                ###
#################################################################
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export LANG=zh_CN.UTF-8
date >>~/gitpull.log
GITHUB="https://github.com"
DSTDIR="/home/ghw/wwwroot"

REPOS="gehaowu/gehaowu.github.io master www.gehaowu.com
gehaowu/zh-Hans gh-pages www.gehaowu.com/zh-Hans
gehaowu/notes gh-pages www.gehaowu.com/notes
gehaowu/albums gh-pages www.gehaowu.com/albums
gehaowu/resume gh-pages www.gehaowu.com/resume
gehaowu/data gh-pages www.gehaowu.com/data
gehaowu/Resources gh-pages www.gehaowu.com/Resources"

while read repo branch dir
do
    (cd "${DSTDIR}/${dir}" && git pull)
    if [ "$?" -ne 0 ]; then
        rm -fr "${DSTDIR}/${dir}"
        git clone --depth 1 -b "${branch}" "${GITHUB}/${repo}" "${DSTDIR}/${dir}"
    fi
done <<-EOF
${REPOS}
EOF
