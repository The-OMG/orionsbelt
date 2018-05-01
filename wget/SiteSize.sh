#!/bin/bash
##credit goes to https://the-eye.eu

log="/tmp/wget-website-size-log"

echo "## Crawling ${!#} site... ##"
sleep 2s
echo "## This will take awhile, please wait. ##"

wget \
    --recursive --level=inf \
    --spider --server-response \
    --no-directories \
    --output-file="$log" "$@"

echo "Finished crawling!"
sleep 1s

if [ -f "$log" ]
then
    echo "Size: $(\
        grep -e "Content-Length" "$log" | \
        awk '{sum+=$2} END {printf("%.0f", sum / 1024 / 1024)}'\
    ) Mb"

    rm "$log"
else
    echo "Unable to calculate size."
    exit 1
fi

exit 0
