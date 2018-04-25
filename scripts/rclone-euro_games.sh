rclone --no-traverse copy /home/bytesized/data/completed/Good\ Old\ Games\ \(GOG\)\ Colossal\ Collection\ -\ 1\,200+\ DRM\ Free\ Games\ -\ October\ 29th\,\ 2015/ euro:GOG_collection \
--drive-chunk-size 128M \
--drive-use-trash \
--transfers 8 \
--checkers 16 \
--low-level-retries 20 \
--retries 20 -v
