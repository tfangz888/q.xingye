cp tick/symxingye.q ~/q/tick/
cp feedhandler/xingye_feed.q ~/q/feedhandler/

cp xingye_tickerplant.sh ~/q/
cp xingye_rdb.sh ~/q/

sudo cp xingye_feed.service /etc/systemd/system/
sudo cp xingye_feed.timer /etc/systemd/system/
sudo cp xingye_tickerplant.service /etc/systemd/system/
sudo cp xingye_tickerplant.timer /etc/systemd/system/
sudo cp xingye_rdb.service /etc/systemd/system/
sudo cp xingye_rdb.timer /etc/systemd/system/
