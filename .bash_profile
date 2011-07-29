# load rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  

parse_git_branch () {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git:\1)/'
}
parse_svn_branch() {
    parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn:"$1 "/" $2 ")"}'
}
parse_svn_url() {
    svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
    svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

# show git or svn path in prompt
export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \w \[\033[31m\]\$(parse_git_branch)\$(parse_svn_branch) \[\033[00m\]$\[\033[00m\] "

# completion for ssh
complete -W "$(cat /etc/hosts | awk '$1 != "#" {print $2}')" ssh

# completion for rails
source ~/.rails_bash

# completion for rake
#
# some code from on Jonathan Palardy's http://technotales.wordpress.com/2009/09/18/rake-completion-cache/
# and http://pastie.org/217324 found http://ragonrails.com/post/38905212/rake-bash-completion-ftw
# 
# For details and discussion
# http://turadg.aleahmad.net/2011/02/bash-completion-for-rake-tasks/
#
# INSTALL
#
# Place in your bash completions.d and/or source in your .bash_profile
# If on a Mac with Homebrew, try "brew install bash-completion"
# 
# USAGE
#
# Type 'rake' and hit tab twice to get completions.
# To clear the cache, run rake_cache_clear() in your shell.
function _rake_cache_path() {
  # If in a Rails app, put the cache in the cache dir
  # so version control ignores it
  if [ -e 'tmp/cache' ]; then
    prefix='tmp/cache/'
  fi
  echo "${prefix}.rake_t_cache"
}

function rake_cache_store() {
  rake -T > "$(_rake_cache_path)"
}

function rake_cache_clear() {
  rm -f .rake_t_cache
  rm -f tmp/cache/.rake_t_cache
}

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

function _rakecomplete() {
  # error if no Rakefile
  if [ ! -e Rakefile ]; then
    echo "missing Rakefile"
    return 1
  fi

  # build cache if missing
  if [ ! -e "$(_rake_cache_path)" ]; then
    rake_cache_store
  fi

  local tasks=`awk '{print $2}' "$(_rake_cache_path)"`
  COMPREPLY=($(compgen -W "${tasks}" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

complete -o default -o nospace -F _rakecomplete rake

# Rebuild
alias lsrebuild="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user"
alias ctags='/usr/local/bin/ctags'

export EDITOR='emacs'

# Git alias'
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
