# Emacs
alias e='emacsclient --no-wait'

# Tmux
function sssh () {
    ssh -t "$1" 'tmux attach || tmux new'
}

alias t='tmux'
alias ta='tmux attach -t'
alias tls='tmux ls'

# Reload Library
alias reload='source ~/.bashrc && echo "bashrc reloaded"'

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
alias l='ls -GXlha'
alias ls='ls -GX'
alias l.='ls -GXdl .*'         # List hidden files
alias lf='ls -GXl | grep ^d'   # Only list directories
alias lsf='ls -GXal | grep ^d' # Only list directories, including hidden ones

# Tree
if [ ! -x "$(which tree)" ]; then
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
if [ $(uname) = "Linux" ]; then
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
alias gc='git commit -m'
alias gca='git commit -am'
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
