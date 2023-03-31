if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

export PATH=$PATH:~/.dotfiles/bin

export PAGER='less'
export LESS='-e -g -i -w -z-4 -F -J -M -N -R -X -P%t?f%f :stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export EDITOR='vim'
export HISTSIZE=10000