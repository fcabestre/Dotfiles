export ZSH=/home/fred/.oh-my-zsh

ZSH_THEME="avit"

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(history-substring-search)

ZSH_CUSTOM=~/.zsh_custom

export PATH="~/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vi'
else
    export EDITOR='emacs'
fi

######################################
#
function mount-vault() {
    [[ ! -d ~/Privé ]] && mkdir ~/Privé
    encfs ~/Dropbox/Privé ~/Privé
}

function unmount-vault() {
    fusermount -u ~/Privé
}

######################################
#
alias mvt=mount-vault
alias uvt=unmount-vault
