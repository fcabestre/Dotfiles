#!/bin/sh
#
# Install and configure Zsh, oh-my-zsh and dotfiles.
#
# @deps : apt-get, git

# Install
for script in $(ls -1 ~/.dotfiles/install)
do
    [ -f ~/.dotfiles/install/$script ] && ~/.dotfiles/install/$script
done

# Clone or update oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]
then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    cd ~/.oh-my-zsh
    git pull --rebase
    cd
fi

# Backup git user info
gitUserName=$(git config --global user.name)
gitUserEmail=$(git config --global user.email)

# Copy all dotfiles
cp -rf ~/.dotfiles/dotfiles/.[a-z]* ~/

# Copy all utils scripts
mkdir -p ~/bin && cp -f ~/.dotfiles/bin/* ~/bin

# Restore git user info
git config --global user.name $gitUserName
git config --global user.email $gitUserEmail

[ "x$gitUserName" = "x" ] && \
  echo "Please update your git user.name, user.email : vi ~/.gitconfig"

zsh
