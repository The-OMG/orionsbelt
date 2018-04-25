#Purpose: upload ripreddit to my Gdrive
#excludes WorldTracker Library as I already have at least 1 copy.

#user of this script needs to setup their own remotes as mine are specific to my rclone.conf

REMOTE="/home13/omg/files/ripreddit_URLs"
GDRIVE_REMOTE="edu"
GDRIVE_SUBDIR="OMG_share/mirrors-collections/the-eye.eu/ripreddit"

rclone move $REMOTE $GDRIVE_REMOTE:$GDRIVE_SUBDIR \
--transfers=8 \
--checkers=8 \
--low-level-retries=20 \
--stats=10s \
--retries=20 \
-v \
--min-size=0 \
--contimeout=60s \
--timeout=300s \
--retries=3 \
--drive-chunk-size=32m \
--exclude=*.txt \
--exclude=*list \
--exclude=*.sh \
--low-level-retries=10
