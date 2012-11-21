#!/bin/bash
set -e -E -u

echo "removing yadtshell rpms"
echo "(enter 'y' after reviewing yum actions)"
sudo yum remove $(echo *.rpm | sed "s/\.rpm//g")

echo "done."
