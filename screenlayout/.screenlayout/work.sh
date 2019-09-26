#!/bin/sh
if ! xrandr | grep -q 1920x1080_60.00; then
  MODELINE="$(cvt 1920 1080 60 | tail -n1 | cut -d' ' -f3-)"
  xrandr --newmode 1920x1080_60.00 $MODELINE
fi
xrandr --addmode DP1 1920x1080_60.00
xrandr --output eDP1 --off --output DP1 --primary --mode 1920x1080_60.00 --pos 1920x0 --rotate normal --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off
