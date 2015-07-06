#!/bin/bash

# log 
exec 1> >(tee -a setup_out.log)
exec 2> >(tee -a setup_err.log >&2)

# set screensaver alias
echo $'alias screensaver=\'open /System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app\'' >> ~/.bash_profile

# homebrew
# http://brew.sh/
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
echo export PATH='/usr/local/bin:$PATH' >> ~/.bash_profile
export PATH=/usr/local/bin:$PATH
brew install wget


brew install mercurial git

# gnu tools
brew install gnu-sed gawk gcc

# compress tools
brew install xz

# emacs
brew install --with-cocoa emacs
ln -sfv /usr/local/opt/emacs/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.emacs.plist
brew linkapps emacs

# clone my emacs.d
git clone https://github.com/jitomesky/emacs.d ~/.emacs.d

# keyboard setting for KVM
touch ~/.Xmodmap
echo "clear Mod1" >> ~/.Xmodmap
echo "keycode 66 = Alt_L" >> ~/.Xmodmap
echo "keycode 69 = Alt_R" >> ~/.Xmodmap
echo "add Mod1 = Alt_L" >> ~/.Xmodmap
echo "add Mod1 = Alt_R" >> ~/.Xmodmap


# Homebrew-cask
brew install caskroom/cask/brew-cask
# set caskupdate alias
echo $'alias caskupdate=\'for c in `brew cask list`; do ! brew cask info $c | grep -qF \"Not installed\" || brew cask install $c; done\'' >> ~/.bash_profile

# XQuarts
brew cask install xquartz
# iTerm
brew cask install iterm2
# MacTeX
brew cask install mactex
# coolterm
brew cask install coolterm
# Alfred
brew cask install alfred
# XtraFinder
brew cask install xtrafinder
# ShiftIt
brew cask install shiftit
# Chrome
brew cask install google-chrome chrome-remote-desktop-host
# Google Japanese IME
brew cask google-japanese-ime
# Dropbox
brew cask install dropbox
# Skype
brew cask install skype
# GoogleDrive
brew cask install googledrive
# Fritzing
brew cask install fritzing
# gfxcardstatus
brew cask install gfxcardstatus
# KeePass
brew cask install keepassx
# Skim: PDF Viewer
brew cask install skim
# VLC: Media Player
brew cask install vlc
# XLD: CD Ripper
brew cask install XLD
# HandBrake
brew cask install handbrake
# svnX
brew cask install svnx
# Virtualbox
brew cask install virtualbox
# wireshark
brew cask install wireshark
# SublimeText
brew cask install sublime-text


# programming tools
# python3
brew install python3

# R
brew install r

# haskell
brew install ghc cabal-install
export PATH=$PATH:~/.cabal/bin
echo "export PATH=$PATH:~/.cabal/bin" >> ~/.bash_profile
# install pandoc
cabal install pandoc

# Ruby with rbenv
brew install rbenv ruby-build
echo '# rbenv path' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

echo "plz install Ruby"
echo "Check available version:"
echo "   rbenv install --list"
echo "Install and rehash:"
echo "   rbenv install [version] && rbenv rehash"
echo "set Ruby version:"
echo "   rbenv global [version]"
