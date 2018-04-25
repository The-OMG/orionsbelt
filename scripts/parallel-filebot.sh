filebot -script fn:amc --output \
"$HOME/media" \
--action move --conflict auto -non-strict ./** \
--log-file "$HOME/logs/amc.log" -get-subtitles \
--def excludeList="$HOME/logs/amc-exclude.txt" \
--def unsorted=y music=y artwork=y clean=y extras=y deleteAfterExtract=y minFileSize=0 minLengthMS=0
