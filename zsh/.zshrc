# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Workaround: https://unix.stackexchange.com/a/608921/175694
export GPG_TTY=$(tty)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [ "$TERM" != "linux" ]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  #ZSH_THEME="jnrowe"
  ZSH_THEME="gentoo"
fi
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Auto-update oh-my-zsh once a week, without prompting.
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  history-substring-search
  colorize
  colored-man-pages
  kubectl
  helm
  ansible
  docker
  zsh-autosuggestions
  zsh-syntax-highlighting
)
# compinit is invoked by oh-my-zsh.sh below (with daily-cached dump);
# do not call it here too — a second compinit doubles the slowest part of startup.

source $ZSH/oh-my-zsh.sh

zstyle ':bracketed-paste-magic' active-widgets '.self-*'.

# fish like completion
ZSH_AUTOSUGGEST_STRATEGY=(completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# list colors:
# for code ({000..255}) print -P -- "%F{$code}Foreground%f $code %K{$code}%F{255}Back%f%F{232}ground%f%k"



# User configuration
export PATH=$PATH:${HOME}/.local/bin
export EDITOR="vim"
export BROWSER="firefox"
export QT_QPA_PLATFORMTHEME="gtk3"
export QT_STYLE_OVERRIDE="kvantum"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"
export LESS="-F -X $LESS"


# docker platform
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# kubectl-krew
export PATH="$PATH:${HOME}/.krew/bin"

# Colorize output
#alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias vim='nvim'

alias ke='kubectl exec -ti'
alias ku='kubectl use'
alias q='qbec'
alias qs='qbec show'
alias qa='qbec apply'
alias qd='qbec diff'
alias gs='git status'

alias v=virtctl
alias linstor='kubectl exec -n cozy-linstor deploy/linstor-controller -ti -- linstor'
alias l='kubectl exec -n cozy-linstor deploy/linstor-controller -ti -- linstor'
alias neat='kubectl neat'
alias krew='kubectl krew'
alias klock='kubectl klock'
alias flux='flux -n $(kubectl config view --minify -o jsonpath="{..namespace}")'
alias f='flux -n $(kubectl config view --minify -o jsonpath="{..namespace}")'

alias skopeo='skopeo --override-os linux --override-arch amd64'
alias ttyd="ttyd -t 'fontFamily=Hasklug Nerd Font Mono' -t 'theme={\"background\": \"#171717\"}' -t fontSize=20"
alias c='cozypkg'

# You live only once
alias claude='claude --dangerously-skip-permissions'

# Kubernetes
export KUBECONFIG=kubeconfig:../kubeconfig:../../kubeconfig:$HOME/.kube/config

# Homebrew binaries
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/diffutils/bin:$PATH"
export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"

alias cal="LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 /opt/homebrew/opt/util-linux/bin/cal -m"

# Kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin

# ibus-typing-booster
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Red stderr
if [ -f /usr/lib/libstderred.so ] && [ -z "$LD_PRELOAD" ]; then
  export LD_PRELOAD="/usr/lib/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
fi

if [ "$TERM" = xterm-termite ]; then
  export TERM=xterm-256color
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/tk tk

# Disable dock icon bouncing
printf "\e[?1042l"


# `command` bypasses the `flux` alias (flux -n $(kubectl ...)) which otherwise
# mangles completion generation and runs kubectl on every shell startup.
source <(command flux completion zsh)
source <(command cozypkg completion zsh)
source <(command virtctl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
