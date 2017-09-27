export PATH=$PATH:${HOME}/.local/bin
export EDITOR="vim"
export BROWSER="vivaldi-stable"
export QT_QPA_PLATFORMTHEME="qt5ct"
export ONE_XMLRPC=http://10.36.10.20:2633/RPC2

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
