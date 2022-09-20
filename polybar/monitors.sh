#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar internal &

if [[ $(xrandr -q | grep 'HDMI-2 connected') ]]; then
    polybar external &
fi
