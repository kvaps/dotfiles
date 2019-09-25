# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kvaps/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [ "$TERM" != "linux" ]; then
  #ZSH_THEME="powerlevel9k/powerlevel9k"
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME="agnoster"
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
  thefuck
  colorize
  colored-man-pages
  archlinux
  kubectl
  kube-ps1
  helm
  ansible
  docker
  ssh-agent
)

source $ZSH/oh-my-zsh.sh

# fish like completion
ZSH_AUTOSUGGEST_STRATEGY=(completion)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# list colors:
# for code ({000..255}) print -P -- "%F{$code}Foreground%f $code %K{$code}%F{255}Back%f%F{232}ground%f%k"

# PowerLevel9K configuration
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_SEPARATOR=""
KUBE_PS1_SYMBOL_ENABLE="false"
KUBE_PS1_DIVIDER=" "

POWERLEVEL9K_CUSTOM_KUBE_PS1='kube_ps1'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_kube_ps1 vcs background_jobs status)
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='232'
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='208'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='236'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='250'
POWERLEVEL9K_DIR_HOME_BACKGROUND='236'
POWERLEVEL9K_DIR_HOME_FOREGROUND='250'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='236'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='250'
POWERLEVEL9K_DIR_ETC_BACKGROUND='052'
POWERLEVEL9K_DIR_ETC_FOREGROUND='214'
POWERLEVEL9K_CUSTOM_KUBE_PS1_FOREGROUND='233'
POWERLEVEL9K_CUSTOM_KUBE_PS1_BACKGROUND='234'
POWERLEVEL9K_VCS_BACKGROUND='112'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='214'
#POWERLEVEL9K_VCS_FOREGROUND='148'
#POWERLEVEL9K_VCS_BACKGROUND='235'
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='214'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='235'
POWERLEVEL9K_STATUS_BACKGROUND='236'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='124'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='255'

# User configuration
export PATH=$PATH:${HOME}/.local/bin
export EDITOR="vim"
export BROWSER="firefox"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"
export LESS="-F -X $LESS"

# Colorize output
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# OpenNebula
export PATH=$PATH:.gem/ruby/2.6.0/bin
export ONE_XMLRPC=https://api.opennebula.wedos.cloud/RPC2
