#!/bin/bash
set -e -E -u -C

NAME=$(basename $0 .sh)
TARGET=$NAME

echo "$NAME - 1: generating target description file '$TARGET/target'"
rm -rf $TARGET/*
mkdir -p $TARGET
cat << EOF > $TARGET/target
hosts:
- $(hostname --fqdn)
EOF
echo "content of target file:"
cat $TARGET/target
echo


echo "$NAME - 2: querying status of newly generated target"
(
	set -x
	cd $TARGET
	yadtshell status
	set +x
)

echo "$NAME - done."
