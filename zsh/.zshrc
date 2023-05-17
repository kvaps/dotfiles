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
  helm
  ansible
  docker
  zsh-autosuggestions
  zsh-syntax-highlighting
)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

zstyle ':bracketed-paste-magic' active-widgets '.self-*'.

# fish like completion
ZSH_AUTOSUGGEST_STRATEGY=(completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# list colors:
# for code ({000..255}) print -P -- "%F{$code}Foreground%f $code %K{$code}%F{255}Back%f%F{232}ground%f%k"

# PowerLevel9K configuration
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_SEPARATOR=""
KUBE_PS1_SYMBOL_ENABLE="false"
KUBE_PS1_DIVIDER=" "

typeset -g POWERLEVEL9K_MODE=nerdfont-complete
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%233F\uE0B1'
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%233F\uE0B3'
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=76
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=196
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='Ⅴ'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

typeset -g POWERLEVEL9K_DIR_FOREGROUND=015
typeset -g POWERLEVEL9K_DIR_BACKGROUND=239
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=015
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=015
typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
local anchor_files=(
  .bzr
  .citc
  .git
  .hg
  .node-version
  .python-version
  .ruby-version
  .shorten_folder_marker
  .svn
  .terraform
  CVS
  Cargo.toml
  composer.json
  go.mod
  package.json
)
typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
typeset -g POWERLEVEL9K_DIR_HYPERLINK=false
typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true
typeset -g POWERLEVEL9K_DIR_CLASSES=()

typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=3
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=234
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=234
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

#typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%B%n%b'

ZLE_RPROMPT_INDENT=0
POWERLEVEL9K_CUSTOM_KUBE_PS1='kube_ps1'

# one line
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv background_jobs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_kube_ps1 vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time kubecontext vcs)

# two lines
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv newline prompt_char)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs custom_kube_ps1 vcs newline)

POWERLEVEL9K_CONTEXT_FOREGROUND='232'
POWERLEVEL9K_CONTEXT_BACKGROUND='184'
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='236'
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='250'
#POWERLEVEL9K_DIR_HOME_BACKGROUND='236'
#POWERLEVEL9K_DIR_HOME_FOREGROUND='250'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='236'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='250'
#POWERLEVEL9K_DIR_ETC_BACKGROUND='052'
#POWERLEVEL9K_DIR_ETC_FOREGROUND='214'
POWERLEVEL9K_CUSTOM_KUBE_PS1_FOREGROUND='233'
POWERLEVEL9K_CUSTOM_KUBE_PS1_BACKGROUND='235'
POWERLEVEL9K_KUBECONTEXT_CLASSES=(
    '*prod*'  PROD
    '*'       DEFAULT)
POWERLEVEL9K_KUBECONTEXT_PROD_BACKGROUND='235'
POWERLEVEL9K_KUBECONTEXT_PROD_FOREGROUND=001
POWERLEVEL9K_KUBECONTEXT_PROD_VISUAL_IDENTIFIER_EXPANSION=''
POWERLEVEL9K_KUBECONTEXT_PROD_CONTENT_EXPANSION+='$P9K_KUBECONTEXT_NAME%6F${${:- $P9K_KUBECONTEXT_NAMESPACE}:# default}'
POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND='235'
POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=134
POWERLEVEL9K_KUBECONTEXT_DEFAULT_VISUAL_IDENTIFIER_EXPANSION=''
POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='$P9K_KUBECONTEXT_NAME%6F${${:- $P9K_KUBECONTEXT_NAMESPACE}:# default}'
#POWERLEVEL9K_KUBECONTEXT_PREFIX='⎈ '


## for recordings only
#POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION='$P9K_KUBECONTEXT_NAMESPACE ⎈'
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time kubecontext)

#POWERLEVEL9K_VCS_BACKGROUND='112'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='214'
POWERLEVEL9K_VCS_FOREGROUND='148'
POWERLEVEL9K_VCS_BACKGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='214'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='236'
POWERLEVEL9K_STATUS_BACKGROUND='234'
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_STATUS_OK_FOREGROUND=70
POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
POWERLEVEL9K_STATUS_OK_PIPE=true
POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=70
POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND=160
POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='↵'
POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=160
POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='↵'
POWERLEVEL9K_STATUS_ERROR_PIPE=true
POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=160
POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='↵'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='236'


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

alias ke='kubectl exec -ti'
alias ku='kubectl use'
alias q='qbec'
alias qs='qbec show'
alias qa='qbec apply'
alias qd='qbec diff'
alias gs='git status'


alias oneexec='kubectl exec -n opennebula -ti `kubectl get pod -n opennebula -l role=leader -o name` -c oned -- bash'
alias onehost='kubectl exec -n opennebula `kubectl get pod -n opennebula -l role=leader -o name` -c oned -- onehost'
alias onevm='kubectl exec -n opennebula `kubectl get pod -n opennebula -l role=leader -o name` -c oned -- onevm'
alias onezone='kubectl exec -n opennebula `kubectl get pod -n opennebula -l role=leader -o name` -c oned -- onezone'
alias oneimage='kubectl exec -n opennebula `kubectl get pod -n opennebula -l role=leader -o name` -c oned -- oneimage'
alias onedatastore='kubectl exec -n opennebula `kubectl get pod -n opennebula -l role=leader -o name` -c oned -- onedatastore'

#alias linstor='kubectl exec -n linstor deploy/linstor-controller -ti -- linstor'
alias linstor='kubectl linstor'
alias neat='kubectl neat'
alias krew='kubectl krew'

alias skopeo='skopeo --override-os linux --override-arch amd64'
# OpenNebula
export PATH=$PATH:${HOME}/.gem/ruby/2.6.0/bin:${HOME}/.gem/ruby/2.7.0/bin
export ONE_XMLRPC=https://opennebula.wedos.cloud/RPC2
# OpenStack
. ~/.a-kvapil-openrc

# Homebrew binaries
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/Cellar/grep/3.7/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/diffutils/bin:$PATH"
export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"

alias cal="LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 /opt/homebrew/opt/util-linux/bin/cal -m"

# Kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ibus-typing-booster
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

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


# Flant integration
export SSH_ASKPASS=/usr/local/bin/ssh-askpass
launchctl setenv SSH_ASKPASS $SSH_ASKPASS
SSH_ENV="/tmp/.ssh_environment_added"
env_display="`/bin/launchctl getenv DISPLAY`"
if [[ "x${env_display}" == "x" ]]; then
	/bin/launchctl setenv DISPLAY :0 
fi
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
