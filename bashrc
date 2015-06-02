### gitprompt configuration
# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1
# as last entry source the gitprompt script
source ~/bin/bash-git-prompt/gitprompt.sh

# added by travis gem
[ -f /home/fred/.travis/travis.sh ] && source /home/fred/.travis/travis.sh

# AWS Credentials
[[ -f ~/.bash_aws ]] && source ~/.bash_aws

export COVERALLS_REPO_TOKEN=Fj0Ao7izlVx3RUHujCQopQTmKgCoJ1D93
