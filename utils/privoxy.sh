#!/bin/bash
#
# 生成 privoxy 格式
# 用法：./privoxy.sh [规则列表] [输出privoxy文件路径]
#

echo >$2
echo "{{alias}}">>$2
echo "direct=+forward-override{forward .}">>$2
echo "gfw=+forward-override{forward-socks5 127.0.0.1:1080 .}">>$2
echo "default=direct">>$2
echo >>$2
echo "{default}">>$2
echo "/">>$2
echo >>$2
echo "{direct}">>$2
echo "/">>$2
echo >>$2
echo "{gfw}">>$2

cat $1 | while read line || [ -n "$line" ]
do
    if [[ $line =~ ^[^\#].* ]]; then
        echo $line>>$2
    fi
done
