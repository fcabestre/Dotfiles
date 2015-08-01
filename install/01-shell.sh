# Backup .zshrc
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.save.$(date +%s)

# Install Zsh
if [ $(which zsh > /dev/null; echo $?) -eq 1 ]
then
    touch ~/.zshrc 
    sudo apt-get install -y zsh
fi
sudo chsh -s `which zsh` `whoami`

