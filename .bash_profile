if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

export PATH=$PATH:~/.dotfiles/bin

export PAGER='less'
export EDITOR='vim'
export HISTSIZE=10000