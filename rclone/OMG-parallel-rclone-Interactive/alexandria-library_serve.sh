#!/bin/bash

ACCOUNTS="$HOME/scripts/pegasus.txt"
PORTS="$HOME/scripts/ports.txt"
parallelARGS="--link -j12 --delay --joblog=alexandria-parallel.log -X"
rcloneARGS="--stats 30s --read-only --fast-list -vv --log-file=""${HOME}"/logs/alexandria.log""

rm -rf "$ACCOUNTS"
rm -rf "$PORTS"
rclone listremotes | grep TDpegasus >>"$ACCOUNTS"
seq 10022 +1 10033 >>"$PORTS"
touch "${HOME}/logs/alexandria.log"
parallel $parallelARGS rclone serve http {1}alexandria-library.space --addr localhost:{2} "$rcloneARGS" :::: $ACCOUNTS $PORTS
echo "Alexandria started"
