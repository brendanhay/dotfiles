#!/usr/bin/env bash

function common {
        export DE=gnome
        xset +fp /usr/share/fonts/local/
        setxkbmap -variant nodeadkeys
        xrandr --mode 2880x1800
        xsetroot -cursor_name left_ptr
        source ~/.paths
}

function wm {
        xsetroot -solid "#000000"
        eval $(ssh-agent)
        pulseaudio --start &
        tracker-control --start &
        xscreensaver &
        xmobar &
        terminal &
        trayer --height 38 --edge top --align left --expand true --widthtype request --SetDockType true --SetPartialStrut true --transparent true --alpha 0 --tint 0x000000 &
        exec xmonad
}

common
wm
