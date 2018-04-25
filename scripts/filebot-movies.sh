filebot -script fn:amc --output "$HOME/cloud/orionsbelt-RW/Plex-Media/Anime" /
--action move --conflict skip -non-strict "$HOME/cloud/orionsbelt-RW/Plex-Media/_Incoming/Incoming_Anime" --log-file amc.log /
--def unsorted=y music=n artwork=y clean=y animeFormat="$HOME/cloud/orionsbelt-RW/Plex-Media/Anime/{plex.tail} ({vf}, {source}, {ac}, {channels}, {vc},{group})"
