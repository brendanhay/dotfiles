function _cache {
	(($ + commands[$1])) || return 1
	local cache_dir="$XDG_CACHE_HOME/${SHELL##*/}"
	local cache="$cache_dir/$1"
	if [[ ! -f $cache || ! -s $cache ]]; then
		echo "Caching $1"
		mkdir -p $cache_dir
		"$@" >$cache
		chmod 600 $cache
	fi
	if [[ -o interactive ]]; then
		source $cache || rm -f $cache
	fi
}

function _source {
	for file in "$@"; do
		[ -r $file ] && source $file
	done
}

# Be more restrictive with permissions; no one has any business reading things
# that don't belong to them.
if ((EUID != 0)); then
	umask 027
else
	# Be even less permissive if root.
	umask 077
fi

# Home Manager environment variables
_source "/etc/profiles/per-user/bren/etc/profile.d/hm-session-vars.sh"

# Only source this once
if [[ -z "$__HM_ZSH_SESS_VARS_SOURCED" ]]; then
  export __HM_ZSH_SESS_VARS_SOURCED=1
fi

ZDOTDIR=$HOME/.config/zsh

