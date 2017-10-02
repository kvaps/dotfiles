#
# ~/.bashrc
#

export PATH=$PATH:${HOME}/.local/bin
export EDITOR="vim"
export BROWSER="vivaldi-stable"
export QT_QPA_PLATFORMTHEME="qt5ct"
export ONE_XMLRPC=http://10.36.10.20:2633/RPC2

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/lib/python*/site-packages/powerline/bindings/bash/powerline.sh
fi
