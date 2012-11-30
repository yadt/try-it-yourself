#!/bin/bash
set -e -E -u

echo "installing yadtclient rpms"
echo "(enter 'y' after reviewing yum actions)"
sudo yum install ./*.rpm || sudo yum reinstall ./*.rpm || exit

sudo mkdir -p /var/log/yadt
sudo chmod -R 777 /var/log/yadt
sudo mkdir -p /var/cache/yadt/
sudo chmod -R 777 /var/cache/yadt

echo "done."


