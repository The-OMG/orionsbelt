rclone sync "photos:OMG_share/mirrors-collections/Leaked Databases 500GB" stubbs-zeta:Leaked_databases_500GB \
--track-renames \
--transfers=8 \
--checkers=8 \
--low-level-retries=20 \
--drive-chunk-size=32m \
--fast-list \
--stats=10s \
--drive-shared-with-me \
--retries=20 -v
