#!/bin/bash

#
# Applications
#

# Emacs
export EDITOR="emacs"
export GIT_EDITOR="emacs"
export GEM_EDITOR="emacs"

# IRC
export IRC_CLIENT="irssi"

#
# Mail
#

# Don't check mail when opening terminal.
unset MAILCHECK

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#
# SSH
#

export CVS_RSH="ssh"

if [ "x`ps ax |grep [s]sh-agent`" == "x" ];
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

# Fixing gcc in lion
export CC=/usr/bin/gcc

export ARCHFLAGS="-arch x86_64"

# Identify OS and Machine
export OS=`uname -s | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"

#
# Path
#

export PATH=/usr/local/bin:/usr/local/sbin:~/.bin:~/.rvm/bin:/usr/local/share/python:~/Library/Haskell/bin:$PATH

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

# ls
alias ls='ls -G'
alias l='ls -lha'
alias lo='ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g''  # convert permissions to octal
alias recent='ls -lAt | head'
alias old='ls -lAt | tail'

# Tmux
alias t='tmux'
alias ta='tmux attach -t'
alias tls='tmux ls'

# Tags
alias xctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

# Reload Library
alias reload='source ~/.bash_profile && echo "bash_profile reloaded"'

# Directory
alias md='mkdir -p'
alias mkdir='mkdir -p'
alias rd=rmdir
alias rmd='rm -Rf'
alias d='dirs -v'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias -- -="cd -"       # Go back

# Linux Specific
if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=always"

  #pbcopy and pbpaste aliases for GNU/Linux
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

# Tree
if [ ! -x "$(which tree)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
else
  alias tree="tree -CAFa -I 'CVS|*.*.package|.svn|.git' --dirsfirst"
fi

# Git
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gl='git log'
alias gl='git log --pretty=format:"%H %ad %s <%an>" --date=short'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit -m'
alias gca='git commit -am'
alias gb='git branch'
alias gco='git checkout'
alias gpu='git pull'
alias gpuo='git pull origin'
alias gcl='git clone'

# Bundler Commands
alias bi='bundle install'
alias be='bundle exec'
alias bec='bundle exec cucumber'
alias bes='bundle exec rspec'
alias ber='bundle exec rake'
