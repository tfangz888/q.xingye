mkdir -p /home/toby/q/tick
cp tick/symxingye.q /home/toby/q/tick/
mkdir -p /home/toby/q/feedhandler
cp feedhandler/xingye_feed.q /home/toby/q/feedhandler/

cp xingye_q.sh /home/toby/q/
cp xingye_tickerplant.sh /home/toby/q/
cp xingye_rdb.sh /home/toby/q/

sudo cp xingye_feed.service /etc/systemd/system/
sudo cp xingye_feed.timer /etc/systemd/system/
sudo cp xingye_tickerplant.service /etc/systemd/system/
sudo cp xingye_tickerplant.timer /etc/systemd/system/
sudo cp xingye_rdb.service /etc/systemd/system/
sudo cp xingye_rdb.timer /etc/systemd/system/
