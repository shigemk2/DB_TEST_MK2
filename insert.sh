#!/bin/sh

# 指定した回数だけtweet.rbを実行するだけのスクリプト
a=0
while [ $a -ne $1 ]
do
    ruby tweet.rb
    a=`expr 1 + $a`
    echo "${a} 回目の処理"
done
