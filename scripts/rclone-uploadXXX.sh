rclone --no-traverse sync /home/bytesized/data/completed/XXX/ orionsbeltnas-XXX: \
--drive-chunk-size 128M \
--drive-use-trash \
--transfers 2 \
--checkers 8 \
--low-level-retries 20 \
--retries 20 -vv
