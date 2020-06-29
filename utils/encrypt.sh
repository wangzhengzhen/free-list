#!/bin/bash

while getopts 'dei:o:p:' OPT; do
    case $OPT in
        i)
            IN_FILE="$OPTARG";;
        o)
            OUT_FILE="$OPTARG";;
        p)
            PASS_FILE="$OPTARG";;
        e)
            OP="enc";;
        d)
            OP="dec";;
        ?)
            # echo "Usage: `basename $0` [options] filename"
    esac
done

case "$OP" in
"enc")
    openssl enc -des-ede3-cfb -e -base64 -pass file:$PASS_FILE -pbkdf2 -in $IN_FILE -out $OUT_FILE
;;
"dec")
    openssl enc -des-ede3-cfb -d -base64 -pass file:$PASS_FILE -pbkdf2 -in $IN_FILE -out $OUT_FILE
;;
*)
    echo "参数错误，用法如下："
    echo "-e 加密"
    echo "-d 解密"
    echo "-p [文件路径] 密钥文件"
    echo "-i [文件路径] 加密/解密文本"
    echo "-o [文件路径] 输出结果"
;;
esac