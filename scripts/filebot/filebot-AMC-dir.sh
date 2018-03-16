#!/bin/bash
filebot -script fn:amc --output "$HOME/cloud/orionsbelt-RW/Plex-Media" \
--action move --conflict skip -non-strict ./** \
--log-file "$HOME/logs/amc.log" -get-subtitles --def unsorted=y music=n artwork=y clean=y
