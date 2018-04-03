#!/bin/bash
#Requirements youtube-dl, ffmpeg, axel

# User input
echo "I need a single word that will be your folder name."
read -p 'Project Name: ' PROJECT
echo "Now I need your url that I might be pulling from."
read -p 'URL: ' URL
echo "a list of supported providers can be called with the --ap-list-mso flag."
read -p 'Cable Provider: ' MSO
echo "$MSO"
read -p 'Cable Provider Username: ' APU
echo "$APU"
read -p -s 'Cable Provider Password: ' APP
echo "$APP"
sleep 2

# youtube-dl VARS
YTDLpath="$HOME/$PROJECT"
LOGFILE="$YTDLpath/_youtubedl.log"
ARCHIVE="$YTDLpath/archivedytidlist.txt"
DOWNLOADER="axel"
DOWNLOADER_ARGS="-n 15"

# Creates Project folder if you dont have one.
echo "If ya didnt have a Project folder, ya got one now."
mkdir -p $HOME/$PROJECT
sleep 2

# Creates inital logfile. | Overwrites existing logfile on every new script run.
echo "A wild logfile appears!"
printf 'go go gadget\n' > $LOGFILE
printf 'go go gadget\n' > $ARCHIVE
echo "$LOGFILE"
sleep 1
echo "$ARCHIVE"
sleep 5

# youtube-dl
youtube-dl --verbose --ignore-errors \
--ap-mso $MSO \
--ap-username $APU \
--ap-password $APP \
--download-archive $ARCHIVE \
--playlist-random \
--retries infinite --fragment-retries infinite --buffer-size 16k \
-o "$YTDLpath/%(uploader)s/%(upload_date)s %(title)s.%(ext)s" \
--no-continue --no-part --fixup \
--write-description --write-info-json \
--write-annotations --write-all-thumbnails --console-title \
--all-subs --convert-subs srt --embed-subs --add-metadata \
--external-downloader $DOWNLOADER \
--external-downloader-args "$DOWNLOADER_ARGS" \
--hls-prefer-ffmpeg --prefer-ffmpeg \
"$URL" | tee --append $LOGFILE
