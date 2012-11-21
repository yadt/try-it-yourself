#!/bin/bash
set -e -E -u -C

NAME=$(basename $0 .sh)

TARGET=helloworld

./helloworld.sh

echo "$NAME - 1: stopping and starting all services"
(
	set -x
	cd $TARGET
	yadtshell stop service://*/backservice
	yadtshell status
	yadtshell start service://*/frontend
	yadtshell status
	set +x
)

echo "$NAME - done."
