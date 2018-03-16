cat list | parallel -j4 'java -jar ripme.jar -l $HOME/ripreddit -t 6 -u https://reddit.com/r/{}'
