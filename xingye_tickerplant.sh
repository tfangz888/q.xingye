#!/bin/bash

cd /home/toby/q

# tickerplant
# history log in /media/sf_e/data/datasource
# 注意不要带斜杠/，否则运行RDB时会出错
/home/toby/q/l32/q tick.q symxingye /media/sf_e/data/datasource/xingye  -p 5010 </dev/null >/dev/null 2>&1 