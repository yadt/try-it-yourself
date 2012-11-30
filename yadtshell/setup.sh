#!/bin/bash
set -e -E -u

echo "installing yadtshell rpms"
echo "(enter 'y' after reviewing yum actions)"
sudo yum install ./*.rpm || sudo yum reinstall ./*.rpm || exit

sudo mkdir /var/log/yadtshell
sudo chmod 777 /var/log/yadtshell

echo "done."


