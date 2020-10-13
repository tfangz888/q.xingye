#!/bin/bash

cd /home/toby/q

# tickerplant
# history log in /home/toby/data/datasource/xingye
# 注意不要带斜杠/，否则运行RDB时会出错
# /home/toby/q/l32/q tick.q symxingye /home/toby/data/datasource/xingye  -p 5010 </dev/null >/dev/null 2>&1 
nohub q32 tick.q symxingye /home/toby/data/datasource/xingye  -p 5010 </dev/null >/dev/null 2>&1 &
