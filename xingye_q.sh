#!/usr/bin/bash

# feed
# cd /home/toby/q/v3.6
# source /home/toby/q/env32.sh
# nohup /home/toby/q/v3.6/l32/q  /home/toby/q/feedhandler/xingye_feed.q >/tmp/q.log 2>&1 &
source /q/env.sh; cd /mylab/q; nohup /q/l64/q > /tmp/xingye_feed.log 2>&1 <<< '\l /mylab/q/feedhandler/xingye_feed.q' &

# tickerplant
# history log in /home/toby/data/datasource
# 注意不要带斜杠/，否则运行RDB时会出错
source /q/env.sh; cd /mylab/q; nohup /q/l64/q $* tick.q symxingye /data/datasource/xingye -p 5010 </dev/null > /tmp/xingye_tp.log 2>&1 &

sleep 5
# rdb 等待tickerplan启动起来
source /q/env.sh; cd /mylab/q; nohup /q/l64/q tick/r.q :5010 -p 5011 </dev/null > /tmp/xingye_rdb.log 2>&1 &

