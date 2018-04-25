#Purpose: mirroring of https://www.alexandria-library.space/ to my Gdrive
#excludes WorldTracker Library as I already have at least 1 copy.

#user of this script needs to setup their own remotes as mine are specific to my rclone.conf

rclone copy theeye:Comics omg:OMG_share/Comics \

REMOTE="theeye"
REMOTE_SUBSIR="Books"
GDRIVE_REMOTE="omg"
GDRIVE_SUBDIR="OMG_share/Books"

rclone --no-traverse sync $REMOTE:$REMOTE_SUBDIR $GDRIVE_REMOTE:$GDRIVE_SUBDIR \
--backup-dir=$GDRIVE_REMOTE:$GDRIVE_SUBDIR-archive \
--checksum \
--exclude ripreddit** \
--exclude **WorldTracker** \
--transfers=8 \
--checkers=8 \
--low-level-retries=20 \
--stats=10s \
--retries=20 \
-v \
--ignore-existing \
--min-size=0 \
--contimeout=60s \
--timeout=300s \
--retries=3 \
--drive-chunk-size=32m \
--low-level-retries=10
