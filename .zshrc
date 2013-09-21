# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="muse"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ant brew command-coloring macports extract git-flow github osx ssh-agent textmate vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

## Alias configuration
setopt complete_aliases # aliased ls needs if file/dir completions work
alias ls='ls -G'
alias l='ls -G'
alias ll='ls -Gl'
alias la='ls -Ga'
alias info='info --vi-keys'
alias less='less --tab=4 --no-init --LONG-PROMPT --ignore-case --squeeze-blank-line -R'
alias git-diff='git diff --color --minimal -b -w'
alias res='source ~/.zshrc'

EDITOR=`which-command vim`
PAGER=`which-command less`
LESS=`which-command less`

## Application Memory Settings
export SBT_OPTS='-XX:MaxPermSize=256M -Xmx1536M -Xms512M'
