rclone --no-traverse copy theeye:Albums main1-theeye:Albums \
--transfers 8 \
--checkers 16 \
--low-level-retries 20 \
--ignore-size \
--retries 20 -v
