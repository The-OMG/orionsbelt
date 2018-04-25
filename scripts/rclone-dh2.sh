rclone --no-traverse copy dh: edu-dheval: \
--ignore-size \
--transfers 8 \
--checkers 16 \
--low-level-retries 20 \
--retries 20 -v
