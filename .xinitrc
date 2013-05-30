#!/usr/bin/env bash

if [ -f $HOME/.xresources ]; then
        xrdb -merge $HOME/.xresources
fi

if [ -f $HOME/.xmodmap ]; then
	xmodmap $HOME/.xmodmap
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
        for f in /etc/X11/xinit/xinitrc.d/*; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

. ~/.paths

exec session.sh
