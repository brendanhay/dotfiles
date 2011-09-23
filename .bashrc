# Prompt functions
_parse_svn_url() {
  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}

_parse_svn_repository_root() {
  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

_parse_svn_branch() {
  _parse_svn_url | sed -e 's#^'"$(_parse_svn_repository_root)"'##g' | awk -F / '{print "(svn:"$1 "/" $2 ")"}'
}

_parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git:\1)/'
}

# Prompt
export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \w \[\033[31m\]\$(_parse_git_branch)\$(_parse_svn_branch) \[\033[00m\]$\[\033[00m\] "

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# SSH Completion
_known_hosts() {
  cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | grep -v ^# | uniq | grep -v "\["
}

_ssh_config() {
  if [ -f ~/.ssh/config ]; then
    cat ~/.ssh/config | grep "^Host " | awk '{print $2}'
  fi
}

_complete_hosts() {
  COMPREPLY=()
  words="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -W "$(_known_hosts; _ssh_config)"))

  return 0
}

complete -F _complete_hosts ssh


# Tmux
alias t='tmux'
alias ta='tmux at'
alias tls='tmux ls'

# Emacs
alias e='emacsclient --no-wait'
export EDITOR='emacs'

# Rails
alias be='bundle exec'
alias bec='bundle exec cucumber'
alias bes='bundle exec rspec'
alias ber='bundle exec rake'

# Git
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gl='git log'
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

# Tags
alias xctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

# ls
alias l='ls -lha'

# OSX specifics

# Compiling
export ARCHFLAGS="-arch x86_64"

# Prepend homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Rebuild
alias lsrebuild='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user'

