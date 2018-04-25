rclone --no-traverse copy /home/bytesized/data/completed/WorldTracker.org omg2-dh:WorldTracker.org \
--transfers 8 \
--checkers 16 \
--low-level-retries 20 \
--retries 20 -v
