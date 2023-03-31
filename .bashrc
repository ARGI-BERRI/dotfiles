test -z "$PROFILEREAD" && . /etc/profile || true

set -o notify

#============================
# Shell
#============================
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkhash
shopt -s direxpand
shopt -s dirspell
shopt -s dotglob
shopt -s execfail
shopt -s extglob
shopt -s failglob
shopt -s nocaseglob
shopt -s nocasematch
shopt -s nullglob
shopt -s xpg_echo

#============================
# Aliases
#============================
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cat='cat -n'
alias mkdir='mkdir -p'

alias ps='ps --srot=start_time'
alias which='type -a'
alias ..='cd ..'
alias job='jobs -l'

alias du='du -kh'
alias df='df -kTh'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls -CFh --color'
alias ll='ls -CFahl --color'

#============================
# Prompt
#============================
PS1="\[\]\\e[32m\u\e[1;30m\e[m:\e[1;34m\w\e[m \$ "