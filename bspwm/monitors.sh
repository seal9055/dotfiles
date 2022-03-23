#!/bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main &

if [[ $(xrandr -q | grep 'HDMI-1-0 connected') ]]; then
    polybar external &
fi
