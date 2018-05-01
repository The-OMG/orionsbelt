#!/bin/bash

################################################################################
############################# BOOTSTRAP NEW SERVER #############################
################################################################################
#                                                                              #
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
### Install Linuxbrew
#   Source: http://linuxbrew.sh/
#   Dependencies: build-essential curl file git python-setuptools
#   Paste at a Terminal prompt:
git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
#   add Linuxbrew to your PATH:
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.zshrc
git -C "$(brew --repo homebrew/core)" fetch --unshallow
################################################################################
### install zsh environment:
brew install zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting
echo "source /media/sdt1/omg/.linuxbrew/share/antigen/antigen.zsh" >>$HOME/.zshrc
################################################################################
### ZSH theme powerlevel9k:
#   github: https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k
#   Dependencies: git
#   Paste at a Terminal prompt:
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
#   You then need to select this theme in your ~/.zshrc:
#   ZSH_THEME="powerlevel9k/powerlevel9k"
################################################################################
### Install Fonts:
#   The Nerd-Fonts project is an effort to create fonts truly tricked out with
#   as many glyphs as possible.
# rm -rf $HOME/.config/nerd-fonts
# brew install fontforge
# git clone https://github.com/ryanoasis/nerd-fonts.git $HOME/.config/nerd-fonts
# bash $HOME/.config/nerd-fonts/install.sh --clean --install-to-user-path --complete
#   After installing nerd-fonts and configuring your terminal emulator to use
#   one, configure Powerlevel9k by putting the following in your ~/.zshrc:#
#   POWERLEVEL9K_MODE='nerdfont-complete'
install single patched fonts
################################################################################
### Install standard packages:
brew install nano caddy dos2unix ffmpeg multitail nload parallel rclone tree \
youtube-dl ncdu asciinema

n2Gf8oZeAw9Dt7F
