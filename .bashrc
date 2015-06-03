#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias dmesg='dmesg --color=always'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias gcc='gcc -fdiagnostics-color=always'
alias vi=vim

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

export EDITOR=vim
export VISUAL=vim

PS1='\[\e[1;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]\$\[\e[m\] \[\e[0m\]'
