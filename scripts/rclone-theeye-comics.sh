rclone copy theeye:Comics omg:OMG_share/Comics \
--backup-dir=$GDRIVE_REMOTE:$GDRIVE_SUBDIR/archive \
-v \
--transfers=10 \
--drive-chunk-size=32m \
--stats=10s \
--checkers=10 \
--checksum
