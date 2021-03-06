# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git lein ruby macports screen osx npm rbenv pyenv nvm zsh-syntax-highlighting)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source $ZSH/oh-my-zsh.sh

# User configuration
OLD_ANDROID_HOME=${HOME}/Projects/SDKs/android
if test -e "${OLD_ANDROID_HOME}";
then
  export ANDROID_HOME="${OLD_ANDROID_HOME}"
else
  export ANDROID_HOME="${HOME}/Library/Android/sdk"
fi
export NDK_HOME="${ANDROID_HOME}/ndk-bundle"
export NDK_ROOT="${NDK_HOME}"
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH="${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin":"${ANDROID_HOME}/platform-tools/":$NDK_HOME:$PATH
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin/:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:${HOME}/soft/bin:$PATH

export PATH=${HOME}/.local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
#fi
export EDITOR='vim -N'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias xctool=${HOME}/.xctool/xctool.sh

# RBEnv
export PATH="${HOME}/.rbenv/bin":$PATH
eval "$(rbenv init -)"

# nVM
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# PYEnv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Right Prompt
# RBENV_RUBY_VER="$(rbenv version-name)"
# NVM_NPM_VER="$(nvm current)"
# LEIN_VER="$(echo `lein -v` | cut -d ' ' -f2 -)"

RPROMPT='🐪  %{$fg[magenta]%}$(plenv global)%{$reset_color%}%  🐍 %{$fg[magenta]%}$(pyenv_prompt_info)%{$reset_color%}%  💎 %{$fg[magenta]%}$(rbenv_prompt_info)%{$reset_color%}% %{$fg[white]%} ⬡%{$reset_color%}%  %{$fg[magenta]%}$(nvm_prompt_info)%{$reset_color%}%'

# PLENV

export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

# GREP update

unset GREP_OPTIONS
alias grep='grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn'

# PHPENV
# export PATH="$HOME/.phpenv/bin:$PATH"
# eval "$(phpenv init -)"

# php-version
# source "${HOME}/local/php-version/php-version.sh" && php-version 5

# Finder aliases
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder /System/Library/CoreServices/Finder.app'


# added by travis gem
[ -f /Users/lynxluna/.travis/travis.sh ] && source /Users/lynxluna/.travis/travis.sh

[ -s "/Users/Didit/.dnx/dnvm/dnvm.sh" ] && . "/Users/Didit/.dnx/dnvm/dnvm.sh" # Load dnvm

# . ${HOME}/.pyenv/versions/2.7.13/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# . /opt/local/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

. ${HOME}/.pyenv/versions/3.7.4/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

PS1="$PS1"$'\n'"%% "
export POWERLINE_THEME_OVERRIDES="default_leftonly.segment_data.branch.args.status_colors=true"
RPROMPT='🐪  %{$fg[magenta]%}$(plenv global)%{$reset_color%}%  🐍 %{$fg[magenta]%}$(pyenv_prompt_info)%{$reset_color%}%  💎 %{$fg[magenta]%}$(rbenv_prompt_info)%{$reset_color%}% %{$fg[white]%} ⬡%{$reset_color%}%  %{$fg[magenta]%}$(nvm_prompt_info)%{$reset_color%}%'

#
[[ -s /Users/lynxluna/.rsvm/rsvm.sh ]] && . /Users/lynxluna/.rsvm/rsvm.sh # This loads RSVM

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/lynxluna/.sdkman"
[[ -s "/Users/lynxluna/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/lynxluna/.sdkman/bin/sdkman-init.sh"

export GOPATH=${HOME}/Projects/golang
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Java Home
# export JAVA_HOME=`/usr/libexec/java_home`

export PATH=$HOME/Projects/SDKs/flutter/bin:$HOME/Projects/SDKs/dart-sdk/bin:$PATH

# This will make gopls happy
export GOPACKAGESDRIVER=off
