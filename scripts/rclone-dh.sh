#Purpose: mirroring of https://www.alexandria-library.space/ to my Gdrive
#excludes WorldTracker Library as I already have at least 1 copy.

#user of this script needs to setup their own remotes as mine are specific to my rclone.conf

#alaskamedicaltransport-dh:
#ancshuttle-dh:
#aria-dh:
#bacsync-dh:
#edu-dh:
#hyperplex-dh:
#omg-dh:
#oriongrimm-dh:
#oriongrimm1-dh:
#orionsbeltnas-dh:
#photos-dh:
#stubbs-dh:

REMOTE="dh"
REMOTE_SUBSIR=""
GDRIVE_REMOTE="bacsync-dh"
GDRIVE_SUBDIR="DataHoarder"

rclone sync $REMOTE:$REMOTE_SUBDIR $GDRIVE_REMOTE:$GDRIVE_SUBDIR \
--backup-dir=$GDRIVE_REMOTE:$GDRIVE_SUBDIR-archive \
--ignore-checksum \
--transfers=16 \
--checkers=16 \
--low-level-retries=20 \
--stats=10s \
--retries=20 \
--ignore-existing \
--min-size=0 \
--contimeout=60s \
--timeout=300s \
--retries=3 \
--drive-chunk-size=32m \
--low-level-retries=10 \
--log-file=$HOME/logs/rclone-$REMOTE.log \
--log-level=ERROR \
--stats-log-level=ERROR &
