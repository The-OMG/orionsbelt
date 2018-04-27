#!/bin/bash

# Gloabal Variables
ECHO="echo -e"
SMLOADER="$HOME/bin/SMLoadr" # Path to SMloader tool
OUTPUT="$HOME/files/Music/"  # Path to output folder
LOGDATE="date +%Y%m%d%H%M%S"
LOG="tee -a $OUTPUT/deezbeezknees$LOGDATE.log" # Path to logfile

mir() {
  rm -rf "$OUTPUT"/mirrordeezer.log # Removing existing mirrordeezer.log
  x=13000000                        # Possible highest value of artists on Deezer
  mkdir -p "$OUTPUT"                # Creates output folder if not already created
  $ECHO "Starting full mirror of Deezer starting at 1" | $LOG
  $ECHO "  		--quality parameter set to FLAC" | $LOG
  sleep 5
  mirror=$(
    seq $x | parallel -j4 --joblog --bar --eta \
    "$SMLOADER -q 'FLAC' -d 'single' -p $OUTPUT \
		"https://www.deezer.com/us/ar/us/artist/{}" "
  )
  $ECHO "$mirror" | $LOG
  $ECHO "" | $LOG
  $ECHO "" | $LOG
}
smloader() {
  # Removing existing mirrordeezer.log
  rm -rf "$OUTPUT"/mirrordeezer.log
}
cfg() {
  $SMLOADER
}
install() {
  mkdir -p ~/bin
  rm -rf ~/bin/TTaKn.zip
  rm -rf ~/bin/SMloader-*
  rm -rf ~/bin/TTaKn*
  wget -q -O ~/bin/TTaKn.zip https://u.teknik.io/TTaKn.zip && \
  unzip -qo -d ~/bin/ ~/bin/TTaKn.zip && \
  mv ~/bin/SMLoadr-* ~/bin/SMLoadr && \
  chmod +x ~/bin/SMLoadr && \
  $ECHO "Installation to ~/bin/ Complete"
}
hlp() {
  $ECHO ""
  $ECHO "Usage: deezbeezkneez.sh <option(s)>"
  $ECHO ""
  $ECHO "Available options:"
  $ECHO "-m, --mirror		: Mirror deezer starting at artist 1"
  $ECHO "-h, --help		: This help page."
  $ECHO "-i, --install	: download SMloader to $HOME/bin"
  $ECHO "-r, --run		: run SMloader like normal. same as --config"
  $ECHO "-c, --config		: Run SMloader alone the first time to config Deezer account"
  $ECHO ""
}
while [ ! $# -eq 0 ]; do
  case $1 in
  -h | --help)
    hlp
    exit 0
    ;;
  -m | --mirror)
    mir
    exit 0
    ;;
  -s | --smloader)
    smloader
    exit 0
    ;;
  -i | --install)
    install
    exit 0
    ;;
  -c | --config)
    cfg
    exit 0
    ;;
  *)
    hlp
    exit 0
    ;;
  esac
  shift
done
