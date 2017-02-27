#!/bin/bash
ACTION="$1"
WINDOW=`xdotool getactivewindow`
WM_CLASS=`xprop -id ${WINDOW} |awk '/WM_CLASS/{print $4}'`
URXVT='URxvt'
XTERM='XTerm'
KEEPASS='KeePass2'

if [ "$ACTION" = 'copy' ]; then
    if [ "$WM_CLASS" = "$URXVT" ] || [ "$WM_CLASS" = "$XTERM" ]; then
    xvkbd -xsendevent -text '\[Control_L]\[Shift_L]\[C]'
    else
    xvkbd -xsendevent -text '\[Control_L]c'
    fi
fi

if [ $ACTION = "paste" ]; then
    if [ "$WM_CLASS" = "$URXVT" ] || [ "$WM_CLASS" = "$XTERM" ]; then
    xvkbd -xsendevent -text '\[Control_L]\[Shift_L]\[V]'
    else
    xvkbd -xsendevent -text '\[Control_L]v'
    fi
fi
