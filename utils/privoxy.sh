#!/bin/bash

# 生成 privoxy 格式
# 用法：./privoxy.sh [规则列表] [输出privoxy文件路径]
cat $1 | while read line || [ -n "$line" ]
do
    if [[ $line =~ ^[^\#].* ]]; then
        echo $line>>$2
    fi
done