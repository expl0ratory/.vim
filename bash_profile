#sudo discoveryutil mdnsactivedirectory yes
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

pgrep ssh-agent >/dev/null
if [ $? -ne 0 ]; then
  ssh-agent
  ssh-add ~/.ssh/lark_id_rsa
  ssh-add ~/.ssh/id_rsa_cratejoy
fi

export TERM=xterm-256color

export IRCNICK=AlexMorse
set -o vi

source ~/.git-prompt.sh

export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagacad
alias php="/usr/local/Cellar/php54/5.4.26/bin/php"
alias ls="ls -GF"
alias nvim="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vim="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"

export PS1="\[$(tput setaf 34)\]\[\u\]\[$(tput sgr0)\]@\[$(tput setaf 35)\]\[\h\]\[$(tput sgr0)\]:\[$(tput setaf 36)\]\[\w\]\[$(tput sgr0)\]\[\$(__git_ps1)\]\[\n\]\[$(tput setaf 38)\]\[\$\]\[$(tput sgr0)\] "
export PYTHONPATH=.
PATH="/usr/local/lib/python2.7/site-packages/:${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"
export PATH
