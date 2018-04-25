#!/bin/bash

REMOTE="dh"
REMOTE_SUBSIR=""
GDRIVE_REMOTE="$1"
GDRIVE_SUBDIR="DataHoarder"

rclone sync $REMOTE: $GDRIVE_REMOTE:$GDRIVE_SUBDIR \
--backup-dir=$GDRIVE_REMOTE:$GDRIVE_SUBDIR-archive \
--ignore-checksum \
--transfers=8 \
--checkers=8 \
--low-level-retries=20 \
--stats=10s \
--retries=20 \
--ignore-existing \
--min-size=0 \
--contimeout=60s \
--timeout=300s \
--retries=3 \
--low-level-retries=10 \
--log-file=$HOME/logs/rclone-$GDRIVE_REMOTE-$REMOTE.log \
--fast-list \
-vvv

echo all processes complete
