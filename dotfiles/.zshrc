export ZSH=/home/fred/.oh-my-zsh

ZSH_THEME="avit"

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(history-substring-search)

ZSH_CUSTOM=~/.zsh_custom

export PATH="~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export GOROOT=/usr/local/lib/go

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vi'
else
    export EDITOR='emacs'
fi

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
    [[ ! -d ~/Privé ]] && mkdir ~/Privé
    encfs ~/Dropbox/Privé ~/Privé
}

function unmount-vault() {
    fusermount -u ~/Privé
}

function man-ps() {
    man -Tps $1 > ~/$1.ps
}

######################################
#
alias ss='sudo -s'
alias tmux='tmux -2'

# Apt
alias get='sudo apt-get install'
alias gety='sudo apt-get install -y'
alias search='sudo apt-cache search'

alias wholisten='sudo netstat -tpuan | grep LISTEN'

# Source optional ~/.myzshrc
[ -f ~/.myzshrc ] && source ~/.myzshrc
