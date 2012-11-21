#!/bin/bash
set -e -E -u

echo "removing yadtclient rpms"
echo "(enter 'y' after reviewing yum actions)"
sudo yum remove $(echo *.rpm | sed "s/\.rpm//g")

echo "done."
