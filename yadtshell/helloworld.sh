#!/bin/bash
set -e -E -u -C

NAME=$(basename $0 .sh)
TARGET=$NAME

# TODO: some systems does not have /sbin in PATH, therefore we link it from /usr/bin
[[ -x /usr/bin/pidof ]] || sudo ln -sf /sbin/pidof /usr/bin/pidof

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
    echo "updating the local installation first, this may take a few minutes..."
	set -x
	cd $TARGET
	yadtshell update
	yadtshell status
	set +x
)

echo "$NAME - done."
