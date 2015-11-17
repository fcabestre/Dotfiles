export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(history-substring-search ubuntu autoenv)

ZSH_CUSTOM=~/.zsh_custom

export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export GOROOT=/usr/local/lib/go

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vi'
else
    export EDITOR='emacs'
fi

eval $(dircolors ~/.dircolors)
export TERM=xterm-256color

######################################
#
# @help randpwd $length
function randpwd() {
  local length=${1:-42}
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -1
}

# update dotfiles
function updot() { cd ~/.dotfiles; git pull --rebase; ./install.sh; }

# Display the IP and geo information of the current machine
function geoip() { curl -s www.telize.com/geoip | jq .; }

function mount-vault() {
    [[ ! -d ~/Privé/Dropbox ]] && mkdir -p ~/Privé/Dropbox
    encfs ~/Dropbox/Privé ~/Privé/Dropbox
}

function unmount-vault() {
    fusermount -u ~/Privé/Dropbox
}

function man-ps() {
    man -Tps $1 > ~/$1.ps
}

function etime() {
    /usr/bin/time --format '%Uu %Ss %er %MkB %C' "$@"
}

function drm()  { docker rm $(docker ps -qa); }
function dri()  { docker rmi $(docker images -q --filter "dangling=true"); }

######################################
#
alias ss='sudo -s'
alias tmux='tmux -2'
alias x509='openssl x509'

# Apt
alias get='sudo apt-get install'
alias gety='sudo apt-get install -y'
alias search='sudo apt-cache search'

alias wholisten='sudo netstat -tpuan | grep LISTEN'

# Docker
alias d='docker'
alias dm='docker-machine
alias dc='docker-compose

# Source optional ~/.myzshrc
[ -f ~/.local_zshrc ] && source ~/.local_zshrc
