rclone move "$HOME/rips/" \
"omg:OMG_share/mirrors-collections/the-eye/ripreddit" \
--fast-list \
--drive-chunk-size 128M \
--drive-use-trash \
--transfers 4 \
--checkers 20 \
--low-level-retries 20 \
--retries 20 \
-v \
