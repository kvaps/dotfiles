#!/bin/bash
W=`xdotool getactivewindow`
S1=`xprop -id ${W} |awk '/WM_CLASS/{print $4}'`
S2='"URxvt"'
S3='"XTerm"'

if [ $1 = "copy" ]; then
    if [ $S1 = $S2 ] || [ $S1 = $S3 ]; then
    xvkbd -xsendevent -text '\[Control_L]\[Shift_L]c'
    else
    xvkbd -xsendevent -text '\[Control_L]c'
    fi
fi

if [ $1 = "paste" ]; then
    if [ $S1 = $S2 ] || [ $S1 = $S3 ]; then
    xvkbd -xsendevent -text '\[Control_L]\[Shift_L]v'
    else
    xvkbd -xsendevent -text '\[Control_L]v'
    fi
fi
