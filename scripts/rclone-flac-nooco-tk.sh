#Purpose: mirroring of http://flac.nooco.tk/ to my Gdrive
#excludes WorldTracker Library as I already have at least 1 copy.

#user of this script needs to setup their own remotes as mine are specific to my rclone.conf

#alt remotes
#alaskamedicaltransport-music:
#ancshuttle-music:
#edu-music:
#hyperplex-music:

REMOTE="flac-nooco-tk"
REMOTE_SUBSIR=""
GDRIVE_REMOTE="hyperplex-music"
GDRIVE_SUBDIR="flac.nooco.tk"

rclone sync $REMOTE:$REMOTE_SUBDIR $GDRIVE_REMOTE:$GDRIVE_SUBDIR \
--backup-dir=$GDRIVE_REMOTE:$GDRIVE_SUBDIR-archive \
--checksum \
--exclude ripreddit** \
--exclude **WorldTracker** \
--transfers=4 \
--checkers=8 \
--low-level-retries=20 \
--stats=10s \
--retries=20 \
-vv \
--ignore-existing \
--min-size=0 \
--contimeout=60s \
--timeout=300s \
--retries=3 \
--drive-chunk-size=32m \
--low-level-retries=10
