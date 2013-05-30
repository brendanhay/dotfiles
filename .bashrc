# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Disable XON/XOFF control flow
stty -ixon

# C-l clear screen
bind -m vi-insert "\C-l":clear-screen

# C-p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history

# C-n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# maximum number of commands to keep in history
HISTSIZE=4096

# maximum number of lines to keep in ~/.bash_history
HISTFILESIZE=4096

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export PS1='\[\033[01;29m\]\u@\h \[\033[01;34m\]\w \$ \[\033[00m\]'

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_functions ]] && . ~/.bash_functions

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
