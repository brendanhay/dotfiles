#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Switch USB Keyboard CapsLock -> Control..."
xmodmap ${DIR}/capsctrl.xmodmap

echo "Switch USB Keyboard Right Context -> Super..."
xmodmap ${DIR}/zowie-context-super.xmodmap

echo "Set displays to HDMI/left and Laptop/right..."
xrandr --output eDP-1 --auto --output HDMI-2 --auto --mode 2560x1440 --left-of eDP-1
