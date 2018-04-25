rclone --no-traverse copy riskinit: edu-share:riskinit.org \
--checksum \
--ignore-size \
--exclude ripreddit** \
--exclude WorldTracker.org** \
--transfers 5 \
--checkers 30 \
--low-level-retries 20 \
--retries 20 -vv
