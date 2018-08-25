# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ANDROID_HOME="/Users/saurabhariyan/Library/Android/sdk"
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/platform-tools
PATH=$PATH:$ANDROID_HOME/tools/bin
PATH=$PATH:$ANDROID_HOME/platform-tools/adb
export PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/saurabhariyan/.oh-my-zsh

#set locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Add miniconda to path 
export PATH="$HOME/miniconda2/bin:$PATH"

#SET UP SUBLIME as editor
# export EDITOR="subl -w"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -w'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#change title 
# Set iTerm2 tab titles
tabTitle() { echo -ne "\033]0;"$*"\007"; }

# Always list directory contents and set title upon 'cd'
cd() { builtin cd "$@"; tree -L 2 -I node_modules; tabTitle ${PWD##*/}; }


# alias ohmyzsh="mate ~/.oh-my-zsh"
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
# Enable aliases to be sudo’ed
alias sudo="sudo "
# Shortcuts
alias o="open"
alias oo="open ."
alias e="$EDITOR"
alias g="git"
alias v="vim"
alias gh="github"
alias rm="trash"
alias x+="chmod +x"
alias -- +x="chmod +x"

# mv, rm, cp, gunzip
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'
alias ungz="gunzip -k"

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

alias cask='brew cask' # i <3 u cask
alias where=which # sometimes i forget
alias brwe=brew  #typos


# Be nice
alias htop='sudo htop'
alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

#
# Time to upgrade `ls`
#

# Use coreutils `ls` if possible
#[change] hash gls >/dev/null 2>&1 || alias gls="ls"

# Always use color output for `ls`
# Detect which `ls` flavor is in use
if gls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

export CLICOLOR_FORCE=1

# List all files colorized in long format
#[change] alias l="ls -lF ${colorflag}"

# ls options: A = include hidden (but not . or ..), F = put `/` after folders, h = byte unit suffixes
#[change] alias ls='ls -AFh ${colorflag} --group-directories-first'

# List all files colorized in long format, including dot files
#[change] alias la="ls -la ${colorflag}"

# List only directories
#[change] alias lsd='gls -l | grep "^d"'

# `cat` with beautiful colors. requires Pygments installed.
# sudo easy_install -U Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"


# Git aliases
# More Git tips http://firstaidgit.io/
alias gss="git status -s"
alias gp="git push origin HEAD"
alias gpt="git push origin HEAD && git push --tags"
alias wip="git commit -m'WIP' . && git push origin HEAD"
alias grok="ngrok start rem.jsbin-dev.com static.rem.jsbin-dev.com learn.rem.jsbin-dev.com"
alias gl='git log'
alias glp5='git log -5 --pretty --oneline' # view your last 5 latest commits each on their own line
alias glt='git log --all --graph --decorate --oneline --simplify-by-decoration' # pretty branch status
alias glsw='git log -S' # search the commit history for the word puppy and display matching commits (glsw [word])
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gam='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gbt=git_list_branches
alias gpu='git pull origin HEAD --prune'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog' # allows you to see every step you have made with git allowing you to retract and reinstate your steps
alias gap='git add -p' # step through each change, or hunk
alias gsl='git shortlog -sn' # quickly get a list of contributors and see how many commits each person has
alias gws='git diff --shortstat "@{0 day ago}"' # how many lines of code you have written today
alias gwts='git ls-files | xargs wc -l' # count number of lines of code in a git project
alias ggmp='git checkout -' # jump back to to your last branch
alias gst='git stash' # stash git changes and put them into your list
alias gdtp='git stash pop' # bring back your changes, but it removes them from your stash
alias gchp='git cherry-pick' # cherry pick the committed code in your own branch (gchp [hash])
alias gcln='git clean -xfd' # remove untracked files

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# `cd` to Git repo root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# react native set up. 
export JAVA_HOME=$(/usr/libexec/java_home -v 10)

# Nerd Font and Power Level set up
source  ~/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda status dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ram load time)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'


# Custom prompt set up 
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
POWERLEVEL9K_ANACONDA_FOREGROUND='049' #chatak green ;)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\ue0c0 '
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''


POWERLEVEL9K_ANACONDA_BACKGROUND='088'

#remove 
POWERLEVEL9K_PYTHON_ICON=''
POWERLEVEL9K_VCS_BRANCH_ICON=''

#left == anaconda status dir vcs
POWERLEVEL9K_VCS_BACKGROUND='088'
POWERLEVEL9K_STATUS_OK_BACKGROUND='088'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='green'


#DIR
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_DIR_HOME_BACKGROUND='088'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='088'
POWERLEVEL9K_DIR_ETC_BACKGROUND='088'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='088'

POWERLEVEL9K_DIR_HOME_FOREROUND='088'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREROUND='088'
POWERLEVEL9K_DIR_ETC_FOREROUND='088'
POWERLEVEL9K_DIR_DEFAULT_FOREROUND='088'


#VCS
POWERLEVEL9K_VCS_BACKGROUND='088'
POWERLEVEL9K_VCS_UNSTAGED_ICON=''
POWERLEVEL9K_VCS_UNTRACKED_ICON=''
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=''


