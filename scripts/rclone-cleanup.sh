rclone --no-traverse copy omg-alnitak:Ebooks omg:OMG_share/ebooks \
--drive-chunk-size 128M \
--drive-use-trash \
--transfers 8 \
--checkers 16 \
--low-level-retries 20 \
--retries 20 -v
