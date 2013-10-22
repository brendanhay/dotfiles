#!/bin/bash

#
# Applications
#

# Emacs
export EDITOR="emacs"
export GIT_EDITOR="emacs"
export GEM_EDITOR="emacs"

# IRC
export IRC_CLIENT="weechat-curses"

#
# Mail
#

# Don't check mail when opening terminal.
unset MAILCHECK

#
# RBEnv
#

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#
# SSH
#

export CVS_RSH="ssh"

if [ "x`ps ax | grep [s]sh-agent`" == "x" ];
then
    ssh-agent && ssh-add ~/.ssh/id_rsa;
fi

#
# OSX
#

# Setting for the new UTF-8 terminal support in Lion
export LANG="en_US.UTF-8"
export LANGUAGE="en_US"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#export CC=`which cc`
# Due to gem build issues
# export CC=/usr/bin/gcc

export ARCHFLAGS="-arch x86_64"

# Identify OS and Machine
export OS=`uname -s | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"

#
# Path
#

export PATH=/usr/local/bin:/usr/local/sbin:~/.bin:~/Library/Haskell/bin:$PATH

# Add OSX applications to cd path
export CDPATH=$HOME/Library/Application:$CDPATH

#
# Bash
#

export BASH=~/.bash
export BASH_THEME="custom"

source $BASH/bash.sh

#
# Aliases
#

alias edit="$EDITOR"

# Emacs
alias e="emacsclient -t --no-wait"

# Tmux
function sssh () {
    ssh -t "$1" 'tmux attach || tmux new'
}

alias t='tmux'
alias ta='tmux attach -t'
alias tls='tmux ls'

# Tags
alias xctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

# Reload Library
alias reload='source ~/.bash_profile && echo "bash_profile reloaded"'

# Grep
alias al="alias | grep"                 # Find an alias
alias com='grep -e "^$" -e"^ *      #"' # Commented lines
alias uncom='grep -v -e "^$" -e"^ * #"' # Uncommented lines
alias tm='ps -ef | grep'                # Find a process

# Most frequently used commands
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

# Directory
function mcd() {
    mkdir -p "$1" && cd "$1";
}

alias md='mkdir -p'
alias rd=rmdir
alias rmd='rm -Rf'
alias d='dirs -v'

# ls
alias l='ls -Glha'
alias ls='ls -G'
alias l.='ls -Gd .*'          # List hidden files
alias lf='ls -Gl | grep ^d'   # Only list directories
alias lsf='ls -Gal | grep ^d' # Only list directories, including hidden ones

# Tree
if [ ! -x "$(which tree)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
else
  alias tree="tree -CAFa -I 'CVS|*.*.package|.svn|.git' --dirsfirst"
fi

# Navigation
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# Linux Specific
if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=always"

  # pbcopy and pbpaste aliases for GNU/Linux
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# Clear screen
alias c='clear'

alias w='which'
alias q="exit"
alias h='history'

alias page="$PAGER"
alias irc="$IRC_CLIENT"

# Git
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gl='git log'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit -ev'
alias gca='git commit -aev'
alias gb='git branch'
alias gco='git checkout'
alias gpu='git pull --rebase'
alias gpuo='git pull origin --rebase'
alias gcl='git clone'

# Bundler Commands
alias bi='bundle install'
alias be='bundle exec'
alias bec='bundle exec cucumber'
alias bes='bundle exec rspec'
alias ber='bundle exec rake'

# Vagrant
alias vup='time vagrant up'
alias vpro='vagrant provision'
alias vsus='vagrant suspend'
alias vdes='vagrant destroy -f'
alias vssh='vagrant ssh'

# Haskell Binaries
export PATH=~/.cabal/bin:$PATH
