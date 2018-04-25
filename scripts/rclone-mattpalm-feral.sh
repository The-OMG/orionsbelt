rclone copy mattpalm-feral: bacsync-dh:mattpalm.briareus.feral \
--transfers=8 \
--checkers=16 \
--low-level-retries=20 \
--drive-chunk-size=32m \
--fast-list \
--checksum \
--no-check-certificate \
--stats=10s \
--retries=20 -v
