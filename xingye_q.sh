#!/bin/bash

cd /home/toby/q

# tickerplant
# history log in /media/sf_e/data/datasource
# 注意不要带斜杠/，否则运行RDB时会出错
# q tick.q symxingye /media/sf_e/data/datasource/xingye -p 5001 </dev/null >/dev/null 2>&1 &
q tick.q symxingye /media/sf_e/data/datasource/xingye  -p 5010 </dev/null >/dev/null 2>&1
sleep 1

q ./feedhandler/feed.q </dev/null >/dev/null 2>&1

# rdb, 端口为5011
# 先装入TP的LOG文件。00:00点钟时会存入当天的数据
q tick/r.q :5010 -p 5011 </dev/null >/dev/null 2>&1

# rdb, 端口为5012
# q tick/cx.q rdb :5010 -p 5012

# hlcv, 端口为5014, 连接TP的5010, 一秒一次
q tick/cx.q hlcv -p 5014 -t 1000 </dev/null >/dev/null 2>&1

# last, 端口为5015, 连接TP的5010, 一秒一次
q tick/cx.q last -p 5015 -t 1000 </dev/null >/dev/null 2>&1

# tq, 端口为5016, 连接TP的5010, 一秒一次
# q tick/cx.q tq -p 5016 -t 1000

# vwap, 端口为5017, 连接TP的5010, 一秒一次
# q tick/cx.q vwap -p 5017 -t 1000

# show
# q tick/cx.q show

