#
# ~/.bash_profile
#

export EDITOR=vim
export PAGER=vimpager
export BROWSER="chromium"
export SBT_OPTS="-XX:MaxPermSize=1024m -Xmx1024m -XX:+CMSClassUnloadingEnabled"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.paths ]] && . ~/.paths

