#user of this script needs to setup their own remotes as mine are specific to my rclone.conf

SOURCE="omg:OMG_share/Books"
DEST="omg:OMG_share/_TD/Books"

rclone sync $SOURCE $DEST \
--exclude ripreddit** \
--transfers=30 \
--checkers=30 \
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
--low-level-retries=10 \
--drive-use-trash
