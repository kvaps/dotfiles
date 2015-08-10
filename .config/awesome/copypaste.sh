#!/bin/bash
W=`xdotool getactivewindow`
S1=`xprop -id ${W} |awk '/WM_CLASS/{print $4}'`
S2='"URxvt"'
S3='"XTerm"'

if [ $1 = "copy" ]; then
    if [ $S1 = $S2 ] || [ $S1 = $S3 ]; then
    xdotool key --clearmodifiers ctrl+shift+c
    else
    xdotool key --clearmodifiers ctrl+c
    fi
fi

if [ $1 = "paste" ]; then
    if [ $S1 = $S2 ] || [ $S1 = $S3 ]; then
    xdotool key --clearmodifiers ctrl+shift+v
    else
    xdotool key --clearmodifiers ctrl+v
    fi
fi
