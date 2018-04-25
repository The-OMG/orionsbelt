cat list | parallel -j4 'java -jar ripme.jar -l $HOME/cloud/orionsbelt-RW/mirrors-collections/the-eye.eu/ripreddit -t 6 -u https://reddit.com/r/{}'
