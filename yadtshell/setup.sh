#!/bin/bash
set -e -E -u

echo "installing yadtshell rpms"
echo "(enter 'y' after reviewing yum actions)"
sudo yum install ./*.rpm || sudo yum reinstall ./*.rpm || exit

echo "done."


