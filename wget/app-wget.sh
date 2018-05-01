#!/bin/bash

################################################################################
####         basic wget script to mirror a simple open directory           #####
################################################################################
#							      ___           ___           ___                            #
#							     /  /\         /__/\         /  /\                           #
#							    /  /::\       |  |::\       /  /:/_                          #
#							   /  /:/\:\      |  |:|:\     /  /:/ /\                         #
#							  /  /:/  \:\   __|__|:|\:\   /  /:/_/::\                        #
#							 /__/:/ \__\:\ /__/::::| \:\ /__/:/__\/\:\                       #
#							 \  \:\ /  /:/ \  \:\~~\__\/ \  \:\ /~~/:/                       #
#							  \  \:\  /:/   \  \:\        \  \:\  /:/                        #
#							   \  \:\/:/     \  \:\        \  \:\/:/                         #
#							    \  \::/       \  \:\        \  \::/                          #
#							     \__\/         \__\/         \__\/                           #
#                                                                              #
################################################################################
#### rclone credit        : https://github.com/ncw/rclone
###  Install rclone       : https://rclone.org/install/
###  Install rclone       : "brew install wget"

#### GNU parallel credit  : https://www.gnu.org/software/parallel/
###  Install GNU parallel : "sudo apt-get install parallel"
###  Install GNU parallel : "brew install parallel"
################################################################################

## other options:
#  "--domains="             :
#  "--delete-after"         :
#  "--span-hosts"           :

# arguments for the wget package:
#  "--header="              :
#  "--trust-server-names"   :
#  "--user-agent="          :
#  "--html-extension"       :
#  "--referer="             :
#  "-np"                    :
#  "--convert-links"        :
#  "--show-progress"        :
#  "--content-disposition"  :
#  "--page-requisites"      :
#  "--execute robots=off"   :
#  "--restrict-file-names=" :
#  "--user-agent="          :


wget --mirror \
  --header="Host: www.myabandonware.com" \
  --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
  --header="Accept: gzip, deflate, br" \
  --header="Accept-Language: en-US,en;q=0.5" \
  --header="Cookie: olort7n0pcdsj4fmmabem74v24" \
  --trust-server-names \
  --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" \
  --html-extension \
  --referer=www.myabandonware.com \
  -np \
  --convert-links \
  --show-progress \
  --content-disposition \
  --page-requisites \
  --execute robots=off \
  --restrict-file-names=ascii \
  --user-agent=Mozilla \
  --span-hosts \
  --delete-after \
  https://www.myabandonware.com/download/fu0-3-d-worldrunner
