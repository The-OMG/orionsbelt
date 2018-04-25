cat media/md0/omg/bin/list | grep grep -E '\b0' | parallel -j32 'java -jar ripme.jar -t 8 -u {}'
